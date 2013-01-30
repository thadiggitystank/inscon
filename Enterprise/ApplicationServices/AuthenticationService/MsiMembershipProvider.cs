﻿using System;
using System.Configuration.Provider;
using System.Security.Cryptography;
using System.Text;
using System.Web.Security;

namespace AuthenticationService
{
    /// <summary>
    /// Derivation of the SqlMembershipProvider customized to meet MSI's audit needs
    /// Enhancements:
    ///     * Auto unlock user after 15 minutes
    ///     * Expire password after 60 days
    ///     * More explanation when we fail to validate a user
    /// </summary>
    public class MsiMembershipProvider : SqlMembershipProvider
    {
        private IMembershipHelper _helper;

        public MsiMembershipProvider()
        {
            _helper = new MembershipHelper(AutoUnlockTimeout);
        }

        public MsiMembershipProvider(IMembershipHelper helper) 
        {
            _helper = helper;
        }

        #region Property Configuration Overrides
        /// <summary>
        /// Gets a value indicating whether the SQL Server membership provider is configured to allow users to retrieve their passwords.
        /// </summary>
        /// <returns>true if the membership provider supports password retrieval; otherwise, false. The default is false.</returns>
        public override bool EnablePasswordRetrieval
        {
            get
            {
                return false;
            }
        }

        /// <summary>
        /// Gets a value indicating whether the SQL Server membership provider is configured to allow users to reset their passwords.
        /// </summary>
        /// <returns>true if the membership provider supports password reset; otherwise, false. The default is true.</returns>
        public override bool EnablePasswordReset
        {
            get
            {
                return true;
            }
        }

        /// <summary>
        /// Gets a value indicating whether the SQL Server membership provider is configured to require the user to answer a password question for password reset and retrieval.
        /// </summary>
        /// <returns>true if a password answer is required for password reset and retrieval; otherwise, false. The default is true.</returns>
        public override bool RequiresQuestionAndAnswer
        {
            get
            {
                return true;
            }
        }

        /// <summary>
        /// Gets a value indicating whether the SQL Server membership provider is configured to require a unique e-mail address for each user name.
        /// </summary>
        /// <returns>true if the membership provider requires a unique e-mail address; otherwise, false. The default is false.</returns>
        public override bool RequiresUniqueEmail
        {
            get
            {
                return false;
            }
        }

        /// <summary>
        /// Gets the number of invalid password or password-answer attempts allowed before the membership user is locked out.
        /// </summary>
        /// <returns>The number of invalid password or password-answer attempts allowed before the membership user is locked out.</returns>
        public override int MaxInvalidPasswordAttempts
        {
            get
            {
                return 3;
            }
        }

        /// <summary>
        /// Gets the time window between which consecutive failed attempts to provide a valid password or password answers are tracked.
        /// </summary>
        /// <returns>The time window, in minutes, during which consecutive failed attempts to provide a valid password or password answers are tracked. The default is 10 minutes. If the interval between the current failed attempt and the last failed attempt is greater than the <see cref="P:System.Web.Security.SqlMembershipProvider.PasswordAttemptWindow" /> property setting, each failed attempt is treated as if it were the first failed attempt.</returns>
        public override int PasswordAttemptWindow
        {
            get
            {
                return 5;
            }
        }

        /// <summary>
        /// Gets the minimum number of special characters that must be present in a valid password.
        /// </summary>
        /// <returns>The minimum number of special characters that must be present in a valid password.</returns>
        public override int MinRequiredNonAlphanumericCharacters
        {
            get
            {
                return 1;
            }
        }

        /// <summary>
        /// Gets a value indicating the format for storing passwords in the SQL Server membership database.
        /// </summary>
        /// <returns>One of the <see cref="T:System.Web.Security.MembershipPasswordFormat" /> values, indicating the format for storing passwords in the SQL Server database.</returns>
        public override MembershipPasswordFormat PasswordFormat
        {
            get
            {
                return MembershipPasswordFormat.Hashed;
            }
        }

        /// <summary>
        /// Gets the minimum length required for a password.
        /// </summary>
        /// <returns>The minimum length required for a password. </returns>
        public override int MinRequiredPasswordLength
        {
            get
            {
                return 7;
            }
        }

