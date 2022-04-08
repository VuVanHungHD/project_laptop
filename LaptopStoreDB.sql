USE [master]
GO
/****** Object:  Database [LaptopStoreDB]    Script Date: 4/8/2022 10:56:35 AM ******/
CREATE DATABASE [LaptopStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaptopStoreDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LaptopStoreDB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LaptopStoreDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LaptopStoreDB_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LaptopStoreDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LaptopStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LaptopStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LaptopStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LaptopStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LaptopStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LaptopStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LaptopStoreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LaptopStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [LaptopStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LaptopStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LaptopStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LaptopStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LaptopStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LaptopStoreDB', N'ON'
GO
USE [LaptopStoreDB]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 4/8/2022 10:56:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[total] [decimal](18, 0) NOT NULL,
	[status] [nvarchar](max) NULL,
	[userId] [int] NOT NULL,
	[dateCreate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 4/8/2022 10:56:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[count] [int] NOT NULL,
	[billId] [int] NOT NULL,
	[productId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.BillDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blog]    Script Date: 4/8/2022 10:56:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[author] [nvarchar](max) NOT NULL,
	[dateCreate] [datetime] NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
 CONSTRAINT [PK_dbo.Blog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/8/2022 10:56:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[descript] [nvarchar](max) NOT NULL,
	[parentId] [int] NULL,
 CONSTRAINT [PK_dbo.Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/8/2022 10:56:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [ntext] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/8/2022 10:56:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[categoryId] [int] NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
	[percentSale] [int] NULL CONSTRAINT [DF_Product_percentSale]  DEFAULT ((0)),
	[promotionPrice] [decimal](18, 0) NULL,
	[shortDescript] [nvarchar](250) NULL,
	[content] [nvarchar](max) NULL,
	[cpu] [nvarchar](max) NULL,
	[ram] [nvarchar](max) NULL,
	[hardDrive] [nvarchar](max) NULL,
	[cardVGA] [nvarchar](max) NULL,
	[screenMonitor] [nvarchar](250) NULL,
	[camera] [nvarchar](max) NULL,
	[connector] [nvarchar](max) NULL,
	[weight] [nvarchar](max) NULL,
	[battery] [nvarchar](max) NULL,
	[operatingSystem] [nvarchar](max) NULL,
	[viewCount] [int] NOT NULL,
	[imageUrl] [nvarchar](max) NULL,
	[createDate] [datetime] NULL CONSTRAINT [DF_Picture_createDate]  DEFAULT (getdate()),
	[status] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Picture] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 4/8/2022 10:56:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phonenumber] [nvarchar](15) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[status] [nvarchar](30) NULL,
	[userType] [nvarchar](10) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([id], [name], [content], [author], [dateCreate]) VALUES (3, N'5 bức tranh hoa đẹp như đang khoe sắc giữa không gian thực', N'<p>C&oacute; thể n&oacute;i, với sự ph&aacute;t triển vược bậc của lĩnh vực hội họa, người d&acirc;n Việt Nam c&agrave;ng ng&agrave;y c&agrave;ng ưu ti&ecirc;n sử dụng những t&aacute;c phẩm&nbsp;<a href="https://bantranh.com/pc/tranh-son-dau/">tranh sơn dầu</a>&nbsp;hay tranh sơn m&agrave;i cho mục địch ri&ecirc;ng của m&igrave;nh như trang tr&iacute; nội thất hay triển l&atilde;m tranh,&hellip; Thật vậy, c&oacute; rất nhiều thể loại tranh đ&atilde; v&agrave; đang xuất hiện ở thị trường tranh hiện nay, mở rộng lựa chọn cho người ti&ecirc;u d&ugrave;ng. C&oacute; những đề t&agrave;i tranh đ&atilde; từng rất ph&aacute;t triển v&agrave; được trọng dụng trong qu&aacute; khứ, tuy nhi&ecirc;n đ&atilde; trở n&ecirc;n lỗi thời ở hiện tại. Thế nhưng, những bức tranh về đề t&agrave;i hoa đẹp l&agrave; một ngoại lệ. Ch&uacute;ng kh&ocirc;ng bao giờ lỗi thời, bị người đời hắt hủi. Tr&aacute;i lại, tranh về đề t&agrave;i hoa lu&ocirc;n dễ d&agrave;ng chiếm cảm t&igrave;nh của người ti&ecirc;u d&ugrave;ng bởi n&eacute;t đẹp giản dị v&agrave; ph&ugrave; hợp với nhiều mục đ&iacute;ch sử đụng. H&ocirc;m nay,&nbsp;<a href="https://bantranh.com/">bantranh.com</a>&nbsp;xin được giới thiệu với bạn 5 bức&nbsp;<a href="https://bantranh.com/pc/tranh-nghe-thuat/">tranh nghệ thuật</a>&nbsp;hoa đẹp như đang khoe sắc giữa kh&ocirc;ng gian thực.</p>

<p><a href="https://bantranh.com/pd/hoa-do/"><img alt="5 bức tranh hoa đẹp như đang khoe sắc giữa không gian thực" src="https://laptopaz.vn/media/lib/2319_rogg513-8.jpg" style="height:400px; width:334px" /></a><br />
Bức tranh mi&ecirc;u tả ch&acirc;n thực h&igrave;nh ảnh những b&ocirc;ng hoa đỏ đang khoe sắc giữa kh&ocirc;ng gian. Bức tranh cực kỳ ph&ugrave; hợp để d&ugrave;ng trang tr&iacute; kh&ocirc;ng gian nội thất gia đ&igrave;nh bởi t&iacute;nh chất phong thủy của n&oacute;.</p>

<p><a href="https://bantranh.com/pd/lilac-tim/"><img alt="5 bức tranh hoa đẹp như đang khoe sắc giữa không gian thực" src="https://bantranh.com/wp-content/uploads/2021/11/5-buc-tranh-hoa-dep-nhu-dang-khoe-sac-giua-khong-gian-thuc2-401x400.jpg" style="height:400px; width:401px" /></a><br />
Bức tranh tĩnh vật &ldquo;Lilac t&iacute;m&rdquo; l&agrave; một bức tranh mang n&eacute;t giản dị v&agrave; mộc mạc. Như t&ecirc;n gọi, bức tranh mi&ecirc;u tả h&igrave;nh ảnh những b&ocirc;ng hoa lilac t&iacute;m đang khoe sắc b&ecirc;n c&aacute;nh cửa sổ.</p>

<p><a href="https://bantranh.com/pd/bach-lien-2/"><img alt="5 bức tranh hoa đẹp như đang khoe sắc giữa không gian thực" src="https://bantranh.com/wp-content/uploads/2021/11/5-buc-tranh-hoa-dep-nhu-dang-khoe-sac-giua-khong-gian-thuc3-267x400.jpeg" style="height:400px; width:267px" /></a><br />
&ldquo;Bạch li&ecirc;n&rdquo; mi&ecirc;u tả h&igrave;nh ảnh những b&ocirc;ng hoa sen trắng đang đua nở. Bức tranh c&oacute; gi&aacute; trị thẩm mỹ cao, ph&ugrave; hợp d&ugrave;ng trang tr&iacute; ở đại đa số vị tr&iacute; trong kh&ocirc;ng gian nội thất gia đ&igrave;nh.</p>

<p><a href="https://bantranh.com/pd/hoa-tim-2/"><img alt="5 bức tranh hoa đẹp như đang khoe sắc giữa không gian thực" src="https://bantranh.com/wp-content/uploads/2021/11/5-buc-tranh-hoa-dep-nhu-dang-khoe-sac-giua-khong-gian-thuc4-328x400.jpg" style="height:400px; width:328px" /></a><br />
Bức tranh &ldquo;Hoa t&iacute;m&rdquo; mang một vẻ đẹp mộc mạc v&agrave; giản dị. M&agrave;u t&iacute;m tượng trưng cho vẻ đẹp đơn giản, kh&ocirc;ng sang trọng hay qu&yacute; ph&aacute;i, chỉ l&agrave; một n&eacute;t đẹp giản đơn nhưng cũng đủ thu h&uacute;t l&ograve;ng người.</p>

<p><a href="https://bantranh.com/pd/hoa-moc-lan-2/"><img alt="5 bức tranh hoa đẹp như đang khoe sắc giữa không gian thực" src="https://bantranh.com/wp-content/uploads/2021/11/5-buc-tranh-hoa-dep-nhu-dang-khoe-sac-giua-khong-gian-thuc5-320x400.jpg" style="height:400px; width:320px" /></a><br />
Hoa mộc lam l&agrave; một lo&agrave;i hoa giản dị v&agrave; gần gũi với đời sống b&igrave;nh thường. Thật vậy, bức tranh tuy nh&igrave;n c&oacute; vẻ đơn giản, nhưng ch&iacute;nh sự đơn giản đ&oacute; lại l&agrave; n&eacute;t cuốn h&uacute;t &aacute;nh mắt người đam m&ecirc; nghệ thuật hội họa.</p>
', N'Nguyễn Thị Hồng Hạnh', CAST(N'2022-04-06 17:00:09.160' AS DateTime))
INSERT [dbo].[Blog] ([id], [name], [content], [author], [dateCreate]) VALUES (4, N'Mua tranh sơn mài đẹp ở đâu?', N'<p>Sơn m&agrave;i l&agrave; một loại chất liệu xuất hiện từ sớm trong lịch sử Việt Nam. Theo nghiến cứu khảo cổ, những bằng chứng đầu ti&ecirc;n về sự xuất hiện của chất liệu sơn m&agrave;i đ&atilde; xuất hiện từ h&agrave;ng trăm năm trước C&ocirc;ng nguy&ecirc;n. Theo thời gian, sơn m&agrave;i c&agrave;ng ng&agrave;y c&agrave;ng được sử dụng nhiều hơn trong nhiều lĩnh vực, điển h&igrave;nh như đẻ trang tr&iacute; cho những đồ vật của người quyền qu&yacute;. Trải qua nhiều thăng trầm của lịch sử, sơn m&agrave;i cuối c&ugrave;ng cũng t&igrave;m cho m&igrave;nh một chỗ đứng vững chắc trong l&agrave;ng nghệ thuật hội họa Việt Nam. Sở hữu cho m&igrave;nh một kho t&agrave;ng tranh độc đ&aacute;o v&agrave; đồ sộ, kh&ocirc;ng qu&aacute; khi c&ocirc;ng nhận&nbsp;<strong><a href="https://bantranh.com/pc/tranh-son-mai/" title="tranh sơn mài">tranh sơn m&agrave;i</a></strong>&nbsp;l&agrave; một trong những loại tranh c&oacute; gi&aacute; trị thẩm mỹ cao nhất. Tranh sơn m&agrave;i được tạo n&ecirc;n bởi rất nhiều c&ocirc;ng sức v&agrave; t&acirc;m huyết. L&agrave; một thể loại hội họa đ&ograve;i hỏi t&iacute;nh ki&ecirc;n tr&igrave; v&agrave; tỉ mỉ, những bức tranh sơn m&agrave;i thường mang một vẻ đẹp sang trọng, từng đường n&eacute;t được trau chuốt một c&aacute;ch v&ocirc; c&ugrave;ng cẩn thận, qua đ&oacute; cũng khiến cho những bức tranh sơn m&agrave;i c&oacute; gi&aacute; trị cao về nhiều mặt.</p>

<p><a href="https://bantranh.com/pd/ben-dau/"><img alt="7CC33B73 D698 4C42 8D33 F8689D8A7D7A" src="https://bantranh.com/wp-content/uploads/2021/10/7CC33B73-D698-4C42-8D33-F8689D8A7D7A-600x598.jpeg" /></a></p>

<p>Tuy tranh sơn m&agrave;i nổi tiếng về nhiều mặt l&agrave; vậy, người d&acirc;n Việt Nam đ&ocirc;i khi vẫn kh&ocirc;ng biết lựa chọn cho m&igrave;nh một địa điểm mua tranh sơn m&agrave;i hợp l&yacute; v&agrave; uy t&iacute;n. Ch&iacute;nh điều n&agrave;y đ&ocirc;i khi khiến cho họ gặp phải những trường hợp kh&ocirc;ng may mắn như mua phải tranh giả, tranh k&eacute;m chất lượng, đội ngũ tư vấn của cửa h&agrave;ng kh&ocirc;ng chuy&ecirc;n nghiệp,&hellip; V&igrave; vậy,&nbsp;<a href="https://bantranh.com/">bantranh.com</a>&nbsp;ch&iacute;nh l&agrave; nơi qu&yacute; kh&aacute;ch c&oacute; thể y&ecirc;n t&acirc;m gửi gắm những suy nghĩ, c&acirc;u hỏi của m&igrave;nh khi muốn lựa chọn một bức tranh sơn m&agrave;i đẹp v&agrave; ph&ugrave; hợp với mục đ&iacute;ch sử dụng của m&igrave;nh. Bantranh.com sở hữu một bộ sưu tầm tranh sơn m&agrave;i đồ sộ với rất nhiều đề t&agrave;i kh&aacute;c nhau, gi&uacute;p qu&yacute; kh&aacute;ch c&oacute; th&ecirc;m nhiều sự lựa chọn hơn bao giờ hết. Ch&uacute;ng t&ocirc;i cũng sở hữu một đ&ocirc;i ngũ tư vấn chuy&ecirc;n nghiệp, với nhiều năm l&agrave;m việc trong lĩnh vực nghệ thuật, đảm bảo sẽ cho qu&yacute; kh&aacute;ch những lời khuy&ecirc;n ch&acirc;n th&agrave;nh v&agrave; bổ &iacute;ch nhất mỗi khi qu&yacute; kh&aacute;ch c&oacute; c&acirc;u hỏi cần giải đ&aacute;p.<br />
Một số bức tranh sơn m&agrave;i đẹp của những họa sĩ t&agrave;i năng tại Việt Nam m&agrave; ch&uacute;ng t&ocirc;i đang giới thiệu:</p>

<p><a href="https://bantranh.com/pd/trau-cau-8/"><img alt="20210922 093425" src="https://bantranh.com/wp-content/uploads/2021/10/20210922_093425-600x599.jpg" /></a></p>

<p><a href="https://bantranh.com/pd/thieu-nu-tam/"><img alt="co gai 03" src="https://bantranh.com/wp-content/uploads/2021/10/co-gai-03-600x897.jpg" /></a></p>

<p><a href="https://bantranh.com/pd/tranh-sen/"><img alt="IMG 8471" src="https://bantranh.com/wp-content/uploads/2021/10/IMG_8471-600x400.jpg" /></a></p>

<p><a href="https://bantranh.com/pd/tinh-vat-hoa-7/"><img alt="PicsArt 10 25 11.13.54" src="https://bantranh.com/wp-content/uploads/2021/10/PicsArt_10-25-11.13.54-600x747.jpg" /></a></p>
', N'Phạm Thị Hà', CAST(N'2022-01-05 22:29:46.320' AS DateTime))
INSERT [dbo].[Blog] ([id], [name], [content], [author], [dateCreate]) VALUES (5, N'10 bức tranh sơn dầu độc bản đẹp và lôi cuốn', N'<p>Nghệ thuật hội họa l&agrave; một trong những sự tồn tại đ&atilde; xuất hiện từ rất sớm trong lịch sử lo&agrave;i người, bắt đầu từ khi lo&agrave;i người biết nhận thức. Qua thời gian, n&oacute; ph&aacute;t triển v&agrave; khẳng định chỗ đứng vững chắc của m&igrave;nh đối với nh&acirc;n loại. V&agrave; như một điều tất yếu, hội họa ph&aacute;t triển đi k&egrave;m với sự ra đời của những trường ph&aacute;i, thể loại kh&aacute;c nhau, trong số đ&oacute; c&oacute; thể kể đến phong c&aacute;ch tranh sử dụng chất liệu sơn dầu đặc biệt. Tại Việt Nam, tranh sơn dầu ph&aacute;t triển một c&aacute;ch mạnh mẽ v&agrave; nhanh ch&oacute;ng được ưa d&ugrave;ng bởi đại đa số người d&acirc;n ta. H&ocirc;m nay,&nbsp;<a href="https://bantranh.com/"><strong>bantranh.com</strong></a>&nbsp;xin được giới thiệu với bạn đọc 10 bức&nbsp;<a href="https://bantranh.com/pc/tranh-son-dau/"><strong>tranh sơn dầu</strong></a>&nbsp;đẹp v&agrave; độc bản, đ&acirc;y l&agrave; những bức tranh chỉ c&oacute; duy nhất một bản được vẽ v&agrave; b&aacute;n tới những người y&ecirc;u tranh trong v&agrave; ngo&agrave;i nước.</p>

<p><img alt="10 bức tranh sơn dầu độc bản đẹp và lôi cuốn" src="https://bantranh.com/wp-content/uploads/2021/09/10-buc-tranh-son-dau-doc-ban-dep-va-loi-cuon1-400x400.jpeg" style="height:400px; width:400px" /><br />
L&agrave; một t&aacute;c phẩm sơn dầu được vẽ với phong c&aacute;ch tả thực đặc biệt, bức tranh đ&atilde; khắc họa v&ocirc; c&ugrave;ng ch&acirc;n thực sự dễ thương v&agrave; sức sống của b&eacute; g&aacute;i nhỏ.</p>

<p><a href="https://bantranh.com/pd/goc-nang/"><img alt="10 bức tranh sơn dầu độc bản đẹp và lôi cuốn" src="https://bantranh.com/wp-content/uploads/2021/09/10-buc-tranh-son-dau-doc-ban-dep-va-loi-cuon2-250x400.jpeg" style="height:400px; width:250px" /></a><br />
T&aacute;c phẩm &ldquo;G&oacute;c nắng&rdquo; mi&ecirc;u tả con phố H&agrave; Nội xưa, khi những chiếc xe x&iacute;ch l&ocirc; vẫn l&agrave; phương tiện đi lại được ưa chuộng của người d&acirc;n thời bấy giờ, đang nằm nghỉ ngơi sau một buổi s&aacute;ng đầy vất vả. Bức tranh l&agrave; sự ho&agrave;i niệm của t&aacute;c giả đối với những g&igrave; đ&atilde; qua đi của H&agrave; Nội xưa cũ.</p>

<p><a href="https://bantranh.com/pd/me/"><img alt="10 bức tranh sơn dầu độc bản đẹp và lôi cuốn" src="https://bantranh.com/wp-content/uploads/2021/09/10-buc-tranh-son-dau-doc-ban-dep-va-loi-cuon3-328x400.jpeg" style="height:400px; width:328px" /></a><br />
H&igrave;nh ảnh người mẹ lu&ocirc;n l&agrave; một trong những đề t&agrave;i được sử dụng rất nhiều bởi những người họa sĩ. Tấm lưng g&ugrave; của mẹ ch&iacute;nh l&agrave; thứ đ&atilde; g&aacute;nh v&aacute;c cuộc đời v&agrave; nu&ocirc;i lớn ch&uacute;ng ta, trở th&agrave;nh những con người tốt, c&oacute; &iacute;ch cho cuộc sống sau n&agrave;y.</p>

<p><a href="https://bantranh.com/pd/em-mua-huong/"><img alt="10 bức tranh sơn dầu độc bản đẹp và lôi cuốn" src="https://bantranh.com/wp-content/uploads/2021/09/10-buc-tranh-son-dau-doc-ban-dep-va-loi-cuon4-559x400.jpeg" style="height:400px; width:559px" /></a><br />
Người thiếu nữ nằm tr&ecirc;n thảm cỏ, một h&igrave;nh ảnh đẹp v&agrave; l&atilde;ng mạng đ&atilde; được người họa sĩ thể hiện v&ocirc; c&ugrave;ng ch&acirc;n thực v&agrave; &yacute; nghĩa trong bức tranh &ldquo;Em m&ugrave;a hương&rdquo;.</p>

<p><a href="https://bantranh.com/pd/loi-thu/"><img alt="10 bức tranh sơn dầu độc bản đẹp và lôi cuốn" src="https://bantranh.com/wp-content/uploads/2021/09/10-buc-tranh-son-dau-doc-ban-dep-va-loi-cuon5-265x400.jpeg" style="height:400px; width:265px" /></a><br />
Bức tranh &ldquo;Lối thu&rdquo; hiện l&ecirc;n như một n&eacute;t đẹp của H&agrave; Nội v&agrave;o m&ugrave;a chuyển giao m&ugrave;a Thu. Cả khu phố l&agrave; một sự giản dị v&agrave; b&igrave;nh y&ecirc;n đến lạ, c&oacute; thể quyến rũ &aacute;nh mắt v&agrave; cảm t&igrave;nh của bất kỳ người xem bức tranh n&agrave;o.</p>

<p><a href="https://bantranh.com/pd/buoi-sang-mua-dong/"><img alt="10 bức tranh sơn dầu độc bản đẹp và lôi cuốn" src="https://bantranh.com/wp-content/uploads/2021/09/10-buc-tranh-son-dau-doc-ban-dep-va-loi-cuon6-393x400.jpg" style="height:400px; width:393px" /></a><br />
H&igrave;nh ảnh những c&aacute;i c&acirc;y trơ trụi l&aacute; l&agrave; đặc điểm m&agrave; ta c&oacute; thể dễ d&agrave;ng nhận thấy từ m&ugrave;a Đ&ocirc;ng. Bức tranh &ldquo;Buổi s&aacute;ng m&ugrave;a Đ&ocirc;ng&rdquo; l&agrave; một bức họa ch&acirc;n thực của sự thay đổi của vạn vật m&ugrave;a Đ&ocirc;ng, trơ trụi để chuẩn bị cho sức sống sắp tới của m&ugrave;a Xu&acirc;n tới.</p>

<p><a href="https://bantranh.com/pd/det-tho-cam/"><img alt="10 bức tranh sơn dầu độc bản đẹp và lôi cuốn" src="https://bantranh.com/wp-content/uploads/2021/09/10-buc-tranh-son-dau-doc-ban-dep-va-loi-cuon7.jpg" style="height:260px; width:307px" /></a><br />
C&oacute; bao giơ bạn tự hỏi về những hoạt động truyền thống của người d&acirc;n d&acirc;n tộc? Bức tranh &ldquo;Dệt thổ cẩm&rdquo; đảm bảo sẽ cho bạn thấy n&eacute;t ch&acirc;n thực nhất của những con người d&acirc;n tộc Việt Nam.</p>

<p><a href="https://bantranh.com/pd/sac-xuan-8/"><img alt="10 bức tranh sơn dầu độc bản đẹp và lôi cuốn" src="https://bantranh.com/wp-content/uploads/2021/09/10-buc-tranh-son-dau-doc-ban-dep-va-loi-cuon8-303x400.jpg" style="height:400px; width:303px" /></a><br />
Bức tranh &ldquo;Sắc xu&acirc;n&rdquo; t&aacute;i hiện sự thay đổi của kh&ocirc;ng gian Hồ Gươm khi xu&acirc;n về. Thật vậy, vạn vật đều mang trong m&igrave;nh một sức sống mới, tuy nhi&ecirc;n vẫn giữ cho m&igrave;nh n&eacute;t cổ k&iacute;nh linh thi&ecirc;ng vốn c&oacute;.</p>

<p><a href="https://bantranh.com/pd/tinh-vat-hoa-hong/"><img alt="10 bức tranh sơn dầu độc bản đẹp và lôi cuốn" src="https://bantranh.com/wp-content/uploads/2021/09/10-buc-tranh-son-dau-doc-ban-dep-va-loi-cuon9-301x400.jpeg" style="height:400px; width:301px" /></a><br />
Những bức tranh về chủ đề tĩnh vật c&oacute; thể được sử dụng để trang tr&iacute; ở rất nhiều g&oacute;c v&agrave; vị tr&iacute; trong kh&ocirc;ng gian gia đ&igrave;nh bạn, bức tranh tĩnh vật hoa hồng n&agrave;y cũng kh&ocirc;ng ngoại lệ.</p>

<p><a href="https://bantranh.com/pd/tau-qua-pho/"><img alt="10 bức tranh sơn dầu độc bản đẹp và lôi cuốn" src="https://bantranh.com/wp-content/uploads/2021/09/10-buc-tranh-son-dau-doc-ban-dep-va-loi-cuon10-568x400.jpg" style="height:400px; width:568px" /></a><br />
H&igrave;nh ảnh đo&agrave;n t&agrave;u đi qua những khu chợ nằm s&aacute;t đường ray như thế n&agrave;y kh&ocirc;ng phải l&agrave; một điều lạ. Từ l&acirc;u, n&oacute; đ&atilde; trở th&agrave;nh một n&eacute;t đẹp ri&ecirc;ng của đất nước ta, l&agrave; sự ho&agrave;i niệm đối với những g&igrave; đ&atilde; qua v&agrave; kh&ocirc;ng bao giờ trở lại.</p>
', N'Vũ Văn Hùng', CAST(N'2022-01-05 22:32:32.650' AS DateTime))
INSERT [dbo].[Blog] ([id], [name], [content], [author], [dateCreate]) VALUES (6, N'6 bức tranh phong cảnh đẹp thiên nhiên Việt Nam', N'<p>X&atilde; hội ph&aacute;t triển, dẫn dến nhu cầu của con người ng&agrave;y c&agrave;ng tăng. C&oacute; một sự thật l&agrave;, rất nhiều người d&acirc;n Việt Nam lựa chọn d&ugrave;ng những bức tranh để l&agrave;m vật trang tr&iacute; cho căn nh&agrave; của m&igrave;nh. Trong số đ&oacute;, thể loại&nbsp;<a href="https://bantranh.com/pc/tranh-son-dau/">tranh sơn dầu phong cảnh</a>&nbsp;được y&ecirc;u th&iacute;ch hơn cả.&nbsp;<a href="https://bantranh.com/pc/tranh-phong-canh/">Tranh phong cảnh</a>&nbsp;l&agrave; một chủ đề được ưa chuộng đ&ocirc;i với c&aacute;c họa sĩ v&agrave; cả những người đam m&ecirc; nghệ thuật. N&oacute; l&agrave; đề t&agrave;i c&oacute; thể dễ d&agrave;ng tiếp cận với mọi người v&agrave; được d&ugrave;ng trong nhiều mục đ&iacute;ch kh&aacute;c nhau, từ trang tr&iacute; kh&ocirc;ng gian gia đ&igrave;nh cho đến những nơi trang trọng v&agrave; lịch sự. H&ocirc;m nay, ch&uacute;ng t&ocirc;i xin giới thiệu với c&aacute;c bạn 6 bức tranh về đề t&agrave;i phong cảnh thi&ecirc;n nhi&ecirc;n Việt Nam đặc sắc.</p>

<p><a href="https://bantranh.com/pd/chieu-tren-tam-dao/"><img alt="6 bức tranh phong cảnh thiên nhiên việt nam" src="https://bantranh.com/wp-content/uploads/2021/07/6-buc-tranh-phong-canh-dep-thien-nhien-viet-nam8.jpg" style="height:395px; width:547px" /></a><br />
&ldquo;Chiều tr&ecirc;n Tam Đảo&rdquo; c&oacute; thể n&oacute;i đ&atilde; khắc họa r&otilde; n&eacute;t những g&igrave; đẹp nhất của Tam Đảo. Tưởng tượng bạn sống trong ng&ocirc;i nh&agrave; đ&oacute;, mỗi ng&agrave;y ngắm nh&iacute;n sự thay đổi của kh&ocirc;ng gian Tam Đảo, hẳn sẽ l&agrave; một trải nghiệm v&ocirc; c&ugrave;ng th&uacute; vị phải kh&ocirc;ng?</p>

<p><a href="https://bantranh.com/pd/tranh-phong-canh-lang-que-viet-nam-dep-va-tho-mong/"><img alt="6 bức tranh phong cảnh thiên nhiên việt nam" src="https://bantranh.com/wp-content/uploads/2021/07/6-buc-tranh-phong-canh-dep-thien-nhien-viet-nam1.jpg" style="height:307px; width:600px" /></a><br />
Bức tranh về đề t&agrave;i l&agrave;ng qu&ecirc; Việt Nam n&agrave;y chắc chắn sẽ ph&ugrave; hợp với kh&ocirc;ng gian trang tr&iacute; nội thất của bạn bởi n&eacute;t đẹp b&igrave;nh dị v&agrave; th&acirc;n thuộc của l&agrave;ng qu&ecirc; Việt Nam ta.</p>

<p><a href="https://bantranh.com/pd/tranh-phong-canh-moc-chau/"><img alt="6 bức tranh phong cảnh thiên nhiên việt nam" src="https://bantranh.com/wp-content/uploads/2021/07/6-buc-tranh-phong-canh-dep-thien-nhien-viet-nam2-408x400.jpg" style="height:400px; width:408px" /></a><br />
Bức tranh về phong cảnh Mộc Ch&acirc;u n&agrave;y đ&atilde; khắc họa một c&aacute;ch v&ocirc; c&ugrave;ng chi tiết về Mộc Ch&acirc;u &ndash; v&ugrave;ng đất của những cao nguy&ecirc;n v&agrave; đồng cỏ bạt ng&agrave;n.</p>

<p><a href="https://bantranh.com/pd/som-2/"><img alt="6 bức tranh phong cảnh thiên nhiên việt nam" src="https://bantranh.com/wp-content/uploads/2021/07/6-buc-tranh-phong-canh-dep-thien-nhien-viet-nam3-288x400.jpeg" style="height:400px; width:288px" /></a><br />
C&ograve;n g&igrave; tuyệt hơn việc được ngắm nh&igrave;n b&igrave;nh m&igrave;nh sớm nơi l&agrave;ng qu&ecirc;, nhịp sống chậm r&atilde;i v&agrave; y&ecirc;n b&igrave;nh bao tr&ugrave;m kh&ocirc;ng gian?</p>

<p><a href="https://bantranh.com/pd/pho-dem-2/"><img alt="6 buc tranh phong canh dep thien nhien viet nam4" src="https://bantranh.com/wp-content/uploads/2021/07/6-buc-tranh-phong-canh-dep-thien-nhien-viet-nam4-526x400.jpg" style="height:400px; width:526px" /></a><br />
Phong c&aacute;ch trừu tượng lu&ocirc;n dem lại cho người đam m&ecirc; hội họa một cảm gi&aacute;c b&iacute; ẩn kh&oacute; diễn tả bằng lời. Bằng việc kết hợp m&agrave;u sắc h&agrave;i h&ograve;a c&ugrave;ng bộ &oacute;c s&aacute;ng tạo độc đ&aacute;o, bức tranh &ldquo;Phố đ&ecirc;m&rdquo; đem đến cho ta một cảm x&uacute;c kh&oacute; tả về sự thay đổi, cảnh quan v&agrave;o buổi đ&ecirc;m nơi g&oacute;c phố vắng người.</p>

<p><a href="https://bantranh.com/pd/vuon-xuan-2/"><img alt="6 bức tranh phong cảnh thiên nhiên việt nam" src="https://bantranh.com/wp-content/uploads/2021/07/6-buc-tranh-phong-canh-dep-thien-nhien-viet-nam6-584x400.jpeg" style="height:400px; width:584px" /></a><br />
Mang trong m&igrave;nh một sự sống m&atilde;nh liệt v&agrave; tươi mới, bức tranh &ldquo;Vườn xu&acirc;n&rdquo; chắc chắn l&agrave; một sự lựa chọn kh&ocirc;ng tồi cho những người đam m&ecirc; sự trẻ trung v&agrave; sức sống mới cho kh&ocirc;ng gian nội thất của m&igrave;nh.</p>
', N'Nguyễn Mạnh Hùng', CAST(N'2022-01-05 22:33:30.650' AS DateTime))
INSERT [dbo].[Blog] ([id], [name], [content], [author], [dateCreate]) VALUES (7, N'Khung tranh cho tranh thêu đẹp và đẳng cấp', N'<p><strong>Tranh th&ecirc;u</strong>&nbsp;l&agrave; một trong những thể loại tranh truyền thống của Việt Nam. L&agrave; một loại h&igrave;nh nghệ thuật đ&atilde; ph&aacute;t triển ở nước ta từ thời phong kiến cũ, b&ecirc;n cạnh những d&ograve;ng tranh nghệ thuật đ&atilde; phổ biến như&nbsp;<a href="https://bantranh.com/pc/tranh-son-dau/">tranh sơn dầu</a>,&nbsp;<a href="https://bantranh.com/pc/tranh-son-mai/">tranh sơn m&agrave;i</a>&nbsp;th&igrave; tranh th&ecirc;u được biết đến như một sản phẩm thủ c&ocirc;ng mỹ nghệ đặc trưng của nghệ thuật hội họa v&agrave; th&ecirc;u th&ugrave;a Việt Nam.</p>

<p>Kh&aacute;c với những thể loại tranh c&ocirc;ng nghiệp hiện nay, những bức tranh th&ecirc;u được tạo ra từ ch&iacute;nh đ&ocirc;i tay con người, từ những b&agrave;n tay của c&aacute;c nghệ nh&acirc;n h&agrave;ng đầu. Đối với mỗi một họa sĩ theo đuổi nghệ thuật tranh th&ecirc;u, đ&oacute; l&agrave; cả một qu&aacute; tr&igrave;nh đầy kh&oacute; khăn v&agrave; trắc trở. V&igrave; lẽ đ&oacute;, từng đường kim tạo n&ecirc;n n&eacute;t vẽ tr&ecirc;n những bức tranh th&ecirc;u đều mang một gi&aacute; trị nghệ thuật v&ocirc; c&ugrave;ng lớn v&agrave; s&acirc;u sắc. Hiển nhi&ecirc;n rằng, với những gi&aacute; trị lớn lao như vậy, những bức tranh th&ecirc;u thường mang một mức gi&aacute; kh&ocirc;ng hề nhỏ, khẳng định vị thế chắc chắn của m&igrave;nh kh&ocirc;ng chỉ tr&ecirc;n thị trường nội địa m&agrave; l&agrave; cả thị trường quốc tế.</p>

<p>Với những gi&aacute; trị nghệ thuật cao như vậy, việc lựa chọn cho ch&uacute;ng một bộ&nbsp;<a href="https://bantranh.com/pc/khung-tranh/">khung tranh</a>&nbsp;c&ugrave;ng đẳng cấp l&agrave; một điều kh&ocirc;ng hề dễ d&agrave;ng. Tại bantranh.com, ch&uacute;ng t&ocirc;i cung cấp cho bạn rất nhiều kiểu mẫu khung tranh kh&aacute;c nhau với đủ thể loại v&agrave; chất lượng cho bạn lựa chọn. Với chất lượng v&agrave; sự uy t&iacute;n đ&atilde; được khẳng định qua năm th&aacute;ng, bantranh.com tự tin sẽ đem đến cho bạn những bộ khung tranh đẳng cấp h&agrave;ng đầu m&agrave; &iacute;t nơi n&agrave;o c&oacute;.</p>

<p>Dưới đ&acirc;y l&agrave; những mẫu khung tranh đẹp v&agrave; gi&aacute; tốt do ch&uacute;ng t&ocirc;i tổng hợp:</p>

<p>&nbsp;</p>

<p><a href="https://bantranh.com/pd/khung-tranh-nhua-ps-dep-chat-luong-cao-gia-re/"><img alt="Khung tranh cho tranh thêu đẹp và đẳng cấp" src="https://bantranh.com/wp-content/uploads/2019/06/khung-tranh-go-ps-dep-chat-luong-cao-600x450.jpg" style="height:450px; width:600px" /></a></p>

<p>Khung Tranh Nhựa PS Đẹp, Chất Lượng Cao, Gi&aacute; Rẻ</p>

<p>&nbsp;</p>

<p><a href="https://bantranh.com/pd/khung-tranh-go-nhu-vang-sieu-dep-va-sang-trong/"><img alt="Khung tranh cho tranh thêu đẹp và đẳng cấp" src="https://bantranh.com/wp-content/uploads/2019/06/khung-tranh-go-nhu-vang-sieu-dep-sang-trong-600x400.jpg" style="height:400px; width:600px" /></a></p>

<p>Khung Tranh M&agrave;u Nhũ V&agrave;ng Si&ecirc;u Đẹp v&agrave; Sang Trọng</p>
', N'VĂN THUẬN', CAST(N'2022-01-05 22:34:39.653' AS DateTime))
INSERT [dbo].[Blog] ([id], [name], [content], [author], [dateCreate]) VALUES (8, N'5 bức tranh phong cảnh đơn giản mà đẹp', N'<p>Tranh phong cảnh tuy l&agrave; một đề t&agrave;i nghệ thuật được y&ecirc;u th&iacute;ch của đại đa số người d&acirc;n ng&agrave;y nay nhưng trong qu&aacute; khứ n&oacute; đ&atilde; c&oacute; một qu&aacute; tr&igrave;nh ph&aacute;t triển đầy kh&oacute; khăn để khẳng định gi&aacute; trị của m&igrave;nh. V&agrave;o thời điểm khi những loại h&igrave;nh nghệ thuật si&ecirc;u thực được ưa chuộng, quả thật để c&oacute; cho m&igrave;nh một chỗ đứng trong nghệ thuật hội họa quả l&agrave; một điều kh&ocirc;ng hề đơn giản. Tuy vậy, dưới b&agrave;n tay v&agrave; t&acirc;m hồn của những họa sĩ thi&ecirc;n t&agrave;i,&nbsp;<a href="https://bantranh.com/pc/tranh-son-dau/">tranh sơn dầu</a>&nbsp;phong cảnh dần khẳng định được vị tr&iacute; vững tr&atilde;i của m&igrave;nh trong l&ograve;ng của giới y&ecirc;u tranh v&agrave; dần dần trở th&agrave;nh một trong những thể loại tranh được y&ecirc;u th&iacute;ch v&agrave; lựa chọn nhất. H&ocirc;m nay, ch&uacute;ng t&ocirc;i xin giới thiệu với bạn 5 bức&nbsp;<a href="https://bantranh.com/pc/tranh-phong-canh/">tranh phong cảnh</a>&nbsp;tuy đơn giản nhưng lại v&ocirc; c&ugrave;ng đẹp v&agrave; độc đ&aacute;o cho bạn lựa chọn.</p>

<p><a href="https://bantranh.com/pd/mua-xuan-binh-yen/"><img alt="5 bức tranh phong cảnh đơn giản mà đẹp" src="https://bantranh.com/wp-content/uploads/2021/07/5-buc-tranh-phong-canh-don-gian-ma-dep1-486x400.jpg" style="height:400px; width:486px" /></a><br />
Những ngọn đồi cao lớn, con s&ocirc;ng chảy ngang qua c&ugrave;ng những t&aacute;n c&acirc;y tr&agrave;n đầy sức sống, tất cả được kết hợp lại, tạo n&ecirc;n một khung cảnh đầy sức sống v&agrave; b&igrave;nh y&ecirc;n cho bức tranh &ldquo;M&ugrave;a xu&acirc;n b&igrave;nh y&ecirc;n&rdquo; n&agrave;y.</p>

<p><a href="https://bantranh.com/pd/tam-bac/"><img alt="5 bức tranh phong cảnh đơn giản mà đẹp" src="https://bantranh.com/wp-content/uploads/2021/07/5-buc-tranh-phong-canh-don-gian-ma-dep2-533x400.jpg" style="height:400px; width:533px" /></a><br />
Bức tranh &ldquo;Tam Bạc&rdquo; được s&aacute;ng t&aacute;c bởi t&igrave;nh y&ecirc;u của t&aacute;c giả d&agrave;nh cho th&agrave;nh phố n&agrave;y. Tam Bạc, Hải Ph&ograve;ng l&agrave; một th&agrave;nh phố l&acirc;u đời, được x&acirc;y dựng b&ecirc;n cạnh con s&ocirc;ng c&ugrave;ng t&ecirc;n, l&agrave; địa điểm du lịch nổi tiếng bởi những n&eacute;t cổ điển của kiến tr&uacute;c c&ugrave;ng vẻ đẹp duyen d&aacute;ng của con s&ocirc;ng, chắc chắn sẽ l&agrave;m h&agrave;i l&ograve;ng bất kỳ du kh&aacute;ch n&agrave;o gh&eacute; thăm.</p>

<p><a href="https://bantranh.com/pd/vinh-lan-ha-cat-ba/"><img alt="5 bức tranh phong cảnh đơn giản mà đẹp" src="https://bantranh.com/wp-content/uploads/2021/07/5-buc-tranh-phong-canh-don-gian-ma-dep3.jpg" style="height:379px; width:600px" /></a><br />
Vịnh Lan Hạ, C&aacute;t B&agrave; l&agrave; một địa điểm, một danh lam thắng cảnh nổi tiếng của Việt Nam. Đối với những ai chưa biết hoặc chưa từng nghe n&oacute;i đến nơi n&agrave;y, bức tranh &ldquo;Vịnh Lan Hạ C&aacute;t B&agrave;&rdquo; l&agrave; một bức tranh đặc sắc, khắc họa v&ocirc; c&ugrave;ng r&otilde; n&eacute;t vẻ đẹp n&ecirc;n thơ v&agrave; y&ecirc;n b&igrave;nh của nơi đ&acirc;y.</p>

<p><a href="https://bantranh.com/pd/hoang-hon-tren-song-2/"><img alt="5 bức tranh phong cảnh đơn giản mà đẹp" src="https://bantranh.com/wp-content/uploads/2021/07/5-buc-tranh-phong-canh-don-gian-ma-dep4-491x400.jpg" style="height:400px; width:491px" /></a><br />
&ldquo;Ho&agrave;ng h&ocirc;n tr&ecirc;n s&ocirc;ng&rdquo; mi&ecirc;u tả vẻ đẹp của con s&ocirc;ng nơi ho&agrave;ng h&ocirc;n đang bu&ocirc;ng xuống, Con s&ocirc;ng như một tấm gương trong, phản chiếu r&otilde; n&eacute;t h&igrave;nh ảnh mặt trời đỏ đang dần khuất n&uacute;i c&ugrave;ng những cảnh chim vội v&atilde; đang t&igrave;m đường về tổ sau một ng&agrave;y kiếm ăn mệt mỏi.</p>

<p><a href="https://bantranh.com/pd/khi-thanh-pho-len-den/"><img alt="5 bức tranh phong cảnh đơn giản mà đẹp" src="https://bantranh.com/wp-content/uploads/2021/07/5-buc-tranh-phong-canh-don-gian-ma-dep5-578x400.jpg" style="height:400px; width:578px" /></a><br />
M&agrave;n đ&ecirc;m bu&ocirc;ng xuống l&agrave; khi cả th&agrave;nh phố l&ecirc;n đ&egrave;n. Nhưng thay v&igrave; l&agrave; m&agrave;u đen bao phủ cả bầu trời, bức tranh đ&atilde; tạo n&ecirc;n một khung cảnh kỳ ảo nơi bầu trời mang những m&agrave;u sắc diệu kỳ như cả dải thi&ecirc;n h&agrave; đang hiện hữu vậy.</p>
', N'Nguyễn Thế Trưởng', CAST(N'2022-01-05 22:35:36.743' AS DateTime))
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1007, N'Laptop Dell Gaming', N'Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa. Chi tiết máy được thiết kế và hoàn thiện với chất lượng vượt trội, thêm vào đó những chiếc Laptop gaming luôn được áp dụng các công nghệ mới nhất, mạnh nhất về phần cứng. Laptop gaming thường được thiết kế với kiểu dáng hiện đại, góc cạnh, hầm hố cùng màu sắc bắt mắt như đỏ đen, xanh đen, đen xám,... Kích thước thân máy thường lớn, dày để bố trí hệ thống tản nhiệt.', 0)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1008, N'Laptop MSI Gaming', N'Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa. Chi tiết máy được thiết kế và hoàn thiện với chất lượng vượt trội, thêm vào đó những chiếc Laptop gaming luôn được áp dụng các công nghệ mới nhất, mạnh nhất về phần cứng. Laptop gaming thường được thiết kế với kiểu dáng hiện đại, góc cạnh, hầm hố cùng màu sắc bắt mắt như đỏ đen, xanh đen, đen xám,... Kích thước thân máy thường lớn, dày để bố trí hệ thống tản nhiệt.', 0)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1009, N'Laptop HP Gaming', N'Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa.

Chi tiết máy được thiết kế và hoàn thiện với chất lượng vượt trội, thêm vào đó những chiếc Laptop gaming luôn được áp dụng các công nghệ mới nhất, mạnh nhất về phần cứng.
Laptop gaming thường được thiết kế với kiểu dáng hiện đại, góc cạnh, hầm hố cùng màu sắc bắt mắt như đỏ đen, xanh đen, đen xám,... Kích thước thân máy thường lớn, dày để bố trí hệ thống tản nhiệt.', 0)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1010, N'Laptop Evoo Gaming', N'Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa. Chi tiết máy được thiết kế và hoàn thiện với chất lượng vượt trội, thêm vào đó những chiếc Laptop gaming luôn được áp dụng các công nghệ mới nhất, mạnh nhất về phần cứng. Laptop gaming thường được thiết kế với kiểu dáng hiện đại, góc cạnh, hầm hố cùng màu sắc bắt mắt như đỏ đen, xanh đen, đen xám,... Kích thước thân máy thường lớn, dày để bố trí hệ thống tản nhiệt.', 0)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1011, N'Laptop Asus Gaming', N'Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa. Chi tiết máy được thiết kế và hoàn thiện với chất lượng vượt trội, thêm vào đó những chiếc Laptop gaming luôn được áp dụng các công nghệ mới nhất, mạnh nhất về phần cứng. Laptop gaming thường được thiết kế với kiểu dáng hiện đại, góc cạnh, hầm hố cùng màu sắc bắt mắt như đỏ đen, xanh đen, đen xám,... Kích thước thân máy thường lớn, dày để bố trí hệ thống tản nhiệt.', 0)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1012, N'Laptop Acer Gaming', N'Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa. Chi tiết máy được thiết kế và hoàn thiện với chất lượng vượt trội, thêm vào đó những chiếc Laptop gaming luôn được áp dụng các công nghệ mới nhất, mạnh nhất về phần cứng. Laptop gaming thường được thiết kế với kiểu dáng hiện đại, góc cạnh, hầm hố cùng màu sắc bắt mắt như đỏ đen, xanh đen, đen xám,... Kích thước thân máy thường lớn, dày để bố trí hệ thống tản nhiệt.', 0)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1013, N'Laptop Lenovo Gaming', N'Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa. Chi tiết máy được thiết kế và hoàn thiện với chất lượng vượt trội, thêm vào đó những chiếc Laptop gaming luôn được áp dụng các công nghệ mới nhất, mạnh nhất về phần cứng. Laptop gaming thường được thiết kế với kiểu dáng hiện đại, góc cạnh, hầm hố cùng màu sắc bắt mắt như đỏ đen, xanh đen, đen xám,... Kích thước thân máy thường lớn, dày để bố trí hệ thống tản nhiệt.', 0)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1014, N'Laptop Đồ Họa Dell', N'Laptop đồ hoạ là dòng máy tính xách tay cá nhân dành cho người làm việc trong ngành thiết kế, thường xuyên phải dùng các phần phềm thiết kế đồ hoạ như GIMP, CorelDraw, Adobe Photoshop, Adobe Illustrator,.... Bởi các phần mềm này có dung lượng lớn nên ngốn rất nhiều RAM máy tính nên các dòng laptop đồ hoạ thường được trang bị RAM lớn hoặc bạn có thể mua thêm RAM tuỳ theo nhu cầu sử dụng.

Bạn cần cân nhắc tới một CPU đủ mạnh, hơn nữa là Intel H-series hay K-series, màn hình được thiết kế thông minh với 100% hiển thị chính xác màu sRGB và dung lượng SSD cũng cần phải quan tâm.', 1)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1015, N'Laptop Đồ Họa HP', N'Laptop đồ hoạ là dòng máy tính xách tay cá nhân dành cho người làm việc trong ngành thiết kế, thường xuyên phải dùng các phần phềm thiết kế đồ hoạ như GIMP, CorelDraw, Adobe Photoshop, Adobe Illustrator,.... Bởi các phần mềm này có dung lượng lớn nên ngốn rất nhiều RAM máy tính nên các dòng laptop đồ hoạ thường được trang bị RAM lớn hoặc bạn có thể mua thêm RAM tuỳ theo nhu cầu sử dụng.

Bạn cần cân nhắc tới một CPU đủ mạnh, hơn nữa là Intel H-series hay K-series, màn hình được thiết kế thông minh với 100% hiển thị chính xác màu sRGB và dung lượng SSD cũng cần phải quan tâm.', 1)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1016, N'Laptop Đồ Họa Lenovo', N'Laptop đồ hoạ là dòng máy tính xách tay cá nhân dành cho người làm việc trong ngành thiết kế, thường xuyên phải dùng các phần phềm thiết kế đồ hoạ như GIMP, CorelDraw, Adobe Photoshop, Adobe Illustrator,.... Bởi các phần mềm này có dung lượng lớn nên ngốn rất nhiều RAM máy tính nên các dòng laptop đồ hoạ thường được trang bị RAM lớn hoặc bạn có thể mua thêm RAM tuỳ theo nhu cầu sử dụng.

Bạn cần cân nhắc tới một CPU đủ mạnh, hơn nữa là Intel H-series hay K-series, màn hình được thiết kế thông minh với 100% hiển thị chính xác màu sRGB và dung lượng SSD cũng cần phải quan tâm.', 1)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1017, N'Laptop Đồ Họa Acer', N'Laptop đồ hoạ là dòng máy tính xách tay cá nhân dành cho người làm việc trong ngành thiết kế, thường xuyên phải dùng các phần phềm thiết kế đồ hoạ như GIMP, CorelDraw, Adobe Photoshop, Adobe Illustrator,.... Bởi các phần mềm này có dung lượng lớn nên ngốn rất nhiều RAM máy tính nên các dòng laptop đồ hoạ thường được trang bị RAM lớn hoặc bạn có thể mua thêm RAM tuỳ theo nhu cầu sử dụng.

Bạn cần cân nhắc tới một CPU đủ mạnh, hơn nữa là Intel H-series hay K-series, màn hình được thiết kế thông minh với 100% hiển thị chính xác màu sRGB và dung lượng SSD cũng cần phải quan tâm.', 1)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1018, N'Laptop HP', N'Một chiếc laptop mỏng nhẹ sẽ có thể chạy một mẫu CPU bất kì của Intel như Core i3 – Core i5 – Core i7 hoặc Ryzen 3 – Ryzen 5 – Ryzen 7 của AMD. Nếu là CPU của Intel, bạn hãy nhìn vào hậu tố đi kèm với tên chip thì sẽ biết được nó mạnh hay yếu.

CPU Intel thế hệ 10 và thế hệ 11 cũng đã đổi cách đặt tên với những mẫu chip như 1135G7 hoặc tương tự.

Màn hình và các đường viền bezel của laptop mỏng nhẹ

Các đường viền mỏng không chỉ là một yếu tố thể hiện và định hình được phong cách nổi bật của dòng laptop mỏng nhẹ, chúng còn tạo nên sự khác biệt có thể thấy rõ từ 10% đến 20% cho cả kích cỡ và khối lượng của chiếc laptop đó. Độ mỏng lí tưởng của laptop mỏng nhẹ thường ít hơn 7mm và thậm chí có mẫu còn dưới 6mm nữa.

Thời lượng pin của laptop mỏng nhẹ

Có hai yếu tố quyết định đến thời lượng pin ít hay nhiều trên các mẫu laptop mỏng nhẹ: công suất của pin (thường được kí hiệu là Wh) và công suất nhiệt (kí hiệu là TDP) của CPU. Số Wh càng cao và số TDP càng thấp thì pin càng hoạt động lâu và ngược lại.', 2)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1019, N'Laptop Lenovo', N'Một chiếc laptop mỏng nhẹ sẽ có thể chạy một mẫu CPU bất kì của Intel như Core i3 – Core i5 – Core i7 hoặc Ryzen 3 – Ryzen 5 – Ryzen 7 của AMD. Nếu là CPU của Intel, bạn hãy nhìn vào hậu tố đi kèm với tên chip thì sẽ biết được nó mạnh hay yếu.

CPU Intel thế hệ 10 và thế hệ 11 cũng đã đổi cách đặt tên với những mẫu chip như 1135G7 hoặc tương tự.

Màn hình và các đường viền bezel của laptop mỏng nhẹ

Các đường viền mỏng không chỉ là một yếu tố thể hiện và định hình được phong cách nổi bật của dòng laptop mỏng nhẹ, chúng còn tạo nên sự khác biệt có thể thấy rõ từ 10% đến 20% cho cả kích cỡ và khối lượng của chiếc laptop đó. Độ mỏng lí tưởng của laptop mỏng nhẹ thường ít hơn 7mm và thậm chí có mẫu còn dưới 6mm nữa.

Thời lượng pin của laptop mỏng nhẹ

Có hai yếu tố quyết định đến thời lượng pin ít hay nhiều trên các mẫu laptop mỏng nhẹ: công suất của pin (thường được kí hiệu là Wh) và công suất nhiệt (kí hiệu là TDP) của CPU. Số Wh càng cao và số TDP càng thấp thì pin càng hoạt động lâu và ngược lại.', 2)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1020, N'Laptop Msi', N'Một chiếc laptop mỏng nhẹ sẽ có thể chạy một mẫu CPU bất kì của Intel như Core i3 – Core i5 – Core i7 hoặc Ryzen 3 – Ryzen 5 – Ryzen 7 của AMD. Nếu là CPU của Intel, bạn hãy nhìn vào hậu tố đi kèm với tên chip thì sẽ biết được nó mạnh hay yếu.

CPU Intel thế hệ 10 và thế hệ 11 cũng đã đổi cách đặt tên với những mẫu chip như 1135G7 hoặc tương tự.

Màn hình và các đường viền bezel của laptop mỏng nhẹ

Các đường viền mỏng không chỉ là một yếu tố thể hiện và định hình được phong cách nổi bật của dòng laptop mỏng nhẹ, chúng còn tạo nên sự khác biệt có thể thấy rõ từ 10% đến 20% cho cả kích cỡ và khối lượng của chiếc laptop đó. Độ mỏng lí tưởng của laptop mỏng nhẹ thường ít hơn 7mm và thậm chí có mẫu còn dưới 6mm nữa.

Thời lượng pin của laptop mỏng nhẹ

Có hai yếu tố quyết định đến thời lượng pin ít hay nhiều trên các mẫu laptop mỏng nhẹ: công suất của pin (thường được kí hiệu là Wh) và công suất nhiệt (kí hiệu là TDP) của CPU. Số Wh càng cao và số TDP càng thấp thì pin càng hoạt động lâu và ngược lại.', 2)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1021, N'Laptop Dell', N'Một chiếc laptop mỏng nhẹ sẽ có thể chạy một mẫu CPU bất kì của Intel như Core i3 – Core i5 – Core i7 hoặc Ryzen 3 – Ryzen 5 – Ryzen 7 của AMD. Nếu là CPU của Intel, bạn hãy nhìn vào hậu tố đi kèm với tên chip thì sẽ biết được nó mạnh hay yếu.

CPU Intel thế hệ 10 và thế hệ 11 cũng đã đổi cách đặt tên với những mẫu chip như 1135G7 hoặc tương tự.

Màn hình và các đường viền bezel của laptop mỏng nhẹ

Các đường viền mỏng không chỉ là một yếu tố thể hiện và định hình được phong cách nổi bật của dòng laptop mỏng nhẹ, chúng còn tạo nên sự khác biệt có thể thấy rõ từ 10% đến 20% cho cả kích cỡ và khối lượng của chiếc laptop đó. Độ mỏng lí tưởng của laptop mỏng nhẹ thường ít hơn 7mm và thậm chí có mẫu còn dưới 6mm nữa.

Thời lượng pin của laptop mỏng nhẹ

Có hai yếu tố quyết định đến thời lượng pin ít hay nhiều trên các mẫu laptop mỏng nhẹ: công suất của pin (thường được kí hiệu là Wh) và công suất nhiệt (kí hiệu là TDP) của CPU. Số Wh càng cao và số TDP càng thấp thì pin càng hoạt động lâu và ngược lại.', 2)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1022, N'Laptop Asus', N'Một chiếc laptop mỏng nhẹ sẽ có thể chạy một mẫu CPU bất kì của Intel như Core i3 – Core i5 – Core i7 hoặc Ryzen 3 – Ryzen 5 – Ryzen 7 của AMD. Nếu là CPU của Intel, bạn hãy nhìn vào hậu tố đi kèm với tên chip thì sẽ biết được nó mạnh hay yếu.

CPU Intel thế hệ 10 và thế hệ 11 cũng đã đổi cách đặt tên với những mẫu chip như 1135G7 hoặc tương tự.

Màn hình và các đường viền bezel của laptop mỏng nhẹ

Các đường viền mỏng không chỉ là một yếu tố thể hiện và định hình được phong cách nổi bật của dòng laptop mỏng nhẹ, chúng còn tạo nên sự khác biệt có thể thấy rõ từ 10% đến 20% cho cả kích cỡ và khối lượng của chiếc laptop đó. Độ mỏng lí tưởng của laptop mỏng nhẹ thường ít hơn 7mm và thậm chí có mẫu còn dưới 6mm nữa.

Thời lượng pin của laptop mỏng nhẹ

Có hai yếu tố quyết định đến thời lượng pin ít hay nhiều trên các mẫu laptop mỏng nhẹ: công suất của pin (thường được kí hiệu là Wh) và công suất nhiệt (kí hiệu là TDP) của CPU. Số Wh càng cao và số TDP càng thấp thì pin càng hoạt động lâu và ngược lại.', 2)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1023, N'Laptop Acer', N'Một chiếc laptop mỏng nhẹ sẽ có thể chạy một mẫu CPU bất kì của Intel như Core i3 – Core i5 – Core i7 hoặc Ryzen 3 – Ryzen 5 – Ryzen 7 của AMD. Nếu là CPU của Intel, bạn hãy nhìn vào hậu tố đi kèm với tên chip thì sẽ biết được nó mạnh hay yếu.

CPU Intel thế hệ 10 và thế hệ 11 cũng đã đổi cách đặt tên với những mẫu chip như 1135G7 hoặc tương tự.

Màn hình và các đường viền bezel của laptop mỏng nhẹ

Các đường viền mỏng không chỉ là một yếu tố thể hiện và định hình được phong cách nổi bật của dòng laptop mỏng nhẹ, chúng còn tạo nên sự khác biệt có thể thấy rõ từ 10% đến 20% cho cả kích cỡ và khối lượng của chiếc laptop đó. Độ mỏng lí tưởng của laptop mỏng nhẹ thường ít hơn 7mm và thậm chí có mẫu còn dưới 6mm nữa.

Thời lượng pin của laptop mỏng nhẹ

Có hai yếu tố quyết định đến thời lượng pin ít hay nhiều trên các mẫu laptop mỏng nhẹ: công suất của pin (thường được kí hiệu là Wh) và công suất nhiệt (kí hiệu là TDP) của CPU. Số Wh càng cao và số TDP càng thấp thì pin càng hoạt động lâu và ngược lại.', 2)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([id], [content]) VALUES (1, N'Công ty cổ phần phát triển website by Hùng')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (1, N'Laptop Dell Inspiron 7577', 1007, CAST(24500000 AS Decimal(18, 0)), 15, CAST(20825000 AS Decimal(18, 0)), N'Laptop Dell Inspiron 7577 (Core i7-7700HQ, 8GB, 1TB + 128GB , VGA 6GB NVIDIA GTX 1060, 15.6 inch FHD IPS)', N'Laptop Inspiron Dell 7577 được thiết kế vượt trội, khác với Dell N7567, N5577 ra trước thì em này đươc thiết kế đẹp hơn đỡ bám vân tay hơn chắc chắn hơn. Đặc biệt, phần tỳ tay đã được trang bị bằng nhôm nên khả năng chống xước và bám bụi tốt hơn.
Vẫn là 2 tông màu truyền thống của các dòng laptop Gaming.Laptop Dell inspiron 7577 được trang bị cấu hình hoàn hảo trong tầm giá của một laptop chơi Game tầm trung.
Laptop Dell inspiron 7577 hiện đang bán tại LaptopAZ.vn hình thức rất đẹp. Chế độ bảo hành và hỗ trợ cực tốt sau bán hàng. Máy bán ra được bảo hành phần cứng 06 tháng, dùng thử test máy trong 15 ngày đầu lỗi đổi máy khác nên khách hàng hoàn toàn yên tâm khi lựa chọn sản phẩm tại AZ.
Màn hình của Dell Inspiron 7577 sẽ là 1 điểm cộng lớn để bạn có thể lựa chọn mua máy. Chúng ta sẽ có 1 màn hình với kích thước là 15.6inch, độ phân giải Full HD 1920x1080, có tấm nền chống trói IPS . Mật độ điểm ảnh đạt 144ppi. 
<img src="https://laptopaz.vn/media/product/1143_laptop_dell_inspiron_7577_laptopaz__6_.JPG" alt="ảnh laptop dell 7577">
Độ sáng trung bình đạt 229cd/m^2. Độ tương phản cực kì tốt khi đạt 1512:1 dù có mức sáng khá thấp. Màn hình đạt 38% Adobe RGB và 60% sRGB, cao hơn hẳn so với Lenovo Legion Y520 hay Acer Aspire VX5-591G
<img src="https://laptopaz.vn/media/product/1143_laptop_dell_inspiron_7577_laptopaz__2_.JPG" alt="ảnh laptop dell 7577">
Cạnh trái máy chúng ta sẽ có 1 khóa Noble, 1 cổng sạc, 1 cổng LAN,  1 cổng USB 3.1 và 1 khe đọc thẻ SD card.
<img src="https://laptopaz.vn/media/product/1143_laptop_dell_inspiron_7577_laptopaz__4_.JPG" alt="ảnh laptop dell 7577">
Bàn phím chichlet Full Size với hành trình phím ngắn nên cho trải nghiệm tốt. Chất lượng phím thì không cần phải nói nhiều. Bởi vì laptop gaming thì sẽ luôn được trang bị những bàn phím ngon nhất cho game thủ, để tiện trong lúc vừa chơi vừa chat với đồng đội. Phím bấm có hành trình tương đối sâu, lực bấm tác động lên phím tương đối nhẹ, bạn chỉ cần nhấn nhẹ nhàng mà thôi là phím đã nhận rồi.
<img src="https://laptopaz.vn/media/product/1143_laptop_dell_inspiron_7577_laptopaz__7_.JPG" alt="ảnh laptop dell 7577">
Touchpad cũng không quá nổi bật. Nó có kích thước khá lớn, độ trỏ chuột chính xác. Khu vực touchpad sẽ được bao trọn bởi các viền đỏ giúp tạo điểm nhấn.

Máy được trang bị tản nhiệt rất đẹp mắt đặt ở trước mặt máy. Với các đường kẻ ngang với tông màu đen sang trọng và lịch sử. Tản nhiệt đặt cùng với bản lề của màn hình tiết kiệm được diện tích cho cả tổng thể máy.
<img src="https://laptopaz.vn/media/product/1143_laptop_dell_inspiron_7577_laptopaz__0_.JPG" alt="ảnh laptop dell 7577">
Rõ ràng, Dell Inspiron 15 7000Series 7577 là sự lụa chọn cực kì tốt với màn hình IPS sắc nét, tuổi thọ pin cao, hệ thống tản nhiệt tốt và giá cả tốt. Đặc biệt, chúng ta sẽ phải kể đến việc được trang bị cổng Thunderbolt 3 cực kì tốt để nâng cấp sau này. Các bạn có thể qua cửa hàng LaptopAZ để có thể trải nghiệm sản phẩm trực tiếp.', N'Intel® Core™ i7-7700HQ', N'8GB DDR4 Bus 2400', N'HDD 1TB ', N'NVIDIA GTX 1060 6GB', N'15.6 inch FHD (1920x1080)', N'HD 720P', N'USB 2.0, USB 3.0, Lan', N'2.5 kg', N'6 Cells', N'Windows 10 bản quyền', 0, N'/images/pictures/Laptop_dell_inspiron_7577.jpg', CAST(N'2022-04-07 16:13:00.773' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (2, N'Laptop Dell Vostro V7570', 1007, CAST(23890000 AS Decimal(18, 0)), 13, CAST(20784300 AS Decimal(18, 0)), N'Laptop Dell Vostro V7570 (Core i7-7700HQ, 8GB, 1TB + 128GB, VGA 4GB NVIDIA GeForce GTX 1050Ti, 15.6 inch FHD IPS)', N'Là dòng laptop Gaming phổ thông chiến game khỏe thời điểm hiện tại. Thiết kế vượt trội, khác với Dell N7566, N7559 ra trước thì em này đươc thiết kế mềm mại hơn, dầy hơn và chắc chắn hơn với không gian tản nhiệt tốt hơn. Đặc biệt, phần tỳ tay đã được trang bị bằng nhôm nên khả năng chống xước và bám bụi tốt hơn. Màu sắc Trắng- Bạc cũng tạo điểm nhấn mới lạ cho máy.
 
Vẫn là 2 tông mầu truyền thống của các dòng laptop Gaming. Dell vostro V7570 được trang bị cấu hình hoàn hảo trong tầm giá. CPU i7-7700HQ, 4 lõi 8 luồng, bộ nhớ Cache 6MB mạnh mẽ, RAM 8GB DDR4 bus 2400Ghz cực mới chạy đa nhiệm cực mượt mà, siêu khủng với VGA 4GB GTX 1050ti DDR5 chiến mượt mà các tựa game đang phổ biến hiện nay, màn hình 15.6 inch Full HD 1920x1080 chống lóa cho hình ảnh sắt nét hơn, Ổ cứng HDD 1TB có sẵn SSD M2 128GB truy xuất dữ liệu nhanh gấp nhiều lần, mà vẫn giữ được khoảng không lưu trữ lớn.
<br />
<b>Thiết kế</b>
<br />
Dell Vostro 7570 có thiết kế khá ấn tượng và bắt mắt. Toàn bộ vỏ máy được làm từ kim loại, cảm giác build tốt và không hề bị ọp ẹp. Máy có hai màu là xanh và bạc, với màu bạc thì chúng ta thấy phần vỏ khá bóng khác với nhiều dòng Gaming  của Dell mang lớp vỏ nhám. Thiết kế của máy làm chúng ta liên tưởng tới những dòng Inspiron cho gaming như 7567 như bản lề lớn nằm chính giữa, hai bên được bố trí 2 quạt tản nhiệt với thiết kế lưới tản nhiệt cách điệu tạo điểm nhấn. Phần bản lề được Dell gia công rất chắc chắn cho cảm giác mở êm và không hề bị lắc màn hình khi tác dụng lực vừa phải vào nắp máy.
<img src="https://laptopaz.vn/media/product/1165_dell_v7570__10_.JPG" alt=" ảnh laptop Dell Vostro 7570">
<br/>
Tuy được hướng tới khả năng chơi game nhưng Vostro 7570 này không thật sự quá hầm hố ở vẻ bề ngoài. Tông màu cũng không phải đỏ đen truyền thống của dòng gaming tầm trung của Dell. Thiết kế này sẽ phù hợp hơn với đại đa số người dùng kể cả những người cần một chiếc laptop có vẻ ngoài mang một chút thanh lịch.
<br/>
Thiết kế đó chính là trọng lượng của máy khá nặng với 2,66Kg dù máy chỉ có kích thước màn hình là 15,6 inch. Điều này sẽ hạn chế khả năng cơ động của máy khi bạn cần một thiết bị có thể mang theo mình đi ra ngoài
<br/>
<img src="https://laptopaz.vn/media/product/1165_dell_v7570__5_.JPG" alt=" ảnh laptop Dell Vostro 7570">
<br/>
<b>Cổng kết nối</b>

Ngoài ra máy được trang bị rất đầy đủ các cổng kết nối. Bên cạnh phải chúng ta có một jack cắm tai nghe combo 3.5mm, hai cổng USB Type-A 3.0, cổng USB Type-C, HDMI và VGA, bên cạnh trái là cổng sạc, cổng ethernet hay còn gọi là cổng LAN, một USB Type-A 3.0 và một khe cắm SD.
<img src="https://laptopaz.vn/media/product/1165_dell_v7570__8_.JPG" alt=" ảnh laptop Dell Vostro 7570">
<br/>
<b>Cấu hình</b>
<br/>
Laptop Dell tích hợp Intel core i7 - 7700HQ,  RAM 8GB, ổ đĩa cứng SSD 128GB + HDD 1TB cho hiệu năng hoạt động mạnh mẽ, vượt trội rất nhiều đồng thời tiết kiệm năng lượng pin khi sử dụng.
<br/>
Tích hợp Card đồ họa rời nVIDIA 4GB  xử lý tốt, mượt mà các phần mềm, ứng dụng đồ họa, hình ảnh, thiết kế, cắt video... đáp ứng nhu cầu chiến game mạnh cực đỉnh. Với GeForce GTX 1050Ti cho cấu hình khủng chơi game max mượt
<br/>
<img src="https://laptopaz.vn/media/product/1165_dell_v7570__6_.JPG" alt=" ảnh laptop Dell Vostro 7570">
<br/>
<b>Màn hình</b>
Dell Vostro 7570 được trang bị màn hình 15,6 inch độ phân giải Full HD tấm nền IPS. Thông số cấu hình cũng không có gì nổi bật trong tầm giá cả vì tần số quét cũng chỉ dừng lại ở 60Hz. Thêm nữa được trang bị tấm nền IPS cho  góc nhìn của máy cũng không thật sự rộng. Khi nghiêng đi độ sai lệch màu sắc lại khá nhiều.
<br/>
Một điểm trừ nữa là phần viền rất dày, đối với một mẫu máy chơi game thì có lẽ chúng ta cũng không đòi hỏi quá nhiều ở phần viền phải mỏng những mẫu ultrabook. Tuy vậy thì Dell hoàn toàn có thể làm viền chiếc máy này mỏng hơn nữa để trông chiếc mày này đỡ thô hơn khi mà 2 phần cạnh bên của màn hình còn dày đúng bằng phần đặt cụm camera phía trên.
<br/>
<br>Bàn phím và touchpad</br>

Bàn phím của máy có cảm giác bấm tốt và layout hợp lý và trang bị thêm cả phần phím số ở bên phải. Tuy hành trình phím là hơi nông với một mẫu máy chơi game nhưng độ nảy lại rất tốt, cảm giác gõ văn bản hay chơi game đều rất ổn.
<br/>
Touchpad thì không có quá nhiều điều nổi bật, độ lớn vừa phải và cũng không được phủ một lớp kính cao cấp nào như dòng Ultrabook. Cảm giác di chuyển ổn và hai nút bấm không bị ọp ẹp là mẫu máy chơi game thì thường chúng ta sẽ sử dụng chuột ngoài nên hãng cũng không chăm chút phần này lắm.
<br />
<br>Tổng kết</br>
Dell Vostro 7570 là một mẫu máy gaming thật sự không ấn tượng trong tầm giá đối với mình. Điểm mạnh có lẽ là phần thiết kế bên ngoài khá ấn tượng thêm nữa máy có nhiều cổng kết nối khác nhau và bàn phím cho cảm giác gõ tốt.

', N'Intel Core i7- 7700HQ (2.8GHz up to 3.8GHz Cache 6M 4 lõi 8 luồng)', N' 8GB DDR4 2400MHz', N' 1TB HDD + SSD 128 M2', N' NVIDIA GeForce GTX 1050ti 4GB', N'15.6 inch Full HD IPS', N'1.3 Megapixels', N'HDMI, USB 3.0, USB 2.0, LAN,  Bluetooth 4.0.', N'2.65 kg', N'6 cells (sử dụng liên tục được 2-3 giờ)', N'Windows 10', 0, N'/images/pictures/Laptop_Dell_Vostro_V7570.JPG', CAST(N'2022-04-07 16:36:42.593' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (3, N'Laptop Dell G3 3579', 1007, CAST(20890000 AS Decimal(18, 0)), 10, CAST(18801000 AS Decimal(18, 0)), N'[Mới 99%] Laptop Dell G3 3579 (Core i7-8750H, 8GB, 1TB + 128GB , VGA 4GB GTX 1050Ti, 15.6'' FHD IPS)', N' Laptop Dell G3 3579 là dòng sản phẩm được Dell sản xuất ra hướng đến đối tượng người dùng cần một chiếc máy vừa có thể chơi Game, vừa có thể làm việc đồng thời mức giá lại thấp hơn kha khá nếu đem so với các dòng máy Dell Alienware.
<br/>
Để đáp ứng được nhu cầu người dùng, Dell đã ra mắt các phiên bản Laptop dell G3 3579 khác nhau, do đó các bạn có thể thoải mái lựa chọn các phiên bản mình yêu thích sao cho phù hợp với hầu bao cũng như nhu cầu của cá nhân.
<br/>
<img src="https://laptopaz.vn/media/product/1176_laptop_dell_g3_3579_gaming___laptopaz__1_.JPG" alt="Laptop dell G3 3579">
<br/>
Đối với Laptop Dell G3 3579, máy vẫn giữ được hơi hướng trong triết lý thiết kế tổng thể của Dell từ xưa đến nay. Một chiếc máy thoạt nhìn qua trông có vẻ tối giản, không nổi bật là bao, chỉ khi xăm soi từng đường nét, bạn mới có thể thấy được sự tinh tế, tỉ mỉ của nhà sản xuất.
<br/>
Các chi tiết phần thân vỏ được hoàn thiện tiệm cận sự tuyệt đối. Các chi tiết thừa hay bị lỗi không hề có. 
<br/>
Đặc biệt, thứ mà dành được cảm tình từ cộng đồng người dùng không gì khác ngoài sự chắc chắn đến từ bộ khung vỏ. Dell đã khéo léo kết hợp giữa chất liệu nhựa Polycarbonate cho phần khung vỏ của máy và chiếu nghỉ tay bằng nhôm chất lượng cao. Do đó, thiết kế tổng thể của máy trông tối giản nhưng không hề tối tăm một chút nào.<br/>
Điểm trừ duy nhất của chiếc máy này là viền màn hình khá dày, còn lại Laptop Dell G3 3579 không có gì để chúng ta phải phàn nàn cả.
<br/>
<img src="https://laptopaz.vn/media/product/1176_laptop_dell_g3_3579_gaming___laptopaz__3_.JPG" alt="Laptop dell G3 3579">
<br/>Máy được trang bị đầy đủ các cổng kết nối cơ bản, phía cạnh trái là cổng HDMI, LAN, USB 3.0, Jack Audio 3.5. Phía cạnh phải là cổng USB 3.1 và khe thẻ SD.
<br/>
Với những trang bị đầy đủ như vậy thì đó là một điểm lợi thế không chỉ đối với các bạn thích chơi game mà còn cả những bạn đang làm việc văn phòng.
<br/>
Bàn Phím và TouchPad là thứ gây được ấn tượng nhiều nhất với người dùng bởi hiệu ứng thị giác mà chiếc Laptop Dell G3 3579 này đem lại. Đó là sự kết hợp giữa màu đen của các phím bấm và phần Led xanh của đèn nền.
<br/>
Cảm giác gõ hay di chuột trên chiếc máy này cực kỳ tốt. Đối với bàn phím, các phím bấm cho độ nảy và độ phản hồi khá tốt, hình trình phím đủ lớn để anh em game thủ có thể thực hiện các pha Combat chuẩn xác.
<br/>
Còn đối với TouchPad, Dell đã làm nổi bật hơn nhờ đường viền cùng màu đèn Led chạy quanh TouchPad. Cảm giác di chuột nhạy, phản hồi ngay tức thì và không có độ trễ
<br/>
<img src="https://laptopaz.vn/media/product/1176_laptop_dell_g3_3579_gaming___laptopaz__5_.JPG" alt="Laptop dell G3 3579">
<br/>
Laptop Dell G3 3579 được nhà sản xuất trang bị màn hình 15.6 inch độ phân giải FullHD 1920x1080 trên tấm nền IPS. Do đó khả năng hiển thị của máy khá tốt, đặc biệt khi chơi những tựa game có đồ họa khủng như PUBG, CSGO, FIFA Online hình ảnh được tái tạo hết sức sống động.
<br/>
Theo công bố của nhà sản xuất, độ chuẩn màu của màn hình đạt khoảng 65% sRGB nên việc tái tạo màu sắc hay hình ảnh khá tốt.
<br/>
Điểm hạn chế trên chiếc màn hình này duy chỉ có viền màn hình hơi dày nếu đem so với các đối thủ cùng tầm giá.
<br/>
<img src="https://laptopaz.vn/media/product/1176_laptop_dell_g3_3579_gaming___laptopaz__6_.JPG" alt="Laptop dell G3 3579">
<br/>
Máy được trang bị viên Pin 6 Cell, do đó thời lượng sử dụng trung bình 4-5 giờ đối với các tác vụ văn phòng hàng ngày.
<br/>
Còn đối với các tác vụ nặng hơn như chơi Game hay edit video, máy cho thời lượng sử dụng khoảng 3 giờ làm việc liên tục.
<br/>
<img src="https://laptopaz.vn/media/product/1176_laptop_dell_g3_3579_gaming___laptopaz__10_.JPG" alt="Laptop dell G3 3579">
<br/>
Thứ đáng nói và đáng để quan tâm nhất trên chiếc Laptop Dell G3 3579 này chính là cấu hình của máy. 

Phiên bản mà các bạn đang xem được trang bị cấu hình cao cấp nhất trong dòng Laptop Dell G3 3579 với con Chip i7 vô cùng mạnh mẽ.', N'Intel® Core™ i7-8750H', N'8GB DDR4 Bus 2666MHz', N'SSD 128GB + HDD 1TB ', N'NVIDIA GTX 1050Ti 4GB', N'15.6 inch FHD IPS', N'HD 720P', N'USB 3.0, HDMI, jack 3.5', N'2.5 kg', N'2-3 Giờ', N'Windows 10 bản quyền', 0, N'/images/pictures/1176_laptop_dell_g3_3579_gaming___laptopaz__1_.jpg', CAST(N'2022-04-07 16:36:42.593' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (4, N'Dell Alienware M17 R2', 1007, CAST(42890000 AS Decimal(18, 0)), 0, CAST(42890000 AS Decimal(18, 0)), N'[Mới 99%] Dell Alienware M17 R2 (Core i7-9750H, 16GB, 512GB, VGA RTX 2070 8GB DDR6, 17.3 inch FHD 144Hz)
', N'Dell Alienware M17 R2 có tất cả mọi thứ bên trong ngoại hình hầm hố của mình. Từ ánh sáng nền độc đáo, hệ thống tản nhiệt hoành tráng cho đến cấu hình cực mạnh mẽ.
<br/>
Dell Alienware M17 R4 được trang bị bộ vi xử lý Core i7 9750H Ram DDR4 16Gb, đồ hoạ NVIDIA GeForce RTX 2070 8GB DDR6 và cho số khung hình mỗi giây lớn dường như có thể làm lu mờ rất nhiều máy tính xách tay chơi game hiện tại. Không cần bàn cãi nhiều với sự mạnh mẽ và hiệu suất ưu việt của chiếc laptop gaming này,  bạn sẽ hài lòng với chiếc laptop mạnh mẽ, chạy mượt mà các trò chơi yêu cầu phần cứng chuyên sâu và yên tâm hưởng thụ những bữa tiệc game tuyệt đỉnh cùng Dell Alienware M17 R2.
 <br/>
Dell Alienware M17 R2 hiện đang bán tại LaptopAZ.vn hình thức còn rất mới, toàn thân máy không xước xát. Mọi chức năng hoạt động hoàn hảo 100%. Máy đã được cài đặt đầy đủ hệ điều hành và các ứng dụng văn phòng khách hàng mua về chỉ việc dùng. LaptopAZ.vn có chế độ bảo 12 tháng phần cứng và bảo hành phần mềm trọn đời trong quá trình sử dụng. 
<br/>
<img src="https://laptopaz.vn/media/lib/1714_ip152921_00.jpg" alt="Dell Alienware M17 R2">
<br/>
<img src="https://laptopaz.vn/media/lib/1714_ip152921_02.jpg" alt="Dell Alienware M17 R2">
<br/>
<img src="https://laptopaz.vn/media/lib/1714_e77057c1714df115b4f584131633b159-500x500.jpg" alt="Dell Alienware M17 R2">
<br/>', N'Intel® Core™ i7-9750H', N'	16GB DDR4 Bus 2666MHz', N'	SSD 512GB NVMe', N'NVIDIA RTX 2070 8GB DDR6', N'	17.3 FHD IPS 144Hz', N'HD 720P', N'	HDMI, USB 2.0, USB 3.0', N'2.6 kg', N'2.6 kg', N'Windows 10', 0, N'/images/pictures/Dell_Alienware_M17_R2.jpg', CAST(N'2022-04-07 16:44:23.133' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (5, N'Dell Alienware M17 R3 2020', 1007, CAST(60000000 AS Decimal(18, 0)), 3, CAST(58200000 AS Decimal(18, 0)), N'[Mới 100%] Dell Alienware M17 R3 2020 (Core i7-10750H, 16GB, 1TB, VGA RTX 2070 Super, 17.3 inch FHD 300Hz)', N'
Alienware 17 với trọng lượng thấp tới 5,51 lbs và dưới 22mm, alienware m17 mới kết hợp tính di động của máy tính xách tay với đồ họa hiệu suất tối đa. Đối với những game thủ đang tìm cách ưu tiên hiệu năng mà không phải hy sinh độ mỏng, vật liệu hợp kim magiê cao cấp của m17 mang lại sự tiết kiệm trọng lượng trong khi giảm độ dày. Thế hệ alienware m17 này bao gồm lớp phủ bề mặt được cải tiến được thiết kế để giảm vết bẩn vân tay và những vết bẩn thông thường khác mà không thay đổi màu sắc hoặc màu sắc. Giải pháp chống vết bẩn này là Lớp phủ trong suốt hiệu suất cao - một công thức cho phép chúng ta cảm nhận được hợp kim magiê lạnh và bền trong chiến lược màu tương phản cao
<br/>
<img src="https://laptopaz.vn/media/lib/1721_dell-alienware-17-m17-r3-gaming-notebook-i7-10750h-16gb-1tb-server-2006-18-server7.jpg" alt="ảnh laptop Alienware 17 ">
<br/>
Cryo-tech nâng cao
<br/>
Advanced Alienware Cryo-Tech, là một phương pháp kỹ thuật trong đó hiệu năng chơi game của hệ thống Alienware không bao giờ bị ảnh hưởng bởi những phương pháp điện và cơ học trong quá trình duy trì sự ổn định của hệ thống ở trạng thái hiệu suất cao nhất. Điều này được quản lý bằng những phương pháp, không giới hạn, tản nhiệt thông qua những thiết kế mô-đun nhiệt sáng tạo, thiết kế động cơ quạt và quạt, cũng như bố trí ống xả và cửa hút và trở kháng luồng khí tổng thể. Ngoài ra, m17 mới cung cấp luồng không khí được cải thiện bằng cách truyền trực tiếp luồng khí mát vào những lõi nhạy nhất của hệ thống với cánh quạt đường kính 66mm với cánh quạt CPU nhiều hơn 53% và cánh quạt GPU nhiều hơn 25%.
<br/>
<img src="https://laptopaz.vn/media/lib/1721_dell-alienware-17-m17-r3-gaming-notebook-i7-10750h-16gb-1tb-server-2006-18-server2.jpg " alt="ảnh laptop Alienware 17 ">
<br/>
Với tất cả những cải tiến kỹ thuật mới nhất, chúng ta có thể mong đợi hiệu suất năng lượng tăng lên và có tốc độ cao hơn trong thời gian duy trì lâu hơn. Ở đây, một cái nhìn sâu hơn về giải pháp làm mát sáng tạo:
<br/>
<img src="https://laptopaz.vn/media/lib/1721_dell-alienware-17-m17-r3-gaming-notebook-i7-10750h-16gb-1tb-server-2006-18-server8.jpg " alt="ảnh laptop Alienware 17 ">
<br/>
Công nghệ buồng hơi: Công nghệ buồng hơi mới của Alienware dùng những phương pháp tiên tiến để tản nhiệt hiệu quả Alienware 17 mới được thiết kế với buồng hơi chuyên dụng ở giữa CPU và ống dẫn nhiệt bằng đồng. Tất cả đều được thiết kế để quản lý dòng nhiệt và tối đa hóa hiệu suất. Những buồng này dùng tính chất thay đổi pha của chất lỏng để truyền nhiệt hiệu quả hơn so với một ống dẫn nhiệt bằng kim loại hoặc đồng rắn. Buồng hơi cũng linh hoạt hơn ống dẫn nhiệt bằng đồng ở chỗ chúng có thể được thiết kế để trải đều trên toàn bộ một con chip cần được làm mát. Những buồng hơi CPU này chỉ có sẵn trong những cấu hình có đồ họa NVIDIA GeForce RTX và GTX (GPU).

<br/>
<img src="https://laptopaz.vn/media/product/1721_71hhy4ikvwl__ac_sl1500_.jpg " alt="ảnh laptop Alienware 17 ">
<br/>
Thiết kế luồng khí kép, ống xả kép: Khung gầm mỏng và nhẹ ưu tiên hiệu suất với quạt kép hút khí mát từ lỗ thông hơi ở trên và dưới, và thở ra những lỗ thông hơi phía sau và bên để làm mát tối ưu những bộ phận lõi .
<br/>
Quạt điều khiển điện áp cao: Những cánh quạt polymer tinh thể lỏng giống như lửa Kevlar gồm có vòng bi tay áo và điều khiển quạt 3 pha để tạo ra ít sự ma sát và lưu thông không khí hiệu quả hơn. Hiện có 132 cánh quạt độc đáo để làm mát cả CPU và GPU.

<br/>
<img src="hhttps://laptopaz.vn/media/product/1721_alienwarem17_r3__3_.jpg " alt="ảnh laptop Alienware 17 ">
<br/>

Những ống dẫn nhiệt cân bằng tải: Động lực của hoạt động nhiệt trên những thành phần quan trọng như GPU và CPU được xả thông minh qua bốn ống dẫn nhiệt bằng composite đường kính 3,5mm.
<br/>
Ngăn xếp vây đồng dày đặc: M17 mới có khối lượng vật liệu đồng lớn nhất tính theo trọng lượng so với m17 trước 35% và cung cấp khả năng tản nhiệt nhiều hơn cho những thành phần cốt lõi so với m17 trước đó. Alienware 17 mới cũng đã tăng kích thước của những ống dẫn nhiệt lên 40% để tăng diện tích bề mặt tổng thể và tản nhiệt.
<br/>


Quy định về áp lực thủy lực
Điều chỉnh điện áp siêu hiệu quả là kết quả của kỹ thuật phần cứng cho phép đồ họa và / hoặc bộ xử lý chạy ở mức hiệu suất cao nhất của chúng trong thời gian dài. Bằng cách tăng số lượng những pha điều chỉnh điện áp, chúng ta có thể cung cấp tín hiệu năng lượng sạch và hiệu quả do đó cũng cải thiện hiệu suất nhiệt. hiệu quả và hiệu quả nhiệt trên mỗi lõi. Mức hiệu suất cao hơn dẫn tới khả năng tăng khối lượng công việc theo thời gian với giảm tổn thất năng lượng đối với nhiệt.
<br/>
Kết nối nhanh chóng: Công nghệ Killer D doublehot ™ Pro cho phép quản lý lưu lượng truy cập internet thông minh bằng cách dùng cả kết nối có dây và không dây song song để ưu tiên những gói. Công nghệ Killer sẽ tự động xác định lưu lượng truy cập thoại và giọng nói nhạy cảm độ trễ và gửi nó qua giao diện nhanh nhất. Công nghệ mới này được thực hiện bằng cách kết hợp Killer Killer 2.5Gbps E3000 Wired Wired Killer Wi-Fi 6 AX1650 (2x2) và Bluetooth 5.0
<br/>
Nhanh chóng
Sẵn sàng cho mọi thứ: Mở rộng thế giới của chúng ta với đầu đọc thẻ phương tiện mới được thêm vào của Dell. Khe cắm mới dùng khe cắm Micro-SD đẩy hỗ trợ phương tiện truyền thông UHS-II HD312.
<br/>
Bàn phím được cải tiến: Bàn phím cực kỳ nhạy bén có khả năng di chuyển 1.7mm với công nghệ cuộn 4 vùng RGB N-Key tùy chọn và công nghệ chống bóng ma. Đối với tùy chọn thậm chí có thể tùy chỉnh nhiều hơn, hãy nâng cấp lên Bàn phím cao cấp với ánh sáng Alien FX trên mỗi phím.

<br/>

Bàn di chuột cao cấp: Bàn di chuột bằng kính có độ chính xác mang tới trải nghiệm chơi game chất lượng cao mà chúng ta có thể cảm nhận được.', N'Intel® Core™ i7-10750H', N'16GB DDR4 Bus 2666MHz', N'SSD 1TB', N'NVIDIA RTX 2070 super', N'17.3 FHD IPS 300Hz', N'HD 720P', N'HDMI, USB 2.0, USB 3.0', N'	2.6 kg', N'4 Cells', N'Windows 10', 0, N'/images/pictures/alienware-m17-r3.jpg', CAST(N'2022-04-07 16:55:37.293' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (6, N'Dell G7 7588', 1007, CAST(25000000 AS Decimal(18, 0)), 10, CAST(22500000 AS Decimal(18, 0)), N'Laptop cũ Dell G7 7588 (Core i5-8300H, 8GB, 1TB + 128GB , VGA 4GB GTX 1050Ti, 15.6 FHD IPS)
', N'Đánh giá nhanh Laptop Dell G7 7588 về mặt thiết kế
Vẫn là 2 tông màu truyền thống của các dòng laptop Gaming Dell G7 7588 được trang bị cấu hình hoàn hảo trong tầm giá của một laptop chơi Game tầm trung. CPU khủng i5-8300H, RAM 8GB DDR4 bus 2666Ghz mới nhất chạy đa nhiệm cực mượt mà, VGA 4GB NIVIDIA GTX 1050Ti đáp ứng mượt mà các ứng dụng đồ họa và các tựa game phổ thịnh hành trên thị trường hiện nay, màn hình 15.6 inch FHD 1920x1080 thêm công nghệ tấm nền IPS cực đẹp chống lóa cho hình ảnh sắt nét hơn. Đặc biệt được trang bị thêm ổ cứng SSD M2 giúp máy tăng tốc độ nhanh gấp nhiều lần
<br/>
<img src="https://laptopaz.vn/media/product/1172_dell_inspiron_g7_7588_laptopaz__4_.JPG" alt="Laptop cũ Dell G7 7588"> 
<br/>

Tương tự các laptop gaming trong dòng Inspiron, Dell Inspiron G7 7588 có vỏ vân nhám, cứng cáp từ hợp kim magie. Tuy nhiên, thiết kế lần này khác biệt hơn ở bộ đèn led và logo Dell màu xanh bắt kịp xu hướng laptop gaming tối giản – không quá cầu kỳ nhưng vẫn “cool” đúng chất game.
<br/>
Bản lề êm, thuộc loại tốt, có thể mở bằng 1 tay dễ dàng. Thiết kế bản lề ở giữa giúp nắp máy trở nên cứng cáp, đồng thời thiết kế liền mạch hơn, mạnh mẽ hơn như kiểu bản lề ở 2 góc.
<br/>
Sở hữu chiếc màn hình 15,6inch và có độ phân giải Full HD sử dụng tấm nền IPS, màu sắc cho ra tương đối rực rỡ và có độ tương phản cao tuy nhiên khi sử dụng dưới ánh sáng mạnh hay ngoài trời thì hình ảnh có phần bị mờ và khá tối rất khó nhìn.
<br/>
64% Srgb
<br/>
48% AdobeRGB
<br/>
190 Nits
<br/>
Phía bên cạnh phải thì Dell 7588 vẫn có được cổng kết nối HDMI tiêu chuẩn dùng để xuất hình ảnh ra màn hình ngoài phục vụ cho việc chơi game thuận tiện hơn, 2 cổng USB 3.1 và 1 cổng USB Type C, 1 Jack cắm tai nghe 3.5mm.
<br/>
<img src="https://laptopaz.vn/media/product/1172_dell_inspiron_g7_7588_laptopaz__4_.JPG" alt="Laptop cũ Dell G7 7588"> 
<br/>

Như các dòng Laptop hiện nay thì hãng đã loại bỏ ổ đĩa quang trên 7588 để tiết kiệm diện tích hơn.
<br/>
Bên phía cạnh trái của máy ta có 1 cổng USB 3.1, 1 khe cắm thẻ SD, 1 cổng cắm mạng LAN ( RJ45 ) cùng chân cắm Adapter quen thuộc loại chân kim viền to.

<br/>
<img src="https://laptopaz.vn/media/product/1172_dell_inspiron_g7_7588_laptopaz__1_.JPG" alt="Laptop cũ Dell G7 7588"> 
<br/>


và không thể thiếu đó là khe cắm khóa Kensington phía cuối.
<br/>
Khu vực Touchpad có kích thước rộng rãi, đường viền xung quanh cũng được sơn màu xanh bắt mắt, 2 phím bấm trái phải được tích hợp luôn vào bên dưới và khi ấn ta có cảm giác thanh thoát – âm thanh phát ra nhẹ nhàng và chắc chắn. 

<br/>
<img src="https://laptopaz.vn/media/product/1172_dell_inspiron_g7_7588_laptopaz__4_.JPG" alt="Laptop cũ Dell G7 7588"> 
<br/>

 Bề mặt của Touchpad có độ nhám sần vừa phải tuy nhiên khi sử dụng thì mang đến cảm giác dễ sử dụng, tốc độ di chuẩn và chính xác.
<br/>
<img src="https://laptopaz.vn/media/product/1172_dell_inspiron_g7_7588_laptopaz__1_.JPG" alt="Laptop cũ Dell G7 7588"> 
<br/>
Bàn phím có cảm giác được làm gia công rất rất kiến cố, các phím có lực nhấn vừa phải 1,4mm và đèn nền màu xanh với các phím WASD mang lại cho bạn một cảm giác hấp dẫn. Bàn phím của Dell G5 có đèn nền màu đỏ khiến khó xác định các nút nhưng đèn nền màu xanh của Dell Inspiron 7588 đã đề cập đến vấn đề này. 
<br/>
Bàn di chuột cung cấp cho bạn một cách dễ dàng và bạn không phải vội vã di chuột như Dell G3. G7 đi kèm với một máy quét dấu vân tay ở phía bên trái của nút nguồn.
<br/>
<img src="https://laptopaz.vn/media/product/1172_dell_inspiron_g7_7588_laptopaz__9_.JPG" alt="Laptop cũ Dell G7 7588"> 
<br/>
Công nghệ âm thanh Waves MaxxAudio Pro cho bạn những trải nghiệm rõ nét đến từng bước chân, nâng cao khả năng chơi game của bạn. Bạn sẽ được chơi game với những trải nghiệm tốt nhất.

<br/>
<img src="https://laptopaz.vn/media/lib/1212_4743171ae374052a5c65.jpg" alt="Laptop cũ Dell G7 7588"> 
<br/>
Dòng laptop chơi game Dell G7 7588 thực sự đem lại ấn tượng mạnh nhờ thiết kế đẹp bắt mắt, hiệu năng xử lý hoàn hảo và khả năng tản nhiệt tuyệt vời. Bên cạnh đó những thiết kế và tính năng khác cũng được tối ưu đem lại cho người dùng một trải nghiệm tốt hơn.
', N'Intel® Core™ i5-8300H', N'8GB DDR4 Bus 2666MHz', N'SSD 128GB + HDD 1TB ', N'NVIDIA GTX 1050Ti 4GB', N'15.6 inch FHD (1920x1080)', N'HD 720P', N' USB 3.0 ', N'2.5 kg', N'2-3 Giờ', N'Windows 10 bản quyền', 0, N'/images/pictures/Dell-G7-15-7588.png', CAST(N'2022-04-07 17:05:14.880' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (7, N'Dell Vostro 7580', 1007, CAST(28000000 AS Decimal(18, 0)), 15, CAST(23800000 AS Decimal(18, 0)), N'Laptop cũ Dell Vostro 7580 (Core i7-8750H, 8GB, 1TB + 128GB, VGA 4GB GTX 1050Ti, 15.6 FHD)
', N'Dell Vostro 7580 có thiết kế vô cùng sang trọng ấn tượng với toàn bộ thân vỏ được làm từ nhựa kết hợp cùng hợp kim nhôm mang đến một thể đồng nhất. Logo phía sau nổi bật trên nền vân nổi mang lại nét đẹp vô cùng ấn tượng
<br>
Dell Vostro 7580 được trang bị cấu hình cực khủng với chip Intel Core i7 8750H mang lại hiệu năng đáng nể giúp bạn chinh phục mọi tựa game cao cấp nhất hiện nay hay các tác vụ nặng yêu cầu tính đồ họa cao với card đồ họa rời NVIDIA GTX1050 TI 4GB DDR5.
<br>
Sở hữu màn hình rộng 15,6 inch cùng độ phân giải Full HD mang lại chất lượng hình ảnh vô cùng sắc nét, chân thực.
<br>
Dell Vostro 7580 được trang bị bàn phím Full size, hành trình phím ngắn, độ nảy cao mang lại cảm giác gõ phím khá tốt. Bàn phím còn được tích hợp đèn nền màu trắng mang giúp bạn dễ dàng sử dụng ngay cả trong đêm tối.
<br>
Touchpad rộng rãi, được thiết kế đặc biệt giúp chống bám bụi bẩn đem lại sự tiện lợi đáng kể cho người sử dụng.
<br>
Hệ thống tản nhiệt của Dell Vostro 7580 được thiết kế vô cùng độc đáo với khe tản nhiệt lớn được sắp xếp ở phần lưng giúp máy tản nhiệt tốt hơn đồng thời không mang lại sự khó chịu cho người sử dụng.
<br/> <img src="https://laptopaz.vn/media/product/1198_53184562_1132673700228141_1561663212770820096_n.jpg " alt="ảnh laptop Alienware 17 "> <br/>
<b>Thiết kế</b>
<br>
Vẫn giữ nguyên thiết kế so với phiên bản Dell Vostro 7570. Toàn bộ vỏ máy được làm từ kim loại cảm giác sờ rất là mát tay bên cạnh đó sản phẩm còn đem lại cho ta vẻ bề ngoài sang trọng. Bề mặt kim loại giúp cho sản phẩm chống bám dính vân tay tốt
<br>
Bản lề của máy giống với dòng Inspiron gaming khi thiết kế lớn ở chính giữa cùng với đó hai bên được bố trí 2 quạt tản nhiệt với thiết kế lưới tản nhiệt cách điệu tạo điểm nhấn cho sản phẩm. Phần bản lề được Dell gia công rất chắc chắn, cảm giác đóng mở máy hơi nặng một chút nhưng vẫn có thể thao tác dễ dàng bằng một tay.  

 <br>
<br>
Mặt sau của máy với thiết kế 4 khe hút lớn giúp cho máy tránh khỏi tình trạng quá tải nhiệt khi sử dụng và được cố định chỉ bằng duy nhất một con ốc cho nên việc nâng cấp là khá dễ dàng.

<br/> <img src="https://laptopaz.vn/media/product/1198_53690267_1132673753561469_2959987350395944960_n.jpg " alt="ảnh laptop Alienware 17 "> <br/>
Bàn phím, Touchpad
<br>
Dell Vostro 7580 trang bị một bàn phím full size có đèn Led trắng phục vụ dễ dàng hơn khi ở trong bóng tối, khoảng cách giữa các phím bố trí hợp lý độ nảy của các phím khi gõ ở mức tương đối tuy nhiên đối với những bạn nào thích chơi game thì sẽ có cảm giác hơi khó chịu.
<br>
Phần touchpad thiết kế lớn đặt lệch về phía bên tay trái tạo ra khoảng không gian rộng cho phần nghỉ tay bên phải.
<br>
<b>Màn Hình</b> 
<br>
Dell Vostro 7580 sở hữu viền màn hình 15,6 inch Full HD (độ phân giải 1920 x 1080) cùng tấm nền Full HD Anti-Glare IPS. Thông số cấu hình cũng không có gì nổi bật trong tầm giá cả vì tần số quét cũng chỉ dừng lại ở 60Hz.
<br>
Được trang bị tấm nền IPS cho góc nhìn của máy cũng không thật sự rộng, khi nghiêng đi độ sai lệch màu sắc lại khá nhiều và một điểm trừ nữa là phần viền màn hình của sản phẩm vẫn còn rất dày.
<br>
Loa
<br>
Loa của Dell Vostro 7580 được bố trí ở mặt đáy cho trải nghiệm âm Bass khá tốt, các dải âm khác có độ chi tiết tương đối, đi kèm với đó là công nghệ Waves MaxxAudio Pro giúp cho sản phẩm đáp ứng đủ nhu cầu thư giãn giải trí và chơi game. 
<br>
<b>Kết nối </b>
<br>
Dell Vostro 7580 được trang bị khá nhiều cổng kết nối thông dụng cho công việc văn phòng. 
<br>
Bên cạnh phải của máy chúng ta có một jack cắm tai nghe, cổng VGA, cổng HDMI, cổng USB Type-C, hai cổng USB Type-A 3.0.
<br>
Bên cạnh trái là cổng sạc, cổng ethernet hay còn gọi là cổng LAN, một USB Type-A 3.0 và một khe cắm SD.

 <br>
<br>
<b>Cấu hình</b>

 <br>
<br>
Dell Vostro 7580 được trang bị cấu hình core i7-8750H, chip thế hệ 8 Coffee Lake. Bộ xử lý xung nhịp từ 2,2 đến 4,1GHz (4GHz với 4 lõi, 3,9 GHz với 6 lõi) và có thể thực thi tối đa 12 luồng cùng lúc nhờ Hyper-Threading với 6 lõi và 12 luồng hiệu suất đã tăng gần 50% so với một bộ xử lý chip thế hệ 7 Kaby Lake trước đây.
<br>
Dell Vostro 7580 được trang bị ram 4GB DDR4 và còn 1 slot ram để phục vụ cho việc nâng cấp, máy có thể nâng cấp lên 32GB ram. Bên cạnh đó máy còn được trang bị 1 ổ HDD 1TB và 1 ổ SSD 128GB. 
<br>
Đồ Họa 
 <br>

Qua các bài test trên ta có thể thấy rằng điểm số của Dell Vostro 7580 đạt được khá là cao, cho thấy khả năng xử lý tác vụ đa nhiệm, xử lý đồ họa nặng rất là tốt. Nhiệt độ trung bình có máy khi xử lí các tác vụ nặng như chơi game, render video rơi vào khoảng 60-70 độ C cao nhất là 90 độ C. Tuy nhiên quạt tản nhiệt còn khá ồn so với các dòng laptop gaming khác.
<br>
<b>Dung Lượng Pin </b>
Khá đáng tiếc khi thời lượng Pin của Dell Vostro 7580 chỉ khoảng hơn 3 tiếng một chút vì vậy bạn nên nhớ lúc nào cũng nên mang theo bên mình chiếc sạc laptop phòng khi máy hết pin.
<br/> <img src="https://laptopaz.vn/media/product/1198_53891071_1132673656894812_2647803258734641152_n.jpg " alt="ảnh laptop Alienware 17 "> <br/>
<b>Kết Luận</b>
Dell Vostro 7580 là một mẫu máy doanh nhân kết hợp một chút gaming thật sự không ấn tượng trong tầm giá đối với mình. Điểm mạnh có lẽ là phần thiết kế bên ngoài sang trọng khá ấn tượng thêm nữa máy có nhiều cổng kết nối đa dạng khác nhau', N'Intel Core i7- 8750H (2.2GHz up to 4.1GHz Cache 9M 6 lõi 12 luồng)', N'8GB DDR4 2666MHz', N'HDD 1TB + SSD 128GB m2', N'NVIDIA GeForce GTX 1050Ti 4GB', N' 15.6 inch Full HD', N'độ nét HD', N'HDMI, USB 3.0, USB 2.0, Bluetooth, jiack phôn, khe đọc thẻ.', N'2.83 kg', N'Lion 4 cell', N'Windows 10', 0, N'/images/pictures/dell_gaming_7580.JPG', CAST(N'2022-04-07 17:18:53.133' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (8, N'Dell Gaming G15 5515', 1007, CAST(33000000 AS Decimal(18, 0)), 10, CAST(29700000 AS Decimal(18, 0)), N'[Mới 100%] Dell Gaming G15 5515 (Ryzen 7-5800H, 8GB, 512GB, RTX 3050Ti, 15.6'''' FHD 120Hz)
', N'<b>Dell Gaming G15 5515 hướng đến đối tượng nào?</b>
<br/>
Nếu bạn là một fan cứng của Dell, thì bạn không thể bỏ lỡ thông tin: Dell đã chính thức ra mắt dòng máy tính chơi game chip AMD 5000 hoàn toàn mới (G15 Ryzen Edition). Một chiếc máy được mong chờ sẽ là phiên bản "hạt dẻ" của  Alienware nhưng sở hữu hiệu năng và thiết kế không thể chê vào đâu được. Hãy cùng LaptopAZ đi tìm hiểu chi tiết về chiếc máy này ngay thôi nào!
<br/> <img src="https://laptopaz.vn/media/product/2090_06.jpg" alt="Dell Gaming G15 5515"> <br/>
<b>Thiết kế</b>
<br/>
Dell đã đổi tên gọi của dòng laptop gaming mới của mình là Dell Gaming G15.
<br/>
Dòng Gaming G15 2021 mới của Dell có thiết kế hơi hướng dòng Gaming cao cấp Alienware.
<br/>
Lớp sơn hoàn thiện mới cứng cáp dễ chăm sóc và có sẵn ba màu Dark Shadow Grey, Specter Green  và Phantom Grey
<br/>
Ở phiên bản chạy chip AMD mới nhất có tên gọi là Dell Gaming G15 5515
<br/> <img src="https://laptopaz.vn/media/product/2090_03.jpg" alt="Dell Gaming G15 5515"> <br/>
<b>Màn hình</b>
Dell G15 5515 cũng sẽ có màn hình 15.6” Full HD 120Hz với độ sáng 300nits cao cấp.
<br/>
Màn hình có độ chuẩn màu cao cùng viền màn hình siêu mỏng hứa hẹn sẽ làm hài lòng mọi game thủ khó tính nhất.
<br/> <img src="https://laptopaz.vn/media/product/2090_05.jpg" alt="Dell Gaming G15 5515"> <br/>
<b>Cấu hình</b>
G15 AMD, được tích hợp APU Ryzen 7 5800H
<br/>
APU Ryzen 5 5600H có xung cơ cơ sở 3.2 GHz có thể tăng xung tới 4,4 GHz
<br/>
G15 5515 dụng RAM có dung lượng 8GB, DDR4, 3200MHz
<br/>
Phiên bản G15 5515 được trang bị GPU GeForce RTX 3050Ti 4GB
<br/> <img src="https://laptopaz.vn/media/product/2090_04.jpg" alt="Dell Gaming G15 5515"> <br/>
<b>Tản nhiệt</b><br/>
Thiết kế tản nhiệt lấy cảm hứng từ Alienware kết hợp hệ thống hút gió kép từ phía trên bàn phím và phía dưới của G15. Sau đó, không khí này được thoát ra ngoài qua bốn lỗ thông hơi nằm ở hai bên và phía sau để tối đa hóa luồng không khí qua các ống đồng để làm mát và tản nhiệt tối ưu.
<br/> <img src="https://laptopaz.vn/media/product/2090_01.jpg" alt="Dell Gaming G15 5515"> <br/>
Những tiến bộ mới nhất về thiết kế tản nhiệt mang lại cho Dell G15 giúp máy mát hơn và luôn giữ được tốc độ xung nhịp cao khi chơi game cũng như chạy các ứng dụng nặng nhất.
<br/>
Công nghệ Game Shift: Tăng cường sức mạnh cho bạn khi việc chơi game trở nên quan trọng chỉ bằng một thao tác nhấn nút đơn giản. Game Shift được kích hoạt bằng cách nhấn FN + phím Game Shift và kích hoạt chế độ hiệu suất động trong Alienware Command Center bằng cách tối đa hóa tốc độ của quạt để giữ cho hệ thống của bạn luôn mát mẻ trong khi bộ xử lý hoạt động mạnh hơn
<br/>
<b>Âm thanh</b><br/>
G15 Gaming 5515 được trang bị loa kép với công nghệ 3D cho phép anh em nghe rõ mọi âm thanh trong Game hoàn hảo.
<br/>
Đèn nền RBG: bàn phím có đèn nền RBG 4 vùng tùy chọn với WASD được điều khiển bởi Trung tâm chỉ huy Alienware hoặc chỉ có LED đỏ (Tùy từng phiên bản)
<br/> <img src="https://laptopaz.vn/media/product/2090_06.jpg" alt="Dell Gaming G15 5515"> <br/>
<b>Dung lượng Pin</b>
Dell Gaming G15 5515 có Pin 3-Cell dung lượng 51WHr kèm công nghệ sạc nhanh.
<br/> <img src="https://laptopaz.vn/media/product/2090_01.jpg" alt="Dell Gaming G15 5515"> <br/>
<b>Cổng kết nối</b>
Máy được trang bị đủ cổng kết nối cho phổ biến nhất cho Game thủ hiện nay
<br/>
1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI | 6. Power In | 7. RJ45 | 8. Headphones/Microphone
<br/> <img src="https://laptopaz.vn/media/product/2090_03.jpg" alt="Dell Gaming G15 5515"> <br/>
<br/>
<b>Tổng Kết:</b>Dell Gaming G15 5515 là một trong những sự lựa chọn hàng đầu của dòng máy Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng không kém phần tinh tế, kết hợp cùng cấu hình mạnh mẽ và tản nhiệt mát mẻ, Dell Gaming G15 5515 tự tin có thể chinh phục được đa số các Game Online, Offline thời thượng hiện nay. Hơn thế nữa Dell Gaming G15 5515 cũng đủ sức đáp ứng các tác vụ thiết kế đồ họa, công việc, giải trí một cách mượt mà nhất.', N'AMD Ryzen 7 5800H', N'8GB DDR4 3200MHz Single Channel', N'512GB M.2 2280 PCIe NVMe  + 1 Khe M.2 NVMe  + 1 Khe 2,5 inchs Sata', N'NVIDIA® GeForce RTX™ 3050Ti 4GB GDDR6 (80W)', N'15.6 inch FHD (1920 x 1080) 120Hz 300 nits WVA Anti- Glare', N'HD 720P', N' 1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI | 6. Power In | 7. RJ45 Ethernet | 8. Headphones/Microphone', N'2.57kg', N'3 cell ', N'Windows 10 bản quyền', 0, N'/images/pictures/dell_gaming_g5_5515_r5.JPG', CAST(N'2022-04-07 17:33:47.567' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (15, N'Dell Gaming G15 5515 Ryzen 5-5600H', 1007, CAST(26000000 AS Decimal(18, 0)), 10, CAST(23400000 AS Decimal(18, 0)), N'[Mới 100%] Dell Gaming G15 5515 (Ryzen 5-5600H, 8GB, 256GB, RTX 3050 4GB, 15.6'''' FHD 120Hz)', N'<b>Dell Gaming G15 5515 hướng đến đối tượng nào?</b>
<br/>
Nếu bạn là một fan cứng của Dell, thì bạn không thể bỏ lỡ thông tin: Dell đã chính thức ra mắt dòng máy tính chơi game chip AMD 5000 hoàn toàn mới (G15 Ryzen Edition). Một chiếc máy được mong chờ sẽ là phiên bản "hạt dẻ" của  Alienware nhưng sở hữu hiệu năng và thiết kế không thể chê vào đâu được. Hãy cùng LaptopAZ đi tìm hiểu chi tiết về chiếc máy này ngay thôi nào!
<br/> <img src="https://laptopaz.vn/media/product/2090_06.jpg" alt="Dell Gaming G15 5515"> <br/>
<b>Thiết kế</b>
<br/>
Dell đã đổi tên gọi của dòng laptop gaming mới của mình là Dell Gaming G15.
<br/>
Dòng Gaming G15 2021 mới của Dell có thiết kế hơi hướng dòng Gaming cao cấp Alienware.
<br/>
Lớp sơn hoàn thiện mới cứng cáp dễ chăm sóc và có sẵn ba màu Dark Shadow Grey, Specter Green  và Phantom Grey
<br/>
Ở phiên bản chạy chip AMD mới nhất có tên gọi là Dell Gaming G15 5515
<br/> <img src="https://laptopaz.vn/media/product/2090_03.jpg" alt="Dell Gaming G15 5515"> <br/>
<b>Màn hình</b>
Dell G15 5515 cũng sẽ có màn hình 15.6” Full HD 120Hz với độ sáng 300nits cao cấp.
<br/>
Màn hình có độ chuẩn màu cao cùng viền màn hình siêu mỏng hứa hẹn sẽ làm hài lòng mọi game thủ khó tính nhất.
<br/> <img src="https://laptopaz.vn/media/product/2090_05.jpg" alt="Dell Gaming G15 5515"> <br/>
<b>Cấu hình</b>
G15 AMD, được tích hợp APU Ryzen 7 5800H
<br/>
APU Ryzen 5 5600H có xung cơ cơ sở 3.2 GHz có thể tăng xung tới 4,4 GHz
<br/>
G15 5515 dụng RAM có dung lượng 8GB, DDR4, 3200MHz
<br/>
Phiên bản G15 5515 được trang bị GPU GeForce RTX 3050Ti 4GB
<br/> <img src="https://laptopaz.vn/media/product/2090_04.jpg" alt="Dell Gaming G15 5515"> <br/>
<b>Tản nhiệt</b><br/>
Thiết kế tản nhiệt lấy cảm hứng từ Alienware kết hợp hệ thống hút gió kép từ phía trên bàn phím và phía dưới của G15. Sau đó, không khí này được thoát ra ngoài qua bốn lỗ thông hơi nằm ở hai bên và phía sau để tối đa hóa luồng không khí qua các ống đồng để làm mát và tản nhiệt tối ưu.
<br/> <img src="https://laptopaz.vn/media/product/2090_01.jpg" alt="Dell Gaming G15 5515"> <br/>
Những tiến bộ mới nhất về thiết kế tản nhiệt mang lại cho Dell G15 giúp máy mát hơn và luôn giữ được tốc độ xung nhịp cao khi chơi game cũng như chạy các ứng dụng nặng nhất.
<br/>
Công nghệ Game Shift: Tăng cường sức mạnh cho bạn khi việc chơi game trở nên quan trọng chỉ bằng một thao tác nhấn nút đơn giản. Game Shift được kích hoạt bằng cách nhấn FN + phím Game Shift và kích hoạt chế độ hiệu suất động trong Alienware Command Center bằng cách tối đa hóa tốc độ của quạt để giữ cho hệ thống của bạn luôn mát mẻ trong khi bộ xử lý hoạt động mạnh hơn
<br/>
<b>Âm thanh</b><br/>
G15 Gaming 5515 được trang bị loa kép với công nghệ 3D cho phép anh em nghe rõ mọi âm thanh trong Game hoàn hảo.
<br/>
Đèn nền RBG: bàn phím có đèn nền RBG 4 vùng tùy chọn với WASD được điều khiển bởi Trung tâm chỉ huy Alienware hoặc chỉ có LED đỏ (Tùy từng phiên bản)
<br/> <img src="https://laptopaz.vn/media/product/2090_06.jpg" alt="Dell Gaming G15 5515"> <br/>
<b>Dung lượng Pin</b>
Dell Gaming G15 5515 có Pin 3-Cell dung lượng 51WHr kèm công nghệ sạc nhanh.
<br/> <img src="https://laptopaz.vn/media/product/2090_01.jpg" alt="Dell Gaming G15 5515"> <br/>
<b>Cổng kết nối</b>
Máy được trang bị đủ cổng kết nối cho phổ biến nhất cho Game thủ hiện nay
<br/>
1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI | 6. Power In | 7. RJ45 | 8. Headphones/Microphone
<br/> <img src="https://laptopaz.vn/media/product/2090_03.jpg" alt="Dell Gaming G15 5515"> <br/>
<br/>
<b>Tổng Kết:</b>Dell Gaming G15 5515 là một trong những sự lựa chọn hàng đầu của dòng máy Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng không kém phần tinh tế, kết hợp cùng cấu hình mạnh mẽ và tản nhiệt mát mẻ, Dell Gaming G15 5515 tự tin có thể chinh phục được đa số các Game Online, Offline thời thượng hiện nay. Hơn thế nữa Dell Gaming G15 5515 cũng đủ sức đáp ứng các tác vụ thiết kế đồ họa, công việc, giải trí một cách mượt mà nhất.', N'AMD Ryzen 5 5600H 3.3GHz up to 4.2GHz 16MB
', N'8GB DDR4 3200MHz Single Channel
', N'256GB M.2 2280 PCIe NVMe

+ 1 Khe M.2 2280 PCIe NVMe', N'NVIDIA® GeForce RTX™ 3050 4GB GDDR6 (80W)', N'15.6 inch FHD (1920 x 1080) 120Hz 300 nits WVA ', N'HP 720P', N' 1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI | 6. Power In | 7. RJ45 Ethernet | 8. Headphones/Microphone', N'2.57kg', N'56WHr', N'Windows 11 bản quyền', 0, N'/images/pictures/dell_gaming_g5_5515_r5.JPG', CAST(N'2022-04-07 17:41:41.610' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (16, N'Dell Alienware M15 Ryzen', 1007, CAST(53000000 AS Decimal(18, 0)), 12, CAST(46640000 AS Decimal(18, 0)), N'[Mới 100%] Dell Alienware M15 Ryzen Edition Ryzen 7-5800H, 16GB, 256GB, RTX 3060, 15.6'''' FHD 165Hz
', N'<br><img src="https://laptopaz.vn/media/product/2050_6.jpg" alt="Dell Alienware M15 Ryzen"><br/>
Nếu bạn là một tín đồ của Alienware thì chắn hẳn bạn không thể bỏ qua thông tin Alienware đã cho ra mắt Alienware M15 R5 Ryzen Edition – sản phẩm đầu tiên của công ty sở hữu APU Ryzen 5000 dòng H từ AMD. Hãy cùng LaptopAZ đi tìm hiểu chi tiết về chiếc máy này để xem sự thay đổi của nó sẽ làm chúng ta bất ngờ đến đâu?
<br/>
 <br><img src="https://laptopaz.vn/media/product/2050_5.jpg" alt="Dell Alienware M15 Ryzen"><br/>

Sự ra đời của Dell Alienware M15 R5  được đánh giá là một bước ngoặt vô cùng lớn của nhà Dell. Không chỉ sở hữu thiết kế độc đáo, mạnh mẽ mà đây còn là chiếc gaming đầu tiên sử dụng con chip AMD sau 10 năm. Với sự thay đổi này, Dell Alienware đã trở thành chiếc laptop gaming sở hữu hiệu năng mạnh mẽ so với nhiều sản phẩm cao cấp trong cùng phân khúc. 

 <br><img src="https://laptopaz.vn/media/product/2050_3.jpg" alt="Dell Alienware M15 Ryzen"><br/>
<br/>
<b>Thiết kế của Dell Alienware M15 R5 </b><br/>
Không giống như những người tiền nhiệm trước đó của Alienware, ở phiên bản M15 R5 Ryzen chỉ có màu đen. Phần vỏ máy được làm bằng hợp kim nhôm cao cấp. Máy cho cảm giác cầm chắc chắn tay. Khung máy được làm bằng chất liệu hợp kim magie, được bao phủ một lớp trong suốt có độ bền cao. Điều này giúp nó chống lại các vết xước, chống bám vân tay khá tốt. 

 
<br><img src="https://laptopaz.vn/media/product/2050_1.jpg" alt="Dell Alienware M15 Ryzen"><br/>
Các cạnh nhẵn của Dell Alienware mang lại cho nó một thiết kế mới lạ, độc đáo. Bên cạnh đó là tùy chọn chiếu sáng cho logo Alienware trên nắp cùng với dải đèn LED hình tròn dọc theo viền sau tạo thêm nét tinh tế. Các lỗ thông hơi hình lục giác nằm phía trên bàn phím và được bố trí dọc theo mặt sau cũng mang lại cho Dell Alienware M15 R5 giúp xả nhiệt tốt hơn. Bàn phím trên của máy có RGB bốn vùng giúp người dùng có thể dễ dàng chơi game vào ban đêm.

 <br><img src="https://laptopaz.vn/media/lib/2050_8s.jpg" alt="Dell Alienware M15 Ryzen"><br/>

Laptop Dell Alienware M15R5 được đánh giá là một chiếc máy tính xách tay có tính di động khá cao. Với kích thước 14,02 x 10,73 x 0,9 inch và nặng 2.69kg. So với dòng sản phẩm gaming trong cùng phân khúc thì M15 R5 được đánh giá là tương đối nhẹ.

 
<br/>
<b>Dell Alienware M15 R5  có màn hình sắc nét </b><br/>
Alienware M15 R5 Ryzen được trang bị màn hình 15,6 inch và độ phân giải FHD 1920 x 1080 IPS. Tốc độ làm mới 165Hz và và Nvidia G-Sync. Điều này mang đến trải nghiệm tuyệt vời khi bạn chơi game. Màn hình hiển thị tốt, với màu sắc đặc biệt đẹp, viền cạnh và viền trên cùng khá mỏng. Đường viền dưới cùng được thiết kế hơi dày vì nó hòa vào phần bản lề.

 
<br/>
Với gam màu 87,3 DCI-P3, nó chỉ cao hơn một chút so với điểm số DCI-P3 80,6% của Asus. Độ sáng trung bình 328 nits, nó vượt qua các đối thủ trong cùng phân khúc là Acer với 292 nits và Asus với 265 nits. Mang đến màu sắc tươi sáng của trò chơi xuất hiện khá sống động.
<br><img src="https://laptopaz.vn/media/product/2050_6.jpg" alt="Dell Alienware M15 Ryzen"><br/>
 

Tất cả các màn hình máy đều có Alienware và trang bị tính năng lọc ánh sáng xanh ComfortView Plus của Dell. 
<br/>
Trên thực tế, trong bài kiểm tra màn hình 165Hz của M15 R5 khi chơi Overwatch. Màu sắc tươi sáng của trò chơi xuất hiện khá sống động và tốc độ làm mới nhanh hoàn toàn có thể bắt kịp với tốc độ 165 khung hình / giây mà tôi đang đánh trên cài đặt Ultra.
<br><img src="https://laptopaz.vn/media/product/2050_5.jpg" alt="Dell Alienware M15 Ryzen"><br/>
 
<br/>
<b>Âm thanh và Webcam của máy</b><br/>
Dell Alienware M15 R5 trang bị hai loa ở dưới mặt đáy như người tiền nhiệm trước đó. Âm thanh phát ra lớn với âm trầm đáng kinh ngạc. Nó không bị rè khi bạn mở nhạc hết công suất.
<br/>
 

Webcam 720p của Alienware M15 R5 cũng giống như nhiều máy tính xách tay chơi game cao cấp. Nó được đánh giá ở mức bình thường, không quá xuất sắc. Bất kể là trong điều kiện ánh sáng nào, ảnh chụp của nó luôn có khối và mờ. Nhưng nó vẫn mang đến hình ảnh sắc nét trong các cuộc gọi.
<br/>

<b>Các cổng kết nối của Dell Alienware M15 R5</b><br/>
Thiết kế cổng của Dell Alienware rất đa dạng khi cạnh trái của máy tính xách tay chỉ có cổng Ethernet và giắc cắm tai nghe / micro 3.5 mm. Mặt sau bao gồm các cổng DC-in, cổng HDMI 2.1, cổng USB 3.2 Gen 1 Type-A và cổng USB 3.2 Gen 2 . Đặc biệt các cổng Type-C cũng hỗ trợ DisplayPort . Cạnh phải của máy tính xách tay có thêm hai cổng USB 3.2 Gen 1 Type-A.
<br/>
 <br><img src="https://laptopaz.vn/media/product/2050_3.jpg" alt="Dell Alienware M15 Ryzen"><br/>

Với sự đa dạng các cổng kết nối này, nó đáp ứng tốt mọi nhu cầu công việc, giải trí của người dùng. Ngoài ra, Dell còn trang bị kết nối chuẩn Wi-Fi 6 và Bluetooth 5.1. Người dùng chỉ mất tốc độ 1.720 Mb / giây để nhận dữ liệu và 1.540 Mb / giây để gửi dữ liệu.

 <br/>

<b>Bàn phím và Bàn di chuột </b><br/>
Bàn phím của Alienware M15 R5 được đánh giá mang lại trải nghiệm khá tốt cho các game thủ. Các phím có lực cản đáng chú ý khi nhấn, hành trình phím 1,7mm mang lại phải hồi nhanh cho người dùng.

                                    <br/>                                                                                                                              

Bên cạnh đó, các phím điều khiển âm thanh của Alienware nằm ở hàng xa nhất bên phải của bàn phím thay vì được ánh xạ tới hàng Fn như các chức năng phụ. Thay vào đó, các phím Page Up và Page Down thường được tìm thấy có các chức năng phụ trên các phím mũi tên. 

 <br><img src="https://laptopaz.vn/media/product/2050_7.jpg" alt="Dell Alienware M15 Ryzen"><br/>

Bàn di chuột có kích thước 4.1 x 2.4 inch mang lại trải nghiệm không quá xuất sắc. Mặc dù nó mang lại trải nghiệm đa nhiệm chính xác và mượt mà khi cuộn bằng một ngón tay hay vuốt lên, vuốt xuống.

 
<br><img src="https://laptopaz.vn/media/product/2050_1.jpg" alt="Dell Alienware M15 Ryzen"><br/>
Dell Alienware M15 R5 có hiệu năng khoẻ <br/>
Cấu hình Alienware M15 R5 được trang bị bộ vi xử lý CPU AMD Ryzen 7 5800H, GPU máy tính xách tay RTX 3060, RAM 16GB, SSD tối đa là 512GGB. Người dùng có thể nâng cấp CPU của máy tính xách tay này lên Ryzen 9 5900HX, có cùng số luồng nhưng tăng lên đến 4,6 GHz và GPU của nó thành thẻ máy tính xách tay RTX 3070. Các tùy chọn bộ nhớ từ 16GB đến 32GB, và SSD 1TB.

 <br><img src="https://laptopaz.vn/media/product/2050_3.jpg" alt="Dell Alienware M15 Ryzen"><br/>
<br/>
Mặc dù Alienware là một thương hiệu chơi game, nhưng việc sử dụng chip AMD 45W sẽ mở ra cho Alienware M15 R5 năng suất cao.  Trên Geekbench 5, một bài kiểm tra tổng hợp để theo dõi hiệu suất PC nói chung, Dell Alienware M15 R5 đạt 1.427 điểm trong các bài kiểm tra đơn lõi và 7.288 điểm trong các bài kiểm tra đa lõi. Mặc dù điểm số lõi đơn của nó ở mức thấp hơn khi so sánh với 1.576 điểm của Asus TUF Dash F15 và 1.483 điểm của Acer Predator Triton 300 SE, Alienware đã thổi bay những chiếc máy tính xách tay đó về điểm số đa lõi. Điểm đa lõi của Asus là 5.185, trong khi điểm đa lõi của Acer là 5.234.  
<br/>
 <br><img src="https://laptopaz.vn/media/product/2050_6.jpg" alt="Dell Alienware M15 Ryzen"><br/>

Tuy nhiên, về khả năng truyền tải tệp tin thì Alienware M15 R5 được đánh giá là yếu hơn so với người tiền nhiệm. Điểm chuẩn truyền tệp 256GB cho tốc độ 874,14 MBps, trong khi Asus đạt 1.052,03 MBps và Acer đạt 993,13 MBps. M15 R5 đạt tốc độ 1137,34 MBps. Tuy nhiên, nó lại là ứng cử viên nhanh nhất trong thử nghiệm mã hóa video Handbrake. Chỉ mất 7 phút 05 giây để máy tính chuyển mã video 4K xuống FHD Trong khi Asus mất 10:41 và Acer thậm chí còn chậm hơn vào lúc 11:36. 

 
<br><img src="https://laptopaz.vn/media/product/2050_5.jpg" alt="Dell Alienware M15 Ryzen"><br/>
Về khả năng chơi game, máy chạy mượt một số trò chơi đòi hỏi khắt khe ở cài đặt cao nhất. Cụ thể trên Red Dead Redemption 2 đã đạt được 63 khung hình mỗi giây. Shadow of the Tomb Raider chạy với tốc độ khoảng 80 khung hình / giây với tính năng tạo bóng theo dõi tia và bật DLSS. Horizon Zero Dawn chạy với tốc độ trung bình 68 khung hình / giây. Không ai trong số họ gần như tận dụng hoàn toàn tốc độ làm mới 165Hz của màn hình 1080p mặc định, nhưng hầu hết mọi người có thể có các trò chơi cũ hơn trong thư viện của họ có thể hiển thị ở tốc độ khung hình rất nhanh trên máy tính xách tay này.

 <br><img src="https://laptopaz.vn/media/lib/2050_8s.jpg" alt="Dell Alienware M15 Ryzen"><br/>

Bên cạnh đó là khả năng đồ hoạ, Dell Alienware M15 R5 cũng được đánh giá khá tốt khi nó chạy mượt các ứng dụng đồ hoạ 2D, 3D. Tuy nhiên, với các công việc đồ hoạ kỹ thuật chuyên nghiệp, cần nhiều tính toán thì nó chưa thực sự quá xuất sắc.
<br><img src="https://laptopaz.vn/media/lib/2050_8s.jpg" alt="Dell Alienware M15 Ryzen"><br/>
 

<b>Khả năng tản nhiệt của Dell Alienware M15 R5</b><br/>
Nhiệt độ bề mặt của Alienware M15 R5 được đánh giá là mát mẻ trong quá trình sử dụng không chơi game nhưng nó có thể tăng lên ở các khu vực khác nhau. <br/>
Trong các bài thử nghiệm khả năng tản nhiệt, nhiệt độ đo được sau 15 phút phát video máy đạt 81,1 độ F. Điều này chỉ thấp hơn một chút so với nhiệt độ trung tâm của bàn phím, vì người gõ phím đạt 85,5 độ F ở giữa các phím G và H. Phần đáy của máy tính xách tay ấm hơn, đạt 90,9 độ, mặc dù phần giữa bên trái của bản lề màn hình là nơi nóng nhất, nhiệt độ lên tới 101,1 độ F. 

 <br><img src="https://laptopaz.vn/media/lib/2050_8s.jpg" alt="Dell Alienware M15 Ryzen"><br/>
<br/>
Trong thử nghiệm chơi game cho thấy nhiệt độ tăng nhẹ ở tất cả các khu vực ngoại trừ đáy và bản lề. Bàn di chuột là 83,3 độ F và tâm bàn phím là 90,9 độ F. Ngược lại, đáy của máy tính xách tay lúc này là 121,5 độ F và vùng nóng trên bản lề hiện là 136,1 độ F. Đối với một chiếc laptop gaming thì nhiệt độ này được đánh giá là khá mát.

 
<br><img src="https://laptopaz.vn/media/product/2050_5.jpg" alt="Dell Alienware M15 Ryzen"><br/>
<b>Thời lượng pin của Dell Alienware M15 R5</b> <br/>
Alienware M15 R5 là một chiếc laptop gaming tiêu hao năng lượng. Trong bài kiểm tra pin không chơi game cho thấy, khi người dùng liên tục phát video, duyệt web qua Wi-Fi ở độ sáng 150 nits, M15 R5 cho thời lượng pin là 4 giờ. So với các đối thủ như Asus TUF Dash F15 ( 6:32 giờ ) và Acer Predator Triton 300 SE ( 6:40 giờ) thì Dell Alienware M15 R5 được đánh giá là đuối hơn hẳn. 

 
<br/>
Máy được trang bị các ứng dụng thông minh
<br/>
Dell Alienware M15 R5 đi kèm với phần mềm và ứng dụng như như Alienware Command Center, cho phép bạn tùy chỉnh ánh sáng và nhiệt cũng như thiết lập macro. 
<br/>
Bên cạnh đó là ứng dụng Alienware Mobile Connect, cho phép bạn dễ dàng phản chiếu màn hình điện thoại, truyền tệp hoặc gọi điện từ máy tính xách tay của người dùng. Đây là một điểm mà mình đánh giá khá cao.

 
<br><img src="https://laptopaz.vn/media/product/2050_6.jpg" alt="Dell Alienware M15 Ryzen"><br/>
<b>Tổng kết </b><br/>
Nói tóm lại, Dell Alienware M15 R5 là chiến binh gaming cho hiệu năng vô cùng mạnh mẽ. Khi nó sở hữu con chip AMD mới nhất cùng card đồ hoạ RTX. Ngoài việc sở hữu thời lượng pin chưa được đánh giá cao thì tổng thể từ thiết kế cho đến hiệu năng, chiếc laptop gaming này được giới game thủ đánh giá khá cao. Nó là trợ thủ đắc lực cho những trận combat và trở thành chiếc máy tính đáng mua nhất hiện nay.', N'AMD Ryzen 7-5800H (8-Core, 20MB Total Cache, up to 4.4 GHz Max Boost Clock)', N'16GB DDR4 bus 3200 MHz (Nâng cấp tối đa 64GB)', N'SSD 256GB NVMe (Nâng cấp tối đa 2TB x 2)', N'NVIDIA® GeForce RTX™ 3060 6GB GDDR6', N'15.6" FHD WVA (Công nghệ hiển thị tương đương IPS) (1920 x 1080) 165Hz chống chói', N'HD 720P', N'1 x USB-C 3.2 Gen 2 (Hỗ trợ xuất hình DisplayPort 1.4),  3 x USB-A 3.2 Gen 1,  1 x HDMI 2.1,  1 x RJ-45,  1 x jack 3.5mm', N'2.69 kg', N'86 Wh', N'Windows 10', 0, N'/images/pictures/Dell_Alienware_M15_Ryzen_edition.JPG', CAST(N'2022-04-07 17:54:19.430' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (17, N'Dell G3-3590', 1007, CAST(25000000 AS Decimal(18, 0)), 10, CAST(22500000 AS Decimal(18, 0)), N'[Mới 99%] Dell G3-3590 i5-9300H, 8GB, 128GB + 1TB, VGA 4GB GTX 1650, 15.6'' FHD IPS
', N'Dell G3-3590 i5-9300H cũ tình trạng mới 99% giá siêu mềm đáp ứng mọi nhu cầu sử dụng của người dùng, đặc biệt là chơi game. Máy sở hữu cấu hình siêu mạnh từ vi xử lý thế hệ 9 của Intel, card đồ họa rời GTX 1650,... và còn nhiều thứ thú vị hơn nữa.
<br/>
Nổi bật, cá tính và tinh tế<br/>
Dell G3-3590 i5-9300H là một chiếc laptop gaming của Dell được thiết kế theo phong cách đơn giản nhưng đậm chất cá tính. Máy thừa hưởng toàn bộ những điểm mạnh trong thiết của Dell, đặc biệt là những đường nét mạnh mẽ và dứt khoát được bố trí khắp thân máy. Là một chiếc máy cũ nhưng Dell G3-3590 core i5 vẫn còn mới 99% không thua kém nhan sắc của 1 chiếc máy mới.
<br/>
<br><img src="https://laptopaz.vn/media/lib/1452_Dell-G3-3590-core-i5-cu1.jpg" alt="Dell G3-3590"><br/>
<br/>
Dell G3-3590 i5-9300H còn mới 99%, giá siêu mềm.
<br/>
Dell G3-3590 core i5 không quá hầm hố như 1 số laptop gaming, máy được thiết kế theo phong cách hiện đại, lịch lãm và tinh tế. Mỗi chi tiết trên G3-3590 core i5 đều được hoàn thiện tốt nhất, các đường viền với tone xanh xuyên suốt đã tạo được điểm nhấn và thu hút được người dùng.


<br><img src="https://laptopaz.vn/media/product/1452_51xoqovfpdl__ac_sl1438_.jpg" alt="Dell G3-3590"><br/>
Dell G3-3590 core i5 chỉ nặng 2,34 kg và dày 2,16 cm nhỏ gọn có thể đem đến bất kỳ nơi đâu, phục vụ bất kỳ nhu cầu nào của người dùng.
<br/>
Dell G3-3590 core i5 tốc độ vượt trội, sức mạnh tuyệt vời<br/>
Máy tính Dell G3-3590 core i5 sử dụng con chip core i5 mạnh mẽ thế hệ 9 trong đó có 4 lõi với 8 luồng cho xung nhịp tối đa lên đến 4,1 GHz. Ngoài ra, máu còn đi kèm RAM 8GB chuẩn DDR4, ổ cứng lai SSD 128GB và HDD 1TB đáp ứng mọi tác vụ của người dùng như: làm việc, giải trí, thiết kế đồ họa, lập trình,...
<br/>
Đặc biệt, nếu bạn là người yêu thích chơi game và không có điều kiện mua 1 chiếc máy mới thì Dell G3-3590 core i5 chính là lựa chọn tuyệt vời nhất.


<br><img src="https://laptopaz.vn/media/product/1452_41cawague3l__ac_.jpg" alt="Dell G3-3590"><br/><br/>
Dell G3-3590 core i5 nhỏ nhắn nhưng rất mạnh mẽ.
<br/>
Khi chơi game, đến giai đoạn quan trọng và muốn giải phóng hiệu năng tối đa của Dell G3-3590 core i5 chỉ cần nhấn vào phím F7. Lập tức chế độ hiệu năng cao nhất trong game sẽ được kích hoạt mà không phải thoát game để thực hiện. Điều này đem lại rất nhiều thuận tiện trong quá trình chơi game và đặc biệt luôn giữ cho máy có nhiệt độ ổn định để không làm ảnh hưởng đến tuổi thọ của phần cứng. Nhấn F7 1 lần nữa để trở về trạng thái bình thường để tiết kiệm năng lượng với các tác vụ thông thường.

<br><img src="https://laptopaz.vn/media/lib/1452_Dell-G3-3590-core-i5-cu3.jpg" alt="Dell G3-3590"><br/>

Phím tắt giúp nâng cao hiệu suất của Dell G3-3590 core i5
<br/>
Dell G3-3590 core i5 - xử lý đồ họa xuất sắc<br/>
Ngoài sức mạnh đến từ con chip core i5-9300H, Dell G3-3590 còn được tích hợp card đồ họa rời NVIDIA GeForce GTX 1650 4GB. Đây là card đồ họa nổi tiếng của NVIDIA được thiết kế đem đến hiệu suất đột phá cho thiết bị. Khả năng xử lý đồ họa của loại card này được đánh giá rất cao, các tựa game đồ họa nặng không thể làm khó được.
<br/>

<br><img src="https://laptopaz.vn/media/product/1452_61zgofejggl__ac_sl1500_.jpg" alt="Dell G3-3590"><br/>
Khả năng xử lý đồ họa của Dell G3-3590 core i5 xuất sắc.
<br/>
Dù chỉ là chiếc máy cũ nhưng sức mạnh của Dell G3-3590 core i5 không hề bị giảm sút so với máy mới.
<br/>
Làm mát nhanh, hiệu quả<br/>
Dell đã trang bị cho Dell G3-3590 core i5 hệ thống làm mát với quạt kép kích thước lờn giúp nhiệt được thoát ra nhanh chóng đảm bảo độ bền cho CPU và GPU. Khu vực thoát nhiệt được thiết kế rất thông minh góp phần đưa nhiệt ra ngoài nhanh chóng và đảm bảo hiệu năng luôn đạt được mức cao nhất khi người dùng sử dụng trong thời gian dài, chạy các ứng dụng nặng hoặc chơi game.
<br/>
<br><img src="https://laptopaz.vn/media/lib/1452_Dell-G3-3590-core-i5-cu4.jpg" alt="Dell G3-3590"><br/>
Dell G3-3590 core i5 sở hữu hệ thống tản nhiệt thông minh.

<br/>
Sống động, chi tiết và chân thực
Đó là những điều chúng tôi muốn nói đến màn hình Dell G3-3590 core i5. Máy được trang bị màn full HD 15,6 inch và sử dụng tấm nền chống chói giúp quá trình sử dụng ngược sáng luôn diễn ra thuận lợi.
<br/>
Laptop Dell G3-3590 core i5 được giới chuyên môn đánh giá rất cao khi sử dụng công nghệ chống lóa mới giúp hình ảnh luôn được hiển thị sắc nét, chân thực và sống động. Ngoài ra, máy còn được tích hợp hệ thống loa kép sử dụng âm thanh 3D nahimic đem đến âm thanh to, rõ ràng. Người dùng sẽ cảm nhận rõ điều này khi chơi game hoặc xem các tựa game hành động.
<br/>
<br><img src="https://laptopaz.vn/media/lib/1452_Dell-G3-3590-core-i5-cu5.jpg" alt="Dell G3-3590"><br/><br/>
Màn hình Dell G3-3590 i5 có khả năng hiển thị tuyệt vời.
<br/>
Hội tụ đầy đủ các điều kiện lý tưởng để chơi game
Bàn phím có 4 phím chuyên dụng WSAD high light giúp di chuyển nhanh hơn, sử dụng công nghệ SmartByte giúp tăng tốc độ băng thông và đầy đủ các kết nối thông dụng để kết nối thiết bị ngoại vi. Tất cả đều hỗ trợ người dùng có thể hoàn thành xuất sắc công việc và được trải nghiệm những phút giây chơi game tuyệt vời nhất.

 <br/>

Bàn phím Dell G3-3590 i5


<br><img src="https://laptopaz.vn/media/product/1452_51xoqovfpdl__ac_sl1438_.jpg" alt="Dell G3-3590"><br/>
Các cổng kết nối trên cạnh phải.

<br/>
<br><img src="https://laptopaz.vn/media/product/1452_21klrkx01sl__ac_.jpg" alt="Dell G3-3590"><br/><br/>
Các cổng kết nối và cổng sạc trên cạnh trái.
<br/>
Thay vì mua một chiếc Dell G3-3590 core i5 mới đắt tiền thì hãy chọn Dell G3-3590 i5 cũ với mức giá hợp lý hơn mà hiệu năng vẫn như vậy. Liên hệ hotline .... để đặt mua Dell G3-3590 ngay hôm nay.', N'Intel® Core™ i5-9300H', N'8GB DDr4 2666MHz', N'SSD 128GB + HDD 1T', N'NVIDIA GTX 1650 4GB', N'15.6 inch FHD IPS', N'HD 720P', N'HDMI, USB 3.0, USB 2.0, LAN,  Bluetooth 4.0.', N'2.5 kg', N'6 Cells', N'Windows 10 bản quyền', 0, N'/images/pictures/Dell-G3-3590-core-i5.JPG', CAST(N'2022-04-08 08:33:14.143' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (19, N'Dell Gaming G15 5515 Ryzen 7-5800H', 1007, CAST(42000000 AS Decimal(18, 0)), 5, CAST(39900000 AS Decimal(18, 0)), N'[Mới 100%] Dell Gaming G15 5515 Ryzen 7-5800H, 16GB, 512GB, RTX 3060, 15.6'''' FHD 165Hz
', N'Nếu bạn là một fan cứng của Dell, thì bạn không thể bỏ lỡ thông tin: Dell đã chính thức ra mắt dòng máy tính chơi game chip AMD 5000 hoàn toàn mới (G15 Ryzen Edition). Một chiếc máy được mong chờ sẽ là phiên bản "hạt dẻ" của  Alienware nhưng sở hữu hiệu năng và thiết kế không thể chê vào đâu được. Hãy cùng LaptopAZ đi tìm hiểu chi tiết về chiếc máy này ngay thôi nào!

 
<br><img src="/images/pictures/dell_g5_5515_pic_1.JPG" alt="Dell Gaming G15 5515 Ryzen 7-5800H"><br/>
Thiết kế<br/>
Dell đã đổi tên gọi của dòng laptop gaming mới của mình là Dell Gaming G15.<br/>
<br><img src="/images/pictures/dell_g5_5515_pic_2.JPG" alt="Dell Gaming G15 5515 Ryzen 7-5800H"><br/>
Dòng Gaming G15 2021 mới của Dell có thiết kế hơi hướng dòng Gaming cao cấp Alienware.
<br/>
Lớp sơn hoàn thiện mới cứng cáp dễ chăm sóc và có sẵn ba màu Dark Shadow Grey, Specter Green  và Phantom Grey
<br/>
Ở phiên bản chạy chip AMD mới nhất có tên gọi là Dell Gaming G15 5515

 <br><img src="/images/pictures/dell_g5_5515_pic_3.JPG" alt="Dell Gaming G15 5515 Ryzen 7-5800H"><br/>
<br/>
Màn hình<br/>
Dell G15 5515 cũng sẽ có màn hình 15.6” Full HD 165Hz với độ sáng 300nits cao cấp.
<br/>
Màn hình có độ chuẩn màu cao cùng viền màn hình siêu mỏng hứa hẹn sẽ làm hài lòng mọi game thủ khó tính nhất.

 <br/>
<br><img src="/images/pictures/dell_g5_5515_pic_1.JPG" alt="Dell Gaming G15 5515 Ryzen 7-5800H"><br/>
Cấu hình<br/>
G15 AMD, được tích hợp APU Ryzen 7 5800H  45 W gồm tám lõi xử lý AMD Cezanne.
<br/>
APU Ryzen 7 5800H có xung cơ cơ sở 3.2 GHz có thể tăng xung tới 4,4 GHz
<br/>
G15 5515 dụng RAM có dung lượng 16GB, DDR4, 3200MHz
<br/>
Phiên bản G15 5515 được trang bị GPU GeForce RTX 3060 6GB biến thể 115W cao cấp hơn
<br/>
 <br><img src="/images/pictures/dell_g5_5515_pic_4.JPG" alt="Dell Gaming G15 5515 Ryzen 7-5800H"><br/>

Tản nhiệt<br/>
Thiết kế tản nhiệt lấy cảm hứng từ Alienware kết hợp hệ thống hút gió kép từ phía trên bàn phím và phía dưới của G15. Sau đó, không khí này được thoát ra ngoài qua bốn lỗ thông hơi nằm ở hai bên và phía sau để tối đa hóa luồng không khí qua các ống đồng để làm mát và tản nhiệt tối ưu.

 
<br/>
Những tiến bộ mới nhất về thiết kế tản nhiệt mang lại cho Dell G15 giúp máy mát hơn và luôn giữ được tốc độ xung nhịp cao khi chơi game cũng như chạy các ứng dụng nặng nhất.
<br/>
Công nghệ Game Shift: Tăng cường sức mạnh cho bạn khi việc chơi game trở nên quan trọng chỉ bằng một thao tác nhấn nút đơn giản. Game Shift được kích hoạt bằng cách nhấn FN + phím Game Shift và kích hoạt chế độ hiệu suất động trong Alienware Command Center bằng cách tối đa hóa tốc độ của quạt để giữ cho hệ thống của bạn luôn mát mẻ trong khi bộ xử lý hoạt động mạnh hơn.
<br/>
 <br><img src="/images/pictures/dell_g5_5515_pic_5.JPG" alt="Dell Gaming G15 5515 Ryzen 7-5800H"><br/>
<br/>
Âm thanh<br/>
G15 Gaming 5515 được trang bị loa kép với công nghệ 3D cho phép anh em nghe rõ mọi âm thanh trong Game hoàn hảo.
<br/>
Đèn nền RBG: bàn phím có đèn nền RBG 4 vùng tùy chọn với WASD được điều khiển bởi Trung tâm chỉ huy Alienware hoặc chỉ có LED đỏ (Tùy từng phiên bản)

 
<br><img src="/images/pictures/dell_g5_5515_pic_2.JPG" alt="Dell Gaming G15 5515 Ryzen 7-5800H"><br/>
Dung lượng Pin<br/>
Dell Gaming G15 5515 có Pin 6-Cell dung lượng 86WHr kèm công nghệ sạc nhanh.

 <br/>
<br><img src="/images/pictures/dell_g5_5515_pic_5.JPG" alt="Dell Gaming G15 5515 Ryzen 7-5800H"><br/><br/>
Cổng kết nối<br/>
Máy được trang bị đủ cổng kết nối cho phổ biến nhất cho Game thủ hiện nay
<br/>
1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI | 6. Power In | 7. RJ45 | 8. Headphones/Microphone

 
<br><img src="/images/pictures/dell_g5_5515_pic_4.JPG" alt="Dell Gaming G15 5515 Ryzen 7-5800H"><br/>
<b>Tổng Kết:</b> So với những chiếc máy trong cùng phân khúc, chiếc máy này có hiệu năng và thiết rất đáng để đầu tư, không những vậy nó sẽ là trợ thủ rất đắc lực của bạn để có thể chìm đắm trong những trận game kinh điển.', N'AMD Ryzen™ 7 5800H 8-core/16-thread - (3.2 GHz up 4.40 GHz) L3 Cache 16MB TDP45W', N'16GB DDR4 3200MHz', N'512GB M.2 2280 PCIe NVMe', N'NVIDIA® GeForce RTX™ 3060 6GB GDDR6', N'15.6 inch FHD (1920 x 1080) 165Hz 300 nits WVA Anti- Glare LED Backlit Narrow Border Display', N'HD 720P', N' 1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI | 6. Power In | 7. RJ45 Ethernet | 8. Headphones/Microphone', N'2.57kg', N'6-Cell Battery, 86WHr', N'Windows 10 bản quyền', 0, N'/images/pictures/dell_g5_5515_pic_layout.JPG', CAST(N'2022-04-08 09:00:03.310' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (20, N'Dell Gaming G5 15 5511', 1007, CAST(42000000 AS Decimal(18, 0)), 8, CAST(38640000 AS Decimal(18, 0)), N'[Mới 100%] Dell Gaming G5 15 5511 (Core i7-11800H, 16GB, 512GB, RTX 3060, 15.6'''' FHD 165Hz)', N'<b>Tại sao bạn nên chọn Dell Gaming G5 15 5511?</b><br/>
Dell đã chính thức làm mới dòng Gaming G-Series của mình với thiết kế và tên hoàn toàn mới
<br/>
Dell Gaming G5 15 5511 - Máy tính chơi game mới nhất 2021


<br/><img src="/images/pictures/dell_g5_5511_pic_1.JPG" alt="Dell Gaming G5 15 5511"><br/>
Thiết kế<br/>
Dell đã đổi tên gọi của dòng laptop gaming mới của mình là Dell Gaming G5 15 5511.
<br/>
Dòng Gaming G5 15 2021 mới của Dell có thiết kế hơi hướng dòng Gaming cao cấp Alienware.
<br/>
Lớp sơn hoàn thiện mới cứng cáp dễ chăm sóc và có sẵn ba màu Dark Shadow Grey, Specter Green  và Phantom Grey

<br/><img src="/images/pictures/dell_g5_5511_pic_4.JPG" alt="Dell Gaming G5 15 5511">
<br/>
Màn hình<br/>
Dell G5 5511 cũng sẽ có màn hình tiêu chuẩn 15.6” Full HD 165Hz với độ sáng 250 nits. Kết Hợp với viền mỏng Narrow Border đem đến cho người dùng cảm giác sang trọng, thanh lịch nhưng không kém phần gai góc của một chiếc Dell Gaming.


<br/><img src="/images/pictures/dell_g5_5511_pic_1.JPG" alt="Dell Gaming G5 15 5511"><br/>
Cấu hình<br/>
G5 5510 sử dụng vi xử lý thế hệ 11 hiệu năng cao là Core i7-11800H (Tiger Lake-H45)
<br/>
G5 5511 sử dụng RAM DDR4 16GB và có bus 2,933MH.
<br/>
Phiên bản G5 5511 sẽ có card đồ hoạ rời là Nvidia Geforce GTX 1650 4GB hoặc RTX 3060 6GB biến thể 115W cao cấp hơn.


<br/><img src="/images/pictures/dell_g5_5511_pic_3.JPG" alt="Dell Gaming G5 15 5511"><br/>
Tản nhiệt<br/>
Thiết kế tản nhiệt lấy cảm hứng từ Alienware kết hợp hệ thống hút gió kép từ phía trên bàn phím và phía dưới của G5 5511. Sau đó, không khí này được thoát ra ngoài qua bốn lỗ thông hơi nằm ở hai bên và phía sau để tối đa hóa luồng không khí qua các ống đồng để làm mát và tản nhiệt tối ưu.
<br/>
Những tiến bộ mới nhất về thiết kế tản nhiệt mang lại cho Dell G5 5511 giúp máy mát hơn và luôn giữ được tốc độ xung nhịp cao khi chơi game cũng như chạy các ứng dụng nặng nhất. 
<br/>
Công nghệ Game Shift: Tăng cường sức mạnh cho bạn khi việc chơi game trở nên quan trọng chỉ bằng một thao tác nhấn nút đơn giản. Game Shift được kích hoạt bằng cách nhấn FN + phím Game Shift và kích hoạt chế độ hiệu suất động trong Alienware Command Center bằng cách tối đa hóa tốc độ của quạt để giữ cho hệ thống của bạn luôn mát mẻ trong khi bộ xử lý hoạt động mạnh hơn.

<br/><img src="/images/pictures/dell_g5_5511_pic_2.JPG" alt="Dell Gaming G5 15 5511">
<br/>
Âm thanh<br/>
G5 Gaming 5511 được trang bị loa kép với công nghệ 3D cho phép anh em nghe rõ mọi âm thanh trong Game hoàn hảo.
<br/>
Đèn nền RBG: bàn phím có đèn nền RBG 4 vùng tùy chọn với WASD được điều khiển bởi Trung tâm chỉ huy Alienware.
<br/>
Dung lượng Pin<br/>
Dell Gaming G15 5511 sẽ có phiên bản dung lượng 56Wh và 86Wh kèm công nghệ sạc nhanh.


<br/><img src="/images/pictures/dell_g5_5511_pic_4.JPG" alt="Dell Gaming G5 15 5511"><br/>
Cổng kết nối<br/>
Máy có nhiều cổng kết nối cơ bản nhất cho anh em tiện sử dụng. 
<br/>
SuperSpeed USB 2.0 | 2. SuperSpeed USB 2.0 with PowerShare) | 4. SuperSpeed USB 3.2 l 5. HDMI | 6. Giắc nguồn | 7. RJ45 | 8. Headphones/mic


<br/><img src="/images/pictures/dell_g5_5511_pic_1.JPG" alt="Dell Gaming G5 15 5511"><br/>
Kích thước Dell G5 5511
Chiều cao: 23,3mm | 2. Chiều rộng: 357,2mm | 3. Chiều sâu: 272,8mm

Trọng lượng khởi điểm: 2,65 kg

<b>Kết luận:</b> Dell Gaming G5 15 5511 là một trong những sự lựa chọn hàng đầu của dòng máy Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng không kém phần tinh tế, kết hợp cùng cấu hình mạnh mẽ và tản nhiệt mát mẻ, Dell Gaming G5 15 5511 tự tin có thể chinh phục được đa số các Game Online, Offline thời thượng hiện nay. Hơn thế nữa Dell Gaming G5 15 5511 cũng đủ sức đáp ứng các tác vụ thiết kế đồ họa, công việc, giải trí một cách mượt mà nhất. ', N'Intel® Core™ i7-11800H', N'16GB DDR4 2933MHz', N'512GB M.2 PCIe NVMe Solid State Drive', N'NVIDIA® GeForce® RTX 3060 6GB GDDR6', N'15.6 inch FHD (1920 x 1080), 250nits 165Hz WVA Anti- Glare LED Backlit Narrow Border Display', N'HD RGB camera with digital-array microphones', N'SuperSpeed USB 2.0 | 2. SuperSpeed USB 2.0 with PowerShare) | 4. SuperSpeed USB 3.2 l 5. HDMI | 6. Giắc nguồn | 7. RJ45 | 8. Headphones/mic', N'2.65 kg', N'4-Cell, 86WHr', N'Windows 10 bản quyền', 0, N'/images/pictures/dell_g5_5511_pic_layout.JPG', CAST(N'2022-04-08 09:11:01.767' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (21, N'Dell Gaming G5 15 5510', 1007, CAST(35000000 AS Decimal(18, 0)), 10, CAST(31500000 AS Decimal(18, 0)), N'[Mới 100%] Dell Gaming G5 15 5510 (Core i7-10870H, 16GB, 512GB, RTX 3060, 15.6'''' FHD 120Hz)', N'<b>Tại sao bạn nên chọn Dell Gaming G5 15 5510?</b><br/><br/>
Dell đã chính thức làm mới dòng Gaming G-Series của mình với thiết kế và tên hoàn toàn mới
<br/><br/>
Dell Gaming G5 15 5510 - Máy tính chơi game mới nhất 2021
<br/>

<br/><img src="/images/pictures/dell_g5_5510_pic_1.JPG" alt="Dell Gaming G5 15 5510"><br/><br/>
Thiết kế<br/>
Dell đã đổi tên gọi của dòng laptop gaming mới của mình là Dell Gaming G5 15 5510.
<br/>
Dòng Gaming G5 15 2021 mới của Dell có thiết kế hơi hướng dòng Gaming cao cấp Alienware.
<br/>
Lớp sơn hoàn thiện mới cứng cáp dễ chăm sóc và có sẵn ba màu Dark Shadow Grey, Specter Green  và Phantom Grey

<br/><img src="/images/pictures/dell_g5_5510_pic_2.JPG" alt="Dell Gaming G5 15 5510"><br/>

Màn hình<br/>
Dell G5 5510 cũng sẽ có màn hình tiêu chuẩn 15.6” Full HD 120Hz với độ sáng 250 nits. Kết Hợp với viền mỏng Narrow Border đem đến cho người dùng cảm giác sang trọng, thanh lịch nhưng không kém phần gai góc của một chiếc Dell Gaming.


<br/><img src="/images/pictures/dell_g5_5510_pic_3.JPG" alt="Dell Gaming G5 15 5510"><br/>
Cấu hình<br/>
G5 Intel, tuy nhiên lại vẫn tiếp tục sử dụng vi xử lý Comet Lake H thế hệ 10 là Intel Core i7-10870H.
<br/>
Đáng tiếc là phần cứng thế hệ 11 hiệu năng cao là (Tiger Lake-H45) vẫn chưa được đem lên Dell G5 5510 năm nay.
<br/>
G5 5510 sử dụng RAM DDR4 và có bus 2,933MH.
<br/>
Phiên bản G5 5510 sẽ có card đồ hoạ rời là Nvidia Geforce GTX 1650 4GB hoặc RTX 3060 6GB biến thể 115W cao cấp hơn.
<br/><img src="/images/pictures/dell_g5_5510_pic_4.JPG" alt="Dell Gaming G5 15 5510"><br/>
<br/>

Tản nhiệt<br/>
Thiết kế tản nhiệt lấy cảm hứng từ Alienware kết hợp hệ thống hút gió kép từ phía trên bàn phím và phía dưới của G5 5510. Sau đó, không khí này được thoát ra ngoài qua bốn lỗ thông hơi nằm ở hai bên và phía sau để tối đa hóa luồng không khí qua các ống đồng để làm mát và tản nhiệt tối ưu.

<br/><img src="/images/pictures/dell_g5_5510_pic_3.JPG" alt="Dell Gaming G5 15 5510"><br/>

Những tiến bộ mới nhất về thiết kế tản nhiệt mang lại cho Dell G5 5510 giúp máy mát hơn và luôn giữ được tốc độ xung nhịp cao khi chơi game cũng như chạy các ứng dụng nặng nhất. 
<br/>
Công nghệ Game Shift: Tăng cường sức mạnh cho bạn khi việc chơi game trở nên quan trọng chỉ bằng một thao tác nhấn nút đơn giản. Game Shift được kích hoạt bằng cách nhấn FN + phím Game Shift và kích hoạt chế độ hiệu suất động trong Alienware Command Center bằng cách tối đa hóa tốc độ của quạt để giữ cho hệ thống của bạn luôn mát mẻ trong khi bộ xử lý hoạt động mạnh hơn.


<br/><img src="/images/pictures/dell_g5_5510_pic_5.JPG" alt="Dell Gaming G5 15 5510"><br/>
Âm thanh<br/>
G5 Gaming 5510 được trang bị loa kép với công nghệ 3D cho phép anh em nghe rõ mọi âm thanh trong Game hoàn hảo.
<br/>
Đèn nền RBG: bàn phím có đèn nền RBG 4 vùng tùy chọn với WASD được điều khiển bởi Trung tâm chỉ huy Alienware hoặc chỉ có LED đỏ (Tùy từng phiên bản)

<br/>

Dung lượng Pin<br/>
Dell Gaming G15 5510 sẽ có phiên bản dung lượng 56Wh và 86Wh kèm công nghệ sạc nhanh.


<br/><img src="/images/pictures/dell_g5_5510_pic_1.JPG" alt="Dell Gaming G5 15 5510"><br/>
Cổng kết nối<br/>
Máy có nhiều cổng kết nối cơ bản nhất cho anh em tiện sử dụng. Điều đáng tiếc là trên phiên bản chạy GPU GTX 1650 lại bị lược bỏ cổng Type C có khả năng xuất hình.

<br/><img src="/images/pictures/dell_g5_5510_pic_3.JPG" alt="Dell Gaming G5 15 5510"><br/>
<br/>
SuperSpeed USB 2.0 | 2. SuperSpeed USB 2.0 with PowerShare) | 4. SuperSpeed USB 3.2 l 5. HDMI | 6. Giắc nguồn | 7. RJ45 | 8. Headphones/mic

<br/>

Kích thước Dell G5 5510<br/>
Chiều cao: 23,3mm | 2. Chiều rộng: 357,2mm | 3. Chiều sâu: 272,8mm
<br/>
Trọng lượng khởi điểm: 2,65 kg', N'Intel® Core™ i7-10870H', N'16GB DDR4 2933MHz', N'512GB M.2 PCIe NVMe Solid State Drive', N'NVIDIA® GeForce® RTX 3060 6GB GDDR6', N'15.6 inch FHD (1920 x 1080), 250nits 120Hz WVA Anti- Glare LED Backlit Narrow Border Display', N'HD RGB camera with digital-array microphones', N'SuperSpeed USB 2.0 | 2. SuperSpeed USB 2.0 with PowerShare) | 4. SuperSpeed USB 3.2 l 5. HDMI | 6. Giắc nguồn | 7. RJ45 | 8. Headphones/mic', N'2.65 kg', N'3-Cell, 56WHr', N'Windows 10 bản quyền', 0, N'/images/pictures/dell_g5_5510_pic_layout.JPG', CAST(N'2022-04-08 09:20:01.847' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (22, N'Dell Gaming G7 7700', 1007, CAST(41000000 AS Decimal(18, 0)), 2, CAST(40180000 AS Decimal(18, 0)), N'[Mới 99%] Dell Gaming G7 7700 (Core i7-10750H, 16GB, 512GB, RTX 2070, 17.3 FHD 300Hz)', N'<br/><b>THIẾT KẾ HẦM HỐ HƠN</b><br/>
Máy đã được thu gọn đi, kích thước nhẹ hơn nhưng không kém phần hầm hố so với 2019<br/>
<br/><img src="/images/pictures/dell_g7_7700_pic_1.JPG" alt="Dell Gaming G7 7700"><br/>
Phần bản lề của G7 7700 giờ đây với thiết kế mới hơn để lộ một phần không gian với màn hình trông nó có chút gì hiện đại, độc đáo hơn hẳn
<br/>
Về kích thước cũng như cân nặng thì dường như vẫn tương tự như phiên bản 2019. Máy có cân nặng 3.2Kg cùng kích thước 2290mm x 398mm x 19.3mm
<br/>
Về Logo Dell cũng có chút sự thay đổi thay vì như năm ngoái chỉ là viền màu xanh quanh logo thì giờ đây sẽ là màu đa sắc khi thay đổi góc độ bản lề.
<br/>
<br/><img src="/images/pictures/dell_g7_7700_pic_2.JPG" alt="Dell Gaming G7 7700"><br/>
<br/>
MÀN HÌNH<br/>
Về phần màn hình năm nay Dell G7 7700 sẽ được trang bị 17.3 inch FHD (1920 x 1080) 300 nits WVA Anti-Glare LED Backlit Display với tần số quét 300Hz 

<br/><img src="/images/pictures/dell_g7_7700_pic_3.JPG" alt="Dell Gaming G7 7700"><br/>
<br/>
Điểm đáng tiếc là dòng G7 7700 sẽ không được trang bị tấm nền UHD như trên đàn em G7 7500.
<br/>
Tuy là một chiếc máy Gaming nhưng chất lượng hiển thị trên Dell G7 7700 cũng tương đối tốt với điểm số đo được đạt được khoảng 95% sRGB, 75% DCI-P3 và Delta E sẽ tầm khoảng 1.2.
<br/>
Có thể thấy màu sắc trên Dell G7 7700 cũng đủ để bạn có thể làm việc với các phần mềm thiên về đồ hoạ hay thiết kế với màu sắc được cho ra khá chân thực với độ chi tiết tốt.
<br/>
CỔNG KẾT NỐI ĐA NĂNG<br/>
Vẫn rất đầy đủ các cổng cho nhu cầu của bạn<br/>

<br/><img src="/images/pictures/dell_g7_7700_pic_4.JPG" alt="Dell Gaming G7 7700"><br/>
<br/>
1. Standard SD card 	6. USB 3.2 
2. USB 3.2	7. RJ-45 1×1 Gigabit Ethernet Port on 1650Ti (RJ-45 Killer Networks E2500V2 Gigabit Ethernet Port on 1660 Ti and above)
3. Thunderbolt 3 USB 3.2 Gen 2 Type-C® (USB-C DisplayPort Alt-Mode on NVIDIA® GeForce® GTX 1650Ti GPU option)	8. Power-in
4. MiniDP 1.4 (on NVIDIA® GeForce® GTX 1660Ti and RTX GPU options)	9. USB 3.2 Gen 1 with PowerShare
5. HDMI 2.0	10. Headset jack
BÀN PHÍM VÀ TOUCHPAD<br/>
Về phần bàn phím năm nay trên G7 7700 vẫn cho cảm giác gõ tương đối tốt và với kích thước 17 inch thì layout bàn phím cũng sẽ hỗ trợ dãy phím số cho thích hợp với màn hình<br/>
<br/><img src="/images/pictures/dell_g7_7700_pic_5.JPG" alt="Dell Gaming G7 7700"><br/>


Bàn phím với cơ chế 4 khu vực màu LED sRGB
<br/>
Với các điểm nhấn màu bạc cùng hệ thống bàn phím RGB 4 vùng với WASD, hệ thống chiếu sáng khung máy, Dell G7 7500 2020 được thiết kế để nâng cao trải nghiệm chơi game cho bạn
<br/>
Game Shift: Tăng sức mạnh cho máy chỉ với một nút bấm. Nghe như nút Nitro tăng tốc.
<br/>
<br/><img src="/images/pictures/dell_g7_7700_pic_2.JPG" alt="Dell Gaming G7 7700"><br/>
<br/>
Nút nhấn này sẽ được kích hoạt trong chế độ hiêu suất của Alienware Command Center bằng cách tối đa tốc độ quạt để giữ hệ thống của bạn luôn mát mẻ nhằm tăng hiệu suất tản nhiệt giữ máy luôn duy trì tốc độ ổn định.
<br/>
CẤU HÌNH TRÊN DELL G7 17 7700 <br/>
<br/><img src="/images/pictures/dell_g7_7700_pic_4.JPG" alt="Dell Gaming G7 7700"><br/>
<br/>
CPU<br/>
 Laptop Dell G7 17 7700 sở hữu bộ xử lý Intel Core đời 10 mới nhất 10th Generation Intel Core i7-10750H (12MB Cache, up to 5.0 GHz, 6 cores)
Giờ đây bạn có thể tận hưởng hiệu suất mạnh mẽ mà không làm gián đoạn việc chơi game hay làm việc của mình
<br/><img src="/images/pictures/dell_g7_7700_pic_1.JPG" alt="Dell Gaming G7 7700"><br/>
Tự tin sáng tạo với CPU mạnh mẽ và Card đồ họa rời như tạo dựng nội dung video, chỉnh sửa ảnh và Livestream trong khi chơi game.
<br/>
RAM, SSD<br/>
Chiếc Laptop Gaming này có hai khe cắm RAM hỗ trợ bus 2933Hz. Ổ SSD NVMe 512GB được lắp đặt trên máy 
<br/>
Cụ thể với việc mở 40 tab Google Chrome và 5 video YouTube 1080p trong khi Shadow of the Tomb Raider chạy ở chế độ nền mà không bị chậm.
<br/>
GPU<br/>
Phiên bản Dell G7 7500 này sẽ được trang bị  GPU Nvidia GeForce mạnh mẽ NVIDIA® GeForce RTX™ 2070 8GB GDDR6
<br/>
Với card đồ họa thuộc thế hệ Turing (nVIDIA), Dell G7 17 7700 sẽ hỗ trợ VR (thực tế ảo) và Ray Tracing. Các tính năng này giúp mọi hình ảnh trong game trở nên chân thật nhất có thể, đem đến trải nghiệm gaming tốt nhất.
<br/>
CÁC CÔNG NGHỆ KHÁC ĐƯỢC TRANG BỊ<br/>
TẢN NHIỆT<br/>
<br/>
<br/><img src="/images/pictures/dell_g7_7700_pic_6.JPG" alt="Dell Gaming G7 7700"><br/>
Dell Gaming G7 17 7700 có hệ thống làm mát quạt kép để giúp tản nhiệt ra ngoài và giữ cho hệ thống của bạn luôn nhạy và mát khi chơi game cường độ cao.
<br/>
HỆ THỐNG ÂM THANH<br/>
Âm thanh sống động với Loa kép và nahimic 3D cho khả năng thu lại âm thanh bằng radar âm thanh hình ảnh để bạn có thể định vị âm thanh trong trò chơi và phản ứng trong thời gian thực.
<br/><img src="/images/pictures/dell_g7_7700_pic_1.JPG" alt="Dell Gaming G7 7700"><br/><br/>
Tăng tốc tối đa: Killer Gigabit Ethernet tùy chọn đảm bảo tốc độ cực nhanh và giảm thiểu độ trễ để lưu lượng mạng thông suốt.
<br/>
ALIENWARE COMMAND CENTER<br/>
<br/>
Với việc tạo ra phần mềm được thiết kế đặc biệt để cải thiện trải nghiệm chơi trò chơi của bạn, tinh chỉnh tất cả cài đặt trò chơi và hệ thống của bạn, giải quyết vấn đề và quản lý thời gian.', N'Intel® Core™ i7-9750H', N'16GB DDR4 Bus 2666MHz', N'SSD 256GB + HDD 1TB ', N'NVIDIA GTX 1660Ti 6GB', N'17.3 inch FHD (1920x1080)', N'HD 720P', N' USB 3.0 ', N'2.7 kg', N'2-3 Giờ', N'Windows 10 bản quyền', 0, N'/images/pictures/dell_g7_7700_pic_layout.JPG', CAST(N'2022-04-08 09:29:04.183' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (23, N'MSI Bravo 15 B5DD 010US', 1008, CAST(27000000 AS Decimal(18, 0)), 10, CAST(24300000 AS Decimal(18, 0)), N'[Mới 100%] MSI Bravo 15 B5DD 010US (Ryzen 5-5600H, 16GB, 512GB, Radeon RX5500M, 15.6'''' FHD 144Hz)', N'<br/><b>Laptop MSI Bravo 15 B5DD 010US Ryzen 5-5600H dành cho ai?</b><br/>

 <br/><img src="/images/pictures/msi_bravo_15_pic_1.JPG" alt="MSI Bravo 15 B5DD 010US"><br/>
<br/>
Laptop MSI Bravo 15 B5DD 010US là sản phẩm mới của nhà MSI thuộc dòng laptop gaming giúp người dùng có một chiếc máy chiến game hiệu năng cao nhưng vẫn giữ cho mình một thiết kế nhỏ gọn để tiện di chuyển ở mọi nơi. Hiệu năng mạnh mẽ với CPU thế hệ mới mang lại sức mạnh chiến game đỉnh cao cho các game thủ lựa chọn lí tưởng trong tầm giá.

 <br/>
<br/>
MSI Bravo 15 B5DD 010US sở hữu cấu hình ấn tượng với chip AMD Ryzen 5-5600H (3.30GHz upto 4.20GHz, 16MB), mang lại hiệu năng mạnh mẽ thỏa sức giải trí với các tựa game hot đồ họa cao, mượt mà và tiết kiệm điện năng.  RAM 16GB DDR4 3200MHz cho khả năng đa nhiệm mượt mà, sử dụng được nhiều ứng dụng cùng lúc, sử dụng Photoshop chuyên nghiệp hoặc dựng video, làm vlog trơn tru. SSD 512GB NVMe PCIe Gen3x4 không chỉ đem đến tốc độ vận hành nhanh, mở máy, vào game chỉ trong vài giây mà còn cho bạn không gian lưu trữ lớn, đủ để lưu trữ hàng trăm tựa game.
<br/>
<br/><img src="/images/pictures/msi_bravo_15_pic_2.JPG" alt="MSI Bravo 15 B5DD 010US"><br/>

AMD Radeon RX 5500M 4GB GDDR6 cho trải nghiệm chơi game mượt mà, hiệu ứng đồ họa đẹp mắt. Bạn có thể giải trí với những tựa game như GTA V, The Witcher 3, LOL, CS:GO, PUBG,... và các tác vụ thiết kế như Photoshop, render video, làm hình 3D ổn định.
<br/>
 
<br/>
MSI Bravo 15 B5DD 010US sở hữu màn hình viền mỏng trong thiết kế 15.6inch, độ phân giải FHD kết hợp tấm nền IPS và tần số quét 144Hz là những yếu tố mang lại chất lượng hình ảnh sắc nét, chi tiết, mượt mà với góc nhìn rộng cho game thủ. Lớp chống chói trên màn hình giúp chất lượng hình ảnh không bị thay đổi bởi cường độ ánh sáng cao, giảm độ mỏi mắt đem lại sự trải nghiệm vô cùng thú vị cho người dùng.
<br/>
 <br/><img src="/images/pictures/msi_bravo_15_pic_3.JPG" alt="MSI Bravo 15 B5DD 010US"><br/>

MSI Bravo 15 B5DD 010US gaming sở hữu hệ thống phím Chiclet keyboard with LED, layout thân thiện với người dùng, các phím có gờ nổi lên và làm lớn hơn giúp tăng độ chính xác khi nhấn phím, đây là điểm đặc biệt hữu ích cho các gamer. Đèn led dưới bàn phím cũng có thể giúp bạn gõ phím một cách chính xác trong điều kiện thiếu sáng. 
<br/>
 <br/><img src="/images/pictures/msi_bravo_15_pic_4.JPG" alt="MSI Bravo 15 B5DD 010US"><br/>

Để có thể chiến game trong thời gian dài chắc hẳn laptop phải có hệ thống tản nhiệt tốt để máy không bị nóng, dẫn đến quá tải. MSI Bravo 15 B5DD 010US mang đến giải pháp tản nhiệt chuyên dụng cho cả CPU và GPU với tối đa 6 ống dẫn nhiệt, hoạt động hài hòa bằng cách giảm thiểu nhiệt và tối đa hóa luồng không khí.

<br/><img src="/images/pictures/msi_bravo_15_pic_5.JPG" alt="MSI Bravo 15 B5DD 010US"><br/>

MSI Bravo 15 B5DD 010US có một cổng LAN RJ45, hai cổng Type-C USB 3.2 Gen 1, hai cổng Type-A USB 3.2 Gen 1 và một cổng HDMI, giúp kết nối cực kì dễ dàng.

 
<br/><img src="/images/pictures/msi_bravo_15_pic_6.JPG" alt="MSI Bravo 15 B5DD 010US"><br/><br/>
<b>Tổng Kết: </b>Trong phân khúc 21 triệu đồng, chiếc laptop MSI Bravo 15 B5DD 010US hoàn toàn xứng đáng có một chỗ đứng vững chắc, và là sự lựa chọn vô cùng hợp lý dành cho các bạn đang tìm kiếm những mẫu máy gaming trong phân khúc này. Hãy đến LaptopAZ ngay hôm nay để được trải nghiệm và lựa chọn những mẫu máy ưng ý nhất.', N'AMD Ryzen 5-5600H Processor (3.30GHz up to 4.20GHz, 16MB Cache)', N'16GB DDR4 3200MHz', N'512GB NVMe PCIe Gen3x4 SSD', N'AMD Radeon RX5500M 4GB GDDR6', N'15.6inch FHD (1920 x 1080), 144Hz 45%NTSC IPS-Level', N'HD 720P', N'1 x HDMI 1 x USB Type-C 2 x USB 3.1 1 x Jack Audio™ 1 x LAN RJ45 Gigabit 1 x Hi-Res Audio™ with Nahimic 3 Audio™ 1 x CoolerBoost 5 (2 Fans with 7 heat pipes)', N'2.35kg', N'3 cell, 52Whr', N'Windows 10 bản quyền', 0, N'/images/pictures/msi_bravo_15_pic_layout.JPG', CAST(N'2022-04-08 09:42:13.967' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (24, N'MSI Gaming GP66 Leopard 10UE-206VN', 1008, CAST(40000000 AS Decimal(18, 0)), 5, CAST(38000000 AS Decimal(18, 0)), N'[Mới 100%] MSI Gaming GP66 Leopard 10UE-206VN Core i7 10870H, 16GB, 1TB NVMe, RTX 3060 6GB, 15.6'' FHD 144Hz', N'<b>Laptop MSI Gaming GP66 Leopard 10UE-206VN – Laptop hiệu năng cao.</b><br/><br/>
Laptop MSI Gaming GP66 Leopard 10UE-206VN là một trong những dòng máy tính chiến game, đồ họa được ưa chuông nhất hiện nay. Laptop MSI gaming này sở hữu vẻ ngoài sành điệu, hiệu năng hoạt động mạnh mẽ, cấu hình siêu khủng, mức giá hấp dẫn.
<br/>
Sở hữu bộ vi xử lý Intel Core i7-10870H, NVIDIA GeForce RTX 30 series bứt phá<br/>
GP66 Leopard 10UE-206VN là dòng laptop gaming chiến hiện nay. Máy được trang bị Intel Core thế hệ thứ 10, là thế hệ mới nhất. Bộ vi xử lý này có thể thực hiện nhanh chóng, dễ dàng các tác vụ đa nhiệm và chơi game mượt mà.
<br/>
<br/><img src="/images/pictures/msi_gl66_pic_1.JPG" alt="MSI Gaming GP66 Leopard 10UE-206VN"><br/>
<br/>
Đặc biệt, máy còn sở hữu card đồ họa NVIDIA GeForce RTX 30 series. Đây là yếu tố giúp GP66 Leopard 10UE-206VN trở nên bất phân thắng bại.
<br/><br/>
Vẻ ngoài sành điệu, thiết kế sang trọng<br/><br/>
Laptop MSI GP66 Leopard 10UE-206VN không chỉ được đánh giá cao bởi các tính năng, bộ vi xử lý bên trong mà còn khiến người dùng ấn tượng với vẻ ngoài. Máy được thiết kế vững chắc, khung viền vuông vắn, logo đẳng cấp.
<br/>
<br/><img src="/images/pictures/msi_gl66_pic_2.JPG" alt="MSI Gaming GP66 Leopard 10UE-206VN"><br/>
<br/>
Tùy biến bàn phím RGB, dãi Mystic Light thiết kế chiếu sáng toàn bộ. Ai đó chắc chắn sẽ phải trầm trồ khi thấy điều đặc biệt này nếu bạn sở hữu một chiếc laptop này trong tay.
<br/><br/>
Máy tính đầu tiên được trang bị Wifi 6 trên thế giới<br/>
GP66 Leopard 10UE-206VN là máy tính đầu tiên được trang bị Wifi 6, nhằm đảm bảo tốc độ tuyệt vời khi truy cập mạng internet, kể cả khi bạn chia sẻ cho nhiều người dùng.<br/>
<br/><img src="/images/pictures/msi_gl66_pic_3.JPG" alt="MSI Gaming GP66 Leopard 10UE-206VN"><br/>
<br/>

Ngoài ra, máy còn sở hữu dung lượng pin lên tới 65Whr, cho thời gian sử dụng lâu dài. Các cổng kết nối đa dạng, linh hoạt, mang tới cho game thủ sự tiện lợi khi cần.
<br/>
<br/><img src="/images/pictures/msi_gl66_pic_4.JPG" alt="MSI Gaming GP66 Leopard 10UE-206VN"><br/>
Laptop MSI GP66 Leopard 10UE-206VN sở hữu hiệu năng vượt trội, thiết kế cao cấp, dung lượng pin khủng là sản phẩm được rất nhiều game thủ quan tâm.<br/>', N'Intel® Core™ i7-10870H', N'16GB DDR4 Bus 3200MHz', N'SSD 1TB PCIe', N'NVIDIA RTX 3060', N'15.6 inch FHD IPS 144Hz', N'3 cổng Type-A USB3.2 Gen1 1 cổng Type-C (USB3.2 Gen2 / DP) 1 cổng RJ45 1 cổng (4K @ 60Hz) HDMI', N'HD Webcam', N'2.3 kg', N'4 Cell 65WHrs', N'Windows 10 bản quyền', 0, N'/images/pictures/msi_gl66_pic_layout.JPG', CAST(N'2022-04-08 10:03:38.013' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (25, N'MSI GP65 LEOPARD 9SD', 1008, CAST(28000000 AS Decimal(18, 0)), 10, CAST(25200000 AS Decimal(18, 0)), N'MSI GP65 LEOPARD 9SD Core i7 9750H, 16GB, 512GB NVMe, GTX 1660Ti, 15.6'' FHD 144Hz', N'MSI GP65 Leopard 9SD  dòng laptop cao cấp dành cho các game thủ của nhà MSI, với sự phá cách ở ngoại hình cũng như đổi mới ở hiệu năng, đây sẽ là đối thủ đáng gờm của các laptop gaming trong cùng phân khúc.
<br/>
Thiết kế<br/>
<br/><img src="/images/pictures/ms_gl65_pic_1.JPG" alt="MSI GP65 LEOPARD 9SD"><br/><br/>
MSI GP65 Leopard 9SD  được sinh ra để hướng đến các gamer nên phong cách thiết kế mang hơi hướng nam tính và mạnh mẽ. Với tông chủ đạo là đen Aluminum, tổng thể máy bật lên sự sang trọng cũng như khẳng định sự bền bỉ theo thời gian.
<br/>
Điểm nhấn tại nắp máy là logo rồng xương đỏ quen thuộc cùng 2 đường cắt xéo nổi đặc trưng của MSI. Bên cạnh nắp máy là phần thân phía sau với 2 hốc tản nhiệt thiết kế tinh tế nhỏ gọn cùng dòng chữ Leopard nằm ở giữa.
<br/>
Không thiết kế quá hầm hố nặng nề, vỏ của chiếc laptop này được tạo nên từ chất liệu nhôm và plastic đảm bảo cho máy có độ nhẹ nhàng nhất định. Với khối lượng 2.6kg lí tưởng, chiếc máy này sẽ là người bạn đồng hành tuyệt vời cùng bạn di chuyển đến bất cứ đâu.
<br/>
 
<br/><img src="/images/pictures/ms_gl65_pic_2.JPG" alt="MSI GP65 LEOPARD 9SD"><br/>

<br/>
Cấu hình
<br/>
Máy được trang bị bộ vi xử lý Core i7 9750H với 6 nhân 12 luồng cho tốc độ xử lý vượt nhanh hơn đến 40% so với vi xử lý cũ. Một điểm cộng cho chiếc laptop này  là bộ nhớ RAM 16GB và SSD 512GB tạo nền tảng không gian lớn để bạn lưu trữ game, ứng dụng và công việc cá nhân một cách thoải mái. Bên cạnh đó, hậu thuẫn cho vi xử lý là card màn hình NVIDA GeForce GTX 1660 TI 6GB cùng kiến trúc GPU Turing hoàn toàn mới. Hai nhân tố này góp phần rất lớn trong việc đem đến trải nghiệm chơi game trên laptop tuyệt với nhất cho gamer.
<br/>
 

<br/><img src="/images/pictures/ms_gl65_pic_4.JPG" alt="MSI GP65 LEOPARD 9SD"><br/>
<br/>
Màn hình
<br/>
MSI GP65 Leopard 9SD  được trang bị màn hình 15.6 inch Full HD 144Hz 3ms với độ phủ màu đạt 94% NSTC giúp hình ảnh được tái hiện lại một cách chi tiết và chính xác nhất. Bên cạnh đó, màn hình còn cung cấp góc nhìn rộng lên đến 170 độ đảm hình ảnh luôn rõ nét ở mọi góc độ. Bạn sẽ như được hòa mình vào thế giới ảo, rất sống động và chân thực khi trải nghiệm game trên chiếc laptop này.

 <br/><img src="/images/pictures/ms_gl65_pic_3.JPG" alt="MSI GP65 LEOPARD 9SD"><br/>


<br/>
Bàn phím
<br/>
Để đảm bảo trải nghiệm tốt nhất khi chơi game, MSI đã tập trung cải thiện chất lượng bàn phím trên MSI GP65 Leopard 9SD . Bàn phím sử dụng thiết kế công thái học với hành trình phím 1.9mm cho khả năng phản hồi nhanh nhạy và chuẩn xác nhất. Hệ thống đèn nền RGB trên bàn phím giúp laptop trở nên nổi bật hơn, hỗ trợ hiệu quả khi sử dụng trong bóng tối. Các phím đều được tối ưu một cách hoàn hảo nhất giúp cho trải nghiệm chơi game.
<br/>
 
<br/><img src="/images/pictures/ms_gl65_pic_5.JPG" alt="MSI GP65 LEOPARD 9SD"><br/>


Âm thanh<br/>
MSI GP65 Leopard 9SD  được trang bị hệ thống loa hiện đại giúp game thủ trải nghiệm chơi game với nền tảng âm thanh chân thực và sống động. Đó là nhờ bộ khuếch đại công suất AMP tăng cường chi tiết âm thêm 30%, cùng với jack cắm tai nghe mạ vàng cho bạn đắm chìm hơn với chất lượng như phòng thu. Ngoài ra, thiết kế mô-đun âm thanh cũng được MSI độc quyền và các loa độc lập với nhau góp phần tạo không gian để nguồn âm lan tỏa, kích thích thính giác đến không tưởng.
<br/>
 
<br/><img src="/images/pictures/ms_gl65_pic_3.JPG" alt="MSI GP65 LEOPARD 9SD"><br/>


 
<br/>
Cổng kết nối<br/>
<br/><img src="/images/pictures/ms_gl65_pic_1.JPG" alt="MSI GP65 LEOPARD 9SD"><br/><br/>
MSI GP65 Leopard 9SD  được trang bị đầy đủ các cổng kết nối cần thiết và hiện đại. Ngoài nguồn và 2 jack cắm tai nghe mạ vàng, các cổng I/O bao gồm: 1 USB 3.2 Type C (gen 2), 2 USB 3.2 Type A (gen 1), 1 USB 3.2 Type A (gen 2), khe đọc thẻ nhớ và RJ45. Hơn thế nữa, bạn có thể xuất hình ảnh ra nhiều màn hình khác nhau để tận hưởng không gian lớn hơn với sự hỗ trợ đắc lực của cổng HDMI và Mini DisplayPort.
<br/>
 ', N'Intel® Core™ i7-9750H', N'16GB DDR4 Bus 2666MHz', N'SSD 512GB PCIe', N'NVIDIA GTX 1660Ti 6GB', N'15.6 inch FHD IPS 144Hz', N'Per Key led RGB Steelseries', N' 1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI ', N'2.3 kg', N'6 Cells', N'Windows 10 bản quyền', 0, N'/images/pictures/ms_gl65_pic_layout.JPG', CAST(N'2022-04-08 10:10:06.670' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (26, N' MSI GF63 Thin 10SC-035US', 1008, CAST(20000000 AS Decimal(18, 0)), 8, CAST(18400000 AS Decimal(18, 0)), N'[Mới 100%] MSI GF63 Thin 10SC-035US Core i5-10200H, 8GB, 256GB, GTX 1650, 15.6'' 60Hz', N'<b>Laptop MSI GF63 Thin 10SC-035US Core i5 dành cho ai?</b>
<br/>
 <br/><img src="/images/pictures/msI_gf63_pic_1.JPG" alt=" MSI GF63 Thin 10SC-035US"><br/>

Nếu bạn đang tìm kiếm một chiếc laptop gaming vừa có vẻ bề ngoài cứng cáp, mạnh mẽ nhưng lại vừa sang trọng ,cuốn hút và tinh tế thì xin chúc mừng bạn chiếc Laptop MSI GF63 Thin 10SC-035US là lựa chọn không thể tuyệt vời hơn dành cho bạn trong phân khúc ~19 triệu đồng. Hãy cùng LaptopAZ đi tìm hiểu chi tiết về sản phẩm này nhé!
<br/><img src="/images/pictures/msI_gf63_pic_4.JPG" alt=" MSI GF63 Thin 10SC-035US"><br/>
 
<br/>
Thiết kế đỉnh cao với kiểu dáng mỏng nhẹ, hiện đại<br/>
GF63 10SC có thiết kế hiện đại và phong cách đặc trưng của dòng laptop gaming MSI. Toàn thân máy được làm từ lớp vỏ nhôm nguyên khối vừa bền vững, cứng cáp lại vừa rất nhẹ. MSI đã cải tiến để MSI GF63 mỏng nhẹ nhất có thể, nhưng vẫn đảm bảo được quá trình tản nhiệt hiệu quả. Máy có độ mỏng 2,17 cm và trọng lượng1.86 kg, những thông số lí tưởng đối với một chiếc laptop gaming di động.
<br/><img src="/images/pictures/msI_gf63_pic_3.JPG" alt=" MSI GF63 Thin 10SC-035US"><br/>
 <br/>

Toàn thân MSI GF63 có màu đen chủ đạo với những điểm nhấn màu đỏ như logo MSI. Phần quạt thông gió hình chữ X ẩn dưới thân máy, tạo nên sự thanh thoát và liền khối trong thiết kế tổng thể.
<br/>
 <br/><img src="/images/pictures/msI_gf63_pic_2.JPG" alt=" MSI GF63 Thin 10SC-035US"><br/>

Màn hình hiển thị tuyệt đẹp, âm thanh cao cấp, micro rõ nét
Màn hình MSI Gaming GF63 10SC có kích thước 15.6 inch, độ phân giải Full HD sắc nét, viền siêu mỏng theo phong cách mới. Chính vì thế mà không chỉ mang đến những trải nghiệm xem tuyệt vời, màn hình này còn góp phần giúp cho kích thước máy gọn gàng hơn. Với công nghệ IPS, bạn sẽ được tận hưởng tựa game yêu thích ở góc nhìn rộng, độ tương phản cao, giúp những nhân vật game yêu thích xuất hiện một cách hoàn hảo.
<br/>
<br/><img src="/images/pictures/msI_gf63_pic_5.JPG" alt=" MSI GF63 Thin 10SC-035US"><br/><br/>
MSI GF63 sử dụng bộ phần mềm và công nghệ âm thanh Nahimic3, mang đến trải nghiệm âm thanh vòm 3D sống động dành cho các game thủ. Bên cạnh đó thì công nghệ Audio Boost sẽ cho chất âm chi tiết hơn 30% với Audio Power Amplifier bên trong và cổng tai nghe chân vàng.
<br/>
Ngoài ra Nahimic3 cũng rất chú trọng cho việc thu âm qua microphone, âm thanh của bạn phát ra sẽ to và rõ ràng hơn. Hầu hết các game online hiện nay đều phải giao tiếp qua micro, chính vì vậy tính năng này khá quan trọng cho trải nghiệm chơi game.

 <br/><img src="/images/pictures/msI_gf63_pic_1.JPG" alt=" MSI GF63 Thin 10SC-035US"><br/>
<br/>
Hiệu năng dẫn đầu với sức mạnh vượt trội<br/>
MSI GF63 Thin 10SC-035US dẫn đầu xu hướng với bộ vi xử lý Intel thế hệ thứ 10 Comet Lake. Con chip Intel Core i5 10200H xung nhịp 2,40 GHz Turbo Boost 4,10 GHz, bộ nhớ đệm 8MB, 4 lõi 8 luồng cho sức mạnh vượt trội. Hiệu năng mạnh mẽ đủ sức để MSI GF63 chơi tốt hầu hết mọi tựa game hiện nay, đặc biệt là các game eSports phổ biến ở mức đồ họa luôn ổn định. RAM 8GB cùng ổ cứng SSD 256GB mang lại tốc độ khởi động máy và vào game siêu nhanh.
<br/><img src="/images/pictures/msI_gf63_pic_3.JPG" alt=" MSI GF63 Thin 10SC-035US"><br/>
 
<br/>
Mọi thứ đều diễn ra nhanh chóng và không để bạn phải chờ đợi. Với một chiếc laptop MSI Gaming GF thì card đồ họa sẽ mang lại trải nghiệm game mãn nhãn nhất. Hiểu được điều đó, MSI trang bị cho GF63 10SC card đồ họa rời Nvidia GTX1650 MAX Q 4GB với sức mạnh đột phá. Card đồ họa này đảm bảo bảo được hiệu năng và tản nhiệt trong một không gian hẹp, trải nghiệm chơi game của bạn được nâng lên một tầm cao mới với kiến trúc Nvidia Turing danh tiếng. Tốc độ xử lý nhanh, hiệu ứng đổ bóng trung thực cùng sự tối ưu cho từng tựa game giúp GTX 1650 được các game thủ yêu thích. Thoải mái tận hưởng trò chơi sở trường của bạn với niềm vui bất tận.

 <br/><img src="/images/pictures/msI_gf63_pic_2.JPG" alt=" MSI GF63 Thin 10SC-035US"><br/>
<br/>
Nhanh chóng chuyển đổi các chế độ hiệu năng<br/>
Như thường lệ thì MSI GF63 vẫn có 3 chế độ tùy chỉnh hiệu năng nhanh, có thể chuyển đổi qua lại chỉ với phím MSI Shift. Đó là chế độ Sport, dành cho khi cần chơi game; chế độ Comfort lúc sử dụng bình thường và chế độ Eco để tiết kiệm pin. Sự chuyển đổi sẽ giúp bạn tối ưu nguồn lực và thời lượng pin khi sử dụng ở các nhu cầu khác nhau.

 <br/><img src="/images/pictures/msI_gf63_pic_4.JPG" alt=" MSI GF63 Thin 10SC-035US"><br/>
<br/>
Mát mẻ và êm ái mọi lúc<br/>
MSI GF63 sử dụng công nghệ tản nhiệt mới, làm mát tốt hơn và đỡ ồn hơn 10% so với các thiết bị khác. Bạn sẽ không phải lo đến việc máy quá nóng dẫn đến hiệu năng giảm khi chơi game. Laptop sẽ tản nhiệt hiệu quả để tuổi thọ linh kiện được bền nhất và không gây khó chịu khi sử dụng.

 <br/><img src="/images/pictures/msI_gf63_pic_1.JPG" alt=" MSI GF63 Thin 10SC-035US"><br/>

Kết nối mở rộng, toàn diện<br/><br/>
Các cổng kết nối của laptop MSI Gaming MSI GF63 Thin 10SC-035US khá đa dạng để bạn liên kết các thiết bị ngoại vi cũng như mở rộng nhiều màn hình để trải nghiệm giải trí tốt hơn. Cổng I/O bao gồm: cổng Type-C USB 3.2, Type A USB 3.2, HDMI, combo jack cắm tai nghe/ micro và RJ45 cùng kết nối không dây Wifi 802.11 ac tốc độ cao cho trải nghiệm giải trí tuyệt đỉnh.
<br/>
 <br/><img src="/images/pictures/msI_gf63_pic_3.JPG" alt=" MSI GF63 Thin 10SC-035US"><br/>
<br/>
Tổng Kết: 
<br/><br/>
Có thể xem MSI GF63 là dòng laptop gaming giá rẻ tốt nhất trong thời điểm hiện tại. Với giá chỉ khoảng từ hơn 19 triệu đồng, bạn đã có ngay cho mình một chiếc máy tính xách tay sang trọng, thanh lịch và hiệu năng cực cao, có thể cân được hầu hết các tác vụ làm việc văn phòng và chơi game mượt mà. Tuy nhiên để so sánh với những dòng laptop gaming thì nó sẽ không thể sánh bằng về hiệu năng, bởi một vài ứng dụng, game quá nặng thì GF63 10SCR xử lý không được mượt mà lắm.', N'Intel® Core™ I5-10200H (2.40GHz up to 4.10GHz, 8MB)', N'8GB DDR4-3200Mhz (2 khe, tối đa 64GB)', N'SSD 256GB NVMe PCIe ', N'NVIDIA® GeForce GTX 1650 Max Q 4GB GDDR6', N'15.6 inch FHD IPS 60Hz', N'HD 720P', N'1x Type-C USB3.2 Gen1 3x Type-A USB3.2 Gen1  1x (4K @ 30Hz) HDMI', N'1,86 kg', N'3 Cell - 51Whr', N'Windows 10 bản quyền', 0, N'/images/pictures/msI_gf63_pic_.JPG', CAST(N'2022-04-08 10:18:35.850' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (27, N' MSI Gaming Bravo 17 A4DDR', 1008, CAST(27000000 AS Decimal(18, 0)), 15, CAST(22950000 AS Decimal(18, 0)), N'[Mới 100%] MSI Gaming Bravo 17 A4DDR (Ryzen 7-4800H, 8GB, 512GB, AMD Radeon RX5500M, 17.3'''' FHD IPS 144Hz)', N'<b>MSI BRAVO 17 CÓ GÌ MỚI?</b><br/>
<br/><br/>
- MSI luôn dẫn đầu xu thế thiết kế laptop gaming trên thị trường. Giữa năm 2020, để nối tiếp thành công của laptop Alpha 17, MSI chính thức cho ra mắt mẫu laptop gaming MSI Bravo 17. Đây là dòng laptop chuyên game sử dụng phần cứng từ AMD- loại laptop giúp MSI dẫn đầu thị trường. Cũng như dòng máy trước của MSI, MSI Bravo 17 A4DDR cũng được sử dụng biểu tượng Lôi Điểu, biểu tượng cho sức mạnh và sự sáng tạo. <br/>
- Kết hợp bộ xử lý AMD Ryzen™ công nghệ 7nm tiên tiến nhất và đồ họa Radeon RX™ với nhau, Bravo 17 A4DDR như con "quái vật" đốt cháy thế giới laptop gaming bằng sức hút của nó. Cùng với đó là màn hình chơi game mượt mà sử dụng công nghệ cao cấp FreeSync. Việc kết hợp này giúp mang lại hiệu suất vô cùng tuyệt vời. 
<br/>
<br/><img src="/images/pictures/msi_bravo_17_pic_3.JPG" alt=" MSI Gaming Bravo 17 A4DDR"><br/>
<br/>
HIỆU NĂNG: 
<br/>
Là một chiếc laptop gaming nhưng Bravo 17 A4DDR có hiệu suất ngang tầm một chiếc máy để bàn vì được hỗ trợ bởi công nghệ tiên tiến nhất: bộ xử lý AMD Ryzen™ công nghệ 7nm tiên tiến, đồ họa Radeon RX™. Cùng với đó, FidelityFX nâng cao độ trung thực hình ảnh tuyệt đẹp đồng thời giảm tải công việc GPU, cải thiện cả chất lượng hình ảnh và hiệu suất.
<br/>
Sức mạnh của MSI Bravo 17 là sự kết hợp hoàn toàn từ nhà AMD, bao gồm bộ vi xử lý siêu khủng AMD Ryzen 7 4800H và card đồ họa rời AMD Radeon RX 5500M. Ryzen 5 4600H thể hiện sức mạnh đa luồng vượt trội với 8 nhân 16 luồng, tốc độ 2.9 – 4.2GHz, trong khi đó Radeon RX 5500M sử dụng chip Navi 14 mới, hỗ trợ GDDR6 VRAM, cho hiệu năng mạnh mẽ tương đương GTX 1660 Ti. Với cấu hình mạnh mẽ, MSI Bravo 17 sẽ là chiếc laptop lý tưởng để chơi game khi đáp ứng tốt hầu hết mọi tựa game hàng đầu hiện nay.
<br/>
<br/><img src="/images/pictures/msi_bravo_17_pic_1.JPG" alt=" MSI Gaming Bravo 17 A4DDR"><br/>
<br/>
THIẾT KẾ & NGOẠI HÌNH
<br/>
- Bravo 17 như một "con ngựa chiến" của giới gaming không chỉ bởi hiệu năng của nó mà còn vì thiết kế cực ngầu. Nhìn tổng quan, khi đóng máy, Bravo 17 như một khối kim loại rất chắc chắn. Khác với những dòng máy khác được in hình con Rồng trên bề mặt máy, lần này MSI chọn cho MSI Bravo 17 A4DDR biểu tượng Lôi Điểu khác lạ tạo điểm nhấn. Vỏ máy được thiết kế bằng chất liệu nhôm sáng, không chỉ bền bỉ mà còn có tác dụng giúp máy trở lên bắt sáng tốt, đẳng cấp hơn.<br/>
- Thiết kế này của MSI Bravo có thể được xem là thiết kế tương lai để chiến đấu.
<br/>
<br/><img src="/images/pictures/msi_bravo_17_pic_layout.JPG" alt=" MSI Gaming Bravo 17 A4DDR"><br/>
<br/>
MÀN HÌNH
<br/>
Khung màn hình của laptop MSI vốn đã nhỏ, nhưng với Bravo 17 A4DDR còn có thể nhọn gọn hơn nữa. Màn hình Bezel cùng khung màn hình nhỏ gọn sẽ cho phép gamer tham chiến các cuộc chơi nhập vai một các chân thực nhất. Màn hình 17.3 inch của máy cũng đem lại cho bạn trải nghiệm hình ảnh lớn hớn, sống động hơn.


<br/><img src="/images/pictures/msi_bravo_17_pic_1.JPG" alt=" MSI Gaming Bravo 17 A4DDR"><br/>
BÀN PHÍM<br/>
<br/>
Sử dụng Chiclet keyboard with LED, Bravo 17 cho phép người dùng có tốc độ đánh máy cực nhanh, độ nhạy cao. Đèn led dưới bàn phím cũng có thể giúp bạn gõ phím một cách chính xác trong điều kiện thiếu sáng.
Có lẽ vì là laptop gaming, mà gamer chẳng mấy khi dùng đến touchpad nên touchpad của MSI Bravo 17 không có gì quá nổi trội, tuy nhiên nó vẫn có thể đáp ứng nhu cầu sử dụng thông thường vì độ nhạy khá cao.
<br/>
CỔNG GIAO TIẾP<br/>
<br/>
- Dĩ nhiên rồi, Bravo 17 là dòng laptop cực hiện đại nên nó được trang bị vô cùng đầy đủ các cổng giao tiếp hiện đại nhất như: HDMI, USB Type-C, USB 3.1, Jack Audio™, MicroSD Reader, LAN RJ45 Gigabit, Webcam, Hi-Res Audio™ with Nahimic 3 Audio™, CoolerBoost 5 (2 Fans with 7 heat pipes).
- Ngoài ra Wi-Fi 6 AX200 (2x2ax) + Bluetooth 5.1 của MSI Bravo mang lại tốc độ kết nối cực nhanh, đảm bảo game thủ sẽ không phải nhượng bộ bất cứ đối thủ nào do "mất kết nối".
<br/>
<br/><img src="/images/pictures/msi_bravo_17_pic_2.JPG" alt=" MSI Gaming Bravo 17 A4DDR"><br/>
<br/>
HỆ THỐNG TẢN NHIỆT
<br/><br/>
Để có thể chiến game trong thời gian dài chắc hẳn laptop phải có hệ thống tản nhiệt tốt để máy không bị nóng, dẫn đến quá tải. MSI Bravo mang đến giải pháp tản nhiệt chuyên dụng cho cả CPU và GPU với tối đa 6 ống dẫn nhiệt, hoạt động hài hòa bằng cách giảm thiểu nhiệt và tối đa hóa luồng không khí.
<br/>

<br/><img src="/images/pictures/msi_bravo_17_pic_4.JPG" alt=" MSI Gaming Bravo 17 A4DDR"><br/>
PIN VÀ TRỌNG LƯỢNG
<br/>
- Pin 51WHrs Li-ion Battery của MSI Bravo 17 A4DDR tuy không phải là loại pin với số lượng pin cực khủng nhưng nó vẫn cho phép bạn dùng để học tập, làm việc trong nhiều giờ. Tuy nhiên để chơi game thì bạn cần cắm sạc và ổ điện để đảm bảo trò chơi không bị ngắt quãng.<br/>
- Trong lượng 2.3kg là con số tương đối lớn, nhưng so với các dòng laptop gaming thì đây là trọng lượng trung bình, có thể thấy với MSI Bravo, bạn có thể sử dụng nó một cách cực kỳ linh hoạt. 
<br/>
ÂM THANH<br/>
Âm thanh là điều không thể thiếu trong cuộc sống, vì vậy Bravo 17 giúp bạn có trải nghiệm âm thanh cao cấp, độ phân giải cao cực ấn tượng và thỏa mãn bởi âm thanh MP3 24KHz/8bit, CD 44KHz/16bit, 192KHz/24bit HI-RES AUDIO.
<br/><img src="/images/pictures/msi_bravo_17_pic_3.JPG" alt=" MSI Gaming Bravo 17 A4DDR"><br/>
 <br/>
<b>KẾT LUẬN</b>
<br/>
Một siêu phẩm từ thương hiệu MSI, MSI Bravo 17 A4DDR thực sự đã chứng minh được chất lượng của mình thông qua những thông số vô cùng ấn tượng và thiết kế đẳng cấp. So với Bravo 15 thì máy có cấu hình vượt trội hơn hẳn, đặc biệt màn hình to 17.3 inch cũng mang lại nhiều trải nghiệm thú vị hơn khi sử dụng. Đây là sự lựa chọn tốt cho các bạn trẻ, Bravo 17 có thể cùng bạn vừa "chiến game", vừa học tập và làm việc. ', N'AMD Ryzen 7-4800H', N'8GB DDR4 3200MHz', N'512GB NVMe PCIe Gen3x4 SSD', N'AMD Radeon RX 5500M 4GB GDDR6', N'17.3 inch FHD (1920*1080), 144Hz Anti - Glare, IPS-Level', N'HD 720P', N'	 2x Type-C USB3.2 Gen1 2x Type-A USB3.2 Gen1', N'2.3 kg', N'	3 Cells 51Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/msi_bravo_17_pic_layout.JPG', CAST(N'2022-04-08 10:27:26.497' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (28, N'MSI GE66 Raider 10SF-239', 1008, CAST(54000000 AS Decimal(18, 0)), 15, CAST(45900000 AS Decimal(18, 0)), N'[Mới 100%] MSI GE66 Raider 10SF-239 (Core i7 10750H, 32GB, 1TB, NVIDIA RTX2070 Super 8GB, 15.6'' 240Hz )', N'MSI - GE66 10SFS 15.6" Laptop - Intel Core i7 - 32GB Memory - NVIDIA GeForce RTX 2070 SUPER - 1TB SSD<br/>
<br/>
<br/><img src="/images/pictures/msi_ge66_pic_1.JPG" alt="MSI GE66 Raider 10SF-239"><br/><br/>
 TRANG BỊ ĐỒ HỌA NVIDIA GeForce RTX™ 20 SERIES<br/>
NVIDIA GeForce RTX sẽ mang đến cho bạn trải nghiệm laptop gaming tuyệt vời nhất. Với chiếc laptop MSI GE66 Raider 10SF tuyệt đẹp sở hữu sức mạnh được cung cấp bởi kiến trúc GPU NVIDIA Turing mới và nền tảng RTX cách mạng.
<br/>
 <br/><img src="/images/pictures/msi_ge66_pic_2.JPG" alt="MSI GE66 Raider 10SF-239"><br/>
<br/>
Thiết kế<br/>
Là phiên bản cải tiến từ GE65, GE66 mang cho mình thiết kế đơn giản nhưng không kém phần mạnh mẽ với các góc được bo tròn tạo cảm giác mềm mại hơn nhiều. 
<br/>
Về trọng lượng và độ dày, lần lượt ở mức 2,38kg và 23,4mm, MSI GE66 Raider là một mẫu laptop chơi game có trọng lượng nhẹ nhất nếu so với các sản phẩm từ các thương hiệu khác.
<br/>
<br/><img src="/images/pictures/msi_ge66_pic_3.JPG" alt="MSI GE66 Raider 10SF-239"><br/>
<br/>
Hiệu năng<br/>
MSI Gaming GE66 Raider 10SF 044VN trang bị vi xử lý Intel® Core™ i7-10750H với xung nhịp 2.60GHz upto 5.00GHzz tận hưởng trải nghiệm chơi game tốt nhất. Thế hệ mới mang đến hiệu suất chưa từng có, giờ là lúc để tiết lộ sức mạnh chơi game thực sự của bạn.
<br/>
Dòng nVidia Geforce RTX2070 8GB GDDR6  mới có nhiều lõi hơn và xung nhịp cao hơn cho hiệu năng cực nhanh so với các GPU thế hệ trước. Xem các trò chơi của bạn trở nên sống động với phương pháp dò tia cực nhanh; cung cấp bóng chính xác, phản xạ và ánh sáng


<br/>
Công nghệ đổ bóng Ray Tracing thời gian thực
<br/>
Ray Tracing là một công nghệ “thần thánh” mới cho đồ họa game. Với trang bị RTX sẽ mô phỏng lại các hiệu ứng ánh sáng theo thời gian thực. Nhờ đó mang đến chất lượng hình ảnh thực tế như những bộ phim điện ảnh mà trước đây chưa bao giờ được thấy.
<br/>
 <br/><img src="/images/pictures/msi_ge66_pic_4.JPG" alt="MSI GE66 Raider 10SF-239"><br/>

<br/>
AI nâng cao chất lượng hình ảnh
<br/>
Deep Learning Super Sampling (DLSS) là 1 công nghệ mới của RTX, do đó nó cũng được trang bị trên GE66 Raider 10SF. AI sẽ học tập và đào tạo GPU để hiển thị hình ảnh sắc nét,  nhanh hơn gấp 2 lần so với GPU thế hệ trước sử dụng các kỹ thuật khử răng cưa thông thường.
<br/>
Màn hình lên đến 300Hz (Option tuỳ chọn thêm)

 
<br/>
Comparison display effect: Left half is generic and right half is 300Hz

 <br/><img src="/images/pictures/msi_ge66_pic_5.JPG" alt="MSI GE66 Raider 10SF-239"><br/>
<br/>
Tăng tốc với màn hình tốc độ làm mới 240Hz cực nhanh, nhanh hơn nhiều lần so với máy tính xách tay thông thường. Trải nghiệm hình ảnh chơi game mượt mà để bạn có thể phản ứng nhanh hơn khi chơi game.
<br/>
Mở rộng tầm nhìn của bạn trên nhiều màn hình với HDMI, Type-C & mini DisplayPort và tận hưởng đầu ra độ phân giải lên tới 8K

 <br/>

Pin lên đến 99,9Wh

 <br/>

99.9 Whr Battery

 
<br/>
Với dung lượng pin cực khủng, lên đến 99,9Wh chiếc laptop MSI GE66 Raider 10SF đáp ứng hoàn toàn thoả mái thời lượng pin cho các tác vụ văn phòng và thời gian làm việc liên tục.

 
<br/>
Cooling system - 2 fans and 6 heatpipes
<br/>
 
<br/><img src="/images/pictures/msi_ge66_pic_6.JPG" alt="MSI GE66 Raider 10SF-239"><br/><br/>
Với một chiếc Laptop có thiết kế hiện đại, màn hình viền siêu mỏng, hiệu suất tuyệt vời thì Laptop GE66 Raider 10SF-239 xứng đáng là sự lựa chọn tối ưu nhất cho những ai đang cần một chiếc máy vừa có thể chơi Game, vừa có thể làm việc Hard Core. ', N'Core i7 10750H', N'32GB', N'1TB SSD', N'NVIDIA RTX2070 Super 8GB', N'15.6 inch FHD (1920x1080), 240Hz', N'HD 720P', N' 1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI ', N'2.65 kg', N'99,9Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/msi_ge66_pic_layout.JPG', CAST(N'2022-04-08 10:35:30.203' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (29, N'Laptop MSI GF75 10SCXR - 248VN', 1008, CAST(25000000 AS Decimal(18, 0)), 10, CAST(22500000 AS Decimal(18, 0)), N'[Mới 100%] Laptop MSI GF75 10SCXR - 248VN (Core i7 10750H, 8GB, 512GB , VGA 4GB NVIDIA GTX 1650, 17.3'' FHD 144Hz )', N'<br/>Laptop MSI GF75 10SCXR được thiết kế xu hướng mới, mỏng nhẹ nhưng lại mang sức mạnh vượt trội, trọng lượng chỉ 2.1kg như một số mẫu Ultrabook cao cấp giúp bạn thoải mái di chuyển. 
<br/>
Laptop MSI GF75 10SCXR được trang bị bộ vi xử lý core i7 mới nhất thế hệ thứ 10 với cực nhiều đột phá lớn của Intel số 6 nhân 12 luồng (cache 12Mb) và card đồ họa NVIDIA GeForce GTX 1650 4GB được sự hỗ trợ đầy đủ với Microsoft® DirectX® 12, RAM 8GB bus 3200Mhz mạnh mẽ nhất hiện nay tất cả đã đem lại một hiệu năng mạnh mẽ gần như tuyệt đối. Màn hình 17.3 inch Full HD tần số quét 144Hz và màn hình được trang bị IPS Hình ảnh cực đẹp và góc nhìn rộng!<br/>
<br/><img src="/images/pictures/msi_gf63_pic_1.JPG" alt="Laptop MSI GF75 10SCXR - 248VN"><br/>
Laptop MSI GF75 10SCXR Full box máy mới 100% Với chế độ bảo hành dài hạn 12 tháng đi kèm chế độ dùng thử test máy trong 15 ngày đâu nều chưa ưng đổi mẫu khác hoàn toàn miễn phí. 
<br/>
Với những thông tin và cam kết như trên khách hàng hoàn toàn yên tâm lựa chọn sản phẩm và dịch vụ tại LaptopAZ.<br/>
Có bán trả góp, xét duyệt nhanh gọn trong 15p, lãi suất O%
<br/>
Giao hàng toàn quốc, nhận hàng và thanh toán tại nha: xem tại đây 
<br/>
Bộ ảnh thật laptop MSI GF75 tại LaptopAZ.vn
<br/>

Mới đây hãng này đã cho ra mắt Laptop MSI GF75 10SCXR chiếc laptop gaming có thể đáp ứng được 3 tiêu chí của các game thủ hiện nay mỏng nhẹ, thiết kế hiện đại, hiệu năng mạnh mẽ.
<br/>
<br/><img src="/images/pictures/msi_gf63_pic_2.JPG" alt="Laptop MSI GF75 10SCXR - 248VN"><br/>
<br/>
Laptop MSI GF75 10SCXR được trang bị màn hình 17.3 inch, viền màn hình rất mỏng so với các laptop gaming cùng phân khúc hiện nay, độ phân giải của màn là Full HD tần số quét 144Hz, được trang bị tấm nền IPS với các ưu điểm quen thuộc góc nhìn rộng, độ sáng cao, có lớp phủ chống chói dễ dàng sử dụng ngoài trời.

<br/>
Phía mặt trước, chúng ta có một chiếc màn hình được MSI thiết kế theo xu hướng viền mỏng giúp tối ưu hóa kích thước tổng thể của máy.
<br/>

<br/><img src="/images/pictures/msi_gf63_pic_4.JPG" alt="Laptop MSI GF75 10SCXR - 248VN"><br/>
Thật tuyệt vời, MSI đã trang bị dường như là đầy đủ các cổng kết nối trên chiếc Laptop MSI GF75 10SCXR này.

 <br/>

Phía cạnh phải bao gồm cổng khoá laptop, cổng mạng, cổng USB Type C, 2 cổng USB 3.1 gen 1, 2 cổng jack 3.5mm

 <br/>

Cạnh trái máy thì chỉ có đơn giản là 1 cổng nguồn, 1 đèn báo pin và thêm 1 cổng USB 3.1 gen 1. 

<br/><img src="/images/pictures/msi_gf63_pic_3.JPG" alt="Laptop MSI GF75 10SCXR - 248VN"><br/>
<br/>
Bàn phím khi nhấn vào rất êm, không bị cảm thấy nông tay dù cho bạn nào đã từng xài quen bàn phím cơ, hành trình phím ngắn bù lại có độ nảy cao, còn chơi game thì phản hồi phím nhanh lẹ.v
<br/><img src="/images/pictures/msi_gf63_pic_2.JPG" alt="Laptop MSI GF75 10SCXR - 248VN"><br/>
 <br/>

Bàn phím có đèn nền Led Đỏ, dễ sử dụng kể cả trong tối, điều đặc biệt là bàn phím này do chính MSI thiết kế, chứ không phải Steelseries quen thuộc như thường lệ, nên máy sẽ có chút thay đổi nhỏ.<br/>
<br/><img src="/images/pictures/msi_gf63_pic_1.JPG" alt="Laptop MSI GF75 10SCXR - 248VN"><br/>
 
<br/>
Touchpad thiết kế tông đen không có viền, khi rê rất mượt, có độ bám tay, không dễ trượt dù có hơi mồ hôi tay một xíu, các phím chuột trái phải nhấn vào độ lún vừa phải, không gây tiếng ồn. Phần kê tay có kích thước vừa phải, không quá rộng do touchpad được bố trí nằm ở giữa. 
<br/>
<br/><img src="/images/pictures/msi_gf63_pic_3.JPG" alt="Laptop MSI GF75 10SCXR - 248VN"><br/>
Với một chiếc Laptop có thiết kế hiện đại, màn hình viền siêu mỏng, hiệu suất tuyệt vời thì Laptop MSI GF75 10SCXR xứng đáng là sự lựa chọn tối ưu nhất cho những ai đang cần một chiếc máy vừa có thể chơi Game, vừa có thể làm việc Hard Core. ', N'Intel® Core™ i7-10750H', N'8GB DDR4 Bus 3200MHz', N'SSD 512GB NVMe', N'NVIDIA GTX 1650 4GB', N'17.3 inch FHD IPS 144Hz', N'HD 720P', N'USB 2.0, LAN, HDMI, USB 3.0', N'2.1 kg', N'3 Cells 51Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/msI_gf63_pic_1.JPG', CAST(N'2022-04-08 10:40:45.527' AS DateTime), N'Còn hàng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status]) VALUES (30, N'[Mới 100%] MSI Gaming Leopard GP76 11UG', 1008, CAST(53000000 AS Decimal(18, 0)), 6, CAST(49820000 AS Decimal(18, 0)), N'Laptop MSI Gaming Leopard GP76 11UG i7 11800H/16GB/1TB SSD/8GB RTX3070/300Hz/Balo/Chuột/Win10 (823VN)   ', N'Vượt qua khỏi sự phức tạp của các thuật toán kỹ thuật, mô phỏng cơ khí hay thiết kế đồ họa chuyên nghiệp, MSI Gaming Leopard GP76 11UG i7 (823VN) sở hữu phần cứng được tối ưu đến mức tối đa, dễ dàng đáp ứng mọi nhu cầu từ bạn.<br/>
Sức mạnh hoàn mỹ đến từ chip Intel thế hệ 11 <br/>
Thỏa mãn bạn trong mọi tác vụ từ cơ bản đến nâng cao trong các công việc văn phòng, đồ họa hay gaming một cách mượt mà khi chiếc laptop này được trang bị bộ vi xử lý Intel Core i7 Tiger Lake 11800H với 8 nhân 16 luồng, đạt tốc độ CPU 2.30 GHz và tối đa lên đến 4.6 GHz nhờ Turbo Boost, cho phép bạn bức phá mọi giới hạn, không gì có thể cản bước.
<br/><img src="/images/pictures/msi_gp76_pic_1.JPG" alt="MSI Gaming Leopard GP76 11UG"><br/>
Nâng tầm trải nghiệm nhờ RAM 16 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB) với tốc độ Bus RAM 3200 MHz, cùng khả năng nâng cấp RAM tối đa lên đến 64 GB, cho phép người dùng làm nhiều việc cùng lúc như vừa lên ý tưởng thiết kế vừa nghe nhạc, mở nhiều ứng dụng hay hàng chục layer đồ họa và chuyển đổi qua lại một cách trơn tru, không lo xảy ra tình trạng giật lag, nâng cao hiệu suất công việc.
<br/>
 - Cấu hình<br/>
<br/><img src="/images/pictures/msi_gp76_pic_2.JPG" alt="MSI Gaming Leopard GP76 11UG"><br/>
Áp dụng kiến trúc Ampere uy tính với nhân RT, nhân Tensor tân tiến cùng đa nhân xử lý streaming, mang đến đồ họa ray-tracing chân thật nhất và các tính năng AI hiện đại, card đồ họa rời NVIDIA GeForce RTX 3070, 8 GB cho phép bạn thoải mái phát triển những ý tưởng đồ họa không giới hạn cùng Lightroom, Illustrator, Photoshop,... hay tận hưởng trọn vẹn những trận game đầy kịch tính như LOL, PUBG: Battlegrounds, FIFA,...
<br/>
- Card đồ hoạ<br/>
<br/><img src="/images/pictures/msi_gp76_pic_3.JPG" alt="MSI Gaming Leopard GP76 11UG"><br/>
Cho phép người dùng dễ dàng chuyển đổi giữa chế độ Discrete Graphics Mode (chỉ sử dụng card đồ họa rời) hoặc MSHybrid Graphics Mode (sử dụng công nghệ NVIDIA Optimus), cho bạn tận dụng tối đa hiệu năng của máy. Không những thế, sức mạnh của card đồ họa còn được nâng tầm đáng kể qua khả năng ép xung của GPU và VRAM khi sử bật chế độ Extreme mode trên phần mềm MSI Center.
<br/>
Ổ cứng 1 TB SSD M.2 PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB) cùng khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB) với băng thông cực cao cho phép máy phát huy tối đa sức mạnh, vừa mang đến không gian lưu trữ khổng lồ, vừa hỗ trợ bạn mở máy và vận hành các ứng dụng trong thời gian nhanh chóng, luôn ở trạng thái sẵn sàng cho bạn làm việc, giải trí.
<br/>
- SSD<br/>
<br/><img src="/images/pictures/msi_gp76_pic_4.JPG" alt="MSI Gaming Leopard GP76 11UG"><br/><br/>
Xuất chiến mọi trận game với ưu thế vượt trội<br/>
Sở hữu phần mềm MSI Center độc quyền, cho phép người dùng điều khiển và tùy chỉnh chiếc laptop tùy ý như theo dõi thông số, tối ưu hệ thống,... một cách dễ dàng trên giao diện thống nhất, mang đến độ linh động trong suốt quá trình bạn sử dụng, phù hợp cho mọi yêu cầu của bạn.
<br/>
Tải phần mềm MSI Center tại đây.<br/>
<br/>
Mang đến chất lượng hình ảnh tối đa nhờ sự đột phá của công nghệ dựng hình AI đến từ công nghệ NVIDIA DLSS mang đến khung hình có tốc độ cao nhưng vẫn giữ nguyên chất lượng hình ảnh, tiếp thêm sự tự tin cho bạn khi thiết lập chất lượng đồ họa, cho bạn những trải nghiệm trọn vẹn nhất.
<br/>
Cho phép thiết bị điều chỉnh lượng điện năng cung cấp cho GPU, CPU và bộ nhớ của GPU một cách tự động nhờ công nghệ Dynamic Boost 2.0, giúp laptop của bạn được tối ưu hóa một cách tốt nhất cả khi xử lý đồ họa hay chơi game.
<br/><img src="/images/pictures/msi_gp76_pic_5.JPG" alt="MSI Gaming Leopard GP76 11UG"><br/>
Nhà MSI mang đến công nghệ tản nhiệt Cooler Boost 5 độc quyền với cụm tản nhiệt riêng cho CPU và GPU sở hữu 6 ống dẫn nhiệt, hỗ trợ giảm thiểu hơi nóng, giúp tối ưu hơn cho luồng gió, cho phép bạn chơi game hay sáng tạo cả ngày dài mà không lo nóng máy.
<br/>
 - Tản nhiệt
<br/>
Thiết kế táo bạo, mạnh mẽ hơn bội phần
Chiếc MSI Gaming này đầy tính linh động khi sở hữu trọng lượng tối ưu cho một chiếc gaming là 2.9 kg và dày 25.9 mm, sẵn sàng nằm gọn trong balo, cùng bạn di chuyển đến bất kỳ đâu, đáp ứng mọi nhu cầu từ bạn.

<br/><img src="/images/pictures/msi_gp76_pic_6.JPG" alt="MSI Gaming Leopard GP76 11UG"><br/> - Thiết kế<br/>

Chiếc bàn phím dành riêng cho bạn khi được trang bị đèn nền chuyển màu RGB, không những giúp bạn làm việc được trong môi trường thiếu sáng mà còn tô điểm cho không gian chiến game của bạn, tạo cảm giác hứng thú khi giải trí và làm việc.
<br/>
<br/><img src="/images/pictures/msi_gp76_pic_7.JPG" alt="MSI Gaming Leopard GP76 11UG"><br/> - Bàn phím
<br/>
Chia sẻ thông tin dễ dàng hơn bao giờ hết khi sở hữu 3 cổng USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), Mini DisplayPort cho phép bạn kết nối với các thiết bị ngoại vi tương thích khác nhau, mở rộng không gian hiển thị cho bạn.<br/>
<br/><img src="/images/pictures/msi_gp76_pic_1.JPG" alt="MSI Gaming Leopard GP76 11UG"><br/> - Cổng kết nối
<br/>
Laptop MSI cũng sở hữu các chuẩn kết nối không dây hiện đại Bluetooth 5.2 và Wi-Fi 6E (802.11ax) cho phép bạn làm việc hay giải trí với đường truyền ổn định cả trong nhà hay ngoài trời, không lo gián đoạn, gia tăng hiệu quả làm việc.
<br/>
Trọn vẹn từng khoảnh khắc với hình ảnh và âm thanh sống động<br/>
Màn hình 17.3 inch sở hữu độ phân giải Full HD (1920 x 1080) mang đến cho bạn hình ảnh rõ nét, chân thật đến từng chi tiết, với khung hình rộng mở lên đến 178 độ nhờ tấm nền IPS dù không ngồi trực diện, cho bạn tận hưởng những trận game đầy kịch tính, hấp dẫn.
<br/>
- Màn hình
<br/>
Giành ưu thế tối ưu trong mọi trận chiến nhờ tần số quét cao màn hình 300 Hz, cho những chuyển động đều mượt mà kể cả trong những trò chơi hay phim có tốc độ nhanh, mang đến cảm giác như đang trong chính thế giới ảo, sống động hơn bao giờ hết.
<br/>
<br/><img src="/images/pictures/msi_gp76_pic_4.JPG" alt="MSI Gaming Leopard GP76 11UG"><br/>- Tần số quét
<br/>
Làm việc và học tập thuận lợi hơn với hiệu quả cao hơn nhờ chiếc laptop gaming này được trang bị HD webcam sở hữu độ phân giải 720p mang đến những hình ảnh chân thật, sắc nét.
<br/>
Âm thanh to rõ, ổn định đến từ công nghệ Realtek Audio cùng khả năng khuếch đại âm thanh cực tốt khi xem phim, nghe nhạc, chơi game,... cho bạn đắm chìm vào trong thế giới giải trí đầy thư giãn, thoải mái sau cả ngày làm việc và học tập mệt mỏi.

<br/><img src="/images/pictures/msi_gp76_pic_6.JPG" alt="MSI Gaming Leopard GP76 11UG"><br/> - Âm thanh
<br/>
MSI Gaming Leopard GP76 11UG i7 (823VN) sở hữu kiểu dáng cao cấp cùng cấu hình mạnh mẽ, vượt trội, là người cộng sự lý tưởng, sẵn sàng đồng hành cùng bạn trên mọi chuyến đi.', N'Intel Core i7 Tiger Lake - 11800H', N'16GB DDR4 3200MHz', N'512GB NVMe PCIe Gen3x4 SSD', N'Card rời - NVIDIA GeForce RTX 3070, 8 GB', N'17.3 inch Độ phân giải:  Full HD (1920 x 1080) Tần số quét:  300 Hz Công nghệ màn hình:  Công nghệ IPS', N'HD 720P', N'3 x USB 3.2  HDMI  Jack tai nghe 3.5 mm  LAN (RJ45)  Mini DisplayPort', N'2.9Kg', N'4-cell Li-ion, 65 Wh', N'Windows 10 Home SL', 0, N'/images/pictures/msi_gp76_pic_layout.jpg', CAST(N'2022-04-08 10:53:44.997' AS DateTime), N'Còn hàng')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (3, N'user2', N'emial2@email.com', N'1111', N'1111', N'TPLeVRzM2/UgEcLNNWKuxcu2YQhoHm9PeuXMbtGviScD01Ed', N'Đang hoạt động', N'ADMIN')
INSERT [dbo].[User] ([id], [username], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (4, N'thaatj', N'test@email.comm', N'asdasd', N'1111', N'LryV8aYPA2VtAy2WUuPpTrihKHiZj2q5Sxmz1Wpv14XIx9Ng', N'Đang hoạt động', N'ADMIN')
INSERT [dbo].[User] ([id], [username], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (5, N'testt', N'testt@email.com.vn', N'2222', N'1111', N'qma9tF+RcB152JmOQdfVgALnAGzHbXn24QH6sEu2IdUMHiEc', N'Đang hoạt động', N'ADMIN')
INSERT [dbo].[User] ([id], [username], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (6, N'test@email.com', N'test@email.com', N'11111', N'đại chỉ test hahhahhah', N'Mej5eQ3tZEEHBLJamzADcKvrIaB1uv6hpj7LbTN4NIY+zO58', N'Đang hoạt động', N'ADMIN')
INSERT [dbo].[User] ([id], [username], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (7, N'hung', N'hung@gmail.com', N'1111', N'111', N'tSXXqkRId67a23fZh6QEa+5PZKjEevgBlAhxc1PH7pVVYXuA', N'Đang hoạt động', N'USER')
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Index [IX_userId]    Script Date: 4/8/2022 10:56:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_userId] ON [dbo].[Bill]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_billId]    Script Date: 4/8/2022 10:56:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_billId] ON [dbo].[BillDetail]
(
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_pictureId]    Script Date: 4/8/2022 10:56:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_pictureId] ON [dbo].[BillDetail]
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_categoryId]    Script Date: 4/8/2022 10:56:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_categoryId] ON [dbo].[Product]
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF__Bill__dateCreate__108B795B]  DEFAULT ('1900-01-01T00:00:00.000') FOR [dateCreate]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bill_dbo.User_userId] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_dbo.Bill_dbo.User_userId]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BillDetail_dbo.Bill_billId] FOREIGN KEY([billId])
REFERENCES [dbo].[Bill] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_dbo.BillDetail_dbo.Bill_billId]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BillDetail_dbo.Picture_pictureId] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_dbo.BillDetail_dbo.Picture_pictureId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Picture_dbo.Category_categoryId] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Picture_dbo.Category_categoryId]
GO
USE [master]
GO
ALTER DATABASE [LaptopStoreDB] SET  READ_WRITE 
GO
