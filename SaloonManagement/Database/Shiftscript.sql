USE [master]
GO
/****** Object:  Database [SaloonManagement]    Script Date: 28-11-2020 22:32:17 ******/
CREATE DATABASE [SaloonManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaloonManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SaloonManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SaloonManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SaloonManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [SaloonManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SaloonManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SaloonManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SaloonManagement] SET QUERY_STORE = OFF
GO
USE [SaloonManagement]
GO
/****** Object:  Table [dbo].[ShiftTable]    Script Date: 28-11-2020 22:32:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftTable](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[ShiftName] [varchar](50) NULL,
 CONSTRAINT [PK_ShiftTable] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specilizations]    Script Date: 28-11-2020 22:32:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specilizations](
	[SpecilizationId] [int] IDENTITY(1,1) NOT NULL,
	[SpecilizationName] [varchar](100) NULL,
	[DegreeId] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Specilizations] PRIMARY KEY CLUSTERED 
(
	[SpecilizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spr_GetShiftDetails]    Script Date: 28-11-2020 22:32:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[spr_GetShiftDetails]
AS
BEGIN

  SELECT  [ShiftId]
      ,[ShiftName]
   FROM [SaloonManagement].[dbo].[ShiftTable]

END
GO
/****** Object:  StoredProcedure [dbo].[spr_GetSpacilizationById]    Script Date: 28-11-2020 22:32:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[spr_GetSpacilizationById]
@SpecilizationId int
AS
BEGIN
SELECT [SpecilizationId]
      ,[SpecilizationName]
      ,[DegreeId]
      ,[CreatedBy]
      ,[CreatedOn]
      ,[UpdatedBy]
      ,[UpdatedOn]
  FROM [SaloonManagement].[dbo].[Specilizations] WHERE [SpecilizationId]=@SpecilizationId

  END
GO
/****** Object:  StoredProcedure [dbo].[spr_GetSpacilizations]    Script Date: 28-11-2020 22:32:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[spr_GetSpacilizations]
AS
BEGIN
SELECT [SpecilizationId]
      ,[SpecilizationName]
      ,[DegreeId]
      ,[CreatedBy]
      ,[CreatedOn]
      ,[UpdatedBy]
      ,[UpdatedOn]
  FROM [SaloonManagement].[dbo].[Specilizations]

  END
GO
/****** Object:  StoredProcedure [dbo].[spr_insertSpecilization]    Script Date: 28-11-2020 22:32:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_insertSpecilization]
 @SpecilizationName varchar(100),
 @DegreeId int,
 @CreatedBy int,
 @UpdatedBy int

AS 
BEGIN
INSERT INTO [dbo].[Specilizations] ([SpecilizationName],
                                    [DegreeId],
									[CreatedBy],
									[CreatedOn],
									[UpdatedBy],
									[UpdatedOn])
			VALUES(@SpecilizationName,@DegreeId,@CreatedBy,GETDATE(),@UpdatedBy,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[spr_updateSpecilization]    Script Date: 28-11-2020 22:32:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spr_updateSpecilization]
@SpecilizationId int,
@SpecilizationName varchar(100),
@DegreeId int,
@CreatedBy int,
@CreatedOn datetime,
@UpdatedBy int

AS 
BEGIN
UPDATE [dbo].[Specilizations]
     SET [SpecilizationName]=@SpecilizationName,
	     [DegreeId]=@DegreeId,
		 [CreatedBy]=@CreatedBy,
		 [CreatedOn]=@CreatedOn,
		 [UpdatedBy]=@UpdatedBy,
		 [UpdatedOn]=GETDATE()

     WHERE [SpecilizationId]=@SpecilizationId
END
GO
USE [master]
GO
ALTER DATABASE [SaloonManagement] SET  READ_WRITE 
GO
