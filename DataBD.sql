USE [master]
GO
/****** Object:  Database [TelekomNeva]    Script Date: 25.04.2022 13:04:44 ******/
CREATE DATABASE [TelekomNeva]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TelekomNeva', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TelekomNeva.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TelekomNeva_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TelekomNeva_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TelekomNeva] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TelekomNeva].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TelekomNeva] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TelekomNeva] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TelekomNeva] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TelekomNeva] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TelekomNeva] SET ARITHABORT OFF 
GO
ALTER DATABASE [TelekomNeva] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TelekomNeva] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TelekomNeva] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TelekomNeva] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TelekomNeva] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TelekomNeva] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TelekomNeva] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TelekomNeva] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TelekomNeva] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TelekomNeva] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TelekomNeva] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TelekomNeva] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TelekomNeva] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TelekomNeva] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TelekomNeva] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TelekomNeva] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TelekomNeva] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TelekomNeva] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TelekomNeva] SET  MULTI_USER 
GO
ALTER DATABASE [TelekomNeva] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TelekomNeva] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TelekomNeva] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TelekomNeva] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TelekomNeva] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TelekomNeva] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TelekomNeva] SET QUERY_STORE = OFF
GO
USE [TelekomNeva]
GO
/****** Object:  Table [dbo].[Абонент]    Script Date: 25.04.2022 13:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Абонент](
	[Номер_абонента] [int] NOT NULL,
	[Имя] [nchar](10) NOT NULL,
	[Фамилия] [nchar](10) NOT NULL,
	[Отчество] [nchar](10) NULL,
	[Дата_рождения] [nchar](10) NULL,
 CONSTRAINT [PK_Абонент] PRIMARY KEY CLUSTERED 
(
	[Номер_абонента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявка]    Script Date: 25.04.2022 13:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявка](
	[Номер_заявки] [int] NOT NULL,
	[Номер_оборудования] [int] NOT NULL,
	[Выполнена] [bit] NOT NULL,
	[Дата_поступления_заявки] [nvarchar](11) NOT NULL,
	[Номер_сотрудника] [int] NOT NULL,
	[Номер_абонента] [int] NOT NULL,
 CONSTRAINT [PK_Заявка] PRIMARY KEY CLUSTERED 
(
	[Номер_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Оборудование]    Script Date: 25.04.2022 13:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оборудование](
	[Номер_оборудования] [int] NOT NULL,
	[Серийный_номер] [int] NULL,
	[Тип] [int] NULL,
	[MAC_адрес] [int] NULL,
	[IР_адрес] [int] NULL,
	[Номер_списка_телефонов] [int] NULL,
	[Дата_установки] [nvarchar](11) NULL,
	[Количество_портов] [int] NULL,
	[Примечание] [nvarchar](50) NOT NULL,
	[Номер_точки_подключения] [int] NULL,
 CONSTRAINT [PK_Оборудование] PRIMARY KEY CLUSTERED 
(
	[Номер_оборудования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Порт]    Script Date: 25.04.2022 13:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Порт](
	[Номер_порта] [int] NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
	[Свободен] [bit] NOT NULL,
 CONSTRAINT [PK_Порт] PRIMARY KEY CLUSTERED 
(
	[Номер_порта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роль]    Script Date: 25.04.2022 13:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роль](
	[Номер_роли] [int] NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Роль] PRIMARY KEY CLUSTERED 
(
	[Номер_роли] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 25.04.2022 13:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[Номер_сторудника] [int] NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NULL,
	[Дата_рождения] [nvarchar](11) NULL,
	[Роль] [int] NOT NULL,
 CONSTRAINT [PK_Сотрудник] PRIMARY KEY CLUSTERED 
(
	[Номер_сторудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Список_оборудования]    Script Date: 25.04.2022 13:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Список_оборудования](
	[Номер_списка_оборудования] [int] NOT NULL,
	[Номер_заявки] [int] NOT NULL,
	[Номер_оборудованя] [int] NOT NULL,
 CONSTRAINT [PK_Список_оборудования] PRIMARY KEY CLUSTERED 
(
	[Номер_списка_оборудования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Список_портов]    Script Date: 25.04.2022 13:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Список_портов](
	[Номер_списка_портов] [int] NOT NULL,
	[Номер_порта] [int] NOT NULL,
	[Номер_оборудования] [int] NOT NULL,
 CONSTRAINT [PK_Список_портов] PRIMARY KEY CLUSTERED 
(
	[Номер_списка_портов] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Список_телефонов]    Script Date: 25.04.2022 13:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Список_телефонов](
	[Номер_списка_телефонов] [int] NOT NULL,
	[Номер_телефона] [int] NOT NULL,
	[Номер_оборудования] [int] NOT NULL,
 CONSTRAINT [PK_Список_телефонов] PRIMARY KEY CLUSTERED 
(
	[Номер_списка_телефонов] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Телефон]    Script Date: 25.04.2022 13:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Телефон](
	[Номер_код_телефон] [int] NOT NULL,
	[Номер_телефона] [int] NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Телефон] PRIMARY KEY CLUSTERED 
(
	[Номер_код_телефон] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип_оборудования]    Script Date: 25.04.2022 13:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип_оборудования](
	[Номер_типа_оборудования] [int] NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Тип_оборудования] PRIMARY KEY CLUSTERED 
(
	[Номер_типа_оборудования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Точка_подключения]    Script Date: 25.04.2022 13:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Точка_подключения](
	[Номер_точки_подключения] [int] NOT NULL,
	[Адрес] [nvarchar](max) NOT NULL,
	[Точка_подключения] [nvarchar](max) NULL,
	[Географические_координаты] [nvarchar](50) NULL,
 CONSTRAINT [PK_Точка_подключения] PRIMARY KEY CLUSTERED 
(
	[Номер_точки_подключения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Заявка_Абонент] FOREIGN KEY([Номер_абонента])
REFERENCES [dbo].[Абонент] ([Номер_абонента])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK_Заявка_Абонент]
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Заявка_Сотрудник] FOREIGN KEY([Номер_сотрудника])
REFERENCES [dbo].[Сотрудник] ([Номер_сторудника])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK_Заявка_Сотрудник]
GO
ALTER TABLE [dbo].[Оборудование]  WITH CHECK ADD  CONSTRAINT [FK_Оборудование_Тип_оборудования] FOREIGN KEY([Тип])
REFERENCES [dbo].[Тип_оборудования] ([Номер_типа_оборудования])
GO
ALTER TABLE [dbo].[Оборудование] CHECK CONSTRAINT [FK_Оборудование_Тип_оборудования]
GO
ALTER TABLE [dbo].[Оборудование]  WITH CHECK ADD  CONSTRAINT [FK_Оборудование_Точка_подключения] FOREIGN KEY([Номер_точки_подключения])
REFERENCES [dbo].[Точка_подключения] ([Номер_точки_подключения])
GO
ALTER TABLE [dbo].[Оборудование] CHECK CONSTRAINT [FK_Оборудование_Точка_подключения]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Роль] FOREIGN KEY([Роль])
REFERENCES [dbo].[Роль] ([Номер_роли])
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [FK_Сотрудник_Роль]
GO
ALTER TABLE [dbo].[Список_оборудования]  WITH CHECK ADD  CONSTRAINT [FK_Список_оборудования_Заявка] FOREIGN KEY([Номер_заявки])
REFERENCES [dbo].[Заявка] ([Номер_заявки])
GO
ALTER TABLE [dbo].[Список_оборудования] CHECK CONSTRAINT [FK_Список_оборудования_Заявка]
GO
ALTER TABLE [dbo].[Список_оборудования]  WITH CHECK ADD  CONSTRAINT [FK_Список_оборудования_Оборудование] FOREIGN KEY([Номер_оборудованя])
REFERENCES [dbo].[Оборудование] ([Номер_оборудования])
GO
ALTER TABLE [dbo].[Список_оборудования] CHECK CONSTRAINT [FK_Список_оборудования_Оборудование]
GO
ALTER TABLE [dbo].[Список_портов]  WITH CHECK ADD  CONSTRAINT [FK_Список_портов_Оборудование] FOREIGN KEY([Номер_оборудования])
REFERENCES [dbo].[Оборудование] ([Номер_оборудования])
GO
ALTER TABLE [dbo].[Список_портов] CHECK CONSTRAINT [FK_Список_портов_Оборудование]
GO
ALTER TABLE [dbo].[Список_портов]  WITH CHECK ADD  CONSTRAINT [FK_Список_портов_Порт] FOREIGN KEY([Номер_порта])
REFERENCES [dbo].[Порт] ([Номер_порта])
GO
ALTER TABLE [dbo].[Список_портов] CHECK CONSTRAINT [FK_Список_портов_Порт]
GO
ALTER TABLE [dbo].[Список_телефонов]  WITH CHECK ADD  CONSTRAINT [FK_Список_телефонов_Оборудование] FOREIGN KEY([Номер_оборудования])
REFERENCES [dbo].[Оборудование] ([Номер_оборудования])
GO
ALTER TABLE [dbo].[Список_телефонов] CHECK CONSTRAINT [FK_Список_телефонов_Оборудование]
GO
ALTER TABLE [dbo].[Список_телефонов]  WITH CHECK ADD  CONSTRAINT [FK_Список_телефонов_Телефон] FOREIGN KEY([Номер_телефона])
REFERENCES [dbo].[Телефон] ([Номер_код_телефон])
GO
ALTER TABLE [dbo].[Список_телефонов] CHECK CONSTRAINT [FK_Список_телефонов_Телефон]
GO
USE [master]
GO
ALTER DATABASE [TelekomNeva] SET  READ_WRITE 
GO
