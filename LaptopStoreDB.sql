USE [master]
GO
/****** Object:  Database [LaptopStoreDB]    Script Date: 4/7/2022 5:58:54 PM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 4/7/2022 5:58:54 PM ******/
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
/****** Object:  Table [dbo].[BillDetail]    Script Date: 4/7/2022 5:58:54 PM ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 4/7/2022 5:58:54 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 4/7/2022 5:58:54 PM ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 4/7/2022 5:58:54 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 4/7/2022 5:58:54 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 4/7/2022 5:58:54 PM ******/
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
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (3, N'user2', N'emial2@email.com', N'1111', N'1111', N'TPLeVRzM2/UgEcLNNWKuxcu2YQhoHm9PeuXMbtGviScD01Ed', N'Đang hoạt động', N'ADMIN')
INSERT [dbo].[User] ([id], [username], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (4, N'thaatj', N'test@email.comm', N'asdasd', N'1111', N'LryV8aYPA2VtAy2WUuPpTrihKHiZj2q5Sxmz1Wpv14XIx9Ng', N'Đang hoạt động', N'ADMIN')
INSERT [dbo].[User] ([id], [username], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (5, N'testt', N'testt@email.com.vn', N'2222', N'1111', N'qma9tF+RcB152JmOQdfVgALnAGzHbXn24QH6sEu2IdUMHiEc', N'Đang hoạt động', N'ADMIN')
INSERT [dbo].[User] ([id], [username], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (6, N'test@email.com', N'test@email.com', N'11111', N'đại chỉ test hahhahhah', N'Mej5eQ3tZEEHBLJamzADcKvrIaB1uv6hpj7LbTN4NIY+zO58', N'Đang hoạt động', N'ADMIN')
INSERT [dbo].[User] ([id], [username], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (7, N'hung', N'hung@gmail.com', N'1111', N'111', N'tSXXqkRId67a23fZh6QEa+5PZKjEevgBlAhxc1PH7pVVYXuA', N'Đang hoạt động', N'USER')
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Index [IX_userId]    Script Date: 4/7/2022 5:58:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_userId] ON [dbo].[Bill]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_billId]    Script Date: 4/7/2022 5:58:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_billId] ON [dbo].[BillDetail]
(
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_pictureId]    Script Date: 4/7/2022 5:58:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_pictureId] ON [dbo].[BillDetail]
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_categoryId]    Script Date: 4/7/2022 5:58:54 PM ******/
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
