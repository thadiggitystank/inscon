﻿using System;
using System.Text;
using System.Collections.Generic;
using Enterprise.DAL.Core.Model;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Enterprise.ApiServices.DALServices.Test.Controllers
{
    /// <summary>
    /// Summary description for AddressUseControllerTest
    /// </summary>
    [TestClass]
    public class AddressUseControllerTest
    {
        public AddressUseControllerTest()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        // Use TestInitialize to run code before running each test 
        [TestInitialize()]
        public void MyTestInitialize()
        {
            DataHelper.LoadData("usp_LoadAllTestData.sql");
        }

        // Use TestCleanup to run code after each test has run
        // [TestCleanup()]
        // public void MyTestCleanup() { }
        //
        #endregion

        [TestMethod]
        public void GetAllAddressUseRecords()
        {
            Assert.Inconclusive();
        }

        [TestMethod]
        public void GetAddressUseByIdPass()
        {
            Assert.Inconclusive();
        }

        [TestMethod]
        public void GetAddressUseByIdFail()
        {
            Assert.Inconclusive();
        }

        [TestMethod]
        public void GetAddressUseByAddressIdPass()
        {
            Assert.Inconclusive();
        }

        [TestMethod]
        public void GetAddressUseByAddressIdFail()
        {
            Assert.Inconclusive();
        }

        [TestMethod]
        public void GetAddressUseByAddressIdAndTypeIdPass()
        {
            Assert.Inconclusive();
        }

        [TestMethod]
        public void GetAddressUseByAddressIdAndTypeIdFail()
        {
            Assert.Inconclusive();
        }

        [TestMethod]
        public void DeleteAddressUsePass()
        {
            Assert.Inconclusive();
        }

        [TestMethod]
        public void DeleteAddressUseFail()
        {
            Assert.Inconclusive();
        }

        [TestMethod]
        public void InsertAddressUsePass()
        {
            Assert.Inconclusive();
        }

        [TestMethod]
        public void InsertAddressUseFail()
        {
            Assert.Inconclusive();
        }

        [TestMethod]
        public void UpdateAddressUsePass()
        {
            Assert.Inconclusive();
        }

        [TestMethod]
        public void UpdateAddressUseFail()
        {
            Assert.Inconclusive();
        }
    }
}
