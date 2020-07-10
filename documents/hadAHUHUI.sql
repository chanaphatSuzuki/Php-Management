USE [master]
GO
/****** Object:  Database [DB451]    Script Date: 29/3/2563 14:55:10 ******/
CREATE DATABASE [DB451]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB451', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB451.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB451_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB451_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB451] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB451].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB451] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB451] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB451] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB451] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB451] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB451] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB451] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB451] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB451] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB451] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB451] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB451] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB451] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB451] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB451] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB451] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB451] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB451] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB451] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB451] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB451] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB451] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB451] SET RECOVERY FULL 
GO
ALTER DATABASE [DB451] SET  MULTI_USER 
GO
ALTER DATABASE [DB451] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB451] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB451] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB451] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB451] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB451', N'ON'
GO
ALTER DATABASE [DB451] SET QUERY_STORE = OFF
GO
USE [DB451]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 29/3/2563 14:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [char](8) NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
	[gender] [char](1) NULL,
	[BYear] [int] NULL,
	[Telephone] [varchar](50) NULL,
	[CountNo] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [char](8) NULL,
	[age]  AS (datepart(year,getdate())-[BYear]),
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 29/3/2563 14:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherID] [char](8) NOT NULL,
	[TeacherName] [varchar](50) NULL,
	[countSpu] [int] NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 29/3/2563 14:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Students.StudentID, dbo.Students.StudentName, dbo.Teachers.TeacherID, dbo.Teachers.TeacherName
FROM            dbo.Students INNER JOIN
                         dbo.Teachers ON dbo.Students.TeacherID = dbo.Teachers.TeacherID
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_gender]  DEFAULT ('m') FOR [gender]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_BYear]  DEFAULT ((2000)) FOR [BYear]
GO
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [DF_Teachers_countSpu]  DEFAULT ((0)) FOR [countSpu]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Teachers]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [CK_Students_BYear] CHECK  (([BYear]>=(1950) AND [BYear]<=(2000)))
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [CK_Students_BYear]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [CK_Students_gender] CHECK  (([gender]='F' OR [gender]='M' OR [gender]='f' OR [gender]='m'))
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [CK_Students_gender]
GO
/****** Object:  Trigger [dbo].[deleteStudent]    Script Date: 29/3/2563 14:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[deleteStudent]
   ON  [dbo].[Students] 
   AFTER delete
AS 
BEGIN
	declare @TID	char(8)
	declare @X		int
	declare @CDel	int

	select @TID = TeacherID from deleted
	select @CDel = count(*) from deleted
	select @X = countSpu from Teachers where TeacherID = @TID

	set @X = @X -@CDel

	update Teachers set countSpu = @X where TeacherID = @TID

END
GO
ALTER TABLE [dbo].[Students] ENABLE TRIGGER [deleteStudent]
GO
/****** Object:  Trigger [dbo].[insertStudent]    Script Date: 29/3/2563 14:55:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[insertStudent]
   ON  [dbo].[Students] 
   AFTER insert
AS 
BEGIN
	declare @TID	char(8)
	declare @X		int

	select @TID = TeacherID from inserted
	select @X = countSpu from Teachers where TeacherID = @TID

	set @X = @X + 1

	update Teachers set countSpu = @X where TeacherID = @TID

END
GO
ALTER TABLE [dbo].[Students] ENABLE TRIGGER [insertStudent]
GO
/****** Object:  Trigger [dbo].[deleteView1]    Script Date: 29/3/2563 14:55:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[deleteView1]
   ON [dbo].[View_1]
   INSTEAD OF DELETE
AS 
BEGIN
	declare @SID char(8)
	select @SID=StudentID from deleted


	delete Students where StudentID=@SID



END
GO
/****** Object:  Trigger [dbo].[insertView1]    Script Date: 29/3/2563 14:55:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[insertView1]
   ON  [dbo].[View_1]
   INSTEAD OF INSERT
AS 
BEGIN
	declare @SID char(8)
	declare @SNAME varchar(50)
	declare @TID char(8)
	declare @TNAME varchar(50)

	select @SID=StudentID,@SNAME=StudentName from inserted
	select @TID=TeacherID,@TNAME=TeacherName from inserted

	declare @c int
	select @c = count(*) from Teachers where TeacherID=@TID;

	if @c = 0
		begin
			insert into Teachers(TeacherID,TeacherName)values(@TID,@TNAME)
			insert into Students(StudentID,StudentName)values(@SID,@SNAME)
		end
	else
		begin
			insert into Students(StudentID,StudentName)values(@SID,@SNAME)
		end



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
         Begin Table = "Students"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Teachers"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [DB451] SET  READ_WRITE 
GO
