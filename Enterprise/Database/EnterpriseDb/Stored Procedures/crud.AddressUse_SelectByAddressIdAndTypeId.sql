SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [crud].[AddressUse_SelectByAddressIdAndTypeId]
  @AddressID INT,
  @TypeID INT
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    SELECT [AddressUserID],
           [AddressID],
           [TypeID]
    FROM   [generic].[AddressUse]
    WHERE  [AddressID] = @AddressID AND [TypeID] = @TypeID

GO
