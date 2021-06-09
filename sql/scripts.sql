USE [master]
GO
/****** Object:  Database [ULUDAG_ASSIGNMENT]    Script Date: 2021-06-10 01:47:25 ******/
CREATE DATABASE [ULUDAG_ASSIGNMENT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ULUDAG_ASSIGNMENT', FILENAME = N'C:\_sql\MSSQL12.MSSQLSERVER\MSSQL\DATA\ULUDAG_ASSIGNMENT.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ULUDAG_ASSIGNMENT_log', FILENAME = N'C:\_sql\MSSQL12.MSSQLSERVER\MSSQL\DATA\ULUDAG_ASSIGNMENT_log.ldf' , SIZE = 7168KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ULUDAG_ASSIGNMENT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET ARITHABORT OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET RECOVERY FULL 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET  MULTI_USER 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ULUDAG_ASSIGNMENT]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[type] [nvarchar](max) NULL,
	[assignmentId] [uniqueidentifier] NULL,
	[studentId] [uniqueidentifier] NULL,
	[groupId] [uniqueidentifier] NULL,
	[description] [nvarchar](max) NULL,
	[createdOn] [datetime] NOT NULL,
	[createdBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignees]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignees](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[assignmentId] [uniqueidentifier] NOT NULL,
	[studentId] [uniqueidentifier] NOT NULL,
	[groupId] [uniqueidentifier] NULL,
	[lecturerId] [uniqueidentifier] NOT NULL,
	[status] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[createdBy] [uniqueidentifier] NOT NULL,
	[modifiedOn] [datetime] NULL,
	[modifiedBy] [uniqueidentifier] NULL,
	[academicYear] [int] NULL,
	[semester] [int] NULL,
	[dueFrom] [datetime] NULL,
	[dueTo] [datetime] NULL,
 CONSTRAINT [PK_Assignees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignmentPool]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentPool](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[type] [uniqueidentifier] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL,
	[status] [int] NOT NULL,
	[unit] [uniqueidentifier] NULL,
	[department] [uniqueidentifier] NULL,
	[program] [uniqueidentifier] NULL,
	[lecture] [uniqueidentifier] NULL,
	[assetUrl] [nvarchar](max) NULL,
	[createdOn] [datetime] NOT NULL,
	[createdBy] [uniqueidentifier] NOT NULL,
	[modifiedOn] [datetime] NULL,
	[modifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AssignmentPool] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[status] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[createdBy] [uniqueidentifier] NOT NULL,
	[modifiedOn] [datetime] NULL,
	[modifiedBy] [uniqueidentifier] NULL,
	[type] [uniqueidentifier] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL,
	[assetUrl] [nvarchar](max) NULL,
	[unit] [uniqueidentifier] NULL,
	[department] [uniqueidentifier] NULL,
	[program] [uniqueidentifier] NULL,
	[lecture] [uniqueidentifier] NULL,
	[lecturer] [uniqueidentifier] NULL,
	[academicYear] [int] NULL,
	[semester] [int] NULL,
	[dueFrom] [datetime] NULL,
	[dueTo] [datetime] NULL,
 CONSTRAINT [PK_Assignments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignmentTypes]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentTypes](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[status] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[createdBy] [uniqueidentifier] NOT NULL,
	[modifiedOn] [datetime] NULL,
	[modifiedBy] [uniqueidentifier] NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_AssignmentTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[name] [nvarchar](max) NULL,
	[listOrder] [int] NULL,
	[statusId] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[createdBy] [uniqueidentifier] NOT NULL,
	[modifiedOn] [datetime] NULL,
	[modifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[name] [nvarchar](max) NULL,
	[listOrder] [int] NULL,
	[statusId] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[createdBy] [uniqueidentifier] NOT NULL,
	[modifiedOn] [datetime] NULL,
	[modifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LecturerDetails]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LecturerDetails](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[userId] [uniqueidentifier] NOT NULL,
	[title] [nvarchar](max) NULL,
	[faculty] [uniqueidentifier] NOT NULL,
	[department] [uniqueidentifier] NOT NULL,
	[program] [uniqueidentifier] NULL,
	[createdOn] [datetime] NOT NULL,
	[modifiedOn] [datetime] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Lecturers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[statusId] [int] NOT NULL,
	[listOrder] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[createdBy] [nvarchar](max) NULL,
	[modifiedOn] [datetime] NOT NULL,
	[modifiedBy] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[code] [nvarchar](max) NOT NULL,
	[credits] [int] NOT NULL,
	[lecturer] [uniqueidentifier] NULL,
	[department] [uniqueidentifier] NOT NULL,
	[unit] [uniqueidentifier] NOT NULL,
	[program] [uniqueidentifier] NOT NULL,
	[semester] [int] NOT NULL,
	[academicYear] [int] NOT NULL,
 CONSTRAINT [PK_Lectures] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LectureStudents]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LectureStudents](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[lectureId] [uniqueidentifier] NOT NULL,
	[studentId] [uniqueidentifier] NOT NULL,
	[academicYear] [int] NOT NULL,
	[semester] [int] NOT NULL,
	[year] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[modifiedOn] [datetime] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_LectureStudents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramsAndDivisions]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramsAndDivisions](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[name] [nvarchar](max) NULL,
	[listOrder] [int] NULL,
	[statusId] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[createdBy] [uniqueidentifier] NOT NULL,
	[modifiedOn] [datetime] NULL,
	[modifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ProgramsAndDivisions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyValues]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyValues](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[propertyName] [nvarchar](max) NULL,
	[propertyValue] [nvarchar](max) NULL,
	[groupName] [nvarchar](max) NULL,
	[listOrder] [int] NOT NULL,
 CONSTRAINT [PK_PropertyValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentDetails]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentDetails](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[userId] [uniqueidentifier] NOT NULL,
	[studentNumber] [nvarchar](20) NOT NULL,
	[entranceDate] [date] NOT NULL,
	[unit] [uniqueidentifier] NOT NULL,
	[department] [uniqueidentifier] NOT NULL,
	[program] [uniqueidentifier] NOT NULL,
	[yearOfBirth] [int] NULL,
	[pictureUrl] [nvarchar](max) NULL,
	[grade] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[modifiedOn] [datetime] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_StudentDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentLectureGroups]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentLectureGroups](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL,
	[lectureId] [uniqueidentifier] NOT NULL,
	[status] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[createdBy] [uniqueidentifier] NOT NULL,
	[modifiedOn] [datetime] NULL,
	[modifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_StudentLectureGroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogs]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogs](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[userId] [uniqueidentifier] NOT NULL,
	[detailId] [uniqueidentifier] NOT NULL,
	[action] [nvarchar](max) NULL,
	[detail] [nvarchar](max) NULL,
	[createdOn] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UserLogs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[name] [nvarchar](max) NULL,
	[status] [int] NOT NULL,
	[listOrder] [int] NOT NULL,
	[enumCode] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[firstName] [nvarchar](max) NULL,
	[lastName] [nvarchar](max) NULL,
	[email] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[role] [uniqueidentifier] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[modifiedOn] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[passwordKey] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[accessToken] [nvarchar](max) NOT NULL,
	[validUntil] [datetime] NOT NULL,
	[userId] [uniqueidentifier] NOT NULL,
	[isValid] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vLecturers]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLecturers]
