USE [master]
GO
/****** Object:  Database [SaloonManagement]    Script Date: 11/28/2020 10:31:27 PM ******/
CREATE DATABASE [SaloonManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaloonManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.VALI\MSSQL\DATA\SaloonManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SaloonManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.VALI\MSSQL\DATA\SaloonManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SaloonManagement] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [SaloonManagement] SET  ENABLE_BROKER 
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
ALTER DATABASE [SaloonManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [SaloonManagement] SET  MULTI_USER 
GO
ALTER DATABASE [SaloonManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaloonManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaloonManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaloonManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SaloonManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SaloonManagement', N'ON'
GO
ALTER DATABASE [SaloonManagement] SET QUERY_STORE = OFF
GO
USE [SaloonManagement]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 11/28/2020 10:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [varchar](20) NULL,
	[EmployeeName] [varchar](20) NULL,
	[DepartmentId] [int] NULL,
	[Emailid] [varchar](50) NULL,
	[Mobileno] [varchar](20) NULL,
	[Adress] [varchar](max) NULL,
	[Gender] [varchar](10) NULL,
	[DateOfJoining] [datetime] NULL,
	[DtaeOfReleiving] [datetime] NULL,
	[State] [varchar](50) NULL,
	[Salary] [decimal](18, 3) NULL,
	[DegreeId] [int] NULL,
	[SpecializationId] [int] NULL,
	[Photo] [varchar](max) NULL,
	[Experience] [varchar](20) NULL,
	[Fee] [decimal](18, 3) NULL,
	[Createdby] [int] NULL,
	[Createdon] [datetime] NULL,
	[Updatedby] [int] NULL,
	[Updatedon] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 11/28/2020 10:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[ShiftId] [int] NULL,
	[ShiftName] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Treatments]    Script Date: 11/28/2020 10:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatments](
	[TreatmentId] [int] IDENTITY(1,1) NOT NULL,
	[TreatmentName] [varchar](50) NULL,
	[Price] [decimal](18, 3) NULL,
	[Createdby] [int] NULL,
	[Createdon] [datetime] NULL,
	[Updatedby] [int] NULL,
	[Updatedon] [datetime] NULL,
 CONSTRAINT [PK_Treatments] PRIMARY KEY CLUSTERED 
(
	[TreatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[createTreatmentDetails]    Script Date: 11/28/2020 10:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[createTreatmentDetails]
@TreatmentName varchar(50),
@Price decimal(18,3),
@Createdby int,
@Createdon datetime,
@Updatedby int,
@Updatedon datetime
As Begin 
Insert Treatments values(@TreatmentName, @Price,@Createdby,
		@Createdon,@Updatedby,@Updatedon)
End
GO
/****** Object:  StoredProcedure [dbo].[getEmployee]    Script Date: 11/28/2020 10:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getEmployee]
as
begin
select *  from Employees 
end     
GO
/****** Object:  StoredProcedure [dbo].[getTreatmentdetails]    Script Date: 11/28/2020 10:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[getTreatmentdetails]
As Begin 
Select TreatmentId ,TreatmentName, Price,Createdby,
		Createdon,Updatedby,Updatedon from Treatments
End
GO
/****** Object:  StoredProcedure [dbo].[getTreatmentdetailsById]    Script Date: 11/28/2020 10:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[getTreatmentdetailsById]
@id int
As Begin 
Select TreatmentId ,TreatmentName, Price,Createdby,
		Createdon,Updatedby,Updatedon from Treatments where TreatmentId=@id
End
GO
/****** Object:  StoredProcedure [dbo].[updateTreatment]    Script Date: 11/28/2020 10:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[updateTreatment]
@id int,
@TreatmentName varchar(50),
@Price decimal(18,3),
@Createdby int,
@Createdon datetime,
@Updatedby int,
@Updatedon datetime
As
Begin
  Update Treatments set TreatmentName=@TreatmentName, Price=@Price,Createdby=@Createdby,
		Createdon=@Createdon,Updatedby=@Updatedby,Updatedon=@Updatedon where TreatmentId=@id
End
GO
USE [master]
GO
ALTER DATABASE [SaloonManagement] SET  READ_WRITE 
GO
