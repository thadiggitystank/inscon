SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [crud].[Product_SelectByCategoryId]
  @ProductCategorytID INT
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
    WHERE  [ProductCategoryID] = @ProductCategorytID

GO