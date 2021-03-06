USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'PRJ301_Assignment')
BEGIN
	ALTER DATABASE [PRJ301_Assignment] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [PRJ301_Assignment] SET ONLINE;
	DROP DATABASE [PRJ301_Assignment];
END

GO

/****** Object:  Database [PRJ301_Assignment]    Script Date: 17/07/2022 17:24:06 ******/
CREATE DATABASE [PRJ301_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ301_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301_Assignment', N'ON'
GO
ALTER DATABASE [PRJ301_Assignment] SET QUERY_STORE = OFF
GO
USE [PRJ301_Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 17/07/2022 17:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 17/07/2022 17:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[StudentID] [varchar](10) NOT NULL,
	[SessionID] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[RecordTime] [datetime] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[TakenBy] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 17/07/2022 17:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [varchar](10) NOT NULL,
	[CourseName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 17/07/2022 17:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](20) NOT NULL,
	[LecturerID] [varchar](30) NOT NULL,
	[CourseID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 17/07/2022 17:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[LecturerID] [varchar](30) NOT NULL,
	[LecturerName] [nvarchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[LecturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 17/07/2022 17:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 17/07/2022 17:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[LecturerID] [varchar](30) NOT NULL,
	[SessionNumber] [int] NOT NULL,
	[SessionDescription] [varchar](100) NOT NULL,
	[RoomID] [varchar](10) NOT NULL,
	[Date] [date] NOT NULL,
	[TimeSlotID] [varchar](10) NOT NULL,
	[GroupID] [int] NOT NULL,
	[Semester] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 17/07/2022 17:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [varchar](10) NOT NULL,
	[MemberCode] [varchar](20) NOT NULL,
	[Surname] [nvarchar](20) NOT NULL,
	[MiddleName] [nvarchar](30) NOT NULL,
	[GivenName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 17/07/2022 17:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroup](
	[StudentID] [varchar](10) NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_StudentGroup] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 17/07/2022 17:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[TimeSlotID] [varchar](10) NOT NULL,
	[Start] [time](7) NOT NULL,
	[End] [time](7) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[TimeSlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password], [DisplayName]) VALUES (N'hongdt30', N'123', N'Dương Thị Hồng')
INSERT [dbo].[Account] ([Username], [Password], [DisplayName]) VALUES (N'sonhx', N'123', N'Hoàng Xuân Sơn')
INSERT [dbo].[Account] ([Username], [Password], [DisplayName]) VALUES (N'sonnt5', N'123', N'Ngô Tùng Sơn')
INSERT [dbo].[Account] ([Username], [Password], [DisplayName]) VALUES (N'thulx', N'123', N'Lại Xuân Thu')
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 7, N'Absent', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 21, N'Absent', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140155', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 12, N'Absent', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE140777', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 7, N'Absent', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 16, N'Absent', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 17, N'Absent', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150167', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150798', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 9, N'Absent', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150819', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 24, N'Absent', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE150915', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 19, N'Absent', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151210', 27, N'Attended', CAST(N'2022-07-17T16:55:30.163' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151282', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 25, N'Absent', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151356', 27, N'Attended', CAST(N'2022-07-17T16:55:30.163' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 25, N'Absent', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE151431', 27, N'Attended', CAST(N'2022-07-17T16:55:30.163' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153012', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153276', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153603', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153622', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE153773', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE160328', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161149', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 25, N'Absent', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161499', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161574', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161699', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161701', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161888', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 25, N'Absent', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE161928', 27, N'Attended', CAST(N'2022-07-17T16:55:30.163' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE162004', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163366', 27, N'Attended', CAST(N'2022-07-17T16:55:30.163' AS DateTime), N'', N'sonnt5')
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163585', 27, N'Absent', CAST(N'2022-07-17T16:55:30.163' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163884', 27, N'Attended', CAST(N'2022-07-17T15:32:31.477' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE163937', 27, N'Absent', CAST(N'2022-07-17T16:55:30.163' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164001', 27, N'Absent', CAST(N'2022-07-17T16:55:30.163' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 3, N'Attended', CAST(N'2022-05-09T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 4, N'Attended', CAST(N'2022-05-11T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 5, N'Attended', CAST(N'2022-05-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 6, N'Attended', CAST(N'2022-05-16T14:20:00.000' AS DateTime), NULL, N'sonnt5')
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 7, N'Attended', CAST(N'2022-05-18T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 8, N'Attended', CAST(N'2022-05-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 9, N'Attended', CAST(N'2022-05-23T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 10, N'Attended', CAST(N'2022-05-25T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 11, N'Attended', CAST(N'2022-05-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 12, N'Attended', CAST(N'2022-05-30T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 13, N'Attended', CAST(N'2022-06-01T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 14, N'Attended', CAST(N'2022-06-03T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 15, N'Attended', CAST(N'2022-06-06T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 16, N'Attended', CAST(N'2022-06-08T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 17, N'Attended', CAST(N'2022-06-10T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 18, N'Attended', CAST(N'2022-06-13T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 19, N'Attended', CAST(N'2022-06-15T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 20, N'Attended', CAST(N'2022-06-17T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 21, N'Attended', CAST(N'2022-06-20T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 22, N'Attended', CAST(N'2022-06-22T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 23, N'Attended', CAST(N'2022-06-24T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 24, N'Attended', CAST(N'2022-06-27T14:20:00.000' AS DateTime), NULL, N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 25, N'Attended', CAST(N'2022-06-29T11:28:57.367' AS DateTime), N'', N'sonnt5')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [RecordTime], [Description], [TakenBy]) VALUES (N'HE164016', 27, N'Absent', CAST(N'2022-07-17T16:55:30.163' AS DateTime), N'', N'sonnt5')
GO
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'IOT102', N'Internet of Things')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'JPD123', N'Elementary Japanese 1-A1.2')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'MAS291', N'Statistics and Probability')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'PRJ301', N'Java Web Application Development')
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([GroupID], [GroupName], [LecturerID], [CourseID]) VALUES (1, N'SE1623', N'sonnt5', N'PRJ301')
INSERT [dbo].[Group] ([GroupID], [GroupName], [LecturerID], [CourseID]) VALUES (2, N'SE1623', N'sonhx', N'IOT102')
INSERT [dbo].[Group] ([GroupID], [GroupName], [LecturerID], [CourseID]) VALUES (3, N'SE1630', N'hongdt30', N'MAS291')
INSERT [dbo].[Group] ([GroupID], [GroupName], [LecturerID], [CourseID]) VALUES (4, N'GD1611', N'thulx', N'JPD123')
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
INSERT [dbo].[Lecturer] ([LecturerID], [LecturerName], [Email]) VALUES (N'hongdt30', N'Dương Thị Hồng', N'hongdt30@fe.edu.vn')
INSERT [dbo].[Lecturer] ([LecturerID], [LecturerName], [Email]) VALUES (N'sonhx', N'Hoàng Xuân Sơn', N'sonhx@fe.edu.vn')
INSERT [dbo].[Lecturer] ([LecturerID], [LecturerName], [Email]) VALUES (N'sonnt5', N'Ngô Tùng Sơn', N'sonnt5@fe.edu.vn')
INSERT [dbo].[Lecturer] ([LecturerID], [LecturerName], [Email]) VALUES (N'thulx', N'Lại Xuân Thu', N'thulx@fe.edu.vn')
GO
INSERT [dbo].[Room] ([RoomID]) VALUES (N'DE-C202')
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (3, N'sonnt5', 1, N'', N'DE-C202', CAST(N'2022-05-09' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (4, N'sonnt5', 2, N'', N'DE-C202', CAST(N'2022-05-11' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (5, N'sonnt5', 3, N'', N'DE-C202', CAST(N'2022-05-13' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (6, N'sonnt5', 4, N'', N'DE-C202', CAST(N'2022-05-16' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (7, N'sonnt5', 5, N'', N'DE-C202', CAST(N'2022-05-18' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (8, N'sonnt5', 6, N'', N'DE-C202', CAST(N'2022-05-20' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (9, N'sonnt5', 7, N'', N'DE-C202', CAST(N'2022-05-23' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (10, N'sonnt5', 8, N'', N'DE-C202', CAST(N'2022-05-25' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (11, N'sonnt5', 9, N'', N'DE-C202', CAST(N'2022-05-27' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (12, N'sonnt5', 10, N'', N'DE-C202', CAST(N'2022-05-30' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (13, N'sonnt5', 11, N'', N'DE-C202', CAST(N'2022-06-01' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (14, N'sonnt5', 12, N'', N'DE-C202', CAST(N'2022-06-03' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (15, N'sonnt5', 13, N'', N'DE-C202', CAST(N'2022-06-06' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (16, N'sonnt5', 14, N'', N'DE-C202', CAST(N'2022-06-08' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (17, N'sonnt5', 15, N'', N'DE-C202', CAST(N'2022-06-10' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (18, N'sonnt5', 16, N'', N'DE-C202', CAST(N'2022-06-13' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (19, N'sonnt5', 17, N'', N'DE-C202', CAST(N'2022-06-15' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (20, N'sonnt5', 18, N'', N'DE-C202', CAST(N'2022-06-17' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (21, N'sonnt5', 19, N'', N'DE-C202', CAST(N'2022-06-20' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (22, N'sonnt5', 20, N'', N'DE-C202', CAST(N'2022-06-22' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (23, N'sonnt5', 21, N'', N'DE-C202', CAST(N'2022-06-24' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (24, N'sonnt5', 22, N'', N'DE-C202', CAST(N'2022-06-27' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (25, N'sonnt5', 23, N'', N'DE-C202', CAST(N'2022-06-29' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (26, N'sonnt5', 24, N'', N'DE-C202', CAST(N'2022-07-01' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (27, N'sonnt5', 25, N'', N'DE-C202', CAST(N'2022-07-11' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (28, N'sonnt5', 26, N'', N'DE-C202', CAST(N'2022-07-13' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (29, N'sonnt5', 27, N'', N'DE-C202', CAST(N'2022-07-15' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (30, N'sonnt5', 28, N'', N'DE-C202', CAST(N'2022-07-18' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (31, N'sonnt5', 29, N'', N'DE-C202', CAST(N'2022-07-20' AS Date), N'Slot 5', 1, N'Summer 2022')
INSERT [dbo].[Session] ([SessionID], [LecturerID], [SessionNumber], [SessionDescription], [RoomID], [Date], [TimeSlotID], [GroupID], [Semester]) VALUES (32, N'sonnt5', 30, N'', N'DE-C202', CAST(N'2022-07-22' AS Date), N'Slot 5', 1, N'Summer 2022')
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HA160009', N'NganNHHA160009', N'Nguyễn', N'Hà', N'Ngân')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE140155', N'HuyMDHE140155', N'Mai', N'Đức', N'Huy')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE140777', N'DatNTHE140777', N'Nguyễn', N'Thành', N'Đạt')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE140954', N'HuyHMHE140954', N'Hoàng', N'Minh', N'Huy')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE141083', N'DongDVHE141083', N'Đinh', N'Văn', N'Đông')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE141491', N'AnhNVHE141491', N'Nguyễn', N'Việt', N'Anh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE141683', N'HuyBQHE141683', N'Bùi', N'Quốc', N'Huy')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE150167', N'QuyetNHHE150167', N'Nguyễn', N'Hữu', N'Quyết')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE150469', N'DucTAHE150469', N'Trịnh', N'Anh', N'Đức')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE150798', N'VuCQHE150798', N'Chu', N'Quang', N'Vũ')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE150819', N'TuyenNVHE150819', N'Nguyễn', N'Văn', N'Tuyên')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE150915', N'DungNTHE150915', N'Nguyễn', N'Tuấn', N'Dũng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE151158', N'ThanhTTHE151158', N'Trần', N'Tiến', N'Thành')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE151210', N'KienVDHE151210', N'Vũ', N'Đức', N'Kiên')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE151282', N'QuanLNMHE151282', N'Lê', N'Nguyễn Minh', N'Quân')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE151297', N'BachHXHE151297', N'Hoàng', N'Xuân', N'Bách')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE151321', N'HieuTVHE151321', N'Tạ', N'Văn', N'Hiếu')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE151356', N'TungNHHE151356', N'Nguyễn', N'Huy', N'Tùng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE151366', N'SonNNHE151366', N'Nguyễn', N'Ngọc', N'Sơn')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE151407', N'AnhPHVHE151407', N'Phạm', N'Hữu Việt', N'Anh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE151431', N'TuyetDAHE151431', N'Đặng', N'Ánh', N'Tuyết')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE153012', N'HuyPNDHE153012', N'Phan', N'Nguyễn Đăng', N'Huy')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE153257', N'DungLAHE153257', N'Lê', N'Anh', N'Dũng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE153263', N'AnhLHHE153263', N'Lương', N'Huy', N'Anh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE153276', N'AnhPQHE153276', N'Phạm', N'Quang', N'Anh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE153306', N'DongPHHE153306', N'Phan', N'Hữu', N'Đông')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE153330', N'HieuDNHE153330', N'Đinh', N'Nghĩa', N'Hiếu')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE153527', N'HieuLDLHE153527', N'Lương', N'Đức Lê', N'Hiệu')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE153602', N'HoangCMHE153602', N'Cao', N'Mạnh', N'Hoàng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE153603', N'ThuBTXHE153603', N'Bùi', N'Thị Xuân', N'Thu')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE153622', N'HungNDHE153622', N'Nguyễn', N'Duy', N'Hưng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE153711', N'AnhPVHE153711', N'Phùng', N'Việt', N'Anh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE153773', N'QuyetNVHE153773', N'Nguyễn', N'Văn', N'Quyết')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE160085', N'MinhPNHE160085', N'Phạm', N'Nhật', N'Minh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE160099', N'KhanhTMHE160099', N'Trần', N'Minh', N'Khánh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE160152', N'TungLQHE160152', N'Lê', N'Quang', N'Tùng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE160328', N'HaLHHE160328', N'Lê', N'Hải', N'Hà')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE160473', N'ChauCNBHE160473', N'Cấn', N'Nguyễn Bảo', N'Châu')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE160531', N'HoangNHHE160531', N'Nguyễn', N'Huy', N'Hoàng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE160537', N'BinhPHHE160537', N'Phạm', N'Hải', N'Bình')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE160770', N'ThanhNCHE160770', N'Nguyễn', N'Công', N'Thành')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161082', N'LyNPHE161082', N'Nguyễn', N'Phương', N'Ly')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161149', N'LongPKHE161149', N'Phan', N'Kim', N'Long')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161300', N'LinhVKHE161300', N'Vũ', N'Khánh', N'Linh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161318', N'TungNQHE161318', N'Nguyễn', N'Quang', N'Tùng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161371', N'DatNMHE161371', N'Nguyễn', N'Minh', N'Đạt')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161499', N'HuyLQHE161499', N'Lê', N'Quang', N'Huy')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161530', N'HuyVNHE161530', N'Vũ', N'Ngọc', N'Huy')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161574', N'HoangPHHE161574', N'Phạm', N'Huy', N'Hoàng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161575', N'MinhNDHE161575', N'Ngô', N'Đức', N'Minh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161581', N'VuPLHE161581', N'Phạm', N'Long', N'Vũ')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161637', N'HuyDTQHE161637', N'Đỗ', N'Trần Quang', N'Huy')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161697', N'MinhDNHE161697', N'Đặng', N'Nhật', N'Minh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161699', N'HungTQHE161699', N'Trần', N'Quốc', N'Hưng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161701', N'DatDTHE161701', N'Ðoàn', N'Tiến', N'Đạt')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161722', N'KhanhTQHE161722', N'Trương', N'Quốc', N'Khánh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161827', N'SonDCHE161827', N'Dương', N'Công', N'Sơn')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161880', N'DuongVHHE161880', N'Vũ', N'Hoàng', N'Dương')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161888', N'SonKAHE161888', N'Kiều', N'Anh', N'Sơn')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161928', N'BaoNNHE161928', N'Nguyễn', N'Ngọc', N'Bảo')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE161943', N'VinhVHHE161943', N'Vũ', N'Hoàng', N'Vinh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE162004', N'SonNHHE162004', N'Nguyễn', N'Hồng', N'Sơn')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163168', N'VietBHHE163168', N'Bùi', N'Hoàng', N'Việt')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163229', N'LocCXHE163229', N'Cao', N'Xuân', N'Lộc')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163340', N'ThuTVHE163340', N'Trần', N'Việt', N'Thu')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163350', N'AnhNLVHE163350', N'Nguyễn', N'Lê Việt', N'Anh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163366', N'VinhNTHE163366', N'Nguyễn', N'Thế', N'Vinh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163390', N'DatNDHE163390', N'Nguyễn', N'Doãn', N'Đạt')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163411', N'BachLCHE163411', N'Lê', N'Công', N'Bách')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163419', N'AnhNVHE163419', N'Nguyễn', N'Vương', N'Anh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163428', N'TrangDPHE163428', N'Dương', N'Phúc', N'Tráng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163444', N'DucDHHE163444', N'Dương', N'Hải', N'Đức')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163488', N'ManhNVHE163488', N'Nguyễn', N'Văn', N'Mạnh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163519', N'ManhDNHE163519', N'Đỗ', N'Như', N'Mạnh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163538', N'HuyNTDHE163538', N'Nguyễn', N'Trọng Đức', N'Huy')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163585', N'VuNTHE163585', N'Nguyễn', N'Trung', N'Vũ')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163594', N'TungLVHE163594', N'Lưu', N'Việt', N'Tùng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163614', N'MinhKTHE163614', N'Khuất', N'Tiến', N'Minh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163615', N'DatNLMHE163615', N'Nguyễn', N'Lê Minh', N'Đạt')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163678', N'ChienHVHE163678', N'Hà', N'Viết', N'Chiến')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163751', N'NamDTHE163751', N'Đinh', N'Thế', N'Nam')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163777', N'HoaNDHE163777', N'Nguyễn', N'Đức', N'Hoà')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163781', N'DangNHHE163781', N'Nguyễn', N'Hải', N'Đăng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163884', N'HoangNMHE163884', N'Nguyễn', N'Minh', N'Hoàng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163937', N'MinhNHHE163937', N'Nguyễn', N'Hoàng', N'Minh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE163971', N'DungNDHE163971', N'Nguyễn', N'Đắc', N'Dũng')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE164001', N'DuyNTHE164001', N'Nguyễn', N'Thế', N'Duy')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE164016', N'NguyenPDTHE164016', N'Phạm', N'Danh Trung', N'Nguyên')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HE169003', N'HuyLNTHE169003', N'Lô', N'Nguyễn Thành', N'Huy')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HS150072', N'LinhHHHS150072', N'Hứa', N'Hoài', N'Linh')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HS150447', N'NguyetTTAHS150447', N'Trần', N'Thị Ánh', N'Nguyệt')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HS153184', N'HienNDHS153184', N'Nguyễn', N'Đức', N'Hiển')
INSERT [dbo].[Student] ([StudentID], [MemberCode], [Surname], [MiddleName], [GivenName]) VALUES (N'HS160522', N'CuongNHHS160522', N'Nguyễn', N'Hùng', N'Cường')
GO
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HA160009', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140155', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140777', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140954', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE141083', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE141491', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE141683', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150167', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150469', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150798', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150819', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150915', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151158', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151210', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151282', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151297', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151297', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151321', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151356', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151366', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151366', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151407', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151407', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151431', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153012', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153257', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153263', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153276', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153306', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153330', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153527', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153602', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153603', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153622', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153711', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153773', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160085', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160099', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160152', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160328', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160473', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160531', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160537', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160770', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161082', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161149', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161149', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161300', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161318', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161371', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161499', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161499', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161530', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161574', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161574', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161575', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161581', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161637', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161637', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161697', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161697', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161699', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161699', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161701', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161701', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161722', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161827', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161880', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161888', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161888', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161928', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161928', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161943', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE162004', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163168', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163229', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163340', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163350', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163366', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163390', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163411', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163419', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163428', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163444', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163488', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163519', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163538', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163594', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163614', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163615', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163678', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163751', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163777', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163781', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163884', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163884', 2)
GO
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163971', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE169003', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS150072', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS150447', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS153184', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS160522', 4)
GO
INSERT [dbo].[TimeSlot] ([TimeSlotID], [Start], [End]) VALUES (N'Slot 1', CAST(N'07:30:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotID], [Start], [End]) VALUES (N'Slot 2', CAST(N'09:10:00' AS Time), CAST(N'10:40:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotID], [Start], [End]) VALUES (N'Slot 3', CAST(N'10:50:00' AS Time), CAST(N'12:20:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotID], [Start], [End]) VALUES (N'Slot 4', CAST(N'12:50:00' AS Time), CAST(N'14:20:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotID], [Start], [End]) VALUES (N'Slot 5', CAST(N'14:30:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotID], [Start], [End]) VALUES (N'Slot 6', CAST(N'16:10:00' AS Time), CAST(N'17:40:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotID], [Start], [End]) VALUES (N'Slot 7', CAST(N'17:50:00' AS Time), CAST(N'19:20:00' AS Time))
INSERT [dbo].[TimeSlot] ([TimeSlotID], [Start], [End]) VALUES (N'Slot 8', CAST(N'19:30:00' AS Time), CAST(N'21:00:00' AS Time))
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Lecturer] ([LecturerID])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Session] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([SessionID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Session]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_TakenBy] FOREIGN KEY([TakenBy])
REFERENCES [dbo].[Lecturer] ([LecturerID])
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Course]
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecturer]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Group]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Lecturer] FOREIGN KEY([LecturerID])
REFERENCES [dbo].[Lecturer] ([LecturerID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Lecturer]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_TimeSlot] FOREIGN KEY([TimeSlotID])
REFERENCES [dbo].[TimeSlot] ([TimeSlotID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_TimeSlot]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentGroup_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_StudentGroup_Group]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentGroup_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_StudentGroup_Student]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_Assignment] SET  READ_WRITE 
GO