        #endregion

        #region Custom Properties
        /// <summary>
        /// Gets the time span before the user's account is automatically unlocked 
        /// </summary>
        /// <value>
        /// The auto unlock timeout.
        /// </value>
        public TimeSpan AutoUnlockTimeout
        {
            get { return new TimeSpan(0, 0, 15, 0); }
        }

        /// <summary>
        /// Gets the time span before the user's password should expire
        /// </summary>
        /// <value>
        /// The password expiry.
        /// </value>
        public TimeSpan PasswordExpiry
        {
            get { return new TimeSpan(60, 0, 0, 0); }
        }
        #endregion

        #region Public Method Overrides
        /// <summary>
        /// Modifies a user's password. Override will log the password change.
        /// </summary>
        /// <param name="username">The user to update the password for.</param>
        /// <param name="oldPassword">The current password for the specified user.</param>
        /// <param name="newPassword">The new password for the specified user.</param>
        /// <returns>
        /// true if the password was updated successfully. false if the supplied old password is invalid, the user is locked out, or the user does not exist in the database.
        /// </returns>
        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            //return immediately if old password is equal to new password
            if (oldPassword == newPassword) { return false; }

            var user = Membership.GetUser(username);

            if (_helper.EnforceChangePasswordPreconditions(user, newPassword))
            {
                return base.ChangePassword(username, oldPassword, newPassword);
            }

            return false;
        }

        

        /// <summary>
        /// Verifies that the specified user name and password exist in the SQL Server membership database. This override will also attempt to auto unlock the user if appropriate.
        /// </summary>
        /// <param name="username">The name of the user to validate.</param>
        /// <param name="password">The password for the specified user.</param>
        /// <returns>
        /// true if the specified username and password are valid; otherwise, false. A value of false is also returned if the user does not exist in the database.
        /// </returns>
        /// <exception cref="System.Web.Security.MembershipPasswordException">thrown if the user's password is expired</exception>
        public override bool ValidateUser(string username, string password)
        {
            bool retVal = false;

            //get the user membership record so we can check preconditions
            var user = Membership.GetUser(username);

            //guard against potential issues
            _helper.EnforceValidateUserPreconditions(user);

            //attempt to validate the user
            var validationSuccessful = base.ValidateUser(username, password);

            //return if first login was successful
            if (validationSuccessful)
            {
                retVal = true;
            }
            else
            {
                //unlock the user if appropriate
                var unlockSuccessful = _helper.TryAutoUnlockUser(user);

                //if unlock was successful, attempt to validate the user again
                if (unlockSuccessful)
                {
                    retVal = base.ValidateUser(username, password);
                }

            }

            return retVal;
        }


        /// <summary>
        /// Resets a user's password to a new, automatically generated password. Override handles AutoUnlock functionality.
        /// </summary>
        /// <param name="username">The user to reset the password for.</param>
        /// <param name="passwordAnswer">The password answer for the specified user.</param>
        /// <returns>
        /// The new password for the specified user.
        /// </returns>
        public override string ResetPassword(string username, string passwordAnswer)
        {
            string newPassword;
            //handle membership exception as it could be due to a lockout
            try
            {
                newPassword = base.ResetPassword(username, passwordAnswer);
            }
            catch (MembershipPasswordException)
            {
                var user = Membership.GetUser(username);
                var unlockSuccessful = _helper.TryAutoUnlockUser(user);

                //if unlock was successful, re-attempt the password reset
                if (unlockSuccessful)
                {
                    newPassword = base.ResetPassword(username, passwordAnswer);
                }
                else
                {
                    //if we still cannot reset the password, bubble up the exception.
                    throw;
                }
            }

            return newPassword;
        }
        #endregion

        #region Public Methods
        public bool IsPasswordExpired(string userName)
        {
            bool passwordExpired = false;
            var user = Membership.GetUser(userName);
            if (user != null)
            {
                passwordExpired = DateTime.UtcNow.Subtract(user.LastPasswordChangedDate.ToUniversalTime()) > PasswordExpiry;
            }

            return passwordExpired;
        }
        #endregion

       
    }
}