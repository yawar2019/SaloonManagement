USE [master]
GO
/****** Object:  Database [SaloonManagement]    Script Date: 28-Nov-20 9:40:19 AM ******/
CREATE DATABASE [SaloonManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaloonManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SaloonManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SaloonManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SaloonManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SaloonManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaloonManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaloonManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaloonManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaloonManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaloonManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaloonManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaloonManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SaloonManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaloonManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaloonManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaloonManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaloonManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaloonManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaloonManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaloonManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaloonManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SaloonManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaloonManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaloonManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaloonManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaloonManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaloonManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SaloonManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaloonManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SaloonManagement] SET  MULTI_USER 
GO
ALTER DATABASE [SaloonManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaloonManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaloonManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaloonManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SaloonManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SaloonManagement]
GO
/****** Object:  Table [dbo].[Degree]    Script Date: 28-Nov-20 9:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Degree](
	[DegreeId] [int] IDENTITY(1,1) NOT NULL,
	[DegreeName] [varchar](100) NULL,
	[Description] [varchar](max) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Degree] PRIMARY KEY CLUSTERED 
(
	[DegreeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeShift]    Script Date: 28-Nov-20 9:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeShift](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[ShiftId] [varchar](100) NULL,
 CONSTRAINT [PK_EmployeShift] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spr_GetDegree]    Script Date: 28-Nov-20 9:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create procedure [dbo].[spr_GetDegree]
  as
  begin
SELECT TOP 1000 [DegreeId]
      ,[DegreeName]
      ,[Description]
      ,[CreatedBy]
      ,[UpdatedBy]
      ,[CreatedOn]
      ,[UpdatedOn]
  FROM [SaloonManagement].[dbo].[Degree]
  end
GO
/****** Object:  StoredProcedure [dbo].[spr_GetDegreeById]    Script Date: 28-Nov-20 9:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create procedure [dbo].[spr_GetDegreeById]
@DegreeId int
  as
  begin
SELECT TOP 1000 [DegreeId]
      ,[DegreeName]
      ,[Description]
      ,[CreatedBy]
      ,[UpdatedBy]
      ,[CreatedOn]
      ,[UpdatedOn]
  FROM [SaloonManagement].[dbo].[Degree] where DegreeId=@DegreeId
  end
GO
/****** Object:  StoredProcedure [dbo].[spr_GetEmployeShift]    Script Date: 28-Nov-20 9:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create procedure [dbo].[spr_GetEmployeShift]
as 
begin
SELECT TOP 1000 [EmployeeId]
      ,[date]
      ,[ShiftId]
  FROM [SaloonManagement].[dbo].[EmployeShift]
  end
GO
/****** Object:  StoredProcedure [dbo].[spr_insertDegree]    Script Date: 28-Nov-20 9:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[spr_insertDegree]
@DegreeName varchar(100),
@Description varchar(MAX),
@CreatedBy int,
@UbdatedBy int,
@CreatedOn datetime,
@UpdatedOn datetime

AS

BEGIN
insert into Degree values(@DegreeName,@Description,
@CreatedBy ,
@UbdatedBy ,
@CreatedOn ,
@UPdatedOn
)
   select @@IDENTITY as int

END
GO
/****** Object:  StoredProcedure [dbo].[spr_insertEmployeShift]    Script Date: 28-Nov-20 9:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create procedure [dbo].[spr_insertEmployeShift]
@date datetime,
@ShiftId varchar(100)

as 
begin
insert into EmployeShift values(@date,@ShiftId)
     select @@IDENTITY as int
  end
GO
/****** Object:  StoredProcedure [dbo].[spr_UpdateDegree]    Script Date: 28-Nov-20 9:40:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

create procedure [dbo].[spr_UpdateDegree]
@DegreeId int,
@DegreeName varchar(100),
@Description varchar(MAX),
@CreatedBy int,
@UpdatedBy int,
@CreatedOn datetime,
@UpdatedOn datetime

AS

BEGIN
update Degree set DegreeName=@DegreeName,Description=@Description,
CreatedBy=@CreatedBy,UpdatedBy=@UpdatedBy,
CreatedOn=@CreatedOn,UpdatedOn=@UpdatedOn  where DegreeId=@DegreeId

END

GO
USE [master]
GO
ALTER DATABASE [SaloonManagement] SET  READ_WRITE 
GO
