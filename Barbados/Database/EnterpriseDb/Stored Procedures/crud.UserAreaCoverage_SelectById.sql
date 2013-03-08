
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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
    FROM   [organization].[UserAreaCoverage]
    WHERE  [UserAreaCoverageID] = @UserAreaCoverageID
GO
