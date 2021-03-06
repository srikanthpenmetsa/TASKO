----------------------------------------------------------------------------------------------------------
--------------------------- All Copy Rights are reserved to Tasko.in--------------------------------------
USE [Tasko]
GO
----------------------------------------------------------------------------------------------------------

GO
CREATE TABLE [dbo].[SERVICES](
	[SERVICE_ID] Binary (16) NOT NULL ,
	[NAME] VARCHAR(MAX) NOT NULL,
	[PARENT_SERVICE_ID] Binary (16) NULL ,
    CONSTRAINT [SERVICES_PK] PRIMARY KEY CLUSTERED(SERVICE_ID))
GO

/****** Object:  ForeignKey [FK_ParentService]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[SERVICES]  WITH CHECK ADD  CONSTRAINT [PARENT_SERVICE_ID_FK] FOREIGN KEY([PARENT_SERVICE_ID])
REFERENCES [dbo].[SERVICES] ([SERVICE_ID])
GO
ALTER TABLE [dbo].[SERVICES] CHECK CONSTRAINT [PARENT_SERVICE_ID_FK]
GO

CREATE TABLE [dbo].[ORDER_STATUS](
	[ORDER_STATUS_ID] Binary(16) NOT NULL,
	[NAME] VARCHAR(MAX) NOT NULL,
    CONSTRAINT [ORDER_STATUS_PK] PRIMARY KEY CLUSTERED(ORDER_STATUS_ID))
GO
    
CREATE TABLE [dbo].[ISSUES](
	[ISSUE_ID] Binary(16) NOT NULL,
	[NAME] VARCHAR(MAX) NOT NULL,
    CONSTRAINT [ISSUES_PK] PRIMARY KEY CLUSTERED(ISSUE_ID))
GO

CREATE TABLE [dbo].[ID_PROOFS](
	[ID_PROOF_ID] Binary(16) NOT NULL,
	[NAME] VARCHAR(MAX) NOT NULL,
 CONSTRAINT [ID_PROOFS_PK] PRIMARY KEY CLUSTERED(ID_PROOF_ID))

GO

--For now I removed the VendorId column as i dont see any use case
CREATE TABLE [dbo].[VENDOR](
	[VENDOR_ID] Binary (16) NOT NULL ,
	[NAME] VARCHAR(MAX) NOT NULL,
	[MOBILE_NUMBER] [varchar](50) NOT NULL,
	[ADDRESS] VARCHAR(MAX) NOT NULL,
	[PHOTO] [image] NULL,
	[EMPLOYEE_COUNT] int NOT NULL,
	[BASE_RATE] decimal(18, 0) NOT NULL,
	[IS_VENDOR_VERIFIED] bit NOT NULL,
	[IS_VENDOR_LIVE] bit NOT NULL,
	[TIME_SPENT_ON_APP] time(7) NOT NULL,
	[ACTIVE_TIME_PER_DAY] time(7) NOT NULL,
	[DATA_CONSUMPTION] decimal(18, 0) NOT NULL,
	[CALLS_TO_CUSTOMER_CARE] int NOT NULL,
    CONSTRAINT [VENDOR_PK] PRIMARY KEY CLUSTERED(VENDOR_ID))
GO

CREATE TABLE [dbo].[VENDOR_SERVICES](
	[VENDOR_SERVICE_ID] Binary(16) NOT NULL,
	[VENDOR_ID] Binary(16) NOT NULL,
	[SERVICE_ID] Binary(16) NOT NULL,
	[IS_VENDOR_SERVICE_ACTIVE] bit NOT NULL,
    CONSTRAINT [VENDOR_SERVICES_PK] PRIMARY KEY CLUSTERED(VENDOR_SERVICE_ID))   
GO

/****** Object:  ForeignKey [VENDOR_SERVICES_SERVICES_FK]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VENDOR_SERVICES]  WITH CHECK ADD  CONSTRAINT [VENDOR_SERVICES_SERVICES_FK] FOREIGN KEY([SERVICE_ID])
REFERENCES [dbo].[SERVICES] ([SERVICE_ID])
GO
ALTER TABLE [dbo].[VENDOR_SERVICES] CHECK CONSTRAINT [VENDOR_SERVICES_SERVICES_FK]
GO

/****** Object:  ForeignKey [VENDOR_SERVICES_VENDOR_FK]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VENDOR_SERVICES]  WITH CHECK ADD  CONSTRAINT [VENDOR_SERVICES_VENDOR_FK] FOREIGN KEY([VENDOR_ID])
REFERENCES [dbo].[VENDOR] ([VENDOR_ID])
GO
ALTER TABLE [dbo].[VENDOR_SERVICES] CHECK CONSTRAINT [VENDOR_SERVICES_VENDOR_FK]
GO

CREATE TABLE [dbo].[VENDOR_PROOF](
	[VENDOR_PROOF_ID] Binary(16) NOT NULL,
	[VENDOR_ID] Binary(16) NOT NULL,
	[ID_PROOF_ID] Binary(16) NOT NULL,
	[PROOF] VARCHAR(MAX) NOT NULL,
    CONSTRAINT [VENDOR_PROOF_PK] PRIMARY KEY CLUSTERED(VENDOR_PROOF_ID))
GO

/****** Object:  ForeignKey [VENDOR_PROOF_ID_PROOFS_FK]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VENDOR_PROOF]  WITH CHECK ADD  CONSTRAINT [VENDOR_PROOF_ID_PROOFS_FK] FOREIGN KEY([ID_PROOF_ID])
REFERENCES [dbo].[ID_PROOFS] ([ID_PROOF_ID])
GO
ALTER TABLE [dbo].[VENDOR_PROOF] CHECK CONSTRAINT [VENDOR_PROOF_ID_PROOFS_FK]
GO

/****** Object:  ForeignKey [VENDOR_PROOF_VENDOR_FK]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VENDOR_PROOF]  WITH CHECK ADD  CONSTRAINT [VENDOR_PROOF_VENDOR_FK] FOREIGN KEY([VENDOR_ID])
REFERENCES [dbo].[VENDOR] ([VENDOR_ID])
GO
ALTER TABLE [dbo].[VENDOR_PROOF] CHECK CONSTRAINT [VENDOR_PROOF_VENDOR_FK]
GO

CREATE TABLE [dbo].[VENDOR_ISSUES](
	[VENDOR_ISSUE_ID] Binary(16) NOT NULL,
	[VENDOR_ID] Binary(16) NOT NULL,
	[CUSTOMER_ID] Binary(16) NOT NULL,
	[ISSUE_ID] Binary(16) NOT NULL,
	[COMMENTS] VARCHAR(MAX) NULL,
    CONSTRAINT [VENDOR_ISSUES_PK] PRIMARY KEY CLUSTERED(VENDOR_ISSUE_ID))
GO

/****** Object:  ForeignKey [VENDOR_ISSUES_ISSUES_FK]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VENDOR_ISSUES]  WITH CHECK ADD  CONSTRAINT [VENDOR_ISSUES_ISSUES_FK] FOREIGN KEY([ISSUE_ID])
REFERENCES [dbo].[ISSUES] ([ISSUE_ID])
GO
ALTER TABLE [dbo].[VENDOR_ISSUES] CHECK CONSTRAINT [VENDOR_ISSUES_ISSUES_FK]
GO

/****** Object:  ForeignKey [VENDOR_ISSUES_VENDOR_FK]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VENDOR_ISSUES]  WITH CHECK ADD  CONSTRAINT [VENDOR_ISSUES_VENDOR_FK] FOREIGN KEY([VENDOR_ID])
REFERENCES [dbo].[VENDOR] ([VENDOR_ID])
GO
ALTER TABLE [dbo].[VENDOR_ISSUES] CHECK CONSTRAINT [VENDOR_ISSUES_VENDOR_FK]
GO

CREATE TABLE [dbo].[CUSTOMER](
	[CUSTOMER_ID] Binary(16) NOT NULL,
	[NAME] VARCHAR(MAX) NOT NULL,
	[EMAIL_ADDRESS] VARCHAR(MAX) NOT NULL,
	[MOBILE_NUMBER] VARCHAR(MAX) NOT NULL,
 CONSTRAINT [CUSTOMER_PK] PRIMARY KEY CLUSTERED(CUSTOMER_ID))
 
GO

CREATE TABLE [dbo].[ORDER](
	[ORDER_ID] VARCHAR(50) NOT NULL,
	[VENDOR_SERVICE_ID] Binary(16) NOT NULL,
	[CUSTOMER_ID] Binary(16) NOT NULL,
	[REQUESTED_DATE] datetime NOT NULL,
	[ORDER_STATUS_ID] Binary(16) NOT NULL,
	[ORDER_LOCATION] VARCHAR(MAX) NULL,
    CONSTRAINT [ORDER_PK] PRIMARY KEY CLUSTERED([ORDER_ID]))
GO

/****** Object:  ForeignKey [FK_Order_OrderStatus]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [ORDER_ORDER_STATUS_FK] FOREIGN KEY([ORDER_STATUS_ID])
REFERENCES [dbo].[ORDER_STATUS] ([ORDER_STATUS_ID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [ORDER_ORDER_STATUS_FK]
GO

/****** Object:  ForeignKey [ORDER_CUSTOMER_FK]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [ORDER_CUSTOMER_FK] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [dbo].[CUSTOMER] ([CUSTOMER_ID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [ORDER_CUSTOMER_FK]
GO

/****** Object:  ForeignKey [ORDER_VENDOR_SERVICES_FK]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [ORDER_VENDOR_SERVICES_FK] FOREIGN KEY([VENDOR_SERVICE_ID])
REFERENCES [dbo].[VENDOR_SERVICES] ([VENDOR_SERVICE_ID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [ORDER_VENDOR_SERVICES_FK]
GO

CREATE TABLE [dbo].[VENDOR_RATING](
	[VENDOR_RATING_ID] Binary(16) NOT NULL,
	[SERVICE_QUALITY] decimal(18, 2) NOT NULL,
	[PUNCTUALITY] decimal(18, 2) NOT NULL,
	[COURTESY] decimal(18, 2) NOT NULL,
	[PRICE] decimal(18, 2) NOT NULL,
	[REVIEW_DATE] datetime NOT NULL,
	[COMMENTS] VARCHAR(MAX) NULL,
	[ORDER_ID] VARCHAR(50) NOT NULL,
    CONSTRAINT [VENDOR_RATING_PK] PRIMARY KEY CLUSTERED(VENDOR_RATING_ID))
GO

/****** Object:  ForeignKey [VENDOR_RATING_ORDER_FK]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VENDOR_RATING]  WITH CHECK ADD  CONSTRAINT [VENDOR_RATING_ORDER_FK] FOREIGN KEY([ORDER_ID])
REFERENCES [dbo].[ORDER] ([ORDER_ID])
GO
ALTER TABLE [dbo].[VENDOR_RATING] CHECK CONSTRAINT [VENDOR_RATING_ORDER_FK]
GO

CREATE TABLE [dbo].[CUSTOMER_RATING](
	[CUSTOMER_RATING_ID] Binary(16) NOT NULL,
	[ORDER_ID] VARCHAR(50) NOT NULL,
	[RATING] decimal(18, 2) NOT NULL,
	[COMMENTS] VARCHAR(MAX) NULL,
 CONSTRAINT [CUSTOMER_RATING_PK] PRIMARY KEY CLUSTERED(CUSTOMER_RATING_ID))

GO

/****** Object:  ForeignKey [CUSTOMER_RATING_ORDER_FK]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[CUSTOMER_RATING]  WITH CHECK ADD  CONSTRAINT [CUSTOMER_RATING_ORDER_FK] FOREIGN KEY([ORDER_ID])
REFERENCES [dbo].[ORDER] ([ORDER_ID])
GO
ALTER TABLE [dbo].[CUSTOMER_RATING] CHECK CONSTRAINT [CUSTOMER_RATING_ORDER_FK]
GO

/*********** Functions **************************/
CREATE FUNCTION dbo.GenerateOrderID()
RETURNS VARCHAR(MAX) 
AS 
-- Returns the New Order ID
BEGIN
    DECLARE @ORDER_ID VARCHAR(MAX);
    DECLARE @START_INDEX_ORDER_ID int;
    SET @START_INDEX_ORDER_ID = 1000;
    DECLARE @ORDER_COUNT int;
    
    SELECT @ORDER_COUNT = Count(*) FROM dbo.[ORDER]
    
    IF(@ORDER_COUNT > 0)
      BEGIN
         SET @ORDER_ID = 'TASKO' + CONVERT(varchar, @START_INDEX_ORDER_ID + @ORDER_COUNT)
      END
    ELSE 
      BEGIN
         SET @ORDER_ID = 'TASKO' + CONVERT(varchar, @START_INDEX_ORDER_ID)
      END 
      
    RETURN @ORDER_ID;
END;
GO

/*********** Stored Procedures **************************/
CREATE PROCEDURE [dbo].[usp_GetVendorDetails]
(
	@pVendorId Binary(16)
)
AS
BEGIN

SET NOCOUNT ON;

SELECT VENDOR_ID, NAME,MOBILE_NUMBER FROM VENDOR (NOLOCK)
WHERE VENDOR_ID = @pVendorId 

END

GO
CREATE PROCEDURE [dbo].[usp_GetOrderDetails]
(
	@pOrderId Varchar(50)
)
AS
BEGIN

SET NOCOUNT ON;

SELECT ORDER_ID, VENDOR_SERVICE_ID,CUSTOMER_ID FROM [ORDER] (NOLOCK)
WHERE ORDER_ID = @pOrderId 

END