AS
SELECT        ld.id, u.id AS userId, ld.title, u.firstName + ' ' + u.lastName AS fullName, f.name AS facultyName, d.name AS department, p.name AS program
FROM            dbo.LecturerDetails AS ld LEFT OUTER JOIN
                         dbo.Users AS u ON u.id = ld.userId LEFT OUTER JOIN
                         dbo.Faculties AS f ON ld.faculty = f.id LEFT OUTER JOIN
                         dbo.Departments AS d ON ld.department = d.id LEFT OUTER JOIN
                         dbo.ProgramsAndDivisions AS p ON ld.program = p.id
GO
/****** Object:  View [dbo].[vStudents]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vStudents]
AS
SELECT        dbo.Users.id, dbo.Users.firstName, dbo.Users.lastName, dbo.Users.email, dbo.Users.phone, dbo.UserRoles.name, dbo.UserRoles.enumCode, dbo.StudentDetails.id AS studentId, dbo.StudentDetails.studentNumber, 
                         dbo.StudentDetails.entranceDate, dbo.StudentDetails.unit, dbo.Faculties.name AS facultyName, dbo.StudentDetails.department, dbo.Departments.name AS departmentName, dbo.StudentDetails.program, 
                         dbo.ProgramsAndDivisions.name AS programName, dbo.StudentDetails.yearOfBirth, dbo.StudentDetails.pictureUrl, dbo.StudentDetails.grade, dbo.StudentDetails.createdOn, dbo.StudentDetails.modifiedOn, 
                         dbo.StudentDetails.status
FROM            dbo.Users INNER JOIN
                         dbo.UserRoles ON dbo.Users.role = dbo.UserRoles.id INNER JOIN
                         dbo.StudentDetails ON dbo.Users.id = dbo.StudentDetails.userId LEFT OUTER JOIN
                         dbo.ProgramsAndDivisions ON dbo.StudentDetails.program = dbo.ProgramsAndDivisions.id LEFT OUTER JOIN
                         dbo.Departments ON dbo.StudentDetails.department = dbo.Departments.id LEFT OUTER JOIN
                         dbo.Faculties ON dbo.StudentDetails.unit = dbo.Faculties.id
GO
ALTER TABLE [dbo].[Activities] ADD  CONSTRAINT [DF_Activities_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Activities] ADD  CONSTRAINT [DF_Activities_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Assignees] ADD  CONSTRAINT [DF_Assignees_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Assignees] ADD  CONSTRAINT [DF_Assignees_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Assignees] ADD  CONSTRAINT [DF_Assignees_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[AssignmentPool] ADD  CONSTRAINT [DF_AssignmentPool_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[AssignmentPool] ADD  CONSTRAINT [DF_AssignmentPool_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[AssignmentPool] ADD  CONSTRAINT [DF_AssignmentPool_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Assignments] ADD  CONSTRAINT [DF_Assignments_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Assignments] ADD  CONSTRAINT [DF_Assignments_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Assignments] ADD  CONSTRAINT [DF_Assignments_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[AssignmentTypes] ADD  CONSTRAINT [DF_AssignmentTypes_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[AssignmentTypes] ADD  CONSTRAINT [DF_AssignmentTypes_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[AssignmentTypes] ADD  CONSTRAINT [DF_AssignmentTypes_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [DF_Departments_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [DF_Departments_status]  DEFAULT ((0)) FOR [statusId]
GO
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [DF_Departments_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Faculties] ADD  CONSTRAINT [DF_Faculties_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Faculties] ADD  CONSTRAINT [DF_Faculties_listOrder]  DEFAULT ((100)) FOR [listOrder]
GO
ALTER TABLE [dbo].[Faculties] ADD  CONSTRAINT [DF_Faculties_status]  DEFAULT ((0)) FOR [statusId]
GO
ALTER TABLE [dbo].[Faculties] ADD  CONSTRAINT [DF_Table_1_createdOn1]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[LecturerDetails] ADD  CONSTRAINT [DF_Lecturers_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[LecturerDetails] ADD  CONSTRAINT [DF_Lecturers_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[LecturerDetails] ADD  CONSTRAINT [DF_Lecturers_modifiedOn]  DEFAULT (getdate()) FOR [modifiedOn]
GO
ALTER TABLE [dbo].[LecturerDetails] ADD  CONSTRAINT [DF_Lecturers_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Lectures] ADD  CONSTRAINT [DF_Lectures_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Lectures] ADD  CONSTRAINT [DF_Lectures_status]  DEFAULT ((0)) FOR [statusId]
GO
ALTER TABLE [dbo].[Lectures] ADD  CONSTRAINT [DF_Lectures_listOrder]  DEFAULT ((100)) FOR [listOrder]
GO
ALTER TABLE [dbo].[Lectures] ADD  CONSTRAINT [DF_Lectures_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Lectures] ADD  CONSTRAINT [DF_Lectures_modifiedOn]  DEFAULT (getdate()) FOR [modifiedOn]
GO
ALTER TABLE [dbo].[Lectures] ADD  CONSTRAINT [DF_Lectures_credits]  DEFAULT ((0)) FOR [credits]
GO
ALTER TABLE [dbo].[Lectures] ADD  CONSTRAINT [DF_Lectures_semester]  DEFAULT ((1)) FOR [semester]
GO
ALTER TABLE [dbo].[Lectures] ADD  CONSTRAINT [DF_Lectures_academicYear]  DEFAULT ((0)) FOR [academicYear]
GO
ALTER TABLE [dbo].[LectureStudents] ADD  CONSTRAINT [DF_LectureStudents_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[LectureStudents] ADD  CONSTRAINT [DF_LectureStudents_academicYear]  DEFAULT ((1)) FOR [academicYear]
GO
ALTER TABLE [dbo].[LectureStudents] ADD  CONSTRAINT [DF_LectureStudents_semester]  DEFAULT ((1)) FOR [semester]
GO
ALTER TABLE [dbo].[LectureStudents] ADD  CONSTRAINT [DF_LectureStudents_year]  DEFAULT (datepart(year,getdate())) FOR [year]
GO
ALTER TABLE [dbo].[LectureStudents] ADD  CONSTRAINT [DF_LectureStudents_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[LectureStudents] ADD  CONSTRAINT [DF_LectureStudents_modifiedOn]  DEFAULT (getdate()) FOR [modifiedOn]
GO
ALTER TABLE [dbo].[LectureStudents] ADD  CONSTRAINT [DF_LectureStudents_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[ProgramsAndDivisions] ADD  CONSTRAINT [DF_ProgramsAndDivisions_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[ProgramsAndDivisions] ADD  CONSTRAINT [DF_ProgramsAndDivisions_status]  DEFAULT ((0)) FOR [statusId]
GO
ALTER TABLE [dbo].[ProgramsAndDivisions] ADD  CONSTRAINT [DF_ProgramsAndDivisions_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[PropertyValues] ADD  CONSTRAINT [DF_PropertyValues_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[PropertyValues] ADD  CONSTRAINT [DF_PropertyValues_listOrder]  DEFAULT ((100)) FOR [listOrder]
GO
ALTER TABLE [dbo].[StudentDetails] ADD  CONSTRAINT [DF_StudentDetails_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[StudentDetails] ADD  CONSTRAINT [DF_StudentDetails_grade]  DEFAULT ((1)) FOR [grade]
GO
ALTER TABLE [dbo].[StudentDetails] ADD  CONSTRAINT [DF_StudentDetails_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[StudentDetails] ADD  CONSTRAINT [DF_StudentDetails_modifiedOn]  DEFAULT (getdate()) FOR [modifiedOn]
GO
ALTER TABLE [dbo].[StudentDetails] ADD  CONSTRAINT [DF_StudentDetails_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[StudentLectureGroups] ADD  CONSTRAINT [DF_StudentLectureGroups_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[StudentLectureGroups] ADD  CONSTRAINT [DF_StudentLectureGroups_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[StudentLectureGroups] ADD  CONSTRAINT [DF_StudentLectureGroups_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[UserLogs] ADD  CONSTRAINT [DF_UserLogs_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[UserLogs] ADD  CONSTRAINT [DF_UserLogs_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [DF_UserRoles_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [DF_UserRoles_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [DF_UserRoles_listOrder]  DEFAULT ((100)) FOR [listOrder]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_modifiedOn]  DEFAULT (getdate()) FOR [modifiedOn]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[UserTokens] ADD  CONSTRAINT [DF_UserTokens_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[UserTokens] ADD  CONSTRAINT [DF_UserTokens_isValid]  DEFAULT ((0)) FOR [isValid]
GO
ALTER TABLE [dbo].[UserTokens] ADD  CONSTRAINT [DF_UserTokens_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
/****** Object:  StoredProcedure [dbo].[spAddDepartment]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddDepartment] 
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@name nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	INSERT INTO Departments ([name], [createdBy]) VALUES (@name, @userId)

	DECLARE @id uniqueIdentifier = (SELECT TOP 1 id FROM Departments WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC)
	SELECT CAST(1 AS bit) AS success, @id AS [data]

	--SELECT TOP 1 * FROM Faculties WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spAddDivisionAndProgram]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddDivisionAndProgram] 
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@name nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	INSERT INTO ProgramsAndDivisions ([name], [createdBy]) VALUES (@name, @userId)

	DECLARE @facultyId uniqueIdentifier = (SELECT TOP 1 id FROM ProgramsAndDivisions WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC)
	SELECT CAST(1 AS bit) AS success, @facultyId AS [data]

	--SELECT TOP 1 * FROM Faculties WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spAddFaculty]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddFaculty] 
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@name nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	INSERT INTO Faculties ([name], [createdBy]) VALUES (@name, @userId)

	DECLARE @id uniqueIdentifier = (SELECT TOP 1 id FROM Faculties WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC)
	SELECT CAST(1 AS bit) AS success, @id AS [data]

	--SELECT TOP 1 * FROM Faculties WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spAddLecture]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddLecture] 
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@name nvarchar(max),
	@description nvarchar(max),
	@code nvarchar(max),
	@credits int,
	@lecturer nvarchar(max),
	@department nvarchar(max),
	@unit nvarchar(max),
	@program nvarchar(max),
	@semester int,
	@academicYear int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	INSERT INTO Lectures([name], [createdBy], [description], [code], [credits], [lecturer], [department], [unit], [program], [semester], [academicYear]) VALUES (@name, @userId, @description, @code, @credits, @lecturer, @department, @unit, @program, @semester, @academicYear)

	DECLARE @id uniqueIdentifier = (SELECT TOP 1 id FROM Lectures WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC)
	SELECT CAST(1 AS bit) AS success, @id AS [data]

	--SELECT TOP 1 * FROM Faculties WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spAddLecturer]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddLecturer] 
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@userId nvarchar(max),
	@title nvarchar(max) = null,
	@faculty nvarchar(max) = null,
	@department nvarchar(max) = null,
	@program nvarchar(max) = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @adminId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	INSERT INTO LecturerDetails(userId, title, faculty, department, program) VALUES (@userId, @title, @faculty, @department, @program)

	DECLARE @Id uniqueIdentifier = (SELECT TOP 1 id FROM LecturerDetails WHERE userId=@userId ORDER BY createdOn ASC)
	SELECT CAST(1 AS bit) AS success, @Id AS [data]

	--SELECT TOP 1 * FROM Faculties WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spAddUser]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ilker
-- Create date: 2021-05-17
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddUser]
	@email nvarchar(max),
	@role nvarchar(10),
	@firstname nvarchar(max),
	@lastname nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT * FROM [Users] WHERE [email]=@email)
	BEGIN
		SELECT CAST(0 AS bit) AS success, CAST(1 as bit) AS error, 'Eposta zaten kayıtlı' AS [message]
	END
	ELSE
	BEGIN 
		DECLARE @roleEnum uniqueIdentifier = ISNULL((SELECT TOP 1 ur.id FROM [UserRoles] ur WHERE ur.enumCode = @role),(SELECT TOP 1 ur.id FROM [UserRoles] ur WHERE ur.enumCode = 'GUE'))
		DECLARE @passwordKey VARCHAR(255) = left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)

		INSERT INTO [Users] (firstName, lastName, email, [password], [role], passwordKey)
		VALUES (@firstname, @lastname, @email, 'changeThis', @roleEnum, @passwordKey)

		DECLARE @id uniqueIdentifier =( SELECT TOP 1 id FROM [Users] WHERE email=@email ORDER BY createdOn DESC)
		SELECT CAST(1 AS bit) AS success, @id AS [data], 'Kayıt oluşturuldu' AS [message]
		
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spCheckUser]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCheckUser]
	@accessToken nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT TOP 1 
	id
	FROM [UserTokens] 
	WHERE accessToken = @accessToken AND isValid = 1 
	AND DateDiff(MINUTE, getDate(), validUntil) > 0
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteFaculty]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteFaculty] 
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@id nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF EXISTS(  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)) 
	BEGIN
		DELETE FROM Faculties WHERE id=@id
		SELECT CAST(1 AS bit) AS success, @id AS [data]
	END
	ELSE
		BEGIN
		SELECT CAST(0 AS bit) AS success, @id AS [data]
	END


END
GO
/****** Object:  StoredProcedure [dbo].[spGetFaculties]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetFaculties] 
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	SELECT TOP 1 * FROM Faculties ORDER BY listOrder ASC

	--SELECT TOP 1 * FROM Faculties WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spGetFaculty]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetFaculty] 
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@id nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	SELECT TOP 1 * FROM Faculties WHERE id=@id

	--SELECT TOP 1 * FROM Faculties WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spGetFacultyList]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetFacultyList] 
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	SELECT TOP 100 * FROM Faculties ORDER BY [name]

	--SELECT TOP 1 * FROM Faculties WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spGetLecturer]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetLecturer]
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@id nvarchar(max) = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	IF @userId IS NULL
	BEGIN
		SELECT CAST(0 AS bit) as success
	END
	ELSE
	BEGIN
		IF @id IS NULL
		BEGIN
			SELECT TOP 1000 * FROM vLecturers
		END
		ELSE
		BEGIN
			SELECT TOP 1000 * FROM vLecturers WHERE id = @id
		END
	END


END
GO
/****** Object:  StoredProcedure [dbo].[spGetLecturerByUserId]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetLecturerByUserId]
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@id nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	IF @userId IS NULL
	BEGIN
		SELECT CAST(0 AS bit) as success
	END
	ELSE
	BEGIN
		SELECT TOP 1000 * FROM vLecturers WHERE userId = @id
	END


END
GO
/****** Object:  StoredProcedure [dbo].[spGetLecturers]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetLecturers]
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@id nvarchar(max) = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	IF @userId IS NULL
	BEGIN
		SELECT CAST(0 AS bit) as success
	END
	ELSE
	BEGIN
		IF @id IS NULL
		BEGIN
			SELECT TOP 1000 * FROM vLecturers
		END
		ELSE
		BEGIN
			SELECT TOP 1000 * FROM vLecturers WHERE id = @id
		END
	END


END
GO
/****** Object:  StoredProcedure [dbo].[spGetLectures]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetLectures] 
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	SELECT TOP 1 * FROM Lectures ORDER BY listOrder ASC

	--SELECT TOP 1 * FROM Faculties WHERE [name]=@name AND createdBy=@userId ORDER BY createdOn ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spGetStudentByUserId]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetStudentByUserId]
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@id uniqueIdentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 
	id
	FROM [UserTokens] 
	WHERE accessToken = @accessToken AND isValid = 1 
	AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	IF @userId IS NULL
	BEGIN 
	SELECT CAST(0 AS bit) AS success
	END
	ELSE
	BEGIN
		SELECT TOP 1 * FROM vStudents WHERE id=@userId
	END

END
GO
/****** Object:  StoredProcedure [dbo].[spGetUser]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetUser]
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 
											id
											FROM [UserTokens] 
											WHERE accessToken = @accessToken AND isValid = 1 
											AND DateDiff(MINUTE, getDate(), validUntil) > 0)

    -- Insert statements for procedure here
	IF @userId IS NULL
		BEGIN 
		SELECT CAST(0 AS bit) AS success
		END
	ELSE
		BEGIN
			SELECT TOP 1 * FROM Users WHERE id=@userId
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spSaveFaculty]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSaveFaculty] 
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@id nvarchar(max),
	@name nvarchar(max),
	@statusId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	UPDATE Faculties 
	SET [modifiedBy]=@userId, 
		[modifiedOn]=GETDATE(), 
		[name]=@name, 
		[statusId]=@statusId
	WHERE [id]=@id

	SELECT TOP 1 * FROM Faculties WHERE [id]=@id

END
GO
/****** Object:  StoredProcedure [dbo].[spSaveLecture]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSaveLecture] 
	-- Add the parameters for the stored procedure here
	@accessToken nvarchar(max),
	@id nvarchar(max),
	@name nvarchar(max),
	@description nvarchar(max),
	@code nvarchar(max),
	@credits int,
	@lecturer nvarchar(max),
	@department nvarchar(max),
	@unit nvarchar(max),
	@program nvarchar(max),
	@semester int,
	@academicYear int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @userId uniqueIdentifier =  (SELECT TOP 1 id FROM [UserTokens] WHERE accessToken = @accessToken AND isValid = 1 AND DateDiff(MINUTE, getDate(), validUntil) > 0)

	UPDATE Lectures 
	SET [modifiedBy]=@userId, 
		[modifiedOn]=GETDATE(), 
		[name]=@name, 
		[description]=@description, 
		[code]=@code, 
		[credits]=@credits, 
		[lecturer]=@lecturer, 
		[department]=@department, 
		[unit]=@unit, 
		[program]=@program, 
		[semester]=@semester, 
		[academicYear]=@academicYear 
	WHERE [id]=@id

	SELECT TOP 1 * FROM Lectures WHERE [id]=@id

END
GO
/****** Object:  StoredProcedure [dbo].[spSignin]    Script Date: 2021-06-10 01:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ilker
-- Create date: 2021-04-12
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSignin]
	@username nvarchar(max),
	@password nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT * FROM [Users] WHERE [email]=@username AND [password]=@password)
	BEGIN
		DECLARE @userId uniqueIdentifier = ISNULL((SELECT TOP 1 u.id FROM [Users] u INNER JOIN [UserRoles] ur ON u.[role]=ur.id WHERE  u.[email]=@username AND u.[password]=@password),NEWID())
		DECLARE @roleEnum nvarchar(3) = ISNULL((SELECT TOP 1 ur.[enumCode] FROM [Users] u INNER JOIN [UserRoles] ur ON u.[role]=ur.id WHERE  u.[email]=@username AND u.[password]=@password),'GUE')
		
		DECLARE @accessToken VARCHAR(255) = left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)
		UPDATE [UserTokens] SET [isValid]=0 WHERE [userId]=@userId
		
		INSERT INTO [UserTokens] ([userId], [accessToken], isValid, validUntil) VALUES (@userId, @accessToken, 1, DATEADD(Day, 1, GETDATE()))

		IF @roleEnum = 'LEC' OR @roleEnum = 'ADM' 
		BEGIN
			SELECT TOP 1
				CAST(1 AS BIT) AS success,
				CONVERT(VARCHAR, ut.validUntil, 126) AS validUntil,
				@accessToken AS accessToken,
				'Giris Basarili' AS [message],
				ld.id AS profileId,
				@roleEnum AS 'role',
				@userId AS userId,
				firstName, lastName
				FROM [UserTokens] ut
				INNER JOIN [Users] u ON ut.userId=u.id
				LEFT JOIN [LecturerDetails] ld ON u.id=ld.userId
				WHERE ut.isValid = 1 AND ut.accessToken=@accessToken AND DATEDIFF(MINUTE, GETDATE(), ut.validUntil) > 0
				AND u.[status] > 0
				ORDER BY ut.createdOn DESC
		END
		ELSE IF @roleEnum = 'STU'
		BEGIN
			SELECT TOP 1
				CAST(1 AS BIT) AS success,
				CONVERT(VARCHAR, ut.validUntil, 126) AS validUntil,
				@accessToken AS accessToken,
				'Giris Basarili' AS [message],
				sd.id AS profileId,
				@roleEnum AS 'role',
				@userId AS userId,
				firstName, lastName
				FROM [UserTokens] ut
				INNER JOIN [Users] u ON ut.userId=u.id
				INNER JOIN [StudentDetails] sd ON u.id=sd.userId
				WHERE ut.isValid = 1 AND ut.accessToken=@accessToken AND DATEDIFF(MINUTE, GETDATE(), ut.validUntil) > 0
				AND sd.status > 0 AND u.[status] > 0
				ORDER BY ut.createdOn DESC
		END
		ELSE 
		BEGIN 
			SELECT CAST(0 AS bit) AS success, CAST(1 AS bit) AS error, 'Yetkisiz kullanıcı' AS [message]
		END


	END
	ELSE
	BEGIN
		SELECT CAST(0 AS bit) AS success, CAST(1 AS bit) AS error, 'Hatalı kullanıcı adı veya şifre' AS [message]
	END
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ld"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "f"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vLecturers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vLecturers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "UserRoles"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "StudentDetails"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 198
               Right = 627
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "Faculties"
            Begin Extent = 
               Top = 6
               Left = 665
               Bottom = 136
               Right = 835
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Departments"
            Begin Extent = 
               Top = 6
               Left = 873
               Bottom = 136
               Right = 1043
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProgramsAndDivisions"
            Begin Extent = 
               Top = 6
               Left = 1081
               Bottom = 136
               Right = 1251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vStudents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vStudents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vStudents'
GO
USE [master]
GO
ALTER DATABASE [ULUDAG_ASSIGNMENT] SET  READ_WRITE 
GO
