
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [crud].[Asset_Insert]
  @OrganizationID      INT,
  @TypeID              INT,
  @AssetNumber         VARCHAR(20),
  @LoanNumber          VARCHAR(30),
  @LoanTypeID          INT,
  @MortgagorName       VARCHAR(40),
  @MortgagorPhone      VARCHAR(15),
  @HudCaseNumber       VARCHAR(20),
  @ConveyanceDate      DATETIME,
  @FirstTimeVacantDate DATETIME
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    INSERT INTO [organization].[Asset]
    (
      [OrganizationID],
      [TypeID],
      [AssetNumber],
      [LoanNumber],
      [LoanTypeID],
      [MortgagorName],
      [MortgagorPhone],
      [HudCaseNumber],
      [ConveyanceDate],
      [FirstTimeVacantDate]
    )
    VALUES
    (
      @OrganizationID,
      @TypeID,
      @AssetNumber,
      @LoanNumber,
      @LoanTypeID,
      @MortgagorName,
      @MortgagorPhone,
      @HudCaseNumber,
      @ConveyanceDate,
      @FirstTimeVacantDate
    )
    -- Begin Return Select <- do not remove
    SELECT [AssetID],
           [OrganizationID],
           [TypeID],
           [AssetNumber],
           [LoanNumber],
           [LoanTypeID],
           [MortgagorName],
           [MortgagorPhone],
           [HudCaseNumber],
           [ConveyanceDate],
           [FirstTimeVacantDate]
    FROM   [organization].[Asset]
    WHERE  [AssetID] = SCOPE_IDENTITY()

-- End Return Select <- do not remove
GO
