USE [Tasko]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendor](
	[Vendor_Id] [binary](16) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[VendorId] [int] NULL,
	[MobileNumber] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Photo] [image] NULL,
	[EmployeeCount] [int] NOT NULL,
	[BaseRate] [decimal](18, 0) NOT NULL,
	[IsVerified] [bit] NOT NULL,
	[IsLive] [bit] NOT NULL,
	[TimeSpentOnApp] [time](7) NOT NULL,
	[ActiveTimePerDay] [time](7) NOT NULL,
	[DataConsumption] [decimal](18, 0) NOT NULL,
	[CallsToCustomerCare] [int] NOT NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[Vendor_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Services]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Services](
	[Service_Id] [binary](16) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[ParentService] [binary](16) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Service_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatus_Id] [binary](16) NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatus_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Issues]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Issues](
	[Issues_Id] [binary](16) NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Issues] PRIMARY KEY CLUSTERED 
(
	[Issues_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IdProofs]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IdProofs](
	[IdProofs_Id] [binary](16) NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_IdProofs] PRIMARY KEY CLUSTERED 
(
	[IdProofs_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_Id] [binary](16) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[EmailAddress] [varchar](max) NOT NULL,
	[MobileNumber] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VendorServices]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VendorServices](
	[VendorServices_Id] [binary](16) NOT NULL,
	[VendorId] [binary](16) NOT NULL,
	[ServiceId] [binary](16) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_VendorServices] PRIMARY KEY CLUSTERED 
(
	[VendorServices_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VendorProof]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VendorProof](
	[VendorProof_Id] [binary](16) NOT NULL,
	[VendorId] [binary](16) NOT NULL,
	[ProofId] [binary](16) NOT NULL,
	[Proof] [varchar](max) NOT NULL,
 CONSTRAINT [PK_VendorProof] PRIMARY KEY CLUSTERED 
(
	[VendorProof_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VendorIssues]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VendorIssues](
	[VendorIssues_Id] [binary](16) NOT NULL,
	[VendorId] [binary](16) NOT NULL,
	[CustomerId] [binary](16) NOT NULL,
	[IssueId] [binary](16) NOT NULL,
	[Comments] [varchar](max) NULL,
 CONSTRAINT [PK_VendorIssues] PRIMARY KEY CLUSTERED 
(
	[VendorIssues_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[Order_Id] [binary](16) NOT NULL,
	[VendorServiceId] [binary](16) NOT NULL,
	[CustomerId] [binary](16) NOT NULL,
	[RequestedDate] [datetime] NOT NULL,
	[Status] [binary](16) NOT NULL,
	[OrderLocation] [varchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VendorRating]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VendorRating](
	[VendorRating_Id] [binary](16) NOT NULL,
	[ServiceQuality] [decimal](18, 2) NOT NULL,
	[Punctuality] [decimal](18, 2) NOT NULL,
	[Courtesy] [decimal](18, 2) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ReviewDate] [datetime] NOT NULL,
	[Comments] [varchar](max) NULL,
	[OrderId] [binary](16) NOT NULL,
 CONSTRAINT [PK_VendorRating] PRIMARY KEY CLUSTERED 
(
	[VendorRating_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerRating]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerRating](
	[CustomerRating_Id] [binary](16) NOT NULL,
	[OrderId] [binary](16) NOT NULL,
	[Rating] [decimal](18, 2) NOT NULL,
	[Comment] [varchar](max) NULL,
 CONSTRAINT [PK_CustomerRating] PRIMARY KEY CLUSTERED 
(
	[CustomerRating_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_ParentService]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_ParentService] FOREIGN KEY([ParentService])
REFERENCES [dbo].[Services] ([Service_Id])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_ParentService]
GO
/****** Object:  ForeignKey [FK_ServiceId]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorServices]  WITH CHECK ADD  CONSTRAINT [FK_ServiceId] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([Service_Id])
GO
ALTER TABLE [dbo].[VendorServices] CHECK CONSTRAINT [FK_ServiceId]
GO
/****** Object:  ForeignKey [FK_VendorId]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorServices]  WITH CHECK ADD  CONSTRAINT [FK_VendorId] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Vendor_Id])
GO
ALTER TABLE [dbo].[VendorServices] CHECK CONSTRAINT [FK_VendorId]
GO
/****** Object:  ForeignKey [FK_IdProof]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorProof]  WITH CHECK ADD  CONSTRAINT [FK_IdProof] FOREIGN KEY([ProofId])
REFERENCES [dbo].[IdProofs] ([IdProofs_Id])
GO
ALTER TABLE [dbo].[VendorProof] CHECK CONSTRAINT [FK_IdProof]
GO
/****** Object:  ForeignKey [FK_ProofVendor]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorProof]  WITH CHECK ADD  CONSTRAINT [FK_ProofVendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Vendor_Id])
GO
ALTER TABLE [dbo].[VendorProof] CHECK CONSTRAINT [FK_ProofVendor]
GO
/****** Object:  ForeignKey [FK_VendorIssues_Issues]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorIssues]  WITH CHECK ADD  CONSTRAINT [FK_VendorIssues_Issues] FOREIGN KEY([IssueId])
REFERENCES [dbo].[Issues] ([Issues_Id])
GO
ALTER TABLE [dbo].[VendorIssues] CHECK CONSTRAINT [FK_VendorIssues_Issues]
GO
/****** Object:  ForeignKey [FK_VendorIssues_Vendor]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorIssues]  WITH CHECK ADD  CONSTRAINT [FK_VendorIssues_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Vendor_Id])
GO
ALTER TABLE [dbo].[VendorIssues] CHECK CONSTRAINT [FK_VendorIssues_Vendor]
GO
/****** Object:  ForeignKey [FK_Order_Customer]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Customer_Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
/****** Object:  ForeignKey [FK_Order_OrderStatus]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[OrderStatus] ([OrderStatus_Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
/****** Object:  ForeignKey [FK_Order_VendorServices]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_VendorServices] FOREIGN KEY([VendorServiceId])
REFERENCES [dbo].[VendorServices] ([VendorServices_Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_VendorServices]
GO
/****** Object:  ForeignKey [FK_VendorRating_Order]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorRating]  WITH CHECK ADD  CONSTRAINT [FK_VendorRating_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Order_Id])
GO
ALTER TABLE [dbo].[VendorRating] CHECK CONSTRAINT [FK_VendorRating_Order]
GO
/****** Object:  ForeignKey [FK_CustomerRating_Order]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[CustomerRating]  WITH CHECK ADD  CONSTRAINT [FK_CustomerRating_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Order_Id])
GO
ALTER TABLE [dbo].[CustomerRating] CHECK CONSTRAINT [FK_CustomerRating_Order]
GO
