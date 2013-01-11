﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using Dapper;
using DapperRunner.Model;
using LinqToExcel;

namespace DapperRunner
{
    public static class TestSuite
    {
        /// <summary>
        /// Encapsulates the functionality for the read test
        /// </summary>
        /// <typeparam name="T">The DTO representation of the table</typeparam>
        /// <param name="connectionStringName">ConnectionString name contained in app.config</param>
        /// <returns>List of <typeparam name="T"> returned from database</typeparam></returns>
        public static IEnumerable<T> ExecuteReadTest<T>(string connectionStringName) where T : new()
        {
            using (var connection = new SqlConnection(ConfigurationHelper.GetConnectionString(connectionStringName)))
            {
                connection.Open();

                var p = new DynamicParameters();
                p.Add("SettingId", 1);
                return connection.QueryProc<T>(StoredProcs.GetCommonSetting, p);
            }
        }

        /// <summary>
        /// Encapsulates the functionality for the write test
        /// </summary>
        /// <typeparam name="T">The DTO representation of the table to insert to</typeparam>
        /// <param name="connectionStringName">ConnectionString name contained in app.config</param>
        /// <param name="filePath">Appsetting key for the filepath of the CSV/Excel sheet</param>
        /// <returns>Bool on whether the inserts failed</returns>
        public static bool ExecuteWriteTest<T>(string connectionStringName, string filePath) where T : new()
        {
            bool retVal = true;

            var csv = new ExcelQueryFactory(ConfigurationHelper.GetAppSetting(filePath));

            var people = csv.Worksheet<People>("5010264").Select(p => p).ToList();

            try
            {
                using (var connection = new SqlConnection(ConfigurationHelper.GetConnectionString(connectionStringName)))
                {
                    int count = 1;
                    people.ForEach(p =>
                        {
                            var args = GetParamListReflection(p);
                            //var args = GetParamListStatic(p);
                            
                            connection.CommandProc(StoredProcs.InsertPerson, args);
                            Console.WriteLine(count++);
                        });

                }
            }
            catch (Exception e)
            {
                retVal = false;
            }

            return retVal;
        }

        //no frills way, took 4.8 minutes for 10000 records.. HUH!?
        private static DynamicParameters GetParamListStatic(People people)
        {
            var args = new DynamicParameters();
            args.Add("prm_Number", people.Number);
            args.Add("prm_Gender", people.Gender);
            args.Add("prm_GivenName", people.GivenName);
            args.Add("prm_MiddleInitial", people.MiddleInitial);
            args.Add("prm_Surname", people.Surname);
            args.Add("prm_StreetAddress", people.StreetAddress);
            args.Add("prm_City", people.City);
            args.Add("prm_State", people.State);
            args.Add("prm_ZipCode", people.ZipCode);
            args.Add("prm_Country", people.Country);
            args.Add("prm_EmailAddress", people.EmailAddress);
            args.Add("prm_TelephoneNumber", people.TelephoneNumber);
            args.Add("prm_MothersMaiden", people.MothersMaiden);
            args.Add("prm_Birthday", people.Birthday);
            args.Add("prm_CCType", people.CCType);
            args.Add("prm_CCNumber", people.CCNumber);
            args.Add("prm_CVV2", people.CVV2);
            args.Add("prm_CCExpires", people.CCExpires);
            args.Add("prm_NationalID", people.NationalID);
            return args;
        }

        //clever way, took 4.8 minutes for 10000 records
        private static DynamicParameters GetParamListReflection<T>(T person)
        {
            var args = new DynamicParameters();
            foreach (var prop in typeof(T).GetProperties())
            {
                args.Add("prm_" + prop.Name, prop.GetValue(person, null));
            }
            return args;
        }

    }
}