USE [master]
GO
/****** Object:  Database [Rekurrens]    Script Date: 2025-05-06 19:14:24 ******/
CREATE DATABASE [Rekurrens]
GO
ALTER DATABASE [Rekurrens] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rekurrens].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rekurrens] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rekurrens] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rekurrens] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rekurrens] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rekurrens] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rekurrens] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Rekurrens] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rekurrens] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rekurrens] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rekurrens] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rekurrens] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rekurrens] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rekurrens] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rekurrens] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rekurrens] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Rekurrens] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rekurrens] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rekurrens] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rekurrens] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rekurrens] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rekurrens] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Rekurrens] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rekurrens] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Rekurrens] SET  MULTI_USER 
GO
ALTER DATABASE [Rekurrens] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rekurrens] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rekurrens] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rekurrens] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Rekurrens] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Rekurrens] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Rekurrens] SET QUERY_STORE = OFF
GO
USE [Rekurrens]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[TenantID] [uniqueidentifier] NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[OrganizationNumber] [nvarchar](11) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](15) NOT NULL,
	[ContactPerson] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](18) NOT NULL,
	[Type] [nvarchar](30) NOT NULL,
	[LogoURL] [nvarchar](100) NOT NULL,
	[Website] [nvarchar](100) NOT NULL,
	[CustomerNumber] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[TenantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyConfigSettings]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyConfigSettings](
	[SettingsId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyPercentage] [decimal](18, 2) NULL,
	[TenantID_FK] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanyConfigSettings] PRIMARY KEY CLUSTERED 
(
	[SettingsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerOrder]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerOrder](
	[CustomerOrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID_FK] [uniqueidentifier] NOT NULL,
	[CustomerID_FK] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CustomerOrder] PRIMARY KEY CLUSTERED 
(
	[CustomerOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [uniqueidentifier] NOT NULL,
	[TenantID_FK] [uniqueidentifier] NOT NULL,
	[StripeCustomerID] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[EmailAdress] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](18) NOT NULL,
	[Adress] [nvarchar](100) NOT NULL,
	[isArchived] [bit] NOT NULL,
	[ActiveCustomer] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnboardingCompanies]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnboardingCompanies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[ContactEmail] [nvarchar](max) NOT NULL,
	[ContactPhone] [nvarchar](max) NOT NULL,
	[SubscriptionLevel] [int] NOT NULL,
	[PrimaryColor] [nvarchar](10) NOT NULL,
	[SecondaryColor] [nvarchar](10) NOT NULL,
	[TertiaryColor] [nvarchar](10) NOT NULL,
	[PercentageSubscription] [bit] NOT NULL,
	[CompanyLogo] [nvarchar](max) NOT NULL,
	[CompanyName] [nvarchar](max) NOT NULL,
	[TenantID_FK] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_OnboardingCompanies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[PaymentId] [uniqueidentifier] NOT NULL,
	[StripePaymentIntentID] [nvarchar](max) NULL,
	[StripeChargeID] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NOT NULL,
	[Amount] [bigint] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[TenantID_FK] [uniqueidentifier] NOT NULL,
	[UserID_FK] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[StripePaymentMethodID] [nvarchar](450) NOT NULL,
	[TenantID_FK] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[StripePaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[PermissionID] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPrice](
	[ProductPriceID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID_FK] [int] NOT NULL,
	[TenantID_FK] [uniqueidentifier] NOT NULL,
	[StripePriceID] [nvarchar](max) NULL,
	[Interval] [nvarchar](max) NOT NULL,
	[Amount] [bigint] NOT NULL,
	[Currency] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProductPrice] PRIMARY KEY CLUSTERED 
