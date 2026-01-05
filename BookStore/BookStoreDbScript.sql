USE [master]
GO
/****** Object:  Database [BookStoreDb]    Script Date: 05-01-2026 07:48:35 PM ******/
CREATE DATABASE [BookStoreDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStoreDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BookStoreDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStoreDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BookStoreDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookStoreDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStoreDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStoreDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStoreDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStoreDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStoreDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStoreDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStoreDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStoreDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStoreDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStoreDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStoreDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStoreDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStoreDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStoreDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStoreDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStoreDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStoreDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStoreDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStoreDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStoreDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStoreDb] SET  MULTI_USER 
GO
ALTER DATABASE [BookStoreDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStoreDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStoreDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStoreDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStoreDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStoreDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookStoreDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookStoreDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookStoreDb]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 05-01-2026 07:48:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Author] [nvarchar](150) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[PublishedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [PublishedDate], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (6, N'Clean Code', N'Robert C. Martin', CAST(499.00 AS Decimal(10, 2)), CAST(N'2008-08-01T00:00:00.000' AS DateTime), 1, CAST(N'2026-01-03T00:35:50.213' AS DateTime), NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [PublishedDate], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (7, N'The Pragmatic Programmer', N'Andrew Hunt', CAST(599.00 AS Decimal(10, 2)), CAST(N'1999-10-20T00:00:00.000' AS DateTime), 1, CAST(N'2026-01-03T00:35:50.213' AS DateTime), NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [PublishedDate], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (8, N'Design Patterns', N'Erich Gamma', CAST(699.00 AS Decimal(10, 2)), CAST(N'1994-11-10T00:00:00.000' AS DateTime), 1, CAST(N'2026-01-03T00:35:50.213' AS DateTime), NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [PublishedDate], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (9, N'Refactoring', N'Martin Fowler', CAST(549.00 AS Decimal(10, 2)), CAST(N'1999-07-08T00:00:00.000' AS DateTime), 1, CAST(N'2026-01-03T00:35:50.213' AS DateTime), NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [PublishedDate], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (10, N'Head First Design Patterns', N'Eric Freeman', CAST(450.00 AS Decimal(10, 2)), CAST(N'2004-10-25T00:00:00.000' AS DateTime), 1, CAST(N'2026-01-03T00:35:50.213' AS DateTime), NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [PublishedDate], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (11, N'Domain-Driven Design', N'Eric Evans', CAST(650.00 AS Decimal(10, 2)), CAST(N'2003-08-30T00:00:00.000' AS DateTime), 1, CAST(N'2026-01-03T00:35:50.213' AS DateTime), NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [PublishedDate], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (12, N'Clean Architecture', N'Robert C. Martin', CAST(520.00 AS Decimal(10, 2)), CAST(N'2017-09-20T00:00:00.000' AS DateTime), 1, CAST(N'2026-01-03T00:35:50.213' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  StoredProcedure [dbo].[sp_Books_Delete]    Script Date: 05-01-2026 07:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Books_Delete]
    @Id INT
AS
BEGIN
    -- Delete the book permanently
    DELETE FROM Books
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Books_GetAll]    Script Date: 05-01-2026 07:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Books_GetAll]
AS
BEGIN
    SELECT *
    FROM Books
    WHERE IsActive = 1
    ORDER BY Id DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Books_GetById]    Script Date: 05-01-2026 07:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Books_GetById]
    @Id INT
AS
BEGIN
    SELECT Id, Title, Author, Price, PublishedDate, IsActive, CreatedDate, UpdatedDate
    FROM Books
    WHERE Id = @Id AND IsActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Books_Insert]    Script Date: 05-01-2026 07:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Books_Insert]
    @Title NVARCHAR(200),
    @Author NVARCHAR(150),
    @Price DECIMAL(10,2),
    @PublishedDate DATETIME
AS
BEGIN
    -- Check if a book with the same title already exists
    IF EXISTS (SELECT 1 FROM Books WHERE Title = @Title AND IsActive = 1)
    BEGIN
        -- Optional: return an error
        RAISERROR('A book with this title already exists.', 16, 1);
        RETURN;
    END

    -- Insert book if no duplicate found
    INSERT INTO Books (Title, Author, Price, PublishedDate, IsActive, CreatedDate)
    VALUES (@Title, @Author, @Price, @PublishedDate, 1, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Books_Update]    Script Date: 05-01-2026 07:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Books_Update]
    @Id INT,
    @Title NVARCHAR(200),
    @Author NVARCHAR(150),
    @Price DECIMAL(10,2),
    @PublishedDate DATETIME
AS
BEGIN
    -- Check if another book with the same title exists
    IF EXISTS (
        SELECT 1 
        FROM Books
        WHERE Title = @Title 
          AND Id <> @Id  -- exclude current book
          AND IsActive = 1
    )
    BEGIN
        -- Raise error if duplicate found
        RAISERROR('Another book with this title already exists.', 16, 1);
        RETURN;
    END

    -- Update book if no duplicate
    UPDATE Books
    SET Title = @Title,
        Author = @Author,
        Price = @Price,
        PublishedDate = @PublishedDate,
        UpdatedDate = GETDATE()
    WHERE Id = @Id
END
GO
USE [master]
GO
ALTER DATABASE [BookStoreDb] SET  READ_WRITE 
GO
