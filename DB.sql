USE [master]
GO
/****** Object:  Database [TASKO]    Script Date: 05/12/2016 08:57:09 ******/
CREATE DATABASE [TASKO] ON  PRIMARY 
( NAME = N'TASKO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TASKO.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TASKO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TASKO_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TASKO] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TASKO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TASKO] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TASKO] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TASKO] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TASKO] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TASKO] SET ARITHABORT OFF
GO
ALTER DATABASE [TASKO] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TASKO] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TASKO] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TASKO] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TASKO] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TASKO] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TASKO] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TASKO] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TASKO] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TASKO] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TASKO] SET  DISABLE_BROKER
GO
ALTER DATABASE [TASKO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TASKO] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TASKO] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TASKO] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TASKO] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TASKO] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TASKO] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TASKO] SET  READ_WRITE
GO
ALTER DATABASE [TASKO] SET RECOVERY FULL
GO
ALTER DATABASE [TASKO] SET  MULTI_USER
GO
ALTER DATABASE [TASKO] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TASKO] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'TASKO', N'ON'
GO
USE [TASKO]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 05/12/2016 08:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendor](
	[Id] [binary](16) NOT NULL,
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
	[Id] ASC
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
	[Id] [binary](16) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[ParentService] [binary](16) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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
	[Id] [binary](16) NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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
	[Id] [binary](16) NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Issues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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
	[Id] [binary](16) NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_IdProofs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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
	[Id] [binary](16) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[EmailAddress] [varchar](max) NOT NULL,
	[MobileNumber] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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
	[Id] [binary](16) NOT NULL,
	[VendorId] [binary](16) NOT NULL,
	[ServiceId] [binary](16) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_VendorServices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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
	[Id] [binary](16) NOT NULL,
	[VendorId] [binary](16) NOT NULL,
	[ProofId] [binary](16) NOT NULL,
	[Proof] [varchar](max) NOT NULL,
 CONSTRAINT [PK_VendorProof] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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
	[Id] [binary](16) NOT NULL,
	[VendorId] [binary](16) NOT NULL,
	[CustomerId] [binary](16) NOT NULL,
	[IssueId] [binary](16) NOT NULL,
	[Comments] [varchar](max) NULL,
 CONSTRAINT [PK_VendorIssues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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
	[Id] [binary](16) NOT NULL,
	[VendorServiceId] [binary](16) NOT NULL,
	[CustomerId] [binary](16) NOT NULL,
	[RequestedDate] [datetime] NOT NULL,
	[Status] [binary](16) NOT NULL,
	[OrderLocation] [varchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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
	[Id] [binary](16) NOT NULL,
	[ServiceQuality] [decimal](18, 2) NOT NULL,
	[Punctuality] [decimal](18, 2) NOT NULL,
	[Courtesy] [decimal](18, 2) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ReviewDate] [datetime] NOT NULL,
	[Comments] [varchar](max) NULL,
	[OrderId] [binary](16) NOT NULL,
 CONSTRAINT [PK_VendorRating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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
	[Id] [binary](16) NOT NULL,
	[OrderId] [binary](16) NOT NULL,
	[Rating] [decimal](18, 2) NOT NULL,
	[Comment] [varchar](max) NULL,
 CONSTRAINT [PK_CustomerRating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_ParentService]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_ParentService] FOREIGN KEY([ParentService])
REFERENCES [dbo].[Services] ([Id])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_ParentService]
GO
/****** Object:  ForeignKey [FK_ServiceId]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorServices]  WITH CHECK ADD  CONSTRAINT [FK_ServiceId] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([Id])
GO
ALTER TABLE [dbo].[VendorServices] CHECK CONSTRAINT [FK_ServiceId]
GO
/****** Object:  ForeignKey [FK_VendorId]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorServices]  WITH CHECK ADD  CONSTRAINT [FK_VendorId] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[VendorServices] CHECK CONSTRAINT [FK_VendorId]
GO
/****** Object:  ForeignKey [FK_IdProof]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorProof]  WITH CHECK ADD  CONSTRAINT [FK_IdProof] FOREIGN KEY([ProofId])
REFERENCES [dbo].[IdProofs] ([Id])
GO
ALTER TABLE [dbo].[VendorProof] CHECK CONSTRAINT [FK_IdProof]
GO
/****** Object:  ForeignKey [FK_ProofVendor]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorProof]  WITH CHECK ADD  CONSTRAINT [FK_ProofVendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[VendorProof] CHECK CONSTRAINT [FK_ProofVendor]
GO
/****** Object:  ForeignKey [FK_VendorIssues_Issues]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorIssues]  WITH CHECK ADD  CONSTRAINT [FK_VendorIssues_Issues] FOREIGN KEY([IssueId])
REFERENCES [dbo].[Issues] ([Id])
GO
ALTER TABLE [dbo].[VendorIssues] CHECK CONSTRAINT [FK_VendorIssues_Issues]
GO
/****** Object:  ForeignKey [FK_VendorIssues_Vendor]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorIssues]  WITH CHECK ADD  CONSTRAINT [FK_VendorIssues_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[VendorIssues] CHECK CONSTRAINT [FK_VendorIssues_Vendor]
GO
/****** Object:  ForeignKey [FK_Order_Customer]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
/****** Object:  ForeignKey [FK_Order_OrderStatus]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
/****** Object:  ForeignKey [FK_Order_VendorServices]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_VendorServices] FOREIGN KEY([VendorServiceId])
REFERENCES [dbo].[VendorServices] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_VendorServices]
GO
/****** Object:  ForeignKey [FK_VendorRating_Order]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[VendorRating]  WITH CHECK ADD  CONSTRAINT [FK_VendorRating_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[VendorRating] CHECK CONSTRAINT [FK_VendorRating_Order]
GO
/****** Object:  ForeignKey [FK_CustomerRating_Order]    Script Date: 05/12/2016 08:57:10 ******/
ALTER TABLE [dbo].[CustomerRating]  WITH CHECK ADD  CONSTRAINT [FK_CustomerRating_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[CustomerRating] CHECK CONSTRAINT [FK_CustomerRating_Order]
GO
