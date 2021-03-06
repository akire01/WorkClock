USE [master]
GO
/****** Object:  Database [PRA20-Erika-Raguž]    Script Date: 7/7/2020 8:07:32 PM ******/
CREATE DATABASE [PRA20-Erika-Raguž]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRA20-Erika-Raguž', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRA20-Erika-Raguž.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRA20-Erika-Raguž_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRA20-Erika-Raguž_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRA20-Erika-Raguž].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET RECOVERY FULL 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET  MULTI_USER 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRA20-Erika-Raguž', N'ON'
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET QUERY_STORE = OFF
GO
USE [PRA20-Erika-Raguž]
GO
/****** Object:  Table [dbo].[Djelatnik]    Script Date: 7/7/2020 8:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Djelatnik](
	[IDDjelatnik] [int] IDENTITY(1,1) NOT NULL,
	[TipID] [int] NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DatumZaposlenja] [date] NOT NULL,
	[TimID] [int] NULL,
	[Aktivnost] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDDjelatnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klijent]    Script Date: 7/7/2020 8:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klijent](
	[IDKlijent] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDKlijent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginDjelatnik]    Script Date: 7/7/2020 8:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginDjelatnik](
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[DjelatnikID] [int] NOT NULL,
	[UserID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projekt]    Script Date: 7/7/2020 8:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projekt](
	[IDProjekt] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[DatumOtvaranja] [date] NOT NULL,
	[VoditeljID] [int] NULL,
	[KlijentID] [int] NULL,
	[Aktivnost] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProjekt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projekt_Djelatnik]    Script Date: 7/7/2020 8:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projekt_Djelatnik](
	[ProjektID] [int] NULL,
	[DjelatnikID] [int] NULL,
	[IDProjekt_Djelatnik] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [IDPD] PRIMARY KEY CLUSTERED 
(
	[IDProjekt_Djelatnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projekt_Tim]    Script Date: 7/7/2020 8:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projekt_Tim](
	[IDProjektTim] [int] IDENTITY(1,1) NOT NULL,
	[ProjektID] [int] NOT NULL,
	[TimID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProjektTim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SatiProjekt]    Script Date: 7/7/2020 8:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SatiProjekt](
	[IDSatiProjekt] [int] IDENTITY(1,1) NOT NULL,
	[DjelatnikID] [int] NOT NULL,
	[ProjektID] [int] NOT NULL,
	[Datum] [date] NULL,
	[SatiPrekovremeni] [int] NULL,
	[SatiRadni] [int] NULL,
	[Predano] [bit] NULL,
	[Komentar] [nvarchar](250) NULL,
	[KlijentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDSatiProjekt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tim]    Script Date: 7/7/2020 8:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tim](
	[IDTim] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[VoditeljID] [int] NULL,
	[Aktivnost] [bit] NULL,
	[DatumKreiranja] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipDjelatnika]    Script Date: 7/7/2020 8:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipDjelatnika](
	[IDTip] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Djelatnik] ON 

INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (1, 2, N'Mia', N'Horvat', N'mhorvat@ingenii.hr', CAST(N'2018-02-28' AS Date), 1, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (2, 4, N'Sara', N'Kovačević', N'skovacevic@ingenii.hr', CAST(N'2019-11-30' AS Date), 1, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (3, 4, N'Nika', N'Babić', N'nbabic@ingenii.hr', CAST(N'2015-08-23' AS Date), 1, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (4, 4, N'Lana', N'Marić', N'lmaric@ingenii.hr', CAST(N'2014-02-13' AS Date), 1, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (5, 5, N'Elena', N'Jurić', N'ejuric@ingenii.hr', CAST(N'2010-02-13' AS Date), 1, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (6, 6, N'Eva', N'Novak', N'enovak@ingenii.hr', CAST(N'2010-07-19' AS Date), 1, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (7, 5, N'Petra', N'Kovačić', N'pkovacic@ingenii.hr', CAST(N'2016-12-25' AS Date), 1, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (8, 4, N'Iva', N'Knežević', N'iknezevic@ingenii.hr', CAST(N'2014-06-28' AS Date), 1, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (9, 4, N'Mila', N'Vuković', N'mvukovic@ingenii.hr', CAST(N'2014-09-22' AS Date), 1, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (10, 5, N'Klara', N'Marković', N'kmarkovic@ingenii.hr', CAST(N'2017-06-28' AS Date), 2, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (11, 2, N'Tena', N'Matić', N'tmatic@ingenii.hr', CAST(N'2012-05-22' AS Date), 2, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (12, 6, N'Leona', N'Petrović', N'lpetrovic@ingenii.hr', CAST(N'2015-11-26' AS Date), 2, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (13, 4, N'Lorena', N'Tomić', N'ltomic@ingenii.hr', CAST(N'2013-10-29' AS Date), 2, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (14, 5, N'Tia', N'Pavlović', N'tpavlovic@ingenii.hr', CAST(N'2015-07-05' AS Date), 2, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (15, 5, N'Lena', N'Kovač', N'lkovac@ingenii.hr', CAST(N'2017-10-27' AS Date), 2, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (16, 4, N'Katarina', N'Božić', N'kbozic@ingenii.hr', CAST(N'2015-04-15' AS Date), 2, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (17, 4, N'Ena', N'Grgić', N'egrgic@ingenii.hr', CAST(N'2015-06-10' AS Date), 2, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (18, 6, N'Bruna', N'Blažević', N'bblazevic@ingenii.hr', CAST(N'2014-10-03' AS Date), 2, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (19, 4, N'Lota', N'Perić', N'lperic@ingenii.hr', CAST(N'2017-11-09' AS Date), 2, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (20, 5, N'Una', N'Pavić', N'upavic@ingenii.hr', CAST(N'2018-08-21' AS Date), 3, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (21, 2, N'Korina', N'Radić', N'kradic@ingenii.hr', CAST(N'2013-06-26' AS Date), 3, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (22, 4, N'Greta', N'Šarić', N'gsaric@ingenii.hr', CAST(N'2018-04-18' AS Date), 3, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (23, 4, N'Luna', N'Lovrić', N'llovric@ingenii.hr', CAST(N'2016-09-05' AS Date), 3, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (24, 6, N'Gabriela', N'Filipović', N'gfilipovic@ingenii.hr', CAST(N'2014-04-20' AS Date), 3, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (25, 5, N'Barbara', N'Vidović', N'bvidovic@ingenii.hr', CAST(N'2010-12-02' AS Date), 3, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (26, 4, N'Iris', N'Jukić', N'ijukic@ingenii.hr', CAST(N'2010-12-28' AS Date), 3, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (27, 4, N'Tea', N'Bošnjak', N'tbosnjak@ingenii.hr', CAST(N'2013-09-24' AS Date), 3, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (28, 5, N'Anja', N'Perković', N'aperkovic@ingenii.hr', CAST(N'2011-08-30' AS Date), 3, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (29, 4, N'Gabrijela', N'Popović', N'gpopovic@ingenii.hr', CAST(N'2016-07-08' AS Date), 3, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (30, 5, N'Emma', N'Nikolić', N'enikolic@ingenii.hr', CAST(N'2013-01-10' AS Date), 4, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (31, 2, N'Sofija', N'Šimić', N'ssimic@ingenii.hr', CAST(N'2016-08-21' AS Date), 4, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (32, 4, N'Tonka', N'Barišić', N'tbarisic@ingenii.hr', CAST(N'2015-01-26' AS Date), 4, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (33, 4, N'Maja', N'Bašić', N'mbasic@ingenii.hr', CAST(N'2019-01-22' AS Date), 4, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (34, 4, N'Doris', N'Mandić', N'dmandic@ingenii.hr', CAST(N'2010-11-21' AS Date), 4, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (35, 5, N'Nicole', N'Klarić', N'nklaric@ingenii.hr', CAST(N'2010-05-24' AS Date), 4, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (36, 6, N'Nikol', N'Živković', N'nzivkovic@ingenii.hr', CAST(N'2019-05-14' AS Date), 4, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (37, 4, N'Noemi', N'Lončar', N'nloncar@ingenii.hr', CAST(N'2013-06-09' AS Date), 4, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (38, 4, N'Antea', N'Martinović', N'amartinovic@ingenii.hr', CAST(N'2011-01-26' AS Date), 4, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (39, 4, N'Ines', N'Barić', N'ibaric@ingenii.hr', CAST(N'2010-04-13' AS Date), 4, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (40, 5, N'Paola', N'Brkić', N'pbrkic@ingenii.hr', CAST(N'2012-04-15' AS Date), 5, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (41, 2, N'Anđela', N'Galić', N'agalic@ingenii.hr', CAST(N'2015-10-05' AS Date), 5, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (42, 5, N'Julia', N'Jurković', N'jjurkovic@ingenii.hr', CAST(N'2018-04-11' AS Date), 5, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (43, 4, N'Kaja', N'Bilić', N'kbilic@ingenii.hr', CAST(N'2014-01-28' AS Date), 5, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (44, 4, N'Cvita', N'Kos', N'ckos@ingenii.hr', CAST(N'2017-04-06' AS Date), 5, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (45, 5, N'Ivona', N'Stanić', N'istanic@ingenii.hr', CAST(N'2010-02-28' AS Date), 5, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (46, 4, N'Martina', N'Lukić', N'mlukic@ingenii.hr', CAST(N'2013-03-05' AS Date), 5, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (47, 4, N'Emili', N'Matijević', N'ematijevic@ingenii.hr', CAST(N'2016-12-24' AS Date), 5, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (48, 6, N'Nola', N'Matković', N'nmatkovic@ingenii.hr', CAST(N'2015-03-15' AS Date), 5, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (49, 5, N'Emily', N'Kralj', N'ekralj@ingenii.hr', CAST(N'2015-05-18' AS Date), 5, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (50, 5, N'Leda', N'Janković', N'ljankovic@ingenii.hr', CAST(N'2017-07-02' AS Date), 6, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (51, 2, N'David', N'Novosel', N'dnovosel@ingenii.hr', CAST(N'2018-10-01' AS Date), 6, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (52, 4, N'Petar', N'Jelić', N'pjelic@ingenii.hr', CAST(N'2015-03-21' AS Date), 6, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (53, 4, N'Mihael', N'Ćosić', N'mcosic@ingenii.hr', CAST(N'2015-04-09' AS Date), 6, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (54, 6, N'Marko', N'Miletić', N'mmiletic@ingenii.hr', CAST(N'2013-01-11' AS Date), 6, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (55, 5, N'Fran', N'Jurišić', N'fjurisic@ingenii.hr', CAST(N'2019-12-17' AS Date), 6, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (56, 5, N'Josip', N'Ivanović', N'jivanovic@ingenii.hr', CAST(N'2019-11-13' AS Date), 6, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (57, 4, N'Toma', N'Katić', N'tkatic@ingenii.hr', CAST(N'2013-03-26' AS Date), 6, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (58, 4, N'Lovro', N'Lučić', N'llucic@ingenii.hr', CAST(N'2011-05-05' AS Date), 6, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (59, 4, N'Borna', N'Mihaljević', N'bmihaljevic@ingenii.hr', CAST(N'2013-03-14' AS Date), 6, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (60, 5, N'Noa', N'Ilić', N'nilic@ingenii.hr', CAST(N'2019-02-18' AS Date), 7, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (61, 2, N'Roko', N'Tadić', N'rtadic@ingenii.hr', CAST(N'2016-10-25' AS Date), 7, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (62, 4, N'Lukas', N'Posavec', N'lposavec@ingenii.hr', CAST(N'2015-04-29' AS Date), 7, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (63, 5, N'Nikola', N'Jerković', N'njerkovic@ingenii.hr', CAST(N'2017-12-22' AS Date), 7, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (64, 4, N'Patrik', N'Marinović', N'pmarinovic@ingenii.hr', CAST(N'2011-09-13' AS Date), 7, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (65, 5, N'Šimun', N'Ivanković', N'sivankovic@ingenii.hr', CAST(N'2010-11-07' AS Date), 7, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (66, 6, N'Tin', N'Mikulić', N'tmikulic@ingenii.hr', CAST(N'2017-04-27' AS Date), 7, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (67, 4, N'Teo', N'Šimunović', N'tsimunovic@ingenii.hr', CAST(N'2016-11-05' AS Date), 7, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (68, 4, N'Viktor', N'Ivančić', N'vivancic@ingenii.hr', CAST(N'2012-12-08' AS Date), 7, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (69, 4, N'Leo', N'Poljak', N'lpoljak@ingenii.hr', CAST(N'2015-02-11' AS Date), 7, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (70, 5, N'Rafael', N'Jovanović', N'rjovanovic@ingenii.hr', CAST(N'2018-06-17' AS Date), 8, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (71, 2, N'Adrian', N'Herceg', N'aherceg@ingenii.hr', CAST(N'2011-11-06' AS Date), 8, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (72, 6, N'Andrej', N'Marjanović', N'amarjanovic@ingenii.hr', CAST(N'2014-05-15' AS Date), 8, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (73, 4, N'Juraj', N'Milić', N'jmilic@ingenii.hr', CAST(N'2014-06-22' AS Date), 8, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (74, 4, N'Gabrijel', N'Vidaković', N'gvidakovic@ingenii.hr', CAST(N'2015-07-27' AS Date), 8, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (75, 5, N'Oliver', N'Cindrić', N'ocindric@ingenii.hr', CAST(N'2012-11-16' AS Date), 8, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (76, 4, N'Mark', N'Marušić', N'mmarusic@ingenii.hr', CAST(N'2015-03-19' AS Date), 8, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (77, 5, N'Benjamin', N'Vučković', N'bvuckovic@ingenii.hr', CAST(N'2014-03-22' AS Date), 8, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (78, 6, N'Dino', N'Topić', N'dtopic@ingenii.hr', CAST(N'2019-06-03' AS Date), 8, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (79, 4, N'Toni', N'Rukavina', N'trukavina@ingenii.hr', CAST(N'2014-02-21' AS Date), 8, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (80, 5, N'Maks', N'Jozić', N'mjozic@ingenii.hr', CAST(N'2017-09-30' AS Date), 9, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (81, 2, N'Lucas', N'Delić', N'ldelic@ingenii.hr', CAST(N'2014-01-04' AS Date), 9, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (82, 4, N'Noel', N'Novaković', N'nnovakovic@ingenii.hr', CAST(N'2018-07-14' AS Date), 9, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (83, 4, N'Leonardo', N'Varga', N'lvarga@ingenii.hr', CAST(N'2016-04-14' AS Date), 9, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (84, 5, N'Vigo', N'Pavičić', N'vpavicic@ingenii.hr', CAST(N'2019-01-07' AS Date), 9, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (85, 5, N'Maksim', N'Bogdan', N'mbogdan@ingenii.hr', CAST(N'2014-04-12' AS Date), 9, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (86, 4, N'Kristijan', N'Grubišić', N'kgrubisic@ingenii.hr', CAST(N'2011-06-04' AS Date), 9, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (87, 4, N'Tomislav', N'Đurić', N'tdjuric@ingenii.hr', CAST(N'2019-10-21' AS Date), 9, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (88, 4, N'Noah', N'Špoljarić', N'nspoljaric@ingenii.hr', CAST(N'2016-01-11' AS Date), 9, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (89, 4, N'Pavle', N'Dujmović', N'pdujmovic@ingenii.hr', CAST(N'2010-12-06' AS Date), 9, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (90, 5, N'Arian', N'Vukelić', N'avukelic@ingenii.hr', CAST(N'2010-07-13' AS Date), 10, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (91, 2, N'Manuel', N'Kolar', N'mkolar@ingenii.hr', CAST(N'2016-02-19' AS Date), 10, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (92, 4, N'Mislav', N'Burić', N'mburic@ingenii.hr', CAST(N'2012-02-06' AS Date), 10, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (93, 4, N'Jure', N'Štimac', N'jstimac@ingenii.hr', CAST(N'2017-11-15' AS Date), 10, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (94, 4, N'Neo', N'Petković', N'npetkovic@ingenii.hr', CAST(N'2011-02-25' AS Date), 10, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (95, 5, N'Robert', N'Kolarić', N'rkolaric@ingenii.hr', CAST(N'2015-06-23' AS Date), 10, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (96, 6, N'Vedran', N'Petrić', N'vpetric@ingenii.hr', CAST(N'2010-06-09' AS Date), 10, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (97, 4, N'Frane', N'Brajković', N'fbrajkovic@ingenii.hr', CAST(N'2010-04-20' AS Date), 10, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (98, 5, N'Ian', N'Bačić', N'ibacic@ingenii.hr', CAST(N'2012-05-18' AS Date), 10, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (99, 4, N'Mate', N'Jakšić', N'mjaksic@ingenii.hr', CAST(N'2016-05-31' AS Date), 10, 1)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (100, 5, N'Oskar', N'Jović', N'ojovic@ingenii.hr', CAST(N'2012-11-04' AS Date), 11, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (101, 2, N'Lucija', N'Ivić', N'livic@ingenii.hr', CAST(N'2016-04-30' AS Date), 11, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (102, 6, N'Ema', N'Stanković', N'estankovic@ingenii.hr', CAST(N'2014-01-17' AS Date), 11, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (103, 4, N'Ana', N'Ružić', N'aruzic@ingenii.hr', CAST(N'2010-02-01' AS Date), 11, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (104, 4, N'Marta', N'Pranjić', N'mpranjic@ingenii.hr', CAST(N'2016-12-02' AS Date), 11, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (105, 5, N'Rita', N'Stojanović', N'rstojanovic@ingenii.hr', CAST(N'2015-08-28' AS Date), 11, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (106, 4, N'Marija', N'Antunović', N'mantunovic@ingenii.hr', CAST(N'2014-05-19' AS Date), 11, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (107, 4, N'Laura', N'Mitrović', N'lmitrovic@ingenii.hr', CAST(N'2010-09-29' AS Date), 11, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (108, 6, N'Lea', N'Lončarić', N'lloncaric@ingenii.hr', CAST(N'2019-09-14' AS Date), 11, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (109, 4, N'Dora', N'Ban', N'dban@ingenii.hr', CAST(N'2010-02-26' AS Date), 11, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (110, 5, N'Lara', N'Tolić', N'ltolic@ingenii.hr', CAST(N'2014-10-01' AS Date), 12, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (111, 2, N'Franka', N'Josipović', N'fjosipovic@ingenii.hr', CAST(N'2015-08-25' AS Date), 12, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (112, 5, N'Katja', N'Pejić', N'kpejic@ingenii.hr', CAST(N'2013-10-24' AS Date), 12, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (113, 4, N'Helena', N'Pintarić', N'hpintaric@ingenii.hr', CAST(N'2017-03-15' AS Date), 12, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (114, 6, N'Karla', N'Golubić', N'kgolubic@ingenii.hr', CAST(N'2015-06-16' AS Date), 12, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (115, 5, N'Magdalena', N'Anić', N'manic@ingenii.hr', CAST(N'2015-02-14' AS Date), 12, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (116, 4, N'Maša', N'Prpić', N'mprpic@ingenii.hr', CAST(N'2018-04-14' AS Date), 12, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (117, 4, N'Sofia', N'Tokić', N'stokic@ingenii.hr', CAST(N'2019-01-15' AS Date), 12, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (118, 4, N'Jana', N'Erceg', N'jerceg@ingenii.hr', CAST(N'2018-12-16' AS Date), 12, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (119, 5, N'Paula', N'Petričević', N'ppetricevic@ingenii.hr', CAST(N'2017-06-03' AS Date), 12, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (120, 5, N'Vita', N'Budimir', N'vbudimir@ingenii.hr', CAST(N'2019-06-06' AS Date), 13, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (121, 2, N'Tara', N'Baričević', N'tbaricevic@ingenii.hr', CAST(N'2017-07-09' AS Date), 13, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (122, 4, N'Hana', N'Martić', N'hmartic@ingenii.hr', CAST(N'2010-10-26' AS Date), 13, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (123, 4, N'Nina', N'Starčević', N'nstarcevic@ingenii.hr', CAST(N'2012-01-03' AS Date), 13, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (124, 4, N'Mara', N'Vlašić', N'mvlasic@ingenii.hr', CAST(N'2014-08-02' AS Date), 13, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (125, 5, N'Ela', N'Vrdoljak', N'evrdoljak@ingenii.hr', CAST(N'2012-04-29' AS Date), 13, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (126, 5, N'Matea', N'Mijatović', N'mmijatovic@ingenii.hr', CAST(N'2019-10-02' AS Date), 13, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (127, 4, N'Nora', N'Car', N'ncar@ingenii.hr', CAST(N'2016-07-01' AS Date), 13, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (128, 4, N'Ella', N'Majić', N'emajic@ingenii.hr', CAST(N'2013-04-27' AS Date), 13, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (129, 4, N'Vida', N'Šimunić', N'vsimunic@ingenii.hr', CAST(N'2010-02-04' AS Date), 13, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (130, 5, N'Pia', N'Horvatić', N'phorvatic@ingenii.hr', CAST(N'2012-06-09' AS Date), 14, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (131, 2, N'Kiara', N'Mlinarić', N'kmlinaric@ingenii.hr', CAST(N'2014-11-29' AS Date), 14, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (132, 6, N'Maria', N'Ljubičić', N'mljubicic@ingenii.hr', CAST(N'2011-11-04' AS Date), 14, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (133, 5, N'Aria', N'Pavlić', N'apavlic@ingenii.hr', CAST(N'2013-01-03' AS Date), 14, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (134, 4, N'Mihaela', N'Vukić', N'mvukic@ingenii.hr', CAST(N'2011-04-20' AS Date), 14, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (135, 5, N'Monika', N'Vlahović', N'mvlahovic@ingenii.hr', CAST(N'2011-06-03' AS Date), 14, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (136, 4, N'Nikolina', N'Sever', N'nsever@ingenii.hr', CAST(N'2019-12-20' AS Date), 14, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (137, 4, N'Viktorija', N'Abramović', N'vabramovic@ingenii.hr', CAST(N'2018-06-12' AS Date), 14, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (138, 6, N'Aurora', N'Crnković', N'acrnkovic@ingenii.hr', CAST(N'2019-05-15' AS Date), 14, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (139, 4, N'Lora', N'Mamić', N'lmamic@ingenii.hr', CAST(N'2013-05-13' AS Date), 14, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (140, 5, N'Viktoria', N'Grgurić', N'vgrguric@ingenii.hr', CAST(N'2019-11-25' AS Date), 15, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (141, 2, N'Iskra', N'Ivković', N'iivkovic@ingenii.hr', CAST(N'2010-09-06' AS Date), 15, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (142, 4, N'Julija', N'Zorić', N'jzoric@ingenii.hr', CAST(N'2010-02-06' AS Date), 15, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (143, 4, N'Brigita', N'Čović', N'bcovic@ingenii.hr', CAST(N'2015-11-16' AS Date), 15, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (144, 6, N'Gita', N'Dragičević', N'gdragicevic@ingenii.hr', CAST(N'2016-03-08' AS Date), 15, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (145, 5, N'Josipa', N'Radoš', N'jrados@ingenii.hr', CAST(N'2014-11-19' AS Date), 15, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (146, 4, N'Zara', N'Rašić', N'zrasic@ingenii.hr', CAST(N'2012-04-27' AS Date), 15, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (147, 5, N'Larisa', N'Orešković', N'loreskovic@ingenii.hr', CAST(N'2014-11-25' AS Date), 15, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (148, 4, N'Veronika', N'Sertić', N'vsertic@ingenii.hr', CAST(N'2012-06-01' AS Date), 15, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (149, 4, N'Ivana', N'Miličević', N'imilicevic@ingenii.hr', CAST(N'2016-01-13' AS Date), 15, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (150, 5, N'Maris', N'Ljubić', N'mljubic@ingenii.hr', CAST(N'2017-03-11' AS Date), 16, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (151, 2, N'Luka', N'Milković', N'lmilkovic@ingenii.hr', CAST(N'2011-05-27' AS Date), 16, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (152, 4, N'Jakov', N'Medved', N'jmedved@ingenii.hr', CAST(N'2011-05-07' AS Date), 16, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (153, 4, N'Ivan', N'Matošević', N'imatosevic@ingenii.hr', CAST(N'2014-12-16' AS Date), 16, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (154, 5, N'Filip', N'Andrić', N'fandric@ingenii.hr', CAST(N'2016-12-27' AS Date), 16, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (155, 5, N'Matej', N'Milošević', N'mmilosevic@ingenii.hr', CAST(N'2015-04-29' AS Date), 16, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (156, 6, N'Leon', N'Turković', N'lturkovic@ingenii.hr', CAST(N'2015-07-07' AS Date), 16, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (157, 4, N'Karlo', N'Franić', N'kfranic@ingenii.hr', CAST(N'2012-01-15' AS Date), 16, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (158, 4, N'Mateo', N'Mišković', N'mmiskovic@ingenii.hr', CAST(N'2015-07-04' AS Date), 16, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (159, 4, N'Niko', N'Balić', N'nbalic@ingenii.hr', CAST(N'2014-08-06' AS Date), 16, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (160, 5, N'Jan', N'Šoštarić', N'jsostaric@ingenii.hr', CAST(N'2015-11-28' AS Date), 17, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (161, 2, N'Gabriel', N'Mihalić', N'gmihalic@ingenii.hr', CAST(N'2017-11-19' AS Date), 17, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (162, 6, N'Vito', N'Milanović', N'vmilanovic@ingenii.hr', CAST(N'2017-06-04' AS Date), 17, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (163, 4, N'Ivano', N'Jurčević', N'ijurcevic@ingenii.hr', CAST(N'2019-08-10' AS Date), 17, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (164, 4, N'Ante', N'Galović', N'agalovic@ingenii.hr', CAST(N'2017-09-19' AS Date), 17, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (165, 5, N'Dominik', N'Radošević', N'dradosevic@ingenii.hr', CAST(N'2019-11-03' AS Date), 17, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (166, 4, N'Bruno', N'Rajković', N'brajkovic@ingenii.hr', CAST(N'2013-10-22' AS Date), 17, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (167, 4, N'Marin', N'Balog', N'mbalog@ingenii.hr', CAST(N'2010-10-22' AS Date), 17, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (168, 5, N'Matija', N'Mikić', N'mmikic@ingenii.hr', CAST(N'2015-11-27' AS Date), 17, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (169, 4, N'Antonio', N'Medić', N'amedic@ingenii.hr', CAST(N'2014-01-14' AS Date), 17, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (170, 5, N'Martin', N'Savić', N'msavic@ingenii.hr', CAST(N'2015-02-26' AS Date), 18, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (171, 2, N'Emanuel', N'Lacković', N'elackovic@ingenii.hr', CAST(N'2019-11-03' AS Date), 18, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (172, 4, N'Vid', N'Puškarić', N'vpuskaric@ingenii.hr', CAST(N'2019-09-04' AS Date), 18, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (173, 4, N'Franko', N'Buljan', N'fbuljan@ingenii.hr', CAST(N'2015-08-05' AS Date), 18, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (174, 6, N'Erik', N'Kolić', N'ekolic@ingenii.hr', CAST(N'2017-07-11' AS Date), 18, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (175, 5, N'Stjepan', N'Majstorović', N'smajstorovic@ingenii.hr', CAST(N'2018-09-30' AS Date), 18, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (176, 4, N'Bartol', N'Mijić', N'bmijic@ingenii.hr', CAST(N'2017-06-02' AS Date), 18, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (177, 4, N'Adam', N'Sučić', N'asucic@ingenii.hr', CAST(N'2014-12-11' AS Date), 18, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (178, 4, N'Liam', N'Tomašić', N'ltomasic@ingenii.hr', CAST(N'2015-10-29' AS Date), 18, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (179, 4, N'Dorian', N'Meštrović', N'dmestrovic@ingenii.hr', CAST(N'2019-09-14' AS Date), 18, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (180, 5, N'Antun', N'Ćurić', N'acuric@ingenii.hr', CAST(N'2010-01-02' AS Date), 19, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (181, 2, N'Andrija', N'Marijanović', N'amarijanovic@ingenii.hr', CAST(N'2014-11-07' AS Date), 19, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (182, 5, N'Maro', N'Cvitković', N'mcvitkovic@ingenii.hr', CAST(N'2014-01-30' AS Date), 19, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (183, 4, N'Ilija', N'Vukušić', N'ivukusic@ingenii.hr', CAST(N'2017-04-16' AS Date), 19, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (184, 4, N'Sven', N'Nekić', N'snekic@ingenii.hr', CAST(N'2012-11-27' AS Date), 19, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (185, 5, N'Jona', N'Hodak', N'jhodak@ingenii.hr', CAST(N'2011-01-15' AS Date), 19, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (186, 6, N'Domagoj', N'Đurđević', N'ddjurdjevic@ingenii.hr', CAST(N'2013-07-26' AS Date), 19, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (187, 4, N'Mak', N'Glavaš', N'mglavas@ingenii.hr', CAST(N'2016-11-20' AS Date), 19, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (188, 4, N'Aleksandar', N'Begić', N'abegic@ingenii.hr', CAST(N'2016-01-08' AS Date), 19, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (189, 5, N'Pavel', N'Maričić', N'pmaricic@ingenii.hr', CAST(N'2015-12-23' AS Date), 19, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (190, 5, N'Stefan', N'Rožić', N'srozic@ingenii.hr', CAST(N'2015-11-28' AS Date), 20, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (191, 2, N'Ivor', N'Kraljević', N'ikraljevic@ingenii.hr', CAST(N'2017-12-06' AS Date), 20, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (192, 6, N'Mauro', N'Devčić', N'mdevcic@ingenii.hr', CAST(N'2012-12-09' AS Date), 20, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (193, 4, N'Damjan', N'Vuletić', N'dvuletic@ingenii.hr', CAST(N'2014-10-10' AS Date), 20, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (194, 4, N'Max', N'Ostojić', N'mostojic@ingenii.hr', CAST(N'2017-06-17' AS Date), 20, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (195, 5, N'Pavao', N'Vuk', N'pvuk@ingenii.hr', CAST(N'2012-01-07' AS Date), 20, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (196, 5, N'Sebastian', N'Matanović', N'smatanovic@ingenii.hr', CAST(N'2013-04-04' AS Date), 20, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (197, 4, N'Aron', N'Jakovljević', N'ajakovljevic@ingenii.hr', CAST(N'2010-06-30' AS Date), 20, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (198, 6, N'Grga', N'Dukić', N'gdukic@ingenii.hr', CAST(N'2018-02-28' AS Date), 20, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (199, 4, N'Marino', N'Begović', N'mbegovic@ingenii.hr', CAST(N'2016-05-07' AS Date), 20, 1)
GO
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (200, 1, N'Matias', N'Salopek', N'msalopek@ingenii.hr', CAST(N'2011-01-29' AS Date), 1, 1)
INSERT [dbo].[Djelatnik] ([IDDjelatnik], [TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID], [Aktivnost]) VALUES (201, 4, N'Test', N'Testni', N'test@mail.com', CAST(N'2020-06-29' AS Date), 19, 1)
SET IDENTITY_INSERT [dbo].[Djelatnik] OFF
SET IDENTITY_INSERT [dbo].[Klijent] ON 

INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (1, N'Mucrosoft d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (2, N'Oricle d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (3, N'Ubm d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (4, N'Sip d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (5, N'Symintec d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (6, N'Emc d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (7, N'Vmwire d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (9, N'Silesforcecom d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (10, N'Untaut d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (11, N'Idobe d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (13, N'Sis d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (14, N'Cusco d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (16, N'Suemens d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (17, N'Fajutsa d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (18, N'Iatodesk d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (19, N'Cutrux d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (21, N'Hutichu d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (22, N'Ipple d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (23, N'Unfor d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (25, N'Untel d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (27, N'Sige d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (28, N'Idp d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (31, N'Opentext d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (32, N'Sangird d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (33, N'Nec d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (35, N'Hexigon d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (37, N'Teriditi d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (38, N'Netipp d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (42, N'Mckesson d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (44, N'Ptc d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (47, N'Ditev d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (48, N'Esru d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (49, N'Cerner d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (50, N'Insys d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (51, N'Unformituci d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (52, N'Tubco d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (54, N'Optam d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (56, N'Fuserv d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (57, N'Iviyi d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (58, N'Kronos d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (64, N'Itheniheilth d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (67, N'Fuco d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (68, N'Fus d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (69, N'Musys d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (71, N'Swuft d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (72, N'Workdiy d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (74, N'Totvs d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (76, N'Servucenow d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (77, N'Commvialt d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (79, N'Convergys d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (80, N'Neasoft d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (81, N'Vusmi d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (82, N'Qluk d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (85, N'Untersystems d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (86, N'Pilintur d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (87, N'Anuto d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (88, N'Illscrupts d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (89, N'Medutech d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (90, N'Blickboird d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (91, N'Imizoncom d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (93, N'Pegisystems d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (94, N'Netsaute d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (95, N'Mucrostritegy d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (96, N'Eset d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (98, N'Solirwunds d.o.o.', N'NULL')
INSERT [dbo].[Klijent] ([IDKlijent], [Ime], [Email]) VALUES (99, N'KlijentX', N'kx@mail.com')
SET IDENTITY_INSERT [dbo].[Klijent] OFF
SET IDENTITY_INSERT [dbo].[LoginDjelatnik] ON 

INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mhorvat@ingenii.hr', N'ZSJR6F', 1, 1)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'skovacevic@ingenii.hr', N'6SU2H9T3Y5', 2, 2)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'nbabic@ingenii.hr', N'OY273H0CPP', 3, 3)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'lmaric@ingenii.hr', N'72W5W3', 4, 4)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ejuric@ingenii.hr', N'WVN2IOL', 5, 5)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'enovak@ingenii.hr', N'O0DZ7Z0F8G', 6, 6)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'pkovacic@ingenii.hr', N'0B0VQ2', 7, 7)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'iknezevic@ingenii.hr', N'0UMUW8LAXW', 8, 8)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mvukovic@ingenii.hr', N'Q43R3GWF2Y', 9, 9)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'kmarkovic@ingenii.hr', N'5ELC7KIOBN', 10, 10)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'tmatic@ingenii.hr', N'XJDSSQ', 11, 11)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'lpetrovic@ingenii.hr', N'JUJKZ8IH65', 12, 12)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ltomic@ingenii.hr', N'2CIIP2R9P3', 13, 13)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'tpavlovic@ingenii.hr', N'UILRWW', 14, 14)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'lkovac@ingenii.hr', N'GM8RKUH60T', 15, 15)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'kbozic@ingenii.hr', N'AZ8C8PZBPV', 16, 16)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'egrgic@ingenii.hr', N'FCRMLG', 17, 17)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'bblazevic@ingenii.hr', N'RSDAN5', 18, 18)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'lperic@ingenii.hr', N'CF3VNFYNTH', 19, 19)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'upavic@ingenii.hr', N'TL95F5', 20, 20)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'kradic@ingenii.hr', N'FTU4XB', 21, 21)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'gsaric@ingenii.hr', N'H23B44', 22, 22)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'llovric@ingenii.hr', N'4J8N89', 23, 23)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'gfilipovic@ingenii.hr', N'17N82S', 24, 24)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'bvidovic@ingenii.hr', N'45M8FLLQSW', 25, 25)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ijukic@ingenii.hr', N'VI7GD9I4', 26, 26)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'tbosnjak@ingenii.hr', N'45FYDHUXQK', 27, 27)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'aperkovic@ingenii.hr', N'5BFONJDYLT', 28, 28)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'gpopovic@ingenii.hr', N'F1CWCA9KMY', 29, 29)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'enikolic@ingenii.hr', N'LGEF3ZPMIO', 30, 30)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ssimic@ingenii.hr', N'L61BNH827Z', 31, 31)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'tbarisic@ingenii.hr', N'K6LIKRP8YG', 32, 32)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mbasic@ingenii.hr', N'EE3F080H', 33, 33)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'dmandic@ingenii.hr', N'JZROT3', 34, 34)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'nklaric@ingenii.hr', N'0FC3O08UOC', 35, 35)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'nzivkovic@ingenii.hr', N'XVTQGPEPEL', 36, 36)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'nloncar@ingenii.hr', N'0PVF9NHR2P', 37, 37)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'amartinovic@ingenii.hr', N'I22ZGX8PF6', 38, 38)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ibaric@ingenii.hr', N'LS4V68', 39, 39)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'pbrkic@ingenii.hr', N'T4DDI6', 40, 40)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'agalic@ingenii.hr', N'9NVG13YYN4', 41, 41)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'jjurkovic@ingenii.hr', N'YBIYE7', 42, 42)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'kbilic@ingenii.hr', N'73UUAR', 43, 43)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ckos@ingenii.hr', N'ISUTZ1', 44, 44)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'istanic@ingenii.hr', N'D8D22ADNUR', 45, 45)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mlukic@ingenii.hr', N'50BI10', 46, 46)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ematijevic@ingenii.hr', N'W5HO8ALY7C', 47, 47)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'nmatkovic@ingenii.hr', N'R871UB', 48, 48)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ekralj@ingenii.hr', N'CEIW8F453R', 49, 49)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ljankovic@ingenii.hr', N'4RZUJY', 50, 50)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'dnovosel@ingenii.hr', N'Z13J0XC1', 51, 51)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'pjelic@ingenii.hr', N'4AKI89KRF5', 52, 52)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mcosic@ingenii.hr', N'BFCDHP', 53, 53)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mmiletic@ingenii.hr', N'LI17BL', 54, 54)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'fjurisic@ingenii.hr', N'O6OMTL8', 55, 55)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'jivanovic@ingenii.hr', N'951S0C', 56, 56)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'tkatic@ingenii.hr', N'K3U85QPC2D', 57, 57)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'llucic@ingenii.hr', N'HKR932', 58, 58)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'bmihaljevic@ingenii.hr', N'QVCQP6', 59, 59)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'nilic@ingenii.hr', N'2K3XM1SOBZ', 60, 60)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'rtadic@ingenii.hr', N'M2JTT1', 61, 61)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'lposavec@ingenii.hr', N'AQAMORDNKK', 62, 62)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'njerkovic@ingenii.hr', N'JURUT8B9RQ', 63, 63)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'pmarinovic@ingenii.hr', N'KTB9IFOGIA', 64, 64)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'sivankovic@ingenii.hr', N'3IW0YKXR9H', 65, 65)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'tmikulic@ingenii.hr', N'F3OWYWI8MI', 66, 66)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'tsimunovic@ingenii.hr', N'GBCRYE0UDP', 67, 67)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'vivancic@ingenii.hr', N'YJ0PAD', 68, 68)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'lpoljak@ingenii.hr', N'U0ORHLRACI', 69, 69)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'rjovanovic@ingenii.hr', N'CMC7E38D08', 70, 70)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'aherceg@ingenii.hr', N'BAU977EOZB', 71, 71)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'amarjanovic@ingenii.hr', N'T1TP62OH0R', 72, 72)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'jmilic@ingenii.hr', N'OLSN6DZ3GN', 73, 73)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'gvidakovic@ingenii.hr', N'2MAM1X4X69', 74, 74)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ocindric@ingenii.hr', N'RUSDOP', 75, 75)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mmarusic@ingenii.hr', N'OOXDM7', 76, 76)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'bvuckovic@ingenii.hr', N'Q6SJED82VH', 77, 77)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'dtopic@ingenii.hr', N'NAJ1RTKYD', 78, 78)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'trukavina@ingenii.hr', N'22BSI2', 79, 79)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mjozic@ingenii.hr', N'LLPKL5UIIN', 80, 80)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ldelic@ingenii.hr', N'JFX85N7T0G', 81, 81)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'nnovakovic@ingenii.hr', N'EBT22C3RRL', 82, 82)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'lvarga@ingenii.hr', N'EEH4EYRNCO', 83, 83)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'vpavicic@ingenii.hr', N'F41JAQVUYB', 84, 84)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mbogdan@ingenii.hr', N'FU9CETA59X', 85, 85)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'kgrubisic@ingenii.hr', N'EU0X7TYMOE', 86, 86)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'tdjuric@ingenii.hr', N'YSU6WA', 87, 87)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'nspoljaric@ingenii.hr', N'SCW8RAVFU4', 88, 88)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'pdujmovic@ingenii.hr', N'G6SRDN', 89, 89)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'avukelic@ingenii.hr', N'ZHVYB2', 90, 90)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mkolar@ingenii.hr', N'9E94KFE8MK', 91, 91)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mburic@ingenii.hr', N'8F7F3AHPPB', 92, 92)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'jstimac@ingenii.hr', N'TNCLZ4', 93, 93)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'npetkovic@ingenii.hr', N'7717GF68F9', 94, 94)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'rkolaric@ingenii.hr', N'HTEEDSPUSX', 95, 95)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'vpetric@ingenii.hr', N'438DX8', 96, 96)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'fbrajkovic@ingenii.hr', N'SMYX944HEB', 97, 97)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ibacic@ingenii.hr', N'3QGCN9', 98, 98)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mjaksic@ingenii.hr', N'9UV8BPWR6I', 99, 99)
GO
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ojovic@ingenii.hr', N'IU2DZF0VR4', 100, 100)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'livic@ingenii.hr', N'8E2V2WTBRZ', 101, 101)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'estankovic@ingenii.hr', N'X31AX9', 102, 102)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'aruzic@ingenii.hr', N'0L9JUV', 103, 103)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mpranjic@ingenii.hr', N'HH4JYBQ4S6', 104, 104)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'rstojanovic@ingenii.hr', N'OF94WPL5QS', 105, 105)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mantunovic@ingenii.hr', N'ESOATE0JMG', 106, 106)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'lmitrovic@ingenii.hr', N'3W1JZVGRTX', 107, 107)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'lloncaric@ingenii.hr', N'3Q5GMZR67I', 108, 108)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'dban@ingenii.hr', N'WK0IIW', 109, 109)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ltolic@ingenii.hr', N'HFCT1G', 110, 110)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'fjosipovic@ingenii.hr', N'VDDOD6', 111, 111)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'kpejic@ingenii.hr', N'29XAFMQ028', 112, 112)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'hpintaric@ingenii.hr', N'5MWY1BJ9XB', 113, 113)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'kgolubic@ingenii.hr', N'R4KDHP', 114, 114)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'manic@ingenii.hr', N'OEOZ93OOBM', 115, 115)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mprpic@ingenii.hr', N'B2KJ412XOD', 116, 116)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'stokic@ingenii.hr', N'4ZD9WVWIUL', 117, 117)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'jerceg@ingenii.hr', N'4MJY0KU6', 118, 118)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ppetricevic@ingenii.hr', N'33MWUIOWXF', 119, 119)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'vbudimir@ingenii.hr', N'IXPNMEYMJ9', 120, 120)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'tbaricevic@ingenii.hr', N'XSH8V2X49P', 121, 121)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'hmartic@ingenii.hr', N'4GC85XRDJF', 122, 122)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'nstarcevic@ingenii.hr', N'5AO9M341LI', 123, 123)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mvlasic@ingenii.hr', N'2R7463LQTK', 124, 124)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'evrdoljak@ingenii.hr', N'KSTWLT2XEM', 125, 125)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mmijatovic@ingenii.hr', N'071D5JKFR9', 126, 126)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ncar@ingenii.hr', N'6ZPM6F5BXH', 127, 127)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'emajic@ingenii.hr', N'IMXW7WI8BJ', 128, 128)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'vsimunic@ingenii.hr', N'Y9HEM46AWK', 129, 129)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'phorvatic@ingenii.hr', N'HJL5PL0LGS', 130, 130)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'kmlinaric@ingenii.hr', N'EGKR5G', 131, 131)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mljubicic@ingenii.hr', N'8D45L4NLOW', 132, 132)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'apavlic@ingenii.hr', N'47RO5I', 133, 133)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mvukic@ingenii.hr', N'MM94MQGUTK', 134, 134)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mvlahovic@ingenii.hr', N'VBGK1', 135, 135)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'nsever@ingenii.hr', N'ANQSPF', 136, 136)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'vabramovic@ingenii.hr', N'14ZR6V', 137, 137)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'acrnkovic@ingenii.hr', N'6FT3L5JY55', 138, 138)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'lmamic@ingenii.hr', N'68TZ58FAMR', 139, 139)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'vgrguric@ingenii.hr', N'OL1JME', 140, 140)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'iivkovic@ingenii.hr', N'LQOF40LT69', 141, 141)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'jzoric@ingenii.hr', N'FVVA09BZEG', 142, 142)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'bcovic@ingenii.hr', N'GO93IY', 143, 143)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'gdragicevic@ingenii.hr', N'0QOC1H', 144, 144)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'jrados@ingenii.hr', N'3W3VBD', 145, 145)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'zrasic@ingenii.hr', N'D38U27KYK2', 146, 146)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'loreskovic@ingenii.hr', N'L305QI', 147, 147)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'vsertic@ingenii.hr', N'ZODE5VFHLC', 148, 148)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'imilicevic@ingenii.hr', N'VKF1N6KF9N', 149, 149)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mljubic@ingenii.hr', N'9EAUR', 150, 150)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'lmilkovic@ingenii.hr', N'SZ478X52QB', 151, 151)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'jmedved@ingenii.hr', N'BBB12CBE0D', 152, 152)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'imatosevic@ingenii.hr', N'9CFRMN869L', 153, 153)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'fandric@ingenii.hr', N'X1ERCAAXJ8', 154, 154)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mmilosevic@ingenii.hr', N'JKUTBD', 155, 155)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'lturkovic@ingenii.hr', N'XUJBT5', 156, 156)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'kfranic@ingenii.hr', N'WORW9R', 157, 157)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mmiskovic@ingenii.hr', N'99EZW6R5EO', 158, 158)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'nbalic@ingenii.hr', N'D6WKO0QHCA', 159, 159)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'jsostaric@ingenii.hr', N'32S5CEK53I', 160, 160)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'gmihalic@ingenii.hr', N'PDGAB6', 161, 161)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'vmilanovic@ingenii.hr', N'X75Q8PW36P', 162, 162)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ijurcevic@ingenii.hr', N'Z6CJDHJOLR', 163, 163)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'agalovic@ingenii.hr', N'8SKC5WVYGK', 164, 164)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'dradosevic@ingenii.hr', N'KC77VGW88R', 165, 165)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'brajkovic@ingenii.hr', N'ZI8E99DVU2', 166, 166)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mbalog@ingenii.hr', N'K4T02X', 167, 167)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mmikic@ingenii.hr', N'RKBMCV', 168, 168)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'amedic@ingenii.hr', N'GWP4FB', 169, 169)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'msavic@ingenii.hr', N'ISNQ5A', 170, 170)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'elackovic@ingenii.hr', N'V34D2X', 171, 171)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'vpuskaric@ingenii.hr', N'BDGJ4T962Y', 172, 172)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'fbuljan@ingenii.hr', N'OBE7AHBX6', 173, 173)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ekolic@ingenii.hr', N'RVF92A', 174, 174)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'smajstorovic@ingenii.hr', N'K2188G3W5B', 175, 175)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'bmijic@ingenii.hr', N'KRLUQLVXD', 176, 176)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'asucic@ingenii.hr', N'HEY6NRFLBI', 177, 177)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ltomasic@ingenii.hr', N'G4PPGGBVYS', 178, 178)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'dmestrovic@ingenii.hr', N'GMKAG1', 179, 179)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'acuric@ingenii.hr', N'0H7XPX', 180, 180)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'amarijanovic@ingenii.hr', N'C4A1OMZ2O6', 181, 181)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mcvitkovic@ingenii.hr', N'ZYUNBC', 182, 182)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ivukusic@ingenii.hr', N'A8PTT78', 183, 183)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'snekic@ingenii.hr', N'I0E26E', 184, 184)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'jhodak@ingenii.hr', N'0KMFBX', 185, 185)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ddjurdjevic@ingenii.hr', N'XLR414K4XV', 186, 186)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mglavas@ingenii.hr', N'W6ZO7XCOR4', 187, 187)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'abegic@ingenii.hr', N'L5JQSO', 188, 188)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'pmaricic@ingenii.hr', N'PMG7X', 189, 189)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'srozic@ingenii.hr', N'U9IF5N', 190, 190)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ikraljevic@ingenii.hr', N'UWQPYH', 191, 191)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mdevcic@ingenii.hr', N'B7N9EZJ80W', 192, 192)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'dvuletic@ingenii.hr', N'8Y2XPH', 193, 193)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mostojic@ingenii.hr', N'1SA87C', 194, 194)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'pvuk@ingenii.hr', N'THEE4', 195, 195)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'smatanovic@ingenii.hr', N'I2Z2YHYPSB', 196, 196)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'ajakovljevic@ingenii.hr', N'T54SBM', 197, 197)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'gdukic@ingenii.hr', N'RQX533', 198, 198)
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'mbegovic@ingenii.hr', N'JA8PR4', 199, 199)
GO
INSERT [dbo].[LoginDjelatnik] ([Username], [Password], [DjelatnikID], [UserID]) VALUES (N'msalopek@ingenii.hr', N'EH7VIH', 200, 200)
SET IDENTITY_INSERT [dbo].[LoginDjelatnik] OFF
SET IDENTITY_INSERT [dbo].[Projekt] ON 

INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (1, N'Projekt Mucrosoft Prvi', CAST(N'2010-01-01' AS Date), 151, 1, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (2, N'Projekt Oricle Prvi', CAST(N'2010-01-31' AS Date), 81, 2, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (3, N'Projekt Ubm Prvi', CAST(N'2010-03-02' AS Date), 171, 3, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (4, N'Projekt Sip Prvi', CAST(N'2010-04-01' AS Date), 31, 4, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (5, N'Projekt Symintec Prvi', CAST(N'2010-05-01' AS Date), 191, 5, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (6, N'Projekt Emc Prvi', CAST(N'2010-05-31' AS Date), 141, 6, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (7, N'Projekt Vmwire Prvi', CAST(N'2010-06-30' AS Date), 31, 7, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (8, N'Projekt Silesforcecom Prvi', CAST(N'2010-07-30' AS Date), 131, 9, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (9, N'Projekt Untaut Prvi', CAST(N'2010-08-29' AS Date), 111, 10, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (10, N'Projekt Idobe Prvi', CAST(N'2010-09-28' AS Date), 111, 11, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (11, N'Projekt Sis Prvi', CAST(N'2010-10-28' AS Date), 91, 13, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (12, N'Projekt Cusco Prvi', CAST(N'2010-11-27' AS Date), 191, 14, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (13, N'Projekt Suemens Prvi', CAST(N'2010-12-27' AS Date), 51, 16, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (14, N'Projekt Fajutsa Prvi', CAST(N'2011-01-26' AS Date), 161, 17, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (15, N'Projekt Iatodesk Prvi', CAST(N'2011-02-25' AS Date), 21, 18, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (16, N'Projekt Cutrux Prvi', CAST(N'2011-03-27' AS Date), 11, 19, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (17, N'Projekt Hutichu Prvi', CAST(N'2011-04-26' AS Date), 181, 21, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (18, N'Projekt Ipple Prvi', CAST(N'2011-05-26' AS Date), 31, 22, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (19, N'Projekt Unfor Prvi', CAST(N'2011-06-25' AS Date), 191, 23, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (20, N'Projekt Untel Prvi', CAST(N'2011-07-25' AS Date), 71, 25, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (21, N'Projekt Sige Prvi', CAST(N'2011-08-24' AS Date), 111, 27, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (22, N'Projekt Idp Prvi', CAST(N'2011-09-23' AS Date), 101, 28, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (23, N'Projekt Opentext Prvi', CAST(N'2011-10-23' AS Date), 171, 31, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (24, N'Projekt Sangird Prvi', CAST(N'2011-11-22' AS Date), 131, 32, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (25, N'Projekt Nec Prvi', CAST(N'2011-12-22' AS Date), 41, 33, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (26, N'Projekt Hexigon Prvi', CAST(N'2012-01-21' AS Date), 191, 35, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (27, N'Projekt Teriditi Prvi', CAST(N'2012-02-20' AS Date), 121, 37, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (28, N'Projekt Netipp Prvi', CAST(N'2012-03-21' AS Date), 131, 38, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (29, N'Projekt Mckesson Prvi', CAST(N'2012-04-20' AS Date), 41, 42, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (30, N'Projekt Ptc Prvi', CAST(N'2012-05-20' AS Date), 81, 44, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (31, N'Projekt Ditev Prvi', CAST(N'2012-06-19' AS Date), 161, 47, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (32, N'Projekt Esru Prvi', CAST(N'2012-07-19' AS Date), 141, 48, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (33, N'Projekt Cerner Prvi', CAST(N'2012-08-18' AS Date), 51, 49, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (34, N'Projekt Insys Prvi', CAST(N'2012-09-17' AS Date), 21, 50, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (35, N'Projekt Unformituci Prvi', CAST(N'2012-10-17' AS Date), 151, 51, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (36, N'Projekt Tubco Prvi', CAST(N'2012-11-16' AS Date), 21, 52, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (37, N'Projekt Optam Prvi', CAST(N'2012-12-16' AS Date), 11, 54, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (38, N'Projekt Fuserv Prvi', CAST(N'2013-01-15' AS Date), 141, 56, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (39, N'Projekt Iviyi Prvi', CAST(N'2013-02-14' AS Date), 31, 57, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (40, N'Projekt Kronos Prvi', CAST(N'2013-03-16' AS Date), 101, 58, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (41, N'Projekt Itheniheilth Prvi', CAST(N'2013-04-15' AS Date), 181, 64, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (42, N'Projekt Fuco Prvi', CAST(N'2013-05-15' AS Date), 61, 67, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (43, N'Projekt Fus Prvi', CAST(N'2013-06-14' AS Date), 11, 68, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (44, N'Projekt Musys Prvi', CAST(N'2013-07-14' AS Date), 81, 69, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (45, N'Projekt Swuft Prvi', CAST(N'2013-08-13' AS Date), 141, 71, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (46, N'Projekt Workdiy Prvi', CAST(N'2013-09-12' AS Date), 141, 72, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (47, N'Projekt Totvs Prvi', CAST(N'2013-10-12' AS Date), 171, 74, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (48, N'Projekt Servucenow Prvi', CAST(N'2013-11-11' AS Date), 141, 76, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (49, N'Projekt Commvialt Prvi', CAST(N'2013-12-11' AS Date), 141, 77, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (50, N'Projekt Convergys Prvi', CAST(N'2014-01-10' AS Date), 161, 79, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (51, N'Projekt Neasoft Prvi', CAST(N'2014-02-09' AS Date), 161, 80, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (52, N'Projekt Vusmi Prvi', CAST(N'2014-03-11' AS Date), 21, 81, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (53, N'Projekt Qluk Prvi', CAST(N'2014-04-10' AS Date), 31, 82, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (54, N'Projekt Untersystems Prvi', CAST(N'2014-05-10' AS Date), 41, 85, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (55, N'Projekt Pilintur Prvi', CAST(N'2014-06-09' AS Date), 21, 86, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (56, N'Projekt Anuto Prvi', CAST(N'2014-07-09' AS Date), 51, 87, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (57, N'Projekt Illscrupts Prvi', CAST(N'2014-08-08' AS Date), 101, 88, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (58, N'Projekt Medutech Prvi', CAST(N'2014-09-07' AS Date), 51, 89, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (59, N'Projekt Blickboird Prvi', CAST(N'2014-10-07' AS Date), 191, 90, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (60, N'Projekt Imizoncom Prvi', CAST(N'2014-11-06' AS Date), 1, 91, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (61, N'Projekt Pegisystems Prvi', CAST(N'2014-12-06' AS Date), 21, 93, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (62, N'Projekt Netsaute Prvi', CAST(N'2015-01-05' AS Date), 101, 94, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (63, N'Projekt Mucrostritegy Prvi', CAST(N'2015-02-04' AS Date), 91, 95, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (64, N'Projekt Eset Prvi', CAST(N'2015-03-06' AS Date), 41, 96, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (65, N'Projekt Solirwunds Prvi', CAST(N'2015-04-05' AS Date), 161, 98, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (66, N'Projekt Mucrosoft Drugi', CAST(N'2015-05-05' AS Date), 161, 1, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (67, N'Projekt Oricle Drugi', CAST(N'2015-06-04' AS Date), 151, 2, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (68, N'Projekt Ubm Drugi', CAST(N'2015-07-04' AS Date), 31, 3, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (69, N'Projekt Sip Drugi', CAST(N'2015-08-03' AS Date), 11, 4, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (70, N'Projekt Symintec Drugi', CAST(N'2015-09-02' AS Date), 1, 5, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (71, N'Projekt Emc Drugi', CAST(N'2015-10-02' AS Date), 1, 6, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (72, N'Projekt Vmwire Drugi', CAST(N'2015-11-01' AS Date), 51, 7, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (73, N'Projekt Silesforcecom Drugi', CAST(N'2015-12-01' AS Date), 191, 9, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (74, N'Projekt Untaut Drugi', CAST(N'2015-12-31' AS Date), 91, 10, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (75, N'Projekt Idobe Drugi', CAST(N'2016-01-30' AS Date), 81, 11, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (76, N'Projekt Sis Drugi', CAST(N'2016-02-29' AS Date), 51, 13, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (77, N'Projekt Cusco Drugi', CAST(N'2016-03-30' AS Date), 91, 14, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (78, N'Projekt Suemens Drugi', CAST(N'2016-04-29' AS Date), 101, 16, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (79, N'Projekt Fajutsa Drugi', CAST(N'2016-05-29' AS Date), 181, 17, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (80, N'Projekt Iatodesk Drugi', CAST(N'2016-06-28' AS Date), 101, 18, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (81, N'Projekt Cutrux Drugi', CAST(N'2016-07-28' AS Date), 21, 19, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (82, N'Projekt Hutichu Drugi', CAST(N'2016-08-27' AS Date), 181, 21, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (83, N'Projekt Ipple Drugi', CAST(N'2016-09-26' AS Date), 191, 22, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (84, N'Projekt Unfor Drugi', CAST(N'2016-10-26' AS Date), 81, 23, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (85, N'Projekt Untel Drugi', CAST(N'2016-11-25' AS Date), 121, 25, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (86, N'Projekt Sige Drugi', CAST(N'2016-12-25' AS Date), 151, 27, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (87, N'Projekt Idp Drugi', CAST(N'2017-01-24' AS Date), 121, 28, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (88, N'Projekt Opentext Drugi', CAST(N'2017-02-23' AS Date), 21, 31, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (89, N'Projekt Sangird Drugi', CAST(N'2017-03-25' AS Date), 1, 32, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (90, N'Projekt Nec Drugi', CAST(N'2017-04-24' AS Date), 101, 33, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (91, N'Projekt Hexigon Drugi', CAST(N'2017-05-24' AS Date), 111, 35, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (92, N'Projekt Teriditi Drugi', CAST(N'2017-06-23' AS Date), 171, 37, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (93, N'Projekt Netipp Drugi', CAST(N'2017-07-23' AS Date), 151, 38, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (94, N'Projekt Mckesson Drugi', CAST(N'2017-08-22' AS Date), 21, 42, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (95, N'Projekt Ptc Drugi', CAST(N'2017-09-21' AS Date), 91, 44, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (96, N'Projekt Ditev Drugi', CAST(N'2017-10-21' AS Date), 81, 47, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (97, N'Projekt Esru Drugi', CAST(N'2017-11-20' AS Date), 171, 48, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (98, N'Projekt Cerner Drugi', CAST(N'2017-12-20' AS Date), 171, 49, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (99, N'Projekt Insys Drugi', CAST(N'2018-01-19' AS Date), 121, 50, 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (100, N'Projekt Unformituci Drugi', CAST(N'2018-02-18' AS Date), 181, 51, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (101, N'Projekt Tubco Drugi', CAST(N'2018-03-20' AS Date), 181, 52, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (102, N'Projekt Optam Drugi', CAST(N'2018-04-19' AS Date), 151, 54, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (103, N'Projekt Fuserv Drugi', CAST(N'2018-05-19' AS Date), 121, 56, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (104, N'Projekt Iviyi Drugi', CAST(N'2018-06-18' AS Date), 131, 57, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (105, N'Projekt Kronos Drugi', CAST(N'2018-07-18' AS Date), 161, 58, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (106, N'Projekt Itheniheilth Drugi', CAST(N'2018-08-17' AS Date), 111, 64, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (107, N'Projekt Fuco Drugi', CAST(N'2018-09-16' AS Date), 21, 67, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (108, N'Projekt Fus Drugi', CAST(N'2018-10-16' AS Date), 151, 68, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (109, N'Projekt Musys Drugi', CAST(N'2018-11-15' AS Date), 151, 69, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (110, N'Projekt Swuft Drugi', CAST(N'2018-12-15' AS Date), 181, 71, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (111, N'Projekt Workdiy Drugi', CAST(N'2019-01-14' AS Date), 151, 72, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (112, N'Projekt Totvs Drugi', CAST(N'2019-02-13' AS Date), 11, 74, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (113, N'Projekt Servucenow Drugi', CAST(N'2019-03-15' AS Date), 61, 76, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (114, N'Projekt Commvialt Drugi', CAST(N'2019-04-14' AS Date), 91, 77, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (115, N'Projekt Convergys Drugi', CAST(N'2019-05-14' AS Date), 181, 79, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (116, N'Projekt Neasoft Drugi', CAST(N'2019-06-13' AS Date), 41, 80, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (117, N'Projekt Vusmi Drugi', CAST(N'2019-07-13' AS Date), 121, 81, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (118, N'Projekt Qluk Drugi', CAST(N'2019-08-12' AS Date), 11, 82, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (119, N'Projekt Untersystems Drugi', CAST(N'2019-09-11' AS Date), 121, 85, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (120, N'Projekt Pilintur Drugi', CAST(N'2019-10-11' AS Date), 11, 86, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (121, N'Projekt Anuto Drugi', CAST(N'2019-11-10' AS Date), 51, 87, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (122, N'Projekt Illscrupts Drugi', CAST(N'2019-12-10' AS Date), 131, 88, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (123, N'Projekt Medutech Drugi', CAST(N'2010-01-01' AS Date), 31, 89, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (124, N'Projekt Blickboird Drugi', CAST(N'2010-01-31' AS Date), 111, 90, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (125, N'Projekt Imizoncom Drugi', CAST(N'2010-03-02' AS Date), 91, 91, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (126, N'Projekt Pegisystems Drugi', CAST(N'2010-04-01' AS Date), 51, 93, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (127, N'Projekt Netsaute Drugi', CAST(N'2010-05-01' AS Date), 91, 94, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (128, N'Projekt Mucrostritegy Drugi', CAST(N'2010-05-31' AS Date), 181, 95, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (129, N'Projekt Eset Drugi', CAST(N'2010-06-30' AS Date), 1, 96, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (130, N'Projekt Solirwunds Drugi', CAST(N'2010-07-30' AS Date), 1, 98, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (131, N'Projekt Mucrosoft Prvi iza drugog', CAST(N'2010-08-29' AS Date), 81, 1, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (132, N'Projekt Oricle Prvi iza drugog', CAST(N'2010-09-28' AS Date), 121, 2, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (133, N'Projekt Ubm Prvi iza drugog', CAST(N'2010-10-28' AS Date), 181, 3, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (134, N'Projekt Sip Prvi iza drugog', CAST(N'2010-11-27' AS Date), 11, 4, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (135, N'Projekt Symintec Prvi iza drugog', CAST(N'2010-12-27' AS Date), 1, 5, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (136, N'Projekt Emc Prvi iza drugog', CAST(N'2011-01-26' AS Date), 121, 6, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (137, N'Projekt Vmwire Prvi iza drugog', CAST(N'2011-02-25' AS Date), 81, 7, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (138, N'Projekt Silesforcecom Prvi iza drugog', CAST(N'2011-03-27' AS Date), 71, 9, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (139, N'Projekt Untaut Prvi iza drugog', CAST(N'2011-04-26' AS Date), 71, 10, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (140, N'Projekt Idobe Prvi iza drugog', CAST(N'2011-05-26' AS Date), 141, 11, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (141, N'Projekt Sis Prvi iza drugog', CAST(N'2011-06-25' AS Date), 11, 13, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (142, N'Projekt Cusco Prvi iza drugog', CAST(N'2011-07-25' AS Date), 131, 14, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (143, N'Projekt Suemens Prvi iza drugog', CAST(N'2011-08-24' AS Date), 171, 16, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (144, N'Projekt Fajutsa Prvi iza drugog', CAST(N'2011-09-23' AS Date), 71, 17, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (145, N'Projekt Iatodesk Prvi iza drugog', CAST(N'2011-10-23' AS Date), 31, 18, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (146, N'Projekt Cutrux Prvi iza drugog', CAST(N'2011-11-22' AS Date), 161, 19, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (147, N'Projekt Hutichu Prvi iza drugog', CAST(N'2011-12-22' AS Date), 101, 21, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (148, N'Projekt Ipple Prvi iza drugog', CAST(N'2012-01-21' AS Date), 101, 22, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (149, N'Projekt Unfor Prvi iza drugog', CAST(N'2012-02-20' AS Date), 71, 23, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (150, N'Projekt Untel Prvi iza drugog', CAST(N'2012-03-21' AS Date), 1, 25, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (151, N'Projekt Sige Prvi iza drugog', CAST(N'2012-04-20' AS Date), 51, 27, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (152, N'Projekt Idp Prvi iza drugog', CAST(N'2012-05-20' AS Date), 61, 28, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (153, N'Projekt Opentext Prvi iza drugog', CAST(N'2012-06-19' AS Date), 171, 31, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (154, N'Projekt Sangird Prvi iza drugog', CAST(N'2012-07-19' AS Date), 171, 32, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (155, N'Projekt Nec Prvi iza drugog', CAST(N'2012-08-18' AS Date), 71, 33, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (156, N'Projekt Hexigon Prvi iza drugog', CAST(N'2012-09-17' AS Date), 101, 35, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (157, N'Projekt Teriditi Prvi iza drugog', CAST(N'2012-10-17' AS Date), 141, 37, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (158, N'Projekt Netipp Prvi iza drugog', CAST(N'2012-11-16' AS Date), 61, 38, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (159, N'Projekt Mckesson Prvi iza drugog', CAST(N'2012-12-16' AS Date), 131, 42, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (160, N'Projekt Ptc Prvi iza drugog', CAST(N'2013-01-15' AS Date), 11, 44, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (161, N'Projekt Ditev Prvi iza drugog', CAST(N'2013-02-14' AS Date), 41, 47, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (162, N'Projekt Esru Prvi iza drugog', CAST(N'2013-03-16' AS Date), 111, 48, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (163, N'Projekt Cerner Prvi iza drugog', CAST(N'2013-04-15' AS Date), 21, 49, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (164, N'Projekt Insys Prvi iza drugog', CAST(N'2013-05-15' AS Date), 41, 50, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (165, N'Projekt Unformituci Prvi iza drugog', CAST(N'2013-06-14' AS Date), 141, 51, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (166, N'Projekt Tubco Prvi iza drugog', CAST(N'2013-07-14' AS Date), 151, 52, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (167, N'Projekt Optam Prvi iza drugog', CAST(N'2013-08-13' AS Date), 101, 54, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (168, N'Projekt Fuserv Prvi iza drugog', CAST(N'2013-09-12' AS Date), 41, 56, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (169, N'Projekt Iviyi Prvi iza drugog', CAST(N'2013-10-12' AS Date), 31, 57, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (170, N'Projekt Kronos Prvi iza drugog', CAST(N'2013-11-11' AS Date), 61, 58, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (171, N'Projekt Itheniheilth Prvi iza drugog', CAST(N'2013-12-11' AS Date), 171, 64, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (172, N'Projekt Fuco Prvi iza drugog', CAST(N'2014-01-10' AS Date), 111, 67, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (173, N'Projekt Fus Prvi iza drugog', CAST(N'2014-02-09' AS Date), 171, 68, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (174, N'Projekt Musys Prvi iza drugog', CAST(N'2014-03-11' AS Date), 61, 69, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (175, N'Projekt Swuft Prvi iza drugog', CAST(N'2014-04-10' AS Date), 81, 71, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (176, N'Projekt Workdiy Prvi iza drugog', CAST(N'2014-05-10' AS Date), 111, 72, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (177, N'Projekt Totvs Prvi iza drugog', CAST(N'2014-06-09' AS Date), 91, 74, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (178, N'Projekt Servucenow Prvi iza drugog', CAST(N'2014-07-09' AS Date), 71, 76, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (179, N'Projekt Commvialt Prvi iza drugog', CAST(N'2014-08-08' AS Date), 61, 77, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (180, N'Projekt Convergys Prvi iza drugog', CAST(N'2014-09-07' AS Date), 191, 79, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (181, N'Projekt Neasoft Prvi iza drugog', CAST(N'2014-10-07' AS Date), 161, 80, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (182, N'Projekt Vusmi Prvi iza drugog', CAST(N'2014-11-06' AS Date), 191, 81, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (183, N'Projekt Qluk Prvi iza drugog', CAST(N'2014-12-06' AS Date), 151, 82, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (184, N'Projekt Untersystems Prvi iza drugog', CAST(N'2015-01-05' AS Date), 41, 85, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (185, N'Projekt Pilintur Prvi iza drugog', CAST(N'2015-02-04' AS Date), 151, 86, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (186, N'Projekt Anuto Prvi iza drugog', CAST(N'2015-03-06' AS Date), 161, 87, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (187, N'Projekt Illscrupts Prvi iza drugog', CAST(N'2015-04-05' AS Date), 1, 88, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (188, N'Projekt Medutech Prvi iza drugog', CAST(N'2015-05-05' AS Date), 41, 89, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (189, N'Projekt Blickboird Prvi iza drugog', CAST(N'2015-06-04' AS Date), 111, 90, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (190, N'Projekt Imizoncom Prvi iza drugog', CAST(N'2015-07-04' AS Date), 61, 91, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (191, N'Projekt Pegisystems Prvi iza drugog', CAST(N'2015-08-03' AS Date), 81, 93, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (192, N'Projekt Netsaute Prvi iza drugog', CAST(N'2015-09-02' AS Date), 71, 94, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (193, N'Projekt Mucrostritegy Prvi iza drugog', CAST(N'2015-10-02' AS Date), 71, 95, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (194, N'Projekt Eset Prvi iza drugog', CAST(N'2015-11-01' AS Date), 161, 96, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (195, N'Projekt Solirwunds Prvi iza drugog', CAST(N'2015-12-01' AS Date), 61, 98, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (196, N'Projekt Mucrosoft Treći iza prvog', CAST(N'2015-12-31' AS Date), 41, 1, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (197, N'Projekt Oricle Treći iza prvog', CAST(N'2016-01-30' AS Date), 31, 2, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (198, N'Projekt Ubm Treći iza prvog', CAST(N'2016-02-29' AS Date), 191, 3, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (199, N'Projekt Sip Treći iza prvog', CAST(N'2016-03-30' AS Date), 91, 4, 1)
GO
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (200, N'Projekt Symintec Treći iza prvog', CAST(N'2016-04-29' AS Date), 41, 5, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (201, N'Projekt Emc Treći iza prvog', CAST(N'2016-05-29' AS Date), 131, 6, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (202, N'Projekt Vmwire Treći iza prvog', CAST(N'2016-06-28' AS Date), 131, 7, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (203, N'Projekt Silesforcecom Treći iza prvog', CAST(N'2016-07-28' AS Date), 131, 9, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (204, N'Projekt Untaut Treći iza prvog', CAST(N'2016-08-27' AS Date), 81, 10, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (205, N'Projekt Idobe Treći iza prvog', CAST(N'2016-09-26' AS Date), 51, 11, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (206, N'Projekt Sis Treći iza prvog', CAST(N'2016-10-26' AS Date), 91, 13, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (207, N'Projekt Cusco Treći iza prvog', CAST(N'2016-11-25' AS Date), 131, 14, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (208, N'Projekt Suemens Treći iza prvog', CAST(N'2016-12-25' AS Date), 81, 16, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (209, N'Projekt Fajutsa Treći iza prvog', CAST(N'2017-01-24' AS Date), 121, 17, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (210, N'Projekt Iatodesk Treći iza prvog', CAST(N'2017-02-23' AS Date), 91, 18, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (211, N'Projekt Cutrux Treći iza prvog', CAST(N'2017-03-25' AS Date), 161, 19, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (212, N'Projekt Hutichu Treći iza prvog', CAST(N'2017-04-24' AS Date), 21, 21, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (213, N'Projekt Ipple Treći iza prvog', CAST(N'2017-05-24' AS Date), 71, 22, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (214, N'Projekt Unfor Treći iza prvog', CAST(N'2017-06-23' AS Date), 1, 23, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (215, N'Projekt Untel Treći iza prvog', CAST(N'2017-07-23' AS Date), 131, 25, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (216, N'Projekt Sige Treći iza prvog', CAST(N'2017-08-22' AS Date), 61, 27, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (217, N'Projekt Idp Treći iza prvog', CAST(N'2017-09-21' AS Date), 51, 28, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (218, N'Projekt Opentext Treći iza prvog', CAST(N'2017-10-21' AS Date), 171, 31, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (219, N'Projekt Sangird Treći iza prvog', CAST(N'2017-11-20' AS Date), 181, 32, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (220, N'Projekt Nec Treći iza prvog', CAST(N'2017-12-20' AS Date), 91, 33, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (221, N'Projekt Hexigon Treći iza prvog', CAST(N'2018-01-19' AS Date), 191, 35, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (222, N'Projekt Teriditi Treći iza prvog', CAST(N'2018-02-18' AS Date), 111, 37, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (223, N'Projekt Netipp Treći iza prvog', CAST(N'2018-03-20' AS Date), 191, 38, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (224, N'Projekt Mckesson Treći iza prvog', CAST(N'2018-04-19' AS Date), 181, 42, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (225, N'Projekt Ptc Treći iza prvog', CAST(N'2018-05-19' AS Date), 161, 44, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (226, N'Projekt Ditev Treći iza prvog', CAST(N'2018-06-18' AS Date), 181, 47, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (227, N'Projekt Esru Treći iza prvog', CAST(N'2018-07-18' AS Date), 111, 48, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (228, N'Projekt Cerner Treći iza prvog', CAST(N'2018-08-17' AS Date), 171, 49, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (229, N'Projekt Insys Treći iza prvog', CAST(N'2018-09-16' AS Date), 111, 50, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (230, N'Projekt Unformituci Treći iza prvog', CAST(N'2018-10-16' AS Date), 21, 51, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (231, N'Projekt Tubco Treći iza prvog', CAST(N'2018-11-15' AS Date), 61, 52, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (232, N'Projekt Optam Treći iza prvog', CAST(N'2018-12-15' AS Date), 121, 54, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (233, N'Projekt Fuserv Treći iza prvog', CAST(N'2019-01-14' AS Date), 191, 56, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (234, N'Projekt Iviyi Treći iza prvog', CAST(N'2019-02-13' AS Date), 51, 57, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (235, N'Projekt Kronos Treći iza prvog', CAST(N'2019-03-15' AS Date), 141, 58, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (236, N'Projekt Itheniheilth Treći iza prvog', CAST(N'2019-04-14' AS Date), 81, 64, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (237, N'Projekt Fuco Treći iza prvog', CAST(N'2019-05-14' AS Date), 41, 67, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (238, N'Projekt Fus Treći iza prvog', CAST(N'2019-06-13' AS Date), 121, 68, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (239, N'Projekt Musys Treći iza prvog', CAST(N'2019-07-13' AS Date), 101, 69, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (240, N'Projekt Swuft Treći iza prvog', CAST(N'2019-08-12' AS Date), 141, 71, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (241, N'Projekt Workdiy Treći iza prvog', CAST(N'2019-09-11' AS Date), 31, 72, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (242, N'Projekt Totvs Treći iza prvog', CAST(N'2019-10-11' AS Date), 71, 74, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (243, N'Projekt Servucenow Treći iza prvog', CAST(N'2019-11-10' AS Date), 121, 76, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (244, N'Projekt Commvialt Treći iza prvog', CAST(N'2019-12-10' AS Date), 31, 77, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (245, N'Projekt Convergys Treći iza prvog', CAST(N'2010-01-01' AS Date), 101, 79, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (246, N'Projekt Neasoft Treći iza prvog', CAST(N'2010-01-31' AS Date), 61, 80, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (247, N'Projekt Vusmi Treći iza prvog', CAST(N'2010-03-02' AS Date), 1, 81, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (248, N'Projekt Qluk Treći iza prvog', CAST(N'2010-04-01' AS Date), 61, 82, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (249, N'Projekt Untersystems Treći iza prvog', CAST(N'2010-05-01' AS Date), 31, 85, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (250, N'Projekt Pilintur Treći iza prvog', CAST(N'2010-05-31' AS Date), 11, 86, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (251, N'Projekt Anuto Treći iza prvog', CAST(N'2010-06-30' AS Date), 191, 87, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (252, N'Projekt Illscrupts Treći iza prvog', CAST(N'2010-07-30' AS Date), 71, 88, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (253, N'Projekt Medutech Treći iza prvog', CAST(N'2010-08-29' AS Date), 11, 89, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (254, N'Projekt Blickboird Treći iza prvog', CAST(N'2010-09-28' AS Date), 1, 90, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (255, N'Projekt Imizoncom Treći iza prvog', CAST(N'2010-10-28' AS Date), 51, 91, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (256, N'Projekt Pegisystems Treći iza prvog', CAST(N'2010-11-27' AS Date), 11, 93, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (257, N'Projekt Netsaute Treći iza prvog', CAST(N'2010-12-27' AS Date), 141, 94, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (258, N'Projekt Mucrostritegy Treći iza prvog', CAST(N'2011-01-26' AS Date), 151, 95, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (259, N'Projekt Eset Treći iza prvog', CAST(N'2011-02-25' AS Date), 131, 96, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (260, N'Projekt Solirwunds Treći iza prvog', CAST(N'2011-03-27' AS Date), 71, 98, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (261, N'Project', CAST(N'2020-07-16' AS Date), 1, 22, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (262, N'Project', CAST(N'2020-07-10' AS Date), 1, 1, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (263, N'Project', CAST(N'2020-07-10' AS Date), 1, 1, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (264, N'Project', CAST(N'2020-06-29' AS Date), 1, 1, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (265, N'Project', CAST(N'2020-06-29' AS Date), 1, 21, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (266, N'p', CAST(N'2020-06-29' AS Date), 1, 1, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (267, N'p', CAST(N'2020-06-29' AS Date), 191, 1, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (268, N'p', CAST(N'2020-06-29' AS Date), 191, 1, 1)
INSERT [dbo].[Projekt] ([IDProjekt], [Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (269, N'PPP', CAST(N'2020-06-30' AS Date), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Projekt] OFF
SET IDENTITY_INSERT [dbo].[Projekt_Djelatnik] ON 

INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (1, 2, 1)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (2, 2, 2)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (2, 3, 3)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (3, 3, 4)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (3, 4, 5)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (4, 4, 6)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (5, 4, 7)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (5, 5, 8)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (6, 5, 9)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (6, 6, 10)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (7, 6, 11)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (8, 6, 12)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (8, 7, 13)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (9, 7, 14)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (9, 8, 15)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (10, 8, 16)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (11, 8, 17)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (11, 9, 18)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (12, 9, 19)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (12, 10, 20)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (13, 10, 21)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (14, 10, 22)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (14, 12, 23)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (15, 12, 24)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (15, 13, 25)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (16, 13, 26)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (16, 14, 27)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (17, 14, 28)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (18, 14, 29)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (18, 15, 30)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (19, 15, 31)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (19, 16, 32)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (20, 16, 33)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (21, 16, 34)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (21, 17, 35)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (22, 17, 36)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (22, 18, 37)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (23, 18, 38)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (24, 18, 39)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (24, 19, 40)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (25, 19, 41)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (25, 20, 42)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (26, 20, 43)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (27, 20, 44)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (27, 22, 45)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (28, 22, 46)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (28, 23, 47)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (29, 23, 48)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (30, 23, 49)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (30, 24, 50)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (31, 24, 51)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (31, 25, 52)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (32, 25, 53)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (32, 26, 54)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (33, 26, 55)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (34, 26, 56)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (34, 27, 57)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (35, 27, 58)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (35, 28, 59)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (36, 28, 60)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (37, 28, 61)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (37, 29, 62)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (38, 29, 63)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (38, 30, 64)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (39, 30, 65)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (40, 30, 66)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (40, 32, 67)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (41, 32, 68)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (41, 33, 69)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (42, 33, 70)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (43, 33, 71)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (43, 34, 72)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (44, 34, 73)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (44, 35, 74)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (45, 35, 75)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (46, 35, 76)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (46, 36, 77)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (47, 36, 78)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (47, 37, 79)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (48, 37, 80)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (48, 38, 81)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (49, 38, 82)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (50, 38, 83)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (50, 39, 84)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (51, 39, 85)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (51, 40, 86)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (52, 40, 87)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (53, 40, 88)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (53, 42, 89)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (54, 42, 90)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (54, 43, 91)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (55, 43, 92)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (56, 43, 93)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (56, 44, 94)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (57, 44, 95)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (57, 45, 96)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (58, 45, 97)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (59, 45, 98)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (59, 46, 99)
GO
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (60, 46, 100)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (60, 47, 101)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (61, 47, 102)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (62, 47, 103)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (62, 48, 104)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (63, 48, 105)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (63, 49, 106)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (64, 49, 107)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (64, 50, 108)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (65, 50, 109)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (66, 50, 110)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (66, 52, 111)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (67, 52, 112)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (67, 53, 113)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (68, 53, 114)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (69, 53, 115)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (69, 54, 116)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (70, 54, 117)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (70, 55, 118)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (71, 55, 119)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (72, 55, 120)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (72, 56, 121)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (73, 56, 122)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (73, 57, 123)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (74, 57, 124)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (75, 57, 125)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (75, 58, 126)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (76, 58, 127)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (76, 59, 128)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (77, 59, 129)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (77, 60, 130)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (78, 60, 131)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (79, 60, 132)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (79, 62, 133)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (80, 62, 134)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (80, 63, 135)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (81, 63, 136)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (82, 63, 137)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (82, 64, 138)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (83, 64, 139)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (83, 65, 140)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (84, 65, 141)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (85, 65, 142)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (85, 66, 143)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (86, 66, 144)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (86, 67, 145)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (87, 67, 146)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (88, 67, 147)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (88, 68, 148)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (89, 68, 149)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (89, 69, 150)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (90, 69, 151)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (91, 69, 152)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (91, 70, 153)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (92, 70, 154)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (92, 72, 155)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (93, 72, 156)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (93, 73, 157)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (94, 73, 158)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (95, 73, 159)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (95, 74, 160)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (96, 74, 161)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (96, 75, 162)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (97, 75, 163)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (98, 75, 164)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (98, 76, 165)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (99, 76, 166)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (99, 77, 167)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (100, 77, 168)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (101, 77, 169)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (101, 78, 170)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (102, 78, 171)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (102, 79, 172)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (103, 79, 173)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (104, 79, 174)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (104, 80, 175)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (105, 80, 176)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (105, 82, 177)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (106, 82, 178)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (107, 82, 179)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (107, 83, 180)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (108, 83, 181)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (108, 84, 182)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (109, 84, 183)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (109, 85, 184)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (110, 85, 185)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (111, 85, 186)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (111, 86, 187)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (112, 86, 188)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (112, 87, 189)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (113, 87, 190)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (114, 87, 191)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (114, 88, 192)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (115, 88, 193)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (115, 89, 194)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (116, 89, 195)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (117, 89, 196)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (117, 90, 197)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (118, 90, 198)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (118, 92, 199)
GO
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (119, 92, 200)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (120, 92, 201)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (120, 93, 202)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (121, 93, 203)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (121, 94, 204)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (122, 94, 205)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (123, 94, 206)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (123, 95, 207)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (124, 95, 208)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (124, 96, 209)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (125, 96, 210)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (125, 97, 211)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (126, 97, 212)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (127, 97, 213)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (127, 98, 214)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (128, 98, 215)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (128, 99, 216)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (129, 99, 217)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (130, 99, 218)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (130, 100, 219)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (131, 100, 220)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (131, 102, 221)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (132, 102, 222)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (133, 102, 223)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (133, 103, 224)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (134, 103, 225)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (134, 104, 226)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (135, 104, 227)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (136, 104, 228)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (136, 105, 229)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (137, 105, 230)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (137, 106, 231)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (138, 106, 232)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (138, 107, 233)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (139, 107, 234)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (140, 107, 235)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (140, 108, 236)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (141, 108, 237)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (141, 109, 238)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (142, 109, 239)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (143, 109, 240)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (143, 110, 241)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (144, 110, 242)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (144, 112, 243)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (145, 112, 244)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (146, 112, 245)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (146, 113, 246)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (147, 113, 247)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (147, 114, 248)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (148, 114, 249)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (149, 114, 250)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (149, 115, 251)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (150, 115, 252)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (150, 116, 253)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (151, 116, 254)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (152, 116, 255)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (152, 117, 256)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (153, 117, 257)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (153, 118, 258)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (154, 118, 259)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (154, 119, 260)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (155, 119, 261)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (156, 119, 262)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (156, 120, 263)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (157, 120, 264)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (157, 122, 265)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (158, 122, 266)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (159, 122, 267)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (159, 123, 268)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (160, 123, 269)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (160, 124, 270)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (161, 124, 271)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (162, 124, 272)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (162, 125, 273)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (163, 125, 274)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (163, 126, 275)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (164, 126, 276)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (165, 126, 277)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (165, 127, 278)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (166, 127, 279)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (166, 128, 280)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (167, 128, 281)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (168, 128, 282)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (168, 129, 283)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (169, 129, 284)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (169, 130, 285)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (170, 130, 286)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (170, 132, 287)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (171, 132, 288)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (172, 132, 289)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (172, 133, 290)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (173, 133, 291)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (173, 134, 292)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (174, 134, 293)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (175, 134, 294)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (175, 135, 295)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (176, 135, 296)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (176, 136, 297)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (177, 136, 298)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (178, 136, 299)
GO
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (178, 137, 300)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (179, 137, 301)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (179, 138, 302)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (180, 138, 303)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (181, 138, 304)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (181, 139, 305)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (182, 139, 306)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (182, 140, 307)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (183, 140, 308)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (184, 140, 309)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (184, 142, 310)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (185, 142, 311)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (185, 143, 312)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (186, 143, 313)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (186, 144, 314)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (187, 144, 315)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (188, 144, 316)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (188, 145, 317)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (189, 145, 318)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (189, 146, 319)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (190, 146, 320)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (191, 146, 321)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (191, 147, 322)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (192, 147, 323)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (192, 148, 324)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (193, 148, 325)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (194, 148, 326)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (194, 149, 327)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (195, 149, 328)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (195, 150, 329)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (196, 150, 330)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (197, 150, 331)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (197, 152, 332)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (198, 152, 333)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (198, 153, 334)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (199, 153, 335)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (199, 154, 336)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (200, 154, 337)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (201, 154, 338)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (201, 155, 339)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (202, 155, 340)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (202, 156, 341)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (203, 156, 342)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (204, 156, 343)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (204, 157, 344)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (205, 157, 345)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (205, 158, 346)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (206, 158, 347)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (207, 158, 348)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (207, 159, 349)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (208, 159, 350)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (208, 160, 351)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (209, 160, 352)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (210, 160, 353)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (210, 162, 354)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (211, 162, 355)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (211, 163, 356)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (212, 163, 357)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (213, 163, 358)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (213, 164, 359)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (214, 164, 360)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (214, 165, 361)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (215, 165, 362)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (215, 166, 363)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (216, 166, 364)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (217, 166, 365)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (217, 167, 366)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (218, 167, 367)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (218, 168, 368)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (219, 168, 369)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (220, 168, 370)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (220, 169, 371)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (221, 169, 372)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (221, 170, 373)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (222, 170, 374)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (223, 170, 375)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (223, 172, 376)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (224, 172, 377)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (224, 173, 378)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (225, 173, 379)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (226, 173, 380)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (226, 174, 381)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (227, 174, 382)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (227, 175, 383)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (228, 175, 384)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (229, 175, 385)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (229, 176, 386)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (230, 176, 387)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (230, 177, 388)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (231, 177, 389)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (231, 178, 390)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (232, 178, 391)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (233, 178, 392)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (233, 179, 393)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (234, 179, 394)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (234, 180, 395)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (235, 180, 396)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (236, 180, 397)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (236, 182, 398)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (237, 182, 399)
GO
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (237, 183, 400)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (238, 183, 401)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (239, 183, 402)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (239, 184, 403)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (240, 184, 404)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (240, 185, 405)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (241, 185, 406)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (242, 185, 407)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (242, 186, 408)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (243, 186, 409)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (243, 187, 410)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (244, 187, 411)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (245, 187, 412)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (245, 188, 413)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (246, 188, 414)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (246, 189, 415)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (247, 189, 416)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (247, 190, 417)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (248, 190, 418)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (249, 190, 419)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (249, 192, 420)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (250, 192, 421)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (250, 193, 422)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (251, 193, 423)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (252, 193, 424)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (252, 194, 425)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (253, 194, 426)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (253, 195, 427)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (254, 195, 428)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (255, 195, 429)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (255, 196, 430)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (256, 196, 431)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (256, 197, 432)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (257, 197, 433)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (258, 197, 434)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (258, 198, 435)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (259, 198, 436)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (259, 199, 437)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (260, 199, 438)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (1, 151, 439)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (2, 81, 440)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (3, 171, 441)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (4, 31, 442)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (5, 191, 443)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (6, 141, 444)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (7, 31, 445)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (8, 131, 446)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (9, 111, 447)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (10, 111, 448)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (11, 91, 449)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (12, 191, 450)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (13, 51, 451)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (14, 161, 452)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (15, 21, 453)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (16, 11, 454)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (17, 181, 455)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (18, 31, 456)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (19, 191, 457)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (20, 71, 458)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (21, 111, 459)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (22, 101, 460)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (23, 171, 461)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (24, 131, 462)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (25, 41, 463)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (26, 191, 464)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (27, 121, 465)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (28, 131, 466)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (29, 41, 467)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (30, 81, 468)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (31, 161, 469)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (32, 141, 470)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (33, 51, 471)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (34, 21, 472)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (35, 151, 473)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (36, 21, 474)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (37, 11, 475)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (38, 141, 476)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (39, 31, 477)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (40, 101, 478)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (41, 181, 479)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (42, 61, 480)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (43, 11, 481)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (44, 81, 482)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (45, 141, 483)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (46, 141, 484)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (47, 171, 485)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (48, 141, 486)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (49, 141, 487)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (50, 161, 488)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (51, 161, 489)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (52, 21, 490)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (53, 31, 491)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (54, 41, 492)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (55, 21, 493)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (56, 51, 494)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (57, 101, 495)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (58, 51, 496)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (59, 191, 497)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (60, 1, 498)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (61, 21, 499)
GO
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (62, 101, 500)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (63, 91, 501)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (64, 41, 502)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (65, 161, 503)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (66, 161, 504)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (67, 151, 505)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (68, 31, 506)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (69, 11, 507)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (70, 1, 508)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (71, 1, 509)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (72, 51, 510)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (73, 191, 511)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (74, 91, 512)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (75, 81, 513)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (76, 51, 514)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (77, 91, 515)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (78, 101, 516)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (79, 181, 517)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (80, 101, 518)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (81, 21, 519)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (82, 181, 520)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (83, 191, 521)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (84, 81, 522)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (85, 121, 523)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (86, 151, 524)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (87, 121, 525)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (88, 21, 526)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (89, 1, 527)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (90, 101, 528)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (91, 111, 529)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (92, 171, 530)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (93, 151, 531)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (94, 21, 532)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (95, 91, 533)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (96, 81, 534)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (97, 171, 535)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (98, 171, 536)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (99, 121, 537)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (100, 181, 538)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (101, 181, 539)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (102, 151, 540)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (103, 121, 541)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (104, 131, 542)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (105, 161, 543)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (106, 111, 544)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (107, 21, 545)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (108, 151, 546)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (109, 151, 547)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (110, 181, 548)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (111, 151, 549)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (112, 11, 550)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (113, 61, 551)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (114, 91, 552)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (115, 181, 553)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (116, 41, 554)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (117, 121, 555)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (118, 11, 556)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (119, 121, 557)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (120, 11, 558)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (121, 51, 559)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (122, 131, 560)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (123, 31, 561)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (124, 111, 562)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (125, 91, 563)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (126, 51, 564)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (127, 91, 565)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (128, 181, 566)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (129, 1, 567)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (130, 1, 568)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (131, 81, 569)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (132, 121, 570)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (133, 181, 571)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (134, 11, 572)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (135, 1, 573)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (136, 121, 574)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (137, 81, 575)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (138, 71, 576)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (139, 71, 577)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (140, 141, 578)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (141, 11, 579)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (142, 131, 580)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (143, 171, 581)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (144, 71, 582)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (145, 31, 583)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (146, 161, 584)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (147, 101, 585)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (148, 101, 586)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (149, 71, 587)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (150, 1, 588)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (151, 51, 589)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (152, 61, 590)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (153, 171, 591)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (154, 171, 592)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (155, 71, 593)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (156, 101, 594)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (157, 141, 595)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (158, 61, 596)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (159, 131, 597)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (160, 11, 598)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (161, 41, 599)
GO
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (162, 111, 600)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (163, 21, 601)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (164, 41, 602)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (165, 141, 603)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (166, 151, 604)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (167, 101, 605)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (168, 41, 606)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (169, 31, 607)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (170, 61, 608)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (171, 171, 609)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (172, 111, 610)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (173, 171, 611)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (174, 61, 612)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (175, 81, 613)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (176, 111, 614)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (177, 91, 615)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (178, 71, 616)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (179, 61, 617)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (180, 191, 618)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (181, 161, 619)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (182, 191, 620)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (183, 151, 621)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (184, 41, 622)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (185, 151, 623)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (186, 161, 624)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (187, 1, 625)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (188, 41, 626)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (189, 111, 627)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (190, 61, 628)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (191, 81, 629)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (192, 71, 630)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (193, 71, 631)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (194, 161, 632)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (195, 61, 633)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (196, 41, 634)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (197, 31, 635)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (198, 191, 636)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (199, 91, 637)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (200, 41, 638)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (201, 131, 639)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (202, 131, 640)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (203, 131, 641)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (204, 81, 642)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (205, 51, 643)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (206, 91, 644)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (207, 131, 645)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (208, 81, 646)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (209, 121, 647)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (210, 91, 648)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (211, 161, 649)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (212, 21, 650)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (213, 71, 651)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (214, 1, 652)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (215, 131, 653)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (216, 61, 654)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (217, 51, 655)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (218, 171, 656)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (219, 181, 657)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (220, 91, 658)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (221, 191, 659)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (222, 111, 660)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (223, 191, 661)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (224, 181, 662)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (225, 161, 663)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (226, 181, 664)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (227, 111, 665)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (228, 171, 666)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (229, 111, 667)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (230, 21, 668)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (231, 61, 669)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (232, 121, 670)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (233, 191, 671)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (234, 51, 672)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (235, 141, 673)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (236, 81, 674)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (237, 41, 675)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (238, 121, 676)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (239, 101, 677)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (240, 141, 678)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (241, 31, 679)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (242, 71, 680)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (243, 121, 681)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (244, 31, 682)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (245, 101, 683)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (246, 61, 684)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (247, 1, 685)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (248, 61, 686)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (249, 31, 687)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (250, 11, 688)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (251, 191, 689)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (252, 71, 690)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (253, 11, 691)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (254, 1, 692)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (255, 51, 693)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (256, 11, 694)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (257, 141, 695)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (258, 151, 696)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (259, 131, 697)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (260, 71, 698)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (266, 72, 699)
GO
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (266, 28, 700)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (266, 164, 701)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (266, 72, 702)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (266, 28, 703)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (266, 164, 704)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (269, 164, 705)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (269, 38, 706)
INSERT [dbo].[Projekt_Djelatnik] ([ProjektID], [DjelatnikID], [IDProjekt_Djelatnik]) VALUES (269, 169, 707)
SET IDENTITY_INSERT [dbo].[Projekt_Djelatnik] OFF
SET IDENTITY_INSERT [dbo].[Projekt_Tim] ON 

INSERT [dbo].[Projekt_Tim] ([IDProjektTim], [ProjektID], [TimID]) VALUES (15, 266, 1)
INSERT [dbo].[Projekt_Tim] ([IDProjektTim], [ProjektID], [TimID]) VALUES (16, 269, 8)
SET IDENTITY_INSERT [dbo].[Projekt_Tim] OFF
SET IDENTITY_INSERT [dbo].[SatiProjekt] ON 

INSERT [dbo].[SatiProjekt] ([IDSatiProjekt], [DjelatnikID], [ProjektID], [Datum], [SatiPrekovremeni], [SatiRadni], [Predano], [Komentar], [KlijentID]) VALUES (1340, 3, 2, CAST(N'2020-07-07' AS Date), 0, 5, 1, NULL, NULL)
INSERT [dbo].[SatiProjekt] ([IDSatiProjekt], [DjelatnikID], [ProjektID], [Datum], [SatiPrekovremeni], [SatiRadni], [Predano], [Komentar], [KlijentID]) VALUES (1341, 3, 3, CAST(N'2020-07-07' AS Date), 0, 4, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SatiProjekt] OFF
SET IDENTITY_INSERT [dbo].[Tim] ON 

INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (1, N'Tim Bube Ingenii', NULL, 1, CAST(N'2016-04-02' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (2, N'Tim Čelični Ingenii', NULL, 1, CAST(N'2012-06-20' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (3, N'Tim Duh Ingenii', NULL, 1, CAST(N'2012-03-17' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (4, N'Tim Dijamantni Ingenii', NULL, 1, CAST(N'2012-06-22' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (5, N'Tim Električni Ingenii', NULL, 1, CAST(N'2013-12-12' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (6, N'Tim Kameni Ingenii', NULL, 1, CAST(N'2017-12-03' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (7, N'Tim Ledeni Ingenii', NULL, 1, CAST(N'2010-06-04' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (8, N'Tim Legendarni Ingenii', NULL, 1, CAST(N'2013-06-13' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (9, N'Tim Leteći Ingenii', NULL, 1, CAST(N'2019-09-09' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (10, N'Tim Mračni Ingenii', NULL, 1, CAST(N'2014-02-27' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (11, N'Tim Normalni Ingenii', NULL, 1, CAST(N'2014-02-19' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (12, N'Tim Otrovni Ingenii', NULL, 1, CAST(N'2018-05-09' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (13, N'Tim Početni Ingenii', NULL, 1, CAST(N'2018-01-27' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (14, N'Tim Završni Ingenii', NULL, 1, CAST(N'2014-10-04' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (15, N'Tim Travnati Ingenii', NULL, 1, CAST(N'2014-09-02' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (16, N'Tim Vatreni Ingenii', NULL, 1, CAST(N'2013-03-04' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (17, N'Tim Vodeni Ingenii', NULL, 1, CAST(N'2014-12-09' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (18, N'Tim Zemljani Ingenii', NULL, 1, CAST(N'2017-07-12' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (19, N'Tim Zmaj Ingenii', NULL, 1, CAST(N'2016-02-13' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (20, N'Tim Svemir Ingenii', NULL, 1, CAST(N'2010-10-20' AS Date))
INSERT [dbo].[Tim] ([IDTim], [Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (21, N'Tim', 1, 0, CAST(N'2020-07-11' AS Date))
SET IDENTITY_INSERT [dbo].[Tim] OFF
SET IDENTITY_INSERT [dbo].[TipDjelatnika] ON 

INSERT [dbo].[TipDjelatnika] ([IDTip], [Naziv]) VALUES (1, N'Direktor')
INSERT [dbo].[TipDjelatnika] ([IDTip], [Naziv]) VALUES (2, N'Voditelj tima')
INSERT [dbo].[TipDjelatnika] ([IDTip], [Naziv]) VALUES (4, N'Stalni zaposlenik')
INSERT [dbo].[TipDjelatnika] ([IDTip], [Naziv]) VALUES (5, N'Honorarni zaposlenik')
INSERT [dbo].[TipDjelatnika] ([IDTip], [Naziv]) VALUES (6, N'Student')
SET IDENTITY_INSERT [dbo].[TipDjelatnika] OFF
ALTER TABLE [dbo].[Djelatnik] ADD  DEFAULT ((1)) FOR [Aktivnost]
GO
ALTER TABLE [dbo].[SatiProjekt] ADD  DEFAULT ((0)) FOR [Predano]
GO
ALTER TABLE [dbo].[SatiProjekt] ADD  DEFAULT (NULL) FOR [KlijentID]
GO
ALTER TABLE [dbo].[Djelatnik]  WITH CHECK ADD FOREIGN KEY([TimID])
REFERENCES [dbo].[Tim] ([IDTim])
GO
ALTER TABLE [dbo].[Djelatnik]  WITH CHECK ADD FOREIGN KEY([TipID])
REFERENCES [dbo].[TipDjelatnika] ([IDTip])
GO
ALTER TABLE [dbo].[LoginDjelatnik]  WITH CHECK ADD FOREIGN KEY([DjelatnikID])
REFERENCES [dbo].[Djelatnik] ([IDDjelatnik])
GO
ALTER TABLE [dbo].[Projekt]  WITH CHECK ADD FOREIGN KEY([KlijentID])
REFERENCES [dbo].[Klijent] ([IDKlijent])
GO
ALTER TABLE [dbo].[Projekt]  WITH CHECK ADD FOREIGN KEY([VoditeljID])
REFERENCES [dbo].[Djelatnik] ([IDDjelatnik])
GO
ALTER TABLE [dbo].[Projekt_Djelatnik]  WITH CHECK ADD FOREIGN KEY([DjelatnikID])
REFERENCES [dbo].[Djelatnik] ([IDDjelatnik])
GO
ALTER TABLE [dbo].[Projekt_Djelatnik]  WITH CHECK ADD FOREIGN KEY([ProjektID])
REFERENCES [dbo].[Projekt] ([IDProjekt])
GO
ALTER TABLE [dbo].[Projekt_Tim]  WITH CHECK ADD FOREIGN KEY([ProjektID])
REFERENCES [dbo].[Projekt] ([IDProjekt])
GO
ALTER TABLE [dbo].[Projekt_Tim]  WITH CHECK ADD FOREIGN KEY([TimID])
REFERENCES [dbo].[Tim] ([IDTim])
GO
ALTER TABLE [dbo].[SatiProjekt]  WITH CHECK ADD FOREIGN KEY([DjelatnikID])
REFERENCES [dbo].[Djelatnik] ([IDDjelatnik])
GO
ALTER TABLE [dbo].[SatiProjekt]  WITH CHECK ADD FOREIGN KEY([KlijentID])
REFERENCES [dbo].[Klijent] ([IDKlijent])
GO
ALTER TABLE [dbo].[SatiProjekt]  WITH CHECK ADD FOREIGN KEY([ProjektID])
REFERENCES [dbo].[Projekt] ([IDProjekt])
GO
ALTER TABLE [dbo].[Tim]  WITH CHECK ADD FOREIGN KEY([VoditeljID])
REFERENCES [dbo].[Djelatnik] ([IDDjelatnik])
GO
/****** Object:  StoredProcedure [dbo].[ActivityChange]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ActivityChange]
(
@objekt nvarchar(25),
@id int,
@aktivnost int
)
as
begin
    if(@objekt='djelatnik')
	  begin
	    update Djelatnik 
		set Aktivnost = @aktivnost
		where IDDjelatnik = @id
      end
	 else if(@objekt = 'projekt')
	  begin
	    update Projekt
		set Aktivnost = @aktivnost
		where IDProjekt = @id
      end
	else if(@objekt = 'tim')
	  begin
	    update Tim
		set Aktivnost = @aktivnost
	    where IDTim = @id
	  end
end

GO
/****** Object:  StoredProcedure [dbo].[DjelatnikIDLogin]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[DjelatnikIDLogin]
@username nvarchar(50),
@password nvarchar(50)
as
select DjelatnikID
from LoginDjelatnik
where LoginDjelatnik.Username=@username and LoginDjelatnik.Password=@password
GO
/****** Object:  StoredProcedure [dbo].[GetDjelatnici]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE proc [dbo].[GetDjelatnici]
   as
   begin
   select * from Djelatnik
   where TipID not like '2'
   end
GO
/****** Object:  StoredProcedure [dbo].[GetDjelatnik]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetDjelatnik]
 @id int
as 
  begin
   select * from Djelatnik
   where @id = Djelatnik.IDDjelatnik
  end
GO
/****** Object:  StoredProcedure [dbo].[GetDjelatnikeNaProjektu]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE proc [dbo].[GetDjelatnikeNaProjektu]
 @IDProjekt int
 as
   begin
     select IDDjelatnik, Ime, Prezime, TipID
	 from Djelatnik
	 inner join Projekt_Djelatnik
	 on ProjektID = @IDProjekt
	 where DjelatnikID = IDDjelatnik and TipID != 2
   end
GO
/****** Object:  StoredProcedure [dbo].[GetIzvjestajPoTimu]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetIzvjestajPoTimu]
@timID int,
@DatumPocetak date,
@DatumKraj date
as
 select * from SatiProjekt
 inner join Djelatnik on IDDjelatnik = SatiProjekt.DjelatnikID
 inner join Tim on IDTim = Djelatnik.TimID
 where IDTim=@timID and Datum between @DatumPocetak and @DatumKraj
GO
/****** Object:  StoredProcedure [dbo].[GetIzvjestajZaKlijenta]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetIzvjestajZaKlijenta]
@KlijentID int,
@DatumPocetak date,
@DatumKraj date
as
 select distinct * from SatiProjekt
 inner join Projekt on Projekt.IDProjekt = SatiProjekt.ProjektID
 inner join Klijent on Projekt.KlijentID = Klijent.IDKlijent
 where IDKlijent=@KlijentID and Datum between @DatumPocetak and @DatumKraj
GO
/****** Object:  StoredProcedure [dbo].[GetKlijent]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetKlijent]
@id int
as
begin 
  select * from Klijent
  where IDKlijent = @id
end
GO
/****** Object:  StoredProcedure [dbo].[GetKlijenti]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetKlijenti]
as
  select * from Klijent

GO
/****** Object:  StoredProcedure [dbo].[GetProjectId]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetProjectId]
@naziv nvarchar(25)
as
 select Projekt.IDProjekt
 from Projekt
 where Projekt.Naziv = @naziv
GO
/****** Object:  StoredProcedure [dbo].[GetProjekt]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetProjekt]
@id int
as
 begin
  select * from Projekt
  where IDProjekt = @id
 end
GO
/****** Object:  StoredProcedure [dbo].[GetProjekteDjelatnika]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetProjekteDjelatnika]
@IDDjelatnika int
as
  begin
    select Naziv
	from Projekt
	inner join Projekt_Djelatnik 
	ON DjelatnikID = @IDDjelatnika
	where ProjektID = IDProjekt
  end
GO
/****** Object:  StoredProcedure [dbo].[GetTeams]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetTeams]
 as
 begin
   select * from Tim
 end
GO
/****** Object:  StoredProcedure [dbo].[GetTim]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetTim]
@id int
as
select * from Tim
where IDTim=@id
GO
/****** Object:  StoredProcedure [dbo].[GetTimoveNaProjektu]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create proc [dbo].[GetTimoveNaProjektu]
 @IDProjekt int
 as
   begin
     select *
	 from Tim
	 inner join Projekt_Tim
	 on ProjektID = @IDProjekt
	 where TimID = IDTim
   end
GO
/****** Object:  StoredProcedure [dbo].[GetTimovi]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetTimovi]
as
select * from Tim
GO
/****** Object:  StoredProcedure [dbo].[GetTypes]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetTypes]
 as
 begin
   select * from TipDjelatnika
 end
GO
/****** Object:  StoredProcedure [dbo].[GetUsername]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetUsername]
@DjelatnikID int
as
select Username from LoginDjelatnik where DjelatnikID = @DjelatnikID
GO
/****** Object:  StoredProcedure [dbo].[GetVoditelji]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetVoditelji]
as
  select * from Djelatnik
  where TipID = 2
GO
/****** Object:  StoredProcedure [dbo].[InsertDjelatnikNaProjekt]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[InsertDjelatnikNaProjekt]
@idDjelatnik int,
@idProjekt int
as
insert into Projekt_Djelatnik
values (@idProjekt,@idDjelatnik)
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create proc [dbo].[InsertEmployee]
  @ime nvarchar(50), @prezime nvarchar(50), @Email nvarchar(100), 
  @datumZaposlenja date, @tip int, @tim int
 as
  begin
   insert into Djelatnik
   (Ime, Prezime, Email, DatumZaposlenja,TipID, TimID)
   values(@ime, @prezime, @Email, @datumZaposlenja, @tip, @tim)
  end
GO
/****** Object:  StoredProcedure [dbo].[InsertKlijent]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[InsertKlijent]
@ime nvarchar(50),
@email nvarchar(50)
as
insert into Klijent
values(@ime, @email)
GO
/****** Object:  StoredProcedure [dbo].[InsertProject]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[InsertProject]
@naziv nvarchar(50),
@datumOtvaranja date,
@idVoditelj int,
@idKlijent int
as
 insert into Projekt
 (Naziv,DatumOtvaranja,VoditeljID,KlijentID,Aktivnost)
 values(@naziv, @datumOtvaranja, @idVoditelj,@idKlijent, 1)
  
GO
/****** Object:  StoredProcedure [dbo].[InsertTeam]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   create proc [dbo].[InsertTeam]
   @naziv nvarchar(50),
   @VoditeljID int,
   @DatumKreiranja date
   as
   begin
     insert into Tim
	 values(@naziv, @VoditeljID, 1, @DatumKreiranja)
   end
GO
/****** Object:  StoredProcedure [dbo].[InsertTimNaProjekt]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[InsertTimNaProjekt]
@idTim int,
@idProjekt int
as
  insert into Projekt_Tim
  values (@idProjekt, @idTim)
GO
/****** Object:  StoredProcedure [dbo].[IzbaciDjelatnikaSProjekta]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create proc [dbo].[IzbaciDjelatnikaSProjekta]
 @projektID int,
 @djelatnikID int
 as
 delete from Projekt_Djelatnik
 where ProjektID = @projektID and DjelatnikID=@djelatnikID
GO
/****** Object:  StoredProcedure [dbo].[IzbaciTimSProjekta]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
 create proc [dbo].[IzbaciTimSProjekta]
 @projektID int,
 @timID int
 as
 delete from Projekt_Tim
 where ProjektID = @projektID and TimID=@timID
GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[LoginUser]
	@username nvarchar(50),
	@password nvarchar(50)
as
begin
  select count(1) from LoginDjelatnik where Username=@username and Password=@password
end

GO
/****** Object:  StoredProcedure [dbo].[UpdateDjelatnik]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[UpdateDjelatnik]
@IDDjelatnik int, 
@TipID int,
@Ime nvarchar(50),
@Prezime nvarchar(50),
@Email nvarchar(50),
@DatumZaposlenja date,
@TimID int
as 
 begin
	update Djelatnik
	set TipID=@TipID, Ime=@Ime, Prezime=@Prezime, Email=@Email, DatumZaposlenja=@DatumZaposlenja,
	TimID = @TimID
	where IDDjelatnik = @IDDjelatnik
 end
GO
/****** Object:  StoredProcedure [dbo].[UpdateKlijent]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdateKlijent]
@id int,
@ime nvarchar(50),
@email nvarchar(50)
as
update Klijent
set Ime = @ime, Email=@email
where IDKlijent=@id
GO
/****** Object:  StoredProcedure [dbo].[UpdateProject]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   create proc [dbo].[UpdateProject]
   @id int, @naziv nvarchar(50),
   @datumOtvaranja date, @idVoditelj int,
   @idKlijent int
   as
   update Projekt
   set Naziv = @naziv, DatumOtvaranja=@datumOtvaranja,
   VoditeljID=@idVoditelj, KlijentID=@idKlijent
   where IDProjekt = @id
GO
/****** Object:  StoredProcedure [dbo].[UpdateTim]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdateTim]
@id int,
@naziv nvarchar(50),
@voditeljID int,
@DatumKreiranja date
as
update Tim
set Naziv=@naziv, VoditeljID=@voditeljID, DatumKreiranja=@DatumKreiranja
where IDTim=@id
GO
/****** Object:  StoredProcedure [dbo].[VratiIDpoUsernameu]    Script Date: 7/7/2020 8:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[VratiIDpoUsernameu]
@username nvarchar(50)
as
select DjelatnikID
from LoginDjelatnik
where Username = @username
GO
USE [master]
GO
ALTER DATABASE [PRA20-Erika-Raguž] SET  READ_WRITE 
GO
