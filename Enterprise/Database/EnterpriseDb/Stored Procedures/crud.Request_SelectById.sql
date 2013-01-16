SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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