(
	[ProductPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[StripeProductID] [nvarchar](max) NULL,
	[Description] [nvarchar](200) NOT NULL,
	[TenantID_FK] [uniqueidentifier] NOT NULL,
	[ThirdPartyLink] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[Id] [uniqueidentifier] NOT NULL,
	[Token] [nvarchar](max) NOT NULL,
	[UserId_FK] [uniqueidentifier] NOT NULL,
	[TokenExpires] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RefreshTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RolePermissionsID] [uniqueidentifier] NOT NULL,
	[RoleID] [uniqueidentifier] NOT NULL,
	[PermissionID] [uniqueidentifier] NOT NULL,
	[Allowed] [bit] NOT NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[RolePermissionsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](25) NOT NULL,
	[TenantID_FK] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StripeCompanyTokens]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StripeCompanyTokens](
	[StripeCompanyTokenId] [int] IDENTITY(1,1) NOT NULL,
	[TenantID_FK] [uniqueidentifier] NOT NULL,
	[StripeUserId] [nvarchar](max) NOT NULL,
	[AcessToken] [nvarchar](max) NOT NULL,
	[Scope] [nvarchar](max) NOT NULL,
	[RefreshToken] [nvarchar](max) NULL,
	[TokenType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_StripeCompanyTokens] PRIMARY KEY CLUSTERED 
(
	[StripeCompanyTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StripeEventLogs]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StripeEventLogs](
	[EventID] [uniqueidentifier] NOT NULL,
	[StripeEventID] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[PayloadJson] [nvarchar](max) NOT NULL,
	[ReceivedAt] [datetime2](7) NOT NULL,
	[TenantID_FK] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_StripeEventLogs] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StripePayments]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StripePayments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StripeSessionId] [nvarchar](max) NOT NULL,
	[OrderId] [nvarchar](max) NOT NULL,
	[Company] [nvarchar](max) NOT NULL,
	[AmountTotal] [bigint] NOT NULL,
	[Currency] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CustomerEmail] [nvarchar](max) NOT NULL,
	[PaymentStatus] [nvarchar](max) NOT NULL,
	[PaymentIntentId] [nvarchar](max) NOT NULL,
	[ReceiptUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_StripePayments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StripeSubscriptions]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StripeSubscriptions](
	[SubscriptionID] [uniqueidentifier] NOT NULL,
	[StripeSubscriptionID] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NOT NULL,
	[CurrentPeriodEnd] [datetime2](7) NOT NULL,
	[Plan] [nvarchar](max) NOT NULL,
	[UserID_FK] [uniqueidentifier] NOT NULL,
	[TenantID_FK] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_StripeSubscriptions] PRIMARY KEY CLUSTERED 
