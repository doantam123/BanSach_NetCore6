USE [Webbansach]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[StreetAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotiId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationUserId] [nvarchar](450) NOT NULL,
	[FromUserId] [int] NOT NULL,
	[ToUserId] [int] NOT NULL,
	[NotiHeader] [nvarchar](max) NOT NULL,
	[NotiBody] [nvarchar](max) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[FromUserName] [nvarchar](max) NOT NULL,
	[ToUserName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[NotiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Notification]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[View_Notification]
as
select N.*,U.UserName
from Notifications N
LEFT JOIN AspNetUsers U On U.Id = N.ApplicationUserId;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/20/2024 4:12:03 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BotChat]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BotChat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Reply] [nvarchar](max) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BotChat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreateDatetime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companys]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[StreetAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_Companys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoverTypes]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoverTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CoverTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHeaders]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeaders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationUserId] [nvarchar](450) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[ShipppingDate] [datetime2](7) NOT NULL,
	[OrderTotal] [float] NOT NULL,
	[OrderStatus] [nvarchar](max) NULL,
	[PaymentStatus] [nvarchar](max) NULL,
	[TrackingNumber] [nvarchar](max) NULL,
	[Carrier] [nvarchar](max) NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
	[PaymentDueDate] [datetime2](7) NOT NULL,
	[SessionId] [nvarchar](max) NULL,
	[PaymentIntentId] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[StreetAddress] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderHeaders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ISBN] [int] NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[ListPrice] [float] NOT NULL,
	[Price50] [float] NOT NULL,
	[Price100] [float] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CoverTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 3/20/2024 4:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[ApplicationUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ShoppingCarts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231210175338_AddCategoryToDb', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231225121008_AddCoverTypeToDb', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231227080232_AddProductToDb', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231227081405_AddProductToDb', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231227081729_AddProductToDb', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231228095612_AddProductToDb', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240102083023_AddIdentityToDb', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240103084341_AddApplicationUserToDb', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240103123516_AddCompanyToDb', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240105141740_AddCompanyToUser', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240105201318_AddShoppingCartToDb', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240106203949_AddOrderHeaderDetailToDb', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240318093709_InitProject', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240320060335_AddChatBottoDB', N'6.0.25')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'051120cb-8583-4aab-885d-ea823f9cc08b', N'Individual', N'INDIVIDUAL', N'f7b6d016-dc41-4f8b-bea3-e314cacb2987')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1fa41cd5-aeae-4490-a2d7-ab5f89764a0e', N'Company', N'COMPANY', N'74be9f15-0612-4ff9-9f43-6b1158d1c5bf')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'add35a38-3306-4417-9bd0-23ef64623b35', N'Admin', N'ADMIN', N'7cd0a8e3-5dfa-4c35-8bbc-77b1f2d26f76')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'd3570db3-dcc8-4055-9e3e-2abd5e13256d', N'Employee', N'EMPLOYEE', N'35c3b3f4-d2ec-496c-8398-d3bb63cd37e5')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [StreetAddress], [City], [State], [PostalCode], [CompanyId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3a67f634-82ec-4deb-ae25-973c4a56b20a', N'ApplicationUser', N'tam', N'123123', N'2132', N'123', N'232', NULL, N'tam@gmail.com', N'TAM@GMAIL.COM', N'tam@gmail.com', N'TAM@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPHw4/vQwg00V2r14cZRQLt/PEDYiqM1zDDOfJ+bBk5sV0AXpJqZrCWm7fbvuOumfQ==', N'WTSABIPUMENIYEOZGSZMQGXP7QZCAHUJ', N'075151e7-ed2b-43d6-924d-f9050e5432af', N'12313123', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [StreetAddress], [City], [State], [PostalCode], [CompanyId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'880c5970-d979-4ae6-90f0-6f756dd9f936', N'ApplicationUser', N'test2', N'wewe', N'wewq', N'ewqeqw', N'weqwe', NULL, N'test2@gmail.com', N'TEST2@GMAIL.COM', N'test2@gmail.com', N'TEST2@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEETKjB0Vm61KAV1t9HylPo0qTjM2TNbKxk758y5tJyANk3gLiaqSfY6dQob47I44Qw==', N'JOAJYKM5CJMWDOH4ID7N7E436H57CA4A', N'24bb20b5-7b27-4a7d-a94d-9c9b5820ce7c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [StreetAddress], [City], [State], [PostalCode], [CompanyId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8bdf5341-f837-47c7-9541-4be852abab9a', N'ApplicationUser', N'test', N'adasd', N'asdas', N'asdasd', N'asdasd', NULL, N'test1@gmail.com', N'TEST1@GMAIL.COM', N'test1@gmail.com', N'TEST1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIIlLvRsGXrFjjLKs6A5yzm6uT/yrTOLE1iA4JrlyXxUNTvl/xY2ORFbWJHPx6LxQg==', N'X4FKLZUMIHF3PBMQQ7TSZMLSEUHDKQWK', N'3dc02f23-b27d-42dd-b47e-68adb9335776', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [StreetAddress], [City], [State], [PostalCode], [CompanyId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9be73c86-1682-400e-884d-1576b124422e', N'', NULL, NULL, NULL, NULL, NULL, NULL, N'doantampn2017@gmail.com', N'DOANTAMPN2017@GMAIL.COM', N'doantampn2017@gmail.com', N'DOANTAMPN2017@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBtlySJ+fb528FyHsYCQncP94hRSXMOtdE2UEBf7c87sypgRra4dQgGu6bQrAvBQPg==', N'MO7I2FK5L7RN3Y7XKV6PFNGDMFLBM3TO', N'9d49ae65-04fb-4331-a836-6966eb784b03', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[BotChat] ON 

INSERT [dbo].[BotChat] ([Id], [Reply], [Message]) VALUES (1, N'Hãy liên hệ nhân viên kĩ thuật qua số 0123123123 để được hỗ trợ.', N'12345678')
INSERT [dbo].[BotChat] ([Id], [Reply], [Message]) VALUES (2, N'Liên hệ qua Contact : github.com/doantam123 hoặc số điện thoại: 0123456654 để được hỗ trợ.', N'9')
SET IDENTITY_INSERT [dbo].[BotChat] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreateDatetime]) VALUES (13, N'Tái bản', 15022003, CAST(N'2024-01-02T13:11:07.3726419' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreateDatetime]) VALUES (14, N'Sách kỹ năng sống', 12062003, CAST(N'2024-01-02T13:11:18.7030104' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [CreateDatetime]) VALUES (15, N'Kiến thức', 123, CAST(N'2024-01-02T13:28:11.2592040' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Companys] ON 

INSERT [dbo].[Companys] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber]) VALUES (1, N'Nhà sách Fahasa', N'828 Sư Vạn Hạnh', N'Hồ Chí Minh', N'10', N'70000', N'093232323')
SET IDENTITY_INSERT [dbo].[Companys] OFF
GO
SET IDENTITY_INSERT [dbo].[CoverTypes] ON 

