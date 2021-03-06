USE [master]
GO
/****** Object:  Database [Personel]    Script Date: 6/30/2017 11:01:39 PM ******/
CREATE DATABASE [Personel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Personel', FILENAME = N'E:\Personel.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Personel_log', FILENAME = N'E:\Personel_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Personel] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Personel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Personel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Personel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Personel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Personel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Personel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Personel] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Personel] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Personel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Personel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Personel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Personel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Personel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Personel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Personel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Personel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Personel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Personel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Personel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Personel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Personel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Personel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Personel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Personel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Personel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Personel] SET  MULTI_USER 
GO
ALTER DATABASE [Personel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Personel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Personel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Personel] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Personel]
GO
/****** Object:  Table [dbo].[Departs]    Script Date: 6/30/2017 11:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departs](
	[Id] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Records]    Script Date: 6/30/2017 11:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Records](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Reason] [varchar](200) NOT NULL,
	[Date] [date] NOT NULL,
	[StaffId] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 6/30/2017 11:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staffs](
	[Id] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Birthday] [date] NOT NULL,
	[Photo] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](25) NOT NULL,
	[Salary] [float] NOT NULL,
	[Notes] [varchar](500) NULL,
	[DepartId] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/30/2017 11:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Fullname] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'1', N'Ke Toan')
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'2', N'Kinh Doanh')
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'3', N'IT')
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'7', N'Káº¿ ToÃ¡n')
SET IDENTITY_INSERT [dbo].[Records] ON 

INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (1, 1, N'ik tre', CAST(0xE83C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (2, 0, N'ik tre 123', CAST(0xE83C0B00 AS Date), N'nv2')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (3, 0, N'ik tre 123', CAST(0xE83C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (4, 1, N'ngu quen', CAST(0xE83C0B00 AS Date), N'nv3')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (5, 1, N'123', CAST(0xE83C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (6, 1, N'321', CAST(0xE83C0B00 AS Date), N'nv2')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (7, 0, N'123', CAST(0xE83C0B00 AS Date), N'nv3')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (8, 1, N'123', CAST(0xE83C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (9, 1, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10, 0, N'123', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (11, 1, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10024, 1, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10025, 1, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10026, 1, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10028, 1, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10029, 0, N'', CAST(0xF03C0B00 AS Date), N'nv2')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10032, 1, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10033, 1, N'', CAST(0xF03C0B00 AS Date), N'nv2')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10034, 1, N'', CAST(0xF03C0B00 AS Date), N'nv2')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10035, 1, N'', CAST(0xF03C0B00 AS Date), N'nv2')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10040, 0, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10041, 0, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10042, 0, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10045, 1, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10048, 1, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10049, 1, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10050, 1, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10052, 1, N'', CAST(0xF03C0B00 AS Date), N'nv1')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10054, 0, N'', CAST(0xF03C0B00 AS Date), N'nv3')
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (10055, 0, N'', CAST(0xF03C0B00 AS Date), N'nv2')
SET IDENTITY_INSERT [dbo].[Records] OFF
INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (N'nv1', N'Tuan', 1, CAST(0xF7200B00 AS Date), N'4.jsp', N't@gmail.com', N'09876543221', 1000, N'123', N'3')
INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (N'nv2', N'Anh', 1, CAST(0xF7200B00 AS Date), N'4.jsp', N't@gmail.com', N'09876543221', 1000, N'123', N'2')
INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (N'nv3', N'Hoa', 0, CAST(0xF7200B00 AS Date), N'4.jsp', N't@gmail.com', N'09876543221', 1000, N'123', N'1')
INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (N'nv4', N'Heo', 0, CAST(0xC8230B00 AS Date), N'111', N'Hiá»n Heo', N'01635897852', 2131232, N'123123', N'2')
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'Hien', N'123', N'Thi Hien')
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'Nga', N'123', N'123')
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'Thanh', N'123', N'Van Thanh')
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'Thien', N'123', N'Tan Thien')
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'Tien', N'321', N'Tuan Tien')
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'Tin', N'123', N'Viet Tin')
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'Tuan', N'123', N'Van Tuan')
ALTER TABLE [dbo].[Records]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staffs] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD FOREIGN KEY([DepartId])
REFERENCES [dbo].[Departs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [Personel] SET  READ_WRITE 
GO
