USE [master]
GO
/****** Object:  Database [Test]    Script Date: 11/6/2016 7:32:14 PM ******/
CREATE DATABASE [Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Users\865346\Test.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Users\865346\Test_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Test] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Test] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Test] SET  MULTI_USER 
GO
ALTER DATABASE [Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Test]
GO
/****** Object:  Table [dbo].[BranchMaster]    Script Date: 11/6/2016 7:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BranchMaster](
	[BMID] [int] IDENTITY(1,1) NOT NULL,
	[CID] [int] NULL,
	[BranchName] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CityMaster]    Script Date: 11/6/2016 7:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CityMaster](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[SMID] [int] NULL,
	[CName] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseMaster]    Script Date: 11/6/2016 7:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseMaster](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeMaster]    Script Date: 11/6/2016 7:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeMaster](
	[EmpCode] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [varchar](100) NULL,
	[State] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeMasters]    Script Date: 11/6/2016 7:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeMasters](
	[EmpCode] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [varchar](100) NULL,
	[State] [varchar](100) NULL,
 CONSTRAINT [PK_EmployeeMasters] PRIMARY KEY CLUSTERED 
(
	[EmpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPMaster]    Script Date: 11/6/2016 7:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPMaster](
	[EMPID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](50) NULL,
	[City] [varchar](100) NULL,
	[Country] [varchar](50) NULL,
	[Mobile] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StateMaster]    Script Date: 11/6/2016 7:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StateMaster](
	[SMID] [int] IDENTITY(1,1) NOT NULL,
	[SName] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentInfo]    Script Date: 11/6/2016 7:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentInfo](
	[SIID] [int] IDENTITY(1,1) NOT NULL,
	[SName] [varchar](100) NULL,
	[SAge] [int] NULL,
	[SContactNo] [varchar](20) NULL,
	[SMID] [int] NULL,
	[CID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubjectMaster]    Script Date: 11/6/2016 7:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubjectMaster](
	[SubID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 11/6/2016 7:32:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmployeeId] [int] NULL,
	[Name] [varchar](100) NULL,
	[ManagerId] [varchar](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BranchMaster] ON 

INSERT [dbo].[BranchMaster] ([BMID], [CID], [BranchName]) VALUES (1, 5, N'CS')
INSERT [dbo].[BranchMaster] ([BMID], [CID], [BranchName]) VALUES (2, 6, N'Marketing')
INSERT [dbo].[BranchMaster] ([BMID], [CID], [BranchName]) VALUES (3, 5, N'Electrical Eng')
INSERT [dbo].[BranchMaster] ([BMID], [CID], [BranchName]) VALUES (4, 5, N'Mechenical Eng.')
INSERT [dbo].[BranchMaster] ([BMID], [CID], [BranchName]) VALUES (5, 6, N'Finance')
INSERT [dbo].[BranchMaster] ([BMID], [CID], [BranchName]) VALUES (6, 6, N'IT')
SET IDENTITY_INSERT [dbo].[BranchMaster] OFF
SET IDENTITY_INSERT [dbo].[CityMaster] ON 

INSERT [dbo].[CityMaster] ([CID], [SMID], [CName]) VALUES (1, 16, N'Agra')
INSERT [dbo].[CityMaster] ([CID], [SMID], [CName]) VALUES (2, 16, N'Kanpur')
INSERT [dbo].[CityMaster] ([CID], [SMID], [CName]) VALUES (4, 15, N'Bhopal')
INSERT [dbo].[CityMaster] ([CID], [SMID], [CName]) VALUES (5, 3, N'Hydrabaad')
INSERT [dbo].[CityMaster] ([CID], [SMID], [CName]) VALUES (6, 4, N'New Delhi')
INSERT [dbo].[CityMaster] ([CID], [SMID], [CName]) VALUES (7, 0, N'Meerut')
INSERT [dbo].[CityMaster] ([CID], [SMID], [CName]) VALUES (8, 0, N'Meerut')
INSERT [dbo].[CityMaster] ([CID], [SMID], [CName]) VALUES (9, 16, N'Meerut')
INSERT [dbo].[CityMaster] ([CID], [SMID], [CName]) VALUES (10, 8, N'Patna')
INSERT [dbo].[CityMaster] ([CID], [SMID], [CName]) VALUES (11, 7, N'Gurgaon')
INSERT [dbo].[CityMaster] ([CID], [SMID], [CName]) VALUES (12, 16, N'Gaziyabaad')
SET IDENTITY_INSERT [dbo].[CityMaster] OFF
SET IDENTITY_INSERT [dbo].[CourseMaster] ON 

INSERT [dbo].[CourseMaster] ([CID], [CourseName]) VALUES (4, NULL)
INSERT [dbo].[CourseMaster] ([CID], [CourseName]) VALUES (5, N'B.Tech.')
INSERT [dbo].[CourseMaster] ([CID], [CourseName]) VALUES (6, N'MBA')
INSERT [dbo].[CourseMaster] ([CID], [CourseName]) VALUES (7, N'B.Pharma')
INSERT [dbo].[CourseMaster] ([CID], [CourseName]) VALUES (8, N'M.Tech.')
INSERT [dbo].[CourseMaster] ([CID], [CourseName]) VALUES (9, N'M.Pharma')
INSERT [dbo].[CourseMaster] ([CID], [CourseName]) VALUES (10, N'B.Sc.')
INSERT [dbo].[CourseMaster] ([CID], [CourseName]) VALUES (11, N'B.A.')
INSERT [dbo].[CourseMaster] ([CID], [CourseName]) VALUES (12, N'B.Com')
INSERT [dbo].[CourseMaster] ([CID], [CourseName]) VALUES (13, N'M.Com')
INSERT [dbo].[CourseMaster] ([CID], [CourseName]) VALUES (14, N'M.SC')
INSERT [dbo].[CourseMaster] ([CID], [CourseName]) VALUES (15, N'M.A')
SET IDENTITY_INSERT [dbo].[CourseMaster] OFF
SET IDENTITY_INSERT [dbo].[EmployeeMasters] ON 

INSERT [dbo].[EmployeeMasters] ([EmpCode], [EmpName], [State]) VALUES (1, N'Test01', N'UP')
INSERT [dbo].[EmployeeMasters] ([EmpCode], [EmpName], [State]) VALUES (2, N'test', N'mp')
INSERT [dbo].[EmployeeMasters] ([EmpCode], [EmpName], [State]) VALUES (3, N'Test02', N'UP')
INSERT [dbo].[EmployeeMasters] ([EmpCode], [EmpName], [State]) VALUES (4, N'Test03', N'mp')
SET IDENTITY_INSERT [dbo].[EmployeeMasters] OFF
SET IDENTITY_INSERT [dbo].[EMPMaster] ON 

INSERT [dbo].[EMPMaster] ([EMPID], [Name], [Email], [Password], [City], [Country], [Mobile]) VALUES (1, N'Meesam', N'mm@mm.com', N'mmmm', N'mmm', N'mmm', 8888)
INSERT [dbo].[EMPMaster] ([EMPID], [Name], [Email], [Password], [City], [Country], [Mobile]) VALUES (2, N'Brijesh', N'bb@bb.com', N'bbbb', N'Knp', N'Ind', 111111)
INSERT [dbo].[EMPMaster] ([EMPID], [Name], [Email], [Password], [City], [Country], [Mobile]) VALUES (3, N'Raj', N'aa', N'll', N'nn', N'tt', 1)
INSERT [dbo].[EMPMaster] ([EMPID], [Name], [Email], [Password], [City], [Country], [Mobile]) VALUES (4, N'KK', N'pp', N'aa', N'll', N'mm', 123)
INSERT [dbo].[EMPMaster] ([EMPID], [Name], [Email], [Password], [City], [Country], [Mobile]) VALUES (5, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[EMPMaster] ([EMPID], [Name], [Email], [Password], [City], [Country], [Mobile]) VALUES (6, N'test', N'test', N'test', N'test', N'test', 66)
INSERT [dbo].[EMPMaster] ([EMPID], [Name], [Email], [Password], [City], [Country], [Mobile]) VALUES (7, NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[EMPMaster] OFF
SET IDENTITY_INSERT [dbo].[StateMaster] ON 

INSERT [dbo].[StateMaster] ([SMID], [SName]) VALUES (16, N'UP')
INSERT [dbo].[StateMaster] ([SMID], [SName]) VALUES (15, N'MP')
INSERT [dbo].[StateMaster] ([SMID], [SName]) VALUES (4, N'Delhi')
INSERT [dbo].[StateMaster] ([SMID], [SName]) VALUES (6, N'Gujraat')
INSERT [dbo].[StateMaster] ([SMID], [SName]) VALUES (7, N'haryana')
INSERT [dbo].[StateMaster] ([SMID], [SName]) VALUES (8, N'Bihaar')
INSERT [dbo].[StateMaster] ([SMID], [SName]) VALUES (9, N'Utrakhaand')
INSERT [dbo].[StateMaster] ([SMID], [SName]) VALUES (10, N'Tamilnadu')
INSERT [dbo].[StateMaster] ([SMID], [SName]) VALUES (11, N'Keral')
INSERT [dbo].[StateMaster] ([SMID], [SName]) VALUES (12, N'Punjab')
SET IDENTITY_INSERT [dbo].[StateMaster] OFF
SET IDENTITY_INSERT [dbo].[StudentInfo] ON 

INSERT [dbo].[StudentInfo] ([SIID], [SName], [SAge], [SContactNo], [SMID], [CID]) VALUES (1, N'test', 22, NULL, 16, 2)
INSERT [dbo].[StudentInfo] ([SIID], [SName], [SAge], [SContactNo], [SMID], [CID]) VALUES (2, N'brijesh', 30, NULL, 4, 6)
INSERT [dbo].[StudentInfo] ([SIID], [SName], [SAge], [SContactNo], [SMID], [CID]) VALUES (3, N'meesam', 29, N'12345678', 16, 2)
SET IDENTITY_INSERT [dbo].[StudentInfo] OFF
SET IDENTITY_INSERT [dbo].[SubjectMaster] ON 

INSERT [dbo].[SubjectMaster] ([SubID], [SubjectName]) VALUES (1, N'Math')
INSERT [dbo].[SubjectMaster] ([SubID], [SubjectName]) VALUES (2, N'English')
INSERT [dbo].[SubjectMaster] ([SubID], [SubjectName]) VALUES (3, N'Physics')
INSERT [dbo].[SubjectMaster] ([SubID], [SubjectName]) VALUES (4, N'Chemistry')
INSERT [dbo].[SubjectMaster] ([SubID], [SubjectName]) VALUES (5, N'Science')
SET IDENTITY_INSERT [dbo].[SubjectMaster] OFF
INSERT [dbo].[tblEmployee] ([EmployeeId], [Name], [ManagerId]) VALUES (1, N'Brijesh', N'2')
INSERT [dbo].[tblEmployee] ([EmployeeId], [Name], [ManagerId]) VALUES (2, N'Meesam', N'3')
USE [master]
GO
ALTER DATABASE [Test] SET  READ_WRITE 
GO