INSERT [dbo].[CoverTypes] ([Id], [Name]) VALUES (2, N'helo')
INSERT [dbo].[CoverTypes] ([Id], [Name]) VALUES (3, N'32')
SET IDENTITY_INSERT [dbo].[CoverTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([NotiId], [ApplicationUserId], [FromUserId], [ToUserId], [NotiHeader], [NotiBody], [IsRead], [Url], [CreatedDate], [Message], [FromUserName], [ToUserName]) VALUES (1, N'3a67f634-82ec-4deb-ae25-973c4a56b20a', 123, 123, N'Giao Hàng', N'Giao hàng thành công', 0, N'ghtk/23123', CAST(N'2023-05-05T00:00:00.0000000' AS DateTime2), N'Đến nhận tại Huflit', N'Admin', N'Tam')
INSERT [dbo].[Notifications] ([NotiId], [ApplicationUserId], [FromUserId], [ToUserId], [NotiHeader], [NotiBody], [IsRead], [Url], [CreatedDate], [Message], [FromUserName], [ToUserName]) VALUES (4, N'8bdf5341-f837-47c7-9541-4be852abab9a', 123, 123, N'123', N'123', 0, N'tam/hihi', CAST(N'2023-03-03T00:00:00.0000000' AS DateTime2), N'ads', N'Tam', N'Hieu')
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderHeaders] ON 

INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShipppingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (1, N'3a67f634-82ec-4deb-ae25-973c4a56b20a', CAST(N'2024-01-07T21:56:17.2136758' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 600000, N'Pending', N'Pending', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'12313123', N'123123', N'2132', N'123', N'232', N'tam')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShipppingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (2, N'3a67f634-82ec-4deb-ae25-973c4a56b20a', CAST(N'2024-01-07T23:16:18.4186289' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 120000, N'Pending', N'Pending', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'12313123', N'123123', N'2132', N'123', N'232', N'tam')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShipppingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (3, N'3a67f634-82ec-4deb-ae25-973c4a56b20a', CAST(N'2024-01-07T23:20:12.8666185' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 120000, N'Pending', N'Pending', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'12313123', N'123123', N'2132', N'123', N'232', N'tam')
INSERT [dbo].[OrderHeaders] ([Id], [ApplicationUserId], [OrderDate], [ShipppingDate], [OrderTotal], [OrderStatus], [PaymentStatus], [TrackingNumber], [Carrier], [PaymentDate], [PaymentDueDate], [SessionId], [PaymentIntentId], [PhoneNumber], [StreetAddress], [City], [State], [PostalCode], [Name]) VALUES (4, N'3a67f634-82ec-4deb-ae25-973c4a56b20a', CAST(N'2024-01-07T23:21:40.0627588' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 120000, N'Approved', N'Approved', NULL, NULL, CAST(N'2024-01-07T23:36:46.0416396' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'cs_test_a17THe4TaqTb8CBXnENLt3IRGKH4XOJMPAkZfXvfCDBnIwdW5WbCQKu6Mg', N'pi_3OVzL5CdY1Bzo9f00W0Rci2t', N'12313123', N'123123', N'2132', N'123', N'232', N'tam')
SET IDENTITY_INSERT [dbo].[OrderHeaders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Title], [Description], [ISBN], [Author], [ListPrice], [Price50], [Price100], [ImageUrl], [CategoryId], [CoverTypeId]) VALUES (6, N'Đắc nhân tâm', N'<p><a href="https://tiki.vn/search?q=%C4%90%E1%BA%AFc%20Nh%C3%A2n%20T%C3%A2m">Đắc Nh&acirc;n T&acirc;m</a>&nbsp;l&agrave; một trong những tựa s&aacute;ch self-help nổi tiếng nhất thế giới với hơn 15 triệu bản được b&aacute;n ra tr&ecirc;n to&agrave;n cầu. Cuốn s&aacute;ch n&agrave;y được đ&aacute;nh gi&aacute; l&agrave; kho t&agrave;ng kiến thức v&ocirc; gi&aacute; v&agrave; l&agrave; một nguồn cảm hứng th&uacute; vị cho những ai muốn n&acirc;ng cao kỹ năng giao tiếp, cải thiện khả năng x&acirc;y dựng mối quan hệ v&agrave; t&igrave;m kiếm th&agrave;nh c&ocirc;ng trong cuộc sống.</p>', 83859210, N'Dale Carnegie', 80000, 100000, 80000, N'images\products\d75ad61c-db17-4573-bae8-57a78485ef7a.jpg', 14, 3)
INSERT [dbo].[Products] ([Id], [Title], [Description], [ISBN], [Author], [ListPrice], [Price50], [Price100], [ImageUrl], [CategoryId], [CoverTypeId]) VALUES (7, N'Tuổi Trẻ Đáng Giá Bao Nhiêu', N'<p>&ldquo;<strong>Tuổi trẻ đ&aacute;ng gi&aacute; bao nhi&ecirc;u?&rdquo;&nbsp;</strong>c&ograve;n l&agrave; cẩm nang tạo một h&agrave;nh tr&igrave;nh mới mẻ cho nhiều bạn đang l&agrave;m việc tại chốn c&ocirc;ng sở, thường &aacute;p lực, mệt mỏi v&agrave; &ldquo;đấu tranh&rdquo; kịch liệt. Bởi, c&oacute; những l&uacute;c thật sự thấy phải thay đổi m&ocirc;i trường mới, chuyển c&ocirc;ng việc g&ograve; b&oacute; th&agrave;n đam m&ecirc;, tạo ra bước ngoặt kh&aacute;c biệt cho ch&iacute;nh m&igrave;nh.Sẽ c&oacute; chỉ tr&iacute;ch v&agrave; khen ngợi, b&agrave;n luận trung gian khi một cuốn s&aacute;ch xuất bản. D&ugrave; chỉ tr&iacute;ch hay ủng hộ, ch&uacute;ng ta cũng phải xem x&eacute;t kh&aacute;ch quan nhất trước khi đưa ra kết luận, kh&ocirc;ng một l&yacute; luận hay quan điểm n&agrave;o ph&ugrave; hợp với tất cả mọi người tr&ecirc;n thế giới v&agrave; chắc chắn kh&ocirc;ng c&oacute; ngoại lệ.&nbsp;<strong>&ldquo;Tuổi trẻ đ&aacute;ng gi&aacute; bao nhi&ecirc;u?&rdquo;&nbsp;</strong>quả thực mang đến những thay đổi cho nhiều bạn trẻ v&agrave; cả những người đ&atilde; đi qua thời ni&ecirc;n thiếu đ&oacute;.</p>', 48329174, N'Rosie Nguyễn', 200000, 190000, 180000, N'images\products\96eb93bf-a37d-4521-ac6a-05ac8ad70c2c.jpg', 13, 2)
INSERT [dbo].[Products] ([Id], [Title], [Description], [ISBN], [Author], [ListPrice], [Price50], [Price100], [ImageUrl], [CategoryId], [CoverTypeId]) VALUES (8, N'Tôi thấy hoa vàng trên cỏ xanh', N'<p><em><strong>T&ocirc;i thấy hoa v&agrave;ng tr&ecirc;n cỏ xanh</strong></em>&nbsp;l&agrave; một&nbsp;<a title="Tiểu thuyết" href="https://vi.wikipedia.org/wiki/Ti%E1%BB%83u_thuy%E1%BA%BFt">tiểu thuyết</a>&nbsp;d&agrave;nh cho thanh thiếu ni&ecirc;n của nh&agrave; văn&nbsp;<a title="Nguyễn Nhật &Aacute;nh" href="https://vi.wikipedia.org/wiki/Nguy%E1%BB%85n_Nh%E1%BA%ADt_%C3%81nh">Nguyễn Nhật &Aacute;nh</a>, xuất bản lần đầu tại&nbsp;<a title="Việt Nam" href="https://vi.wikipedia.org/wiki/Vi%E1%BB%87t_Nam">Việt Nam</a>&nbsp;v&agrave;o ng&agrave;y 9 th&aacute;ng 12 năm 2010 bởi&nbsp;<a title="Nh&agrave; xuất bản Trẻ" href="https://vi.wikipedia.org/wiki/Nh%C3%A0_xu%E1%BA%A5t_b%E1%BA%A3n_Tr%E1%BA%BB">Nh&agrave; xuất bản Trẻ</a>&nbsp;với phần tranh minh họa do Đỗ Ho&agrave;ng Tường thực hiện. Đ&acirc;y l&agrave; một trong c&aacute;c truyện d&agrave;i của Nguyễn Nhật &Aacute;nh, ra đời sau&nbsp;<em><a title="Đảo mộng mơ (trang kh&ocirc;ng tồn tại)" href="https://vi.wikipedia.org/w/index.php?title=%C4%90%E1%BA%A3o_m%E1%BB%99ng_m%C6%A1&amp;action=edit&amp;redlink=1">Đảo mộng mơ</a></em>&nbsp;v&agrave; trước&nbsp;<em><a title="L&aacute; nằm trong l&aacute; (trang kh&ocirc;ng tồn tại)" href="https://vi.wikipedia.org/w/index.php?title=L%C3%A1_n%E1%BA%B1m_trong_l%C3%A1&amp;action=edit&amp;redlink=1">L&aacute; nằm trong l&aacute;</a></em>.&nbsp;<a title="T&aacute;c phẩm văn học" href="https://vi.wikipedia.org/wiki/T%C3%A1c_ph%E1%BA%A9m_v%C4%83n_h%E1%BB%8Dc">T&aacute;c phẩm</a>&nbsp;như một tập&nbsp;<a title="Nhật k&yacute;" href="https://vi.wikipedia.org/wiki/Nh%E1%BA%ADt_k%C3%BD">nhật k&yacute;</a>&nbsp;xoay quanh cuộc sống của những đứa trẻ ở một v&ugrave;ng qu&ecirc; Việt Nam ngh&egrave;o kh&oacute;, nổi bật l&ecirc;n l&agrave; th&ocirc;ng điệp về t&igrave;nh anh em, t&igrave;nh l&agrave;ng nghĩa x&oacute;m v&agrave; những t&acirc;m tư của&nbsp;<a title="Tuổi mới lớn" href="https://vi.wikipedia.org/wiki/Tu%E1%BB%95i_m%E1%BB%9Bi_l%E1%BB%9Bn">tuổi mới lớn</a>. Theo Nguyễn Nhật &Aacute;nh, đ&acirc;y l&agrave; lần đầu ti&ecirc;n &ocirc;ng đưa v&agrave;o truyện của m&igrave;nh những nh&acirc;n vật phản diện, đặt ra vấn đề đạo đức như sự v&ocirc; t&acirc;m hay&nbsp;<a title="&Aacute;c" href="https://vi.wikipedia.org/wiki/%C3%81c">c&aacute;i &aacute;c</a>.</p>', 100000, N'Nguyễn Nhật Ánh', 200000, 130000, 180000, N'images\products\f44b414a-8ee0-45b8-8b67-31ac868ce236.jpg', 13, 2)
INSERT [dbo].[Products] ([Id], [Title], [Description], [ISBN], [Author], [ListPrice], [Price50], [Price100], [ImageUrl], [CategoryId], [CoverTypeId]) VALUES (9, N'Dế mèn phiêu lưu ký', N'<p>Dế M&egrave;n phi&ecirc;u lưu k&yacute; được xem l&agrave; những trang văn mẫu mực của văn học thiếu nhi. Dường như mọi c&acirc;u, đoạn, h&igrave;nh ảnh đều t&aacute;c động mạnh mẽ đến tư tưởng t&igrave;nh cảm thẩm mỹ của người đọc. T&aacute;c phẩm mi&ecirc;u tả cuộc phi&ecirc;u lưu của một ch&uacute; Dế M&egrave;n qua thế giới lo&agrave;i vật v&agrave; lo&agrave;i người.<br>Những vấn đề n&oacute;ng hổi như l&agrave;: c&aacute;i thiện v&agrave; c&aacute;i &aacute;c, chiến tranh v&agrave; h&ograve;a b&igrave;nh, l&iacute; tưởng v&agrave; lẽ sống được thể hiện một c&aacute;ch nhẹ nh&agrave;ng, tinh tế m&agrave; s&acirc;u sắc. M&egrave;n đ&atilde; trải qua những cuộc phi&ecirc;u lưu v&agrave;o thế giới c&aacute;c lo&agrave;i vật, vượt qua cơ man n&agrave;o l&agrave; rủi ro v&agrave; biến cố, nhưng từng bước M&egrave;n vươn l&ecirc;n tự điều chỉnh, tự nhận thức để trở th&agrave;nh con người gi&agrave;u l&iacute; tưởng v&agrave; ham hiểu biết với bản lĩnh ki&ecirc;n cường của một trai tr&aacute;ng đầu đội trời ch&acirc;n đập đất.</p>', 28395021, N'Tô Hoài', 120000, 110000, 100000, N'images\products\e84738c8-dc3a-44a7-a0ff-92fbbee991a7.jpg', 13, 2)
INSERT [dbo].[Products] ([Id], [Title], [Description], [ISBN], [Author], [ListPrice], [Price50], [Price100], [ImageUrl], [CategoryId], [CoverTypeId]) VALUES (10, N'Lập trình C#', N'<p>C# (hay c&ograve;n gọi l&agrave; C-Sharp) l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh hướng đối tượng, được Microsoft ph&aacute;t triển dựa tr&ecirc;n nền tảng của ng&ocirc;n ngữ Java v&agrave; C++.&nbsp;Lập tr&igrave;nh C# c&oacute; nhiều điểm th&uacute; vị v&agrave; nổi bật hơn những ng&ocirc;n ngữ kh&aacute;c. Chỉ khi c&agrave;ng học v&agrave; t&igrave;m hiểu s&acirc;u về n&oacute;, bạn mới nhận ra sức h&uacute;t mạnh mẽ của &ldquo;con c&aacute; mập&rdquo; n&agrave;y.</p>', 31238754, N'Phạm Công Ngô', 400000, 380000, 320000, N'images\products\d52d6ce5-4dd0-43fb-ac99-3f3da9e26eca.jpg', 15, 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Companys_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companys] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Companys_CompanyId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderHeaders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderHeaders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderHeaders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderHeaders]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeaders_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderHeaders] CHECK CONSTRAINT [FK_OrderHeaders_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_CoverTypes_CoverTypeId] FOREIGN KEY([CoverTypeId])
REFERENCES [dbo].[CoverTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_CoverTypes_CoverTypeId]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Products_ProductId]
GO
