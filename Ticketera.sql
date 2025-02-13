USE [master]
GO
/****** Object:  Database [Ticketera]    Script Date: 29/11/2024 09:00:27 a. m. ******/
CREATE DATABASE [Ticketera]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ticketera', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Ticketera.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ticketera_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Ticketera_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Ticketera] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ticketera].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ticketera] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ticketera] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ticketera] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ticketera] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ticketera] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ticketera] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ticketera] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ticketera] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ticketera] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ticketera] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ticketera] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ticketera] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ticketera] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ticketera] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ticketera] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ticketera] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ticketera] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ticketera] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ticketera] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ticketera] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ticketera] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ticketera] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ticketera] SET RECOVERY FULL 
GO
ALTER DATABASE [Ticketera] SET  MULTI_USER 
GO
ALTER DATABASE [Ticketera] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ticketera] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ticketera] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ticketera] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ticketera] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ticketera] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ticketera', N'ON'
GO
ALTER DATABASE [Ticketera] SET QUERY_STORE = ON
GO
ALTER DATABASE [Ticketera] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Ticketera]
GO
/****** Object:  User [Dari]    Script Date: 29/11/2024 09:00:27 a. m. ******/
CREATE USER [Dari] FOR LOGIN [Dari] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Dari]
GO
/****** Object:  Table [dbo].[cache]    Script Date: 29/11/2024 09:00:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cache](
	[key] [nvarchar](255) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
	[expiration] [int] NOT NULL,
 CONSTRAINT [cache_key_primary] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cache_locks]    Script Date: 29/11/2024 09:00:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cache_locks](
	[key] [nvarchar](255) NOT NULL,
	[owner] [nvarchar](255) NOT NULL,
	[expiration] [int] NOT NULL,
 CONSTRAINT [cache_locks_key_primary] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[failed_jobs]    Script Date: 29/11/2024 09:00:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[failed_jobs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uuid] [nvarchar](255) NOT NULL,
	[connection] [nvarchar](max) NOT NULL,
	[queue] [nvarchar](max) NOT NULL,
	[payload] [nvarchar](max) NOT NULL,
	[exception] [nvarchar](max) NOT NULL,
	[failed_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job_batches]    Script Date: 29/11/2024 09:00:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job_batches](
	[id] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[total_jobs] [int] NOT NULL,
	[pending_jobs] [int] NOT NULL,
	[failed_jobs] [int] NOT NULL,
	[failed_job_ids] [nvarchar](max) NOT NULL,
	[options] [nvarchar](max) NULL,
	[cancelled_at] [int] NULL,
	[created_at] [int] NOT NULL,
	[finished_at] [int] NULL,
 CONSTRAINT [job_batches_id_primary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 29/11/2024 09:00:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[queue] [nvarchar](255) NOT NULL,
	[payload] [nvarchar](max) NOT NULL,
	[attempts] [tinyint] NOT NULL,
	[reserved_at] [int] NULL,
	[available_at] [int] NOT NULL,
	[created_at] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[migrations]    Script Date: 29/11/2024 09:00:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[migration] [nvarchar](255) NOT NULL,
	[batch] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[password_reset_tokens]    Script Date: 29/11/2024 09:00:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password_reset_tokens](
	[email] [nvarchar](255) NOT NULL,
	[token] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [password_reset_tokens_email_primary] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seguimientos]    Script Date: 29/11/2024 09:00:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seguimientos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ticket_id] [bigint] NOT NULL,
	[comentario] [text] NOT NULL,
	[fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sessions]    Script Date: 29/11/2024 09:00:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sessions](
	[id] [nvarchar](255) NOT NULL,
	[user_id] [bigint] NULL,
	[ip_address] [nvarchar](45) NULL,
	[user_agent] [nvarchar](max) NULL,
	[payload] [nvarchar](max) NOT NULL,
	[last_activity] [int] NOT NULL,
 CONSTRAINT [sessions_id_primary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tickets]    Script Date: 29/11/2024 09:00:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tickets](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[solicitante] [varchar](255) NOT NULL,
	[area] [varchar](255) NOT NULL,
	[descripcion] [text] NOT NULL,
	[prioridad] [varchar](20) NOT NULL,
	[estatus] [varchar](20) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 29/11/2024 09:00:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[correo] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [failed_jobs_uuid_unique]    Script Date: 29/11/2024 09:00:27 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [failed_jobs_uuid_unique] ON [dbo].[failed_jobs]
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [jobs_queue_index]    Script Date: 29/11/2024 09:00:27 a. m. ******/
CREATE NONCLUSTERED INDEX [jobs_queue_index] ON [dbo].[jobs]
(
	[queue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [sessions_last_activity_index]    Script Date: 29/11/2024 09:00:27 a. m. ******/
CREATE NONCLUSTERED INDEX [sessions_last_activity_index] ON [dbo].[sessions]
(
	[last_activity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [sessions_user_id_index]    Script Date: 29/11/2024 09:00:27 a. m. ******/
CREATE NONCLUSTERED INDEX [sessions_user_id_index] ON [dbo].[sessions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[failed_jobs] ADD  DEFAULT (getdate()) FOR [failed_at]
GO
ALTER TABLE [dbo].[seguimientos] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[tickets] ADD  DEFAULT ('normal') FOR [prioridad]
GO
ALTER TABLE [dbo].[tickets] ADD  DEFAULT ('pendiente') FOR [estatus]
GO
ALTER TABLE [dbo].[seguimientos]  WITH CHECK ADD FOREIGN KEY([ticket_id])
REFERENCES [dbo].[tickets] ([id])
GO
USE [master]
GO
ALTER DATABASE [Ticketera] SET  READ_WRITE 
GO