(
	[SubscriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StripeWebhookEvents]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StripeWebhookEvents](
	[WebhookID] [int] IDENTITY(1,1) NOT NULL,
	[StripeEventID] [nvarchar](64) NOT NULL,
	[Type] [nvarchar](64) NOT NULL,
	[ReceivedAt] [datetime2](7) NOT NULL,
	[Processed] [bit] NOT NULL,
	[Payload] [text] NULL,
	[StripeCustomerID] [nvarchar](64) NULL,
	[SubscriptionID] [nvarchar](64) NULL,
	[ErrorMessage] [nvarchar](400) NULL,
	[ProcessedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_StripeWebhookEvents] PRIMARY KEY CLUSTERED 
(
	[WebhookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2025-05-06 19:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](max) NOT NULL,
	[IsHost] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[DescriptiveRole] [nvarchar](50) NOT NULL,
	[FailedLoginAttempts] [int] NOT NULL,
	[LockoutEndTime] [datetime2](7) NULL,
	[TenantID_FK] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250430133257_newdb', N'9.0.3')
GO
INSERT [dbo].[Companies] ([TenantID], [CompanyName], [OrganizationNumber], [City], [Address], [PostalCode], [ContactPerson], [PhoneNumber], [Type], [LogoURL], [Website], [CustomerNumber], [Status]) VALUES (N'f8a8a7a6-4caa-4a42-a0a1-590c53f7d6a6', N'Börjes bil', N'123456789', N'Stockholm', N'Testgatan 1', N'12345', N'Börje Testsson', N'070-1122333', N'Bronze', N'http://test.se', N'http://website.se', N'123456789', 1)
INSERT [dbo].[Companies] ([TenantID], [CompanyName], [OrganizationNumber], [City], [Address], [PostalCode], [ContactPerson], [PhoneNumber], [Type], [LogoURL], [Website], [CustomerNumber], [Status]) VALUES (N'355d2919-9e8b-4f1c-b309-5f15fa2c9dd8', N'Bengts bil', N'1234567839', N'Stockholm', N'Testgatan 3', N'12345', N'Bengt Testsson', N'070-4455666', N'Silver', N'http://testbengt.se', N'http://websitebengt.se', N'1234567839', 1)
INSERT [dbo].[Companies] ([TenantID], [CompanyName], [OrganizationNumber], [City], [Address], [PostalCode], [ContactPerson], [PhoneNumber], [Type], [LogoURL], [Website], [CustomerNumber], [Status]) VALUES (N'a513cf6d-1d68-4413-84e1-66eb7d5b0777', N'Gunnars bil', N'1323456789', N'Stockholm', N'Testgatan 3', N'12245', N'Gunnar Testsson', N'070-3344555', N'Guld', N'http://testGunnar.se', N'http://websiteGunnar.se', N'1243456789', 1)
GO
SET IDENTITY_INSERT [dbo].[CompanyConfigSettings] ON 

INSERT [dbo].[CompanyConfigSettings] ([SettingsId], [CompanyPercentage], [TenantID_FK]) VALUES (1, CAST(4.67 AS Decimal(18, 2)), N'355d2919-9e8b-4f1c-b309-5f15fa2c9dd8')
SET IDENTITY_INSERT [dbo].[CompanyConfigSettings] OFF
GO
INSERT [dbo].[Customers] ([CustomerID], [TenantID_FK], [StripeCustomerID], [Name], [EmailAdress], [PhoneNumber], [Adress], [isArchived], [ActiveCustomer]) VALUES (N'355d2919-9e8b-4f1c-b309-5f15fa2c9de3', N'a513cf6d-1d68-4413-84e1-66eb7d5b0777', N'cus_123456789', N'Test Customer Oliver', N'johndoe@example.com', N'+1234567890', N'Arboga', 0, 0)
INSERT [dbo].[Customers] ([CustomerID], [TenantID_FK], [StripeCustomerID], [Name], [EmailAdress], [PhoneNumber], [Adress], [isArchived], [ActiveCustomer]) VALUES (N'355d2919-9e8b-4f1c-b309-5f15fa2c9de6', N'f8a8a7a6-4caa-4a42-a0a1-590c53f7d6a6', N'cus_123456789', N'Test Customer Sven', N'johndoe@example.com', N'+1234567890', N'Stockholm', 0, 0)
INSERT [dbo].[Customers] ([CustomerID], [TenantID_FK], [StripeCustomerID], [Name], [EmailAdress], [PhoneNumber], [Adress], [isArchived], [ActiveCustomer]) VALUES (N'355d2919-9e8b-4f1c-b309-5f15fa2c9df3', N'355d2919-9e8b-4f1c-b309-5f15fa2c9dd8', N'cus_123456789', N'Test Customer Olle', N'johndoe@example.com', N'+1234567890', N'Västerås', 0, 0)
GO
INSERT [dbo].[Orders] ([PaymentId], [StripePaymentIntentID], [StripeChargeID], [Status], [Amount], [CreatedAt], [TenantID_FK], [UserID_FK]) VALUES (N'cefe967e-915f-4b06-a310-036479f1c163', N'cs_test_a110RGByE3NbtesTHRvT0a2Nr9VWliQQPjHvzmneuTrfBMjZxzmo5aEdIL', NULL, N'Pending', 0, CAST(N'2025-05-02T12:17:49.6349590' AS DateTime2), N'355d2919-9e8b-4f1c-b309-5f15fa2c9dd8', N'eb559178-d563-477b-8d3a-4013708a7be4')
INSERT [dbo].[Orders] ([PaymentId], [StripePaymentIntentID], [StripeChargeID], [Status], [Amount], [CreatedAt], [TenantID_FK], [UserID_FK]) VALUES (N'753ac63f-44fc-4d27-886e-199125c25cf1', N'cs_test_a1uJHk3MIuoWTz3tZ8bpf1zPWm4zRS7vZZIAvBqTX1YPVPlT6ZRLHz09Bf', NULL, N'Pending', 0, CAST(N'2025-05-02T13:21:49.7129122' AS DateTime2), N'355d2919-9e8b-4f1c-b309-5f15fa2c9dd8', N'eb559178-d563-477b-8d3a-4013708a7be4')
INSERT [dbo].[Orders] ([PaymentId], [StripePaymentIntentID], [StripeChargeID], [Status], [Amount], [CreatedAt], [TenantID_FK], [UserID_FK]) VALUES (N'689eb90a-53be-4c37-b812-644f09ded0cd', N'cs_test_a1M17RXzsGVgxh42LxmH0aEauO7nrtY95bBJRoLFAAHiftlDZiymv8xfmh', NULL, N'Pending', 0, CAST(N'2025-04-30T13:48:28.7210933' AS DateTime2), N'355d2919-9e8b-4f1c-b309-5f15fa2c9dd8', N'eb559178-d563-477b-8d3a-4013708a7be4')
GO
SET IDENTITY_INSERT [dbo].[ProductPrice] ON 

INSERT [dbo].[ProductPrice] ([ProductPriceID], [ProductID_FK], [TenantID_FK], [StripePriceID], [Interval], [Amount], [Currency], [IsActive]) VALUES (1, 1, N'355d2919-9e8b-4f1c-b309-5f15fa2c9dd8', N'price_1RIsXEA3GQtkxKNo8nNmlHjc', N'one.time', 9999, N'sek', 1)
SET IDENTITY_INSERT [dbo].[ProductPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [IsActive], [StripeProductID], [Description], [TenantID_FK], [ThirdPartyLink]) VALUES (1, N'simons tvätt', 1, N'prod_SDJ9fqKzgVKPlk', N'simons tvätt', N'355d2919-9e8b-4f1c-b309-5f15fa2c9dd8', NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[RefreshTokens] ([Id], [Token], [UserId_FK], [TokenExpires]) VALUES (N'8a287bed-6500-4d5c-8014-273170063e1e', N'+QB0Fkd7t8XZHWRhL/ZJN23sF/yE3kQjZb7/KLTkfuU=', N'eb559178-d563-477b-8d3a-4013708a7be4', CAST(N'2025-05-03T12:19:20.0159704' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Token], [UserId_FK], [TokenExpires]) VALUES (N'79ee4f9b-ba2a-4b55-ac60-3ac5c4de7233', N'FeUSqUfUpLCI7SgBwPHt9XryREK8JtzgeOgcI9k/LK8=', N'eb559178-d563-477b-8d3a-4013708a7be4', CAST(N'2025-05-03T12:27:17.0888736' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Token], [UserId_FK], [TokenExpires]) VALUES (N'9d32ebdc-7cbe-4e83-9fc6-5f3c0a4af23a', N'X9hIBin5BicRdGo5/GJJtvV3OyayB87gQ8nF0f3frX4=', N'eb559178-d563-477b-8d3a-4013708a7be4', CAST(N'2025-05-01T13:39:30.7886425' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Token], [UserId_FK], [TokenExpires]) VALUES (N'e3c2105f-1909-40fc-8d75-6f8370167919', N'9/42HhantmUH5wRleRG9nlf7Mgc4J3yjVYTLIdoOZAo=', N'eb559178-d563-477b-8d3a-4013708a7be4', CAST(N'2025-05-06T09:42:40.4675284' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Token], [UserId_FK], [TokenExpires]) VALUES (N'f679ab1d-414f-49c2-962a-a591d660f022', N'vQoTf7cvzsdaw/Yw/U6kDZmVoCcMP9sF+utzs9ooqBU=', N'eb559178-d563-477b-8d3a-4013708a7be4', CAST(N'2025-05-03T11:53:07.0522173' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [Token], [UserId_FK], [TokenExpires]) VALUES (N'7f159d47-a87f-4fc9-a6df-d9e08295ceb5', N'p3+E9+TSGAoyCrAxOdaYjXs+UTJyeYNdF0qmXu8bHhY=', N'eb559178-d563-477b-8d3a-4013708a7be4', CAST(N'2025-05-06T11:47:02.4188543' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[StripeCompanyTokens] ON 

INSERT [dbo].[StripeCompanyTokens] ([StripeCompanyTokenId], [TenantID_FK], [StripeUserId], [AcessToken], [Scope], [RefreshToken], [TokenType]) VALUES (2, N'355d2919-9e8b-4f1c-b309-5f15fa2c9dd8', N'acct_1RHMljA3GQtkxKNo', N'', N'read_write', N'', N'')
SET IDENTITY_INSERT [dbo].[StripeCompanyTokens] OFF
GO
INSERT [dbo].[Users] ([ID], [Email], [Role], [IsHost], [PasswordHash], [FirstName], [LastName], [PhoneNumber], [DescriptiveRole], [FailedLoginAttempts], [LockoutEndTime], [TenantID_FK]) VALUES (N'eb559178-d563-477b-8d3a-4013708a7be4', N'sven@mail.com', N'Admin', 1, N'916EE57140FDDA6C6496E59A8353060BF95505392740463D6F482AD232EE92B7.68186F633D149017CEBC41F64E0B16D5', N'Sven', N'Testsson', NULL, N'CEO', 0, NULL, N'355d2919-9e8b-4f1c-b309-5f15fa2c9dd8')
INSERT [dbo].[Users] ([ID], [Email], [Role], [IsHost], [PasswordHash], [FirstName], [LastName], [PhoneNumber], [DescriptiveRole], [FailedLoginAttempts], [LockoutEndTime], [TenantID_FK]) VALUES (N'355d2919-9e8b-4f1c-b309-5f15fa2c9d6d', N'testmail@mail.com', N'Admin', 0, N'testpassword1', N'Gunnar', N'Testsson', NULL, N'CEO', 0, NULL, N'a513cf6d-1d68-4413-84e1-66eb7d5b0777')
INSERT [dbo].[Users] ([ID], [Email], [Role], [IsHost], [PasswordHash], [FirstName], [LastName], [PhoneNumber], [DescriptiveRole], [FailedLoginAttempts], [LockoutEndTime], [TenantID_FK]) VALUES (N'355d2919-9e8b-4f1c-b309-5f15fa2c9da5', N'testmail@mail.com', N'Admin', 0, N'testpassword1', N'Börje', N'Testsson', NULL, N'CEO', 0, NULL, N'f8a8a7a6-4caa-4a42-a0a1-590c53f7d6a6')
INSERT [dbo].[Users] ([ID], [Email], [Role], [IsHost], [PasswordHash], [FirstName], [LastName], [PhoneNumber], [DescriptiveRole], [FailedLoginAttempts], [LockoutEndTime], [TenantID_FK]) VALUES (N'355d2919-9e8b-4f1c-b309-5f15fa2c9dc3', N'testmail@mail.com', N'Admin', 0, N'testpassword1', N'Bengt', N'Testsson', NULL, N'CEO', 0, NULL, N'355d2919-9e8b-4f1c-b309-5f15fa2c9dd8')
GO
/****** Object:  Index [IX_CompanyConfigSettings_TenantID_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_CompanyConfigSettings_TenantID_FK] ON [dbo].[CompanyConfigSettings]
(
	[TenantID_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerOrder_CustomerID_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_CustomerOrder_CustomerID_FK] ON [dbo].[CustomerOrder]
(
	[CustomerID_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerOrder_OrderID_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_CustomerOrder_OrderID_FK] ON [dbo].[CustomerOrder]
(
	[OrderID_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OnboardingCompanies_TenantID_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_OnboardingCompanies_TenantID_FK] ON [dbo].[OnboardingCompanies]
(
	[TenantID_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserID_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserID_FK] ON [dbo].[Orders]
(
	[UserID_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductPrice_ProductID_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_ProductPrice_ProductID_FK] ON [dbo].[ProductPrice]
(
	[ProductID_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_TenantID_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_Products_TenantID_FK] ON [dbo].[Products]
(
	[TenantID_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RefreshTokens_UserId_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_RefreshTokens_UserId_FK] ON [dbo].[RefreshTokens]
(
	[UserId_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RolePermissions_PermissionID]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_RolePermissions_PermissionID] ON [dbo].[RolePermissions]
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RolePermissions_RoleID]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_RolePermissions_RoleID] ON [dbo].[RolePermissions]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Roles_TenantID_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_Roles_TenantID_FK] ON [dbo].[Roles]
(
	[TenantID_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StripeCompanyTokens_TenantID_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_StripeCompanyTokens_TenantID_FK] ON [dbo].[StripeCompanyTokens]
(
	[TenantID_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StripeSubscriptions_TenantID_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_StripeSubscriptions_TenantID_FK] ON [dbo].[StripeSubscriptions]
(
	[TenantID_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StripeSubscriptions_UserID_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_StripeSubscriptions_UserID_FK] ON [dbo].[StripeSubscriptions]
(
	[UserID_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StripeWebhookEvents_StripeEventID]    Script Date: 2025-05-06 19:14:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StripeWebhookEvents_StripeEventID] ON [dbo].[StripeWebhookEvents]
(
	[StripeEventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_TenantID_FK]    Script Date: 2025-05-06 19:14:24 ******/
CREATE NONCLUSTERED INDEX [IX_Users_TenantID_FK] ON [dbo].[Users]
(
	[TenantID_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyConfigSettings]  WITH CHECK ADD  CONSTRAINT [FK_CompanyConfigSettings_Companies_TenantID_FK] FOREIGN KEY([TenantID_FK])
REFERENCES [dbo].[Companies] ([TenantID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CompanyConfigSettings] CHECK CONSTRAINT [FK_CompanyConfigSettings_Companies_TenantID_FK]
GO
ALTER TABLE [dbo].[CustomerOrder]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrder_Customers_CustomerID_FK] FOREIGN KEY([CustomerID_FK])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerOrder] CHECK CONSTRAINT [FK_CustomerOrder_Customers_CustomerID_FK]
GO
ALTER TABLE [dbo].[CustomerOrder]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrder_Orders_OrderID_FK] FOREIGN KEY([OrderID_FK])
REFERENCES [dbo].[Orders] ([PaymentId])
GO
ALTER TABLE [dbo].[CustomerOrder] CHECK CONSTRAINT [FK_CustomerOrder_Orders_OrderID_FK]
GO
ALTER TABLE [dbo].[OnboardingCompanies]  WITH CHECK ADD  CONSTRAINT [FK_OnboardingCompanies_Companies_TenantID_FK] FOREIGN KEY([TenantID_FK])
REFERENCES [dbo].[Companies] ([TenantID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OnboardingCompanies] CHECK CONSTRAINT [FK_OnboardingCompanies_Companies_TenantID_FK]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserID_FK] FOREIGN KEY([UserID_FK])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserID_FK]
GO
ALTER TABLE [dbo].[ProductPrice]  WITH CHECK ADD  CONSTRAINT [FK_ProductPrice_Products_ProductID_FK] FOREIGN KEY([ProductID_FK])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductPrice] CHECK CONSTRAINT [FK_ProductPrice_Products_ProductID_FK]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Companies_TenantID_FK] FOREIGN KEY([TenantID_FK])
REFERENCES [dbo].[Companies] ([TenantID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Companies_TenantID_FK]
GO
ALTER TABLE [dbo].[RefreshTokens]  WITH CHECK ADD  CONSTRAINT [FK_RefreshTokens_Users_UserId_FK] FOREIGN KEY([UserId_FK])
REFERENCES [dbo].[Users] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RefreshTokens] CHECK CONSTRAINT [FK_RefreshTokens_Users_UserId_FK]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Permissions_PermissionID] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([PermissionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Permissions_PermissionID]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Roles_RoleID]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Companies_TenantID_FK] FOREIGN KEY([TenantID_FK])
REFERENCES [dbo].[Companies] ([TenantID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Companies_TenantID_FK]
GO
ALTER TABLE [dbo].[StripeCompanyTokens]  WITH CHECK ADD  CONSTRAINT [FK_StripeCompanyTokens_Companies_TenantID_FK] FOREIGN KEY([TenantID_FK])
REFERENCES [dbo].[Companies] ([TenantID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StripeCompanyTokens] CHECK CONSTRAINT [FK_StripeCompanyTokens_Companies_TenantID_FK]
GO
ALTER TABLE [dbo].[StripeSubscriptions]  WITH CHECK ADD  CONSTRAINT [FK_StripeSubscriptions_Companies_TenantID_FK] FOREIGN KEY([TenantID_FK])
REFERENCES [dbo].[Companies] ([TenantID])
GO
ALTER TABLE [dbo].[StripeSubscriptions] CHECK CONSTRAINT [FK_StripeSubscriptions_Companies_TenantID_FK]
GO
ALTER TABLE [dbo].[StripeSubscriptions]  WITH CHECK ADD  CONSTRAINT [FK_StripeSubscriptions_Users_UserID_FK] FOREIGN KEY([UserID_FK])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[StripeSubscriptions] CHECK CONSTRAINT [FK_StripeSubscriptions_Users_UserID_FK]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Companies_TenantID_FK] FOREIGN KEY([TenantID_FK])
REFERENCES [dbo].[Companies] ([TenantID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Companies_TenantID_FK]
GO
USE [master]
GO
ALTER DATABASE [Rekurrens] SET  READ_WRITE 
GO
