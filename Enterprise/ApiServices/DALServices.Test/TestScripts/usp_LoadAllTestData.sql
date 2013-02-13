USE [EnterpriseDbTest]
GO

-- Disable all constraints so we can load data
EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

-- Delete all data from tables
DELETE FROM [dbo].[Organization]
DELETE FROM [dbo].[User]
DELETE FROM [dbo].[UserAreaCoverage]
DELETE FROM [dbo].[UserNotification]
DELETE FROM [dbo].[UserContact]
DELETE FROM [dbo].[Location]
DELETE FROM [dbo].[Asset]
DELETE FROM [dbo].[Request]
DELETE FROM [dbo].[WorkOrder]
DELETE FROM [dbo].[WorkOrderItem]
DELETE FROM [dbo].[ProductCategory]
DELETE FROM [dbo].[Product]
DELETE FROM [generic].[Lookup]
DELETE FROM [generic].[LookupGroup]

-- Reseed the identity column starting values
DBCC CHECKIDENT('[dbo].[Organization]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[User]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[UserAreaCoverage]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[UserNotification]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[UserContact]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[Location]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[Asset]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[Request]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[WorkOrder]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[WorkOrderItem]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[ProductCategory]', RESEED, 0)
DBCC CHECKIDENT('[dbo].[Product]', RESEED, 0)
DBCC CHECKIDENT('[generic].[LookupGroup]', RESEED, 0)
DBCC CHECKIDENT('[generic].[Lookup]', RESEED, 0)

-- Insert the test data
INSERT INTO [dbo].[Organization]([Name] ,[Code] ,[TypeID] ,[StatusID])VALUES('Bank of the Outer Galactic Empire', 'BOGE01', 3, 1)
INSERT INTO [dbo].[Organization]([Name] ,[Code] ,[TypeID] ,[StatusID])VALUES('Oort Cloud Savings and Loan',       'OCSL01', 3, 1)
INSERT INTO [dbo].[Organization]([Name] ,[Code] ,[TypeID] ,[StatusID])VALUES('Ronaks Thrifty Mortgage Emporium',  'RTME01', 3, 1)

INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(1, 'John',    'Carter',    NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(1, 'Kantos',  'Kan',       NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(1, 'Mors',    'Kajak',     NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(2, 'Spiro',   'Agnew',     NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(2, 'Donald',  'Rumsfeld',  NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(2, 'Richard', 'Nixon',     NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(3, 'Philip',  'Fry',       NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(3, 'Hermes',  'Conrad',    NULL, 8, NULL)
INSERT INTO [dbo].[User]([OrganizationID] ,[FirstName] ,[LastName] ,[Title] ,[StatusID] ,[AuthenticationID])VALUES(3, 'Bender',  'Rodriguez', NULL, 8, NULL)

INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(1, '75656', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(2, '76021', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(3, '76022', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(4, '75287', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(5, '75227', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(6, '75236', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(7, '75212', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(8, '75220', 0)
INSERT INTO [dbo].[UserAreaCoverage]([UserID] ,[ZipCode] ,[ServiceID])VALUES(9, '75217', 0)

INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(1, DATEADD(day, -2,  GETDATE()), DATEADD(day, -1, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(1, DATEADD(day, -1,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(2, DATEADD(day, -3,  GETDATE()), DATEADD(day, -2, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(2, DATEADD(day, -2,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(3, DATEADD(day, -4,  GETDATE()), DATEADD(day, -3, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(3, DATEADD(day, -3,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(4, DATEADD(day, -5,  GETDATE()), DATEADD(day, -4, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(4, DATEADD(day, -4,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(5, DATEADD(day, -6,  GETDATE()), DATEADD(day, -5, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(5, DATEADD(day, -5,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(6, DATEADD(day, -7,  GETDATE()), DATEADD(day, -6, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(6, DATEADD(day, -6,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(7, DATEADD(day, -8,  GETDATE()), DATEADD(day, -7, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(7, DATEADD(day, -7,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(8, DATEADD(day, -9,  GETDATE()), DATEADD(day, -8, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(8, DATEADD(day, -8,  GETDATE()), NULL)
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(9, DATEADD(day, -10, GETDATE()), DATEADD(day, -9, GETDATE()))
INSERT INTO [dbo].[UserNotification]([UserID] ,[DatePosted] ,[DateRead])VALUES(9, DATEADD(day, -9,  GETDATE()), NULL)

INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(1, '8172681301',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(1, '8172681302',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(1, 'JCarter@barsoom.com', 32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(2, '8172681303',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(2, '8172681304',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(2, 'KKan@barsoom.com',    32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(3, '8172681305',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(3, '8172681306',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(3, 'MKajak@barsoom.com',  32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(4, '8172681307',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(4, '8172681308',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(4, 'SAgnew@imnac.com',    32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(5, '8172681309',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(5, '8172681310',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(5, 'DRumsfeld@imnac.com', 32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(6, '8172681311',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(6, '8172681312',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(6, 'RNixon@imnac.com',    32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(7, '8172681313',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(7, '8172681314',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(7, 'PFry@rtme.com',       32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(8, '8172681315',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(8, '8172681316',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(8, 'HConrad@rtme.com',    32, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(9, '8172681317',          30, 1)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(9, '8172681318',          31, 0)
INSERT INTO [dbo].[UserContact]([UserID] ,[Value] ,[TypeID] ,[IsPrimary])VALUES(9, 'BRodriguez@rtme.com', 32, 0)

INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(1, 'Bank of the Outer Galactic Empire', 'BOGE01', 11)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(1, 'Greater Helium Branch',             'BOGE02', 12)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(1, 'Wastelands Branch',                 'BOGE03', 12)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(2, 'Oort Cloud Savings and Loan',       'OCSL01', 11)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(2, 'Lower Hades Mercury Branch',        'OCSL02', 12)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(2, 'Rings of Saturn Branch',            'OCSL03', 12)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(3, 'Ronaks Thrifty Mortgage Emporium',  'RTME01', 11)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(3, 'Arlen South Branch',                'RTME02', 12)
INSERT INTO [dbo].[Location]([OrganizationID] ,[Name] ,[Code] ,[TypeID])VALUES(3, 'North Arlen Branch',                'RTME03', 12)

INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(1, 30, '000001', '123456', 18, 'Amy Wong',          '2143453001', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(1, 30, '000002', '234567', 18, 'Hubert Farnsworth', '2143453002', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(1, 30, '000003', '345678', 18, 'Joe Melman',        '2143453003', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(2, 30, '000004', '456789', 18, 'Barbados Slim',     '2143453004', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(2, 30, '000005', '567890', 18, 'Jettro Heller',     '2143453005', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(2, 30, '000006', '678901', 18, 'Pepper Potts',      '2143453006', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(3, 30, '000007', '789012', 18, 'Leo Wong',          '2143453007', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(3, 30, '000008', '890123', 18, 'Inez Wong',         '2143453008', NULL, NULL, NULL)
INSERT INTO [dbo].[Asset]([OrganizationID] ,[TypeID] ,[AssetNumber] ,[LoanNumber] ,[LoanTypeID] ,[MortgagorName] ,[MortgagorPhone] ,[HudCaseNumber] ,[ConveyanceDate] ,[FirstTimeVacantDate])VALUES(3, 30, '000009', '901234', 18, 'Zapp Brannigan',    '2143453009', NULL, NULL, NULL)

INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -2,  GETDATE()), 'BOGE-Req01')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -3,  GETDATE()), 'BOGE-Req02')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -4,  GETDATE()), 'BOGE-Req03')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -5,  GETDATE()), 'OCSL-Req01')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -6,  GETDATE()), 'OCSL-Req02')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -7,  GETDATE()), 'OCSL-Req03')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -8,  GETDATE()), 'RTME-Req01')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -9,  GETDATE()), 'RTME-Req02')
INSERT INTO [dbo].[Request]([DateInserted] ,[CustomerRequestID])VALUES(DATEADD(DAY, -10, GETDATE()), 'RTME-Req03')

INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(1, 1, DATEADD(DAY, -2,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(2, 2, DATEADD(DAY, -3,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(3, 3, DATEADD(DAY, -4,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(4, 4, DATEADD(DAY, -5,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(5, 5, DATEADD(DAY, -6,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(6, 6, DATEADD(DAY, -7,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(7, 7, DATEADD(DAY, -8,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(8, 8, DATEADD(DAY, -9,  GETDATE()))
INSERT INTO [dbo].[WorkOrder]([RequestID] ,[AssetID] ,[DateInserted])VALUES(9, 9, DATEADD(DAY, -10, GETDATE()))

INSERT INTO [dbo].[ProductCategory]([Name] ,[Code])VALUES('Maintenance', 'MANT')
INSERT INTO [dbo].[ProductCategory]([Name] ,[Code])VALUES('Inspection',  'INSP')

INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(1, 'Flush Galactic Dust Filtration System',             'MANT01', '123',   150.00,   15.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(1, 'Reseal Outer Shell Seams with Dark Matter Sealant', 'MANT02', '124',  3700.00,  370.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(1, 'Replace Power Core Pellets',                        'MANT03', '125', 15000.00,   35.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(1, 'Resurface Landing Zone',                            'MANT04', '126',   250.00,   25.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(1, 'Change Life Support Core Modules',                  'MANT05', '127',   735.00,  700.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(2, 'Inspect Airlock',                                   'INSP01', '128',    85.00,    5.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(2, 'Check Power Core for Radiation Leakage',            'INSP02', '129',  1500.00, 1200.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(2, 'Inspect Life Support Air Filters',                  'INSP03', '130',    25.00,   15.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(2, 'Inspect BabelFish Tank Filtration System',          'INSP04', '131',   400.00,   40.00)
INSERT INTO [dbo].[Product]([ProductCategoryID] ,[Caption] ,[Code] ,[SKU] ,[Rate] ,[Cost])VALUES(2, 'Inspect Outer Shell for Micro-Black Hole Openings', 'INSP05', '132',   350.00,  300.00)

INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(1,  1, 1,   150.00, DATEADD(DAY,  -2, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(1,  2, 1,  3700.00, DATEADD(DAY,  -2, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(1,  4, 1,   250.00, DATEADD(DAY,  -2, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(2,  9, 1,   400.00, DATEADD(DAY,  -3, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(2, 10, 1,   350.00, DATEADD(DAY,  -3, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(2,  1, 1,   150.00, DATEADD(DAY,  -3, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(3,  5, 1,   735.00, DATEADD(DAY,  -4, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(3,  6, 1,    85.00, DATEADD(DAY,  -4, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(3,  8, 1,    25.00, DATEADD(DAY,  -4, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(4,  2, 1,  3700.00, DATEADD(DAY,  -5, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(4,  9, 1,   400.00, DATEADD(DAY,  -5, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(4, 10, 1,   350.00, DATEADD(DAY,  -5, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(5,  1, 1,   150.00, DATEADD(DAY,  -6, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(5,  2, 1,  3700.00, DATEADD(DAY,  -6, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(5,  3, 1, 15000.00, DATEADD(DAY,  -6, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(6,  4, 1,   250.00, DATEADD(DAY,  -7, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(6,  5, 1,   735.00, DATEADD(DAY,  -7, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(6,  6, 1,    85.00, DATEADD(DAY,  -7, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(7,  8, 1,    25.00, DATEADD(DAY,  -8, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(7,  9, 1,   400.00, DATEADD(DAY,  -8, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(7, 10, 1,   350.00, DATEADD(DAY,  -8, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(8,  6, 1,    85.00, DATEADD(DAY,  -9, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(8,  7, 1,  1500.00, DATEADD(DAY,  -9, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(8,  8, 1,    25.00, DATEADD(DAY,  -9, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(9,  3, 1, 15000.00, DATEADD(DAY, -10, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(9,  4, 1,   250.00, DATEADD(DAY, -10, GETDATE()))
INSERT INTO [dbo].[WorkOrderItem]([WorkOrderID] ,[ProductID] ,[Quantity] ,[Rate] ,[DateInserted])VALUES(9,  9, 1,   400.00, DATEADD(DAY, -10, GETDATE()))

INSERT INTO [generic].[LookupGroup]([Name])VALUES ('OrganizationStatus')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('OrganizationType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('UserStatus')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('LocationType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('LocationAddressType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('LoanType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('MortgagorType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('AssetAddressType')
INSERT INTO [generic].[LookupGroup]([Name])VALUES ('UserContactType')

INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(1, 'Active',       NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(1, 'Inactive',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(2, 'Customer',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(2, 'Contractor',   NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(2, 'Employee',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(2, 'Auditor',      NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(2, 'Investor',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(3, 'Active',       NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(3, 'Inactive',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(4, 'Department',   NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(5, 'Billing',      NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(5, 'Mailing',      NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6, 'FHA',          172)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6, 'VA',           173)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6, 'CONVENTIONAL', 174)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6, 'UNINSURED',    175)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6, 'UNKNOWN',      176)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6, 'OTHER',        297)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6, 'PRIV',         298)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6, 'REO',          403)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6, 'FANNIE MAE',   416)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6, 'FREDDIE MAC',  417)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6, 'REVERSE',      456)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(6, 'USDA',         717)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(7, 'Mortgagor',	NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(7, 'Co-Mortgagor', NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(8, 'Physical',     NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(8, 'Mailing',      NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(8, 'Other',        NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(9, 'Phone',        NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(9, 'Fax',          NULL)
INSERT INTO [generic].[Lookup]([LookupGroupID] ,[VALUE] ,[OldID]) VALUES(9, 'EMail',        NULL)


-- Enable all constraints
EXEC sp_msforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all'
