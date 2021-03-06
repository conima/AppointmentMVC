USE [master]
GO
/****** Object:  Database [AppointmentMVC]    Script Date: 08/06/2015 18:38:02 ******/
CREATE DATABASE [AppointmentMVC] ON  PRIMARY 
( NAME = N'AppointmentMVC.mdf', FILENAME = N'C:\Users\Slava\Documents\My programs\AppointmentMVC\AppointmentMVC\App_Data\AppointmentMVC.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AppointmentMVC_log.ldf', FILENAME = N'C:\Users\Slava\Documents\My programs\AppointmentMVC\AppointmentMVC\App_Data\AppointmentMVC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AppointmentMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AppointmentMVC] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [AppointmentMVC] SET ANSI_NULLS OFF
GO
ALTER DATABASE [AppointmentMVC] SET ANSI_PADDING OFF
GO
ALTER DATABASE [AppointmentMVC] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [AppointmentMVC] SET ARITHABORT OFF
GO
ALTER DATABASE [AppointmentMVC] SET AUTO_CLOSE ON
GO
ALTER DATABASE [AppointmentMVC] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [AppointmentMVC] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [AppointmentMVC] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [AppointmentMVC] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [AppointmentMVC] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [AppointmentMVC] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [AppointmentMVC] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [AppointmentMVC] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [AppointmentMVC] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [AppointmentMVC] SET  ENABLE_BROKER
GO
ALTER DATABASE [AppointmentMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [AppointmentMVC] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [AppointmentMVC] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [AppointmentMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [AppointmentMVC] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [AppointmentMVC] SET READ_COMMITTED_SNAPSHOT ON
GO
ALTER DATABASE [AppointmentMVC] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [AppointmentMVC] SET  READ_WRITE
GO
ALTER DATABASE [AppointmentMVC] SET RECOVERY SIMPLE
GO
ALTER DATABASE [AppointmentMVC] SET  MULTI_USER
GO
ALTER DATABASE [AppointmentMVC] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [AppointmentMVC] SET DB_CHAINING OFF
GO
USE [AppointmentMVC]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 08/06/2015 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 08/06/2015 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeTable]    Script Date: 08/06/2015 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTable](
	[Slot] [int] IDENTITY(1,1) NOT NULL,
	[Start] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Slot] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 08/06/2015 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers] 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 08/06/2015 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 08/06/2015 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 08/06/2015 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 08/06/2015 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppDate] [date] NOT NULL,
	[Slot] [int] NOT NULL,
	[AppNumber] [int] NOT NULL,
	[Description] [nchar](250) NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentUser]    Script Date: 08/06/2015 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AppointmentUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[uspGetAvailableTime]    Script Date: 08/06/2015 18:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetAvailableTime] 
    @appDate date
AS 

    SET NOCOUNT ON;
    SELECT Start
    FROM dbo.TimeTable
    WHERE Start NOT IN 
   (SELECT Start FROM dbo.TimeTable AS t INNER JOIN dbo.Appointment AS a ON t.Slot = a.Slot
	WHERE a.AppDate = @appDate)
GO
/****** Object:  StoredProcedure [dbo].[uspSetDescription]    Script Date: 08/06/2015 18:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*select * from dbo.Appointment*/

CREATE PROCEDURE [dbo].[uspSetDescription]
    @Id int,
	@text nchar(250)
AS 

    SET NOCOUNT ON;
    
	UPDATE dbo.Appointment SET [Description] = @text WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[uspSetAppointment]    Script Date: 08/06/2015 18:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSetAppointment]
    @userName nvarchar(256),
	@timeSlot int,
	@appDate date
AS 

    SET NOCOUNT ON;
    
	INSERT INTO dbo.Appointment (AppDate, Slot, AppNumber) VALUES (@appDate, @timeSlot, 
	(SELECT COUNT(*) FROM dbo.AppointmentUser WHERE UserId = (SELECT Id FROM dbo.AspNetUsers WHERE UserName = @userName)))
	DECLARE @lastId nvarchar(128)
	SET @lastId = (SELECT SCOPE_IDENTITY())
	IF EXISTS (SELECT Id FROM dbo.AspNetUsers WHERE UserName = @userName)
	INSERT INTO dbo.AppointmentUser (AppointmentId, UserId) VALUES (@lastId, 
	(SELECT Id FROM dbo.AspNetUsers WHERE UserName = @userName))
GO
/****** Object:  StoredProcedure [dbo].[uspGetMyAppointments]    Script Date: 08/06/2015 18:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetMyAppointments] 
    @UserName nvarchar(256)
 AS 
    SET NOCOUNT ON;
    SELECT ap.Id, ap.AppDate, (SELECT Start FROM TimeTable WHERE Slot = ap.Slot) AS 'Time', a.FirstName, a.LastName, ap.AppNumber
    FROM dbo.AspNetUsers a 
	INNER JOIN dbo.AppointmentUser au ON a.Id = au.UserId
	INNER JOIN Appointment ap ON ap.Id = au.AppointmentId WHERE a.UserName = @UserName AND ap.AppDate > GETDATE()
	ORDER BY ap.AppDate, 'Time'
GO
/****** Object:  StoredProcedure [dbo].[uspGetAppointmentlist]    Script Date: 08/06/2015 18:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetAppointmentlist] 
    @appDate date
 AS 
    SET NOCOUNT ON;
    SELECT ap.Id, (SELECT Start FROM TimeTable WHERE Slot = ap.Slot) AS 'Time', a.FirstName, a.LastName, a.Email, ap.AppNumber,
	ISNULL(ap.Description, '') AS 'Description' FROM dbo.AspNetUsers a 
	INNER JOIN dbo.AppointmentUser au ON a.Id = au.UserId
	INNER JOIN Appointment ap ON ap.Id = au.AppointmentId WHERE ap.AppDate = @appDate
	ORDER BY 'Time'
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteMyAppointments]    Script Date: 08/06/2015 18:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspDeleteMyAppointments] 
    @Id int
 AS 
        
	DELETE FROM AppointmentUser WHERE AppointmentId = @Id
	DELETE FROM Appointment WHERE Id = @Id
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 08/06/2015 18:38:04 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 08/06/2015 18:38:04 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 08/06/2015 18:38:04 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 08/06/2015 18:38:04 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_Appointment_TimeTable]    Script Date: 08/06/2015 18:38:04 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_TimeTable] FOREIGN KEY([Slot])
REFERENCES [dbo].[TimeTable] ([Slot])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_TimeTable]
GO
/****** Object:  ForeignKey [FK_AppointmentUser_Appointment]    Script Date: 08/06/2015 18:38:04 ******/
ALTER TABLE [dbo].[AppointmentUser]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentUser_Appointment] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointment] ([Id])
GO
ALTER TABLE [dbo].[AppointmentUser] CHECK CONSTRAINT [FK_AppointmentUser_Appointment]
GO
/****** Object:  ForeignKey [FK_AppointmentUser_AspNetJUsers]    Script Date: 08/06/2015 18:38:04 ******/
ALTER TABLE [dbo].[AppointmentUser]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentUser_AspNetJUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AppointmentUser] CHECK CONSTRAINT [FK_AppointmentUser_AspNetJUsers]
GO
