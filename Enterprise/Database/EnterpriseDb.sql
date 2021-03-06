USE [master]
GO
/****** Object:  Database [EnterpriseDb]    Script Date: 01/14/2013 18:52:44 ******/
CREATE DATABASE [EnterpriseDb] ON  PRIMARY 
( NAME = N'EnterpriseDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\EnterpriseDb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EnterpriseDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\EnterpriseDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EnterpriseDb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnterpriseDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnterpriseDb] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [EnterpriseDb] SET ANSI_NULLS OFF
GO
ALTER DATABASE [EnterpriseDb] SET ANSI_PADDING OFF
GO
ALTER DATABASE [EnterpriseDb] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [EnterpriseDb] SET ARITHABORT OFF
GO
ALTER DATABASE [EnterpriseDb] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [EnterpriseDb] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [EnterpriseDb] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [EnterpriseDb] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [EnterpriseDb] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [EnterpriseDb] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [EnterpriseDb] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [EnterpriseDb] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [EnterpriseDb] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [EnterpriseDb] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [EnterpriseDb] SET  DISABLE_BROKER
GO
ALTER DATABASE [EnterpriseDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [EnterpriseDb] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [EnterpriseDb] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [EnterpriseDb] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [EnterpriseDb] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [EnterpriseDb] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [EnterpriseDb] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [EnterpriseDb] SET  READ_WRITE
GO
ALTER DATABASE [EnterpriseDb] SET RECOVERY FULL
GO
ALTER DATABASE [EnterpriseDb] SET  MULTI_USER
GO
ALTER DATABASE [EnterpriseDb] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [EnterpriseDb] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'EnterpriseDb', N'ON'
GO
USE [EnterpriseDb]
GO
/****** Object:  Schema [request]    Script Date: 01/14/2013 18:52:44 ******/
CREATE SCHEMA [request] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [inventory]    Script Date: 01/14/2013 18:52:44 ******/
CREATE SCHEMA [inventory] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [generic]    Script Date: 01/14/2013 18:52:44 ******/
CREATE SCHEMA [generic] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [crud]    Script Date: 01/14/2013 18:52:44 ******/
CREATE SCHEMA [crud] AUTHORIZATION [dbo]
GO
/****** Object:  StoredProcedure [dbo].[sp_CoreProcs]    Script Date: 01/14/2013 18:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CoreProcs]
AS
  -- STORED PROCEDURE CREATES C# code for 'BusinessSystem.Core.Types'
  BEGIN
      SELECT '// ' + sproc.name                                                                                         AS 'name'
             , 'public const String ' + sproc.name + ' = @"[' + sch.name + '].[' + sproc.name + ']";' AS 'desc'
      INTO   #MyTempTable
      FROM   sys.procedures sproc
             INNER JOIN sys.schemas sch
               ON sch.schema_id = sproc.schema_id
      WHERE  sch.name = 'crud'
      UNION ALL
      SELECT '// ' + tbl.[name]
             , '// ' + tbl.[name]
      FROM   sys.tables tbl
      WHERE  LEFT(tbl.[name], 3) != 'sys'
      ORDER  BY [name]

      SELECT [desc]
      FROM   #MyTempTable
      ORDER BY [name]

      DROP TABLE [#MyTempTable]
  END
GO
/****** Object:  Table [generic].[AddressUse]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [generic].[AddressUse](
	[AddressUserID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_AddressUse] PRIMARY KEY CLUSTERED 
(
	[AddressUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Unique_LocationTableUse] ON [generic].[AddressUse] 
(
	[AddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ParentID' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'AddressUse', @level2type=N'COLUMN',@level2name=N'AddressID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Value - Mailing, Billing, Physical, Personal' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'AddressUse', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
/****** Object:  Table [generic].[Comment]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [generic].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NOT NULL,
	[EntityID] [smallint] NOT NULL,
	[UserID] [int] NULL,
	[TypeID] [int] NOT NULL,
	[Comment] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'CommentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID of user inserting record' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Value - Type (User, Manager, Executive, Auditor)' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Comment' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Comment', @level2type=N'COLUMN',@level2name=N'Comment'
GO
/****** Object:  Table [generic].[Address]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [generic].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NOT NULL,
	[EntityID] [smallint] NOT NULL,
	[Street] [varchar](60) NOT NULL,
	[Suite] [varchar](50) NULL,
	[City] [varchar](38) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[Zip] [varchar](10) NOT NULL,
 CONSTRAINT [PK_LocationAddress] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'AddressID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location Street' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'Street'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Suite' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'Suite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location City' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location State' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location Zipcode' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'Zip'
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Entity](
	[EntityID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [generic].[Event]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [generic].[Event](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NOT NULL,
	[EntityID] [smallint] NOT NULL,
	[TypeID] [int] NOT NULL,
	[UserID] [int] NULL,
	[EventDate] [datetime] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'EventID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Value - Type (Update, Insert, Delete, Assign)' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID of user inserting record' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'UserID'
GO
/****** Object:  Table [generic].[File]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [generic].[File](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NOT NULL,
	[EntityID] [smallint] NOT NULL,
	[ParentFolder] [varchar](100) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Size] [decimal](18, 2) NULL,
	[TypeID] [int] NULL,
	[Caption] [varchar](50) NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'File', @level2type=N'COLUMN',@level2name=N'FileID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent Folder' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'File', @level2type=N'COLUMN',@level2name=N'ParentFolder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'File Name' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'File', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Size (KB)' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'File', @level2type=N'COLUMN',@level2name=N'Size'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Value - Size: (.doc, .jpg, .pdf)' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'File', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name when sending to others' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'File', @level2type=N'COLUMN',@level2name=N'Caption'
GO
/****** Object:  Table [generic].[LookupGroup]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [generic].[LookupGroup](
	[LookupGroupID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](75) NOT NULL,
 CONSTRAINT [PK_LookupGroup] PRIMARY KEY CLUSTERED 
(
	[LookupGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'LookupGroup', @level2type=N'COLUMN',@level2name=N'LookupGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Group Name' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'LookupGroup', @level2type=N'COLUMN',@level2name=N'Name'
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](75) NOT NULL,
	[Code] [varchar](8) NULL,
	[TypeID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'OrganizationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Organization Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Organization Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Value - Customer, Contractor, Employer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup value - Enabled, Disabled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization', @level2type=N'COLUMN',@level2name=N'StatusID'
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](8) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory', @level2type=N'COLUMN',@level2name=N'ProductCategoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Categpry Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Categpry Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory', @level2type=N'COLUMN',@level2name=N'Code'
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[Caption] [varchar](50) NOT NULL,
	[Code] [varchar](8) NULL,
	[SKU] [varchar](20) NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'ProductID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'ProductCategoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Caption' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Caption'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product SKU' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'SKU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Rate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Rate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Cost' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Cost'
GO
/****** Object:  StoredProcedure [crud].[Organization_Update]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Organization_Update]
  @OrganizationID INT,
  @Name           VARCHAR(75),
  @Code           VARCHAR(8),
  @TypeID         INT,
  @StatusID       INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[Organization]
    SET    [Name] = @Name,
           [Code] = @Code,
           [TypeID] = @TypeID,
           [StatusID] = @StatusID
    WHERE  [OrganizationID] = @OrganizationID
GO
/****** Object:  StoredProcedure [crud].[Organization_SelectByTypeId]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Organization_SelectByTypeId]
  @TypeID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [OrganizationID],
           [Name],
           [Code],
           [TypeID],
           [StatusID]
    FROM   [dbo].[Organization]
    WHERE  [TypeID] = @TypeID
GO
/****** Object:  StoredProcedure [crud].[Organization_SelectById]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Organization_SelectById]
  @OrganizationID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [OrganizationID],
           [Name],
           [Code],
           [TypeID],
           [StatusID]
    FROM   [dbo].[Organization]
    WHERE  [OrganizationID] = @OrganizationID
GO
/****** Object:  StoredProcedure [crud].[Organization_SelectAll]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Organization_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [OrganizationID],
           [Name],
           [Code],
           [TypeID],
           [StatusID]
    FROM   [dbo].[Organization]
GO
/****** Object:  StoredProcedure [crud].[Organization_Insert]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Organization_Insert]
  @Name     VARCHAR(75),
  @Code     VARCHAR(8),
  @TypeID   INT,
  @StatusID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[Organization]
    (
      [Name],
      [Code],
      [TypeID],
      [StatusID]
    )
    VALUES
    (
      @Name,
      @Code,
      @TypeID,
      @StatusID
    )
    -- Begin Return Select <- do not remove
    SELECT [OrganizationID],
           [Name],
           [Code],
           [TypeID],
           [StatusID]
    FROM   [dbo].[Organization]
    WHERE  [OrganizationID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[Organization_Delete]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Organization_Delete]
  @OrganizationID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[Organization]
    WHERE  [OrganizationID] = @OrganizationID
GO
/****** Object:  Table [dbo].[Location]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[Name] [varchar](75) NOT NULL,
	[Code] [varchar](8) NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'LocationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ParentID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'OrganizationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Value - Branch, Department, Staff Grouping' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
/****** Object:  Table [generic].[Lookup]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [generic].[Lookup](
	[LookupID] [int] IDENTITY(1,1) NOT NULL,
	[LookupGroupID] [smallint] NOT NULL,
	[Value] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Lookup] PRIMARY KEY CLUSTERED 
(
	[LookupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Lookup', @level2type=N'COLUMN',@level2name=N'LookupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent RecordID' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Lookup', @level2type=N'COLUMN',@level2name=N'LookupGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Caption' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'Lookup', @level2type=N'COLUMN',@level2name=N'Value'
GO
/****** Object:  StoredProcedure [crud].[LookupGroup_Update]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[LookupGroup_Update]
  @LookupGroupID SMALLINT,
  @Name          VARCHAR(75)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [generic].[LookupGroup]
    SET    [Name] = @Name
    WHERE  [LookupGroupID] = @LookupGroupID
GO
/****** Object:  StoredProcedure [crud].[LookupGroup_SelectById]    Script Date: 01/14/2013 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[LookupGroup_SelectById]
  @LookupGroupID SMALLINT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [LookupGroupID],
           [Name]
    FROM   [generic].[LookupGroup]
    WHERE  [LookupGroupID] = @LookupGroupID
GO
/****** Object:  StoredProcedure [crud].[LookupGroup_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[LookupGroup_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [LookupGroupID],
           [Name]
    FROM   [generic].[LookupGroup]
GO
/****** Object:  StoredProcedure [crud].[LookupGroup_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[LookupGroup_Insert]
  @Name VARCHAR(75)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [generic].[LookupGroup]
    (
      [Name]
    )
    VALUES
    (
      @Name
    )
    -- Begin Return Select <- do not remove
    SELECT [LookupGroupID],
           [Name]
    FROM   [generic].[LookupGroup]
    WHERE  [LookupGroupID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[LookupGroup_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[LookupGroup_Delete]
  @LookupGroupID SMALLINT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [generic].[LookupGroup]
    WHERE  [LookupGroupID] = @LookupGroupID
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loan](
	[LoanID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[TypeID] [int] NULL,
	[LoanNumber] [varchar](30) NOT NULL,
	[HudCaseNumber] [varchar](20) NULL,
 CONSTRAINT [PK_Loan] PRIMARY KEY CLUSTERED 
(
	[LoanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'LoanID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ParentID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'OrganizationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Value - Loan Type (FHA, VA, CONV)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loan Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'LoanNumber'
GO
/****** Object:  StoredProcedure [crud].[File_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[File_Update]
  @FileID       INT,
  @ParentID     INT,
  @EntityID     SMALLINT,
  @ParentFolder VARCHAR(100),
  @Name         VARCHAR(50),
  @Size         DECIMAL(18, 2),
  @TypeID       INT,
  @Caption      VARCHAR(50)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [generic].[File]
    SET    [ParentID] = @ParentID,
           [EntityID] = @EntityID,
           [ParentFolder] = @ParentFolder,
           [Name] = @Name,
           [Size] = @Size,
           [TypeID] = @TypeID,
           [Caption] = @Caption
    WHERE  [FileID] = @FileID
GO
/****** Object:  StoredProcedure [crud].[File_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[File_SelectById]
  @FileID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [FileID],
           [ParentID],
           [EntityID],
           [ParentFolder],
           [Name],
           [Size],
           [TypeID],
           [Caption]
    FROM   [generic].[File]
    WHERE  [FileID] = @FileID
GO
/****** Object:  StoredProcedure [crud].[File_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[File_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [FileID],
           [ParentID],
           [EntityID],
           [ParentFolder],
           [Name],
           [Size],
           [TypeID],
           [Caption]
    FROM   [generic].[File]
GO
/****** Object:  StoredProcedure [crud].[File_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[File_Insert]
  @ParentID     INT,
  @EntityID     SMALLINT,
  @ParentFolder VARCHAR(100),
  @Name         VARCHAR(50),
  @Size         DECIMAL(18, 2),
  @TypeID       INT,
  @Caption      VARCHAR(50)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [generic].[File]
    (
      [ParentID],
      [EntityID],
      [ParentFolder],
      [Name],
      [Size],
      [TypeID],
      [Caption]
    )
    VALUES
    (
      @ParentID,
      @EntityID,
      @ParentFolder,
      @Name,
      @Size,
      @TypeID,
      @Caption
    )
    -- Begin Return Select <- do not remove
    SELECT [FileID],
           [ParentID],
           [EntityID],
           [ParentFolder],
           [Name],
           [Size],
           [TypeID],
           [Caption]
    FROM   [generic].[File]
    WHERE  [FileID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[File_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[File_Delete]
  @FileID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [generic].[File]
    WHERE  [FileID] = @FileID
GO
/****** Object:  StoredProcedure [crud].[Event_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Event_Update]
  @EventID   INT,
  @ParentID  INT,
  @EntityID  SMALLINT,
  @TypeID    INT,
  @UserID    INT,
  @EventDate DATETIME
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [generic].[Event]
    SET    [ParentID] = @ParentID,
           [EntityID] = @EntityID,
           [TypeID] = @TypeID,
           [UserID] = @UserID,
           [EventDate] = @EventDate
    WHERE  [EventID] = @EventID
GO
/****** Object:  StoredProcedure [crud].[Event_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Event_SelectById]
  @EventID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [EventID],
           [ParentID],
           [EntityID],
           [TypeID],
           [UserID],
           [EventDate]
    FROM   [generic].[Event]
    WHERE  [EventID] = @EventID
GO
/****** Object:  StoredProcedure [crud].[Event_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Event_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [EventID],
           [ParentID],
           [EntityID],
           [TypeID],
           [UserID],
           [EventDate]
    FROM   [generic].[Event]
GO
/****** Object:  StoredProcedure [crud].[Event_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Event_Insert]
  @ParentID  INT,
  @EntityID  SMALLINT,
  @TypeID    INT,
  @UserID    INT,
  @EventDate DATETIME
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [generic].[Event]
    (
      [ParentID],
      [EntityID],
      [TypeID],
      [UserID],
      [EventDate]
    )
    VALUES
    (
      @ParentID,
      @EntityID,
      @TypeID,
      @UserID,
      @EventDate
    )
    -- Begin Return Select <- do not remove
    SELECT [EventID],
           [ParentID],
           [EntityID],
           [TypeID],
           [UserID],
           [EventDate]
    FROM   [generic].[Event]
    WHERE  [EventID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[Event_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Event_Delete]
  @EventID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [generic].[Event]
    WHERE  [EventID] = @EventID
GO
/****** Object:  StoredProcedure [crud].[Entity_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Entity_Update]
  @EntityID TINYINT,
  @Name     VARCHAR(50)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[Entity]
    SET    [Name] = @Name
    WHERE  [EntityID] = @EntityID
GO
/****** Object:  StoredProcedure [crud].[Entity_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Entity_SelectById]
  @EntityID TINYINT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [EntityID],
           [Name]
    FROM   [dbo].[Entity]
    WHERE  [EntityID] = @EntityID
GO
/****** Object:  StoredProcedure [crud].[Entity_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Entity_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [EntityID],
           [Name]
    FROM   [dbo].[Entity]
GO
/****** Object:  StoredProcedure [crud].[Entity_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Entity_Insert]
  @Name VARCHAR(50)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[Entity]
    (
      [Name]
    )
    VALUES
    (
      @Name
    )
    -- Begin Return Select <- do not remove
    SELECT [EntityID],
           [Name]
    FROM   [dbo].[Entity]
    WHERE  [EntityID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[Entity_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Entity_Delete]
  @EntityID TINYINT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[Entity]
    WHERE  [EntityID] = @EntityID
GO
/****** Object:  StoredProcedure [crud].[Comment_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Comment_Update]
  @CommentID INT,
  @ParentID  INT,
  @EntityID  SMALLINT,
  @UserID    INT,
  @TypeID    INT,
  @Comment   VARCHAR(MAX)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [generic].[Comment]
    SET    [ParentID] = @ParentID,
           [EntityID] = @EntityID,
           [UserID] = @UserID,
           [TypeID] = @TypeID,
           [Comment] = @Comment
    WHERE  [CommentID] = @CommentID
GO
/****** Object:  StoredProcedure [crud].[Comment_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Comment_SelectById]
  @CommentID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [CommentID],
           [ParentID],
           [EntityID],
           [UserID],
           [TypeID],
           [Comment]
    FROM   [generic].[Comment]
    WHERE  [CommentID] = @CommentID
GO
/****** Object:  StoredProcedure [crud].[Comment_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Comment_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [CommentID],
           [ParentID],
           [EntityID],
           [UserID],
           [TypeID],
           [Comment]
    FROM   [generic].[Comment]
GO
/****** Object:  StoredProcedure [crud].[Comment_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Comment_Insert]
  @ParentID INT,
  @EntityID SMALLINT,
  @UserID   INT,
  @TypeID   INT,
  @Comment  VARCHAR(MAX)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [generic].[Comment]
    (
      [ParentID],
      [EntityID],
      [UserID],
      [TypeID],
      [Comment]
    )
    VALUES
    (
      @ParentID,
      @EntityID,
      @UserID,
      @TypeID,
      @Comment
    )
    -- Begin Return Select <- do not remove
    SELECT [CommentID],
           [ParentID],
           [EntityID],
           [UserID],
           [TypeID],
           [Comment]
    FROM   [generic].[Comment]
    WHERE  [CommentID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[Comment_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Comment_Delete]
  @CommentID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [generic].[Comment]
    WHERE  [CommentID] = @CommentID
GO
/****** Object:  Table [generic].[AddressLocation]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [generic].[AddressLocation](
	[AddressID] [int] NOT NULL,
	[BuildingNumber] [varchar](20) NULL,
	[StreetName] [varchar](60) NOT NULL,
	[City] [varchar](38) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[Zip] [varchar](10) NOT NULL,
	[GeoCode] [geography] NOT NULL,
	[Lattitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
 CONSTRAINT [PK_AddressLocation_1] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StreetName' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'AddressLocation', @level2type=N'COLUMN',@level2name=N'StreetName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'AddressLocation', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'AddressLocation', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ZipCode' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'AddressLocation', @level2type=N'COLUMN',@level2name=N'Zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Geography Infomration' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'AddressLocation', @level2type=N'COLUMN',@level2name=N'GeoCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lattitude' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'AddressLocation', @level2type=N'COLUMN',@level2name=N'Lattitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Longitude' , @level0type=N'SCHEMA',@level0name=N'generic', @level1type=N'TABLE',@level1name=N'AddressLocation', @level2type=N'COLUMN',@level2name=N'Longitude'
GO
/****** Object:  StoredProcedure [crud].[Address_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Address_Update]
  @AddressID INT,
  @ParentID  INT,
  @EntityID  SMALLINT,
  @Street    VARCHAR(60),
  @Suite     VARCHAR(50),
  @City      VARCHAR(38),
  @State     VARCHAR(2),
  @Zip       VARCHAR(10)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [generic].[Address]
    SET    [ParentID] = @ParentID,
           [EntityID] = @EntityID,
           [Street] = @Street,
           [Suite] = @Suite,
           [City] = @City,
           [State] = @State,
           [Zip] = @Zip
    WHERE  [AddressID] = @AddressID
GO
/****** Object:  StoredProcedure [crud].[Address_SelectByParentIdAndEntityId]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Address_SelectByParentIdAndEntityId]
  @ParentID INT,
  @EntityID SMALLINT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [AddressID],
           [ParentID],
           [EntityID],
           [Street],
           [Suite],
           [City],
           [State],
           [Zip]
    FROM   [generic].[Address]
    WHERE  [ParentID] = @ParentID AND [EntityID] = @EntityID
GO
/****** Object:  StoredProcedure [crud].[Address_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Address_SelectById]
  @AddressID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [AddressID],
           [ParentID],
           [EntityID],
           [Street],
           [Suite],
           [City],
           [State],
           [Zip]
    FROM   [generic].[Address]
    WHERE  [AddressID] = @AddressID
GO
/****** Object:  StoredProcedure [crud].[Address_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Address_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [AddressID],
           [ParentID],
           [EntityID],
           [Street],
           [Suite],
           [City],
           [State],
           [Zip]
    FROM   [generic].[Address]
GO
/****** Object:  StoredProcedure [crud].[Address_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Address_Insert]
  @ParentID INT,
  @EntityID SMALLINT,
  @Street   VARCHAR(60),
  @Suite    VARCHAR(50),
  @City     VARCHAR(38),
  @State    VARCHAR(2),
  @Zip      VARCHAR(10)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [generic].[Address]
    (
      [ParentID],
      [EntityID],
      [Street],
      [Suite],
      [City],
      [State],
      [Zip]
    )
    VALUES
    (
      @ParentID,
      @EntityID,
      @Street,
      @Suite,
      @City,
      @State,
      @Zip
    )
    -- Begin Return Select <- do not remove
    SELECT [AddressID],
           [ParentID],
           [EntityID],
           [Street],
           [Suite],
           [City],
           [State],
           [Zip]
    FROM   [generic].[Address]
    WHERE  [AddressID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[Address_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Address_Delete]
  @AddressID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [generic].[Address]
    WHERE  [AddressID] = @AddressID
GO
/****** Object:  StoredProcedure [crud].[AddressUse_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[AddressUse_Update]
  @AddressUserID INT,
  @AddressID     INT,
  @TypeID        INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [generic].[AddressUse]
    SET    [AddressID] = @AddressID,
           [TypeID] = @TypeID
    WHERE  [AddressUserID] = @AddressUserID
GO
/****** Object:  StoredProcedure [crud].[AddressUse_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[AddressUse_SelectById]
  @AddressUserID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [AddressUserID],
           [AddressID],
           [TypeID]
    FROM   [generic].[AddressUse]
    WHERE  [AddressUserID] = @AddressUserID
GO
/****** Object:  StoredProcedure [crud].[AddressUse_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[AddressUse_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [AddressUserID],
           [AddressID],
           [TypeID]
    FROM   [generic].[AddressUse]
GO
/****** Object:  StoredProcedure [crud].[AddressUse_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[AddressUse_Insert]
  @AddressID INT,
  @TypeID    INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [generic].[AddressUse]
    (
      [AddressID],
      [TypeID]
    )
    VALUES
    (
      @AddressID,
      @TypeID
    )
    -- Begin Return Select <- do not remove
    SELECT [AddressUserID],
           [AddressID],
           [TypeID]
    FROM   [generic].[AddressUse]
    WHERE  [AddressUserID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[AddressUse_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[AddressUse_Delete]
  @AddressUserID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [generic].[AddressUse]
    WHERE  [AddressUserID] = @AddressUserID
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[FirstName] [varchar](28) NOT NULL,
	[LastName] [varchar](28) NOT NULL,
	[Title] [varchar](50) NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ParentID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'OrganizationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User First Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User Last Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User Title' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Value - Enabled, Disabled' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'StatusID'
GO
/****** Object:  Table [dbo].[Request]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[DateInserted] [datetime] NULL,
	[CustomerRequestID] [varchar](30) NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Request', @level2type=N'COLUMN',@level2name=N'RequestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID of Aorganization that placed request' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Request', @level2type=N'COLUMN',@level2name=N'OrganizationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Inserted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Request', @level2type=N'COLUMN',@level2name=N'DateInserted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer Defined RequestID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Request', @level2type=N'COLUMN',@level2name=N'CustomerRequestID'
GO
/****** Object:  StoredProcedure [crud].[ProductCategory_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[ProductCategory_Update]
  @ProductCategoryID INT,
  @Name              VARCHAR(50),
  @Code              VARCHAR(8)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[ProductCategory]
    SET    [Name] = @Name,
           [Code] = @Code
    WHERE  [ProductCategoryID] = @ProductCategoryID
GO
/****** Object:  StoredProcedure [crud].[ProductCategory_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[ProductCategory_SelectById]
  @ProductCategoryID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [ProductCategoryID],
           [Name],
           [Code]
    FROM   [dbo].[ProductCategory]
    WHERE  [ProductCategoryID] = @ProductCategoryID
GO
/****** Object:  StoredProcedure [crud].[ProductCategory_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[ProductCategory_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [ProductCategoryID],
           [Name],
           [Code]
    FROM   [dbo].[ProductCategory]
GO
/****** Object:  StoredProcedure [crud].[ProductCategory_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[ProductCategory_Insert]
  @Name VARCHAR(50),
  @Code VARCHAR(8)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[ProductCategory]
    (
      [Name],
      [Code]
    )
    VALUES
    (
      @Name,
      @Code
    )
    -- Begin Return Select <- do not remove
    SELECT [ProductCategoryID],
           [Name],
           [Code]
    FROM   [dbo].[ProductCategory]
    WHERE  [ProductCategoryID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[ProductCategory_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[ProductCategory_Delete]
  @ProductCategoryID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[ProductCategory]
    WHERE  [ProductCategoryID] = @ProductCategoryID
GO
/****** Object:  StoredProcedure [crud].[Request_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Request_Update]
  @RequestID         INT,
  @OrganizationID    INT,
  @DateInserted      DATETIME,
  @CustomerRequestID VARCHAR(30)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[Request]
    SET    [OrganizationID] = @OrganizationID,
           [DateInserted] = @DateInserted,
           [CustomerRequestID] = @CustomerRequestID
    WHERE  [RequestID] = @RequestID
GO
/****** Object:  StoredProcedure [crud].[Request_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Request_SelectById]
  @RequestID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [RequestID],
           [OrganizationID],
           [DateInserted],
           [CustomerRequestID]
    FROM   [dbo].[Request]
    WHERE  [RequestID] = @RequestID
GO
/****** Object:  StoredProcedure [crud].[Request_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Request_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [RequestID],
           [OrganizationID],
           [DateInserted],
           [CustomerRequestID]
    FROM   [dbo].[Request]
GO
/****** Object:  StoredProcedure [crud].[Request_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Request_Insert]
  @OrganizationID    INT,
  @DateInserted      DATETIME,
  @CustomerRequestID VARCHAR(30)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[Request]
    (
      [OrganizationID],
      [DateInserted],
      [CustomerRequestID]
    )
    VALUES
    (
      @OrganizationID,
      @DateInserted,
      @CustomerRequestID
    )
    -- Begin Return Select <- do not remove
    SELECT [RequestID],
           [OrganizationID],
           [DateInserted],
           [CustomerRequestID]
    FROM   [dbo].[Request]
    WHERE  [RequestID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[Request_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Request_Delete]
  @RequestID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[Request]
    WHERE  [RequestID] = @RequestID
GO
/****** Object:  Table [dbo].[UserNotification]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNotification](
	[UserNotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DatePosted] [datetime] NOT NULL,
	[DateRead] [datetime] NULL,
 CONSTRAINT [PK_UserNotification] PRIMARY KEY CLUSTERED 
(
	[UserNotificationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserNotification', @level2type=N'COLUMN',@level2name=N'UserNotificationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserNotification', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date notification will be posted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserNotification', @level2type=N'COLUMN',@level2name=N'DatePosted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date user read notification' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserNotification', @level2type=N'COLUMN',@level2name=N'DateRead'
GO
/****** Object:  Table [dbo].[WorkOrder]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkOrder](
	[WorkOrderID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NOT NULL,
	[LoanID] [int] NULL,
	[DateInserted] [datetime] NULL,
	[LoanID1] [int] NOT NULL,
 CONSTRAINT [PK_WorkOrder] PRIMARY KEY CLUSTERED 
(
	[WorkOrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'WorkOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'RequestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loan RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'LoanID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Inserted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'DateInserted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrder', @level2type=N'COLUMN',@level2name=N'LoanID1'
GO
/****** Object:  Table [dbo].[UserAreaCoverage]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAreaCoverage](
	[UserAreaCoverageID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ZipCode] [varchar](10) NOT NULL,
	[ServiceID] [int] NOT NULL,
 CONSTRAINT [PK_UserAreaCoverage] PRIMARY KEY CLUSTERED 
(
	[UserAreaCoverageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserAreaCoverage', @level2type=N'COLUMN',@level2name=N'UserAreaCoverageID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserAreaCoverage', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zip Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserAreaCoverage', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID of Service area is for' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserAreaCoverage', @level2type=N'COLUMN',@level2name=N'ServiceID'
GO
/****** Object:  StoredProcedure [crud].[User_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[User_Update]
  @UserID         INT,
  @OrganizationID INT,
  @FirstName      VARCHAR(28),
  @LastName       VARCHAR(28),
  @Title          VARCHAR(50),
  @StatusID       INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[User]
    SET    [OrganizationID] = @OrganizationID,
           [FirstName] = @FirstName,
           [LastName] = @LastName,
           [Title] = @Title,
           [StatusID] = @StatusID
    WHERE  [UserID] = @UserID
GO
/****** Object:  StoredProcedure [crud].[User_SelectByOrganizationIdAndStatusId]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[User_SelectByOrganizationIdAndStatusId]
  @OrganizationID INT,
  @StatusID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [UserID],
           [OrganizationID],
           [FirstName],
           [LastName],
           [Title],
           [StatusID]
    FROM   [dbo].[User]
    WHERE  [UserID] = @OrganizationID AND [StatusID] = @StatusID
GO
/****** Object:  StoredProcedure [crud].[User_SelectByOrganizationId]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[User_SelectByOrganizationId]
  @OrganizationID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [UserID],
           [OrganizationID],
           [FirstName],
           [LastName],
           [Title],
           [StatusID]
    FROM   [dbo].[User]
    WHERE  [UserID] = @OrganizationID
GO
/****** Object:  StoredProcedure [crud].[User_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[User_SelectById]
  @UserID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [UserID],
           [OrganizationID],
           [FirstName],
           [LastName],
           [Title],
           [StatusID]
    FROM   [dbo].[User]
    WHERE  [UserID] = @UserID
GO
/****** Object:  StoredProcedure [crud].[User_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[User_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [UserID],
           [OrganizationID],
           [FirstName],
           [LastName],
           [Title],
           [StatusID]
    FROM   [dbo].[User]
GO
/****** Object:  StoredProcedure [crud].[User_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[User_Insert]
  @OrganizationID INT,
  @FirstName      VARCHAR(28),
  @LastName       VARCHAR(28),
  @Title          VARCHAR(50),
  @StatusID       INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[User]
    (
      [OrganizationID],
      [FirstName],
      [LastName],
      [Title],
      [StatusID]
    )
    VALUES
    (
      @OrganizationID,
      @FirstName,
      @LastName,
      @Title,
      @StatusID
    )
    -- Begin Return Select <- do not remove
    SELECT [UserID],
           [OrganizationID],
           [FirstName],
           [LastName],
           [Title],
           [StatusID]
    FROM   [dbo].[User]
    WHERE  [UserID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[User_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[User_Delete]
  @UserID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[User]
    WHERE  [UserID] = @UserID
GO
/****** Object:  Table [dbo].[UserContact]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserContact](
	[UserContactID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Value] [varchar](50) NOT NULL,
	[TypeID] [int] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_UserContact] PRIMARY KEY CLUSTERED 
(
	[UserContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserContact', @level2type=N'COLUMN',@level2name=N'UserContactID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserContact', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contact Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserContact', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Value - Type (Phone, Fax, Email)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserContact', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True\False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserContact', @level2type=N'COLUMN',@level2name=N'IsPrimary'
GO
/****** Object:  StoredProcedure [crud].[AddressLocation_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[AddressLocation_Update]
  @AddressID      INT,
  @BuildingNumber VARCHAR(20),
  @StreetName     VARCHAR(60),
  @City           VARCHAR(38),
  @State          VARCHAR(2),
  @Zip            VARCHAR(10),
  @GeoCode        GEOGRAPHY,
  @Lattitude      FLOAT,
  @Longitude      FLOAT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [generic].[AddressLocation]
    SET    [AddressID] = @AddressID,
           [BuildingNumber] = @BuildingNumber,
           [StreetName] = @StreetName,
           [City] = @City,
           [State] = @State,
           [Zip] = @Zip,
           [GeoCode] = @GeoCode,
           [Lattitude] = @Lattitude,
           [Longitude] = @Longitude
    WHERE  [AddressID] = @AddressID
GO
/****** Object:  StoredProcedure [crud].[AddressLocation_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[AddressLocation_SelectById]
  @AddressID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [AddressID],
           [BuildingNumber],
           [StreetName],
           [City],
           [State],
           [Zip],
           [GeoCode],
           [Lattitude],
           [Longitude]
    FROM   [generic].[AddressLocation]
    WHERE  [AddressID] = @AddressID
GO
/****** Object:  StoredProcedure [crud].[AddressLocation_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[AddressLocation_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [AddressID],
           [BuildingNumber],
           [StreetName],
           [City],
           [State],
           [Zip],
           [GeoCode],
           [Lattitude],
           [Longitude]
    FROM   [generic].[AddressLocation]
GO
/****** Object:  StoredProcedure [crud].[AddressLocation_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[AddressLocation_Insert]
  @AddressID      INT,
  @BuildingNumber VARCHAR(20),
  @StreetName     VARCHAR(60),
  @City           VARCHAR(38),
  @State          VARCHAR(2),
  @Zip            VARCHAR(10),
  @GeoCode        GEOGRAPHY,
  @Lattitude      FLOAT,
  @Longitude      FLOAT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [generic].[AddressLocation]
    (
      [AddressID],
      [BuildingNumber],
      [StreetName],
      [City],
      [State],
      [Zip],
      [GeoCode],
      [Lattitude],
      [Longitude]
    )
    VALUES
    (
      @AddressID,
      @BuildingNumber,
      @StreetName,
      @City,
      @State,
      @Zip,
      @GeoCode,
      @Lattitude,
      @Longitude
    )
    -- Begin Return Select <- do not remove
    SELECT [AddressID],
           [BuildingNumber],
           [StreetName],
           [City],
           [State],
           [Zip],
           [GeoCode],
           [Lattitude],
           [Longitude]
    FROM   [generic].[AddressLocation]
    WHERE  [AddressID] = @AddressID

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[AddressLocation_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[AddressLocation_Delete]
  @AddressID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [generic].[AddressLocation]
    WHERE  [AddressID] = @AddressID
GO
/****** Object:  Table [dbo].[Mortgagor]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mortgagor](
	[MortgagorID] [int] IDENTITY(1,1) NOT NULL,
	[LoanID] [int] NOT NULL,
	[Name] [varchar](60) NOT NULL,
	[TypeID] [int] NOT NULL,
	[Phone] [varchar](15) NULL,
 CONSTRAINT [PK_Mortgagor] PRIMARY KEY CLUSTERED 
(
	[MortgagorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Mortgagor] ON [dbo].[Mortgagor] 
(
	[LoanID] ASC,
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mortgagor', @level2type=N'COLUMN',@level2name=N'MortgagorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mortgagor', @level2type=N'COLUMN',@level2name=N'LoanID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mortgagor Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mortgagor', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent RecordID - LoanType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mortgagor', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mortgagor Phone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mortgagor', @level2type=N'COLUMN',@level2name=N'Phone'
GO
/****** Object:  StoredProcedure [crud].[Lookup_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Lookup_Update]
  @LookupID      INT,
  @LookupGroupID SMALLINT,
  @Value         VARCHAR(50)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [generic].[Lookup]
    SET    [LookupGroupID] = @LookupGroupID,
           [Value] = @Value
    WHERE  [LookupID] = @LookupID
GO
/****** Object:  StoredProcedure [crud].[Lookup_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Lookup_SelectById]
  @LookupID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [LookupID],
           [LookupGroupID],
           [Value]
    FROM   [generic].[Lookup]
    WHERE  [LookupID] = @LookupID
GO
/****** Object:  StoredProcedure [crud].[Lookup_SelectByGroupId]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Lookup_SelectByGroupId]
  @LookupGroupID SMALLINT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [LookupID],
           [LookupGroupID],
           [Value]
    FROM   [generic].[Lookup]
    WHERE  [LookupGroupID] = @LookupGroupID
GO
/****** Object:  StoredProcedure [crud].[Lookup_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Lookup_SelectAll]
 
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [LookupID],
           [LookupGroupID],
           [Value]
    FROM   [generic].[Lookup]
GO
/****** Object:  StoredProcedure [crud].[Lookup_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Lookup_Insert]
  @LookupGroupID SMALLINT,
  @Value         VARCHAR(50)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [generic].[Lookup]
    (
      [LookupGroupID],
      [Value]
    )
    VALUES
    (
      @LookupGroupID,
      @Value
    )
    -- Begin Return Select <- do not remove
    SELECT [LookupID],
           [LookupGroupID],
           [Value]
    FROM   [generic].[Lookup]
    WHERE  [LookupID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[Lookup_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Lookup_Delete]
  @LookupID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [generic].[Lookup]
    WHERE  [LookupID] = @LookupID
GO
/****** Object:  StoredProcedure [crud].[Location_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Location_Update]
  @LocationID     INT,
  @OrganizationID INT,
  @Name           VARCHAR(75),
  @Code           VARCHAR(8),
  @TypeID         INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[Location]
    SET    [OrganizationID] = @OrganizationID,
           [Name] = @Name,
           [Code] = @Code,
           [TypeID] = @TypeID
    WHERE  [LocationID] = @LocationID
GO
/****** Object:  StoredProcedure [crud].[Location_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Location_SelectById]
  @LocationID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [LocationID],
           [OrganizationID],
           [Name],
           [Code],
           [TypeID]
    FROM   [dbo].[Location]
    WHERE  [LocationID] = @LocationID
GO
/****** Object:  StoredProcedure [crud].[Location_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Location_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [LocationID],
           [OrganizationID],
           [Name],
           [Code],
           [TypeID]
    FROM   [dbo].[Location]
GO
/****** Object:  StoredProcedure [crud].[Location_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Location_Insert]
  @OrganizationID INT,
  @Name           VARCHAR(75),
  @Code           VARCHAR(8),
  @TypeID         INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[Location]
    (
      [OrganizationID],
      [Name],
      [Code],
      [TypeID]
    )
    VALUES
    (
      @OrganizationID,
      @Name,
      @Code,
      @TypeID
    )
    -- Begin Return Select <- do not remove
    SELECT [LocationID],
           [OrganizationID],
           [Name],
           [Code],
           [TypeID]
    FROM   [dbo].[Location]
    WHERE  [LocationID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[Location_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Location_Delete]
  @LocationID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[Location]
    WHERE  [LocationID] = @LocationID
GO
/****** Object:  StoredProcedure [crud].[Loan_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Loan_Update]
  @LoanID         INT,
  @OrganizationID INT,
  @TypeID         INT,
  @LoanNumber     VARCHAR(30),
  @HudCaseNumber  VARCHAR(20)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[Loan]
    SET    [OrganizationID] = @OrganizationID,
           [TypeID] = @TypeID,
           [LoanNumber] = @LoanNumber,
           [HudCaseNumber] = @HudCaseNumber
    WHERE  [LoanID] = @LoanID
GO
/****** Object:  StoredProcedure [crud].[Loan_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Loan_SelectById]
  @LoanID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [LoanID],
           [OrganizationID],
           [TypeID],
           [LoanNumber],
           [HudCaseNumber]
    FROM   [dbo].[Loan]
    WHERE  [LoanID] = @LoanID
GO
/****** Object:  StoredProcedure [crud].[Loan_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Loan_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [LoanID],
           [OrganizationID],
           [TypeID],
           [LoanNumber],
           [HudCaseNumber]
    FROM   [dbo].[Loan]
GO
/****** Object:  StoredProcedure [crud].[Loan_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Loan_Insert]
  @OrganizationID INT,
  @TypeID         INT,
  @LoanNumber     VARCHAR(30),
  @HudCaseNumber  VARCHAR(20)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[Loan]
    (
      [OrganizationID],
      [TypeID],
      [LoanNumber],
      [HudCaseNumber]
    )
    VALUES
    (
      @OrganizationID,
      @TypeID,
      @LoanNumber,
      @HudCaseNumber
    )
    -- Begin Return Select <- do not remove
    SELECT [LoanID],
           [OrganizationID],
           [TypeID],
           [LoanNumber],
           [HudCaseNumber]
    FROM   [dbo].[Loan]
    WHERE  [LoanID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[Loan_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Loan_Delete]
  @LoanID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[Loan]
    WHERE  [LoanID] = @LoanID
GO
/****** Object:  StoredProcedure [crud].[Product_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Product_Update]
  @ProductID         INT,
  @ProductCategoryID INT,
  @Caption           VARCHAR(50),
  @Code              VARCHAR(8),
  @SKU               VARCHAR(20),
  @Rate              DECIMAL(18, 2),
  @Cost              DECIMAL(18, 2)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[Product]
    SET    [ProductCategoryID] = @ProductCategoryID,
           [Caption] = @Caption,
           [Code] = @Code,
           [SKU] = @SKU,
           [Rate] = @Rate,
           [Cost] = @Cost
    WHERE  [ProductID] = @ProductID
GO
/****** Object:  StoredProcedure [crud].[Product_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Product_SelectById]
  @ProductID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [ProductID],
           [ProductCategoryID],
           [Caption],
           [Code],
           [SKU],
           [Rate],
           [Cost]
    FROM   [dbo].[Product]
    WHERE  [ProductID] = @ProductID
GO
/****** Object:  StoredProcedure [crud].[Product_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Product_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [ProductID],
           [ProductCategoryID],
           [Caption],
           [Code],
           [SKU],
           [Rate],
           [Cost]
    FROM   [dbo].[Product]
GO
/****** Object:  StoredProcedure [crud].[Product_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Product_Insert]
  @ProductCategoryID INT,
  @Caption           VARCHAR(50),
  @Code              VARCHAR(8),
  @SKU               VARCHAR(20),
  @Rate              DECIMAL(18, 2),
  @Cost              DECIMAL(18, 2)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[Product]
    (
      [ProductCategoryID],
      [Caption],
      [Code],
      [SKU],
      [Rate],
      [Cost]
    )
    VALUES
    (
      @ProductCategoryID,
      @Caption,
      @Code,
      @SKU,
      @Rate,
      @Cost
    )
    -- Begin Return Select <- do not remove
    SELECT [ProductID],
           [ProductCategoryID],
           [Caption],
           [Code],
           [SKU],
           [Rate],
           [Cost]
    FROM   [dbo].[Product]
    WHERE  [ProductID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[Product_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Product_Delete]
  @ProductID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[Product]
    WHERE  [ProductID] = @ProductID
GO
/****** Object:  StoredProcedure [crud].[Mortgagor_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Mortgagor_Update]
  @MortgagorID INT,
  @LoanID      INT,
  @Name        VARCHAR(60),
  @TypeID      INT,
  @Phone       VARCHAR(15)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[Mortgagor]
    SET    [LoanID] = @LoanID,
           [Name] = @Name,
           [TypeID] = @TypeID,
           [Phone] = @Phone
    WHERE  [MortgagorID] = @MortgagorID
GO
/****** Object:  StoredProcedure [crud].[Mortgagor_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Mortgagor_SelectById]
  @MortgagorID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [MortgagorID],
           [LoanID],
           [Name],
           [TypeID],
           [Phone]
    FROM   [dbo].[Mortgagor]
    WHERE  [MortgagorID] = @MortgagorID
GO
/****** Object:  StoredProcedure [crud].[Mortgagor_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Mortgagor_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [MortgagorID],
           [LoanID],
           [Name],
           [TypeID],
           [Phone]
    FROM   [dbo].[Mortgagor]
GO
/****** Object:  StoredProcedure [crud].[Mortgagor_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Mortgagor_Insert]
  @LoanID INT,
  @Name   VARCHAR(60),
  @TypeID INT,
  @Phone  VARCHAR(15)
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[Mortgagor]
    (
      [LoanID],
      [Name],
      [TypeID],
      [Phone]
    )
    VALUES
    (
      @LoanID,
      @Name,
      @TypeID,
      @Phone
    )
    -- Begin Return Select <- do not remove
    SELECT [MortgagorID],
           [LoanID],
           [Name],
           [TypeID],
           [Phone]
    FROM   [dbo].[Mortgagor]
    WHERE  [MortgagorID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[Mortgagor_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[Mortgagor_Delete]
  @MortgagorID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[Mortgagor]
    WHERE  [MortgagorID] = @MortgagorID
GO
/****** Object:  StoredProcedure [crud].[UserAreaCoverage_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserAreaCoverage_Update]
  @UserAreaCoverageID INT,
  @UserID             INT,
  @ZipCode            VARCHAR(10),
  @ServiceID          INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[UserAreaCoverage]
    SET    [UserID] = @UserID,
           [ZipCode] = @ZipCode,
           [ServiceID] = @ServiceID
    WHERE  [UserAreaCoverageID] = @UserAreaCoverageID
GO
/****** Object:  StoredProcedure [crud].[UserAreaCoverage_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserAreaCoverage_SelectById]
  @UserAreaCoverageID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [UserAreaCoverageID],
           [UserID],
           [ZipCode],
           [ServiceID]
    FROM   [dbo].[UserAreaCoverage]
    WHERE  [UserAreaCoverageID] = @UserAreaCoverageID
GO
/****** Object:  StoredProcedure [crud].[UserAreaCoverage_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserAreaCoverage_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [UserAreaCoverageID],
           [UserID],
           [ZipCode],
           [ServiceID]
    FROM   [dbo].[UserAreaCoverage]
GO
/****** Object:  StoredProcedure [crud].[UserAreaCoverage_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserAreaCoverage_Insert]
  @UserID    INT,
  @ZipCode   VARCHAR(10),
  @ServiceID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[UserAreaCoverage]
    (
      [UserID],
      [ZipCode],
      [ServiceID]
    )
    VALUES
    (
      @UserID,
      @ZipCode,
      @ServiceID
    )
    -- Begin Return Select <- do not remove
    SELECT [UserAreaCoverageID],
           [UserID],
           [ZipCode],
           [ServiceID]
    FROM   [dbo].[UserAreaCoverage]
    WHERE  [UserAreaCoverageID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[UserAreaCoverage_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserAreaCoverage_Delete]
  @UserAreaCoverageID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[UserAreaCoverage]
    WHERE  [UserAreaCoverageID] = @UserAreaCoverageID
GO
/****** Object:  StoredProcedure [crud].[UserNotification_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserNotification_Update]
  @UserNotificationID INT,
  @UserID             INT,
  @DatePosted         DATETIME,
  @DateRead           DATETIME
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[UserNotification]
    SET    [UserID] = @UserID,
           [DatePosted] = @DatePosted,
           [DateRead] = @DateRead
    WHERE  [UserNotificationID] = @UserNotificationID
GO
/****** Object:  StoredProcedure [crud].[UserNotification_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserNotification_SelectById]
  @UserNotificationID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [UserNotificationID],
           [UserID],
           [DatePosted],
           [DateRead]
    FROM   [dbo].[UserNotification]
    WHERE  [UserNotificationID] = @UserNotificationID
GO
/****** Object:  StoredProcedure [crud].[UserNotification_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserNotification_SelectAll]
 
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [UserNotificationID],
           [UserID],
           [DatePosted],
           [DateRead]
    FROM   [dbo].[UserNotification]
GO
/****** Object:  StoredProcedure [crud].[UserNotification_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserNotification_Insert]
  @UserID     INT,
  @DatePosted DATETIME,
  @DateRead   DATETIME
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[UserNotification]
    (
      [UserID],
      [DatePosted],
      [DateRead]
    )
    VALUES
    (
      @UserID,
      @DatePosted,
      @DateRead
    )
    -- Begin Return Select <- do not remove
    SELECT [UserNotificationID],
           [UserID],
           [DatePosted],
           [DateRead]
    FROM   [dbo].[UserNotification]
    WHERE  [UserNotificationID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[UserNotification_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserNotification_Delete]
  @UserNotificationID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[UserNotification]
    WHERE  [UserNotificationID] = @UserNotificationID
GO
/****** Object:  StoredProcedure [crud].[UserContact_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserContact_Update]
  @UserContactID INT,
  @UserID        INT,
  @Value         VARCHAR(50),
  @TypeID        INT,
  @IsPrimary     BIT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[UserContact]
    SET    [UserID] = @UserID,
           [Value] = @Value,
           [TypeID] = @TypeID,
           [IsPrimary] = @IsPrimary
    WHERE  [UserContactID] = @UserContactID
GO
/****** Object:  StoredProcedure [crud].[UserContact_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserContact_SelectById]
  @UserContactID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [UserContactID],
           [UserID],
           [Value],
           [TypeID],
           [IsPrimary]
    FROM   [dbo].[UserContact]
    WHERE  [UserContactID] = @UserContactID
GO
/****** Object:  StoredProcedure [crud].[UserContact_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserContact_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [UserContactID],
           [UserID],
           [Value],
           [TypeID],
           [IsPrimary]
    FROM   [dbo].[UserContact]
GO
/****** Object:  StoredProcedure [crud].[UserContact_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserContact_Insert]
  @UserID    INT,
  @Value     VARCHAR(50),
  @TypeID    INT,
  @IsPrimary BIT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[UserContact]
    (
      [UserID],
      [Value],
      [TypeID],
      [IsPrimary]
    )
    VALUES
    (
      @UserID,
      @Value,
      @TypeID,
      @IsPrimary
    )
    -- Begin Return Select <- do not remove
    SELECT [UserContactID],
           [UserID],
           [Value],
           [TypeID],
           [IsPrimary]
    FROM   [dbo].[UserContact]
    WHERE  [UserContactID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[UserContact_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[UserContact_Delete]
  @UserContactID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[UserContact]
    WHERE  [UserContactID] = @UserContactID
GO
/****** Object:  Table [dbo].[WorkOrderAssignment]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkOrderAssignment](
	[WorkOrderAssignmentID] [int] IDENTITY(1,1) NOT NULL,
	[WorkOrderID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[EventDate] [datetime] NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_WorkOrderAssignment] PRIMARY KEY CLUSTERED 
(
	[WorkOrderAssignmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrderAssignment', @level2type=N'COLUMN',@level2name=N'WorkOrderAssignmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrderAssignment', @level2type=N'COLUMN',@level2name=N'WorkOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'idUser of the contractor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrderAssignment', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DateTime of Change' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrderAssignment', @level2type=N'COLUMN',@level2name=N'EventDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Value - Assigend, Unassigned' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrderAssignment', @level2type=N'COLUMN',@level2name=N'StatusID'
GO
/****** Object:  StoredProcedure [crud].[WorkOrder_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrder_Update]
  @WorkOrderID  INT,
  @RequestID    INT,
  @LoanID       INT,
  @DateInserted DATETIME,
  @LoanID1      INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[WorkOrder]
    SET    [RequestID] = @RequestID,
           [LoanID] = @LoanID,
           [DateInserted] = @DateInserted,
           [LoanID1] = @LoanID1
    WHERE  [WorkOrderID] = @WorkOrderID
GO
/****** Object:  StoredProcedure [crud].[WorkOrder_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrder_SelectById]
  @WorkOrderID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [WorkOrderID],
           [RequestID],
           [LoanID],
           [DateInserted],
           [LoanID1]
    FROM   [dbo].[WorkOrder]
    WHERE  [WorkOrderID] = @WorkOrderID
GO
/****** Object:  StoredProcedure [crud].[WorkOrder_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrder_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [WorkOrderID],
           [RequestID],
           [LoanID],
           [DateInserted],
           [LoanID1]
    FROM   [dbo].[WorkOrder]
GO
/****** Object:  StoredProcedure [crud].[WorkOrder_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrder_Insert]
  @RequestID    INT,
  @LoanID       INT,
  @DateInserted DATETIME,
  @LoanID1      INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[WorkOrder]
    (
      [RequestID],
      [LoanID],
      [DateInserted],
      [LoanID1]
    )
    VALUES
    (
      @RequestID,
      @LoanID,
      @DateInserted,
      @LoanID1
    )
    -- Begin Return Select <- do not remove
    SELECT [WorkOrderID],
           [RequestID],
           [LoanID],
           [DateInserted],
           [LoanID1]
    FROM   [dbo].[WorkOrder]
    WHERE  [WorkOrderID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[WorkOrder_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrder_Delete]
  @WorkOrderID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[WorkOrder]
    WHERE  [WorkOrderID] = @WorkOrderID
GO
/****** Object:  Table [dbo].[WorkOrderItem]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkOrderItem](
	[WorkOrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[WorkOrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[DateInserted] [datetime] NULL,
 CONSTRAINT [PK_WorkOrderItem] PRIMARY KEY CLUSTERED 
(
	[WorkOrderItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrderItem', @level2type=N'COLUMN',@level2name=N'WorkOrderItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrderItem', @level2type=N'COLUMN',@level2name=N'WorkOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product RecordID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrderItem', @level2type=N'COLUMN',@level2name=N'ProductID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrderItem', @level2type=N'COLUMN',@level2name=N'Rate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date Inserted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkOrderItem', @level2type=N'COLUMN',@level2name=N'DateInserted'
GO
/****** Object:  StoredProcedure [crud].[WorkOrderItem_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrderItem_Update]
  @WorkOrderItemID INT,
  @WorkOrderID     INT,
  @ProductID       INT,
  @Quantity        DECIMAL(18, 2),
  @Rate            DECIMAL(18, 2),
  @DateInserted    DATETIME
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[WorkOrderItem]
    SET    [WorkOrderID] = @WorkOrderID,
           [ProductID] = @ProductID,
           [Quantity] = @Quantity,
           [Rate] = @Rate,
           [DateInserted] = @DateInserted
    WHERE  [WorkOrderItemID] = @WorkOrderItemID
GO
/****** Object:  StoredProcedure [crud].[WorkOrderItem_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrderItem_SelectById]
  @WorkOrderItemID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [WorkOrderItemID],
           [WorkOrderID],
           [ProductID],
           [Quantity],
           [Rate],
           [DateInserted]
    FROM   [dbo].[WorkOrderItem]
    WHERE  [WorkOrderItemID] = @WorkOrderItemID
GO
/****** Object:  StoredProcedure [crud].[WorkOrderItem_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrderItem_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [WorkOrderItemID],
           [WorkOrderID],
           [ProductID],
           [Quantity],
           [Rate],
           [DateInserted]
    FROM   [dbo].[WorkOrderItem]
GO
/****** Object:  StoredProcedure [crud].[WorkOrderItem_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrderItem_Insert]
  @WorkOrderID  INT,
  @ProductID    INT,
  @Quantity     DECIMAL(18, 2),
  @Rate         DECIMAL(18, 2),
  @DateInserted DATETIME
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[WorkOrderItem]
    (
      [WorkOrderID],
      [ProductID],
      [Quantity],
      [Rate],
      [DateInserted]
    )
    VALUES
    (
      @WorkOrderID,
      @ProductID,
      @Quantity,
      @Rate,
      @DateInserted
    )
    -- Begin Return Select <- do not remove
    SELECT [WorkOrderItemID],
           [WorkOrderID],
           [ProductID],
           [Quantity],
           [Rate],
           [DateInserted]
    FROM   [dbo].[WorkOrderItem]
    WHERE  [WorkOrderItemID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[WorkOrderItem_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrderItem_Delete]
  @WorkOrderItemID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[WorkOrderItem]
    WHERE  [WorkOrderItemID] = @WorkOrderItemID
GO
/****** Object:  StoredProcedure [crud].[WorkOrderAssignment_Update]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrderAssignment_Update]
  @WorkOrderAssignmentID INT,
  @WorkOrderID           INT,
  @UserID                INT,
  @EventDate             DATETIME,
  @StatusID              INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    UPDATE [dbo].[WorkOrderAssignment]
    SET    [WorkOrderID] = @WorkOrderID,
           [UserID] = @UserID,
           [EventDate] = @EventDate,
           [StatusID] = @StatusID
    WHERE  [WorkOrderAssignmentID] = @WorkOrderAssignmentID
GO
/****** Object:  StoredProcedure [crud].[WorkOrderAssignment_SelectById]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrderAssignment_SelectById]
  @WorkOrderAssignmentID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [WorkOrderAssignmentID],
           [WorkOrderID],
           [UserID],
           [EventDate],
           [StatusID]
    FROM   [dbo].[WorkOrderAssignment]
    WHERE  [WorkOrderAssignmentID] = @WorkOrderAssignmentID
GO
/****** Object:  StoredProcedure [crud].[WorkOrderAssignment_SelectAll]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrderAssignment_SelectAll]

AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [WorkOrderAssignmentID],
           [WorkOrderID],
           [UserID],
           [EventDate],
           [StatusID]
    FROM   [dbo].[WorkOrderAssignment]
GO
/****** Object:  StoredProcedure [crud].[WorkOrderAssignment_Insert]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrderAssignment_Insert]
  @WorkOrderID INT,
  @UserID      INT,
  @EventDate   DATETIME,
  @StatusID    INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [dbo].[WorkOrderAssignment]
    (
      [WorkOrderID],
      [UserID],
      [EventDate],
      [StatusID]
    )
    VALUES
    (
      @WorkOrderID,
      @UserID,
      @EventDate,
      @StatusID
    )
    -- Begin Return Select <- do not remove
    SELECT [WorkOrderAssignmentID],
           [WorkOrderID],
           [UserID],
           [EventDate],
           [StatusID]
    FROM   [dbo].[WorkOrderAssignment]
    WHERE  [WorkOrderAssignmentID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
/****** Object:  StoredProcedure [crud].[WorkOrderAssignment_Delete]    Script Date: 01/14/2013 18:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [crud].[WorkOrderAssignment_Delete]
  @WorkOrderAssignmentID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    DELETE FROM [dbo].[WorkOrderAssignment]
    WHERE  [WorkOrderAssignmentID] = @WorkOrderAssignmentID
GO
/****** Object:  Default [DF_Event_EventDate_1]    Script Date: 01/14/2013 18:52:50 ******/
ALTER TABLE [generic].[Event] ADD  CONSTRAINT [DF_Event_EventDate_1]  DEFAULT (getdate()) FOR [EventDate]
GO
/****** Object:  Default [DF_Product_Rate]    Script Date: 01/14/2013 18:52:50 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Rate]  DEFAULT ((0)) FOR [Rate]
GO
/****** Object:  Default [DF_Product_Cost]    Script Date: 01/14/2013 18:52:50 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Cost]  DEFAULT ((0)) FOR [Cost]
GO
/****** Object:  Default [DF_Request_DateInserted]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[Request] ADD  CONSTRAINT [DF_Request_DateInserted]  DEFAULT (getdate()) FOR [DateInserted]
GO
/****** Object:  Default [DF_WorkOrder_DateInserted]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_DateInserted]  DEFAULT (getdate()) FOR [DateInserted]
GO
/****** Object:  Default [DF_UserContact_IsPrimary_1]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[UserContact] ADD  CONSTRAINT [DF_UserContact_IsPrimary_1]  DEFAULT ((0)) FOR [IsPrimary]
GO
/****** Object:  Default [DF_WorkOrderAssignment_WhenAssigned]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[WorkOrderAssignment] ADD  CONSTRAINT [DF_WorkOrderAssignment_WhenAssigned]  DEFAULT (getdate()) FOR [EventDate]
GO
/****** Object:  Default [DF_WorkOrderItem_Quantity]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[WorkOrderItem] ADD  CONSTRAINT [DF_WorkOrderItem_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
/****** Object:  Default [DF_WorkOrderItem_Rate]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[WorkOrderItem] ADD  CONSTRAINT [DF_WorkOrderItem_Rate]  DEFAULT ((0)) FOR [Rate]
GO
/****** Object:  Default [DF_WorkOrderItem_DateInserted]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[WorkOrderItem] ADD  CONSTRAINT [DF_WorkOrderItem_DateInserted]  DEFAULT (getdate()) FOR [DateInserted]
GO
/****** Object:  ForeignKey [FK_Product_ProductCategory]    Script Date: 01/14/2013 18:52:50 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ProductCategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
/****** Object:  ForeignKey [FK_Location_Organization]    Script Date: 01/14/2013 18:52:50 ******/
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Organization]
GO
/****** Object:  ForeignKey [FK_Lookup_LookupGroup1]    Script Date: 01/14/2013 18:52:50 ******/
ALTER TABLE [generic].[Lookup]  WITH CHECK ADD  CONSTRAINT [FK_Lookup_LookupGroup1] FOREIGN KEY([LookupGroupID])
REFERENCES [generic].[LookupGroup] ([LookupGroupID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [generic].[Lookup] CHECK CONSTRAINT [FK_Lookup_LookupGroup1]
GO
/****** Object:  ForeignKey [FK_Loan_Organization]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Organization]
GO
/****** Object:  ForeignKey [FK_AddressLocation_Address]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [generic].[AddressLocation]  WITH CHECK ADD  CONSTRAINT [FK_AddressLocation_Address] FOREIGN KEY([AddressID])
REFERENCES [generic].[Address] ([AddressID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [generic].[AddressLocation] CHECK CONSTRAINT [FK_AddressLocation_Address]
GO
/****** Object:  ForeignKey [FK_User_Organization]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Organization]
GO
/****** Object:  ForeignKey [FK_Request_Organization]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Organization]
GO
/****** Object:  ForeignKey [FK_UserNotification_User]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[UserNotification]  WITH CHECK ADD  CONSTRAINT [FK_UserNotification_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserNotification] CHECK CONSTRAINT [FK_UserNotification_User]
GO
/****** Object:  ForeignKey [FK_WorkOrder_Loan]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_Loan] FOREIGN KEY([LoanID])
REFERENCES [dbo].[Loan] ([LoanID])
GO
ALTER TABLE [dbo].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_Loan]
GO
/****** Object:  ForeignKey [FK_WorkOrder_Request]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_Request] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Request] ([RequestID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_Request]
GO
/****** Object:  ForeignKey [FK_UserAreaCoverage_User]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[UserAreaCoverage]  WITH CHECK ADD  CONSTRAINT [FK_UserAreaCoverage_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserAreaCoverage] CHECK CONSTRAINT [FK_UserAreaCoverage_User]
GO
/****** Object:  ForeignKey [FK_UserContact_User]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[UserContact]  WITH CHECK ADD  CONSTRAINT [FK_UserContact_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserContact] CHECK CONSTRAINT [FK_UserContact_User]
GO
/****** Object:  ForeignKey [FK_Mortgagor_Loan]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[Mortgagor]  WITH CHECK ADD  CONSTRAINT [FK_Mortgagor_Loan] FOREIGN KEY([LoanID])
REFERENCES [dbo].[Loan] ([LoanID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mortgagor] CHECK CONSTRAINT [FK_Mortgagor_Loan]
GO
/****** Object:  ForeignKey [FK_WorkOrderAssignment_WorkOrder]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[WorkOrderAssignment]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrderAssignment_WorkOrder] FOREIGN KEY([WorkOrderID])
REFERENCES [dbo].[WorkOrder] ([WorkOrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkOrderAssignment] CHECK CONSTRAINT [FK_WorkOrderAssignment_WorkOrder]
GO
/****** Object:  ForeignKey [FK_WorkOrderItem_Product]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[WorkOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrderItem_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[WorkOrderItem] CHECK CONSTRAINT [FK_WorkOrderItem_Product]
GO
/****** Object:  ForeignKey [FK_WorkOrderItem_WorkOrder]    Script Date: 01/14/2013 18:52:51 ******/
ALTER TABLE [dbo].[WorkOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrderItem_WorkOrder] FOREIGN KEY([WorkOrderID])
REFERENCES [dbo].[WorkOrder] ([WorkOrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkOrderItem] CHECK CONSTRAINT [FK_WorkOrderItem_WorkOrder]
GO
