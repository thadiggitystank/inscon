SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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