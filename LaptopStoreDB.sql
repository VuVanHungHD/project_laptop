USE [master]
GO
/****** Object:  Database [LaptopStoreDB]    Script Date: 5/14/2022 5:04:55 PM ******/
CREATE DATABASE [LaptopStoreDB]
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
/****** Object:  Table [dbo].[Bill]    Script Date: 5/14/2022 5:04:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[total] [decimal](18, 0) NOT NULL,
	[status] [nvarchar](max) NULL,
	[userId] [int] NOT NULL,
	[dateCreate] [datetime] NULL CONSTRAINT [DF__Bill__dateCreate__108B795B]  DEFAULT ('1900-01-01T00:00:00.000'),
	[note] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 5/14/2022 5:04:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[count] [int] NOT NULL,
	[billId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[address] [nvarchar](300) NULL,
	[phoneNumber] [varchar](15) NULL,
 CONSTRAINT [PK_dbo.BillDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 5/14/2022 5:04:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[author] [nvarchar](50) NULL,
	[userId] [int] NULL,
	[dateCreate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/14/2022 5:04:55 PM ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 5/14/2022 5:04:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [ntext] NULL,
	[email] [nvarchar](50) NULL,
	[phonenumber] [nvarchar](15) NOT NULL,
	[address] [nvarchar](200) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/14/2022 5:04:55 PM ******/
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
	[createDate] [datetime] NULL,
	[status] [nvarchar](max) NULL,
	[warranty] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/14/2022 5:04:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[customerName] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phonenumber] [nvarchar](15) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[status] [nvarchar](30) NULL,
	[userType] [nvarchar](10) NOT NULL CONSTRAINT [DF__User__userType__1CF15040]  DEFAULT (''),
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Comment]    Script Date: 5/14/2022 5:04:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rating] [int] NULL CONSTRAINT [DF_User_Comment_rating]  DEFAULT ((1)),
	[content] [nvarchar](max) NULL,
	[datePost] [datetime] NULL,
	[productId] [int] NOT NULL,
	[userId] [int] NOT NULL,
 CONSTRAINT [PK__User_Com__3213E83FD8670A9B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [total], [status], [userId], [dateCreate], [note]) VALUES (41, CAST(20825000 AS Decimal(18, 0)), N'Đã hủy', 7, CAST(N'2022-04-16 09:00:14.960' AS DateTime), N'tôi thích hủy')
INSERT [dbo].[Bill] ([id], [total], [status], [userId], [dateCreate], [note]) VALUES (42, CAST(20825000 AS Decimal(18, 0)), N'Đã giao', 7, CAST(N'2022-04-16 09:07:00.973' AS DateTime), N'hmmm... thích')
INSERT [dbo].[Bill] ([id], [total], [status], [userId], [dateCreate], [note]) VALUES (1041, CAST(20825000 AS Decimal(18, 0)), N'Đã giao', 7, CAST(N'2022-04-16 15:34:44.750' AS DateTime), NULL)
INSERT [dbo].[Bill] ([id], [total], [status], [userId], [dateCreate], [note]) VALUES (1043, CAST(20825000 AS Decimal(18, 0)), N'Đã giao', 7, CAST(N'2022-05-04 10:07:45.740' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillDetail] ON 

INSERT [dbo].[BillDetail] ([id], [count], [billId], [productId], [address], [phoneNumber]) VALUES (48, 1, 41, 1, N'hải dương quang thành', N'0373857323')
INSERT [dbo].[BillDetail] ([id], [count], [billId], [productId], [address], [phoneNumber]) VALUES (49, 1, 42, 1, N'111', N'1111')
INSERT [dbo].[BillDetail] ([id], [count], [billId], [productId], [address], [phoneNumber]) VALUES (1048, 1, 1041, 1, N'ngã tư hải dương', N'1111')
INSERT [dbo].[BillDetail] ([id], [count], [billId], [productId], [address], [phoneNumber]) VALUES (1049, 1, 1043, 1, N'2', N'2')
SET IDENTITY_INSERT [dbo].[BillDetail] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([id], [name], [content], [author], [userId], [dateCreate]) VALUES (1, N'El Salvador đứng trước nguy cơ vỡ nợ vì kế hoạch dùng Bitcoin làm đồng tiền quốc gia là một thảm họa', N'<p><em><strong>V&igrave; thị trường tiền điện tử lao dốc kh&ocirc;ng phanh n&ecirc;n đồng tiền quốc gia của El Salvador &ndash; Bitcoin &ndash; cũng bị ảnh hưởng nghi&ecirc;m trọng.</strong></em></p>
<p>Hồi th&aacute;ng 9/2021, El Salvador ch&iacute;nh thức chọn Bitcoin l&agrave;m đồng tiền quốc gia, bất chấp cảnh b&aacute;o về rủi ro. V&agrave; b&acirc;y giờ th&igrave; họ đang đứng trước t&igrave;nh thế dầu s&ocirc;i lửa bỏng do c&oacute; nguy cơ vỡ nợ đối với c&aacute;c nh&agrave; t&agrave;i ch&iacute;nh quốc tế trong v&ograve;ng v&agrave;i năm tới. L&yacute; do l&agrave; v&igrave; thị trường tiền điện tử hiện nay đang lao dốc kh&ocirc;ng phanh.</p>
<figure><a href="https://gstatic.gvn360.com/2022/05/xBWFR4Usj7CEhoKrA4wfGU-1200-80.jpg"><img width="1200" height="675" src="https://gstatic.gvn360.com/2022/05/xBWFR4Usj7CEhoKrA4wfGU-1200-80.jpg" alt="bitcoin El Salvador" srcset="https://gstatic.gvn360.com/2022/05/xBWFR4Usj7CEhoKrA4wfGU-1200-80-300x169.jpg 300w, https://gstatic.gvn360.com/2022/05/xBWFR4Usj7CEhoKrA4wfGU-1200-80-1024x576.jpg 1024w, https://gstatic.gvn360.com/2022/05/xBWFR4Usj7CEhoKrA4wfGU-1200-80-768x432.jpg 768w, https://gstatic.gvn360.com/2022/05/xBWFR4Usj7CEhoKrA4wfGU-1200-80-696x385.jpg 696w, https://gstatic.gvn360.com/2022/05/xBWFR4Usj7CEhoKrA4wfGU-1200-80-1068x580.jpg 1068w, https://gstatic.gvn360.com/2022/05/xBWFR4Usj7CEhoKrA4wfGU-1200-80.jpg 1200w" sizes="(max-width: 1200px) 100vw, 1200px"></a></figure>
<p>Nayib Bukele &ndash; Tổng thống El Salvador &ndash; l&agrave; một người đam m&ecirc; tiền điện tử, nhưng bản th&acirc;n El Salvador lại phải chật vật với vấn đề về đồng tiền quốc gia trong v&ograve;ng 20 năm qua. Đất nước n&agrave;y đ&atilde; từ bỏ đồng tiền của họ v&agrave; chuyển sang kiểm so&aacute;t ch&iacute;nh s&aacute;ch tiền tệ để d&ugrave;ng đồng USD; mục ti&ecirc;u l&agrave; để ổn định về mặt t&agrave;i ch&iacute;nh. Nhiều người Salvador phải dựa v&agrave;o kiều hối (tiền gửi từ người th&acirc;n ở nước ngo&agrave;i) để trang trải cuộc sống, v&agrave; những khoản tiền đ&oacute; phải th&ocirc;ng qua c&aacute;c dịch vụ &ldquo;ăn chặn&rdquo; rất gh&ecirc; gớm th&igrave; mới c&oacute; thể đến được nơi n&oacute; cần đến.</p>
<figure><a href="https://gstatic.gvn360.com/2022/05/JD-May-El-equipo-de-YuanPay-aconseja-sobre-la-inversion-segura-en-criptomonedas.jpg"><img width="2560" height="1440" src="https://gstatic.gvn360.com/2022/05/JD-May-El-equipo-de-YuanPay-aconseja-sobre-la-inversion-segura-en-criptomonedas.jpg" alt="bitcoin El Salvador" srcset="https://gstatic.gvn360.com/2022/05/JD-May-El-equipo-de-YuanPay-aconseja-sobre-la-inversion-segura-en-criptomonedas-300x169.jpg 300w, https://gstatic.gvn360.com/2022/05/JD-May-El-equipo-de-YuanPay-aconseja-sobre-la-inversion-segura-en-criptomonedas-1024x576.jpg 1024w, https://gstatic.gvn360.com/2022/05/JD-May-El-equipo-de-YuanPay-aconseja-sobre-la-inversion-segura-en-criptomonedas-768x432.jpg 768w, https://gstatic.gvn360.com/2022/05/JD-May-El-equipo-de-YuanPay-aconseja-sobre-la-inversion-segura-en-criptomonedas-1536x864.jpg 1536w, https://gstatic.gvn360.com/2022/05/JD-May-El-equipo-de-YuanPay-aconseja-sobre-la-inversion-segura-en-criptomonedas-2048x1152.jpg 2048w, https://gstatic.gvn360.com/2022/05/JD-May-El-equipo-de-YuanPay-aconseja-sobre-la-inversion-segura-en-criptomonedas-696x385.jpg 696w, https://gstatic.gvn360.com/2022/05/JD-May-El-equipo-de-YuanPay-aconseja-sobre-la-inversion-segura-en-criptomonedas-1068x580.jpg 1068w, https://gstatic.gvn360.com/2022/05/JD-May-El-equipo-de-YuanPay-aconseja-sobre-la-inversion-segura-en-criptomonedas.jpg 2560w" sizes="(max-width: 2560px) 100vw, 2560px"></a></figure>
<p>Tiếc rằng việc sử dụng đồng Bitcoin lại kh&ocirc;ng gi&uacute;p nền kinh tế đất nước đi l&ecirc;n c&aacute;c bạn ạ. Ứng dụng v&iacute; tiền điện tử m&agrave; ch&iacute;nh phủ nước n&agrave;y ban h&agrave;nh kh&ocirc;ng được đ&aacute;ng tin cậy cho lắm, v&agrave; bản chất biến động thất thường của tiền điện tử đ&atilde; khiến cho việc sử dụng n&oacute; hằng ng&agrave;y trở th&agrave;nh một nỗi phiền to&aacute;i.</p>
<figure><a href="https://gstatic.gvn360.com/2022/05/a-bitcoin-covered-in-black-crystals-1.jpg"><img width="1245" height="701" src="https://gstatic.gvn360.com/2022/05/a-bitcoin-covered-in-black-crystals-1.jpg" alt="bitcoin El Salvador" srcset="https://gstatic.gvn360.com/2022/05/a-bitcoin-covered-in-black-crystals-1-300x169.jpg 300w, https://gstatic.gvn360.com/2022/05/a-bitcoin-covered-in-black-crystals-1-1024x577.jpg 1024w, https://gstatic.gvn360.com/2022/05/a-bitcoin-covered-in-black-crystals-1-768x432.jpg 768w, https://gstatic.gvn360.com/2022/05/a-bitcoin-covered-in-black-crystals-1-696x385.jpg 696w, https://gstatic.gvn360.com/2022/05/a-bitcoin-covered-in-black-crystals-1-1068x580.jpg 1068w, https://gstatic.gvn360.com/2022/05/a-bitcoin-covered-in-black-crystals-1.jpg 1245w" sizes="(max-width: 1245px) 100vw, 1245px"></a></figure>
<p>B&acirc;y giờ th&igrave; thị trường tiền điện tử đang sập, cho n&ecirc;n El Salvador c&agrave;ng &iacute;t c&oacute; khả năng thanh to&aacute;n kịp khoản tr&aacute;i phiếu tiếp theo, dẫn đến kết cục l&agrave; kh&ocirc;ng trả được tiền nợ của quốc gia. Nếu điều n&agrave;y xảy ra th&igrave; sẽ g&acirc;y thiệt hại v&ocirc; c&ugrave;ng to lớn cho nền kinh tế của El Salvador, l&agrave;m ảnh hưởng đến cả khả năng đ&aacute;p ứng những chức năng cơ bản của ch&iacute;nh phủ.</p>
<p>C&ograve;n về ph&iacute;a Bukele th&igrave; &ocirc;ng lại c&oacute; một niềm tin vững chắc v&agrave;o tiền điện tử, v&agrave; &ocirc;ng mới vừa mua 500 Bitcoin (l&uacute;c mua l&agrave; 15,5 triệu USD, c&ograve;n tại thời điểm b&agrave;i viết l&agrave; khoảng 14,1 triệu USD) v&agrave;o ng&agrave;y 09/05/2022.</p>
<p><strong>T&oacute;m tắt &yacute; ch&iacute;nh:</strong></p>
<ul>
    <li>Hồi th&aacute;ng 9/2021, El Salvador ch&iacute;nh thức chọn Bitcoin l&agrave;m đồng tiền quốc gia</li>
    <li>B&acirc;y giờ th&igrave; El Salvador đứng trước nguy cơ vỡ nợ đối với c&aacute;c nh&agrave; t&agrave;i ch&iacute;nh quốc tế trong v&ograve;ng v&agrave;i năm tới</li>
    <li>L&yacute; do l&agrave; v&igrave; thị trường tiền điện tử đang lao dốc kh&ocirc;ng phanh, khiến El Salvador kh&oacute; thể n&agrave;o thanh to&aacute;n kịp khoản tr&aacute;i phiếu tiếp theo</li>
    <li>Điều n&agrave;y sẽ g&acirc;y thiệt hại v&ocirc; c&ugrave;ng to lớn cho nền kinh tế của El Salvador</li>
</ul>', N'GearVN', 6, CAST(N'2022-05-14 17:01:46.567' AS DateTime))
INSERT [dbo].[Blog] ([id], [name], [content], [author], [userId], [dateCreate]) VALUES (3, N'Mất nhau chỉ là nhất thời, hướng dẫn khôi phục lịch sử Google DOC siêu đơn giản', N'<p><strong><em>Hướng dẫn kh&ocirc;i phục lịch sử Google DOC đơn giản, mang lại những dữ liệu đ&atilde; mất về như l&uacute;c đầu.</em></strong></p>
<p>Google DOC l&agrave; một c&ocirc;ng cụ được sử dụng kh&aacute; phổ biến hiện nay, v&igrave; n&oacute; tiện nghi v&agrave; dễ sử dụng. C&ocirc;ng cụ n&agrave;y cũng c&oacute; một t&iacute;nh năng kh&aacute; hay đ&oacute; l&agrave; kh&ocirc;i phục dữ liệu đ&atilde; x&oacute;a theo mốc thời gian. Nếu như bạn c&oacute; v&ocirc; t&igrave;nh x&oacute;a mất nội dung khi đang g&otilde; DOC th&igrave; cũng đừng lo, t&iacute;nh năng n&agrave;y sẽ gi&uacute;p bạn lấy lại dữ liệu đ&atilde; mất, v&agrave; thậm ch&iacute; l&agrave; bạn c&oacute; thể kh&ocirc;i phục lại theo từng mốc thời gian theo bạn mong muốn.</p>
<p>Bước 1: Mở Google DOC, chọn&nbsp;<strong>Tệp</strong> rồi chọn<strong>&nbsp;Lịch sử phi&ecirc;n bản</strong> rồi chọn tiếp&nbsp;<strong>Xem lịch sử phi&ecirc;n bản</strong>.</p>
<figure><a href="https://gstatic.gvn360.com/2022/05/111-9.jpg"><img src="/images/pictures/khoi_phuc_gg_doc_pic_1" alt="khôi phục DOC " width="999" height="676" srcset="https://gstatic.gvn360.com/2022/05/111-9-300x203.jpg 300w, https://gstatic.gvn360.com/2022/05/111-9-1024x693.jpg 1024w, https://gstatic.gvn360.com/2022/05/111-9-768x520.jpg 768w, https://gstatic.gvn360.com/2022/05/111-9-696x385.jpg 696w, https://gstatic.gvn360.com/2022/05/111-9.jpg 1028w" sizes="(max-width: 999px) 100vw, 999px"></a></figure>
<p>Bước 2: Cửa sổ b&ecirc;n tr&aacute;i sẽ hiện ra, tại đ&acirc;y bạn sẽ thấy c&aacute;c mục thời gian m&agrave; Google DOC đ&atilde; lưu nội dung bạn g&otilde; v&agrave;o lịch sử.&nbsp;</p>
<figure><a href="https://gstatic.gvn360.com/2022/05/222-9-1024x478.jpg"><img width="1024" height="478" src="https://gstatic.gvn360.com/2022/05/222-9-1024x478.jpg" alt="khôi phục DOC " srcset="https://gstatic.gvn360.com/2022/05/222-9-300x140.jpg 300w, https://gstatic.gvn360.com/2022/05/222-9-1024x478.jpg 1024w, https://gstatic.gvn360.com/2022/05/222-9-768x359.jpg 768w, https://gstatic.gvn360.com/2022/05/222-9-696x385.jpg 696w, https://gstatic.gvn360.com/2022/05/222-9-1068x580.jpg 1068w, https://gstatic.gvn360.com/2022/05/222-9.jpg 1250w" sizes="(max-width: 1024px) 100vw, 1024px"></a></figure>
<p>Bước 3: Chọn mốc thời gian m&agrave; bạn muốn kh&ocirc;i phục, click v&agrave;o&nbsp;<strong>dấu 3 chấm</strong> rồi chọn&nbsp;<strong>Kh&ocirc;i phục phi&ecirc;n bản n&agrave;y</strong>. DOC sẽ gửi th&ocirc;ng b&aacute;o x&aacute;c nhận, bạn đồng &yacute; l&agrave; được.</p>
<figure><a href="https://gstatic.gvn360.com/2022/05/333-10.jpg"><img src="https://gstatic.gvn360.com/2022/05/333-10.jpg" alt="khôi phục DOC " width="998" height="518"></a></figure>
<p>Nếu như bạn muốn xem th&ecirc;m nhiều mốc thời gian hơn nữa, bạn chọn v&agrave;o<strong>&nbsp;dấu mũi t&ecirc;n</strong> sẽ thấy.</p>
<figure><a href="https://gstatic.gvn360.com/2022/05/444-6.jpg"><img src="https://gstatic.gvn360.com/2022/05/444-6.jpg" alt="khôi phục DOC " width="1001" height="651" srcset="https://gstatic.gvn360.com/2022/05/444-6-300x195.jpg 300w, https://gstatic.gvn360.com/2022/05/444-6-768x498.jpg 768w" sizes="(max-width: 1001px) 100vw, 1001px"></a></figure>
<p><strong><em>Cảm ơn c&aacute;c bạn đ&atilde; quan t&acirc;m theo d&otilde;i!</em></strong></p>', N'GearVN', 6, CAST(N'2022-05-14 16:59:11.543' AS DateTime))
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1007, N'Laptop Dell Gaming', N'Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa. Chi tiết máy được thiết kế và hoàn thiện với chất lượng vượt trội, thêm vào đó những chiếc Laptop gaming luôn được áp dụng các công nghệ mới nhất, mạnh nhất về phần cứng. Laptop gaming thường được thiết kế với kiểu dáng hiện đại, góc cạnh, hầm hố cùng màu sắc bắt mắt như đỏ đen, xanh đen, đen xám,... Kích thước thân máy thường lớn, dày để bố trí hệ thống tản nhiệt.', 0)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1008, N'Laptop MSI Gaming', N'Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa. Chi tiết máy được thiết kế và hoàn thiện với chất lượng vượt trội, thêm vào đó những chiếc Laptop gaming luôn được áp dụng các công nghệ mới nhất, mạnh nhất về phần cứng. Laptop gaming thường được thiết kế với kiểu dáng hiện đại, góc cạnh, hầm hố cùng màu sắc bắt mắt như đỏ đen, xanh đen, đen xám,... Kích thước thân máy thường lớn, dày để bố trí hệ thống tản nhiệt.', 0)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1009, N'Laptop HP Gaming', N'Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa.

Chi tiết máy được thiết kế và hoàn thiện với chất lượng vượt trội, thêm vào đó những chiếc Laptop gaming luôn được áp dụng các công nghệ mới nhất, mạnh nhất về phần cứng.
Laptop gaming thường được thiết kế với kiểu dáng hiện đại, góc cạnh, hầm hố cùng màu sắc bắt mắt như đỏ đen, xanh đen, đen xám,... Kích thước thân máy thường lớn, dày để bố trí hệ thống tản nhiệt.', 0)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1011, N'Laptop Asus Gaming', N'Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa. Chi tiết máy được thiết kế và hoàn thiện với chất lượng vượt trội, thêm vào đó những chiếc Laptop gaming luôn được áp dụng các công nghệ mới nhất, mạnh nhất về phần cứng. Laptop gaming thường được thiết kế với kiểu dáng hiện đại, góc cạnh, hầm hố cùng màu sắc bắt mắt như đỏ đen, xanh đen, đen xám,... Kích thước thân máy thường lớn, dày để bố trí hệ thống tản nhiệt.', 0)
INSERT [dbo].[Category] ([id], [name], [descript], [parentId]) VALUES (1012, N'Laptop Acer Gaming', N'Laptop gaming (laptop chuyên game) là loại máy tính xách tay được thiết kế nâng cấp chuyên biệt phục vụ cho việc chơi game nặng, các trò chơi điện tử trên máy tính cần có xử lý mạnh về đồ họa. Chi tiết máy được thiết kế và hoàn thiện với chất lượng vượt trội, thêm vào đó những chiếc Laptop gaming luôn được áp dụng các công nghệ mới nhất, mạnh nhất về phần cứng. Laptop gaming thường được thiết kế với kiểu dáng hiện đại, góc cạnh, hầm hố cùng màu sắc bắt mắt như đỏ đen, xanh đen, đen xám,... Kích thước thân máy thường lớn, dày để bố trí hệ thống tản nhiệt.', 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([id], [content], [email], [phonenumber], [address]) VALUES (1, N'Công ty cổ phần phát triển website by Hùng', N'vuhung@gmail.com', N'0373857323', N'Hải Dương')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (1, N'Laptop Dell Inspiron 7577', 1007, CAST(24500000 AS Decimal(18, 0)), 15, CAST(20825000 AS Decimal(18, 0)), N'Laptop Dell Inspiron 7577 (Core i7-7700HQ, 8GB, 1TB + 128GB , VGA 6GB NVIDIA GTX 1060, 15.6 inch FHD IPS)', N'Laptop Inspiron Dell 7577 được thiết kế vượt trội, khác với Dell N7567, N5577 ra trước thì em này đươc thiết kế đẹp hơn đỡ bám vân tay hơn chắc chắn hơn. Đặc biệt, phần tỳ tay đã được trang bị bằng nhôm nên khả năng chống xước và bám bụi tốt hơn.
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
Rõ ràng, Dell Inspiron 15 7000Series 7577 là sự lụa chọn cực kì tốt với màn hình IPS sắc nét, tuổi thọ pin cao, hệ thống tản nhiệt tốt và giá cả tốt. Đặc biệt, chúng ta sẽ phải kể đến việc được trang bị cổng Thunderbolt 3 cực kì tốt để nâng cấp sau này. Các bạn có thể qua cửa hàng LaptopAZ để có thể trải nghiệm sản phẩm trực tiếp.', N'Intel® Core™ i7-7700HQ', N'8GB DDR4 Bus 2400', N'HDD 1TB ', N'NVIDIA GTX 1060 6GB', N'15.6 inch FHD (1920x1080)', N'HD 720P', N'USB 2.0, USB 3.0, Lan', N'2.5 kg', N'6 Cells', N'Windows 10 bản quyền', 18, N'/images/pictures/Laptop_dell_inspiron_7577.jpg', CAST(N'2022-04-07 16:13:00.773' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (2, N'Laptop Dell Vostro V7570', 1007, CAST(23890000 AS Decimal(18, 0)), 13, CAST(20784300 AS Decimal(18, 0)), N'Laptop Dell Vostro V7570 (Core i7-7700HQ, 8GB, 1TB + 128GB, VGA 4GB NVIDIA GeForce GTX 1050Ti, 15.6 inch FHD IPS)', N'Là dòng laptop Gaming phổ thông chiến game khỏe thời điểm hiện tại. Thiết kế vượt trội, khác với Dell N7566, N7559 ra trước thì em này đươc thiết kế mềm mại hơn, dầy hơn và chắc chắn hơn với không gian tản nhiệt tốt hơn. Đặc biệt, phần tỳ tay đã được trang bị bằng nhôm nên khả năng chống xước và bám bụi tốt hơn. Màu sắc Trắng- Bạc cũng tạo điểm nhấn mới lạ cho máy.
 
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

', N'Intel Core i7- 7700HQ (2.8GHz up to 3.8GHz Cache 6M 4 lõi 8 luồng)', N' 8GB DDR4 2400MHz', N' 1TB HDD + SSD 128 M2', N' NVIDIA GeForce GTX 1050ti 4GB', N'15.6 inch Full HD IPS', N'1.3 Megapixels', N'HDMI, USB 3.0, USB 2.0, LAN,  Bluetooth 4.0.', N'2.65 kg', N'6 cells (sử dụng liên tục được 2-3 giờ)', N'Windows 10', 16, N'/images/pictures/Laptop_Dell_Vostro_V7570.JPG', CAST(N'2022-04-07 16:36:42.593' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (3, N'Laptop Dell G3 3579', 1007, CAST(20890000 AS Decimal(18, 0)), 10, CAST(18801000 AS Decimal(18, 0)), N'[Mới 99%] Laptop Dell G3 3579 (Core i7-8750H, 8GB, 1TB + 128GB , VGA 4GB GTX 1050Ti, 15.6'' FHD IPS)', N' Laptop Dell G3 3579 là dòng sản phẩm được Dell sản xuất ra hướng đến đối tượng người dùng cần một chiếc máy vừa có thể chơi Game, vừa có thể làm việc đồng thời mức giá lại thấp hơn kha khá nếu đem so với các dòng máy Dell Alienware.
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

Phiên bản mà các bạn đang xem được trang bị cấu hình cao cấp nhất trong dòng Laptop Dell G3 3579 với con Chip i7 vô cùng mạnh mẽ.', N'Intel® Core™ i7-8750H', N'8GB DDR4 Bus 2666MHz', N'SSD 128GB + HDD 1TB ', N'NVIDIA GTX 1050Ti 4GB', N'15.6 inch FHD IPS', N'HD 720P', N'USB 3.0, HDMI, jack 3.5', N'2.5 kg', N'2-3 Giờ', N'Windows 10 bản quyền', 0, N'/images/pictures/1176_laptop_dell_g3_3579_gaming___laptopaz__1_.jpg', CAST(N'2022-04-07 16:36:42.593' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (4, N'Dell Alienware M17 R2', 1007, CAST(42890000 AS Decimal(18, 0)), 0, CAST(42890000 AS Decimal(18, 0)), N'[Mới 99%] Dell Alienware M17 R2 (Core i7-9750H, 16GB, 512GB, VGA RTX 2070 8GB DDR6, 17.3 inch FHD 144Hz)
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
<br/>', N'Intel® Core™ i7-9750H', N'	16GB DDR4 Bus 2666MHz', N'	SSD 512GB NVMe', N'NVIDIA RTX 2070 8GB DDR6', N'	17.3 FHD IPS 144Hz', N'HD 720P', N'	HDMI, USB 2.0, USB 3.0', N'2.6 kg', N'2.6 kg', N'Windows 10', 0, N'/images/pictures/Dell_Alienware_M17_R2.jpg', CAST(N'2022-04-07 16:44:23.133' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (5, N'Dell Alienware M17 R3 2020', 1007, CAST(60000000 AS Decimal(18, 0)), 3, CAST(58200000 AS Decimal(18, 0)), N'[Mới 100%] Dell Alienware M17 R3 2020 (Core i7-10750H, 16GB, 1TB, VGA RTX 2070 Super, 17.3 inch FHD 300Hz)', N'
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

Bàn di chuột cao cấp: Bàn di chuột bằng kính có độ chính xác mang tới trải nghiệm chơi game chất lượng cao mà chúng ta có thể cảm nhận được.', N'Intel® Core™ i7-10750H', N'16GB DDR4 Bus 2666MHz', N'SSD 1TB', N'NVIDIA RTX 2070 super', N'17.3 FHD IPS 300Hz', N'HD 720P', N'HDMI, USB 2.0, USB 3.0', N'	2.6 kg', N'4 Cells', N'Windows 10', 1, N'/images/pictures/alienware-m17-r3.jpg', CAST(N'2022-04-07 16:55:37.293' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (6, N'Dell G7 7588', 1007, CAST(25000000 AS Decimal(18, 0)), 10, CAST(22500000 AS Decimal(18, 0)), N'Laptop cũ Dell G7 7588 (Core i5-8300H, 8GB, 1TB + 128GB , VGA 4GB GTX 1050Ti, 15.6 FHD IPS)
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
', N'Intel® Core™ i5-8300H', N'8GB DDR4 Bus 2666MHz', N'SSD 128GB + HDD 1TB ', N'NVIDIA GTX 1050Ti 4GB', N'15.6 inch FHD (1920x1080)', N'HD 720P', N' USB 3.0 ', N'2.5 kg', N'2-3 Giờ', N'Windows 10 bản quyền', 1, N'/images/pictures/Dell-G7-15-7588.png', CAST(N'2022-04-07 17:05:14.880' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (7, N'Dell Vostro 7580', 1007, CAST(28000000 AS Decimal(18, 0)), 15, CAST(23800000 AS Decimal(18, 0)), N'Laptop cũ Dell Vostro 7580 (Core i7-8750H, 8GB, 1TB + 128GB, VGA 4GB GTX 1050Ti, 15.6 FHD)
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
Dell Vostro 7580 là một mẫu máy doanh nhân kết hợp một chút gaming thật sự không ấn tượng trong tầm giá đối với mình. Điểm mạnh có lẽ là phần thiết kế bên ngoài sang trọng khá ấn tượng thêm nữa máy có nhiều cổng kết nối đa dạng khác nhau', N'Intel Core i7- 8750H (2.2GHz up to 4.1GHz Cache 9M 6 lõi 12 luồng)', N'8GB DDR4 2666MHz', N'HDD 1TB + SSD 128GB m2', N'NVIDIA GeForce GTX 1050Ti 4GB', N' 15.6 inch Full HD', N'độ nét HD', N'HDMI, USB 3.0, USB 2.0, Bluetooth, jiack phôn, khe đọc thẻ.', N'2.83 kg', N'Lion 4 cell', N'Windows 10', 0, N'/images/pictures/dell_gaming_7580.JPG', CAST(N'2022-04-07 17:18:53.133' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (8, N'Dell Gaming G15 5515', 1007, CAST(33000000 AS Decimal(18, 0)), 10, CAST(29700000 AS Decimal(18, 0)), N'[Mới 100%] Dell Gaming G15 5515 (Ryzen 7-5800H, 8GB, 512GB, RTX 3050Ti, 15.6'''' FHD 120Hz)
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
<b>Tổng Kết:</b>Dell Gaming G15 5515 là một trong những sự lựa chọn hàng đầu của dòng máy Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng không kém phần tinh tế, kết hợp cùng cấu hình mạnh mẽ và tản nhiệt mát mẻ, Dell Gaming G15 5515 tự tin có thể chinh phục được đa số các Game Online, Offline thời thượng hiện nay. Hơn thế nữa Dell Gaming G15 5515 cũng đủ sức đáp ứng các tác vụ thiết kế đồ họa, công việc, giải trí một cách mượt mà nhất.', N'AMD Ryzen 7 5800H', N'8GB DDR4 3200MHz Single Channel', N'512GB M.2 2280 PCIe NVMe  + 1 Khe M.2 NVMe  + 1 Khe 2,5 inchs Sata', N'NVIDIA® GeForce RTX™ 3050Ti 4GB GDDR6 (80W)', N'15.6 inch FHD (1920 x 1080) 120Hz 300 nits WVA Anti- Glare', N'HD 720P', N' 1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI | 6. Power In | 7. RJ45 Ethernet | 8. Headphones/Microphone', N'2.57kg', N'3 cell ', N'Windows 10 bản quyền', 0, N'/images/pictures/dell_gaming_g5_5515_r5.JPG', CAST(N'2022-04-07 17:33:47.567' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (15, N'Dell Gaming G15 5515 Ryzen 5-5600H', 1007, CAST(26000000 AS Decimal(18, 0)), 10, CAST(23400000 AS Decimal(18, 0)), N'[Mới 100%] Dell Gaming G15 5515 (Ryzen 5-5600H, 8GB, 256GB, RTX 3050 4GB, 15.6'''' FHD 120Hz)', N'<b>Dell Gaming G15 5515 hướng đến đối tượng nào?</b>
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

+ 1 Khe M.2 2280 PCIe NVMe', N'NVIDIA® GeForce RTX™ 3050 4GB GDDR6 (80W)', N'15.6 inch FHD (1920 x 1080) 120Hz 300 nits WVA ', N'HP 720P', N' 1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI | 6. Power In | 7. RJ45 Ethernet | 8. Headphones/Microphone', N'2.57kg', N'56WHr', N'Windows 11 bản quyền', 1, N'/images/pictures/dell_gaming_g5_5515_r5.JPG', CAST(N'2022-04-07 17:41:41.610' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (16, N'Dell Alienware M15 Ryzen', 1007, CAST(53000000 AS Decimal(18, 0)), 12, CAST(46640000 AS Decimal(18, 0)), N'[Mới 100%] Dell Alienware M15 Ryzen Edition Ryzen 7-5800H, 16GB, 256GB, RTX 3060, 15.6'''' FHD 165Hz
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
Nói tóm lại, Dell Alienware M15 R5 là chiến binh gaming cho hiệu năng vô cùng mạnh mẽ. Khi nó sở hữu con chip AMD mới nhất cùng card đồ hoạ RTX. Ngoài việc sở hữu thời lượng pin chưa được đánh giá cao thì tổng thể từ thiết kế cho đến hiệu năng, chiếc laptop gaming này được giới game thủ đánh giá khá cao. Nó là trợ thủ đắc lực cho những trận combat và trở thành chiếc máy tính đáng mua nhất hiện nay.', N'AMD Ryzen 7-5800H (8-Core, 20MB Total Cache, up to 4.4 GHz Max Boost Clock)', N'16GB DDR4 bus 3200 MHz (Nâng cấp tối đa 64GB)', N'SSD 256GB NVMe (Nâng cấp tối đa 2TB x 2)', N'NVIDIA® GeForce RTX™ 3060 6GB GDDR6', N'15.6" FHD WVA (Công nghệ hiển thị tương đương IPS) (1920 x 1080) 165Hz chống chói', N'HD 720P', N'1 x USB-C 3.2 Gen 2 (Hỗ trợ xuất hình DisplayPort 1.4),  3 x USB-A 3.2 Gen 1,  1 x HDMI 2.1,  1 x RJ-45,  1 x jack 3.5mm', N'2.69 kg', N'86 Wh', N'Windows 10', 1, N'/images/pictures/Dell_Alienware_M15_Ryzen_edition.JPG', CAST(N'2022-04-07 17:54:19.430' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (17, N'Dell G3-3590', 1007, CAST(25000000 AS Decimal(18, 0)), 10, CAST(22500000 AS Decimal(18, 0)), N'[Mới 99%] Dell G3-3590 i5-9300H, 8GB, 128GB + 1TB, VGA 4GB GTX 1650, 15.6'' FHD IPS
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
Thay vì mua một chiếc Dell G3-3590 core i5 mới đắt tiền thì hãy chọn Dell G3-3590 i5 cũ với mức giá hợp lý hơn mà hiệu năng vẫn như vậy. Liên hệ hotline .... để đặt mua Dell G3-3590 ngay hôm nay.', N'Intel® Core™ i5-9300H', N'8GB DDr4 2666MHz', N'SSD 128GB + HDD 1T', N'NVIDIA GTX 1650 4GB', N'15.6 inch FHD IPS', N'HD 720P', N'HDMI, USB 3.0, USB 2.0, LAN,  Bluetooth 4.0.', N'2.5 kg', N'6 Cells', N'Windows 10 bản quyền', 0, N'/images/pictures/Dell-G3-3590-core-i5.JPG', CAST(N'2022-04-08 08:33:14.143' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (19, N'Dell Gaming G15 5515 Ryzen 7-5800H', 1007, CAST(42000000 AS Decimal(18, 0)), 5, CAST(39900000 AS Decimal(18, 0)), N'[Mới 100%] Dell Gaming G15 5515 Ryzen 7-5800H, 16GB, 512GB, RTX 3060, 15.6'''' FHD 165Hz
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
<b>Tổng Kết:</b> So với những chiếc máy trong cùng phân khúc, chiếc máy này có hiệu năng và thiết rất đáng để đầu tư, không những vậy nó sẽ là trợ thủ rất đắc lực của bạn để có thể chìm đắm trong những trận game kinh điển.', N'AMD Ryzen™ 7 5800H 8-core/16-thread - (3.2 GHz up 4.40 GHz) L3 Cache 16MB TDP45W', N'16GB DDR4 3200MHz', N'512GB M.2 2280 PCIe NVMe', N'NVIDIA® GeForce RTX™ 3060 6GB GDDR6', N'15.6 inch FHD (1920 x 1080) 165Hz 300 nits WVA Anti- Glare LED Backlit Narrow Border Display', N'HD 720P', N' 1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI | 6. Power In | 7. RJ45 Ethernet | 8. Headphones/Microphone', N'2.57kg', N'6-Cell Battery, 86WHr', N'Windows 10 bản quyền', 7, N'/images/pictures/dell_g5_5515_pic_layout.JPG', CAST(N'2022-04-08 09:00:03.310' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (20, N'Dell Gaming G5 15 5511', 1007, CAST(42000000 AS Decimal(18, 0)), 8, CAST(38640000 AS Decimal(18, 0)), N'[Mới 100%] Dell Gaming G5 15 5511 (Core i7-11800H, 16GB, 512GB, RTX 3060, 15.6'''' FHD 165Hz)', N'<b>Tại sao bạn nên chọn Dell Gaming G5 15 5511?</b><br/>
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

<b>Kết luận:</b> Dell Gaming G5 15 5511 là một trong những sự lựa chọn hàng đầu của dòng máy Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng không kém phần tinh tế, kết hợp cùng cấu hình mạnh mẽ và tản nhiệt mát mẻ, Dell Gaming G5 15 5511 tự tin có thể chinh phục được đa số các Game Online, Offline thời thượng hiện nay. Hơn thế nữa Dell Gaming G5 15 5511 cũng đủ sức đáp ứng các tác vụ thiết kế đồ họa, công việc, giải trí một cách mượt mà nhất. ', N'Intel® Core™ i7-11800H', N'16GB DDR4 2933MHz', N'512GB M.2 PCIe NVMe Solid State Drive', N'NVIDIA® GeForce® RTX 3060 6GB GDDR6', N'15.6 inch FHD (1920 x 1080), 250nits 165Hz WVA Anti- Glare LED Backlit Narrow Border Display', N'HD RGB camera with digital-array microphones', N'SuperSpeed USB 2.0 | 2. SuperSpeed USB 2.0 with PowerShare) | 4. SuperSpeed USB 3.2 l 5. HDMI | 6. Giắc nguồn | 7. RJ45 | 8. Headphones/mic', N'2.65 kg', N'4-Cell, 86WHr', N'Windows 10 bản quyền', 0, N'/images/pictures/dell_g5_5511_pic_layout.JPG', CAST(N'2022-04-08 09:11:01.767' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (21, N'Dell Gaming G5 15 5510', 1007, CAST(35000000 AS Decimal(18, 0)), 10, CAST(31500000 AS Decimal(18, 0)), N'[Mới 100%] Dell Gaming G5 15 5510 (Core i7-10870H, 16GB, 512GB, RTX 3060, 15.6'''' FHD 120Hz)', N'<b>Tại sao bạn nên chọn Dell Gaming G5 15 5510?</b><br/><br/>
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
Trọng lượng khởi điểm: 2,65 kg', N'Intel® Core™ i7-10870H', N'16GB DDR4 2933MHz', N'512GB M.2 PCIe NVMe Solid State Drive', N'NVIDIA® GeForce® RTX 3060 6GB GDDR6', N'15.6 inch FHD (1920 x 1080), 250nits 120Hz WVA Anti- Glare LED Backlit Narrow Border Display', N'HD RGB camera with digital-array microphones', N'SuperSpeed USB 2.0 | 2. SuperSpeed USB 2.0 with PowerShare) | 4. SuperSpeed USB 3.2 l 5. HDMI | 6. Giắc nguồn | 7. RJ45 | 8. Headphones/mic', N'2.65 kg', N'3-Cell, 56WHr', N'Windows 10 bản quyền', 0, N'/images/pictures/dell_g5_5510_pic_layout.JPG', CAST(N'2022-04-08 09:20:01.847' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (22, N'Dell Gaming G7 7700', 1007, CAST(41000000 AS Decimal(18, 0)), 2, CAST(40180000 AS Decimal(18, 0)), N'[Mới 99%] Dell Gaming G7 7700 (Core i7-10750H, 16GB, 512GB, RTX 2070, 17.3 FHD 300Hz)', N'<br/><b>THIẾT KẾ HẦM HỐ HƠN</b><br/>
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
Với việc tạo ra phần mềm được thiết kế đặc biệt để cải thiện trải nghiệm chơi trò chơi của bạn, tinh chỉnh tất cả cài đặt trò chơi và hệ thống của bạn, giải quyết vấn đề và quản lý thời gian.', N'Intel® Core™ i7-9750H', N'16GB DDR4 Bus 2666MHz', N'SSD 256GB + HDD 1TB ', N'NVIDIA GTX 1660Ti 6GB', N'17.3 inch FHD (1920x1080)', N'HD 720P', N' USB 3.0 ', N'2.7 kg', N'2-3 Giờ', N'Windows 10 bản quyền', 0, N'/images/pictures/dell_g7_7700_pic_layout.JPG', CAST(N'2022-04-08 09:29:04.183' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (23, N'MSI Bravo 15 B5DD 010US', 1008, CAST(27000000 AS Decimal(18, 0)), 10, CAST(24300000 AS Decimal(18, 0)), N'[Mới 100%] MSI Bravo 15 B5DD 010US (Ryzen 5-5600H, 16GB, 512GB, Radeon RX5500M, 15.6'''' FHD 144Hz)', N'<br/><b>Laptop MSI Bravo 15 B5DD 010US Ryzen 5-5600H dành cho ai?</b><br/>

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
<b>Tổng Kết: </b>Trong phân khúc 21 triệu đồng, chiếc laptop MSI Bravo 15 B5DD 010US hoàn toàn xứng đáng có một chỗ đứng vững chắc, và là sự lựa chọn vô cùng hợp lý dành cho các bạn đang tìm kiếm những mẫu máy gaming trong phân khúc này. Hãy đến LaptopAZ ngay hôm nay để được trải nghiệm và lựa chọn những mẫu máy ưng ý nhất.', N'AMD Ryzen 5-5600H Processor (3.30GHz up to 4.20GHz, 16MB Cache)', N'16GB DDR4 3200MHz', N'512GB NVMe PCIe Gen3x4 SSD', N'AMD Radeon RX5500M 4GB GDDR6', N'15.6inch FHD (1920 x 1080), 144Hz 45%NTSC IPS-Level', N'HD 720P', N'1 x HDMI 1 x USB Type-C 2 x USB 3.1 1 x Jack Audio™ 1 x LAN RJ45 Gigabit 1 x Hi-Res Audio™ with Nahimic 3 Audio™ 1 x CoolerBoost 5 (2 Fans with 7 heat pipes)', N'2.35kg', N'3 cell, 52Whr', N'Windows 10 bản quyền', 0, N'/images/pictures/msi_bravo_15_pic_layout.JPG', CAST(N'2022-04-08 09:42:13.967' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (24, N'MSI Gaming GP66 Leopard 10UE-206VN', 1008, CAST(40000000 AS Decimal(18, 0)), 5, CAST(38000000 AS Decimal(18, 0)), N'[Mới 100%] MSI Gaming GP66 Leopard 10UE-206VN Core i7 10870H, 16GB, 1TB NVMe, RTX 3060 6GB, 15.6'' FHD 144Hz', N'<b>Laptop MSI Gaming GP66 Leopard 10UE-206VN – Laptop hiệu năng cao.</b><br/><br/>
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
Laptop MSI GP66 Leopard 10UE-206VN sở hữu hiệu năng vượt trội, thiết kế cao cấp, dung lượng pin khủng là sản phẩm được rất nhiều game thủ quan tâm.<br/>', N'Intel® Core™ i7-10870H', N'16GB DDR4 Bus 3200MHz', N'SSD 1TB PCIe', N'NVIDIA RTX 3060', N'15.6 inch FHD IPS 144Hz', N'3 cổng Type-A USB3.2 Gen1 1 cổng Type-C (USB3.2 Gen2 / DP) 1 cổng RJ45 1 cổng (4K @ 60Hz) HDMI', N'HD Webcam', N'2.3 kg', N'4 Cell 65WHrs', N'Windows 10 bản quyền', 0, N'/images/pictures/msi_gl66_pic_layout.JPG', CAST(N'2022-04-08 10:03:38.013' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (25, N'MSI GP65 LEOPARD 9SD', 1008, CAST(28000000 AS Decimal(18, 0)), 10, CAST(25200000 AS Decimal(18, 0)), N'MSI GP65 LEOPARD 9SD Core i7 9750H, 16GB, 512GB NVMe, GTX 1660Ti, 15.6'' FHD 144Hz', N'MSI GP65 Leopard 9SD  dòng laptop cao cấp dành cho các game thủ của nhà MSI, với sự phá cách ở ngoại hình cũng như đổi mới ở hiệu năng, đây sẽ là đối thủ đáng gờm của các laptop gaming trong cùng phân khúc.
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
 ', N'Intel® Core™ i7-9750H', N'16GB DDR4 Bus 2666MHz', N'SSD 512GB PCIe', N'NVIDIA GTX 1660Ti 6GB', N'15.6 inch FHD IPS 144Hz', N'Per Key led RGB Steelseries', N' 1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI ', N'2.3 kg', N'6 Cells', N'Windows 10 bản quyền', 0, N'/images/pictures/ms_gl65_pic_layout.JPG', CAST(N'2022-04-08 10:10:06.670' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (26, N' MSI GF63 Thin 10SC-035US', 1008, CAST(20000000 AS Decimal(18, 0)), 8, CAST(18400000 AS Decimal(18, 0)), N'[Mới 100%] MSI GF63 Thin 10SC-035US Core i5-10200H, 8GB, 256GB, GTX 1650, 15.6'' 60Hz', N'<b>Laptop MSI GF63 Thin 10SC-035US Core i5 dành cho ai?</b>
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
Có thể xem MSI GF63 là dòng laptop gaming giá rẻ tốt nhất trong thời điểm hiện tại. Với giá chỉ khoảng từ hơn 19 triệu đồng, bạn đã có ngay cho mình một chiếc máy tính xách tay sang trọng, thanh lịch và hiệu năng cực cao, có thể cân được hầu hết các tác vụ làm việc văn phòng và chơi game mượt mà. Tuy nhiên để so sánh với những dòng laptop gaming thì nó sẽ không thể sánh bằng về hiệu năng, bởi một vài ứng dụng, game quá nặng thì GF63 10SCR xử lý không được mượt mà lắm.', N'Intel® Core™ I5-10200H (2.40GHz up to 4.10GHz, 8MB)', N'8GB DDR4-3200Mhz (2 khe, tối đa 64GB)', N'SSD 256GB NVMe PCIe ', N'NVIDIA® GeForce GTX 1650 Max Q 4GB GDDR6', N'15.6 inch FHD IPS 60Hz', N'HD 720P', N'1x Type-C USB3.2 Gen1 3x Type-A USB3.2 Gen1  1x (4K @ 30Hz) HDMI', N'1,86 kg', N'3 Cell - 51Whr', N'Windows 10 bản quyền', 0, N'/images/pictures/msI_gf63_pic_.JPG', CAST(N'2022-04-08 10:18:35.850' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (27, N' MSI Gaming Bravo 17 A4DDR', 1008, CAST(27000000 AS Decimal(18, 0)), 15, CAST(22950000 AS Decimal(18, 0)), N'[Mới 100%] MSI Gaming Bravo 17 A4DDR (Ryzen 7-4800H, 8GB, 512GB, AMD Radeon RX5500M, 17.3'''' FHD IPS 144Hz)', N'<b>MSI BRAVO 17 CÓ GÌ MỚI?</b><br/>
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
Một siêu phẩm từ thương hiệu MSI, MSI Bravo 17 A4DDR thực sự đã chứng minh được chất lượng của mình thông qua những thông số vô cùng ấn tượng và thiết kế đẳng cấp. So với Bravo 15 thì máy có cấu hình vượt trội hơn hẳn, đặc biệt màn hình to 17.3 inch cũng mang lại nhiều trải nghiệm thú vị hơn khi sử dụng. Đây là sự lựa chọn tốt cho các bạn trẻ, Bravo 17 có thể cùng bạn vừa "chiến game", vừa học tập và làm việc. ', N'AMD Ryzen 7-4800H', N'8GB DDR4 3200MHz', N'512GB NVMe PCIe Gen3x4 SSD', N'AMD Radeon RX 5500M 4GB GDDR6', N'17.3 inch FHD (1920*1080), 144Hz Anti - Glare, IPS-Level', N'HD 720P', N'	 2x Type-C USB3.2 Gen1 2x Type-A USB3.2 Gen1', N'2.3 kg', N'	3 Cells 51Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/msi_bravo_17_pic_layout.JPG', CAST(N'2022-04-08 10:27:26.497' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (28, N'MSI GE66 Raider 10SF-239', 1008, CAST(54000000 AS Decimal(18, 0)), 15, CAST(45900000 AS Decimal(18, 0)), N'[Mới 100%] MSI GE66 Raider 10SF-239 (Core i7 10750H, 32GB, 1TB, NVIDIA RTX2070 Super 8GB, 15.6'' 240Hz )', N'MSI - GE66 10SFS 15.6" Laptop - Intel Core i7 - 32GB Memory - NVIDIA GeForce RTX 2070 SUPER - 1TB SSD<br/>
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
Với một chiếc Laptop có thiết kế hiện đại, màn hình viền siêu mỏng, hiệu suất tuyệt vời thì Laptop GE66 Raider 10SF-239 xứng đáng là sự lựa chọn tối ưu nhất cho những ai đang cần một chiếc máy vừa có thể chơi Game, vừa có thể làm việc Hard Core. ', N'Core i7 10750H', N'32GB', N'1TB SSD', N'NVIDIA RTX2070 Super 8GB', N'15.6 inch FHD (1920x1080), 240Hz', N'HD 720P', N' 1. USB 2.0 | 2. USB 2.0 with PowerShare | 3. USB Type-C® | 4. SuperSpeed USB 3.2 | 5. HDMI ', N'2.65 kg', N'99,9Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/msi_ge66_pic_layout.JPG', CAST(N'2022-04-08 10:35:30.203' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (29, N'Laptop MSI GF75 10SCXR - 248VN', 1008, CAST(25000000 AS Decimal(18, 0)), 10, CAST(22500000 AS Decimal(18, 0)), N'[Mới 100%] Laptop MSI GF75 10SCXR - 248VN (Core i7 10750H, 8GB, 512GB , VGA 4GB NVIDIA GTX 1650, 17.3'' FHD 144Hz )', N'<br/>Laptop MSI GF75 10SCXR được thiết kế xu hướng mới, mỏng nhẹ nhưng lại mang sức mạnh vượt trội, trọng lượng chỉ 2.1kg như một số mẫu Ultrabook cao cấp giúp bạn thoải mái di chuyển. 
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
Với một chiếc Laptop có thiết kế hiện đại, màn hình viền siêu mỏng, hiệu suất tuyệt vời thì Laptop MSI GF75 10SCXR xứng đáng là sự lựa chọn tối ưu nhất cho những ai đang cần một chiếc máy vừa có thể chơi Game, vừa có thể làm việc Hard Core. ', N'Intel® Core™ i7-10750H', N'8GB DDR4 Bus 3200MHz', N'SSD 512GB NVMe', N'NVIDIA GTX 1650 4GB', N'17.3 inch FHD IPS 144Hz', N'HD 720P', N'USB 2.0, LAN, HDMI, USB 3.0', N'2.1 kg', N'3 Cells 51Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/msI_gf63_pic_1.JPG', CAST(N'2022-04-08 10:40:45.527' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (30, N'[Mới 100%] MSI Gaming Leopard GP76 11UG', 1008, CAST(53000000 AS Decimal(18, 0)), 6, CAST(49820000 AS Decimal(18, 0)), N'Laptop MSI Gaming Leopard GP76 11UG i7 11800H/16GB/1TB SSD/8GB RTX3070/300Hz/Balo/Chuột/Win10 (823VN)   ', N'Vượt qua khỏi sự phức tạp của các thuật toán kỹ thuật, mô phỏng cơ khí hay thiết kế đồ họa chuyên nghiệp, MSI Gaming Leopard GP76 11UG i7 (823VN) sở hữu phần cứng được tối ưu đến mức tối đa, dễ dàng đáp ứng mọi nhu cầu từ bạn.<br/>
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
MSI Gaming Leopard GP76 11UG i7 (823VN) sở hữu kiểu dáng cao cấp cùng cấu hình mạnh mẽ, vượt trội, là người cộng sự lý tưởng, sẵn sàng đồng hành cùng bạn trên mọi chuyến đi.', N'Intel Core i7 Tiger Lake - 11800H', N'16GB DDR4 3200MHz', N'512GB NVMe PCIe Gen3x4 SSD', N'Card rời - NVIDIA GeForce RTX 3070, 8 GB', N'17.3 inch Độ phân giải:  Full HD (1920 x 1080) Tần số quét:  300 Hz Công nghệ màn hình:  Công nghệ IPS', N'HD 720P', N'3 x USB 3.2  HDMI  Jack tai nghe 3.5 mm  LAN (RJ45)  Mini DisplayPort', N'2.9Kg', N'4-cell Li-ion, 65 Wh', N'Windows 10 Home SL', 0, N'/images/pictures/msi_gp76_pic_layout.jpg', CAST(N'2022-04-08 10:53:44.997' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (31, N'MSI Katana GF66 11UC 676VN', 1008, CAST(26000000 AS Decimal(18, 0)), 15, CAST(22100000 AS Decimal(18, 0)), N'MSI Katana GF66 11UC 676VN (i5-11400H, , 	
512GB, RTX 3050 4GB GDDR6)', N'Đánh giá chi tiết Laptop Gaming MSI Katana GF66 11UC 676VN
Hiệu năng đỉnh cao
 
<br/>
<br/><img src="/images/pictures/msi_gf66_pic_1.JPG" alt="MSI Katana GF66 11UC 676VN"><br/>
<br/>
Sử dụng vi xử lí Intel® Core™ i5 thế hệ 11 mới nhất, hiệu năng cao hơn tối đa tới 40% so với thế hệ trước. Mạnh mẽ hơn bao giờ hết với vi xử lí 6 nhân, xung turbo hai nhân tối đa tới 4.5GHz giúp phát huy hiệu suất tối đa trong việc xử lí game, phần mềm công việc và tác vụ đa nhiệm.
<br/>
GeForce RTX™ 30 Series GPU mang đến sức mạnh tối thượng cho game thủ và người sáng tạo nội dung. Sử dụng kiến trúc Ampere danh giá đã đạt nhiều giải thưởng uy tín —cũng là kiến trúc RTX thế hệ thứ 2 của NVIDIA —với nhân RT và nhân Tensor mới, cùng với đa nhân xử lí streaming giúp đem lại đồ họa ray-tracing siêu chân thực và các tính năng AI tân tiến nhất.
<br/>
Resizable BAR
<br/>
<br/><img src="/images/pictures/msi_gf66_pic_2.JPG" alt="MSI Katana GF66 11UC 676VN"><br/>
<br/>
Resizable BAR là tính năng cao cấp của chuẩn giao tiếp PCI Express, cho phép CPU sử dụng toàn bộ bộ nhớ đệm trên GPU, giúp cải thiện hiệu năng.
<br/>
Bàn phím thiết kế đặc biệt cho game thủ
<br/>
Với đèn nền đỏ, khung bàn phím bằng kim loại và hành trính phím sâu tới 1.7mm, cho cảm giác phản hồi và độ nảy tốt hơn hẳn. Chiếc bàn phím có thiết kế công thái học này sẽ đáp ứng mọi yêu cầu của bạn.
<br/>
Tốc độ và độ chi tiết cao chưa từng có
<br/>
<br/><img src="/images/pictures/msi_gf66_pic_3.JPG" alt="MSI Katana GF66 11UC 676VN"><br/>
<br/>
Màn hình chuyên game viền siêu mỏng với tốc độ phản hồi cao 144Hz, cho hình ảnh rực rỡ hơn để bạn luôn bắt kịp mọi chuyển động.
<br/>
Thiết kế tản nhiệt đột phá cho game thủ
<br/>
Cụm tản nhiệt riêng cho CPU và GPU với 6 ống dẫn nhiệt. MSI gia tăng đường kính bên trong ống dẫn nhiệt, kết hợp với keo tản nhiệt độc quyền để đảm bảo hiệu năng tối đa ngay cả khi chơi các game nặng.
<br/>
Sức mạnh để vươn lên dẫn đầu<br/>
Tận dụng tối đa hiệu năng từ chiếc laptop của bạn nhờ bộ nhớ RAM chuẩn DDR4-3200 mới nhất. Tận hưởng tốc độ và độ phản hồi tốt hơn, nâng trải nghiệm chơi game của bạn lên tầm cao mới.
<br/>
Hỗ trợ toàn diện
<br/>
<br/><img src="/images/pictures/msi_gf66_pic_4.JPG" alt="MSI Katana GF66 11UC 676VN"><br/><br/>
Phần mềm MSI Center độc quyền cho phép điều khiển và tùy biến chiếc laptop MSI của bạn theo ý muốn. Theo dõi thông số, điều chỉnh, tối ưu hệ thống cùng với nhiều tính năng hữu ích khác - tất cả được tích hợp trên một giao diện chung thống nhất. Gia tăng độ linh hoạt khi sử dụng nhờ các tính năng mới như tìm kiếm hình ảnh thông minh, tùy chọn giao diện và nhiều lựa chọn tùy biến khác để phù hợp với nhu cầu của bạn.
<br/>
Chuẩn mạng không dây mới
<br/>
<br/><img src="/images/pictures/msi_gf66_pic_1.JPG" alt="MSI Katana GF66 11UC 676VN"><br/>
<br/>
Wi-Fi 6 mới nhất theo chuẩn 802.11ax có tốc độ nhanh hơn tới 3 lần so với Wi-Fi 5, được thiết kế để đem lại trải nghiệm chơi game, live stream và họp online mượt mà nhất. Chơi game tối ưu nhất với Intel Wi-Fi 6.', N'Intel Core i5-11400H', N'8GB (8GB x 1) DDR4 3200MHz (2 khe, tối đa 64GB)', N'512GB NVMe PCIe Gen3x4 SSD', N'NVIDIA GeForce RTX 3050 4GB GDDR6 + Intel UHD Graphics', N'15.6 inch FHD (1920*1080), 144Hz 45% NTSC', N'HD 720p@30fps', N'	 1x Type-C USB3.2 Gen1 2x Type-A USB3.2 Gen1 1x Type-A USB2.0 1x (4K @ 60Hz) HDMI 1x Mic-in/Headphone-out Combo Jack', N'2.1 kg', N'3 cell, 53.5Whr', N'Windows 10 Home', 0, N'/images/pictures/msi_gf66_pic_1.JPG', CAST(N'2022-04-08 15:28:38.547' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (32, N'MSI GF63 Thin 11SC 664VN', 1008, CAST(22000000 AS Decimal(18, 0)), 9, CAST(20020000 AS Decimal(18, 0)), N'MSI GF63 Thin 11SC 664VN (i5-11400H,8GB ,512GB,GTX1650 4GB GDDR6)', N'<b>Đánh giá chi tiết laptop gaming MSI GF63 Thin 11SC 664VN</b><br/>
MSI, một cái tên không còn quá xa lạ với game thủ chúng ta. Những sản phẩm từ nhà rồng chiếm trọn được sự yêu thích của người dùng từ thiết kế đến giá cả. Và nay, sẽ là chiếc laptop gaming sở hữu những đặc điểm trên với cái tên MSI GF63 Thin 11SC 664VN. <br/>
<br/><img src="/images/pictures/msi_gf63_pic_1.JPG" alt="MSI GF63 Thin 11SC 664VN"><br/><br/>
<b>Thiết kế mỏng nhẹ dành cho game thủ</b><br/>
Những thiết kế hầm hố, khổng lồ của laptop gaming có làm bạn chán. Nếu thực sự như vậy thì MSI GF63 Thin 11SC 664VN sẽ không làm bạn thất vọng. Khoác lên mình lớp áo màu đen huyền bí, mạnh mẽ cùng logo MSI đặt ngay trung tâm mặt trước khẳng định thương hiệu. Cả mặt A và chiếu nghỉ tay của laptop MSI GF63 Thin 11SC 664VN tạo nên từ kim loại mang đến vẻ sang trọng nhất định. Và bạn có thể mang em nó đi mọi nơi nhờ vào trọng lượng siêu nhẹ chỉ 1.84kg và mỏng 2.17cm.
<br/>
<br/><img src="/images/pictures/msi_gf63_pic_2.JPG" alt="MSI GF63 Thin 11SC 664VN"><br/>

<b>Sức mạnh tuyệt vời</b><br/>
Là chiếc laptop gaming giá rẻ nhưng MSI GF63 Thin 11SC 664VN vẫn sở hữu một sức mạnh đáng kinh ngạc khi được trang bị bộ vi xử lý i5-11400H đem lại khả năng xử lý những tác vụ làm việc nhanh chóng. Hướng đến khả năng chơi game, MSI GF63 Thin 11SC 664VN còn sở hữu thêm card đồ họa GTX 1650 hứa hẹn sẽ mang lại trải nghiệm giải trí tuyệt vời với những tựa game Esport hoặc game AAA ở mức đồ họa Medium.

<br/><img src="/images/pictures/msi_gf63_pic_3.JPG" alt="MSI GF63 Thin 11SC 664VN"><br/>

Hỗ trợ thêm đó là 8GB RAM giúp bạn có thể thực hiện công việc trên nhiều tác vụ cùng lúc. Và không thể thiếu nơi lưu trữ tài liệu công việc hay game với 512GB SSD trên MSI GF63 Thin 11SC, cung cấp không gian cho bạn thoải mái tải và sử dụng phần mềm.
<br/>

<b>Thiết kế tản nhiệt tiên tiến</b><br/>

Hệ thống tản nhiệt trên MSI GF63 Thin 11SC 664VN được do chính thương hiệu tinh chỉnh hướng đến khả năng thoát nhiệt êm hơn, mát hơn cho chiếc laptop giúp đem lại hiệu năng sử dụng mạnh mẽ nhất đến game thủ. Các khe thoát khí được trang bị bên dưới mặt A cùng 2 bên cạnh máy của MSI GF63 Thin 11SC 664VN.

<br/><img src="/images/pictures/msi_gf63_pic_4.JPG" alt="MSI GF63 Thin 11SC 664VN"><br/>

<b>Màn hình tối ưu cho khả năng chơi game</b><br/>

Một chiếc màn hình 15.6 inch, độ phân giải Full HD cùng tấm nền IPS là khung hình mà MSI GF63 Thin 11SC 664VN sở hữu, sẽ mang đến cho người dùng những hình ảnh chi tiết, sắc nét. Điểm ăn tiền sẽ khiến MSI GF63 Thin 11SC 664VN vượt bậc trong tầm giá đó là tần số quét lên đến 144Hz khiến cho những pha hành động ở các tựa game trở nên mượt mà hơn, đem lại lợi thế cho game thủ chúng ta.

<br/><img src="/images/pictures/msi_gf63_pic_5.JPG" alt="MSI GF63 Thin 11SC 664VN"><br/>

<b>Năng lượng dồi dào</b><br/>

Được thử nghiệm trong môi trường Mobile Shark với các tác vụ văn phòng, MSI GF63 Thin 11SC 664VN mang đến 7h hoạt động mà không cần sạc pin, một thời lượng vừa đủ cho chúng ta học tập và làm việc.

<br/><img src="/images/pictures/msi_gf63_pic_1.JPG" alt="MSI GF63 Thin 11SC 664VN"><br/>

<b>Giải trí audio đỉnh cao</b><br/>

Cùng hòa nhịp trong những bản nhạc lossless, chất lượng cao khi MSI GF63 Thin 11SC 664VN mang đến công nghệ xử lý âm thanh Audio Boost. Giải trí với MSI GF63 Thin 11SC 664VN sẽ thực sự tuyệt vời trong thời gian rảnh.', N'Intel Core i5-11400H 2.2GHz up to 4.5GHz 12MB', N'8GB (8x1) DDR4 3200MHz (2x SO-DIMM socket, up to 64GB SDRAM)', N'512GB NVMe PCIe Gen3x4 SSD (1 slot)', N'NVIDIA GeForce GTX1650 4GB GDDR6 with Max-Q Design + Intel UHD Graphics', N'15.6" FHD (1920 x 1080) IPS 144Hz, Thin Bezel', N'HD type (30fps@720p)', N'3x USB3.2 Gen1, 1x Type-C USB3.2 Gen1, HDMI RJ-45', N'	1.86 kg', N'	3 Cell 51WHr', N'	Windows 11 Home', 0, N'/images/pictures/msI_gf63_pic_1.JPG', CAST(N'2022-04-08 15:36:20.550' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (33, N'MSI Katana GF66 11UC 224VN', 1008, CAST(30000000 AS Decimal(18, 0)), 15, CAST(25500000 AS Decimal(18, 0)), N'MSI Katana GF66 11UC 224VN (i7-11800H,8GB,512GB,RTX™ 3050 4GB GDDR6,15.6 inch FHD,144Hz, 100% sRGB, IPS)', N'<b>Thiết kế mạnh mẽ đậm chất gaming</b> <br/>
Laptop MSI Katana GF66 11UC sở hữu từng đường nét vuông vắn mạnh mẽ được bao phủ một màu đen cá tính. Phần khung được làm từ chất liệu cao cấp tạo độ cứng cáp cho toàn bộ linh kiện bên trong laptop MSI. Trọng lượng chỉ khoảng 2.1kg nên việc bỏ vào balo mang đi bất cứ đâu cũng vô cùng dễ dàng cho người dùng. 

<br/><img src="/images/pictures/msi_gf66_pic_1.JPG" alt="MSI Katana GF66 11UC 224VN"><br/>
<br/>
<b>Bàn phím dễ thao tác</b><br/>
Bàn phím của MSI Katana GF66 11UC cho một độ nảy phím ổn định với hành trình phím sâu tạo cảm giác thoải mái cho mọi thao tác nhấn. Được trang bị hệ thống đèn nền LED đơn sắc màu đỏ gia tăng thêm sự mạnh mẽ cá tính đầy thu hút. Bên cạnh đó việc thao tác trong môi trường thiếu ánh sáng cũng chính xác hơn, dễ dàng đạt được mục tiêu mong muốn trong mọi hoàn cảnh. 
<br/>
<br/><img src="/images/pictures/msi_gf66_pic_2.JPG" alt="MSI Katana GF66 11UC 224VN"><br/>
<br/>
<b>Cấu hình vượt trội chơi game thả ga</b><br/>
MSI Katana GF66 11UC được trang bị bộ vi xử lý Intel Core i7-11800H với xung nhịp cơ bản là 2.3GHz có thể nâng cấp lên đến 4.6GHz. Mọi thao tác từ văn phòng cơ bản đến thiết kế nâng cao đều không thể làm khó được chiếc laptop này. Kết hợp cùng VGA NVIDIA GeForce RTX 3050 đem lại trải nghiệm đồ họa đẹp mắt với tốc độ xử lý mượt mà trên mọi khung hình. Chiếc laptop gaming 20 đến 25 triệu có thể đáp ứng mọi yêu cầu khắc nghiệt của người dùng ở bất kỳ tựa game cấu hình cao như là FPS, MOBA,...
<br/>
<br/><img src="/images/pictures/msi_gf66_pic_3.JPG" alt="MSI Katana GF66 11UC 224VN"><br/>
<br/>
<b>Màn hình Full HD sắc nét trên laptop gaming MSI Katana GF66 11UC 224VN</b><br/>
<br/><img src="/images/pictures/msi_gf66_pic_4.JPG" alt="MSI Katana GF66 11UC 224VN"><br/><br/>
MSI Katana GF66 11UC có kích thước màn hình 15.6 inch Full HD, độ phân giải 1920x1080 cực sắc nét. Tốc độ xử lý nhanh chóng với độ mượt mà cao trên chiếc màn hình 144Hz kết hợp cùng độ phủ màu 100% sRGB mở ra hình ảnh đẹp mắt với độ chân thực và màu sắc tươi sáng cao. Giờ đây người dùng không cần tốn nhiều thời gian đến những tiệm net chất lượng cao khi chiếc laptop gaming MSI này có thể đáp ứng đủ mọi nhu cầu sử dụng của họ tại nhà hay bất cứ đâu.', N'Intel Core i7-11800H 2.3GHz up to 4.6GHz 24MB, 8 nhân, 16 luồng', N'8GB DDR4 3200MHz (2x SO-DIMM socket, up to 64GB SDRAM)', N'512GB NVMe PCIe Gen3x4 SSD (Còn 1 slot NVMe PCIe Gen3)', N'	NVIDIA® GeForce RTX™ 3050 4GB GDDR6 Xung boost tối đa 1500MHz, công suất tiêu thụ tối đa 60W', N'15.6 inch FHD (1920x1080), 144Hz, xấp xỉ 100% sRGB, IPS-level    ', N'HD type (30fps@720p)', N'1x (4K @ 60Hz) HDMI 1x Type-A USB2.0 2x Type-A USB3.2 Gen1 1x Type-C USB3.2 Gen1 1x RJ45 1x Mic-in/Headphone-out Combo Jack', N'2.1 kg', N'3 cell, 53.5Whr', N'Windows 11 Home', 0, N'/images/pictures/msi_gf66_layout.JPG', CAST(N'2022-04-08 15:42:45.250' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (34, N'MSI Gaming GP66 Leopard 11UE 643VN', 1008, CAST(45000000 AS Decimal(18, 0)), 12, CAST(39600000 AS Decimal(18, 0)), N'MSI Gaming GP66 Leopard 11UE 643VN (i7-11800H,16GB,512GB,RTX™ 3060 6GB GDDR6,15.6 inch FHD,144Hz, IPS)', N'Đánh giá chi tiết Laptop MSI Gaming GP66 Leopard 11UE 643VN
<br/><img src="/images/pictures/msi_gp66_pic_1.JPG" alt="MSI Gaming GP66 Leopard 11UE 643VN"><br/>

MSI Gaming GP66 Leopard 11UE 643VN được trang bị bộ vi xử lý Intel Core i thế hệ thứ 11 mới nhất và NVIDIA GeForce RTX 30 series. GeForce RTX 30 series mang lại sức mạnh bức phá cùng công nghệ Ray Tracing. Đắm chìm trong trò chơi với trải nghiệm hoàn toàn mới.

<br/><img src="/images/pictures/msi_gp66_pic_2.JPG" alt="MSI Gaming GP66 Leopard 11UE 643VN"><br/>

 

GP66 Leopard 11UE 643VN là sự giao thoa giữa thẩm mỹ và hiệu suất, chìa khóa của một chiếc máy tính xách tay vững chắc. Bên ngoài của GE66 có một góc xiên mở ra hình ảnh sắc nét được chế tác của nó.
<br/><img src="/images/pictures/msi_gp66_pic_3.JPG" alt="MSI Gaming GP66 Leopard 11UE 643VN"><br/>

Trang bị đến Intel® Core ™ i9 thế hệ thứ 11 xử lý các tác vụ đa nhiệm và game nặng chỉ 1 cái búng tay. Tần số lõi đơn cao hơn cung cấp lên đến 5,3 Ghz. Thế hệ mới mang lại hiệu suất chưa từng có, giờ đây là lúc bạn bộc lộ sức mạnh chơi game thực sự của mình, mang đến cảm giác trải nghiệm chơi game tuyệt với trong từng "phím bấm" trên bàn phím Per-Key RGB Backlight Keyboard không khác gì các bàn phím cơ chuyên nghiệp.

<br/><img src="/images/pictures/msi_gp66_pic_4.JPG" alt="MSI Gaming GP66 Leopard 11UE 643VN"><br/>

 

GeForce RTX ™ 30 Series cung cấp sức mạnh để biến thành cỗ máy nhanh nhất thế giới dành cho game thủ và người sáng tạo. Chúng được xây dựng với Ampere từng đoạt giải thưởng – kiến ​​trúc RTX thế hệ thứ 2 của NVIDIA – với RT Cores mới, Tensor Cores và đa xử lý trực tuyến cho đồ họa theo dõi tia chân thực nhất và các tính năng AI tiên tiến.

<br/><img src="/images/pictures/msi_gp66_pic_5.JPG" alt="MSI Gaming GP66 Leopard 11UE 643VN"><br/>

 

Một trong những dòng laptop gaming đầu tiên được trang bị Wi-Fi 6E trên thế giới. Wi-Fi 6E mới nhất mang đến tốc độ tuyệt vời đồng thời giữ cho mạng mượt mà và ổn định ngay cả khi chia sẻ mạng với nhiều người dùng. Với thông lượng vượt trội và độ trễ thấp, bạn có thể đánh bại những người khác.', N'Intel Core i7-11800H 2.3GHz up to 4.6GHz 24MB', N'16GB (8GB x2) DDR4 3200MHz (2x SO-DIMM socket, up to 64GB SDRAM)', N'512GB SSD M.2 PCIe G3X4 (Còn trống 1 khe SSD M.2 PCIE)', N'NVIDIA® GeForce RTX™ 3060 6GB GDDR6 Up to 1802MHz Boost Clock, 130W Maximum Graphics Power with Dynamic Boost.', N'15.6" QHD (2560x1440), 165Hz, 72%NTSC, IPS-Level, close to 100% sRGB', N'HD type (30fps@720p)', N'	3x Type-A USB3.2 Gen1 1x (8K @ 60Hz / 4K @ 120Hz) HDMI 1x RJ45 1x Mini-DisplayPort 1x Mic-in/Headphone-out Combo Jack', N'2.38 kg', N'4 Cell 65WHrs', N'Windows 10 Home', 0, N'/images/pictures/msi_gp66_pic_layout.JPG', CAST(N'2022-04-08 15:49:05.463' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (35, N'MSI Creator Z16 A11UET 217VN', 1008, CAST(62000000 AS Decimal(18, 0)), 19, CAST(50220000 AS Decimal(18, 0)), N'MSI Creator Z16 A11UET 217VN (LCD 16"QHD 120Hz 100%DCI-P3,i7-11800H,32GB,SSD 1TB,RTX™ 3060 6GB GDDR6)', N'Đánh giá chi tiết Laptop MSI Creator Z16 A11UET 217VN
<br/>
Laptop MSI Creator Z16 A11UET dựa trên triết lý thiết kế lấy con người làm trọng tâm, áp dụng Tỷ lệ vàng trong thiết kế sản phẩm với công nghệ tiên tiến hàng đầu. Nó là bước ngoạt mới của công nghệ kết hợp với nghệ thuật. 
<br/>
Bộ vi xử lý Intel Core i thế hệ thứ 11 mới nhất
<br/>
<br/><img src="/images/pictures/msi_Creator_pic_1.JPG" alt="MSI Creator Z16 A11UET 217VN"><br/>

 <br/>
Với bộ vi xử lý Intel Core i thế hệ thứ 11 mới nhất, Z16 A11UET cung cấp tần số turbo lõi kép lên đến 4,6 GHz, mang đến cho bạn sức mạnh đa thế hệ để đáp ứng các tác vụ xử lý đa nhiệm và chuyên nghiệp của bạn. Creator Z16 mang đến cho bạn nhiều thời gian hơn để theo đuổi nàng thơ lý của mình.
<br/>
Hiệu suất hiển thị gấp 2 lần và bộ nhớ đồ họa lên đến gấp 2 lần của 20 Series<br/>
Nếu bạn có thể tưởng tượng được thì máy tính xách tay NVIDIA Studio được hỗ trợ bởi GPU NVIDIA GeForce RTX 3060 với hiệu suất hiển thị gấp 2 lần và bộ nhớ đồ họa lên đến gấp 2 lần của 20 Series, việc chỉnh sửa video RAW HDR lên tới 8K và làm việc với các mô hình 3D cực lớn trở nên nhanh chóng hơn bao giờ hết.
<br/>
Nâng cấp trước với hiệu suất tốt hơn trên pin để làm việc khi di chuyển và tận hưởng màn hình phong phú, chính xác từng điểm ảnh sẽ nắm bắt mọi chi tiết, giờ đây với các tùy chọn 1440p. Khai thác sáng tạo nội dung được tăng tốc bởi AI trên các ứng dụng sáng tạo yêu thích của bạn để bạn có thể đưa quy trình công việc của mình từ 0 đến siêu tốc trong thời gian kỷ lục.
<br/>
Màn hình Creator Z16 cung cấp cho bạn màu sắc chính xác cho các tác phẩm của bạn.<br/>
Màn hình 16:10 phù hợp với Tỷ lệ vàng 1.618, tỷ lệ hoàn hảo được coi là quy luật của cái đẹp. Màn hình tỷ lệ khung hình này cung cấp thêm 11% không gian so với 16：9 để kiểm tra không gian làm việc và dòng thời gian trong các ứng dụng Adobe.
<br/>
<br/><img src="/images/pictures/msi_Creator_pic_2.JPG" alt="MSI Creator Z16 A11UET 217VN"><br/>

Với triết lý thiết kế lấy con người làm trọng tâm, Z16 A11UET được trang bị màn hình cảm ứng để tương tác trực quan, cho phép bạn tạo ra các tác phẩm công phu một cách liền mạch.
<br/>
Mang đến các tác phẩm nghệ thuật của bạn với màn hình True Pixel rực rỡ.
Mang đến hình ảnh sống động với độ phân giải QHD +, gam màu 100% DCI-P3 (Điển hình)<br/>
Độ chính xác Delta-E <2 ngoài hộp được hiệu chuẩn tại nhà máy và công nghệ màu trung thực.<br/>
Creator Z16 cung cấp cho bạn màu sắc chính xác cho các tác phẩm của bạn.<br/>
Bàn phím hỗ trợ đèn nền MiniLED<br/>
Khơi dậy cảm hứng sáng tạo với bàn phím có đèn nền MiniLED đầu tiên. Creator Z16 chiếu sáng trong môi trường thiếu ánh sáng, dễ dàng ghi lại hình ảnh bạn bắt gặp trong ánh đèn flash với đèn nền RGB cho mỗi phím được cá nhân hóa bởi Steelseries Engine3.
<br/>
Hệ thống âm thanh Dynaudio đẳng cấp thế giới.<br/>
<br/><img src="/images/pictures/msi_Creator_pic_3.JPG" alt="MSI Creator Z16 A11UET 217VN"><br/>
<br/>
Cảm nhận sức mạnh của 4 x Loa âm thanh nổi và trải nghiệm một cấp độ âm thanh hoàn toàn mới với hệ thống âm thanh Dynaudio đẳng cấp thế giới. 
<br/>
Với Công cụ điều chỉnh loa, nó tạo ra âm trầm mạnh mẽ và giọng hát rõ ràng, sắc nét cho phép bạn tận hưởng cảm giác thính giác đắm chìm. Cùng với âm nhạc lossless và chất lượng âm thanh cao cấp với Âm thanh độ phân giải cao, hãy trải nghiệm âm thanh tiên tiến như mong muốn.
<br/>
Kết nối tốc độ cao, cung cấp khả năng kết nối độc đáo
Creator Z16 cung cấp đầy đủ các cổng I/O hiệu suất cao. Thunderbolt™ 4 cung cấp khả năng kết nối với tốc độ cao và tính linh hoạt, hỗ trợ băng thông lên đến 40Gbps với khả năng daisy chain. Với đầu đọc thẻ tốc độ cao UHS-III, tiết kiệm thời gian hơn khi truyền video chất lượng cao của bạn với tốc độ truyền lên đến 624 MB / s (Lý thuyết). Creator Z16 cung cấp thêm tính linh hoạt để lưu và chia sẻ những ý tưởng tuyệt vời của bạn trong khi vẫn di động.
<br/>
Công nghệ tản nhiệt tối ưu<br/>
<br/><img src="/images/pictures/msi_Creator_pic_4.JPG" alt="MSI Creator Z16 A11UET 217VN"><br/>

Công nghệ Cooler Boost độc quyền của MSI đảm bảo tản nhiệt tối ưu. Với cánh quạt lưỡi sắc 0,1mm mỏng nhất thế giới và thiết kế chia sẻ nhiệt, Cooler Boost Trinity + mới giúp tăng cường luồng gió của quạt và cung cấp quy trình làm việc đa tác vụ tốt nhất.
<br/>
Wi-Fi 6E mới nhất mang lại tốc độ đáng kinh ngạc trong khi giữ mạng mượt mà và ổn định ngay cả khi ở môi trường đông đúc. Với thông lượng vượt trội và độ trễ thấp, bạn luôn có thể thưởng thức video trực tuyến mượt mà hoặc thể hiện thiên tài sáng tạo của mình mà không bị gián đoạn.', N'Intel® Core™ i7-11800H 8 nhân 16 luồng', N'32GB (2 x 16 GB) DDR4 3200MHz (2x SO-DIMM socket, up to 64GB SDRAM)', N'1TB M.2 NVMe PCIe Gen4x4 ', N'NVIDIA® GeForce RTX™ 3060, 6GB GDDR6', N'16 inch QHD+ (2560*1600), 120Hz DCI-P3 100% typical, Finger Touch panel', N'IR HD type (30fps@720p)', N'	1x Micro SD 2x Type-A USB3.2 Gen2 2x Type-C (USB / DP / Thunderbolt™ 4) 1x Mic-in/Headphone-out Combo Jack', N'2.2 kg', N'90 Whr', N'Windows 10 Home', 0, N'/images/pictures/msi_Creator_pic_layout.JPG', CAST(N'2022-04-08 15:56:50.287' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (36, N'MSI Stealth GS77 12UH 075VN', 1008, CAST(90000000 AS Decimal(18, 0)), 2, CAST(88200000 AS Decimal(18, 0)), N'MSI Stealth GS77 12UH 075VN(LCD 17.3"QHD 249Hz 100%DCI-P3,i9-12900H, DDR5 32GB,SSD 2TB,RTX™ 3080 GDDR6)', N'Đánh giá chi tiết laptop gaming MSI Stealth GS77 12UH 075VN<br/>
Thiết kế MSI Stealth GS77 12UH 075VN lịch lãm, sang trọng <br/>
Là sản phẩm laptop gaming cao cấp đến từ nhà rồng MSI, MSI Stealth GS77 12UH 075VN đem lại một vẻ ngoài gọn gàng và mỏng nhẹ. Cùng thiết kế Core Black, MSI Stealth GS77 12UH 075VN mang lại sự sang trọng và chuyên nghiệp so với những chiếc laptop chơi game khác.

 <br/>

Hiệu năng mạnh mẽ, hoàn hảo cho gaming<br/>
Được trang bị CPU thế hệ 12 mới nhất,  i9-12900H cùng card đồ họa RTX 3080, MSI Stealth GS77 12UH 075VN sở hữu một sức mạnh cực khủng với khả năng xử lý công việc và đồ họa tuyệt vời. Đi kèm là 32GB RAM đem lại khả năng đa nhiệm mượt mà và bộ nhớ khổng lồ 2TB SSD cho một không gian lưu trữ thoải mái trên GS77.
<br/>
<br/><img src="/images/pictures/msi_GS77_pic_1.JPG" alt="MSI Stealth GS77 12UH 075VN"><br/>
<br/>
Màn hình sắc nét, tối ưu dành cho game thủ<br/>
Sở hữu màn hình 17.3 inch QHD với thông số cực kì khủng cho khả năng gaming là tần số quét lên đến 240Hz cùng độ chuẩn màu đạt 100% sRGB, MSI Stealth GS77 12UH 075VN sẽ là trợ thủ đắc lực cho bạn trong những pha giao tranh ở những tựa game FPS giúp bạn giành lấy chiến thắng lẫn trong công việc.
<br/>
<br/><img src="/images/pictures/msi_GS77_pic_2.JPG" alt="MSI Stealth GS77 12UH 075VN"><br/>

 <br/>

Tản nhiệt Cooler Boost Trinity+ tối ưu và hiệu quả<br/>
Tối ưu cho khả năng chơi game là hệ thống làm mát Cooler Boost độc quyền của MSI - Cooler Boost Trinity+. Với cánh quạt 0.1 mm mỏng nhất thế giới với 3 cánh quạt và 7 ống dẫn, hệ thống tản nhiệt Cooler Boost Trinity+ mới tăng cường lưu lượng gió, đem lại trải nghiệm chơi game tốt nhất trên GS66 Stealth.
<br/>
<br/><img src="/images/pictures/msi_GS77_pic_3.JPG" alt="MSI Stealth GS77 12UH 075VN"><br/>

 
<br/>
Tốc độ đọc và ghi file dẫn đầu<br/>
Nhờ bộ nhớ RAM chuẩn DDR5-4800 mới nhất, MSI Stealth GS77 12UH 075VN giúp bạn trải nghiệm tốc độ và độ phản hồi tốt hơn, nâng cao trải nghiệm chơi game của bạn lên tầm cao mới nhờ khả năng khai thác tối đa hiệu năng.

<br/><img src="/images/pictures/msi_GS77_pic_4.JPG" alt="MSI Stealth GS77 12UH 075VN"><br/>
 <br/>

Thunderbolt 4 và PCIe trên MSI Stealth GS77 12UH 075VN<br/>
Cổng Thunderbolt 4 trên MSI Stealth GS77 12UH 075VN giúp nâng tầm trải nghiệm sử dụng của bạn với khả năng hỗ trợ chuẩn USB cho tốc độ truyền dữ liệu siêu cao, sạc chuẩn PD, và kết nối với nhiều thiết bị cùng một lúc. Với công suất sạc đầu ra cao hơn tới 3 lần và sạc đầu vào tới 100 Watt, thuận tiện hơn cho nhu cầu sử dụng thường ngày.

 <br/>

Bên cạnh đó, MSI Stealth GS77 12UH 075VN hỗ trợ các khe cắm SSD M.2 PCIe Gen4 x4 NVMe có thể đạt tốc độ tới trên 5GB/s. Nhờ đó bạn có thể truy xuất các file đa phương tiện nhanh chóng hơn, nâng cao hiệu suất làm việc đa nhiệm.
<br/>
Trải nghiệm âm thanh chân thực<br/>
Chìm đắm và du dương trong những bản nhạc chất lượng lossless với công nghệ âm thanh cao cấp Hi-Resolution Audio trên GS77 Stealth. Âm thanh trên MSI Stealth GS77 12UH 075VN được nâng tầm với công nghệ Nahimic từ Steelseries, bao gồm các khả năng phát âm thành vòm 3D trong các tựa game và tính năng Sound Sharing qua Bluetooth.
<br/>
 <br/><img src="/images/pictures/msi_GS77_pic_1.JPG" alt="MSI Stealth GS77 12UH 075VN"><br/>
<br/>
Đa dạng cổng kết nối
<br/>
MSI Stealth GS77 12UH 075VN mang đến môi trường kết nối đa dạng với những cổng kết nối mới nhất và tốt nhất hiện nay, đem lại sự thoải mái khi lựa chọn kết nối cho công việc, học tập và giải trí.

 ', N'Intel Core i9-12900H 3.8GHz up to 5.0GHz 24MB', N'32GB (16GBx2) DDR5 4800MHz (2x SO-DIMM socket, up to 64GB SDRAM)', N'2TB SSD PCIE G4X4 (2 slots)', N'NVIDIA GeForce RTX3080 Max-Q 8GB GDDR6, Up to 1345MHz Boost Clock, 105W ', N'17.3" QHD (2560x1440) IPS with Anti-Glare, 240Hz, DCI-P3 100% typical', N'Per-Key RGB Backlight Keyboard', N'1x Type-C (USB / DP / Thunderbolt™ 4) with PD charging 1x Type-C (USB / DP / Thunderbolt™ 4) 2x Type-A USB3.2 Gen2 1x RJ45 1x HDMI', N'	2.45 kg', N'	4 Cell 99.9WHrs', N'	Windows 11 Home', 0, N'/images/pictures/msi_GS77_pic_layout.JPG', CAST(N'2022-04-08 16:05:01.853' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (37, N'HP Omen 16 b0127TX 4Y0W7PA', 1009, CAST(49000000 AS Decimal(18, 0)), 10, CAST(44100000 AS Decimal(18, 0)), N'HP Omen 16 b0127TX 4Y0W7PA (i7-11800H,DDR4 16GB,512GB,RTX™ 3060 6GB GDDR6,16.1 QHD,165Hz)', N'Đánh giá chi tiết laptop Gaming HP Omen 16 b0127TX 4Y0W7PA<br/>
Thiết kế mới lạ, tinh tế<br/>
Là sản phẩm laptop gaming mới nhất từ HP, Omen 16 mang đến một thiết kế vô cùng trang nhã với mặt A đen bóng cùng logo Omen đặt tại trung tâm của bề mặt, không hầm hố nhưng vẫn rất gaming.<br/>
<br/><img src="/images/pictures/hp_omen_pic_1.JPG" alt="HP Omen 16 b0127TX 4Y0W7PA"><br/>

<br/>
Hiệu năng chơi game được đưa lên tầm cao mới<br/>
Hướng đến trải nghiệm gaming tuyệt vời nhất, HP đã trang bị cho Omen dòng CPU Intel thế hệ 11 mới nhất hiện nay giúp tối ưu hóa khả năng xử lý cùng chiếc card đồ họa NVIDIA RTX 3060. Tất cả được kết hợp lại trên HP Omen 16 đem lại khả năng gaming tuyệt vời nhất và hứa hẹn sánh vai cùng các model laptop gaming cùng phân khúc.<br/>
<br/><img src="/images/pictures/hp_omen_pic_2.JPG" alt="HP Omen 16 b0127TX 4Y0W7PA"><br/>

<br/>
Trải nghiệm gaming nâng cao với màn hình 165Hz<br/>
HP Omen 16 sở hữu chiếc màn hình trang bị tấm nền IPS với cùng kích thước vô cùng hiếm gặp trên dòng laptop chơi game hiện nay, đó là 16.1 inch. Hướng đến khả năng hiển thị sắc nét và tinh tế nhất trên từng khung ảnh, màn hình trên HP Omen 16 có 100% sRGB, độ sáng đạt mức 300nits và một điều chắc chắn sẽ làm các game thủ vô cùng thích thú, đó là tần số quét lên đến 165Hz và độ phản hồi 3ms. Hình ảnh khi gaming trên HP Omen 16 sẽ vô cùng mượt mà và sắc nét.

<br/>
<br/><img src="/images/pictures/hp_omen_pic_3.JPG" alt="HP Omen 16 b0127TX 4Y0W7PA"><br/><br/>
Tản nhiệt Omen Tempest<br/>
Khả năng tản nhiệt trên HP Omen 16 được cải tiến với thiết kế cánh quạt mỏng gấp 2.5 lần giúp mang lại số lượng cánh quạt nhiều hơn phiên bản tiền nhiệt Omen 15. Ngoài ra, công nghệ tản nhiệt Omen Tempest cùng hệ thống thông gió 3 mặt và luồng khí được tỏa đi 5 chiều giúp lưu lượng gió đưa vào tối ưu hơn, đem lại nhiệt độ mát mẻ hơn cho laptop.
<br/>
<br/><img src="/images/pictures/hp_omen_pic_4.JPG" alt="HP Omen 16 b0127TX 4Y0W7PA"><br/>
<br/>
Năng lượng dồi dào, hoạt động lâu dài<br/>
Dung lượng pin đạt 70 Whr giúp cho HP Omen 16 có thể hoạt động trong thời gian 9 tiếng.
<br/>
 <br/><img src="/images/pictures/hp_omen_pic_5.JPG" alt="HP Omen 16 b0127TX 4Y0W7PA"><br/>
<br/>
Kết nối đa dạng<br/>
HP Omen 16 cung cấp cho bạn thoải mái lựa chọn trong khả năng kết nối.
<br/>
<br/><img src="/images/pictures/hp_omen_pic_6.JPG" alt="HP Omen 16 b0127TX 4Y0W7PA"><br/>
<br/>
Phần mềm OMEN Gaming Hub<br/>
OMEN Gaming Hub hội tụ mọi thứ bạn cần để nâng cao trải nghiệm chơi game của mình. Từ các hoạt động chơi game nhận thưởng, đến kiểm soát từng tùy chọn nhỏ về hiệu suất và ánh sáng trên máy và nhiều tính năng khác nữa. ', N'Intel Core i7-11800H (8 nhân, 16 luồng)', N'16GB (2x8GB) DDR4 3200Mhz (2 khe, max 64GB RAM)', N'1TB SSD M.2 PCIE + 32GB Intel Optane memory', N'NVIDIA® GeForce RTX 3060 (6GB GDDR4)', N'16.1"  QHD (2560 x 1440), 165 Hz 3 ms, IPS, 300 nits, 100% sRGB', N'HD 720p', N'	1x Thunderbolt 4 1x SuperSpeed USB Type-A  2x SuperSpeed USB Type-A  1x HDMI 2.1 1x mini DisplayPort 1x RJ-45 1x AC smart pin 1x headphone/microphone combo 1x SD card reader', N'2.3 kg', N'	4 Cell 70WHr Li-ion polymer', N'	Windows 10 Home', 0, N'/images/pictures/hp_omen_pic_layout.JPG', CAST(N'2022-04-08 16:16:49.260' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (38, N'HP VICTUS 16 e0177AX 4R0U9PA', 1009, CAST(23000000 AS Decimal(18, 0)), 10, CAST(20700000 AS Decimal(18, 0)), N'HP VICTUS 16 e0177AX 4R0U9PA( Ryzen 5 5600H,DDR4 8GB ,512GB SSD,  GTX™ 1650,16.1" FHD IPS, 144Hz)', N'Đánh giá chi tiết laptop Gaming HP VICTUS 16 e0177AX 4R0U9PA
<br/>

<br/>
Sở hữu bộ vi xử lý AMD Ryzen 5 5600H với 6 nhân 12 luồng mạnh mẽ, HP Victus cho phép người dùng vận hành tốt các tác vụ đồ họa, văn phòng từ cơ bản đến nâng cao một cách trơn tru, mượt mà thông qua các ứng dụng Word, Excel, Powerpoint,... Nhờ tốc độ ép xung tối đa 4.2 GHz Turbo Boost.
<br/>
Card đồ họa rời NVIDIA GeForce GTX1650 4 GB cung cấp hiệu suất đồ họa cao, chỉnh sửa, kết xuất hình ảnh 2D, render video với các phần mềm đến từ nhà Adobe, nâng cao trải nghiệm tác chiến các tựa game có mức cài đặt trung bình cao đình đám hiện nay như PUBG, GTA V, Dota 2,... với những chuyển động mượt mà trên từng đường nét.
<br/>
<br/><img src="/images/pictures/hp_victus_pic_1.JPG" alt="HP VICTUS 16 e0177AX 4R0U9PA"><br/>
<br/>
RAM 8 GB chuẩn DDR4 2 khe (1 khe 4 GB + 1 khe 4 GB) cung cấp khả năng đa nhiệm cao, cho phép người dùng mở ứng dụng và làm việc với hàng chục cửa sổ cùng lúc mà không lo giật lag nhờ tốc độ Bus RAM 3200 MHz. Máy còn hỗ trợ nâng cấp tối đa 64GB RAM cho các game thủ thỏa sức chiến mọi tựa game ngốn RAM.
<br/>
Khởi động máy, ứng dụng nhanh chóng với tốc độ phản hồi và đọc ghi nhanh nhờ vào ổ cứng SSD 512 GB NVMe PCIe. Bạn hoàn toàn có thể tháo ra và lắp thanh khác tối đa lên đến 1 TB, máy còn hỗ trợ thêm khe cắm SSD M.2 PCIe (nâng cấp tối đa 1 TB), mở rộng không gian lưu trữ để phục vụ tối ưu công việc của người dùng.
<br/>
<br/><img src="/images/pictures/hp_victus_pic_2.JPG" alt="HP VICTUS 16 e0177AX 4R0U9PA"><br/>
<br/>
Được bao bọc bởi lớp vỏ nhựa với sắc đen đầy cuốn hút, kết hợp cùng những đường viền tinh xảo trên thân máy, laptop HP chinh phục mọi đối tượng người dùng với vẻ ngoài mang phong cách tối giản, hiện đại nhưng không kém phần sang trọng, cá tính. Bề dày 23.5 mm và trọng lượng 2.46 kg vẫn vừa vặn để máy vào balo và thuận tiện di chuyển đến mọi địa điểm bạn muốn.
<br/>
Bàn phím có kích thước Fullsize với khoảng cách bố trí hợp lý cùng hành trình sâu và độ nảy cao, mang đến cho bạn trải nghiệm soạn thảo văn bản êm tay, thoải mái. Một điểm trừ rất đáng tiếc cho chiếc laptop gaming này là không được trang bị đèn nền, gây khó khăn cho các game thủ khi phải chiến đấu ở những môi trường thiếu sáng.
<br/>
<br/><img src="/images/pictures/hp_victus_pic_3.JPG" alt="HP VICTUS 16 e0177AX 4R0U9PA"><br/>
<br/>
Laptop được trang bị khá đầy đủ các cổng kết nối phổ biến hiện nay như 3 cổng SuperSpeed USB A, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45) và USB Type-C, hỗ trợ liên kết với các thiết bị ngoại vi tương thích một cách nhanh chóng và chính xác. Ngoài ra, hai kết nối không dây chuẩn Bluetooth 5.2 tích hợp Wi-Fi 6 (802.11ax) với băng thông lên đến 10.000 Mbps mang đến tốc độ truyền tải nhanh chóng cùng phạm vi xử lý rộng, cho bạn thỏa sức chiến game mà không lo bị gián đoạn, dang dở giữa chừng.<br/>
<br/><img src="/images/pictures/hp_victus_pic_4.JPG" alt="HP VICTUS 16 e0177AX 4R0U9PA"><br/>

<br/>
Không gian hiển thị rộng lớn với kích thước màn hình 16.1 inch cùng độ phân giải Full HD (1920 x 1080) cung cấp những khung hình sắc nét, chân thật đến từng chi tiết trong bối cảnh game với góc nhìn lên đến 178 độ nhờ tấm nền IPS hiện đại. Mãn nhãn với những chuyển động mượt mà trên từng nhân vật trong game nhờ tần số quét màn hình 144 Hz, hạn chế tối đa hiện tượng giật xé hình và luôn bảo vệ độ an toàn cho mắt trước cường độ ánh sáng mạnh nhờ vào màn hình chống chói Anti Glare.
<br/>
<br/><img src="/images/pictures/hp_victus_pic_5.JPG" alt="HP VICTUS 16 e0177AX 4R0U9PA"><br/>

Trọn vẹn phút giây thư giãn với chất lượng âm thanh chân thực, âm bass to rõ, khả năng lọc khử tiếng ồn tốt nhờ công nghệ Bang & Olufsen audio kết hợp hoàn mỹ với HP Audio Boost, mang đến những trải nghiệm giải trí trên cả tuyệt vời. Nhìn chung, laptop HP Gaming VICTUS 16 e0177AX (4R0U9PA) sẽ là một chiến binh nổi bật cùng bạn ra trận trên mọi chiến trường ảo hay đam mê những việc thiết kế đồ họa, kỹ thuật.<br/>
<br/><img src="/images/pictures/hp_victus_pic_6.JPG" alt="HP VICTUS 16 e0177AX 4R0U9PA"><br/>', N'AMD Ryzen 5 5600H', N'8GB (2x4GB) DDR4 3200Mhz (2 khe, max 64GB RAM)', N'512GB SSD M.2 PCIE (2x M.2 SATA/NVMe)', N'NVIDIA® GeForce GTX™ 1650 Laptop GPU', N'16.1" FHD (1920 x 1080) IPS, 144Hz', N'HD 720P', N'	1x RJ45 LAN port 1x 3.5mm Combo Audio Jack 1x USB Type-C  1x USB Type-A  2x USB Type-A ', N'2.46 kg', N'4 Cell 70WHr Li-ion polymer', N'Windows 11 Home', 0, N'/images/pictures/hp_victus_pic_layout.JPG', CAST(N'2022-04-08 16:24:01.000' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (39, N'HP VICTUS 16 d0197TX 4R0T9PA', 1009, CAST(38000000 AS Decimal(18, 0)), 3, CAST(36860000 AS Decimal(18, 0)), N'HP VICTUS 16 d0197TX 4R0T9PA (i7-11800H,DDR4 16GB,512GB,RTX™ 3060 6GB GDDR6,16.1 inch FHD,144Hz, IPS)', N'Đánh giá chi tiết laptop Gaming HP VICTUS 16 d0197TX 4R0T9PA<br/>
Với thiết kế tinh tế, phần cứng hoàn thiện tuyệt vời, cấu hình hấp dẫn cùng mức giá chỉ ở ngưỡng tầm trung; HP Victus 16 sẽ phù hợp với game thủ, người làm multimedia,… Với hầu bao vừa phải nhưng vẫn muốn có được trải nghiệm sát nhất có thể so với các sản phẩm cao cấp.
<br/>
<br/><img src="/images/pictures/hp_victus_pic_1.JPG" alt="HP VICTUS 16 d0197TX 4R0T9PA"><br/>
<br/>
Với vẻ ngoài vuông vắn cùng lớp sơn nhám Đen quen thuộc; HP Victus 16 dễ khiến người ta liên tưởng tới các sản phẩm Omen ở phân khúc cao cấp. Nhưng nếu nhìn kỹ, không khó để thấy rằng sản phẩm của chúng ta còn thú vị hơn vậy nhiều. Chẳng hạn như ở nắp máy, HP đã có một logo chữ V bóng bẩy, tinh tế dành riêng cho dòng Victus. Hay phần khe thoát gió phía sau cũng được thiết kế lại, tràn hẳn ra hai bên để tăng cường lưu thông khí. Về độ hoàn thiện, HP Victus 16 có thể được đánh giá ở mức tốt, với việc vỏ máy cũng được cấu thành từ kim loại tương tự các sản phẩm Omen. Các khu vực trọng yếu như nắp máy, khung phím,.. đều tỏ ra cứng cáp; còn bản lề máy cũng cho cảm giác gập mở đầm tay.
<br/>
Mặc dù sở hữu màn hình lên đến 16.1-inch, thân hình của HP Victus 16 vẫn tỏ ra gọn gàng tương đương với các sản phẩm 15.6-inch trên thị trường. Có được không gian trải nghiệm rộng hơn nhưng không cần đánh đổi về diện tích trong balo, túi đeo,… Nghe đã rất thú vị rồi phải không nào? Có điều trọng lượng của máy sẽ hơi cao so với mặt bằng chung trong tầm giá (2.46kg), đây cũng là một sự đánh đổi cho tất cả những ưu điểm kể trên.
<br/>
<br/><img src="/images/pictures/hp_victus_pic_2.JPG" alt="HP VICTUS 16 d0197TX 4R0T9PA"><br/>
<br/>
Để có được kích thước 16.1-inch bên trong thân hình tương đương 15.6-inch, HP đã phải làm viền màn hình Victus 16 sao cho mỏng nhất có thể. Nhờ vậy nên người dùng sẽ có được trải nghiệm thị giác rộng rãi, thoải mái cho mọi hoạt động: Lướt web, xem video, chơi game và còn nhiều nữa.
<br/>
Về chất lượng hình ảnh, HP Victus 16 cũng có thể đảm bảo nhờ sở hữu độ phân giải FullHD (1920 x 1080), tấm nền IPS cho góc nhìn rộng và thông số màu sắc tương đối cao: 100% sRGB, 78% AdobeRGB, 79% DCI-P3 cùng độ sai lệch màu DeltaE dươi 2.0. Dù là dùng để xem phim, chơi game hay thậm chí là retouch ảnh, làm màu video; màn hình này vẫn sẽ có thể đáp ứng tốt.
<br/>
<br/><img src="/images/pictures/hp_victus_pic_3.JPG" alt="HP VICTUS 16 d0197TX 4R0T9PA"><br/>
<br/>
Khác với dòng Omen, HP Victus 16 sẽ có bàn phím đầy đủ số và chữ; thuận tiện sử dụng cho đa dạng tác vụ từ nhập liệu đến chơi game. Trải nghiệm gõ mà bàn phím này đem lại cũng là rất ổn, với hành trình vừa đủ đi kèm độ phản hồi tương đối tốt. Có điều thay vì LED RGB như các sản phẩm gaming khác, đèn nền của HP Victus 16 sẽ chỉ ở dạng đơn sắc mà thôi. Vì vậy nên tính thẩm mỹ của sản phẩm sẽ phần nào hạn chế, nhưng bù lại thì độ sáng đèn lại đủ nhìn, tiện dùng.
<br/>
HP Victus 16 sở hữu touchpad lớn hơn 19% so với các sản phẩm tương tự trước đó, với bề mặt láng mịn giúp cho ra cảm giác dễ chịu khi tiếp xúc. Kết hợp với khả năng phản hồi nhanh nhạy và tracking chính xác; gần như không có gì để phàn nàn về trải nghiệm vuốt chạm, zoom nhiều ngón, kéo thả,… trên sản phẩm.
<br/>
<br/><img src="/images/pictures/hp_victus_pic_4.JPG" alt="HP VICTUS 16 d0197TX 4R0T9PA"><br/>
<br/>
Với HP Victus 16, người dùng sẽ được trải nghiệm sức mạnh tới từ CPU Intel Core i thế hệ 11, 8GB/16GB RAM DDR4-3200MHz, SSD NVMe phục vụ lưu trữ cùng card đồ hoạ NVIDIA. Đây đều là những linh kiện hiệu năng cao thuộc hàng mới nhất ở thời điểm hiện tại, với nhiều cải tiến sâu về mặt cấu trúc để có thể đem lại sức mạnh tốt và tối ưu so với thế hệ đi trước.
<br/>

<br/><img src="/images/pictures/hp_victus_pic_5.JPG" alt="HP VICTUS 16 d0197TX 4R0T9PA"><br/><br/>
Với thân hình tương đối dày bản, không quá ngạc nhiên khi HP Victus 16 có thể sở hữu dồi dào cổng kết nối. Cụ thể, người dùng sẽ có được 3 cổng USB-A, 1 cổng USB-C 3.2 Gen1 hỗ trợ xuất hình, cổng HDMI 2.1, cổng LAN RJ45, khe thẻ SD cùng jack tai nghe 3.5 combo – thuận tiện cho mọi nhu cầu kết nối gaming gear, ổ cứng hay cả thẻ nhớ để phục vụ người dùng multimedia.<br/>
<br/><img src="/images/pictures/hp_victus_pic_6.JPG" alt="HP VICTUS 16 d0197TX 4R0T9PA"><br/>', N'Intel Core i7-11800H', N'16GB (2x8GB) DDR4 3200Mhz (2 khe, max 64GB RAM)', N'512GB SSD M.2 PCIE + 32GB Intel Optane memory (2x M.2 SATA/NVMe)', N'NVIDIA® GeForce RTX™ 3060 Laptop GPU + Intel® UHD Graphics', N'16.1" FHD (1920 x 1080) IPS, 144Hz', N'HD 720p', N'	1x RJ45 LAN port 1x 3.5mm Combo Audio Jack 1x USB Type-C  1x USB Type-A  2x USB Type-A ', N'	2.46 kg', N'	4 Cell 70WHr Li-ion polymer', N'Windows 10 Home', 0, N'/images/pictures/hp_victus_i7_pic_layout.JPG', CAST(N'2022-04-08 16:36:53.463' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (40, N'HP Victus 16-d0204TX 4R0U5PA', 1009, CAST(26000000 AS Decimal(18, 0)), 12, CAST(22880000 AS Decimal(18, 0)), N'[Mới 100%] Laptop Gaming HP Victus 16-d0204TX 4R0U5PA (Core i5 11400H, RAM 8GB, 256GB, RTX 3050 4GB, 16.1 FHD IPS)
', N'Đánh giá chi tiết Laptop Gaming HP Victus 16
<br/>
Với thiết kế tinh tế, phần cứng hoàn thiện tuyệt vời, cấu hình hấp dẫn cùng mức giá chỉ ở ngưỡng tầm trung; HP Victus 16 sẽ phù hợp với game thủ, người làm multimedia,… với hầu bao vừa phải nhưng vẫn muốn có được trải nghiệm sát nhất có thể so với các sản phẩm cao cấp. 
<br/>
Thiết kế đơn giản, mang âm hưởng từ dòng Omen cao cấp 
<br/>
Với vẻ ngoài vuông vắn cùng lớp sơn nhám Đen quen thuộc; HP Victus 16 dễ khiến người ta liên tưởng tới các sản phẩm Omen ở phân khúc cao cấp. Nhưng nếu nhìn kỹ, không khó để thấy rằng sản phẩm của chúng ta còn thú vị hơn vậy nhiều. Chẳng hạn như ở nắp máy, HP đã có một logo chữ V bóng bẩy, tinh tế dành riêng cho dòng Victus. Hay phần khe thoát gió phía sau cũng được thiết kế lại, tràn hẳn ra hai bên để tăng cường lưu thông khí.
<br/>
Về độ hoàn thiện, HP Victus 16 có thể được đánh giá ở mức ổn. Vỏ máy được làm từ nhựa với độ chắc chắn chấp nhận được, vẫn sẽ flex nhẹ ở khung phím nhưng không ảnh hưởng tới quá trình gõ. Bản lề máy cũng cho cảm giác gập mở đầm tay - tuy nhiên hơi dễ rung lắc khi chạm vào hay có người đi qua lỡ va vào mặt bàn đang để máy. 
<br/>
Mặc dù sở hữu màn hình lên đến 16.1-inch, thân hình của HP Victus 16 vẫn tỏ ra gọn gàng tương đương với các sản phẩm 15.6-inch trên thị trường. Có được không gian trải nghiệm rộng hơn nhưng không cần đánh đổi về diện tích trong balo, túi đeo,… Nghe đã rất thú vị rồi phải không nào? Có điều trọng lượng của máy sẽ hơi cao so với mặt bằng chung trong tầm giá (2.46kg), âu cũng là một sự đánh đổi cho tất cả những ưu điểm kể trên. 
<br/>
<br/><img src="/images/pictures/hp_victus_pic_1.JPG" alt="HP Victus 16-d0204TX 4R0U5PA"><br/>
<br/>
Màn hình được tối ưu đảm bảo rộng rãi, màu sắc tốt 
<br/>
Để có được kích thước 16.1-inch bên trong thân hình tương đương 15.6-inch, HP đã phải làm viền màn hình Victus 16 sao cho mỏng nhất có thể. Nhờ vậy nên người dùng sẽ có được trải nghiệm thị giác rộng rãi, thoải mái cho mọi hoạt động: Lướt web, xem video, chơi game và còn nhiều nữa. 
<br/>
<br/><img src="/images/pictures/hp_victus_pic_2.JPG" alt="HP Victus 16-d0204TX 4R0U5PA"><br/>
<br/>
Về chất lượng hình ảnh, HP Victus 16 cũng có thể đảm bảo nhờ sở hữu độ phân giải FullHD (1920 x 1080), tấm nền IPS cho góc nhìn rộng và thông số màu sắc tương đối cao: 65%sRGB cùng độ sai lệch màu DeltaE dưới 2.0. Dù là dùng để xem phim, chơi game hay thậm chí là retouch ảnh, làm màu video; màn hình này vẫn sẽ có thể đáp ứng tốt. 
<br/>
Bàn phím và touchpad rộng rãi, chất lượng hoàn thiện cao
<br/>
Khác với dòng Omen, HP Victus 16 sẽ có bàn phím đầy đủ số và chữ; thuận tiện sử dụng cho đa dạng tác vụ từ nhập liệu đến chơi game. Trải nghiệm gõ mà bàn phím này đem lại cũng là rất ổn, với hành trình vừa đủ đi kèm độ phản hồi tương đối tốt. Có điều thay vì LED RGB như các sản phẩm gaming khác, đèn nền của HP Victus 16 sẽ chỉ ở dạng đơn sắc mà thôi. Vì vậy nên tính thẩm mỹ của sản phẩm sẽ phần nào hạn chế, nhưng bù lại thì độ sáng đèn lại đủ nhìn, tiện dùng.
<br/>
<br/><img src="/images/pictures/hp_victus_pic_3.JPG" alt="HP Victus 16-d0204TX 4R0U5PA"><br/>
<br/>
HP Victus 16 sở hữu touchpad lớn hơn 19% so với các sản phẩm tương tự trước đó, với bề mặt láng mịn giúp cho ra cảm giác dễ chịu khi tiếp xúc. Kết hợp với khả năng phản hồi nhanh nhạy và tracking chính xác; gần như không có gì để phàn nàn về trải nghiệm vuốt chạm, zoom nhiều ngón, kéo thả,… trên sản phẩm. 
<br/>
Cấu hình thế hệ mới mạnh mẽ trong tầm giá
<br/>
Với HP Victus 16, người dùng sẽ được trải nghiệm sức mạnh tới từ CPU Intel Core i5-11400H 6 nhân 12 luồng, 8GB RAM DDR4-3200MHz, 256GB SSD NVMe phục vụ lưu trữ cùng card đồ hoạ NVIDIA RTX 3050 4GB GDDR6. Đây đều là những linh kiện hiệu năng cao thuộc hàng mới nhất ở thời điểm hiện tại, với nhiều cải tiến sâu về mặt cấu trúc để có thể đem lại sức mạnh tốt và tối ưu so với thế hệ đi trước. Với tiến trình 10nm SuperFin hiện đại, CPU i5-11400H sẽ có thể chạy mát hơn và cung cấp hiệu năng tốt hơn trên cùng một mức điện so với các tuỳ chọn 14nm cũ. Còn với RTX 3050 4GB, đây là mẫu card tầm trung duy nhất ở thời điểm hiện tại có được khả năng Ray Tracing, rất phù hợp nếu game thủ muốn nâng tầm hiệu suất và độ chân thực trong game với mức giá tối thiểu.   
<br/>
<br/><img src="/images/pictures/hp_victus_pic_4.JPG" alt="HP Victus 16-d0204TX 4R0U5PA"><br/>
<br/>
Về các linh kiện còn lại, 8GB RAM và 256GB SSD sẽ là ở mức vừa đủ cho nhu cầu gaming hiện nay. Nếu muốn cơi nới thêm, HP Victus 16 hoàn toàn có thể đáp ứng với việc cho phép người dùng lắp tối đa 64GB RAM cũng như 2TB SSD NVMe. 
<br/>
Cổng kết nối đầy đủ, dồi dào 
<br/>
Với thân hình tương đối dày bản, không quá ngạc nhiên khi HP Victus 16 có thể sở hữu dồi dào cổng kết nối. Cụ thể, người dùng sẽ có được 3 cổng USB-A, 1 cổng USB-C 3.2 Gen1 hỗ trợ xuất hình, cổng HDMI 2.1, cổng LAN RJ45, khe thẻ SD cùng jack tai nghe 3.5 combo – thuận tiện cho mọi nhu cầu kết nối gaming gear, ổ cứng hay cả thẻ nhớ để phục vụ người dùng multimedia. <br/>
<br/><img src="/images/pictures/hp_victus_pic_5.JPG" alt="HP Victus 16-d0204TX 4R0U5PA"><br/>

<br/>
Kết luận: HP Victus 16 là một trong những sự lựa chọn hàng đầu của dòng máy Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng không kém phần tinh tế, kết hợp cùng cấu hình mạnh mẽ và tản nhiệt mát mẻ, HP Victus 16 tự tin có thể chinh phục được đa số các Game Online, Offline thời thượng hiện nay. Hơn thế nữa HP Victus 16 cũng đủ sức đáp ứng các tác vụ thiết kế đồ họa, công việc, giải trí một cách mượt mà nhất.<br/>
<br/><img src="/images/pictures/hp_victus_pic_6.JPG" alt="HP Victus 16-d0204TX 4R0U5PA"><br/>
', N'Core i5-11400H (6 nhân, 12 luồng)', N'8GB DDR4 Bus 3200Mhz Dual Channel', N'	SSD 256GB NVMe + 1 Khe SSD NVMe chờ', N'NVIDIA RTX 3050 4GB (75W)', N'16.1 inchs FHD IPS 60Hz 45% NTSC 250 nits', N'FHD Webcam', N'4 x USB-A, 1 x USB-C , 1 x HDMI, 1 x Jack 3.5mm, 1 x RJ-45 ', N'2.46 kg ', N'4 Cells 70.9Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/hp_victus_i5_pic_layout.JPG', CAST(N'2022-04-08 16:43:15.040' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (41, N'HP Victus 16-e0175AX 4R0U8PA', 1009, CAST(27000000 AS Decimal(18, 0)), 15, CAST(22950000 AS Decimal(18, 0)), N'[Mới 100%] Laptop Gaming HP Victus 16-e0175AX 4R0U8PA (AMD Ryzen 5-5600H, 8GB, 512GB, RTX 3050 4GB, 16.1 FHD 144Hz)
', N'Đánh giá chi tiết Laptop Gaming HP Victus 16
<br/>
Với thiết kế tinh tế, phần cứng hoàn thiện tuyệt vời, cấu hình hấp dẫn cùng mức giá chỉ ở ngưỡng tầm trung; HP Victus 16 sẽ phù hợp với game thủ, người làm multimedia,… với hầu bao vừa phải nhưng vẫn muốn có được trải nghiệm sát nhất có thể so với các sản phẩm cao cấp. 
<br/>
Thiết kế đơn giản, mang âm hưởng từ dòng Omen cao cấp 
<br/>
Với vẻ ngoài vuông vắn cùng lớp sơn nhám Đen quen thuộc; HP Victus 16 dễ khiến người ta liên tưởng tới các sản phẩm Omen ở phân khúc cao cấp. Nhưng nếu nhìn kỹ, không khó để thấy rằng sản phẩm của chúng ta còn thú vị hơn vậy nhiều. Chẳng hạn như ở nắp máy, HP đã có một logo chữ V bóng bẩy, tinh tế dành riêng cho dòng Victus. Hay phần khe thoát gió phía sau cũng được thiết kế lại, tràn hẳn ra hai bên để tăng cường lưu thông khí.
<br/>
Về độ hoàn thiện, HP Victus 16 có thể được đánh giá ở mức ổn. Vỏ máy được làm từ nhựa với độ chắc chắn chấp nhận được, vẫn sẽ flex nhẹ ở khung phím nhưng không ảnh hưởng tới quá trình gõ. Bản lề máy cũng cho cảm giác gập mở đầm tay - tuy nhiên hơi dễ rung lắc khi chạm vào hay có người đi qua lỡ va vào mặt bàn đang để máy. 
<br/>
Mặc dù sở hữu màn hình lên đến 16.1-inch, thân hình của HP Victus 16 vẫn tỏ ra gọn gàng tương đương với các sản phẩm 15.6-inch trên thị trường. Có được không gian trải nghiệm rộng hơn nhưng không cần đánh đổi về diện tích trong balo, túi đeo,… Nghe đã rất thú vị rồi phải không nào? Có điều trọng lượng của máy sẽ hơi cao so với mặt bằng chung trong tầm giá (2.46kg), âu cũng là một sự đánh đổi cho tất cả những ưu điểm kể trên. 
<br/>
<br/><img src="/images/pictures/hp_victus_pic_1.JPG" alt="HP Victus 16-d0204TX 4R0U5PA"><br/>
<br/>
Màn hình được tối ưu đảm bảo rộng rãi, màu sắc tốt 
<br/>
Để có được kích thước 16.1-inch bên trong thân hình tương đương 15.6-inch, HP đã phải làm viền màn hình Victus 16 sao cho mỏng nhất có thể. Nhờ vậy nên người dùng sẽ có được trải nghiệm thị giác rộng rãi, thoải mái cho mọi hoạt động: Lướt web, xem video, chơi game và còn nhiều nữa. 
<br/>
<br/><img src="/images/pictures/hp_victus_pic_2.JPG" alt="HP Victus 16-d0204TX 4R0U5PA"><br/>
<br/>
Về chất lượng hình ảnh, HP Victus 16 cũng có thể đảm bảo nhờ sở hữu độ phân giải FullHD (1920 x 1080), tấm nền IPS cho góc nhìn rộng và thông số màu sắc tương đối cao: 65%sRGB cùng độ sai lệch màu DeltaE dưới 2.0. Dù là dùng để xem phim, chơi game hay thậm chí là retouch ảnh, làm màu video; màn hình này vẫn sẽ có thể đáp ứng tốt. 
<br/>
Bàn phím và touchpad rộng rãi, chất lượng hoàn thiện cao
<br/>
Khác với dòng Omen, HP Victus 16 sẽ có bàn phím đầy đủ số và chữ; thuận tiện sử dụng cho đa dạng tác vụ từ nhập liệu đến chơi game. Trải nghiệm gõ mà bàn phím này đem lại cũng là rất ổn, với hành trình vừa đủ đi kèm độ phản hồi tương đối tốt. Có điều thay vì LED RGB như các sản phẩm gaming khác, đèn nền của HP Victus 16 sẽ chỉ ở dạng đơn sắc mà thôi. Vì vậy nên tính thẩm mỹ của sản phẩm sẽ phần nào hạn chế, nhưng bù lại thì độ sáng đèn lại đủ nhìn, tiện dùng.
<br/>
<br/><img src="/images/pictures/hp_victus_pic_3.JPG" alt="HP Victus 16-d0204TX 4R0U5PA"><br/>
<br/>
HP Victus 16 sở hữu touchpad lớn hơn 19% so với các sản phẩm tương tự trước đó, với bề mặt láng mịn giúp cho ra cảm giác dễ chịu khi tiếp xúc. Kết hợp với khả năng phản hồi nhanh nhạy và tracking chính xác; gần như không có gì để phàn nàn về trải nghiệm vuốt chạm, zoom nhiều ngón, kéo thả,… trên sản phẩm. 
<br/>
Cấu hình thế hệ mới mạnh mẽ trong tầm giá
<br/>
Với HP Victus 16, người dùng sẽ được trải nghiệm sức mạnh tới từ CPU Intel Core i5-11400H 6 nhân 12 luồng, 8GB RAM DDR4-3200MHz, 256GB SSD NVMe phục vụ lưu trữ cùng card đồ hoạ NVIDIA RTX 3050 4GB GDDR6. Đây đều là những linh kiện hiệu năng cao thuộc hàng mới nhất ở thời điểm hiện tại, với nhiều cải tiến sâu về mặt cấu trúc để có thể đem lại sức mạnh tốt và tối ưu so với thế hệ đi trước. Với tiến trình 7nm hiện đại, CPU Ryzen 5-5600H sẽ có thể chạy mát hơn và cung cấp hiệu năng tốt hơn trên cùng một mức điện so với các tuỳ chọn intel. Còn với RTX 3050 4GB, đây là mẫu card tầm trung duy nhất ở thời điểm hiện tại có được khả năng Ray Tracing, rất phù hợp nếu game thủ muốn nâng tầm hiệu suất và độ chân thực trong game với mức giá tối thiểu.   
<br/>
<br/><img src="/images/pictures/hp_victus_pic_4.JPG" alt="HP Victus 16-d0204TX 4R0U5PA"><br/>
<br/>
Về các linh kiện còn lại, 8GB RAM và 512GBSSD sẽ là ở mức vừa đủ cho nhu cầu gaming hiện nay. Nếu muốn cơi nới thêm, HP Victus 16 hoàn toàn có thể đáp ứng với việc cho phép người dùng lắp tối đa 64GB RAM cũng như 2TB SSD NVMe. 
<br/>
Cổng kết nối đầy đủ, dồi dào 
<br/>
Với thân hình tương đối dày bản, không quá ngạc nhiên khi HP Victus 16 có thể sở hữu dồi dào cổng kết nối. Cụ thể, người dùng sẽ có được 3 cổng USB-A, 1 cổng USB-C 3.2 Gen1 hỗ trợ xuất hình, cổng HDMI 2.1, cổng LAN RJ45, khe thẻ SD cùng jack tai nghe 3.5 combo – thuận tiện cho mọi nhu cầu kết nối gaming gear, ổ cứng hay cả thẻ nhớ để phục vụ người dùng multimedia. <br/>
<br/><img src="/images/pictures/hp_victus_pic_5.JPG" alt="HP Victus 16-d0204TX 4R0U5PA"><br/>

<br/>
Kết luận: HP Victus 16 là một trong những sự lựa chọn hàng đầu của dòng máy Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng không kém phần tinh tế, kết hợp cùng cấu hình mạnh mẽ và tản nhiệt mát mẻ, HP Victus 16 tự tin có thể chinh phục được đa số các Game Online, Offline thời thượng hiện nay. Hơn thế nữa HP Victus 16 cũng đủ sức đáp ứng các tác vụ thiết kế đồ họa, công việc, giải trí một cách mượt mà nhất.<br/>
<br/><img src="/images/pictures/hp_victus_pic_6.JPG" alt="HP Victus 16-d0204TX 4R0U5PA"><br/>
', N'Core R5-5600H (6 nhân, 12 luồng)', N'8GB DDR4 Bus 3200Mhz Dual Channel', N'	SSD 512GB NVMe + 1 Khe SSD NVMe chờ', N'NVIDIA RTX 3050 4GB (75W)', N'16.1 inchs FHD IPS 144Hz 45% NTSC 250 nits', N'FHD Webcam', N'	 4 x USB-A, 1 x USB-C , 1 x HDMI, 1 x Jack 3.5mm, 1 x RJ-45 ', N'2.46 kg ', N'4 Cells 70.9Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/hp_victus_i5_pic_layout.JPG', CAST(N'2022-04-08 16:48:40.293' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (42, N'HP Victus 16 2022 ', 1009, CAST(28000000 AS Decimal(18, 0)), 3, CAST(27160000 AS Decimal(18, 0)), N'[Mới 100%] HP Victus 16 2022 (Core i7-12700H, 16GB, 512GB, RTX 3060, 16.1 FHD 144Hz)
', N'HP Victus 16t-d100, thiết kế cũ, cấu hình khủng. 
<br/>
HP Victus 2021 là một phiên bản gaming hoàn hảo của hãng HP. Năm nay chúng ta sẽ được trải nghiệm một HP Victus 16 với thiết kế cũ, mang trong mình cấu hình mạnh mẽ hơn rất nhiều. Nhưng được tăng sức mạnh cho chiếc chiến thần gaming HP. 
<br/>
Thiết kế:
<br/>
Về phần thiết kế: HP Victus 16 phiên bản 2022 giống với phiên bản 2021, vẫn giữ những nét lịch lãm đặc trưng của dòng Victus 2021, không quá hầm hố như các dòng gaming Acer Nitro 5, Asus Rog Strix… 
<br/>
<br/><img src="/images/pictures/hp_victus_pic_1.JPG" alt="HP Victus 16 2022 "><br/>
<br/>
Touchpad và Bàn phím vẫn rất là rộng rãi, trang bị hệ thống đèn nền sáng bắt mắt. 
<br/>
Màn hình: 
<br/>
 <br/><img src="/images/pictures/hp_victus_pic_2.JPG" alt="HP Victus 16 2022 "><br/>
<br/>
16.1” QHD 144Hz IPS, 300 nits
<br/>
Phổ màu: 100%sRGB
<br/>
78% Adobe RGB
<br/>
81% DCI P3
<br/>
Độ tương phản 1250:1
<br/>
<br/><img src="/images/pictures/hp_victus_pic_3.JPG" alt="HP Victus 16 2022 "><br/>
<br/>

Cổng kết nối:
<br/>
 <br/><img src="/images/pictures/hp_victus_pic_4.JPG" alt="HP Victus 16 2022 "><br/>
<br/>
1 cổng USB Type-A <br/>
3 cổng USB Type-C<br/>
1 cổng Jack micro<br/>
1 cổng nguồn<br/>
1 cổng mạng RJ45<br/>
1 khe cắm thẻ SD<br/>

<br/>
<br/><img src="/images/pictures/hp_victus_pic_5.JPG" alt="HP Victus 16 2022 "><br/>
<br/>
Hiệu năng: <br/>
<br/>
Theo nguồn từ các anh Trung Quốc sau khi test 3 tựa games Battlefield 5, PUBG, World of Tank được như sau: 
<br/>
Nhiệt độ CPU: 72-85<br/>
Nhiệt độ GPU: 72-93 độ <br/>
Fps: 130-180<br/>
<br/>
<br/><img src="/images/pictures/hp_victus_pic_6.JPG" alt="HP Victus 16 2022 "><br/><br/>
Khả năng nâng cấp: 
<br/>
1 khe NVMe M.2 <br/>
SSD 512GB <br/>
Pin: 4Cell 70Wh<br/>

<br/>
Tổng kết: HP Victus 16 2022 là một phiên bản update cấu hình của phiên bản Victus 2021. Bạn nào thích thiết kế victus 2021 nhưng muốn cấu hình mạnh mẽ hơn, pin khỏe hơn thì có thể đổi sang phiên bản Victus 16 2022.', N'Core i7-12700H (14 nhân, 20 luồng)', N'16GB DDR5 4800MHz Dual Channel', N'SSD 512GB   1 khe M.2 NVMe', N'NVIDIA RTX 3060 6GB (100W)', N'16.1 inchs QHD IPS 144Hz 300 nits', N'HD 720P', N'1 cổng USB Type-A  3 cổng USB Type-C 1 cổng Jack micro 1 cổng nguồn 1 cổng mạng RJ45 1 khe cắm thẻ SD', N'2.46 kg ', N'4 Cell 70Wh', N'Windows 11 bản quyền', 0, N'/images/pictures/hp_victus_pic_1.JPG', CAST(N'2022-04-08 16:52:19.533' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (43, N'HP Victus 16-e0179AX 4R0V0PA', 1009, CAST(30000000 AS Decimal(18, 0)), 16, CAST(25200000 AS Decimal(18, 0)), N'[Mới 100%] Laptop Gaming HP Victus 16-e0179AX 4R0V0PA (AMD Ryzen 5-5600H, 8GB, 512GB, RTX 3050Ti 4GB, 16.1 FHD IPS 144Hz)
', N'Đánh giá chi tiết Laptop Gaming HP Victus 16
<br/>
Với thiết kế tinh tế, phần cứng hoàn thiện tuyệt vời, cấu hình hấp dẫn cùng mức giá chỉ ở ngưỡng tầm trung; HP Victus 16 sẽ phù hợp với game thủ, người làm multimedia,… với hầu bao vừa phải nhưng vẫn muốn có được trải nghiệm sát nhất có thể so với các sản phẩm cao cấp. 
<br/>
Thiết kế đơn giản, mang âm hưởng từ dòng Omen cao cấp 
<br/>
Với vẻ ngoài vuông vắn cùng lớp sơn nhám Đen quen thuộc; HP Victus 16 dễ khiến người ta liên tưởng tới các sản phẩm Omen ở phân khúc cao cấp. Nhưng nếu nhìn kỹ, không khó để thấy rằng sản phẩm của chúng ta còn thú vị hơn vậy nhiều. Chẳng hạn như ở nắp máy, HP đã có một logo chữ V bóng bẩy, tinh tế dành riêng cho dòng Victus. Hay phần khe thoát gió phía sau cũng được thiết kế lại, tràn hẳn ra hai bên để tăng cường lưu thông khí.
<br/>
Về độ hoàn thiện, HP Victus 16 có thể được đánh giá ở mức ổn. Vỏ máy được làm từ nhựa với độ chắc chắn chấp nhận được, vẫn sẽ flex nhẹ ở khung phím nhưng không ảnh hưởng tới quá trình gõ. Bản lề máy cũng cho cảm giác gập mở đầm tay - tuy nhiên hơi dễ rung lắc khi chạm vào hay có người đi qua lỡ va vào mặt bàn đang để máy. 
<br/>
Mặc dù sở hữu màn hình lên đến 16.1-inch, thân hình của HP Victus 16 vẫn tỏ ra gọn gàng tương đương với các sản phẩm 15.6-inch trên thị trường. Có được không gian trải nghiệm rộng hơn nhưng không cần đánh đổi về diện tích trong balo, túi đeo,… Nghe đã rất thú vị rồi phải không nào? Có điều trọng lượng của máy sẽ hơi cao so với mặt bằng chung trong tầm giá (2.46kg), âu cũng là một sự đánh đổi cho tất cả những ưu điểm kể trên. 
<br/>
<br/><img src="/images/pictures/hp_victus_pic_1.JPG" alt="HP Victus 16-e0179AX 4R0V0PA"><br/>
<br/>
Màn hình được tối ưu đảm bảo rộng rãi, màu sắc tốt 
<br/>
Để có được kích thước 16.1-inch bên trong thân hình tương đương 15.6-inch, HP đã phải làm viền màn hình Victus 16 sao cho mỏng nhất có thể. Nhờ vậy nên người dùng sẽ có được trải nghiệm thị giác rộng rãi, thoải mái cho mọi hoạt động: Lướt web, xem video, chơi game và còn nhiều nữa. 
<br/>
<br/><img src="/images/pictures/hp_victus_pic_2.JPG" alt="HP Victus 16-e0179AX 4R0V0PA"><br/>
<br/>
Về chất lượng hình ảnh, HP Victus 16 cũng có thể đảm bảo nhờ sở hữu độ phân giải FullHD (1920 x 1080), tấm nền IPS cho góc nhìn rộng và thông số màu sắc tương đối cao: 65%sRGB cùng độ sai lệch màu DeltaE dưới 2.0. Dù là dùng để xem phim, chơi game hay thậm chí là retouch ảnh, làm màu video; màn hình này vẫn sẽ có thể đáp ứng tốt. 
<br/>
Bàn phím và touchpad rộng rãi, chất lượng hoàn thiện cao
<br/>
Khác với dòng Omen, HP Victus 16 sẽ có bàn phím đầy đủ số và chữ; thuận tiện sử dụng cho đa dạng tác vụ từ nhập liệu đến chơi game. Trải nghiệm gõ mà bàn phím này đem lại cũng là rất ổn, với hành trình vừa đủ đi kèm độ phản hồi tương đối tốt. Có điều thay vì LED RGB như các sản phẩm gaming khác, đèn nền của HP Victus 16 sẽ chỉ ở dạng đơn sắc mà thôi. Vì vậy nên tính thẩm mỹ của sản phẩm sẽ phần nào hạn chế, nhưng bù lại thì độ sáng đèn lại đủ nhìn, tiện dùng.
<br/>
<br/><img src="/images/pictures/hp_victus_pic_3.JPG" alt="HP Victus 16-e0179AX 4R0V0PA"><br/>
<br/>
HP Victus 16 sở hữu touchpad lớn hơn 19% so với các sản phẩm tương tự trước đó, với bề mặt láng mịn giúp cho ra cảm giác dễ chịu khi tiếp xúc. Kết hợp với khả năng phản hồi nhanh nhạy và tracking chính xác; gần như không có gì để phàn nàn về trải nghiệm vuốt chạm, zoom nhiều ngón, kéo thả,… trên sản phẩm. 
<br/>
Cấu hình thế hệ mới mạnh mẽ trong tầm giá
<br/>
Với HP Victus 16, người dùng sẽ được trải nghiệm sức mạnh tới từ CPU Intel Core i5-11400H 6 nhân 12 luồng, 8GB RAM DDR4-3200MHz, 256GB SSD NVMe phục vụ lưu trữ cùng card đồ hoạ NVIDIA RTX 3050 4GB GDDR6. Đây đều là những linh kiện hiệu năng cao thuộc hàng mới nhất ở thời điểm hiện tại, với nhiều cải tiến sâu về mặt cấu trúc để có thể đem lại sức mạnh tốt và tối ưu so với thế hệ đi trước. Với tiến trình 7nm hiện đại, CPU Ryzen 5-5600H sẽ có thể chạy mát hơn và cung cấp hiệu năng tốt hơn trên cùng một mức điện so với các tuỳ chọn intel. Còn với RTX 3050 4GB, đây là mẫu card tầm trung duy nhất ở thời điểm hiện tại có được khả năng Ray Tracing, rất phù hợp nếu game thủ muốn nâng tầm hiệu suất và độ chân thực trong game với mức giá tối thiểu.   
<br/>
<br/><img src="/images/pictures/hp_victus_pic_4.JPG" alt="HP Victus 16-e0179AX 4R0V0PA"><br/>
<br/>
Về các linh kiện còn lại, 8GB RAM và 512GBSSD sẽ là ở mức vừa đủ cho nhu cầu gaming hiện nay. Nếu muốn cơi nới thêm, HP Victus 16 hoàn toàn có thể đáp ứng với việc cho phép người dùng lắp tối đa 64GB RAM cũng như 2TB SSD NVMe. 
<br/>
Cổng kết nối đầy đủ, dồi dào 
<br/>
Với thân hình tương đối dày bản, không quá ngạc nhiên khi HP Victus 16 có thể sở hữu dồi dào cổng kết nối. Cụ thể, người dùng sẽ có được 3 cổng USB-A, 1 cổng USB-C 3.2 Gen1 hỗ trợ xuất hình, cổng HDMI 2.1, cổng LAN RJ45, khe thẻ SD cùng jack tai nghe 3.5 combo – thuận tiện cho mọi nhu cầu kết nối gaming gear, ổ cứng hay cả thẻ nhớ để phục vụ người dùng multimedia. <br/>
<br/><img src="/images/pictures/hp_victus_pic_5.JPG" alt="HP Victus 16-e0179AX 4R0V0PA"><br/>

<br/>
Kết luận: HP Victus 16 là một trong những sự lựa chọn hàng đầu của dòng máy Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng không kém phần tinh tế, kết hợp cùng cấu hình mạnh mẽ và tản nhiệt mát mẻ, HP Victus 16 tự tin có thể chinh phục được đa số các Game Online, Offline thời thượng hiện nay. Hơn thế nữa HP Victus 16 cũng đủ sức đáp ứng các tác vụ thiết kế đồ họa, công việc, giải trí một cách mượt mà nhất.<br/>
<br/><img src="/images/pictures/hp_victus_pic_6.JPG" alt="HP Victus 16-e0179AX 4R0V0PA"><br/>
', N'Core R5-5600H (6 nhân, 12 luồng)', N'16GB DDR4 Bus 3200Mhz Dual Channel', N'SSD 512GB NVMe + 1 Khe SSD NVMe chờ', N'NVIDIA RTX 3050Ti 4GB (75W)', N'16.1 inchs FHD IPS 144Hz 45% NTSC 250 nits', N'HD 720P', N'4 x USB-A, 1 x USB-C), 1 x HDMI, 1 x Jack 3.5mm, 1 x RJ-45 ', N'2.46 kg ', N'	4 Cell 70WHr Li-ion polymer', N'Windows 10 bản quyền', 0, N'/images/pictures/hp_victus_i5_pic_layout.JPG', CAST(N'2022-04-08 16:57:01.710' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (44, N'HP OMEN 15 2020', 1009, CAST(32000000 AS Decimal(18, 0)), 15, CAST(27200000 AS Decimal(18, 0)), N'HP OMEN 15 2020 (Core i7 - 10750H, 8GB, 256GB + 1TB, VGA 6GB GTX 1660Ti, 15.6 FHD 60Hz)
', N'Là một laptop gaming,‌ ‌chiếc‌ ‌máy‌ ‌hướng‌ ‌tới‌ ‌đối‌ ‌tượng‌ ‌người‌ ‌dùng‌ ‌chơi‌ ‌game‌ ‌bán‌ ‌chuyên,‌ ‌cũng‌ ‌như‌ ‌những‌ ‌đối‌ ‌tượng‌ ‌thiết‌ ‌kế‌ ‌đồ‌ ‌họa‌ ‌với‌ ‌chi‌ ‌phí‌ ‌vừa‌ ‌phải.‌ ‌
<br/>
Laptop‌ gaming ‌với ‌thiết ‌kế ‌đơn ‌giản‌
<br/>
HP‌ đã ‌quyết ‌định ‌thay ‌đổi ‌hoàn‌ ‌toàn‌ ‌thiết‌ ‌kế‌ ‌cho‌ ‌dòng‌ ‌laptop‌ ‌gaming‌ ‌OMEN‌ ‌của‌ ‌mình,‌ ‌không‌ ‌còn‌ ‌là‌ kiểu‌ ‌thiết‌ ‌kế‌ ‌to‌ ‌nạc‌ ‌hầm‌ ‌hố‌ ‌nữa,‌ ‌giờ‌ ‌đã‌ ‌thanh‌ ‌lịch‌ ‌và‌ ‌đơn‌ ‌giản‌ ‌hơn.‌ ‌Vỏ‌ ‌máy‌ ‌hoàn‌ ‌toàn‌ ‌được‌ ‌làm‌ ‌bằng‌ kim‌ ‌loại‌ ‌với‌ ‌lớp‌ ‌sơn‌ ‌đen‌ ‌mạnh‌ ‌mẽ.‌ ‌Logo‌ ‌“Voodoo”‌ ‌hầm‌ ‌hố,‌ ‌được làm bằng những lớp phản quang cao cấp. ‌Các‌ ‌cạnh‌ ‌viền‌ được‌ ‌làm‌ ‌cân‌ ‌đối,‌ ‌đều‌ ‌đặn‌ ‌hơn,‌ ‌không‌ ‌còn‌ ‌những‌ ‌cạnh‌ ‌vát‌ ‌chéo‌ ‌như‌ ‌thế‌ ‌hệ‌ ‌trước.‌ ‌Viền‌ ‌màn‌ ‌hình‌ ‌cũng‌ được‌ ‌thiết‌ ‌kế‌ ‌mỏng‌ ‌hơn,‌ ‌giảm‌ ‌tối‌ ‌đa‌ ‌kích‌ ‌thước‌ ‌tổng‌ ‌thể.‌ ‌Cụm‌ ‌bản‌ ‌lề‌ ‌nay‌ ‌đã‌ ‌được‌ ‌làm‌ ‌thấp‌ ‌xuống,‌ ‌không‌ ‌còn‌ ‌để‌ ‌cao‌ ‌như‌ ‌thế‌ ‌hệ‌ ‌trước,‌ ‌nhằm‌ ‌tránh‌ ‌những‌ ‌rủi‌ ‌ro‌ ‌không‌ ‌đáng‌ ‌có.‌
<br/>
Màn‌ ‌hình‌ ‌tối ưu cho game thủ‌
<br/>
<br/><img src="/images/pictures/hp_omen_2020_pic_1.JPG" alt="HP OMEN 15 2020"><br/>

HP Omen 15 2020 phiên bản AMD‌ ‌được‌ ‌trang‌ ‌bị‌ ‌màn‌ ‌hình‌ ‌Full‌ ‌HD‌ ‌IPS‌.‌ Đây là màn hình vô cùng thích hợp cho việc vừa thực hiện các công việc đồ hoạ, vừa dùng để gaming.
<br/>
Hiệu‌ năng vượt sức tưởng tượng‌<br/>
<br/><img src="/images/pictures/hp_omen_2020_pic_2.JPG" alt="HP OMEN 15 2020"><br/>

<br/>
Máy sử dụng dòng chip Intel core i7 gen 10th cho hiệu năng đột phá hoàn toàn. HP Omen 15 không chỉ chơi mượt những tựa game yêu cầu cấu hình cao, mà còn chạy mượt cả các tác vụ đồ hoạ, hay render nặng hiện nay.
<br/>
Bên cạnh hệ thống vi xử lý mạnh mẽ, là hệ thống card đồ hoạ hiệu năng cao. Máy được trang bị hai phiên bản card đồ hoạ rời là GTX 1660Ti và RTX 2060, với sức mạnh vượt trội.
<br/>
Bàn‌ ‌phím‌ ‌và‌ ‌Touchpad‌‌
<br/>
<br/><img src="/images/pictures/hp_omen_2020_pic_3.JPG" alt="HP OMEN 15 2020"><br/>
<br/>
Bàn‌ ‌phím‌ ‌của‌ ‌OMEN‌ ‌15‌ ‌đã‌ ‌được‌ ‌thiết‌ ‌kế‌ ‌lại,‌ ‌với‌ ‌bố‌ ‌trí‌ ‌các‌ ‌phím‌ ‌rộng‌ ‌hơn,‌ ‌tối‌ ‌ưu‌ ‌hóa‌ ‌trải‌ ‌nghiệm‌ gaming.‌ ‌Hệ‌ ‌thống‌ ‌ký‌ ‌tự‌ ‌được‌ ‌thiết‌ ‌kế‌ ‌lại,‌ ‌trông‌ ‌góc‌ ‌cạnh‌ ‌và‌ ‌hầm‌ ‌hố‌ ‌hơn.‌ ‌Chiếc‌ ‌máy‌ ‌đã‌ ‌lược‌ ‌bỏ‌ ‌hệ‌ ‌thống‌ phím‌ ‌số‌ ‌đi‌ ‌so‌ ‌với‌ ‌phiên‌ ‌bản‌ ‌trước.‌ ‌Keycaps‌ ‌được‌ ‌làm‌ ‌phẳng,‌ ‌tuy‌ ‌nhiên‌ ‌hành‌ ‌trình‌ ‌sâu,‌ ‌phản‌ ‌hồi‌ ‌tốt.‌ ‌Hệ‌ thống‌ ‌LED‌ ‌RGB‌ ‌sáng‌ ‌đều,‌ ‌không‌ ‌quá‌ ‌chói.‌
<br/>
‌Touchpad‌ ‌chiếc‌ ‌máy‌ ‌được‌ ‌phủ‌ ‌lớp‌ ‌nhựa‌ ‌nhám,‌ ‌tuy‌ ‌nhiên‌ ‌di‌ chuyển‌ ‌nhạy,‌ ‌cử‌ ‌chỉ‌ ‌phản‌ ‌hồi‌ ‌tốt‌ ‌nhờ‌ ‌Windows‌ ‌Precision‌ ‌Driver.‌ ‌Thay‌ ‌vì‌ ‌tách‌ ‌rời‌ ‌hai‌ ‌nút‌ ‌chuột‌ ‌như‌ ‌phiên‌ bản‌ ‌trước‌ ‌đó,‌ ‌OMEN‌ ‌15‌ ‌2020‌ ‌lại‌ ‌tích‌ ‌hợp‌ ‌vào,‌ ‌tăng‌ ‌tối‌ ‌đa‌ ‌diện‌ ‌tích‌ ‌cho‌ ‌bàn‌ ‌rê.‌
<br/>
Khả năng kết nối ngoại vi vượt trội‌
<br/><img src="/images/pictures/hp_omen_2020_pic_4.JPG" alt="HP OMEN 15 2020"><br/>

<br/>
Do sử dụng chung kiểu thiết kế của bản Intel, chiếc máy này có phong cách bố trí cổng kết nối rất tối ưu.‌ ‌Máy‌ ‌có‌ ‌3‌ ‌cổng‌ ‌USB‌ ‌Type‌ ‌A‌ ‌3.1‌ ‌Gen‌ ‌1,‌ ‌1 cổng USB Type C 3.1‌ ‌Gen‌ ‌2‌ hỗ trợ xuất hình,‌ 1‌ ‌cổng‌ ‌RJ-45,‌ ‌1‌ ‌cổng‌ ‌HDMI‌ ‌2.0a, 1 jack‌ ‌cắm‌ ‌tai‌ ‌nghe‌ ‌3.5mm,‌ ‌và‌ ‌một‌ ‌cổng‌ ‌mini‌ ‌DisplayPort.‌ ‌
<br/>
HP‌ ‌Omen‌ ‌15‌ ‌2020‌ – Laptop gaming cao cấp mạnh mẽ nhất?
<br/>

<br/><img src="/images/pictures/hp_omen_2020_pic_5.JPG" alt="HP OMEN 15 2020"><br/>
HP Omen 15 2020 là một chiếc máy vô cùng sáng giá với một thiết kế đơn giản nhưng đẹp mắt, một mức giá hợp lý và một cấu hình cực kỳ mạnh mẽ. Quả không sai khi nói rằng đây là chiếc máy có sức hút tuyệt vời đối với cộng đồng đam mê công nghệ nói chung và cộng đồng người dùng laptop gaming nói riêng.', N'Core i7 - 10750H', N'8GB DDR4 Bus 3200MHz', N'SSD 256GB NVMe + 1TB', N'NVIDIA GTX 1660Ti  6GB', N'15.6 inch FHD IPS 60Hz', N'HD 720P', N'1USB-C with Thunderbolt 3, USB-A, HDMI', N'2.46 kg bao gồm sạc', N'6 Cells 70.9Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/hp_omen_2020_pic_1.JPG', CAST(N'2022-04-08 17:07:00.377' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (45, N'HP OMEN 15 2020', 1009, CAST(33000000 AS Decimal(18, 0)), 10, CAST(29700000 AS Decimal(18, 0)), N'[Mới 100%] HP OMEN 15 2020 (AMD Ryzen 7 - 4800H, 16GB, 512GB, VGA 6GB GTX 1660Ti, 15.6 FHD 144Hz)
', N'Là một laptop gaming,‌ ‌chiếc‌ ‌máy‌ ‌hướng‌ ‌tới‌ ‌đối‌ ‌tượng‌ ‌người‌ ‌dùng‌ ‌chơi‌ ‌game‌ ‌bán‌ ‌chuyên,‌ ‌cũng‌ ‌như‌ ‌những‌ ‌đối‌ ‌tượng‌ ‌thiết‌ ‌kế‌ ‌đồ‌ ‌họa‌ ‌với‌ ‌chi‌ ‌phí‌ ‌vừa‌ ‌phải.‌ ‌
<br/>
Laptop‌ gaming ‌với ‌thiết ‌kế ‌đơn ‌giản‌
<br/>
HP‌ đã ‌quyết ‌định ‌thay ‌đổi ‌hoàn‌ ‌toàn‌ ‌thiết‌ ‌kế‌ ‌cho‌ ‌dòng‌ ‌laptop‌ ‌gaming‌ ‌OMEN‌ ‌của‌ ‌mình,‌ ‌không‌ ‌còn‌ ‌là‌ kiểu‌ ‌thiết‌ ‌kế‌ ‌to‌ ‌nạc‌ ‌hầm‌ ‌hố‌ ‌nữa,‌ ‌giờ‌ ‌đã‌ ‌thanh‌ ‌lịch‌ ‌và‌ ‌đơn‌ ‌giản‌ ‌hơn.‌ ‌Vỏ‌ ‌máy‌ ‌hoàn‌ ‌toàn‌ ‌được‌ ‌làm‌ ‌bằng‌ kim‌ ‌loại‌ ‌với‌ ‌lớp‌ ‌sơn‌ ‌đen‌ ‌mạnh‌ ‌mẽ.‌ ‌Logo‌ ‌“Voodoo”‌ ‌hầm‌ ‌hố,‌ ‌được làm bằng những lớp phản quang cao cấp. ‌Các‌ ‌cạnh‌ ‌viền‌ được‌ ‌làm‌ ‌cân‌ ‌đối,‌ ‌đều‌ ‌đặn‌ ‌hơn,‌ ‌không‌ ‌còn‌ ‌những‌ ‌cạnh‌ ‌vát‌ ‌chéo‌ ‌như‌ ‌thế‌ ‌hệ‌ ‌trước.‌ ‌Viền‌ ‌màn‌ ‌hình‌ ‌cũng‌ được‌ ‌thiết‌ ‌kế‌ ‌mỏng‌ ‌hơn,‌ ‌giảm‌ ‌tối‌ ‌đa‌ ‌kích‌ ‌thước‌ ‌tổng‌ ‌thể.‌ ‌Cụm‌ ‌bản‌ ‌lề‌ ‌nay‌ ‌đã‌ ‌được‌ ‌làm‌ ‌thấp‌ ‌xuống,‌ ‌không‌ ‌còn‌ ‌để‌ ‌cao‌ ‌như‌ ‌thế‌ ‌hệ‌ ‌trước,‌ ‌nhằm‌ ‌tránh‌ ‌những‌ ‌rủi‌ ‌ro‌ ‌không‌ ‌đáng‌ ‌có.‌
<br/>
Màn‌ ‌hình‌ ‌tối ưu cho game thủ‌
<br/>
<br/><img src="/images/pictures/hp_omen_2020_r7_pic_1.JPG" alt="HP OMEN 15 2020"><br/>
<br/>
HP Omen 15 2020 phiên bản AMD‌ ‌được‌ ‌trang‌ ‌bị‌ ‌màn‌ ‌hình‌ ‌Full‌ ‌HD‌ ‌IPS‌ ‌có‌ ‌tần‌ ‌số‌ ‌quét‌ ‌cao,‌ ‌144Hz,‌ ‌với‌ ‌độ‌ ‌phủ‌ ‌màu‌ ‌màn‌ ‌hình‌ ‌tốt, ‌100%‌ ‌sRGB.‌ Đây là màn hình vô cùng thích hợp cho việc vừa thực hiện các công việc đồ hoạ, vừa dùng để gaming. Có vẻ như HP cũng đang dần đi theo xu hướng phổ cập màn hình tần số quét cao giống như các hãng laptop khác tới cho người dùng, nhằm mang lại trải nghiệm tuyệt vời, phù hợp mọi nhu cầu công việc.
<br/>
Dự kiến máy sẽ có thêm tuỳ chọn màn hình 300Hz, nhưng HP chưa công bố cụ thể.
<br/>
Hiệu‌ năng vượt sức tưởng tượng‌
<br/>
<br/><img src="/images/pictures/hp_omen_2020_r7_pic_2.JPG" alt="HP OMEN 15 2020"><br/>
<br/>
Máy sử dụng dòng chip AMD Ryen 4000 cho hiệu năng đột phá hoàn toàn. Với hai lựa chọn Ryzen 5 4600H và Ryzen 7 4800H, HP Omen 15 không chỉ chơi mượt những tựa game yêu cầu cấu hình cao, mà còn chạy mượt cả các tác vụ đồ hoạ, hay render nặng hiện nay.
<br/>
Bên cạnh hệ thống vi xử lý mạnh mẽ, là hệ thống card đồ hoạ hiệu năng cao. Máy được trang bị hai phiên bản card đồ hoạ rời là GTX 1660Ti và RTX 2060, với sức mạnh vượt trội. Tuy nhiên, máy không được trang bị các tuỳ chọn card đồ hoạ rời cao hơn như phiên bản Intel.
<br/>
Bàn‌ ‌phím‌ ‌và‌ ‌Touchpad‌‌
<br/>
<br/><img src="/images/pictures/hp_omen_2020_r7_pic_3.JPG" alt="HP OMEN 15 2020"><br/>
<br/>
Bàn‌ ‌phím‌ ‌của‌ ‌OMEN‌ ‌15‌ ‌đã‌ ‌được‌ ‌thiết‌ ‌kế‌ ‌lại,‌ ‌với‌ ‌bố‌ ‌trí‌ ‌các‌ ‌phím‌ ‌rộng‌ ‌hơn,‌ ‌tối‌ ‌ưu‌ ‌hóa‌ ‌trải‌ ‌nghiệm‌ gaming.‌ ‌Hệ‌ ‌thống‌ ‌ký‌ ‌tự‌ ‌được‌ ‌thiết‌ ‌kế‌ ‌lại,‌ ‌trông‌ ‌góc‌ ‌cạnh‌ ‌và‌ ‌hầm‌ ‌hố‌ ‌hơn.‌ ‌Chiếc‌ ‌máy‌ ‌đã‌ ‌lược‌ ‌bỏ‌ ‌hệ‌ ‌thống‌ phím‌ ‌số‌ ‌đi‌ ‌so‌ ‌với‌ ‌phiên‌ ‌bản‌ ‌trước.‌ ‌Keycaps‌ ‌được‌ ‌làm‌ ‌phẳng,‌ ‌tuy‌ ‌nhiên‌ ‌hành‌ ‌trình‌ ‌sâu,‌ ‌phản‌ ‌hồi‌ ‌tốt.‌ ‌Hệ‌ thống‌ ‌LED‌ ‌RGB‌ ‌sáng‌ ‌đều,‌ ‌không‌ ‌quá‌ ‌chói.‌
<br/>
‌Touchpad‌ ‌chiếc‌ ‌máy‌ ‌được‌ ‌phủ‌ ‌lớp‌ ‌nhựa‌ ‌nhám,‌ ‌tuy‌ ‌nhiên‌ ‌di‌ chuyển‌ ‌nhạy,‌ ‌cử‌ ‌chỉ‌ ‌phản‌ ‌hồi‌ ‌tốt‌ ‌nhờ‌ ‌Windows‌ ‌Precision‌ ‌Driver.‌ ‌Thay‌ ‌vì‌ ‌tách‌ ‌rời‌ ‌hai‌ ‌nút‌ ‌chuột‌ ‌như‌ ‌phiên‌ bản‌ ‌trước‌ ‌đó,‌ ‌OMEN‌ ‌15‌ ‌2020‌ ‌lại‌ ‌tích‌ ‌hợp‌ ‌vào,‌ ‌tăng‌ ‌tối‌ ‌đa‌ ‌diện‌ ‌tích‌ ‌cho‌ ‌bàn‌ ‌rê.‌
<br/>
Khả năng kết nối ngoại vi vượt trội‌
<br/>
<br/><img src="/images/pictures/hp_omen_2020_r7_pic_4.JPG" alt="HP OMEN 15 2020"><br/>
<br/>
Do sử dụng chung kiểu thiết kế của bản Intel, chiếc máy này có phong cách bố trí cổng kết nối rất tối ưu.‌ ‌Máy‌ ‌có‌ ‌3‌ ‌cổng‌ ‌USB‌ ‌Type‌ ‌A‌ ‌3.1‌ ‌Gen‌ ‌1,‌ ‌1 cổng USB Type C 3.1‌ ‌Gen‌ ‌2‌ hỗ trợ xuất hình,‌ 1‌ ‌cổng‌ ‌RJ-45,‌ ‌1‌ ‌cổng‌ ‌HDMI‌ ‌2.0a, 1 jack‌ ‌cắm‌ ‌tai‌ ‌nghe‌ ‌3.5mm,‌ ‌và‌ ‌một‌ ‌cổng‌ ‌mini‌ ‌DisplayPort.‌ ‌
<br/>
HP‌ ‌Omen‌ ‌15‌ ‌2020‌ – Laptop gaming cao cấp mạnh mẽ nhất?
<br/><img src="/images/pictures/hp_omen_2020_r7_pic_5.JPG" alt="HP OMEN 15 2020"><br/>', N'AMD Ryzen 7 - 4800H', N'16GB DDR4 Bus 3200MHz', N'SSD 512GB NVMe', N'NVIDIA GTX 1660Ti  6GB', N'15.6 inch FHD IPS 144Hz 94% sRGB', N'HD 720P', N'HDMI, USB 3.0, USB 2.0, LAN,  Bluetooth 4.0.', N'2.1 kg', N'6 Cells 70.9Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/hp_omen_2020_r7_pic_1.JPG', CAST(N'2022-04-08 17:15:18.330' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (46, N'HP Pavilion Gaming 15', 1009, CAST(22000000 AS Decimal(18, 0)), 15, CAST(18700000 AS Decimal(18, 0)), N'[Mới 100%] Laptop HP Pavilion Gaming 15 - Ryzen 5 4600H, 8GB, 256GB, GTX 1650, 15.6 inch FHD
', N'Laptop HP Pavilion 15 DK0056nr là dòng laptop gaming cao cấp mới được HP đầu tư vào phân khúc giá tầm trung. Laptop HP Pavilion 15 DK0056nr được thiết kế hầm hố, lớp vỏ máy và thân máy được thiết kế bằng chất liệu composite chống trầy xước và công nghệ chống bám vân tay, luôn giữ cho máy trông như mới.
<br/>
Laptop HP Pavilion 15 được tích hợp vi xử lý Ryzen 5 - 4600H xung nhịp upto 4.0Ghz 4 nhân 8 luồng cache 8Mb mạnh mẽ, kết hợp cùng RAM 8GB DDR4 bus 2666Ghz (nâng cấp tối đa được 32GB), ổ cứng SSD 256GB, card đồ họa NVIDIA GTX 1650, đáp ứng tốt như cầu công việc, học tập, giải trí của bạn.
<br/>
Laptop HP Pavilion 15 được bán tại LaptopAZ.vn với hình thức mới 100%. Với chế độ bảo hành dài hạn 12 tháng và đổi trả trong vòng 15 ngày bạn hoàn toàn có thể yên tâm lựa chọn sản phẩm và dịch vụ của chúng tôi.
<br/>
<br/>

Thiết kế Laptop HP Pavilion 15
<br/>
 Thiết kế đẹp mắt với mặt trước có gắn logo HP với viền tròn màu xanh. Mặt giữa bản lề cũng xuất hiện dòng chữ Pavilion màu xanh không thể lẫn đi đâu được. Các góc viền của máy được bo viền lại tạo cảm giác thon gọn cho chiếc máy. Toàn máy được bao phủ bởi một màu đen.



<br/>
Pavilion có nhiều nét cho sự mạnh mẽ cả về kiểu dáng bên ngoài lẫn sức mạnh phần cứng nội tại. Sự thay đổi dễ nhận thấy của 5 là sử dụng tông đen phối cùng hoa văn xanh như một điểm nhấn trong thiết kế. Nắp lưng máy với logo đặc trưng của HP và chân đế cao su cỡ lớn cũng được cách điệu hình chữ X, có tác dụng chống trượt và hấp thụ chấn động tốt hơn.

<br/>

Tản nhiệt
<br/>
Hệ thống tản nhiệt Laptop HP Pavilion 15 cũng là điểm cộng của sản phẩm khi có đến 2 quạt làm mát, kết hợp cùng heatpipe cỡ lớn giúp việc dẫn nhiệt từ bộ xử lý và chip đồ họa ra bộ phận tản nhiệt nhanh hơn. Theo thiết kế, luồng không khí được lấy vào qua các khe lưới ở mặt dưới máy, sau khi làm mát linh kiện phần cứng bên trong sẽ đẩy ra ngoài qua các khe thoát gió ở mặt sau. Điều này mang lại sự thoải mái hơn cho người dùng so với thiết kế tản nhiệt cũ.



<br/>
 

Cổng kết nối
<br/>
Laptop HP Pavilion 15 đã trang bị cho Pavilion 15 một lựa chọn cơ bản về các cổng cần đủ cho hầu hết người dùng. Mặc dù việc bao gồm một cổng USB Type-C phần nào chứng minh tương lai cho sản phẩm. Thiết bị thiếu cảm biến vân tay nhưng không sao máy vẫn có nhận diện khuôn mặt mà. Phía trái của máy được trang bị 2 cổng USB ở phía trên tạo cho không gian phía giữa thoáng hơn đẹp mắt hơn. Phía dưới cùng của bên trái là một khe thẻ SD được trang bị. Phía phải được trang bị 1 cổng mạng lan, 1 cổng HDMI cho trình xuất chiếu thứ 2. 1 cổng USB 1 cổng Type C và một Jack aduio.



<br/>
TouchPad Laptop HP Pavilion 15
<br/>
Về touchpad đáp ứng tốt thao tác người dùng, kích thước lớn và cảm giác trơn mịn do độ ma sát thấp giúp trỏ chuột di chuyển chính xác, các chức năng cuộn, phóng to và xoay ảnh cũng dễ thực hiện hơn. Hai phím chức năng chuột tích hợp mang lại sự liền mạch trong tổng thể sản phẩm.
<br/>
Khác với laptop phổ thông, touchpad Laptop HP Pavilion 15 vốn được dùng cho việc “chỉ trỏ” khi làm việc hoặc học tập vì chúng cũng không đạt được độ tin cậy cần thiết cũng như khả năng dễ điều khiển khi chơi game, nhất là trong thể loại FPS - game bắn súng góc nhìn thứ nhất. Với game thủ thì một chú chuột laser luôn là lựa chọn tốt cho nhu cầu giải trí di động
<br/>

Màn hình Laptop HP Pavilion 15
<br/>
Hp Pavilion 15 trang bị màn hình 15.6 Inch Full HD cho hình ảnh nhìn sắc nét hơn. Còn nữa màn hình còn trang bị tấm nền IPS cho góc nhìn rộng, mọi hướng nhìn không làm cho màn hình có điểm chết. Đối với ánh sáng mặt trời thì màn hình vẫn có thể nhìn nhưng không tốt bằng khi làm việc với màn hình ánh sáng ít hơn. 


<br/>

Độ chuẩn màu của HP Pavilion  hiển thị khoảng 97% dải màu tiêu chuẩn sRGB. Độ rộng dải màu, độ tương phản, mức độ sáng tối cũng như sắc xám và trắng hiển thị trên màn hình cũng dễ phân biệt rõ ràng. Việc tùy chỉnh độ sáng màn hình linh hoạt nên không gây cảm giác mỏi mắt khi làm việc trong thời gian dài với các tập tin văn bản và bảng biểu trong bộ ứng dụng văn phòng như Word, Excel


<br/>
Bàn phím Laptop HP Pavilion 15
<br/>
Bàn phím Pavilion vẫn giữ thiết kế truyền thống, kích thước full size và được chia thành hai phần rõ rệt gồm nhóm phím cơ bản (qwerty) bên trái và nhóm phím số bên phải, tiện dụng hơn khi bạn chia sẻ, cùng bạn bè chơi game trên máy tính hoặc dùng trong những công việc khác liên quan đến thống kê, nhập số liệu.
<br/>
Sử dụng thực tế cho thấy cảm giác phím Laptop HP Pavilion 15 khá tốt, thao tác thoải mái với phím nhấn êm với quãng di chuyển ngắn, khoảng cách giữa các phím hợp lý nên phù hợp cả người dùng có cỡ tay lớn, LED nền tích hợp giúp dễ dàng định vị những phím cần thiết trong môi trường thiếu sáng. Xét về độ nhạy phím nhấn chưa thật tốt nhưng vẫn đủ để lướt nhanh trên bàn phím khi gõ văn bản. Ngoài ra, mẫu laptop của HP cũng không cho phép điều chỉnh độ sáng đèn nền bàn phím, chỉ có hai tùy chọn là mở hoặc tắt.

<br/>

Hiệu Suất
<br/>

Xét tổng thể, sức mạnh của đồ họa GTX 1650 đủ giúp game thủ có sự trải nghiệm hấp dẫn với hiệu ứng đồ họa đẹp mắt, cảm nhận được tiếng gầm rú của động cơ xe, tiếng lạo xạo của đá sỏi bị nghiến dưới bánh xe khi ôm cua theo những cung đường bụi bặm của DiRT 3.
<br/>

Tất nhiên giới hạn của GTX 1650 là chỉ đáp ứng nhu cầu chơi game ở độ phân giải 1080p với đồ họa chất lượng cao, với việc Laptop HP Pavilion 15 trang bị đến 4GB GDDR5, Pavilion có ưu thế bộ nhớ đồ họa trong các game, ứng dụng đồ họa nặng cần nhiều bộ nhớ hơn so với thông thường.


<br/>

Thời lượng Pin Laptop HP Pavilion 15
<br/>

Về thời gian dùng pin cấu hình máy chế độ High Performance và độ sáng màn hình giảm còn 40% (tương đương chế độ dùng pin), thời lượng pin của máy đạt khoảng 3 giờ liên tục khi chạy các tác vụ duyệt web, nhập dữ liệu, chỉnh sửa hình ảnh, video chat và cả chơi game giải trí nhằm đưa ra kết quả gần đúng với thực tế của người dùng nhất.', N'AMD Ryzen 5 - 4600H', N'8GB DDR4', N'SSD 256GB', N'GTX 1650', N'15.6 FHD', N'HD 720P', N'HDMI, USB 3.0, USB 2.0, LAN,  Bluetooth 4.0.', N'2.35kg', N'3 Cells', N'Windows 10 bản quyền', 0, N'/images/pictures/hp_omen_2020_pic_1.JPG', CAST(N'2022-04-08 17:25:36.893' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (47, N'HP OMEN 15 2019', 1009, CAST(25000000 AS Decimal(18, 0)), 16, CAST(21000000 AS Decimal(18, 0)), N'[Mới 99%] HP OMEN 15 2019 (Core i7-9750H, 16GB, 256GB, VGA 6GB GTX 1660Ti, 15.6 FHD IPS 144Hz)', N'Là một laptop gaming,‌ ‌chiếc‌ ‌máy‌ ‌hướng‌ ‌tới‌ ‌đối‌ ‌tượng‌ ‌người‌ ‌dùng‌ ‌chơi‌ ‌game‌ ‌bán‌ ‌chuyên,‌ ‌cũng‌ ‌như‌ ‌những‌ ‌đối‌ ‌tượng‌ ‌thiết‌ ‌kế‌ ‌đồ‌ ‌họa‌ ‌với‌ ‌chi‌ ‌phí‌ ‌vừa‌ ‌phải.‌ ‌
<br/>
Laptop‌ gaming ‌với ‌thiết ‌kế ‌đơn ‌giản‌
<br/>
HP‌ đã ‌quyết ‌định ‌thay ‌đổi ‌hoàn‌ ‌toàn‌ ‌thiết‌ ‌kế‌ ‌cho‌ ‌dòng‌ ‌laptop‌ ‌gaming‌ ‌OMEN‌ ‌của‌ ‌mình,‌ ‌không‌ ‌còn‌ ‌là‌ kiểu‌ ‌thiết‌ ‌kế‌ ‌to‌ ‌nạc‌ ‌hầm‌ ‌hố‌ ‌nữa,‌ ‌giờ‌ ‌đã‌ ‌thanh‌ ‌lịch‌ ‌và‌ ‌đơn‌ ‌giản‌ ‌hơn.‌ ‌Vỏ‌ ‌máy‌ ‌hoàn‌ ‌toàn‌ ‌được‌ ‌làm‌ ‌bằng‌ kim‌ ‌loại‌ ‌với‌ ‌lớp‌ ‌sơn‌ ‌đen‌ ‌mạnh‌ ‌mẽ.‌ ‌Logo‌ ‌“Voodoo”‌ ‌hầm‌ ‌hố,‌ ‌được làm bằng những lớp phản quang cao cấp. ‌Các‌ ‌cạnh‌ ‌viền‌ được‌ ‌làm‌ ‌cân‌ ‌đối,‌ ‌đều‌ ‌đặn‌ ‌hơn,‌ ‌không‌ ‌còn‌ ‌những‌ ‌cạnh‌ ‌vát‌ ‌chéo‌ ‌như‌ ‌thế‌ ‌hệ‌ ‌trước.‌ ‌Viền‌ ‌màn‌ ‌hình‌ ‌cũng‌ được‌ ‌thiết‌ ‌kế‌ ‌mỏng‌ ‌hơn,‌ ‌giảm‌ ‌tối‌ ‌đa‌ ‌kích‌ ‌thước‌ ‌tổng‌ ‌thể.‌ ‌Cụm‌ ‌bản‌ ‌lề‌ ‌nay‌ ‌đã‌ ‌được‌ ‌làm‌ ‌thấp‌ ‌xuống,‌ ‌không‌ ‌còn‌ ‌để‌ ‌cao‌ ‌như‌ ‌thế‌ ‌hệ‌ ‌trước,‌ ‌nhằm‌ ‌tránh‌ ‌những‌ ‌rủi‌ ‌ro‌ ‌không‌ ‌đáng‌ ‌có.‌
<br/>
Màn‌ ‌hình‌ ‌tối ưu cho game thủ‌
<br/>
<br/><img src="/images/pictures/hp_omen_2020_pic_1.JPG" alt="HP OMEN 15 2020"><br/>

HP Omen 15 2019 phiên bản Intel được‌ ‌trang‌ ‌bị‌ ‌màn‌ ‌hình‌ ‌Full‌ ‌HD‌ ‌IPS‌.‌ Đây là màn hình vô cùng thích hợp cho việc vừa thực hiện các công việc đồ hoạ, vừa dùng để gaming.
<br/>
Hiệu‌ năng vượt sức tưởng tượng‌<br/>
<br/><img src="/images/pictures/hp_omen_2020_pic_2.JPG" alt="HP OMEN 15 2020"><br/>

<br/>
Máy sử dụng dòng chip Intel core i7 gen 9th cho hiệu năng đột phá hoàn toàn. HP Omen 15 không chỉ chơi mượt những tựa game yêu cầu cấu hình cao, mà còn chạy mượt cả các tác vụ đồ hoạ, hay render nặng hiện nay.
<br/>
Bên cạnh hệ thống vi xử lý mạnh mẽ, là hệ thống card đồ hoạ hiệu năng cao. Máy được trang bị hai phiên bản card đồ hoạ rời là GTX 1660Ti và RTX 2060, với sức mạnh vượt trội.
<br/>
Bàn‌ ‌phím‌ ‌và‌ ‌Touchpad‌‌
<br/>
<br/><img src="/images/pictures/hp_omen_2020_pic_3.JPG" alt="HP OMEN 15 2020"><br/>
<br/>
Bàn‌ ‌phím‌ ‌của‌ ‌OMEN‌ ‌15‌ ‌đã‌ ‌được‌ ‌thiết‌ ‌kế‌ ‌lại,‌ ‌với‌ ‌bố‌ ‌trí‌ ‌các‌ ‌phím‌ ‌rộng‌ ‌hơn,‌ ‌tối‌ ‌ưu‌ ‌hóa‌ ‌trải‌ ‌nghiệm‌ gaming.‌ ‌Hệ‌ ‌thống‌ ‌ký‌ ‌tự‌ ‌được‌ ‌thiết‌ ‌kế‌ ‌lại,‌ ‌trông‌ ‌góc‌ ‌cạnh‌ ‌và‌ ‌hầm‌ ‌hố‌ ‌hơn.‌ ‌Chiếc‌ ‌máy‌ ‌đã‌ ‌lược‌ ‌bỏ‌ ‌hệ‌ ‌thống‌ phím‌ ‌số‌ ‌đi‌ ‌so‌ ‌với‌ ‌phiên‌ ‌bản‌ ‌trước.‌ ‌Keycaps‌ ‌được‌ ‌làm‌ ‌phẳng,‌ ‌tuy‌ ‌nhiên‌ ‌hành‌ ‌trình‌ ‌sâu,‌ ‌phản‌ ‌hồi‌ ‌tốt.‌ ‌Hệ‌ thống‌ ‌LED‌ ‌RGB‌ ‌sáng‌ ‌đều,‌ ‌không‌ ‌quá‌ ‌chói.‌
<br/>
‌Touchpad‌ ‌chiếc‌ ‌máy‌ ‌được‌ ‌phủ‌ ‌lớp‌ ‌nhựa‌ ‌nhám,‌ ‌tuy‌ ‌nhiên‌ ‌di‌ chuyển‌ ‌nhạy,‌ ‌cử‌ ‌chỉ‌ ‌phản‌ ‌hồi‌ ‌tốt‌ ‌nhờ‌ ‌Windows‌ ‌Precision‌ ‌Driver.‌ ‌Thay‌ ‌vì‌ ‌tách‌ ‌rời‌ ‌hai‌ ‌nút‌ ‌chuột‌ ‌như‌ ‌phiên‌ bản‌ ‌trước‌ ‌đó,‌ ‌OMEN‌ ‌15‌ ‌2019 ‌lại‌ ‌tích‌ ‌hợp‌ ‌vào,‌ ‌tăng‌ ‌tối‌ ‌đa‌ ‌diện‌ ‌tích‌ ‌cho‌ ‌bàn‌ ‌rê.‌
<br/>
Khả năng kết nối ngoại vi vượt trội‌
<br/><img src="/images/pictures/hp_omen_2020_pic_4.JPG" alt="HP OMEN 15 2020"><br/>

<br/>
Do sử dụng chung kiểu thiết kế của bản Intel, chiếc máy này có phong cách bố trí cổng kết nối rất tối ưu.‌ ‌Máy‌ ‌có‌ ‌3‌ ‌cổng‌ ‌USB‌ ‌Type‌ ‌A‌ ‌3.1‌ ‌Gen‌ ‌1,‌ ‌1 cổng USB Type C 3.1‌ ‌Gen‌ ‌2‌ hỗ trợ xuất hình,‌ 1‌ ‌cổng‌ ‌RJ-45,‌ ‌1‌ ‌cổng‌ ‌HDMI‌ ‌2.0a, 1 jack‌ ‌cắm‌ ‌tai‌ ‌nghe‌ ‌3.5mm,‌ ‌và‌ ‌một‌ ‌cổng‌ ‌mini‌ ‌DisplayPort.‌ ‌
<br/>
HP‌ ‌Omen‌ ‌15‌ ‌2019 – Laptop gaming cao cấp mạnh mẽ nhất?
<br/>

<br/><img src="/images/pictures/hp_omen_2020_pic_5.JPG" alt="HP OMEN 15 2020"><br/>
HP Omen 15 2019 là một chiếc máy vô cùng sáng giá với một thiết kế đơn giản nhưng đẹp mắt, một mức giá hợp lý và một cấu hình cực kỳ mạnh mẽ. Quả không sai khi nói rằng đây là chiếc máy có sức hút tuyệt vời đối với cộng đồng đam mê công nghệ nói chung và cộng đồng người dùng laptop gaming nói riêng.', N'Intel® Core™ i7-9750H', N'8GB DDR4 Bus 2666MHz', N'SSD 256GB', N'NVIDIA GTX 1660Ti 6GB', N'15.6 Inch FHD IPS', N'HD 720P', N'USB 3.0 và 2.0, LAN, HDMI', N'2.4 kg', N'3 Cells', N'Windows 10 Home SL', 0, N'/images/pictures/hp_omen_2020_pic_3.JPG', CAST(N'2022-04-08 17:29:54.640' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (48, N'HP OMEN 15 2020', 1009, CAST(28000000 AS Decimal(18, 0)), 12, CAST(24640000 AS Decimal(18, 0)), N'[Mới 199%] HP OMEN 15 2020 (AMD Ryzen 7 - 4800H, 16GB, 1TB, VGA 6GB GTX 1660Ti, 15.6 FHD 144Hz)
', N'Là một laptop gaming,‌ ‌chiếc‌ ‌máy‌ ‌hướng‌ ‌tới‌ ‌đối‌ ‌tượng‌ ‌người‌ ‌dùng‌ ‌chơi‌ ‌game‌ ‌bán‌ ‌chuyên,‌ ‌cũng‌ ‌như‌ ‌những‌ ‌đối‌ ‌tượng‌ ‌thiết‌ ‌kế‌ ‌đồ‌ ‌họa‌ ‌với‌ ‌chi‌ ‌phí‌ ‌vừa‌ ‌phải.‌ ‌
<br/>
Laptop‌ gaming ‌với ‌thiết ‌kế ‌đơn ‌giản‌
<br/>
HP‌ đã ‌quyết ‌định ‌thay ‌đổi ‌hoàn‌ ‌toàn‌ ‌thiết‌ ‌kế‌ ‌cho‌ ‌dòng‌ ‌laptop‌ ‌gaming‌ ‌OMEN‌ ‌của‌ ‌mình,‌ ‌không‌ ‌còn‌ ‌là‌ kiểu‌ ‌thiết‌ ‌kế‌ ‌to‌ ‌nạc‌ ‌hầm‌ ‌hố‌ ‌nữa,‌ ‌giờ‌ ‌đã‌ ‌thanh‌ ‌lịch‌ ‌và‌ ‌đơn‌ ‌giản‌ ‌hơn.‌ ‌Vỏ‌ ‌máy‌ ‌hoàn‌ ‌toàn‌ ‌được‌ ‌làm‌ ‌bằng‌ kim‌ ‌loại‌ ‌với‌ ‌lớp‌ ‌sơn‌ ‌đen‌ ‌mạnh‌ ‌mẽ.‌ ‌Logo‌ ‌“Voodoo”‌ ‌hầm‌ ‌hố,‌ ‌được làm bằng những lớp phản quang cao cấp. ‌Các‌ ‌cạnh‌ ‌viền‌ được‌ ‌làm‌ ‌cân‌ ‌đối,‌ ‌đều‌ ‌đặn‌ ‌hơn,‌ ‌không‌ ‌còn‌ ‌những‌ ‌cạnh‌ ‌vát‌ ‌chéo‌ ‌như‌ ‌thế‌ ‌hệ‌ ‌trước.‌ ‌Viền‌ ‌màn‌ ‌hình‌ ‌cũng‌ được‌ ‌thiết‌ ‌kế‌ ‌mỏng‌ ‌hơn,‌ ‌giảm‌ ‌tối‌ ‌đa‌ ‌kích‌ ‌thước‌ ‌tổng‌ ‌thể.‌ ‌Cụm‌ ‌bản‌ ‌lề‌ ‌nay‌ ‌đã‌ ‌được‌ ‌làm‌ ‌thấp‌ ‌xuống,‌ ‌không‌ ‌còn‌ ‌để‌ ‌cao‌ ‌như‌ ‌thế‌ ‌hệ‌ ‌trước,‌ ‌nhằm‌ ‌tránh‌ ‌những‌ ‌rủi‌ ‌ro‌ ‌không‌ ‌đáng‌ ‌có.‌
<br/>
Màn‌ ‌hình‌ ‌tối ưu cho game thủ‌
<br/>
<br/><img src="/images/pictures/hp_omen_2020_r7_pic_1.JPG" alt="HP OMEN 15 2020"><br/>
<br/>
HP Omen 15 2020 phiên bản AMD‌ ‌được‌ ‌trang‌ ‌bị‌ ‌màn‌ ‌hình‌ ‌Full‌ ‌HD‌ ‌IPS‌ ‌có‌ ‌tần‌ ‌số‌ ‌quét‌ ‌cao,‌ ‌144Hz,‌ ‌với‌ ‌độ‌ ‌phủ‌ ‌màu‌ ‌màn‌ ‌hình‌ ‌tốt, ‌100%‌ ‌sRGB.‌ Đây là màn hình vô cùng thích hợp cho việc vừa thực hiện các công việc đồ hoạ, vừa dùng để gaming. Có vẻ như HP cũng đang dần đi theo xu hướng phổ cập màn hình tần số quét cao giống như các hãng laptop khác tới cho người dùng, nhằm mang lại trải nghiệm tuyệt vời, phù hợp mọi nhu cầu công việc.
<br/>
Dự kiến máy sẽ có thêm tuỳ chọn màn hình 300Hz, nhưng HP chưa công bố cụ thể.
<br/>
Hiệu‌ năng vượt sức tưởng tượng‌
<br/>
<br/><img src="/images/pictures/hp_omen_2020_r7_pic_2.JPG" alt="HP OMEN 15 2020"><br/>
<br/>
Máy sử dụng dòng chip AMD Ryen 4000 cho hiệu năng đột phá hoàn toàn. Với hai lựa chọn Ryzen 5 4600H và Ryzen 7 4800H, HP Omen 15 không chỉ chơi mượt những tựa game yêu cầu cấu hình cao, mà còn chạy mượt cả các tác vụ đồ hoạ, hay render nặng hiện nay.
<br/>
Bên cạnh hệ thống vi xử lý mạnh mẽ, là hệ thống card đồ hoạ hiệu năng cao. Máy được trang bị hai phiên bản card đồ hoạ rời là GTX 1660Ti và RTX 2060, với sức mạnh vượt trội. Tuy nhiên, máy không được trang bị các tuỳ chọn card đồ hoạ rời cao hơn như phiên bản Intel.
<br/>
Bàn‌ ‌phím‌ ‌và‌ ‌Touchpad‌‌
<br/>
<br/><img src="/images/pictures/hp_omen_2020_r7_pic_3.JPG" alt="HP OMEN 15 2020"><br/>
<br/>
Bàn‌ ‌phím‌ ‌của‌ ‌OMEN‌ ‌15‌ ‌đã‌ ‌được‌ ‌thiết‌ ‌kế‌ ‌lại,‌ ‌với‌ ‌bố‌ ‌trí‌ ‌các‌ ‌phím‌ ‌rộng‌ ‌hơn,‌ ‌tối‌ ‌ưu‌ ‌hóa‌ ‌trải‌ ‌nghiệm‌ gaming.‌ ‌Hệ‌ ‌thống‌ ‌ký‌ ‌tự‌ ‌được‌ ‌thiết‌ ‌kế‌ ‌lại,‌ ‌trông‌ ‌góc‌ ‌cạnh‌ ‌và‌ ‌hầm‌ ‌hố‌ ‌hơn.‌ ‌Chiếc‌ ‌máy‌ ‌đã‌ ‌lược‌ ‌bỏ‌ ‌hệ‌ ‌thống‌ phím‌ ‌số‌ ‌đi‌ ‌so‌ ‌với‌ ‌phiên‌ ‌bản‌ ‌trước.‌ ‌Keycaps‌ ‌được‌ ‌làm‌ ‌phẳng,‌ ‌tuy‌ ‌nhiên‌ ‌hành‌ ‌trình‌ ‌sâu,‌ ‌phản‌ ‌hồi‌ ‌tốt.‌ ‌Hệ‌ thống‌ ‌LED‌ ‌RGB‌ ‌sáng‌ ‌đều,‌ ‌không‌ ‌quá‌ ‌chói.‌
<br/>
‌Touchpad‌ ‌chiếc‌ ‌máy‌ ‌được‌ ‌phủ‌ ‌lớp‌ ‌nhựa‌ ‌nhám,‌ ‌tuy‌ ‌nhiên‌ ‌di‌ chuyển‌ ‌nhạy,‌ ‌cử‌ ‌chỉ‌ ‌phản‌ ‌hồi‌ ‌tốt‌ ‌nhờ‌ ‌Windows‌ ‌Precision‌ ‌Driver.‌ ‌Thay‌ ‌vì‌ ‌tách‌ ‌rời‌ ‌hai‌ ‌nút‌ ‌chuột‌ ‌như‌ ‌phiên‌ bản‌ ‌trước‌ ‌đó,‌ ‌OMEN‌ ‌15‌ ‌2020‌ ‌lại‌ ‌tích‌ ‌hợp‌ ‌vào,‌ ‌tăng‌ ‌tối‌ ‌đa‌ ‌diện‌ ‌tích‌ ‌cho‌ ‌bàn‌ ‌rê.‌
<br/>
Khả năng kết nối ngoại vi vượt trội‌
<br/>
<br/><img src="/images/pictures/hp_omen_2020_r7_pic_4.JPG" alt="HP OMEN 15 2020"><br/>
<br/>
Do sử dụng chung kiểu thiết kế của bản Intel, chiếc máy này có phong cách bố trí cổng kết nối rất tối ưu.‌ ‌Máy‌ ‌có‌ ‌3‌ ‌cổng‌ ‌USB‌ ‌Type‌ ‌A‌ ‌3.1‌ ‌Gen‌ ‌1,‌ ‌1 cổng USB Type C 3.1‌ ‌Gen‌ ‌2‌ hỗ trợ xuất hình,‌ 1‌ ‌cổng‌ ‌RJ-45,‌ ‌1‌ ‌cổng‌ ‌HDMI‌ ‌2.0a, 1 jack‌ ‌cắm‌ ‌tai‌ ‌nghe‌ ‌3.5mm,‌ ‌và‌ ‌một‌ ‌cổng‌ ‌mini‌ ‌DisplayPort.‌ ‌
<br/>
HP‌ ‌Omen‌ ‌15‌ ‌2020‌ – Laptop gaming cao cấp mạnh mẽ nhất?
<br/><img src="/images/pictures/hp_omen_2020_r7_pic_5.JPG" alt="HP OMEN 15 2020"><br/>', N'AMD Ryzen 7 - 4800H', N'16GB DDR4 Bus 3200MHz', N'SSD 1TB NVMe', N'NVIDIA GTX 1660Ti  6GB', N'15.6 inch FHD IPS 144Hz 94% sRGB', N'HD 720P', N'HDMI, USB 3.0, USB 2.0, LAN,  Bluetooth 4.0.', N'2.1 kg', N'6 Cells 70.9Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/hp_omen_2020_r7_pic_5.JPG', CAST(N'2022-04-08 17:33:20.817' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (49, N'Asus TUF Gaming A15 FA506IHR-HN019W', 1011, CAST(22000000 AS Decimal(18, 0)), 10, CAST(19800000 AS Decimal(18, 0)), N'[Mới 100%] Asus TUF Gaming A15 FA506IHR-HN019W (Ryzen 5-4600H, 8GB, 512GB, GTX 1650, 15.6″ FHD IPS 144Hz)
', N'<p>Asus TUF Gaming A15 FA506IHR- Sức mạnh vượt trội, chiến mọi tựa game.</p>
<p>Asus TUF A15 FA506IHR-HN019W kho&aacute;c l&ecirc;n m&igrave;nh bộ &aacute;o gi&aacute;p của TUF thể hiện sức mạnh vượt trội. TUF A15 &nbsp;đem đến cho người d&ugrave;ng hiệu suất kinh ngạc, chiến được mọi tựa game đồ họa cao trong khi gi&aacute; b&aacute;n chưa tới 20 triệu đồng.</p>
<p><img src="https://lh6.googleusercontent.com/AI_E2OGRtpMYR1QhfrzrqDSUd0EzZPdRYh6LoGcqvRxsfk976UeTtqD4JPL5WbRfX39mgOCS61qkDkTjQnRzFie5RuOVY1Ss0xF70F_JL9aZn8PK4ifJ7LpK2y7PxJxwM26fHaWG" width="602" height="339"></p>
<p>Asus kh&ocirc;ng chỉ nổi tiếng với d&ograve;ng laptop gaming ROG hầm hố v&agrave; đậm chất ri&ecirc;ng, h&atilde;ng c&ograve;n c&oacute; một d&ograve;ng sản phẩm kh&aacute;c cũng nổi tiếng kh&ocirc;ng k&eacute;m l&agrave; TUF c&oacute; thể l&agrave;m h&agrave;i l&ograve;ng những kh&aacute;ch h&agrave;ng kh&oacute; t&iacute;nh nhất.</p>
<p>Thiết kế:</p>
<p>Asus TUF A15 FA506IHR-HN019W&nbsp;mang đến cho người d&ugrave;ng diện mạo mạnh mẽ, c&aacute; t&iacute;nh, đậm chất gaming. Với tone m&agrave;u Eclipse Gray c&ugrave;ng logo độc đ&aacute;o mang t&iacute;nh biểu tượng của TUF chiếc m&aacute;y c&oacute; thể thu h&uacute;t mọi &aacute;nh nh&igrave;n xung quanh.</p>
<p><img src="https://lh4.googleusercontent.com/WIbttxsoakEkaQCtl6wXVjPXdbtXXE5gjxHF64RGHmEzqDtDsiUH7YK_pKV1mogyOQ0SzpcsDBQU9Vt78I_HtaWE0zYSaRk-SqOjIOCmnBw1Vlwp1XEPQuDbBuXhKYJ_6-Qq7XVq" width="602" height="368"></p>
<p>Đế m&aacute;y được chế t&aacute;c với c&aacute;c chi tiết h&igrave;nh lục gi&aacute;c gi&uacute;p tăng độ b&aacute;m cho m&aacute;y cũng như gia tăng sự bền bỉ, chắc chắn cho khung m&aacute;y để bảo vệ tốt cho c&aacute;c linh kiện b&ecirc;n trong khi gặp phải c&aacute;c sự cố va đập. Với c&aacute;c họa tiết kẻ sọc thanh mảnh cho phần chiếu nghỉ tay mang lại t&iacute;nh thẩm mỹ, đồng thời gi&uacute;p loại bỏ t&igrave;nh trạng b&aacute;m v&acirc;n tay.</p>
<p><img src="https://lh5.googleusercontent.com/clYGcRKP6OK0dzy46Ci93BuV1NpKD5eHpujUnSu4OlxvR4ii2x3SMV7gRO9D4QqBgy27OgaL96-v2A7gT1YYlS3mXA7ScyuNRpDWUqe4XgUSDwl61Y5GS2bIex5RJHmf5IWtRhu_" width="602" height="401"></p>
<p>B&agrave;n ph&iacute;m được trang bị Led RGB 1 v&ugrave;ng v&agrave; đồng bộ cho ph&eacute;p bạn được thỏa sức s&aacute;ng tạo với những m&agrave;n tr&igrave;nh diễn m&agrave;u sắc v&agrave; c&aacute;c chế độ y&ecirc;u th&iacute;ch. Touchpad cảm ứng đa điểm của m&aacute;y &ecirc;m v&agrave; mịn mang đến trải nghiệm lướt chuột v&ocirc; c&ugrave;ng thoải m&aacute;i v&agrave; ch&iacute;nh x&aacute;c.</p>
<p>M&agrave;n h&igrave;nh:</p>
<ul>
    <li>
        <p>15.6&rdquo; FHD 144Hz&nbsp;</p>
    </li>
    <li>
        <p>65% sRGB&nbsp;</p>
    </li>
    <li>
        <p>48% aRGB&nbsp;</p>
    </li>
    <li>
        <p>312 nits</p>
    </li>
    <li>
        <p>2,67 DeltaE</p>
    </li>
    <li>
        <p>Độ tương phản: 1290:1</p>
    </li>
</ul>
<p><img src="https://lh4.googleusercontent.com/M3uH-ztPdtyUvQ9gbhCmxGDMyj9ZHUCyFccPdOCnEXjra3J33KWZZ-kc0xSKuq-rLXcFzTIOClUqGw4R4V9UXCsIY8Pi-tYeZFWzAan3rGf403EJddL6GjjJWVSSPl6c4M3E1bhh" width="602" height="401"></p>
<p>M&agrave;n h&igrave;nh được trang bị tấm nền IPS đem lại độ s&aacute;ng, độ tương phản cao v&agrave; ch&iacute;nh x&aacute;c cũng như khả năng t&aacute;i tạo m&agrave;u sắc trung thực hơn. Với tần số qu&eacute;t 144Hz, chiếc m&aacute;y n&agrave;y thực sự ho&agrave;n hảo cho những game nhịp độ nhanh, c&ugrave;ng với AdaptiveSync - tần số qu&eacute;t sẽ được đồng bộ với tốc độ khung h&igrave;nh của GPU loại bỏ hầu hết c&aacute;c hiện tượng x&eacute; h&igrave;nh hay giật h&igrave;nh.</p>
<p>Cổng kết nối:&nbsp;</p>
<ul>
    <li>
        <p>1 cổng nguồn</p>
    </li>
    <li>
        <p>1 cổng RJ45&nbsp;</p>
    </li>
    <li>
        <p>1 cổng HDMI&nbsp;</p>
    </li>
    <li>
        <p>3 cổng USB Type A</p>
    </li>
    <li>
        <p>1 cổng USB Type C</p>
    </li>
    <li>
        <p>1 cổng Jack 3.5mm</p>
    </li>
</ul>
<p><img src="https://lh5.googleusercontent.com/leegjsxNBTP_IavTQj5wytlYxyWs0pzHMCeAuzPGqNAFgGeviNd-R17tEXDLoZ9bfRkAmhzo2QPyA2PVW29Dkzi34V2HqSiixw15ih5Snqcjflw253kasesVQwDjNH1lRy2odSwk" width="602" height="424"></p>
<p><img src="https://lh4.googleusercontent.com/KuYDEv75VOHNKbbWY178QOZw3Jh0wfQYw8gOFRsI5qCAC0yZEGTSAH3seOodlwCUljIdMR4ufN54tyZMQBUUxZsQve6SGX6mTPyNG1TLR5Om_V4FICO5efWLFk3tt6FRJy9tUvS9" width="602" height="339"></p>
<p>Hiệu năng:&nbsp;</p>
<ul>
    <li>
        <p>CPU: Ryzen 5 -4600H (6 nh&acirc;n, 12 luồng)</p>
    </li>
    <li>
        <p>GPU: GTX1650 (4GB)&nbsp;</p>
    </li>
    <li>
        <p>RAM: 8GB-Single channel</p>
    </li>
    <li>
        <p>SSD: 512GB NVMe</p>
    </li>
    <li>
        <p>MUX: Kh&ocirc;ng</p>
    </li>
</ul>
<p>Khi LaptopAZ test hiệu năng tr&ecirc;n tựa game Li&ecirc;n Minh, CSGO cho ra kết quả l&agrave; FPS giao động từ 80-120 FPS, t&iacute;nh ổn định của FPS được duy tr&igrave;.</p>
<p><img src="https://lh6.googleusercontent.com/2xme9g5BFYSlVnlMGL575IE2Lm4kxDmc595x8S8j8_gxMTzqyNUrdFKRFneRlYOQUk1PAjCzlQFlbVd-wMYaVpzMKSIfbM9oFZAnP_YJp_T1WbNvHzF9FGtVlZFbjHeL_xa2PF9M" width="602" height="401"></p>
<p>Video game test của LaptopAZ:</p>
<p>Khả năng n&acirc;ng cấp:&nbsp;</p>
<ul>
    <li>
        <p>2 khe RAM chờ tối đa 64GB&nbsp;</p>
    </li>
    <li>
        <p>2 khe M.2 NVMe</p>
    </li>
</ul>
<p><img src="https://lh3.googleusercontent.com/EHi26OzQcrPoIi1IdE9NapHIvuF3liUZ3dEm2JSBa8UrtKp2EhUvW5uSwzSsCzjRPARuOFiUQdQ5rlF8154KgZNZL6MJsCAG6ZD5wLbHP5vu8YZ4YYQWbQpBtMag8mwYypGmE4Gy" width="602" height="291"></p>
<p>Tổng kết: Với một thiết kế c&aacute; t&iacute;nh, hệ thống tản nhiệt m&aacute;t mẻ, cấu h&igrave;nh ổn định trong tầm gi&aacute;, m&agrave;n h&igrave;nh 144Hz. V&agrave; đặc biệt, ch&uacute;ng ta c&oacute; thể n&acirc;ng cấp th&ecirc;m 2 khe RAM chờ tối đa 64GB. LaptopAZ đ&aacute;nh gi&aacute; đ&acirc;y l&agrave; một phi&ecirc;n bản laptop gaming kh&aacute; tốt ổn.&nbsp;</p>
<p><br></p>
<p><br></p>', N'Ryzen 5-4600H (6 nhân 12 luồng)', N'8GB DDR4 + 1 khe ram chờ', N'SSD 512GB    + 1 khe M.2 NVMe ', N'NVIDIA GTX 1650 4GB GDDR6', N'15.6 inch FHD 16:9 IPS 144Hz 3ms  62,5% sRGB, 47,34% Adobe, 312 nits', N'HD 720P', N'USB 3.0, USB 3.0, LAN, HDMI', N'2.07 kg', N'4 Cells', N'Windows 11 bản quyền', 0, N'/images/pictures/asus_tuf_a15.JPG', CAST(N'2022-04-08 17:41:13.707' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (50, N'TUF Dash F15 2022 FX517ZC-HN077W', 1011, CAST(32000000 AS Decimal(18, 0)), 15, CAST(27200000 AS Decimal(18, 0)), N'[Mới 100%] Asus TUF Dash F15 2022 FX517ZC-HN077W (Core i5-12450H, 8GB, 512GB, RTX 3050, 15.6″ FHD 144Hz) Off Black
', N'<h2>ASUS TUF Dash F15 FX517ZC-HN077W d&agrave;nh cho ai?</h2>
<p>L&agrave; một chiếc laptop gaming hạng nặng với bộ vi xử l&yacute; Intel i5 Gen 12 mới nhất kết hợp với GPU Nvidia RTX 3050 mới nhất v&agrave; một thiết lập &acirc;m thanh tổng thể tuyệt vời.&nbsp;</p>
<p>Trong thời điểm hiện nay việc t&igrave;m mua được một chiếc card RTX 3000 cho PC cũng kh&aacute; l&agrave; kh&oacute; khăn nhưng <strong>TUF Dash 15 2022</strong> sẽ l&agrave; một lựa chọn ho&agrave;n hảo. C&ugrave;ng m&igrave;nh trải nghiệm review ASUS TUF Gaming Dash F15 n&agrave;y nh&eacute;.&nbsp;</p>
<p><img src="https://laptopaz.vn/media/lib/2328_1.jpg" alt=""></p>
<h2>Thiết kế của ASUS TUF DASH<strong>&nbsp;</strong></h2>
<p>Thiết kế được thay đổi ho&agrave;n to&agrave;n so với những người anh em trước đ&oacute; thuộc d&ograve;ng <strong>TUF Gaming</strong>. Bề ngo&agrave;i g&oacute;c cạnh c&ugrave;ng m&agrave;u&nbsp;Eclipse Gray tạo cảm gi&aacute;c chắc chắn v&agrave; đậm chất gaming.</p>
<p><img src="https://laptopaz.vn/media/lib/2328_6.jpg" alt=""></p>
<p><strong>B&agrave;n ph&iacute;m&nbsp;</strong></p>
<p>B&agrave;n ph&iacute;m được thiết kế kh&aacute; nhỏ gọn chắc chắn. Việc bố tr&iacute; kh&ocirc;ng gian giữa b&agrave;n ph&iacute;m v&agrave; c&aacute;c ph&iacute;m chức năng kh&aacute; hợp l&yacute; n&ecirc;n khi sử dụng sẽ cho cảm gi&aacute;c thoải m&aacute;i v&agrave; dễ thở.&nbsp;</p>
<div>
    <p><img src="https://laptopaz.vn/media/product/2327_6.jpg" alt="" width="603" height="603"></p>
</div>
<h2>Th&ocirc;ng số kỹ thuật của&nbsp;ASUS TUF Gaming Dash F15</h2>
<p>Khi n&oacute;i đến CPU v&agrave; GPU của <strong>ASUS TUF Dash Gaming F15 FX517ZC-HN077W</strong> bạn c&oacute; thể hiểu r&otilde; l&yacute; do tại sao h&atilde;ng lại thiết kế một lớp vỏ cứng c&aacute;p v&agrave; đ&acirc;y l&agrave; điều cần thiết để bảo vệ bộ m&aacute;y b&ecirc;n trong. TUF Dash F15 đi k&egrave;m với bộ vi xử l&yacute; <strong>Intel Core i5 thế hệ 12</strong> kết hợp c&ugrave;ng <strong>RTX 3000 Series</strong> mạnh mẽ đến từ nh&agrave; NVIDIA. RAM 8GB DDR4 với tốc độ 3200MHz, với th&ocirc;ng số n&agrave;y TUF Dash F15 c&oacute; thể xử l&yacute; những tr&ograve; chơi đ&ograve;i hỏi nhiều năng lượng v&agrave; đ&ograve;i hỏi cao nhất (hoặc những tựa game được tối ưu h&oacute;a k&eacute;m như Cyberpunk 2077).</p>
<p>&nbsp;<img src="https://laptopaz.vn/media/product/2328_22.jpg" alt="" width="600" height="600"></p>
<h2>M&agrave;n h&igrave;nh v&agrave; đồ hoạ ASUS TUF DASH 15</h2>
<ul>
    <li>FullHD</li>
    <li>144Hz</li>
    <li>67% sRGB</li>
    <li>50% sRGB&nbsp;</li>
    <li>283 Nits</li>
    <li>2.75 DeltaE</li>
    <li>Contrast: 1100:1</li>
</ul>
<p><img src="https://laptopaz.vn/media/lib/2328_Screenshot2022-03-19093622.jpg" alt="" width="801" height="396"></p>
<p>C&ocirc;ng nghệ chống ch&oacute;i với Adaptive-Sync, tốc độ l&agrave;m tươi của m&agrave;n h&igrave;nh sẽ đồng bộ h&oacute;a với tốc độ khung h&igrave;nh của GPU để giảm độ trễ, giảm thiểu giật h&igrave;nh v&agrave; loại bỏ hiện tượng x&eacute; h&igrave;nh cho trải nghiệm chơi game cực mượt.<br><img src="https://laptopaz.vn/media/product/2011_7.jpg" alt=""></p>
<p><strong>&Acirc;m thanh TUF DASH F15</strong></p>
<p><strong>TUF Dash 15</strong> thực sự ấn tượng v&agrave; mạnh mẽ cả về đồ họa, &acirc;m thanh, chiếc laptop gaming n&agrave;y đi k&egrave;m với <strong>DTS: X Ultra</strong> đ&acirc;y l&agrave; codec &acirc;m thanh dựa tr&ecirc;n đối tượng, nhằm mục đ&iacute;ch tạo ra &acirc;m thanh đa chiều &ldquo;di chuyển xung quanh bạn như trong cuộc sống thực&rdquo;. Độ mạnh của t&iacute;n hiệu gần như tăng gấp đ&ocirc;i, với c&aacute;c &acirc;m cao trở n&ecirc;n sắc n&eacute;t v&agrave; chi tiết hơn, trượt mượt m&agrave; xuống c&aacute;c tần số thấp.</p>
<p><img src="https://laptopaz.vn/media/lib/2328_2.jpg" alt=""></p>
<p><img src="https://laptopaz.vn/media/product/2011_6.jpg" alt=""></p>
<h2>Cổng kết nối:&nbsp;</h2>
<ul>
    <li>1x 3.5mm kết hợp giắc cắm &acirc;m thanh</li>
    <li>1x HDMI 2.0b</li>
    <li>1x Thunderbolt &trade; 4 hỗ trợ DisplayPort</li>
    <li>1x USB 3.2 Gen 2 Type-C hỗ trợ DisplayPort/ cấp nguồn/ G-SYNC</li>
    <li>2x USB 3.2 Gen 1 Type-A</li>
    <li>1x cổng LAN RJ45</li>
</ul>
<p><img src="https://laptopaz.vn/media/lib/2328_6.jpg" alt=""></p>
<p><strong>Hệ thống tản nhiệt:&nbsp;</strong></p>
<p>Phần tản nhiệt với c&ocirc;ng nghệ tự l&agrave;m sạch&nbsp;được đặt sau mặt của vỏ m&aacute;y để giữ cho luồng kh&ocirc;ng kh&iacute; lu&ocirc;n m&aacute;t mẻ&nbsp;v&agrave; kh&ocirc;ng b&aacute;m bụi ở&nbsp;c&aacute;nh quạt v&agrave; th&agrave;nh ống dẫn nhiệt.</p>
<p><img src="https://laptopaz.vn/media/lib/2328_DSC07670.jpg" alt="" width="781" height="439"></p>
<p>Nh&igrave;n chung, nếu như bạn đang t&igrave;m kiếm 1 chiếc Laptop với cấu h&igrave;nh mạnh để chiến mọi tựa game th&igrave; <strong>TUF Dash 15 2022</strong> l&agrave; một sự lựa chọn ho&agrave;n hảo d&agrave;nh cho mọi game thủ.<strong>&nbsp;</strong></p>
<p><strong><br>&nbsp;</strong></p>', N'Intel Core i5-12450H (2.0GHz lên đến 4,4 GHz, 8 lõi: 4 lõi P và 4 lõi E)', N' 8GB DDR5 4800Mhz+1 RAM chờ ', N'512GB M.2 PCIe NVMe 3.0', N'NVIDIA GeForce RTX 3050 4GB GDDR6 (75W)', N'15.6 inch FHD (1920x1080) 16:9, 144Hz, 250nits, 1000:1, 62.5% sRGB', N'HD 720P', N'1x 3.5mm  1x HDMI 2.0b 1x Thunderbolt 4  2x USB 3.2 Gen 1 Type-A 1x cổng LAN RJ45', N'1,93 kg', N'4Cell 76Whr', N'Windows 11 Home bản quyền', 0, N'/images/pictures/tuf_dash_2022_pic_1.JPG', CAST(N'2022-04-09 14:56:18.793' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (51, N' Asus TUF Dash F15 2022 FX517ZC-HN079W', 1011, CAST(32000000 AS Decimal(18, 0)), 10, CAST(28800000 AS Decimal(18, 0)), N'[Mới 100%] Asus TUF Dash F15 2022 FX517ZC-HN079W (Core i5-12450H, 8GB, 512GB, RTX 3050, 15.6″ FHD 144Hz) Moonlight
', N'<h2>ASUS TUF Dash F15 FX517ZC-HN079W d&agrave;nh cho ai?</h2>
<p>L&agrave; một chiếc laptop gaming hạng nặng với bộ vi xử l&yacute; Intel i5 Gen 12 mới nhất kết hợp với GPU Nvidia RTX 3050 mới nhất v&agrave; một thiết lập &acirc;m thanh tổng thể tuyệt vời.&nbsp;</p>
<p>Trong thời điểm hiện nay việc t&igrave;m mua được một chiếc card RTX 3000 cho PC cũng kh&aacute; l&agrave; kh&oacute; khăn nhưng <strong>TUF Dash 15 2022</strong> sẽ l&agrave; một lựa chọn ho&agrave;n hảo. C&ugrave;ng m&igrave;nh trải nghiệm review ASUS TUF Gaming Dash F15 n&agrave;y nh&eacute;.&nbsp;</p>
<p><img src="https://laptopaz.vn/media/lib/2327_11.jpg" alt=""></p>
<h2>Thiết kế của ASUS TUF DASH<strong>&nbsp;</strong></h2>
<p>Thiết kế được thay đổi ho&agrave;n to&agrave;n so với những người anh em trước đ&oacute; thuộc d&ograve;ng <strong>TUF Gaming</strong>. Bề ngo&agrave;i g&oacute;c cạnh c&ugrave;ng m&agrave;u&nbsp;Eclipse Gray tạo cảm gi&aacute;c chắc chắn v&agrave; đậm chất gaming.</p>
<p><img src="https://laptopaz.vn/media/lib/2327_15.jpg" alt=""></p>
<p><strong>B&agrave;n ph&iacute;m&nbsp;</strong></p>
<p>B&agrave;n ph&iacute;m được thiết kế kh&aacute; nhỏ gọn chắc chắn. Việc bố tr&iacute; kh&ocirc;ng gian giữa b&agrave;n ph&iacute;m v&agrave; c&aacute;c ph&iacute;m chức năng kh&aacute; hợp l&yacute; n&ecirc;n khi sử dụng sẽ cho cảm gi&aacute;c thoải m&aacute;i v&agrave; dễ thở.&nbsp;</p>
<div>
    <p><img src="https://laptopaz.vn/media/product/2327_6.jpg" alt="" width="603" height="603"></p>
</div>
<h2>Th&ocirc;ng số kỹ thuật của&nbsp;ASUS TUF Gaming Dash F15</h2>
<p>Khi n&oacute;i đến CPU v&agrave; GPU của <strong>ASUS TUF Dash Gaming F15 FX517ZC-HN079W</strong> bạn c&oacute; thể hiểu r&otilde; l&yacute; do tại sao h&atilde;ng lại thiết kế một lớp vỏ cứng c&aacute;p v&agrave; đ&acirc;y l&agrave; điều cần thiết để bảo vệ bộ m&aacute;y b&ecirc;n trong. TUF Dash F15 đi k&egrave;m với bộ vi xử l&yacute; <strong>Intel Core i5 thế hệ 12</strong> kết hợp c&ugrave;ng <strong>RTX 3000 Series</strong> mạnh mẽ đến từ nh&agrave; NVIDIA. RAM 8GB DDR4 với tốc độ 3200MHz, với th&ocirc;ng số n&agrave;y TUF Dash F15 c&oacute; thể xử l&yacute; những tr&ograve; chơi đ&ograve;i hỏi nhiều năng lượng v&agrave; đ&ograve;i hỏi cao nhất (hoặc những tựa game được tối ưu h&oacute;a k&eacute;m như Cyberpunk 2077).</p>
<p>&nbsp;<img src="https://laptopaz.vn/media/product/2327_4.jpg" alt="" width="609" height="610"></p>
<h2>M&agrave;n h&igrave;nh v&agrave; đồ hoạ ASUS TUF DASH 15</h2>
<ul>
    <li>FullHD 16:9</li>
    <li>144Hz</li>
    <li>67% sRGB</li>
    <li>50% aRGB&nbsp;</li>
    <li>283 Nits</li>
    <li>2.75 DeltaE</li>
    <li>Contrast: 1100:1</li>
</ul>
<p><img src="https://laptopaz.vn/media/lib/2328_Screenshot2022-03-19093622.jpg" alt="" width="801" height="396"></p>
<p>C&ocirc;ng nghệ chống ch&oacute;i với Adaptive-Sync, tốc độ l&agrave;m tươi của m&agrave;n h&igrave;nh sẽ đồng bộ h&oacute;a với tốc độ khung h&igrave;nh của GPU để giảm độ trễ, giảm thiểu giật h&igrave;nh v&agrave; loại bỏ hiện tượng x&eacute; h&igrave;nh cho trải nghiệm chơi game cực mượt.</p>
<p><img src="https://laptopaz.vn/media/product/2011_7.jpg" alt=""></p>
<p><strong>&Acirc;m thanh TUF DASH F15</strong></p>
<p><strong>TUF Dash 15</strong> thực sự ấn tượng v&agrave; mạnh mẽ cả về đồ họa, &acirc;m thanh, chiếc laptop gaming n&agrave;y đi k&egrave;m với <strong>DTS: X Ultra</strong> đ&acirc;y l&agrave; codec &acirc;m thanh dựa tr&ecirc;n đối tượng, nhằm mục đ&iacute;ch tạo ra &acirc;m thanh đa chiều &ldquo;di chuyển xung quanh bạn như trong cuộc sống thực&rdquo;. Độ mạnh của t&iacute;n hiệu gần như tăng gấp đ&ocirc;i, với c&aacute;c &acirc;m cao trở n&ecirc;n sắc n&eacute;t v&agrave; chi tiết hơn, trượt mượt m&agrave; xuống c&aacute;c tần số thấp.</p>
<p><img src="https://laptopaz.vn/media/lib/2327_12.jpg" alt=""></p>
<p><img src="https://laptopaz.vn/media/product/2011_6.jpg" alt=""></p>
<h2>Cổng kết nối</h2>
<ul>
    <li>1x 3.5mm kết hợp giắc cắm &acirc;m thanh</li>
    <li>1x HDMI 2.0b</li>
    <li>1x Thunderbolt &trade; 4 hỗ trợ DisplayPort</li>
    <li>1x USB 3.2 Gen 2 Type-C hỗ trợ DisplayPort/ cấp nguồn/ G-SYNC</li>
    <li>2x USB 3.2 Gen 1 Type-A</li>
    <li>1x cổng LAN RJ45</li>
</ul>
<p><img src="https://laptopaz.vn/media/lib/2327_15.jpg" alt=""></p>
<h2>&nbsp;</h2>
<h2>Hệ thống tản nhiệt</h2>
<p>Phần tản nhiệt với c&ocirc;ng nghệ tự l&agrave;m sạch&nbsp;được đặt sau mặt của vỏ m&aacute;y để giữ cho luồng kh&ocirc;ng kh&iacute; lu&ocirc;n m&aacute;t mẻ&nbsp;v&agrave; kh&ocirc;ng b&aacute;m bụi ở&nbsp;c&aacute;nh quạt v&agrave; th&agrave;nh ống dẫn nhiệt.</p>
<p><img src="https://laptopaz.vn/media/lib/2327_16.jpg" alt=""></p>
<p>Nh&igrave;n chung, nếu như bạn đang t&igrave;m kiếm 1 chiếc Laptop với cấu h&igrave;nh mạnh để chiến mọi tựa game th&igrave; <strong>TUF Dash 15 2022</strong> l&agrave; một sự lựa chọn ho&agrave;n hảo d&agrave;nh cho mọi game thủ.<strong>&nbsp;</strong></p>', N'Intel Core i5-12450H (2.0GHz lên đến 4,4 GHz, 8 lõi: 4 lõi P và 4 lõi E)', N'8GB DDR4 3200Mhz+1 RAM chờ ', N'512GB M.2 PCIe NVMe 3.0', N'15.6 inch FHD (1920x1080) 16:9, 144Hz, 250nits, 1000:1, 62.5% sRGB', N'15.6 inch FHD (1920x1080) 16:9, 144Hz, 250nits, 1000:1, 62.5% sRGB', N'HD 720P', N'	 1x 3.5mm  1x HDMI 2.0b 1x Thunderbolt 4 2x USB 3.2 Gen 1 Type-A 1x cổng LAN RJ45', N'1,93 kg', N'4Cell 76Whr', N'Windows 11 Home bản quyền', 0, N'/images/pictures/tuf_dash_2022_pic_1.JPG', CAST(N'2022-04-09 14:58:55.283' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (52, N' Asus ROG Strix G15 2022 G513RC-HN090W ', 1011, CAST(30900000 AS Decimal(18, 0)), 6, CAST(29046000 AS Decimal(18, 0)), N'[Mới 100%] Asus ROG Strix G15 2022 G513RC-HN090W (Ryzen 7-6800H, 8GB, 512GB, RTX 3050, 15.6'''' FHD 144Hz)
', N'<p>CPU AMD Ryzen 7 6800H mới nhất được kết hợp l&ecirc;n tới card đồ họa RTX 3080 (TGP tối đa 150W) đi k&egrave;m bộ chuyển đổi MUX tạo th&agrave;nh xương sống cho ROG Strix G513 2022. Bộ nhớ DDR5 ti&ecirc;n tiến nhất gi&uacute;p CPU của bạn lu&ocirc;n được cung cấp th&ocirc;ng tin, đảm bảo trải nghiệm sử dụng. Hỗ trợ SSD PCIe 4.0 gi&uacute;p bạn kh&ocirc;ng tốn thời gian chờ đợi tải tr&ograve; chơi.&nbsp;</p>
<p><img src="https://laptopaz.vn/media/lib/2319_rogg513-8.jpg" alt="">&nbsp;</p>
<p><em>H&igrave;nh: ngoại h&igrave;nh ROG Strix G15 G513 2022</em></p>
<p><strong>THIẾT KẾ:</strong></p>
<p>Năm nay,&nbsp;ROG Strix G15 G513 c&oacute; nhiều sự thay đổi về mặt thiết kế. Đầu ti&ecirc;n phải n&oacute;i đến đ&oacute; l&agrave; mặt lưng thay đổi họa tiết h&igrave;nh khối. Thứ 2 đ&oacute; l&agrave; logo ph&aacute;t s&aacute;ng năm nay chỉ ph&aacute;t s&aacute;ng phần viền của logo.</p>
<p><img src="https://laptopaz.vn/media/lib/2319_rogg513-6.jpg" alt="">&nbsp;</p>
<p><em>H&igrave;nh: logo ph&aacute;t s&aacute;ng ROG Strix G513 2022</em></p>
<p>Ốp bản lề được thiết kế họa tiết mới dạng vảy sơn kh&aacute; bắt mắt. ASUS tiếp tục cho ra mắt chiếc Laptop Gaming gọn hơn, tinh tế hơn với khối lượng chỉ 2,08kg. Mặt lưng chất liệu nh&ocirc;m, vỏ m&aacute;y ở dưới l&agrave; nhựa, bản lề vẫn thuộc v&agrave;o dạng v&ocirc; c&ugrave;ng chắc chắn.&nbsp;Tin vui d&agrave;nh cho game thủ chơi hệ Led RGB, bởi&nbsp;<strong>ROG Strix G15 G513 sở hữu hệ thống Led RGB kh&aacute; s&aacute;ng v&agrave; đẹp mắt. Touchpad phủ k&iacute;nh, vẫn rất rộng r&atilde;i v&agrave; tổng quan trải nghiệm vẫn l&agrave; tốt nhất trong ph&acirc;n kh&uacute;c.&nbsp;</strong></p>
<p><img src="https://laptopaz.vn/media/lib/2319_rogg51318-2.jpg" alt=""></p>
<p>&nbsp;<em>H&igrave;nh: B&agrave;n ph&iacute;m RGB.&nbsp;</em></p>
<p><strong>CỔNG KẾT NỐI:</strong></p>
<ul>
    <li>1x 3.5mm Combo Audio Jack</li>
    <li>1x HDMI 2.0b</li>
    <li>1x Cổng 2.5G LAN&nbsp;</li>
    <li>1x USB 3.2 Gen 2 Type-C</li>
    <li>1x USB 3.2 Gen 2 Type-C&nbsp;hỗ trợ&nbsp;DisplayPort&trade; / power delivery</li>
    <li>2x USB 3.2 Gen&nbsp;1 Type-A&nbsp;</li>
</ul>
<p><img src="https://laptopaz.vn/media/lib/2319_rogg513-7.jpg" alt=""></p>
<p>&nbsp;<em>H&igrave;nh: cổng kết nối&nbsp;ROG Strix G513 2022</em></p>
<p><strong>M&Agrave;N H&Igrave;NH:&nbsp;</strong></p>
<ul>
    <li>FULLHD, 15.6&rdquo;, IPS, 144Hz&nbsp;</li>
    <li>Phổ m&agrave;u: 49% sRGB, 66% AdobeRGB, 49% P3</li>
    <li>Độ s&aacute;ng: 328.9 nits.&nbsp;</li>
</ul>
<p><img src="https://laptopaz.vn/media/lib/2319_rogg513-13.jpg" alt=""></p>
<p>&nbsp;<em>H&igrave;nh: phổ m&agrave;u ROG Strix G513 2022</em>&nbsp;</p>
<p><strong>CẤU H&Igrave;NH:&nbsp;</strong></p>
<ul>
    <li>CPU: AMD Ryzen 7 6800H, 8 nh&acirc;n/ 16 luồng, 3.2 GHz -&gt; 4.7 GHz</li>
    <li>Ram: 8GB DDR5 4800MHz (1 thanh)</li>
    <li>GPU: VGA RTX 3050 4GB VRam TDP 95W</li>
    <li>SSD: 512 GB</li>
</ul>
<p><img src="https://laptopaz.vn/media/lib/2319_rogg5132-2.jpg" alt=""></p>
<p><em>H&igrave;nh: cấu h&igrave;nh ROG Strix G513 2022&nbsp;</em></p>
<p><strong>Năm nay th&igrave; c&aacute;c bạn vẫn chưa c&oacute; VGA mới theo truyền thống h&agrave;ng năm do sự thiếu hụt sản xuất, nhưng với con chip</strong> <strong>Ryzen 7 6800H 8 nh&acirc;n, 16 luồng đi c&ugrave;ng với VGA RTX 3050 th&igrave; c&aacute;c bạn ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m với sức mạnh chiến c&aacute;c tựa game nặng. Điểm đặc biệt của CPU Ryzen 7 6800H l&agrave; sở hữu tiến tr&igrave;nh 6nm t&acirc;n tiến của TSMC xung nhịp l&ecirc;n tới 4.7GHz mạnh mẽ.&nbsp;</strong></p>
<p><strong>NHIỆT ĐỘ:</strong></p>
<p>Link test game của LaptopAZ:</p>
<p>&nbsp;<iframe src="https://www.youtube.com/embed/QNEqyXgjJDE" width="800" height="450"></iframe></p>
<p>Khi m&igrave;nh chơi những tựa game tốn nhiều CPU khoảng: 86 độ C cho 55W, <strong>GPU Fullload chỉ khoảng 72, 73 độ C.&nbsp;</strong>Tiếng quạt kh&aacute; y&ecirc;n tĩnh, kh&ocirc;ng g&acirc;y tiếng ồn. Để c&oacute; nhiệt độ tốt n&agrave;y th&igrave; ROG vẫn giữ Kem tản nhiệt kim loại lỏng tr&ecirc;n CPU.&nbsp;Tiếng quạt &ecirc;m, vẫn kh&ocirc;ng ồn l&agrave; điểm cộng.</p>
<p><img src="https://laptopaz.vn/media/lib/2319_rogg513-3.jpg" alt=""></p>
<p><em>H&igrave;nh:&nbsp;phần mềm Armory crate của h&atilde;ng</em></p>
<p><strong>N&Acirc;NG CẤP:&nbsp;</strong></p>
<p>- 2 khe RAM DDR5, Bus 4800MHz.</p>
<p>- 2 khe M.2 NVMe.</p>
<p>- Pin: 56Wh (2-3h).</p>
<p>&nbsp;<strong><img src="https://laptopaz.vn/media/lib/2319_rogg513-4.jpg" alt=""></strong></p>
<p><em>H&igrave;nh: N&acirc;ng cấp&nbsp;ROG Strix G513 2022</em></p>
<p><strong>TỔNG KẾT:&nbsp;</strong><strong>Độ ho&agrave;n thiện đối với mức gi&aacute; ở thời điểm hiện tại l&agrave; qu&aacute; ổn cho một chiếc m&aacute;y gaming. Năm nay ASUS vẫn sử dụng RTX 3050 4GB cũng dễ hiểu th&ocirc;i, bởi v&igrave; RTX 3050 vẫn đang l&agrave;m rất tốt rồi. ROG Strix G15 G513 2022 sẽ l&agrave; lựa chọn ho&agrave;n hảo cho c&aacute;c game thủ kh&oacute; t&iacute;nh nhất.&nbsp;</strong></p>', N'	AMD Ryzen R7-6800H  8 cores/ 16 threads. 3.20GHz up to 4.7GHz', N'8GB DDR5 4800MHz + 1 khe chờ', N'512GB M.2 NVMe PCIe 4.0 SSD  + 1 Khe M2 NVMe PCIe 4.0 chờ', N'NVIDIA GeForce RTX 3050 4GB GDDR6 (95W)', N'15.6 inchs FHD (1920 x1080), IPS, Chống Lóa, 144 Hz, 308 nits, 45%NTSC, 64%sRGB, AdaptiveSync', N'HD 720P', N'1x 3.5mm Combo Audio Jack  1x HDMI 2.0b  1x Cổng 2.5G LAN   1x USB 3.2 Gen 2 Type-C  1x USB 3.2 Gen 2 Type-C hỗ trợ DisplayPort™ / power delivery  2x USB 3.2 Gen 1 Type-A ', N'2.08 kg', N'	4-cell, 56WHrs', N'Windows 11 bản quyền', 0, N'/images/pictures/asus_rog_g513_pic1.jpg', CAST(N'2022-04-09 15:01:52.957' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (53, N'Asus TUF Gaming F15 FX506LH-HN188W', 1011, CAST(22000000 AS Decimal(18, 0)), 15, CAST(18700000 AS Decimal(18, 0)), N'[Mới 100%] Asus TUF Gaming F15 FX506LH-HN188W (Core i5 - 10300H, 8GB, 512GB, GTX 1650, 15.6″ FHD 144Hz)
', N'<p>Hiện nay khi mua laptop người d&ugrave;ng thường c&oacute; xu hướng lựa chọn sản phẩm c&oacute; thể phục vụ cho nhiều nhu cầu sử dụng kh&aacute;c nhau. Vậy, <strong>Asus TUF FX506LH-HN188W</strong> sẽ l&agrave; lựa chọn ph&ugrave; hợp. Laptop với cấu h&igrave;nh cao c&oacute; thể phục vụ học tập, l&agrave;m việc, chơi game,&hellip;</p>
<p><img src="https://laptopaz.vn/media/lib/1809_ASUS-TUF-Gaming-A15-FA506-man-hinh.jpg" alt=""></p>
<p><strong>Asus TUF FX506LH-HN188W&nbsp;</strong>được ph&acirc;n phối bởi&nbsp;<strong>LaptopAZ</strong>, sản phẩm&nbsp;mới 100%</p>
<p><strong>Thiết kế</strong></p>
<p>Thiết kế của <strong>Asus TUF FX506LH-HN188W</strong> nh&igrave;n qua c&oacute; vẻ đơn giản nhưng lại đậm c&aacute; t&iacute;nh v&agrave; ẩn chứa nhiều điều bất ngờ. Bạn sẽ c&oacute; một chiếc laptop gaming gọn g&agrave;ng với viền m&agrave;n h&igrave;nh mỏng v&agrave; trọng lượng chỉ 2.2 kg. To&agrave;n th&acirc;n m&aacute;y l&agrave; những đường n&eacute;t tinh tế như họa tiết tổ ong ở khung m&aacute;y độc đ&aacute;o, g&oacute;p phần tản nhiệt tốt hơn; c&aacute;c đường kẻ sọc đối lập đầy thanh tho&aacute;t v&agrave; đặc biệt l&agrave; thiết kế Fortress Gray với m&agrave;u x&aacute;m cực sang trọng tr&ecirc;n mặt lưng, c&ugrave;ng logo TUF gaming đẳng cấp. Tất cả tạo n&ecirc;n một chiếc laptop chuẩn game thủ, c&aacute; t&iacute;nh v&agrave; đẳng cấp.</p>
<p><img src="https://laptopaz.vn/media/lib/1809_ASUS-TUF-Gaming-A15-FA506-kieu-dang.jpg" alt=""></p>
<p>Những chiếc laptop TUF Gaming lu&ocirc;n nổi tiếng với độ bền xuất sắc. <strong>Asus TUF FX506LH-HN188W</strong> đ&atilde; vượt qua b&agrave;i thử nghiệm độ bền chuẩn qu&acirc;n đội MIL-STD-810H. C&aacute;c thử nghiệm như thả rơi, chống rung, nhiệt độ cao, nhiệt độ thấp hay độ ẩm đều đ&atilde; được vượt qua tr&ecirc;n chiếc TUF Gaming F15, để khi đến tay người ti&ecirc;u d&ugrave;ng, đ&oacute; sẽ l&agrave; một chiếc laptop gaming v&ocirc; c&ugrave;ng bền vững.</p>
<p><strong>Hi&ecirc;̣u năng</strong></p>
<p><strong>Asus TUF FX506LH-HN188W</strong> mang tr&ecirc;n m&igrave;nh sức mạnh của bộ vi xử l&yacute; Intel thế hệ thứ 10. Con chip Intel Core <strong>i5 10300H</strong> với 4 l&otilde;i 8 luồng v&agrave; tốc độ tối đa l&ecirc;n tới 4.50GHz cho hiệu năng đ&aacute;ng tin cậy, d&ugrave; l&agrave; bạn chơi game, ph&aacute;t trực tiếp hay l&agrave;m việc. Đi k&egrave;m với đ&oacute; l&agrave; 512<strong>GB SSD NVMe PCIe</strong>, <strong>8GB RAM DDR4</strong> v&agrave; khả năng n&acirc;ng cấp dễ d&agrave;ng, để bạn c&oacute; được hiệu năng đ&uacute;ng như &yacute; muốn.</p>
<p><img src="https://laptopaz.vn/media/lib/1809_ASUS-TUF-Gaming-A15-FA506-di-dong.jpg" alt=""></p>
<p>Card đồ họa <strong>Asus TUF FX506LH-HN188W</strong> sử dụng l&agrave; <strong>NVIDIA GeForce GTX 1650</strong>. Đ&acirc;y l&agrave; card đồ họa với kiến tr&uacute;c Turing danh tiếng, gi&uacute;p bạn c&oacute; thể chơi tốt mọi game eSports v&agrave; sẵn s&agrave;ng cho c&aacute;c tựa game bom tấn . C&ocirc;ng nghệ d&ograve; tia theo thời gian thực trong game, tr&iacute; tuệ nh&acirc;n tạo AI sẽ mang đến cho bạn trải nghiệm game cực đỉnh.</p>
<p><strong>Màn hình &amp; &Acirc;m thanh</strong></p>
<p><strong>M&agrave;n h&igrave;nh</strong> <strong>Asus TUF FX506LH-HN188W</strong> được chế t&aacute;c viền mỏng tối đa, mang đến những h&igrave;nh ảnh tuyệt đẹp tr&ecirc;n tấm nền 15.6 inch, độ ph&acirc;n giải Full HD. Đặc biệt, đ&acirc;y c&ograve;n l&agrave; m&agrave;n h&igrave;nh c&oacute; tốc độ khung h&igrave;nh vượt trội 60Hz. C&aacute;c tựa game sẽ được t&aacute;i hiện một c&aacute;ch mượt m&agrave;, tốc độ khung h&igrave;nh nhanh v&agrave; giảm thiểu hiện tượng x&eacute; h&igrave;nh. Hơn thế nữa, bạn c&ograve;n c&oacute; thể kết nối với hai m&agrave;n h&igrave;nh b&ecirc;n ngo&agrave;i c&ugrave;ng l&uacute;c, bao gồm một m&agrave;n h&igrave;nh để l&agrave;m việc qua cổng USB 3.2 gen 2 Type-C hỗ trợ DisplayPort 1.4 v&agrave; một m&agrave;n h&igrave;nh lớn để chơi game, xem phim 4K qua cổng HDMI 2.0b.</p>
<p><img src="https://laptopaz.vn/media/lib/1809_Asus-TUF-FA506-intel-15.jpg" alt=""></p>
<p><strong>Asus&nbsp;Gaming FX506LH</strong> cho chất lượng &acirc;m thanh cao nhờ được t&iacute;ch hợp c&ocirc;ng nghệ &acirc;m thanh độc quyền DTS Headphone: X. Đặc biệt khi đeo tai nghe, người d&ugrave;ng c&oacute; thể trải nghiệm &acirc;m thanh v&ograve;m 7.1 giả lập cho chất lượng ch&acirc;n thực, đặc biệt trong trải nghiệm game. Ngo&agrave;i ra, người d&ugrave;ng c&ograve;n c&oacute; thể t&ugrave;y chỉnh Equalizer mang đến trải nghiệm ch&acirc;n thực trong phim ảnh, tr&ograve; chơi, nghe nhạc,&hellip;</p>
<p><strong>Bàn phím</strong></p>
<p><strong>Asus TUF FX506LH-HN188W</strong> trang bị <strong>b&agrave;n ph&iacute;m</strong> tương tự m&aacute;y t&iacute;nh để b&agrave;n, tốt nhất cho hoạt động chơi game. Tất nhi&ecirc;n bạn sẽ c&oacute; đ&egrave;n nền RGB đồng bộ v&agrave; nhiều chế độ kh&aacute;c nhau để tha hồ thể hiện kỹ năng một c&aacute;ch &ldquo;cool ngầu&rdquo; hơn. C&ocirc;ng nghệ Overstroke k&iacute;ch hoạt vị tr&iacute; nhận lệnh cao hơn tr&ecirc;n ph&iacute;m bấm, mang tới tốc độ phản hồi nhanh hơn. Tất nhi&ecirc;n kh&ocirc;ng thể kh&ocirc;ng nhắc đến độ bền của một sản phẩm TUF khi b&agrave;n ph&iacute;m Asus TUF Gaming F15 c&oacute; tuổi thọ tới 20 triệu lần nhấn.</p>
<p><img src="https://laptopaz.vn/media/lib/1809_52709_FA506iv5.jpg" alt=""></p>
<p><strong>Tản nhiệt th&ocirc;ng minh</strong></p>
<p>Hệ thống tản nhiệt cao cấp bao gồm nhiều ống tản nhiệt v&agrave; 3 ống dẫn nhiệt gi&uacute;p <strong>Asus TUF FX506LH-HN188W</strong> c&oacute; khả năng tản nhiệt nhanh ch&oacute;ng. Thiết kế l&agrave;m m&aacute;t tự l&agrave;m sạch th&ocirc;ng minh đảm bảo hệ thống tản nhiệt hoạt động hiệu quả v&agrave; l&acirc;u d&agrave;i. Nhờ vậy bạn lu&ocirc;n c&oacute; được hiệu năng ổn định tr&ecirc;n <strong>Asus TUF FX506LH-HN188W</strong> để tự tin giải tr&iacute; với những trận chiến Game hấp dẫn.</p>
<p><img src="https://laptopaz.vn/media/lib/1809_Asus-TUF-FA506-intel-17.jpg" alt=""></p>
<p><strong>Khả năng kết nối ho&agrave;n hảo</strong></p>
<p>Rất nhiều cổng I/O cho ph&eacute;p bạn kết nối c&aacute;c thiết bị ngoại vi y&ecirc;u th&iacute;ch của m&igrave;nh v&agrave; bắt đầu l&agrave;m việc ở bất cứ đ&acirc;u. Hai cổng USB 3.2 Type A cho ph&eacute;p truyền dữ liệu nhanh ch&oacute;ng, v&agrave; cổng USB 2.0 Type A bổ sung d&agrave;nh cho kết nối c&aacute;c thiết bị ngoại vi như chuột, b&agrave;n ph&iacute;m. Bluetooth cũng cho ph&eacute;p bạn gh&eacute;p nối chuột, tai nghe v&agrave; c&aacute;c thiết bị tương th&iacute;ch kh&aacute;c để c&oacute; kh&ocirc;ng gian l&agrave;m việc kh&ocirc;ng d&acirc;y.</p>
<p><img src="https://laptopaz.vn/media/lib/1809_52709_FA506iv8.jpg" alt=""></p>
<p>Sử dụng USB 3.2 Gen 2 Type-C (hỗ trợ DisplayPort &trade; 1.4) kết nối m&agrave;n h&igrave;nh G-SYNC si&ecirc;u tốc để chơi game mượt m&agrave;. Kết hợp trực tuyến với Wi-Fi 802.11ac (2&times;2) để c&oacute; kết nối nhanh v&agrave; đ&aacute;ng tin cậy ở bất cứ nơi n&agrave;o c&oacute; Wi-Fi.</p>
<p><strong>Kết luận:&nbsp;Asus TUF FX506LH-HN188W</strong><strong>&nbsp;</strong>l&agrave; một trong những sự lựa chọn h&agrave;ng đầu của d&ograve;ng m&aacute;y Gaming. Sở hữu thiết kế hầm hố nhưng cũng kh&ocirc;ng k&eacute;m phần tinh tế, kết hợp c&ugrave;ng cấu h&igrave;nh mạnh mẽ v&agrave; tản nhiệt m&aacute;t mẻ, <strong>Asus TUF FX506LH-HN188W</strong> tự tin c&oacute; thể chinh phục được đa số c&aacute;c Game Online, Offline thời thượng hiện nay. Hơn thế nữa <strong>Asus TUF FX506LH-HN188W</strong> cũng đủ sức đ&aacute;p ứng c&aacute;c t&aacute;c vụ thiết kế đồ họa, c&ocirc;ng việc, giải tr&iacute; một c&aacute;ch mượt m&agrave; nhất. Hiện tại LaptopAZ đang c&oacute; những chương tr&igrave;nh ưu đ&atilde;i v&ocirc; c&ugrave;ng tuyệt vời khi kh&aacute;ch h&agrave;ng đặt mua <strong>Asus TUF FX506LH-HN188W</strong> ngay từ ng&agrave;y h&ocirc;m nay!</p>', N'Core i5 - 10300H', N'8GB DDR4', N'SSD 512GB', N'NVIDIA GTX 1650', N'15.6 inch FHD IPS 144Hz', N'HD 720P', N'Type-A USB 3.1 (Gen 1), Type-A USB2.0, LAN, HDMI 2.0B, COMBO audio jack', N'2.2 kg', N'3-cell, 48WHrs', N'Windows 10 bản quyền', 0, N'/images/pictures/tuf_f15_506lh_pic_1.jpg', CAST(N'2022-04-09 15:59:43.163' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (54, N'Asus ROG Strix G15 G513IH-HN015T', 1011, CAST(25000000 AS Decimal(18, 0)), 10, CAST(22500000 AS Decimal(18, 0)), N'[Mới 100%] Asus ROG Strix G15 G513IH-HN015T (Ryzen 7-4800H, 8GB, 512GB, GTX 1650, 15.6'''' FHD 144Hz)
', N'<p><strong>ASUS ROG Strix G15 - Chiến thần Gaming trong thiết kế tinh tế.&nbsp;</strong></p>
<p>Với sự thay đổi lớn về mặt thiết kế nhỏ gọn hơn, tinh tế hơn c&ugrave;ng cấu h&igrave;nh đi k&egrave;m mức gi&aacute; hợp l&yacute;, ROG Strix G15 G513 trở n&ecirc;n si&ecirc;u hot tr&ecirc;n mọi mặt trận Laptop Gaming phổ th&ocirc;ng.</p>
<p><br></p>
<p><strong>THIẾT KẾ:&nbsp;</strong></p>
<p>Năm nay, ASUS đ&atilde; c&oacute; sự thay đổi ngoạn mục về phần thiết kế, biến chiếc ROG Strix G15 2021 th&agrave;nh một cỗ m&aacute;y chiến mọi tựa game tr&ecirc;n tị trường lại v&ocirc; c&ugrave;ng nhỏ gọn, tinh tế. C&oacute; phần nhỏ gọn hơn Lenovo Legion 5 với c&acirc;n nặng chỉ 2,3kg.&nbsp;</p>
<p><img src="https://laptopaz.vn/media/lib/2311_ASUSROGStrickG152..jpg" alt=""></p>
<p>&nbsp;<em>H</em><em>&igrave;nh: Asus ROG Strix G15&nbsp;</em></p>
<p>Thiết kế mặt lưng kim loại, c&ograve;n lại l&agrave; vỏ nhựa, như vậy th&igrave; bạn ho&agrave;n to&agrave;n kh&ocirc;ng cần lo lắng mỗi khi di chuyển m&aacute;y n&agrave;y. Asus cũng đ&atilde; thay đổi đường Led chạy dọc sườn m&aacute;y đến cổng kết nối, hạn chế tăng độ d&agrave;y của m&aacute;y. C&oacute; lẽ điểm nổi bật nhất về mặt thiết kế b&ecirc;n ngo&agrave;i của ROG Strix G15 đ&oacute; ch&iacute;nh l&agrave; chiếc logo ph&aacute;t s&aacute;ng đằng sau mặt lưng của m&aacute;y. &nbsp;</p>
<p><img src="https://laptopaz.vn/media/lib/2311_ASUSROGStrickG153..jpg" alt="">&nbsp;</p>
<p><em>H&igrave;nh: Logo mặt lưng Asus ROG Strix G15&nbsp;</em></p>
<p>B&agrave;n ph&iacute;m c&oacute; Led RGB với h&agrave;nh tr&igrave;nh ph&iacute;m vượt trội, c&ugrave;ng Touchpad k&iacute;ch thước lớn được phủ k&iacute;nh cho trải nghiệm mượt m&agrave;.&nbsp;</p>
<p><img src="https://laptopaz.vn/media/lib/2311_bnphmrogstrixg15-3.jpg" alt="">&nbsp;</p>
<p><em>H&igrave;nh: Ph&iacute;m Led RGB ROG Strix G15&nbsp;</em></p>
<p><strong>M&Agrave;N H&Igrave;NH:&nbsp;</strong></p>
<p>M&agrave;n h&igrave;nh c&oacute; độ ph&acirc;n giải FullHD, 144Hz, 65% sRGB, 313 nits, 1220:1 contrast, deltaE 1.18. Độ s&aacute;ng vừa đủ v&agrave; sắc n&eacute;t đối với những game thủ kh&oacute; t&iacute;nh. Asus cũng đ&atilde; thay đổi đường Led chạy dọc sườn m&aacute;y đến cổng kết nối, hạn chế tăng độ d&agrave;y của m&aacute;y.&nbsp;<br><img src="https://laptopaz.vn/media/lib/2311_ASUSROGStrickG156..jpg" alt="">&nbsp;</p>
<p><strong>CỔNG KẾT NỐI:&nbsp;</strong></p>
<p><img src="https://laptopaz.vn/media/lib/2311_ASUSROGStrickG1514-Copy.jpg" alt="" width="803" height="117"></p>
<p><em>H&igrave;nh: cạnh phải m&aacute;y</em></p>
<p><img src="https://laptopaz.vn/media/lib/2311_ASUSROGStrickG1515-Copy.jpg" alt="" width="804" height="123"></p>
<p>&nbsp;</p>
<p><em>H&igrave;nh: cạnh tr&aacute;i m&aacute;y</em></p>
<p><em><img src="https://laptopaz.vn/media/lib/2311_ASUSROGStrckG1516.jpg" alt="" width="801" height="156"></em></p>
<p>&nbsp;</p>
<p><em>H&igrave;nh: cạnh sau m&aacute;y</em>&nbsp;</p>
<ul>
    <li>1x cổng &acirc;m thanh 3.5mm</li>
    <li>2x USB-A 3.2 Gen 1</li>
    <li>1x cổng LAN&nbsp;</li>
    <li>1x cổng nguồn</li>
    <li>1x cổng HDMI</li>
    <li><strong>1x USB-A 3.2 Gen 1</strong></li>
    <li><strong>1x USB-C 3.2 Gen 2 (with DisplayPort and Power Delivery).</strong></li>
</ul>
<p><strong>Hiệu năng:</strong></p>
<p><em>Cấu h&igrave;nh test game:&nbsp;</em></p>
<ul>
    <li>CPU: Ryzen 7 4800H <em>8 nh&acirc;n/ 16 luồng ( 2,9 GHz - 4,2 GHz)</em></li>
    <li>GPU: GTX 1650 4GB&nbsp;(55W)</li>
    <li>RAM: 8GB DDR4 3200Mhz</li>
    <li>SSD: 512 GB</li>
    <li>M&agrave;n h&igrave;nh: 15.6&quot; FHD IPS 144Hz</li>
</ul>
<p><img src="https://laptopaz.vn/media/lib/2311_Screenshot2022-03-14155815.jpg" alt=""></p>
<h3 align="center"><strong>Asus ROG Strix G15 được trang bị cấu h&igrave;nh Ryzen 7 4800H 8GB Ram GTX1650 ( TDP 55W). Với cấu h&igrave;nh n&agrave;y th&igrave; c&aacute;c bạn c&oacute; thể chơi c&aacute;c tựa game Esport ở setting cao hoặc c&aacute;c game AAA settting Medium v&ocirc; c&ugrave;ng mượt m&agrave;.</strong></h3>
<p>Ngo&agrave;i ra, hệ thống tản nhiệt <strong>Asus ROG Strix G15 bản 2021 gi&uacute;p cho CPU của m&aacute;y hoạt động chỉ ở mức 86 độ khi test c&aacute;c tựa game nặng. CPU m&aacute;t ở chế độ Turbo, quạt chạy với tốc độ tối đa nhưng kh&aacute; y&ecirc;n tĩnh.&nbsp;</strong></p>
<p><strong>N&Acirc;NG CẤP:&nbsp;</strong></p>
<p><img src="https://laptopaz.vn/media/lib/2311_AUSROGStickG1511..jpg" alt=""></p>
<p><em>H&igrave;nh: to&agrave;n bộ hệ thống b&ecirc;n trong ASUS ROG Strix G15&nbsp;</em></p>
<ul>
    <li>2 khe RAM n&acirc;ng cấp tối đa 64GB</li>
    <li>2 khe M.2 NVMe</li>
    <li>Pin: 56Wh</li>
</ul>
<p><strong><strong>TỔNG KẾT:&nbsp;</strong>Năm nay ASUS đ&atilde; cải thiện hơn về phần n&acirc;ng cấp CPU l&ecirc;n Ryzen 7 4800H. Rất th&iacute;ch hợp cho c&aacute;c game thủ chiến c&aacute;c tựa game hiện nay. Quạt chạy tối đa nhưng kh&aacute; y&ecirc;n tĩnh. đặc biệt l&agrave; chiếc m&aacute;y n&agrave;y c&oacute; thể l&agrave;m những c&ocirc;ng việc đồ họa 2D, 3D. Hơn tất cả, chiếc ROG Strix G15 đặc biệt ch&uacute; trọng hơn về ngoại h&igrave;nh, nhỏ gọn, tinh tế hơn.</strong></p>', N'AMD Ryzen R7-4800H (2.9GHz up to 4.2GHz, 8M Cache)', N'8GB DDR4 3200MHz', N'512GB M.2 NVMe PCIe 3.0 SSD', N'NVIDIA GeForce GTX 1650 4GB GDDR6 (55W)', N'15.6 inch FHD (1920 x 1080) IPS. Chống lóa, 144Hz AdaptiveSync.', N'HD 720P', N'nối	 1x Type C USB 3.2   3x USB 3.2 Gen 1 Type-A  1 x HDMI 2.0b  1x 3.5mm Combo Audio Jac', N'2.3 kg', N'4-cell, 56WHrs', N'Windows 10 bản quyền', 0, N'/images/pictures/asus_rog_g513_pic1.jpg', CAST(N'2022-04-09 16:02:42.980' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (55, N'Asus TUF Gaming A15 FA506QR-AZ003T ', 1011, CAST(42000000 AS Decimal(18, 0)), 5, CAST(39900000 AS Decimal(18, 0)), N'[Mới 100%] Asus TUF Gaming A15 FA506QR-AZ003T Ryzen 7-5800H, 16GB, 512GB, RTX 3070, 15.6'''' FHD 240Hz
', N'<div>
    <h3 align="center">Laptop ASUS&nbsp;TUF GAMING A15 hướng đến đối tượng n&agrave;o?</h3>
    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2123_0_2.jpg" alt=""></p>
</div>
<div><strong>1. THIẾT KẾ</strong></div>
<div>&nbsp;</div>
<div>PHONG C&Aacute;CH ẤN TƯỢNG</div>
<div>C&aacute; nh&acirc;n h&oacute;a trải nghiệm của bạn với c&aacute;c t&ugrave;y chọn m&agrave;u sắc X&aacute;m cực chất Eclipse Gray hoặc Đen t&aacute;o bạo Graphite Black. Thiết kế sọc tổ ong ở phần đ&aacute;y v&agrave; c&aacute;c tấm gia cường h&igrave;nh lục gi&aacute;c quanh khung m&aacute;y. C&aacute;c đường cắt tinh tế ở chiếu nghỉ tay gi&uacute;p m&aacute;y tr&ocirc;ng thanh tho&aacute;t v&agrave; chuy&ecirc;n nghiệp.</div>
<div>&nbsp;</div>
<div><img src="https://laptopaz.vn/media/product/2123_0_3.jpg" alt=""></div>
<div>&nbsp;</div>
<div>
    <div><strong>2. HIỆU NĂNG TUYỆT VỜI</strong></div>
    <div>&nbsp;</div>
    <div>CHINH PHỤC MỌI THỬ TH&Aacute;CH</div>
    <div>Lu&ocirc;n sẵn s&agrave;ng cho mọi thử th&aacute;ch, TUF Gaming A15 thực hiện xuất sắc mọi t&aacute;c vụ d&ugrave; l&agrave; chơi game, ph&aacute;t trực tiếp v&agrave; hơn thế nữa. CPU l&ecirc;n đến AMD Ryzen<sup>&trade;</sup> 7 với 8 nh&acirc;n 16 luồng gi&uacute;p đa nhiệm nhanh ch&oacute;ng v&agrave; nhiều t&aacute;c vụ kh&aacute;c. Đồ họa game mượt m&agrave; với GPU GeForce RTX<sup>&trade;</sup> 3070 mới nhất gi&uacute;p mang lại tốc độ khung h&igrave;nh ổn định cho h&agrave;ng ngh&igrave;n tựa game hiện đại. Ổ cứng SSD NVMe PCIe<sup>&reg;</sup> l&ecirc;n đến 1TB si&ecirc;u nhanh gi&uacute;p tăng thời gian tải, đồng thời một khe SSD trống cho ph&eacute;p dễ d&agrave;ng bổ sung dung lượng cho mọi tựa game của bạn.</div>
    <div>&nbsp;</div>
    <div><img src="https://laptopaz.vn/media/product/2123_0_4.jpg" alt=""></div>
    <div>&nbsp;</div>
    <div>
        <div><strong>3. H&Igrave;NH ẢNH</strong></div>
        <div>&nbsp;</div>
        <div>TĂNG TỐC ĐỂ CHIẾN THẮNG</div>
        <div>Chơi game tốc độ cao chuy&ecirc;n nghiệp, m&agrave;n h&igrave;nh tấm nềm IPS với độ phủ m&agrave;u 100% sRGB v&agrave; tần số qu&eacute;t l&ecirc;n đến 240Hz. Với Adaptive-Sync, tần số qu&eacute;t m&agrave;n h&igrave;nh đồng bộ với tốc độ khung h&igrave;nh của GPU để giảm thiểu hiện tượng giật, lag hay x&eacute; h&igrave;nh, mang lại trải nghiệm chơi game si&ecirc;u mượt m&agrave; v&agrave; đắm ch&igrave;m. N&acirc;ng tầm khả năng đa nhiệm bằng c&aacute;ch kết nối m&agrave;n h&igrave;nh thứ hai qua cổng USB 3.2 thế hệ 2 Type-C<sup>&trade;</sup>, được k&iacute;ch hoạt G-SYNC<sup>&reg;</sup> v&agrave; hỗ trợ DisplayPort<sup>&trade;</sup> 1.4. Chơi game, ph&aacute;t video, phim 4K Ultra HD tr&ecirc;n TV m&agrave;n h&igrave;nh lớn với cổng HDMI 2.0b.</div>
        <div>&nbsp;</div>
        <div><img src="https://laptopaz.vn/media/product/2123_0_5.jpg" alt=""></div>
        <div>&nbsp;</div>
        <div>
            <div><strong>4. &Acirc;M THANH</strong></div>
            <div>&nbsp;</div>
            <div>&Acirc;M THANH TRONG TRẺO</div>
            <div>Hai loa với bốn đường cắt cho &acirc;m thanh lớn v&agrave; mạnh mẽ mang đến trải nghiệm &acirc;m thanh đắm ch&igrave;m. DTS:X<sup>&trade;</sup> Ultra cho &acirc;m thanh trung thực, trong trẻo với &acirc;m sắc r&otilde; r&agrave;ng. &Acirc;m thanh v&ograve;m k&ecirc;nh 7.1 cho cảm nhận về kh&ocirc;ng gian trong game tốt hơn, gi&uacute;p bạn định vị đối thủ ch&iacute;nh x&aacute;c. 8 chế độ để nghe nhạc, xem phim v&agrave; chơi game gi&uacute;p tối ưu h&oacute;a trải nghiệm của bạn, đồng thời, bộ c&acirc;n bằng t&iacute;ch hợp sẽ gi&uacute;p bạn t&ugrave;y chỉnh c&agrave;i đặt theo &yacute; muốn.</div>
            <div>&nbsp;</div>
            <div><img src="https://laptopaz.vn/media/product/2123_0_8.jpg" alt=""></div>
            <div>&nbsp;</div>
            <div>
                <div><strong>5. TẢN NHIỆT</strong></div>
                <div>&nbsp;</div>
                <div>LU&Ocirc;N M&Aacute;T MẺ</div>
                <div>Hệ thống tản nhiệt to&agrave;n diện duy tr&igrave; sự bền bỉ của hệ thống v&agrave; k&eacute;o d&agrave;i tuổi thọ thiết bị. Bốn ống đồng v&agrave; ba bộ tản nhiệt gi&uacute;p đẩy nhiệt ra khỏi phần cứng v&agrave; tản nhiệt nhanh ch&oacute;ng, duy tr&igrave; nhiệt độ c&aacute;c th&agrave;nh phần ở mức tối ưu. Thiết kế tối ưu của hệ thống tản nhiệt chống bụi 2.0 đảm bảo hệ thống tản nhiệt của bạn kh&ocirc;ng bị t&iacute;ch tụ bụi hay mảnh vụn gi&uacute;p m&aacute;y hoạt động l&acirc;u d&agrave;i. C&aacute;c chế độ hoạt động được tinh chỉnh c&acirc;n bằng với tốc độ khi &eacute;p xung v&agrave; độ ồn hợp l&yacute; cho t&aacute;c vụ thực hiện c&ugrave;ng l&uacute;c, t&ugrave;y chỉnh theo nhu cầu của bạn.</div>
                <div>&nbsp;</div>
                <div><img src="https://laptopaz.vn/media/product/2123_0_9.jpg" alt=""></div>
                <div>&nbsp;</div>
                <div>
                    <div><strong>6. LINH HOẠT</strong></div>
                    <div>&nbsp;</div>
                    <div>HOẠT ĐỘNG L&Acirc;U V&Agrave; BỀN BỈ HƠN</div>
                    <div>Bạn lu&ocirc;n c&oacute; một chiến binh đ&aacute;nh tin cậy đồng h&agrave;nh ở bất cứ nơi đ&acirc;u. Nhẹ, nhỏ gọn v&agrave; bền bỉ, chiếc laptop n&agrave;y cho ph&eacute;p bạn kết nối với thế giới m&agrave; kh&ocirc;ng phải lo lắng t&igrave;m ổ cắm điện. Bộ vi xử l&yacute; Ryzen<sup>&trade;</sup> tiết kiệm điện năng kết hơp c&ugrave;ng vi&ecirc;n pin khủng 90Wh mang đến thời lượng pin d&agrave;i cả ng&agrave;y với 14,5 giờ ph&aacute;t video, cho ph&eacute;p bạn xem nhiều hơn khi di chuyển. Wi-Fi 6 (802.11ax) tốc độ nhanh v&agrave; ổn định đảm bảo bạn c&oacute; thể kết nối web v&agrave; l&agrave;m việc năng suất ở bất kỳ nơi đ&acirc;u c&oacute; c&aacute;c kết nối tương th&iacute;ch.</div>
                    <div>&nbsp;</div>
                    <div><img src="https://laptopaz.vn/media/product/2123_0_6.jpg" alt=""></div>
                    <div>&nbsp;</div>
                    <div>
                        <div><strong>7. BỀN BỈ</strong></div>
                        <div>&nbsp;</div>
                        <div>ĐỘ BỀN BỈ ĐẠT TI&Ecirc;U CHUẨN QU&Acirc;N ĐỘI</div>
                        <div>Để xứng đ&aacute;ng với t&ecirc;n gọi TUF Gaming, chiếc laptop n&agrave;y phải vượt qua b&agrave;i kiểm tra độ bền chuẩn qu&acirc;n đội MIL-STD-810H về pin. C&aacute;c b&agrave;i kiểm tra cho thiết bị bao gồm thả rơi v&agrave; rung, độ ẩm v&agrave; nhiệt độ cực đoan nhằm đảm bảo m&aacute;y hoạt động ổn định ngay cả trong những điều kiện m&ocirc;i trường khắc nghiệt nhất. A15 thừa sức chống chịu những c&uacute; va đập v&agrave; x&oacute;c nảy trong khi sử dụng h&agrave;ng ng&agrave;y.</div>
                        <div>&nbsp;</div>
                        <div><img src="https://laptopaz.vn/media/product/2123_0_10.jpg" alt=""></div>
                        <div>&nbsp;</div>
                        <div>
                            <div><strong>8. B&Agrave;N PH&Iacute;M</strong></div>
                            <div>&nbsp;</div>
                            <div>TỐI ƯU CHO CHƠI GAME</div>
                            <div>Trang bị cho bạn b&agrave;n ph&iacute;m kiểu m&aacute;y t&iacute;nh để b&agrave;n tối ưu cho hoạt động chơi game. Đ&egrave;n nền RGB đồng bộ cho ph&eacute;p bạn thể hiện c&aacute; t&iacute;nh của m&igrave;nh trong khi ph&iacute;m WASD nổi bật gi&uacute;p bạn dễ d&agrave;ng nh&igrave;n thấy ph&iacute;m để thực hiện c&aacute;c lệnh di chuyển. C&ocirc;ng nghệ Overstroke k&iacute;ch hoạt vị tr&iacute; nhận lệnh cao hơn ở mỗi ph&iacute;m để đem lại tốc độ phản hồi nhanh hơn v&agrave; dễ điều khiển hơn. L&agrave; một sản phẩm TUF thực thụ, mỗi ph&iacute;m c&oacute; độ bền tới 20 triệu lần bấm với độ ch&iacute;nh x&aacute;c v&agrave; tin cậy l&acirc;u d&agrave;i.</div>
                            <div>&nbsp;</div>
                            <div>&nbsp;<img src="https://laptopaz.vn/media/product/2123_0_5.jpg" alt=""></div>
                            <div>&nbsp;</div>
                            <div>
                                <div><strong>9. KHẢ NĂNG N&Acirc;NG CẤP</strong></div>
                                <div>&nbsp;</div>
                                <div>DỄ D&Agrave;NG THỰC HIỆN N&Acirc;NG CẤP</div>
                                <div>N&acirc;ng cấp RAM v&agrave; SSD dễ d&agrave;ng nhờ thiết kế cho ph&eacute;p bạn nhanh ch&oacute;ng tiếp cận khe lắp bộ nhớ v&agrave; khay ổ cứng. Với một chiếc tua v&iacute;t ti&ecirc;u chuẩn, bạn c&oacute; thể dễ d&agrave;ng th&aacute;o v&iacute;t ở đ&aacute;y khung để tiến h&agrave;nh thay đổi theo &yacute; muốn. Một ốc bật mở đặc biệt gi&uacute;p n&acirc;ng một g&oacute;c của tấm đ&aacute;y, cho ph&eacute;p t&aacute;ch rời dễ d&agrave;ng hơn. Nhanh ch&oacute;ng n&acirc;ng cấp hoặc thay thế RAM v&agrave; tăng dung lượng ổ SSD si&ecirc;u nhanh bằng c&aacute;ch th&ecirc;m ổ PCIe<sup>&reg;</sup> thứ hai.</div>
                                <div>&nbsp;</div>
                                <div>&nbsp;<img src="https://laptopaz.vn/media/product/2123_0_3.jpg" alt=""></div>
                                <div>&nbsp;</div>
                                <div>
                                    <div><strong>10. CỔNG KẾT NỐI</strong></div>
                                    <div>&nbsp;</div>
                                    <div>KHẢ NĂNG KẾT NỐI TO&Agrave;N DIỆN</div>
                                    <div>Nhiều cổng kết nối I/O cho ph&eacute;p bạn kết nối với c&aacute;c thiết bị y&ecirc;u th&iacute;ch v&agrave; bắt đầu l&agrave;m việc ở bất kỳ đ&acirc;u. Hai cổng USB 3.2 Type-A cho ph&eacute;p truyền dữ liệu nhanh ch&oacute;ng với một cổng USB 3.2 Type-A bổ sung tạo th&agrave;nh tổng cộng ba cổng cho c&aacute;c thiết bị ngoại vi y&ecirc;u th&iacute;ch. Bluetooth cũng cho ph&eacute;p bạn gh&eacute;p nối chuột, tai nghe v&agrave; c&aacute;c thiết bị tương th&iacute;ch kh&aacute;c để c&oacute; kh&ocirc;ng gian l&agrave;m việc kh&ocirc;ng d&acirc;y, gọn g&agrave;ng hơn. Sử dụng USB 3.2 thế hệ 2 Type-C<sup>&trade;</sup> với DisplayPort<sup>&trade;</sup> 1.4 để kết nối tới m&agrave;n h&igrave;nh G-SYNC<sup>&trade;</sup> si&ecirc;u nhanh cho trải nghiệm chơi game mượt m&agrave;. Truy cập mạng với Wi-Fi 802.11AX (2x2) để c&oacute; thể v&agrave;o mang một c&aacute;ch nhanh ch&oacute;ng v&agrave; ổn định ở bất kỳ đ&acirc;u c&oacute; Wi-Fi.</div>
                                    <div>&nbsp;</div>
                                    <div>&nbsp;<img src="https://laptopaz.vn/media/product/2123_0_4.jpg" alt=""></div>
                                    <div>&nbsp;</div>
                                    <div>
                                        <div>
                                            <div><strong>11. PHẦN MỀM ĐỘC QUYỀN</strong></div>
                                            <div>&nbsp;</div>
                                            <div>TINH CHỈNH V&Agrave; C&Aacute; NH&Acirc;N H&Oacute;A HỆ THỐNG ĐỒNG NHẤT</div>
                                            <div>Armoury Crate hợp nhất chức năng điều khiển hệ thống v&agrave; &aacute;nh s&aacute;ng để đưa những t&ugrave;y chọn c&agrave;i đặt thiết yếu đến ngay trong tầm tay bạn trong một tiện &iacute;ch duy nhất. T&ugrave;y chọn t&ugrave;y biến cho ph&eacute;p bạn c&aacute; nh&acirc;n h&oacute;a hiệu ứng thẩm mỹ, hồ sơ game v&agrave; thay đổi thiết lập &acirc;m thanh theo sở th&iacute;ch. Với Scenario Profiles, bạn c&oacute; thể định nghĩa v&agrave; t&ugrave;y chỉnh sở th&iacute;ch để tự động điều chỉnh hiệu năng v&agrave; c&aacute;c thiết lập kh&aacute;c khi bạn khởi chạy game v&agrave; ứng dụng ưa th&iacute;ch của m&igrave;nh. Ho&agrave;n to&agrave;n kiểm so&aacute;t trải nghiệm c&aacute; nh&acirc;n của bạn.</div>
                                            <div>&nbsp;</div>
                                            <div>&nbsp;<img src="https://laptopaz.vn/media/product/2123_0_2.jpg" alt=""></div>
                                            <div>&nbsp;</div>
                                            <div><strong>Kết Luận:</strong> Với khoản đầu tư khoảng 40 triệu đồng cho Asus TUF Gaming A15 FA506QR-AZ003T sẽ l&agrave; lựa chọn v&ocirc; c&ugrave;ng hợp l&yacute; nếu như bạn c&oacute; thể tận dụng hết những lợi &iacute;ch m&agrave; chiếc laptop n&agrave;y mang lại. Asus TUF Gaming A15 FA506QR-AZ003T hứa hẹn sẽ l&agrave; một người bạn đồng h&agrave;nh, một chợ thủ đắc lực gi&uacute;p bạn sẵn s&agrave;ng t&aacute;c chiến trong cuộc sống.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>', N'AMD Ryzen 7-5800H (3.20GHz up to 4.40GHz, 16MB Cache)', N'16GB(8GBx2) DDR4 3200MHz (2x SO-DIMM slot)', N'512GB PCIE SSD', N'NVIDIA® GeForce RTX™ 3070 8GB GDDR6 (115W+15W)', N'15.6 inch FHD(1920x1080) IPS, Non-Glare, 240Hz AdaptiveSync, Nanoedge', N'HD 720P', N'1 x Type A USB 2.0  1 x Type C USB 3.2 Gen 2  2 x Type A USB 3.2 Gen 1  1 x 3.5mm combo audio jack  1 x HDMI 2.0b  1 x Kensington Lock', N'2.3 kg', N'4cell, 90Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/tuff_a15_r5_pic_1.jpg', CAST(N'2022-04-09 16:05:29.070' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (56, N'Asus ROG Zephyrus G15 GA503QR-HQ093T', 1011, CAST(50000000 AS Decimal(18, 0)), 10, CAST(45000000 AS Decimal(18, 0)), N'[Mới 100%] Asus ROG Zephyrus G15 GA503QR-HQ093T Ryzen 9-5900HS, 16GB, 1TB, RTX 3070, 15.6'''' WQHD 165Hz
', N'<div>
    <h2>Laptop Gaming Asus ROG Zephyrus G15 GA503QR hướng đến đối tượng n&agrave;o?</h2>
    <p><img src="https://laptopaz.vn/media/product/2109_a1c.jpg" alt=""></p>
    <div>
        <p><strong>Laptop Gaming Asus ROG Zephyrus G15 GA503QR-HQ093T</strong> cho ph&eacute;p đưa sức mạnh gaming đỉnh cao của Windows 10 Pro v&agrave;o trong một khung m&aacute;y 1,9kg si&ecirc;u mỏng. Hiệu năng nhanh v&agrave; mượt với CPU AMD Ryzen&trade; 9 5900HS v&agrave; GPU GeForce RTX&trade; 3070 (TGP 80W + 20W Dynamic Boost). M&agrave;n h&igrave;nh gaming WQHD 165Hz/3ms gi&uacute;p c&acirc;n bằng tốc độ với độ n&eacute;t tới từng chi tiết. H&atilde;y c&ugrave;ng laptopAZ đi t&igrave;m hiểu chi tiết hơn về &quot;một vi&ecirc;n ngọc qu&yacute;&quot; c&oacute; sức h&uacute;t v&ocirc; kh&oacute; cưỡng n&agrave;y ngay th&ocirc;i n&agrave;o!</p>
        <p>&nbsp;<img src="https://laptopaz.vn/media/product/2109_a7c.jpg" alt=""></p>
        <h3><strong>THIẾT KẾ NHẸ V&Agrave; SI&Ecirc;U MỎNG</strong></h3>
        <p><strong>ROG Zephyrus G15 GA503QR-HQ093T thiết kế&nbsp;</strong>ma trận dấu chấm bất đối xứng tr&ecirc;n nắp được chế t&aacute;c bằng quy tr&igrave;nh phay CNC ch&iacute;nh x&aacute;c gi&uacute;p tạo ra 8279 lỗ được bố tr&iacute; ho&agrave;n hảo tr&ecirc;n một diện t&iacute;ch bề mặt gọn nhẹ kh&oacute; tin. Lớp m&agrave;ng t&aacute;n sắc tỏa s&aacute;ng từ b&ecirc;n dưới, tăng th&ecirc;m hiệu ứng lấp l&aacute;nh m&agrave; tinh tế khi được &aacute;nh s&aacute;ng chiếu v&agrave;o ở đ&uacute;ng g&oacute;c. Ngo&agrave;i ra, khung m&aacute;y được thi&ecirc;t kế bền bi, bản lề ErgoLift đa năng,&nbsp;chống cong khi chịu &aacute;p lực, để c&oacute; cảm gi&aacute;c chắc chắn hơn khi bạn g&otilde; ph&iacute;m hay mang m&aacute;y t&iacute;nh x&aacute;ch tay tr&ecirc;n tay.</p>
        <p>&nbsp;<img src="https://laptopaz.vn/media/product/2109_a3s.jpg" alt=""></p>
        <h3><strong>HIỆU NĂNG TUYỆT VỜI</strong></h3>
        <p>Chơi game, s&aacute;ng tạo nội dung v&agrave; thực hiện nhiều vi&ecirc;c hơn nữa một c&aacute;ch nhanh ch&oacute;ng với CPU l&ecirc;n đến CPU AMD Ryzen&trade; 9 5900HS 8 nh&acirc;n v&agrave; GPU GeForce RTX&trade; 3080. Thực hiện t&aacute;c vụ nhanh hơn với thời gian tải ngắn hơn với 2 ổ SSD l&ecirc;n tới NVMe PCIe<sup>&reg;</sup>. 2 khe cắm M.2 kết nối trực tiếp với CPU để c&oacute; hiệu năng tối đa v&agrave; c&oacute; thể bổ sung dung lượng lưu trữ l&ecirc;n tới 2TB để bạn c&oacute; thể mang theo bộ sưu tập game v&agrave; danh mục sản phẩm s&aacute;ng tạo ng&agrave;y một đồ sộ của m&igrave;nh.</p>
        <p>&nbsp;<img src="https://laptopaz.vn/media/product/2109_a5s.jpg" alt=""></p>
        <h3><strong>M&Agrave;N H&Igrave;NH SẮC N&Eacute;T TỚI TỪNG CHI TIẾT</strong></h3>
        <p>Chơi game, s&aacute;ng tạo v&agrave; thực hiện nhiều việc hơn nữa với m&agrave;n h&igrave;nh c&oacute; tần số l&agrave;m mới cao, độ ph&acirc;n giải cao mới nhất của ch&uacute;ng t&ocirc;i. Tấm nền l&ecirc;n tới 2K 165Hz/3ms mang tới lợi &iacute;ch tuyệt đối, c&acirc;n bằng ho&agrave;n hảo giữa h&agrave;nh động tốc độ cao với h&igrave;nh ảnh sắc n&eacute;t tới từng chi tiết. Thời gian đ&aacute;p ứng giữa hai mức x&aacute;m 3ms giảm thiểu hiện tượng nh&ograve;e khi chuyển động để c&oacute; thể theo d&otilde;i ch&iacute;nh x&aacute;c mục ti&ecirc;u. C&ocirc;ng nghệ Adaptive-Sync khiến gameplay si&ecirc;u mượt, loại bỏ hiện tượng r&aacute;ch h&igrave;nh v&agrave; giảm thiểu giật h&igrave;nh để c&oacute; trải nghiệm ch&igrave;m đắm hơn.</p>
        <p>&nbsp;<img src="https://laptopaz.vn/media/product/2109_a2s.jpg" alt=""></p>
        <h3><strong>ĐẮM CH&Igrave;M V&Agrave;O &Acirc;M THANH V&Ograve;M</strong></h3>
        <p>S&aacute;u loa được trang bị c&ocirc;ng nghệ Dolby Atmos đưa bạn v&agrave;o trung t&acirc;m của mọi h&agrave;nh động. Hai loa cao tần hướng ra trước truyền &acirc;m thanh thẳng tới bạn để c&oacute; &acirc;m lượng lớn hơn, đồng thời cặp loa trầm triệt ti&ecirc;u lực dưới phần k&ecirc; tay gi&uacute;p c&acirc;n bằng &acirc;m thanh v&agrave; giảm thiểu tiếng vọng kh&ocirc;ng mong muốn. Bật &acirc;m lượng tại c&aacute;c bữa tiệc v&agrave; sự kiện để thưởng thức &acirc;m thanh sống động hơn, lớn hơn.</p>
        <p>&nbsp;<img src="https://laptopaz.vn/media/product/2109_a4s.jpg" alt=""></p>
        <h3><strong>GIAO TIẾP BẰNG GIỌNG N&Oacute;I VỚI &Acirc;M THANH TRONG TRẺO</strong></h3>
        <p>&Acirc;m thanh đầu v&agrave;o cập nhật khiến to&agrave;n bộ &acirc;m thanh khi tr&ograve; chuyện bằng giọng n&oacute;i v&agrave; ph&aacute;t trực tiếp trở n&ecirc;n trong trẻo. Khử tiếng ồn bằng AI hai chiều l&agrave;m r&otilde; &acirc;m thanh xu&ocirc;i d&ograve;ng v&agrave; ngược d&ograve;ng, lọc ra tiếng ồn kh&ocirc;ng mong muốn v&agrave; khiến &acirc;m thanh khi tr&ograve; chuyện bằng giọng n&oacute;i trong trẻo hơn. Mảng hệ thống mic 3D thu kh&ocirc;ng gian &acirc;m thanh rộng hơn để c&oacute; thể tối ưu h&oacute;a cho c&aacute;c t&igrave;nh huống cụ thể như ghi nhạc sống hoặc&nbsp;</p>
        <p>&nbsp;<img src="https://laptopaz.vn/media/product/2109_a1c.jpg" alt=""></p>
        <h3><strong>HỆ THỐNG L&Agrave;M M&Aacute;T TH&Ocirc;NG MINH</strong></h3>
        <p>Triết l&yacute; thiết kế Hệ thống l&agrave;m m&aacute;t th&ocirc;ng minh của ROG kết hợp giữa c&aacute;c t&iacute;nh năng ph&ugrave; hợp với c&agrave;i đặt hệ thống để đảm bảo trải nghiệm tốt nhất theo từng kiểu khung m&aacute;y v&agrave; linh kiện, bất kể bạn đang l&agrave;m g&igrave;. Với ROG Zephyrus G15 GA503QR-HQ093T, keo tản nhiệt kim loại lỏng giữ cho CPU lu&ocirc;n m&aacute;t mẻ. M&ocirc;-đun tản nhiệt tự l&agrave;m sạch vệ sinh bụi bẩn để tăng độ ổn định l&acirc;u d&agrave;i, trong khi đ&oacute; hai quạt Arc Flow quay c&aacute;c c&aacute;nh quạt được thiết kế lại để tạo ra luồng kh&iacute; lưu th&ocirc;ng ấn tượng với tiếng ồn ph&aacute;t ra tối thiểu. Phần mềm ROG Armoury Crate chuyển đổi liền mạch giữa c&aacute;c chế độ vận h&agrave;nh để tối ưu h&oacute;a hiệu năng v&agrave; độ ồn theo từng t&aacute;c vụ.</p>
        <p>&nbsp;<img src="https://laptopaz.vn/media/product/2109_a7c.jpg" alt=""></p>
        <h3><strong>LINH HOẠT LU&Ocirc;N SẴN S&Agrave;NG CHO MỌI T&Aacute;C VỤ</strong></h3>
        <p>Zephyrus G15 GA503QR-HQ093T c&oacute; được sức mạnh c&ugrave;ng sự linh hoạt để l&agrave;m việc mọi l&uacute;c mọi nơi. Pin dung lượng lớn 90Wh c&oacute; nghĩa l&agrave; giảm thời gian phụ thuộc v&agrave;o ổ điện v&agrave; tăng thời gian tự do di chuyển tới bất kỳ đ&acirc;u bạn muốn. Hỗ trợ sạc Type-C 100W gi&uacute;p tăng cường thời lượng pin hơn nữa, gi&uacute;p bạn c&oacute; thể sử dụng sạc dự ph&ograve;ng để c&oacute; thể l&agrave;m việc ở bất kỳ đ&acirc;u. T&iacute;ch hợp Wi-Fi 6 si&ecirc;u nhanh gi&uacute;p kết nối ổn định ở mọi nơi, từ c&aacute;c giảng đường lớn tới c&aacute;c qu&aacute;n c&agrave; ph&ecirc; đ&ocirc;ng đ&uacute;c.</p>
        <p>&nbsp;<img src="https://laptopaz.vn/media/product/2109_a3s.jpg" alt=""></p>
        <h3><strong>B&Agrave;N PH&Iacute;M D&Agrave;NH CHO THI&Ecirc;N T&Agrave;I CHƠI GAME</strong></h3>
        <p>C&aacute;c game thủ sẽ cảm nhận thấy sự th&acirc;n thuộc với bố cục b&agrave;n ph&iacute;m lấy cảm hứng từ m&aacute;y t&iacute;nh để b&agrave;n, với c&aacute;c khối chức năng t&aacute;ch biệt để dễ d&agrave;ng nhận biết, cộng với c&aacute;c ph&iacute;m n&oacute;ng chuy&ecirc;n dụng cho ph&eacute;p dễ d&agrave;ng điều khiển &acirc;m lượng, tắt tiếng microphone v&agrave; phần mềm ROG Armoury Crate. Nhập lệnh qua b&agrave;n ph&iacute;m t&ugrave;y &yacute; với N-key rollover gi&uacute;p đảm bảo từng lượt nhấn được ghi nhận v&agrave; c&aacute;c ph&iacute;m bền bỉ được thiết kế để chịu được 20 triệu lần nhấn.</p>
        <p>&nbsp;<img src="https://laptopaz.vn/media/product/2109_a5s.jpg" alt=""></p>
        <h3><strong>KẾT NỐI LINH HOẠT</strong></h3>
        <p>Một loạt cổng I/O đa dạng của&nbsp;G15 GA503QR-HQ093T cho ph&eacute;p bạn mở rộng thiết lập trong qu&aacute; tr&igrave;nh di chuyển. D&ugrave;ng m&agrave;n h&igrave;nh thứ hai để thao t&aacute;c đa nhiệm hiệu quả hơn với cổng USB-C c&ugrave;ng DisplayPort 1.4. Xem phim 4K UHD tr&ecirc;n m&agrave;n h&igrave;nh lớn hoặc dễ d&agrave;ng kết nối m&aacute;y chiếu qua cổng HDMI 2.0b. Kết nối chuột, b&agrave;n di chuột, m&aacute;y t&iacute;nh bảng vẽ v&agrave; c&aacute;c thiết bị ngoại vi kh&aacute;c để chơi hoặc s&aacute;ng tạo mọi l&uacute;c mọi nơi. Mở rộng dung lượng lưu trữ trong khi di chuyển với khe cắm thẻ micro SD nhanh với tốc độ l&ecirc;n tới 312MB/s. Kh&ocirc;ng cần bộ tiếp hợp với giắc cắm tai nghe 3,5mm t&iacute;ch hợp sẵn.</p>
        <p><img src="https://laptopaz.vn/media/product/2109_a2s.jpg" alt=""></p>
        <p><strong>Tổng Kết:&nbsp;</strong>Quả thật l&agrave; &quot;Tiền n&agrave;o của đấy&quot; - Qu&aacute; kh&oacute; để t&igrave;m được số &iacute;t nhược điểm của chiếc laptop Asus ROG Zephyrus G15 GA503QR, từ hiệu năng cho đến thiết kế chiếc m&aacute;y n&agrave;y quả thật rất đ&aacute;ng đồng tiền b&aacute;t gạo.</p>
    </div>
</div>
<div>
    <div>
        <div>
            <div>
                <div>
                    <div>
                        <div>
                            <div>
                                <div>
                                    <div>
                                        <div><br></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>', N'AMD Ryzen 9-5900HS (3.0GHz up to 4.6GHz, 16MB)', N'16GB(8GB + 8GB[On board]) DDR4 3200MHz (1x SO-DIMM slot)', N'1TB M.2 NVMe™ PCIe® 3.0 SSD', N'NVIDIA® GeForce RTX™ 3070 8GB GDDR6', N'15.6 inch WQHD (2560 x 1440) WV,300NITS,DCI-P3:100%, 165Hz AdaptiveSync, Nanoedge', N'HD 720P', N' 1 x HDMI 2.0b 2 x USB 3.2 thế hệ 2 Type-A 2x USB 3.2 Gen 2 Type-C  1 x cổng LAN RJ45 1x card reader (microSD)', N'1.9 kg', N'4-cell, 90WHrs Li-ion', N'Windows 10 bản quyền', 1, N'/images/pictures/asus_zephyrus_g15_pic_1.jpg', CAST(N'2022-04-09 16:08:52.733' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (57, N'ASUS ROG Strix G17 G712LWS-WB74', 1011, CAST(41000000 AS Decimal(18, 0)), 19, CAST(33210000 AS Decimal(18, 0)), N'[Mới 99%] ASUS ROG Strix G17 G712LWS-WB74 Core i7-10750H, 16GB, 512GB, RTX 2070, 17.3'''' FHD 144Hz
', N'<div>
    <p><strong>Laptop ASUS ROG Strix G17 G712LWS-WB74 Core i7 hướng đến đối tượng n&agrave;o?</strong></p>
    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2099_n3.jpg" alt=""></p>
    <div>
        <div>
            <div>
                <h1>ROG STRIX G17</h1>
                <div>
                    <p>ROG Strix G17 l&agrave; hiện th&acirc;n của thiết kế tinh gọn, mang đến trải nghiệm cốt l&otilde;i tuyệt vời để chơi game nghi&ecirc;m t&uacute;c v&agrave; đa nhiệm tr&ecirc;n Windows 10 Home.&nbsp;Với CPU Intel Core thế hệ thứ 10 mới nhất v&agrave; GPU NVIDIA GeForce, n&oacute; cung cấp sức mạnh FPS cao tận dụng tối đa m&agrave;n h&igrave;nh hiển thị nhanh như chớp</p>
                    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2099_n2.jpg" alt=""></p>
                </div>
            </div>
        </div>
        <div>
            <div>
                <h1>Tăng sức mạnh với thế hệ tiếp theo</h1>
                <div>
                    <p>CPU Intel Core thế hệ thứ 10 mạnh mẽ kết hợp với GPU NVIDIA GeForce cho ph&eacute;p bạn l&agrave;m việc v&agrave; giải tr&iacute; chuy&ecirc;n s&acirc;u.&nbsp;Dung lượng cho tổng số ba ổ SSD c&oacute; nghĩa l&agrave; bạn c&oacute; thể dễ d&agrave;ng mở rộng bộ nhớ của m&igrave;nh v&agrave; mang theo thư viện chương tr&igrave;nh ho&agrave;n chỉnh của bạn ở bất cứ đ&acirc;u.</p>
                    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2099_n1.jpg" alt=""></p>
                </div>
            </div>
        </div>
        <div>
            <div>
                <h1>Tr&ograve; chơi ở tốc độ chuy&ecirc;n nghiệp</h1>
                <div>
                    <p>Tốc độ l&agrave;m mới 144Hz si&ecirc;u nhanh gi&uacute;p luồng h&agrave;nh động nhịp độ nhanh tr&ocirc;ng mượt m&agrave; ho&agrave;n hảo, trong khi thời gian phản hồi từ x&aacute;m sang x&aacute;m 3ms giảm thiểu hiện tượng nh&ograve;e chuyển động để theo d&otilde;i mục ti&ecirc;u ch&iacute;nh x&aacute;c.</p>
                    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2099_n5s.jpg" alt=""></p>
                </div>
            </div>
        </div>
        <div>
            <div>
                <h1>L&agrave;m m&aacute;t th&ocirc;ng minh ROG</h1>
                <div>
                    <p>Triết l&yacute; L&agrave;m m&aacute;t Th&ocirc;ng minh của ROG kết hợp c&aacute;c t&iacute;nh năng ph&ugrave; hợp v&agrave; c&agrave;i đặt hệ thống để đảm bảo trải nghiệm tốt nhất.&nbsp;Hiệu suất được tăng cường nhờ những cải tiến ti&ecirc;n tiến như hợp chất kim loại lỏng tr&ecirc;n CPU v&agrave; lớp vỏ ngo&agrave;i th&ocirc;ng tho&aacute;ng gi&uacute;p giữ mức độ tiếng ồn thấp hơn so với thế hệ trước.</p>
                    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2099_n4.jpg" alt=""></p>
                </div>
            </div>
        </div>
        <div>
            <div>
                <h1>Kết nối to&agrave;n diện</h1>
                <div>
                    <p>Nhận tốc độ truyền nhanh ch&oacute;ng mặt ở tốc độ Gen 2 qua USB 3.2 Type-C với DisplayPort 1.4 hoặc kết nối m&agrave;n h&igrave;nh ROG G-SYNC để chơi game mượt m&agrave; như lụa.&nbsp;Ba cổng Type-A USB 3.2 Gen 1 đ&atilde; sẵn s&agrave;ng cho thiết bị chơi game y&ecirc;u th&iacute;ch của bạn, trong khi HDMI 2.0b cho ph&eacute;p bạn thưởng thức nội dung tr&ecirc;n m&agrave;n h&igrave;nh 4K hoặc TV ở tốc độ rất cao.</p>
                    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2099_n6.jpg" alt=""></p>
                </div>
            </div>
        </div>
        <div>
            <div>
                <h1>Wi-Fi đ&aacute;ng tin cậy</h1>
                <div>
                    <p>Intel Wi-Fi 6 cực nhanh với Gig + (802.11ax) cho ph&eacute;p bạn chơi game ở tốc độ mạng LAN một c&aacute;ch đ&aacute;ng tin cậy ở bất kỳ nơi n&agrave;o c&oacute; kết nối tương th&iacute;ch.&nbsp;Wi-Fi 6 (Gig +) cho ph&eacute;p băng th&ocirc;ng giao diện cao nhất l&ecirc;n đến 2,4Gbps. *</p>
                    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2099_n3.jpg" alt=""></p>
                    <p><strong>Tổng Kết:&nbsp;</strong>Về cấu h&igrave;nh thiết kế v&agrave; hiệu năng về chiếc m&aacute;y n&agrave;y kh&ocirc;ng thể b&agrave;n c&atilde;i, v&agrave; t&ocirc;i tin chắc rằng nếu bạn c&oacute; thể tận dụng hết điểm mạnh của Rog Strix G712 th&igrave; bạn sẽ nhận được một m&oacute;n &quot;lời&quot; rất lớn khi đ&atilde; s&aacute;ng suốt đầu tư v&agrave;o chiếc m&aacute;y n&agrave;y.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <div>
        <div>
            <div>
                <div>
                    <div>
                        <div>
                            <div>
                                <div>
                                    <div><br></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>', N'Intel® Core™ i7-10750H', N'16GB DDR4 Bus 2933 MHz', N'512GB PCIe SSD', N'NVIDIA GeForce RTX 2070 Max-Q', N'17.3 inch Full HD 1920x1080 IPS-Type Display, 144Hz/3ms', N'HD 720P', N'1x Audio Jack 1x Ethernet Port 1x HDMI 3x Type A USB 3.2 Gen 1 1x Type C USB 3.2 Gen 2 with Display Port', N'2.8 kg', N'6 hours', N'Windows 10 bản quyền', 1, N'/images/pictures/asus_g17_pic_!.jpg', CAST(N'2022-04-09 16:10:58.490' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (58, N' Asus TUF Gaming F15 FX506HC', 1011, CAST(26000000 AS Decimal(18, 0)), 4, CAST(24960000 AS Decimal(18, 0)), N'[Mới 100%] Asus TUF Gaming F15 FX506HC (Core i5-11400H, 8GB, 512GB, RTX 3050, 15.6″ FHD 144Hz)
', N'<div>
    <p><strong>Laptop&nbsp;Asus TUF Gaming F15 FX506HC d&agrave;nh cho ai?</strong></p>
    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2059_a2.jpg" alt=""></p>
    <p>Nếu bạn l&agrave; một chiến binh thực thụ th&igrave; chắc chắn bạn sẽ kh&ocirc;ng ngạc nhi&ecirc;n khi cho rằng chiếc laptop Asus TUF Gaming F15 FX506HC với CPU Intel Core i5-11400H v&agrave; GPU GeForce RTX&trade; 3050 mới nhất l&agrave; trợ thủ đắc lực v&agrave; kh&oacute; m&agrave; thể thay thế với khoản đầu tư trong ph&acirc;n kh&uacute;c 25 triệu đồng. H&atilde;y c&ugrave;ng <a href="https://laptopaz.vn/" title="https://laptopaz.vn/">LaptopAZ</a> đi t&igrave;m hiểu chi tiết chiếc m&aacute;y đang c&oacute; độ &quot;Hot&quot; hơn cả thời tiết 40 độ ở H&agrave; Nội trong b&agrave;i viết nh&eacute;!</p>
    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2059_a4.png" alt=""></p>
    <p>Asus TUF F15 FX506HC sẽ thay đổi c&aacute;ch bạn nh&igrave;n v&agrave;o laptop chơi game. Được trang bị phần cứng ấn tượng, thiết kế gọn nhưng mạnh mẽ. Trang bị&nbsp;CPU i5 11400H, hỗ trợ ram tối đa 32GB, VGA RTX 30 series, m&agrave;n h&igrave;nh&nbsp;IPS 144Hz&nbsp;với b&agrave;n ph&iacute;m c&oacute; đ&egrave;n nền RGB.</p>
    <p>Asus TUF F15 FX506HC c&oacute; b&agrave;n ph&iacute;m chuy&ecirc;n dụng&nbsp;chơi game với c&aacute;c ph&iacute;m&nbsp;RGB-backlit, cụm ph&iacute;m&nbsp;WASD&nbsp;nổi bật v&agrave; c&ocirc;ng nghệ&nbsp;Overstroke&nbsp;để thao t&aacute;c nhanh v&agrave; ch&iacute;nh x&aacute;c.&nbsp;Với m&agrave;n h&igrave;nh&nbsp;NanoEdge IPS&nbsp;cấp độ ti&ecirc;n tiến, v&agrave; độ bền được chứng nhận kiểm tra&nbsp;MIL-STD-810G.&nbsp;Sẽ&nbsp;mang đến trải nghiệm chơi game phong ph&uacute; mọi l&uacute;c mọi nơi!</p>
    <h3>&nbsp;<img src="https://laptopaz.vn/media/product/2059_a1.jpg" alt=""></h3>
    <h3>Tối ưu h&oacute;a hiển thị với m&agrave;n h&igrave;nh viền mỏng IPS NANOEDGE.</h3>
    <p>Thiết kế m&agrave;n h&igrave;nh&nbsp;NanoEdge&nbsp;mới với viền mỏng chỉ 6.5mm, khung m&aacute;y nhỏ gọn hơn nhưng kh&ocirc;ng l&agrave;m giảm k&iacute;ch thước khung h&igrave;nh.&nbsp;Asus TUF F15 FX506HC sở hữu m&agrave;n h&igrave;nh&nbsp;IPS-level&nbsp;gi&uacute;p tạo ra c&aacute;c h&igrave;nh ảnh cực r&otilde; n&eacute;t. Độ phủ m&agrave;u&nbsp;sRGB&nbsp;đạt&nbsp;63%&nbsp;v&agrave; g&oacute;c nh&igrave;n rộng đảm bảo m&agrave;u sắc sống động v&agrave; ch&acirc;n thực nhất.</p>
    <h3>&nbsp;<img src="https://laptopaz.vn/media/product/2059_a3.jpg" alt=""></h3>
    <h3>Độ Bền Chuẩn Qu&acirc;n Đội</h3>
    <p>The Ultimate Force&nbsp;(Lực Lượng Qu&acirc;n Đội Tinh Nhuệ ) vượt qua h&agrave;ng loạt c&aacute;c thử nghiệm&nbsp;MIL-STD-810G&nbsp;nghi&ecirc;m ngặt. C&aacute;c b&agrave;i test trong c&aacute;c điều kiện kh&aacute;c nhau bao gồm phơi nhiễm bức xạ mặt trời, độ cao v&agrave; nhiệt độ cực cao.</p>
    <p>Asus TUF&nbsp;F15 FX506HC được chứng nhận để chịu đựng việc sử dụng h&agrave;ng ng&agrave;y. D&ugrave; l&agrave; bạn cố t&igrave;nh hoặc v&ocirc; t&igrave;nh va chạm hay rơi rớt. Độ bền của chiếc laptop n&agrave;y đ&atilde; được đẩy tới giới hạn để đảm bảo tốt nhất cho game thủ n&oacute;ng t&iacute;nh hay cho laptop &ldquo;ăn h&agrave;nh&rdquo;&nbsp;mỗi khi thua game.</p>
    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2059_a6.png" alt=""></p>
    <h3>B&agrave;n Ph&iacute;m HYPERSTRIKE</h3>
    <p>Sở hữu h&agrave;nh tr&igrave;nh ph&iacute;m&nbsp;1.8 mm&nbsp;với&nbsp;20 triệu&nbsp;lần nhấn,&nbsp;đủ cho nhiều năm l&agrave;m việc v&agrave; chơi game. B&agrave;n ph&iacute;m c&oacute; t&iacute;nh năng&nbsp;RGB-backlighting&nbsp;v&agrave; được điều khiển th&ocirc;ng qua&nbsp;TUF Aura Core&nbsp;để bạn c&oacute; thể thể hiện phong c&aacute;ch độc đ&aacute;o của ri&ecirc;ng m&igrave;nh.</p>
    <p>C&ocirc;ng nghệ&nbsp;Overstroke&nbsp;v&agrave;&nbsp;HyperStrike&nbsp;độc quyền đảm bảo việc đ&aacute;nh m&aacute;y nhanh hơn, ch&iacute;nh x&aacute;c hơn. Lấy cảm hứng từ m&aacute;y t&iacute;nh để b&agrave;n với nh&oacute;m ph&iacute;m&nbsp;WASD&nbsp;được thiết kế kh&aacute;c với những ph&iacute;m c&ograve;n lại. Keycap được thiết kế để kh&ocirc;ng gian ph&iacute;m rộng hơn gi&uacute;p thao t&aacute;c giữa c&aacute;c ph&iacute;m dễ v&agrave; trơn tru hơn.</p>
    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2059_a1.jpg" alt=""></p>
    <h3>C&ocirc;ng Nghệ HYPERCOOL</h3>
    <p>C&ocirc;ng nghệ&nbsp;HyperCool&nbsp;độc quyền của ASUS bao gồm hệ thống&nbsp;Anti-Dust Cooling. Bạn c&oacute; thể t&ugrave;y chỉnh 3 chế độ quạt kh&aacute;c nhau. Đặc biệt c&ocirc;ng nghệ&nbsp;Fan Overboost&nbsp;đảm bảo nhiệt độ ổn định trong khi chơi game nặng.</p>
    <p>Với thiết kế 2 quạt&nbsp;tản nhiệt độc lập để&nbsp;l&agrave;m m&aacute;t&nbsp;CPU&nbsp;v&agrave;&nbsp;GPU&nbsp;ri&ecirc;ng biệt. Quạt l&agrave;m m&aacute;t cũng được cải thiện bởi nắp h&igrave;nh thang tản nhiệt hơn l&ecirc;n đến 25% với quạt th&ocirc;ng thường.</p>
    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2059_a4.png" alt=""></p>
    <h3>&Acirc;m Thanh V&ograve;m &ndash; Surround Sound</h3>
    <p>Asus TUF Gaming F15 FX506HC&nbsp;được t&iacute;ch hợp c&ocirc;ng nghệ&nbsp;DTS Headphone: X&trade;&nbsp;cho trải nghiệm &acirc;m thanh v&ograve;m&nbsp;giả lập 7.1&nbsp;tr&ecirc;n tai nghe. Chất lượng&nbsp;&acirc;m thanh ch&acirc;n thật như đưa người nghe nhập vai v&agrave;o tr&ograve; chơi.</p>
    <p>Ngo&agrave;i ra n&oacute;&nbsp;c&oacute; t&iacute;nh năng c&agrave;i đặt tối ưu cho tr&ograve; chơi, &acirc;m nhạc, phim ảnh hay thể thao. T&ugrave;y biến tinh chỉnh Equalizer gi&uacute;p mang lại cho người d&ugrave;ng trải nghiệm &acirc;m thanh tốt nhất.</p>
    <h3><img src="https://laptopaz.vn/media/product/2059_a5.jpg" alt=""></h3>
    <h3>Phần Mềm Hỗ Trợ Độc Quyền</h3>
    <p>TUF Gaming Armory Crate&nbsp;đặt tất cả hệ thống kiểm tra, th&ocirc;ng tin v&agrave; điều khiển LED b&agrave;n ph&iacute;m trong một app duy nhất. Bạn c&oacute; thể dễ d&agrave;ng thay đổi c&agrave;i đặt cũng như thiết lập tối đa bốn cấu h&igrave;nh tr&ograve; chơi. Ch&uacute;ng sẽ tự động điều chỉnh khi bạn khởi chạy c&aacute;c tựa game y&ecirc;u th&iacute;ch của m&igrave;nh. C&aacute;c t&ugrave;y chọn n&agrave;y chỉ l&agrave; khởi đầu cho những g&igrave; sẽ trở th&agrave;nh một c&ocirc;ng cụ linh hoạt hơn nữa.</p>
    <p>&nbsp;<img src="https://laptopaz.vn/media/product/2059_a6.png" alt=""></p>
    <p><strong>Kết luận</strong>: Asus TUF Gaming F15 FX506HC l&agrave; một trong những sự lựa chọn h&agrave;ng đầu của d&ograve;ng m&aacute;y Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng kh&ocirc;ng k&eacute;m phần tinh tế, kết hợp c&ugrave;ng cấu h&igrave;nh mạnh mẽ v&agrave; tản nhiệt m&aacute;t mẻ, Asus TUF Gaming F15 FX506HC tự tin c&oacute; thể chinh phục được đa số c&aacute;c Game Online, Offline thời thượng hiện nay. Hơn thế nữa Asus TUF Gaming F15 FX506HC cũng đủ sức đ&aacute;p ứng c&aacute;c t&aacute;c vụ thiết kế đồ họa, c&ocirc;ng việc, giải tr&iacute; một c&aacute;ch mượt m&agrave; nhất.&nbsp;</p>
</div>
<div>
    <div>
        <div>
            <div>
                <div>
                    <div>
                        <div>
                            <div>
                                <div><br></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>', N'Intel® Core™ i5-11400H (2.70GHz up to 4.50GHz, 12MB Cache)', N'8GB DDR4 3200MHz (2x SO-DIMM slot)', N'512GB PCIE SSD', N'NVIDIA® GeForce® RTX 3050 4GB GDDR6', N'15.6 inch FHD(1920 x 1080) IPS, Non-Glare, 144Hz AdaptiveSync, Nanoedge', N'HD 720P', N'1 x Type A USB 2.0 1 x Type C USB 3.2 Gen 2 2 x Type A USB 3.2 Gen 1 1 x 3.5mm combo audio jack 1 x HDMI 2.0b 1 x Kensington Lock', N'2.3 kg', N'3 cell,  48WHrs', N'Windows 10 bản quyền', 0, N'/images/pictures/asus_tuf_f15_506hcb_pic_1.jpg', CAST(N'2022-04-09 16:13:27.800' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (59, N'Asus TUF Dash F15 FX516PE-HN005T', 1011, CAST(29000000 AS Decimal(18, 0)), 9, CAST(26390000 AS Decimal(18, 0)), N'[Mới 100%] Asus TUF Dash F15 FX516PE-HN005T Core i7-11370H, 8GB, 512GB, RTX 3050Ti, 15.6″ FHD 144Hz
', N'<div>
    <h2>ASUS TUF Dash F15 FX516PE-HN005T&nbsp;d&agrave;nh cho ai?<img src="https://laptopaz.vn/media/lib/2011_g6.jpg" alt=""></h2>
    <h2>ASUS TUF Dash F15 FX516PE-HN005TASUS</h2>
    <p>&nbsp;l&agrave; một chiếc laptop gaming hạng nặng với bộ vi xử l&yacute; Intel i7 Gen 11 mới nhất kết hợp với GPU Nvidia RTX 3050Ti mới nhất v&agrave; một thiết lập &acirc;m thanh tổng thể tuyệt vời.&nbsp;</p>
    <p>Trong thời điểm hiện nay việc t&igrave;m mua được một chiếc card RTX 3000 cho PC cũng kh&aacute; l&agrave; kh&oacute; khăn nhưng <strong>TUF Dash 15 2021</strong> sẽ l&agrave; một lựa chọn ho&agrave;n hảo. C&ugrave;ng m&igrave;nh trải nghiệm review ASUS TUF Gaming Dash F15 n&agrave;y nh&eacute;.&nbsp;</p>
    <p><img src="https://laptopaz.vn/media/lib/2011_g5.png" alt=""></p>
    <h2>Thiết kế của ASUS TUF DASH<strong>&nbsp;</strong></h2>
    <p>Thiết kế được thay đổi ho&agrave;n to&agrave;n so với những người anh em trước đ&oacute; thuộc d&ograve;ng <strong>TUF Gaming</strong>. Bề ngo&agrave;i g&oacute;c cạnh c&ugrave;ng m&agrave;u&nbsp;Eclipse Gray tạo cảm gi&aacute;c chắc chắn v&agrave; đậm chất gaming.</p>
    <p><strong>B&agrave;n ph&iacute;m&nbsp;</strong></p>
    <p>B&agrave;n ph&iacute;m được thiết kế kh&aacute; nhỏ gọn chắc chắn v&agrave; mang một <strong>m&agrave;u xanh lam</strong> cực ngầu. Việc bố tr&iacute; kh&ocirc;ng gian giữa b&agrave;n ph&iacute;m v&agrave; c&aacute;c ph&iacute;m chức năng kh&aacute; hợp l&yacute; n&ecirc;n khi sử dụng sẽ cho cảm gi&aacute;c thoải m&aacute;i v&agrave; dễ thở.&nbsp;</p>
    <div>
        <p><img src="https://laptopaz.vn/media/lib/2011_g4.jpg" alt=""></p>
    </div>
    <h2>Th&ocirc;ng số kỹ thuật của&nbsp;ASUS TUF Gaming Dash F15</h2>
    <p>Khi n&oacute;i đến CPU v&agrave; GPU của <strong>ASUS TUF Dash Gaming F15 FX516PE-HN005T</strong> bạn c&oacute; thể hiểu r&otilde; l&yacute; do tại sao h&atilde;ng lại thiết kế một lớp vỏ cứng c&aacute;p v&agrave; đ&acirc;y l&agrave; điều cần thiết để bảo vệ bộ m&aacute;y b&ecirc;n trong. TUF Dash F15 đi k&egrave;m với bộ vi xử l&yacute; <strong>Intel Core i7 thế hệ 11</strong> kết hợp c&ugrave;ng <strong>RTX 3000 Series</strong> mạnh mẽ đến từ nh&agrave; NVIDIA. RAM 16GB DDR4 với tốc độ 3200MHz, với th&ocirc;ng số n&agrave;y TUF Dash F15 c&oacute; thể xử l&yacute; những tr&ograve; chơi đ&ograve;i hỏi nhiều năng lượng v&agrave; đ&ograve;i hỏi cao nhất (hoặc những tựa game được tối ưu h&oacute;a k&eacute;m như Cyberpunk 2077).</p>
    <p>&nbsp;<img src="https://laptopaz.vn/media/lib/2011_g3.png" alt=""></p>
    <h2>M&agrave;n h&igrave;nh v&agrave; đồ hoạ ASUS TUF DASH 15</h2>
    <p><strong>ASUS TUF Dash 15</strong> được trang bị m&agrave;n h&igrave;nh 15.6 inch FullHD, c&ocirc;ng nghệ chống ch&oacute;i với Adaptive-Sync, tốc độ l&agrave;m tươi của m&agrave;n h&igrave;nh sẽ đồng bộ h&oacute;a với tốc độ khung h&igrave;nh của GPU để giảm độ trễ, giảm thiểu giật h&igrave;nh v&agrave; loại bỏ hiện tượng x&eacute; h&igrave;nh cho trải nghiệm chơi game cực mượt.</p>
    <p><img src="https://laptopaz.vn/media/lib/2011_g2.png" alt=""></p>
    <p><strong>Hiệu suất GPU v&agrave; CPU TUF DASH F15</strong></p>
    <p>BATTLEFIELD V,GHOSTRUNNER,METRO EXODUS,CINEBENCH.</p>
    <p>Những th&agrave;nh t&iacute;ch kh&aacute; ấn tượng n&agrave;y c&oacute; được nhờ v&agrave;o ổ lưu trữ <strong>NVMe</strong> - tốc độ đọc / ghi tuyệt vời v&agrave; thời gian tải game cực ngắn. (Nguồn tham khảo từ Techthelead)</p>
    <p>&nbsp;<img src="https://laptopaz.vn/media/lib/2011_g6.jpg" alt=""><img src="https://laptopaz.vn/media/product/2011_7.jpg" alt=""></p>
    <p><strong>&Acirc;m thanh TUF DASH F15</strong></p>
    <p><strong>TUF Dash 15</strong> thực sự ấn tượng v&agrave; mạnh mẽ cả về đồ họa, &acirc;m thanh, chiếc laptop gaming n&agrave;y đi k&egrave;m với <strong>DTS: X Ultra</strong> đ&acirc;y l&agrave; codec &acirc;m thanh dựa tr&ecirc;n đối tượng, nhằm mục đ&iacute;ch tạo ra &acirc;m thanh đa chiều &ldquo;di chuyển xung quanh bạn như trong cuộc sống thực&rdquo;. Độ mạnh của t&iacute;n hiệu gần như tăng gấp đ&ocirc;i, với c&aacute;c &acirc;m cao trở n&ecirc;n sắc n&eacute;t v&agrave; chi tiết hơn, trượt mượt m&agrave; xuống c&aacute;c tần số thấp.</p>
    <p><img src="https://laptopaz.vn/media/lib/2011_g5.png" alt=""></p>
    <p><img src="https://laptopaz.vn/media/product/2011_6.jpg" alt=""></p>
    <h2>Cổng kết nối v&agrave; hệ thống tản nhiệt</h2>
    <p><strong>Dash&nbsp;Gaming F15</strong> cũng kh&ocirc;ng tiết kiệm kết nối. C&oacute; một cổng <strong>Thunderbolt 4</strong> với tốc độ gấp 4 lần USB 3.1 bạn c&oacute; thể kết nối n&oacute; với hầu hết mọi thiết bị. C&oacute; 3 cổng USB 3.1 ở cả hai mặt của vỏ m&aacute;y, c&ugrave;ng với cổng HDMI, Ethernet v&agrave; giắc cắm 3,5 mm. Phần tản nhiệt với c&ocirc;ng nghệ tự l&agrave;m sạch được đặt sau mặt của vỏ m&aacute;y để giữ cho luồng kh&ocirc;ng kh&iacute; lu&ocirc;n m&aacute;t mẻ v&agrave; kh&ocirc;ng b&aacute;m bụi ở c&aacute;nh quạt v&agrave; th&agrave;nh ống dẫn nhiệt.</p>
    <p><img src="https://laptopaz.vn/media/lib/2011_g3.png" alt=""></p>
    <p>Nh&igrave;n chung, nếu như bạn đang t&igrave;m kiếm m&aacute;y t&iacute;nh để b&agrave;n với cấu h&igrave;nh mạnh để chiến mọi tựa game th&igrave; <strong>TUF Dash 15 2021</strong> l&agrave; một sự lựa chọn ho&agrave;n hảo d&agrave;nh cho mọi game thủ.<strong>&nbsp;</strong></p>
</div>
<div>
    <div>
        <div>
            <div>
                <div>
                    <div>
                        <div>
                            <div><br></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>', N'Intel® Core™ i7-11370H', N'8GB DDR4 3200Mhz', N'512GB M.2 PCIe NVMe 3.0', N'NVIDIA GeForce RTX 3050Ti 4GB GDDR6', N'15.6 inch FHD (1920x1080) 16:9, 144Hz, 250nits, 1000:1, 62.5% sRGB', N'No Webcam', N'1x Type C USB 4 with Power Delivery, Display Port and Thunderbolt™ 4 3x USB 3.2 Gen 1 Type-A 1x HDMI 2.0b 1x RJ45 1x 3.5mm Combo Audio Jack', N'2 kg', N'4Cell 76Whr', N'Windows 10 Home bản quyền', 0, N'/images/pictures/asus_tuf_dash_pic_1.jpg', CAST(N'2022-04-09 16:15:56.057' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (60, N'ASUS ROG STRIX G17 (2021) G713QR-ES96', 1011, CAST(53000000 AS Decimal(18, 0)), 10, CAST(47700000 AS Decimal(18, 0)), N'[Mới 100%] ASUS ROG STRIX G17 (2021) G713QR-ES96 (Ryzen 9-5900HX, 16GB, 1TB SSD, RTX 3070, 17.3'''' FHD 300Hz)
', N'<div>
    <p>Laptop ASUS ROG STRIX G17 (2021) hướng đến đối tượng n&agrave;o?</p>
    <p>Nếu bạn đang t&igrave;m kiếm một chiếc laptop vừa thực hiện c&aacute;c t&aacute;c vụ l&agrave;m việc hiệu quả, m&agrave; lại c&oacute; thể trải nghiệm những ph&uacute;t gi&acirc;y đầy th&iacute;ch th&uacute; trong c&aacute;c trận đấu game để thư gi&atilde;n sau những giờ l&agrave;m việc căng thẳng, th&igrave; bạn kh&ocirc;ng thể bỏ qua chiếc laptop ASUS ROG STRIX G17 (2021) G713QR-ES96. H&atilde;y c&ugrave;ng LaptopAZ đi t&igrave;m hiểu chi tiết nh&eacute;!</p>
    <p><br></p>
    <p>&nbsp;</p>
    <p><br></p>
    <p>Cấu h&igrave;nh mạnh - chiến mượt mọi tựa game</p>
    <p>Được t&iacute;ch hợp chip xử l&yacute; AMD Ryzen 9-5900HX Asus Rog mang lại hiệu năng cao, n&acirc;ng cấp về tốc độ xử l&yacute; v&agrave; tiết kiệm điện với 8 nh&acirc;n, 16 luồng, c&oacute; tần số cơ bản l&agrave; 3.3 GHz v&agrave; đạt tới xung nhịp tối đa l&agrave; 4.6 GHz. Bạn c&oacute; thể trải nghiệm l&agrave;m việc hiệu quả đ&aacute;p ứng c&aacute;c nhu cầu từ c&ocirc;ng việc văn ph&ograve;ng cơ bản đến c&aacute;c c&ocirc;ng việc về thiết kế đồ họa v&agrave; chơi game thoải m&aacute;i.</p>
    <p><br></p>
    <p>&nbsp;</p>
    <p><br></p>
    <p>Với RAM 16 GB DDR4 c&oacute; tr&ecirc;n m&aacute;y đủ sức chạy đa nhiệm mượt m&agrave;, bạn c&oacute; thể vừa nghe nhạc tr&ecirc;n YouTube vừa chơi game hoặc thiết kế tr&ecirc;n c&aacute;c phần mềm m&agrave; kh&ocirc;ng lo giật lag, đứng m&aacute;y. Nếu bạn thấy cấu h&igrave;nh chưa đủ mượt để l&agrave;m việc đa nhiệm th&igrave; Asus Rog cũng hỗ trợ khe RAM trống để bạn n&acirc;ng cấp RAM tối đa đến 32 GB.</p>
    <p><br></p>
    <p><br></p>
    <p><br></p>
    <p>B&ecirc;n cạnh đ&oacute;, m&aacute;y c&ograve;n được trang bị card đồ họa rời NVIDIA GeForce RTX 3070 8GB cho khả năng xử l&yacute; đồ họa mượt m&agrave; với c&aacute;c ứng dụng thiết kế Premiere, Photoshop,... hay chinh phục c&aacute;c tựa game nặng hot, y&ecirc;u cầu đồ họa cao như PUBG, Far Cry 5, Battlefield Company 2,&hellip; ở mức c&agrave;i đặt đồ họa từ trung b&igrave;nh đến cao.</p>
    <p><br></p>
    <p>&nbsp;</p>
    <p><br></p>
    <p>Ổ cứng 1 TB SSD M.2 PCIe, hỗ trợ khe cắm SSD M.2 PCIe cho bạn kh&ocirc;ng gian cực kỳ rộng lớn để lưu trữ phim ảnh hay c&aacute;c tựa game y&ecirc;u th&iacute;ch, c&aacute;c file t&agrave;i liệu nặng m&agrave; kh&ocirc;ng lo đầy bộ nhớ. Ổ cứng SSD n&agrave;y sẽ cho laptop tốc độ phản hồi cực nhanh qua c&aacute;c click chuột hay khởi động m&aacute;y, mở c&aacute;c ứng dụng một c&aacute;ch nhanh ch&oacute;ng.</p>
    <p><br></p>
    <p>&nbsp;</p>
    <p><br></p>
    <p>Thiết kế gọn g&agrave;ng nhưng đầy phong c&aacute;ch</p>
    <p>Được thiết kế theo xu hướng hiện đại to&aacute;t l&ecirc;n phong c&aacute;ch mạnh mẽ, laptop Asus Rog đ&atilde; thể hiện được vẻ cool ngầu của m&igrave;nh bởi c&aacute;c đường cắt v&agrave; biểu tượng tinh tế t&ocirc; điểm b&ecirc;n ngo&agrave;i. Tuy l&agrave; một chiếc laptop gaming nhưng c&acirc;n nặng của m&aacute;y kh&ocirc;ng qu&aacute; nặng, chỉ 2.7 kg v&agrave; c&oacute; độ d&agrave;y 27.5 mm, dễ d&agrave;ng cất gọn để di chuyển v&agrave; l&agrave;m việc mọi nơi.</p>
    <p><br></p>
    <p><br></p>
    <p><br></p>
    <p>Đặc biệt, với vi&ecirc;n pin 90Wh đủ cho bạn cả một ng&agrave;y d&agrave;i l&agrave;m việc. Laptop c&ograve;n được trang bị đầy đủ c&aacute;c cổng kết nối: 2 cổng USB 3.2, HDMI, LAN (RJ45), USB Type-C cho tốc độ truyền dữ liệu si&ecirc;u nhanh v&agrave; kết nối dễ d&agrave;ng với m&agrave;n h&igrave;nh phụ. M&aacute;y c&oacute; c&aacute;c chuẩn kết nối kh&ocirc;ng d&acirc;y như Bluetooth 5.1, Wi-Fi 6 AX201 đem đến sự kết nối mạng ổn định, xem Netflix hay chơi game online, truy xuất t&igrave;m kiếm dữ liệu nhanh ch&oacute;ng.&nbsp;</p>
    <p><br></p>
    <p><br></p>
    <p><br></p>
    <p>Kh&ocirc;ng chỉ vậy, laptop Asus c&ograve;n trang bị đ&egrave;n nền được t&iacute;ch hợp đ&egrave;n LED RGB gi&uacute;p bạn dễ d&agrave;ng t&ugrave;y chỉnh m&agrave;u b&agrave;n ph&iacute;m, tăng trải nghiệm chơi game cho c&aacute;c game thủ. C&aacute;c ph&iacute;m chức năng gi&uacute;p nhận diện trực quan v&agrave; c&aacute;c ph&iacute;m n&oacute;ng chuy&ecirc;n dụng để truy cập nhanh c&aacute;c lệnh thiết yếu với khoảng c&aacute;ch hợp l&yacute; 1.9 mm.</p>
    <p><br></p>
    <p><br></p>
    <p><br></p>
    <p>Nhờ v&agrave;o khả năng l&agrave;m m&aacute;t tối ưu của quạt Arc Flow, bộ tản nhiệt của con laptop n&agrave;y v&ocirc; c&ugrave;ng y&ecirc;n tĩnh dưới 45 dB khi ở chế độ Turbo. C&aacute;c quạt k&eacute;p c&aacute;nh chữ N để tăng cường lưu th&ocirc;ng kh&iacute;, đồng thời c&aacute;c c&aacute;nh tản nhiệt si&ecirc;u mỏng gi&uacute;p mở rộng diện t&iacute;ch bề mặt tho&aacute;t nhiệt nhờ v&agrave;o 83 c&aacute;nh quạt.</p>
    <p><br></p>
    <p>&nbsp;</p>
    <p><br></p>
    <p>Mượt m&agrave; hơn bao giờ hết với m&agrave;n h&igrave;nh Full HD</p>
    <p>Nhờ sở hữu m&agrave;n h&igrave;nh cực lớn 17.3 inch với độ ph&acirc;n giải Full HD, laptop mang đến cho bạn một sự kh&aacute;c biệt trong những trận chiến game bởi m&agrave;n h&igrave;nh v&ocirc; c&ugrave;ng sắc n&eacute;t, gi&uacute;p bạn trải nghiệm được kh&ocirc;ng gian cực kỳ th&uacute; vị. Ngo&agrave;i ra, tấm nền IPS sẽ gi&uacute;p t&aacute;i hiện h&igrave;nh ảnh r&otilde; r&agrave;ng, m&agrave;u sắc ch&iacute;nh x&aacute;c với g&oacute;c nh&igrave;n rộng l&ecirc;n đến 178 độ.</p>
    <p><br></p>
    <p>&nbsp;</p>
    <p><br></p>
    <p>B&ecirc;n cạnh đ&oacute;, nhờ tần số qu&eacute;t 300Hz, laptop Asus cho ph&eacute;p người chơi theo kịp chuyển động của game mượt m&agrave; như ngo&agrave;i đời thực. Từ đ&oacute;, bạn sẽ dễ d&agrave;ng đưa c&aacute;c kỹ năng của m&igrave;nh l&ecirc;n một tầm cao mới. Laptop c&ograve;n trang bị c&ocirc;ng nghệ chống ch&oacute;i Anti Glare gi&uacute;p giảm thiểu t&igrave;nh trạng m&agrave;n h&igrave;nh bị ch&oacute;i khi sử dụng ngo&agrave;i nắng.&nbsp;</p>
    <p><br></p>
    <p>C&ocirc;ng nghệ &acirc;m thanh Smart AMP gi&uacute;p t&aacute;i tạo &acirc;m thanh một c&aacute;ch ch&acirc;n thật nhất, tăng trải nghiệm nghe nhạc, xem phim của người d&ugrave;ng. Hơn thế nữa, Smart AMP khuếch đại &acirc;m thanh l&ecirc;n một chất lượng cao hơn, nhưng vẫn giữ được tuổi thọ của loa, tai nghe kh&ocirc;ng l&agrave;m &acirc;m thanh bị r&egrave; hay vỡ tiếng.</p>
    <p><br></p>
    <p>&nbsp;</p>
    <p><br></p>
    <p>Tổng Kết: Asus Rog Strix Scar 17 G713QR-ES96 thật sự l&agrave; một chiếc laptop gaming cực kỳ mạnh mẽ, thực hiện c&aacute;c t&aacute;c vụ l&agrave;m việc v&agrave; chơi game tr&ecirc;n cỗ m&aacute;y mạnh mẽ n&agrave;y đảm bảo sẽ mang lại cho bạn những trải nghiệm, ph&uacute;t gi&acirc;y đầy th&iacute;ch th&uacute; trong c&aacute;c trận đấu game của m&igrave;nh.</p>
</div>
<div>
    <div>
        <div>
            <div>
                <div>
                    <div>
                        <div><br></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>', N'AMD Ryzen 9-5900HX', N'16GB DDR4 (2 x 8GB) Bus 3200MHz; 2 slots; up to 32GB', N'SSD 1TB NVMe M.2 PCle Gen 3 x4', N'Geforce RTX 3070 8GB', N'17.3" FHD IPS, Non-Glare, 300Hz', N'	  1x USB 3.0 (Type C)    3x USB 3.0 (Type A)   1x HDMI    1x Rj- 45 Ethernet Jack / 3.5 mm Combo Audio Jack', N'1x USB 3.0 (Type C)    3x USB 3.0 (Type A)   1x HDMI    1x Rj- 45 Ethernet Jack / 3.5 mm Combo Audio Jack', N'2.7 kg', N'90Whr', N'Windows 10 bản quyền', 0, N'/images/pictures/asus_g17_2021_pic_1.jpg', CAST(N'2022-04-09 16:18:49.113' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (61, N'ASUS ROG Zephyrus G14 GA401QM-211.ZG14', 1011, CAST(49990000 AS Decimal(18, 0)), 10, CAST(44991000 AS Decimal(18, 0)), N'[Mới 100%] ASUS ROG Zephyrus G14 GA401QM-211.ZG14 (Ryzen 9 5900HS, 16GB RAM, 1TB NVMe, RTX 3060 6GB, 14" FHD 144Hz)
', N'<div>
    <div>
        <p align="center"><strong>ASUS ROG Zephyrus G14 GA401 - Laptop 14inch mạnh nhất thế giới&nbsp;</strong></p>
        <h3>Thiết kế phong c&aacute;ch v&agrave; di động</h3>
        <p>Thiết kế nhỏ gọn mang t&iacute;nh thẩm mỹ cao, được chăm ch&uacute;t tỉ mỉ từng chi tiết nhỏ ngoại h&igrave;nh. Bề mặt được chế t&aacute;c bằng c&aacute;ch phay CNC ch&iacute;nh x&aacute;c tạo ra 6.536 lỗ tr&ecirc;n nắp nh&ocirc;m tạo ra thiết kế ma trận điểm đặc biệt. B&ecirc;n cạnh đ&oacute;, Bề mặt ph&iacute;a dưới m&aacute;y được thiết kế gia cố tổ ong mang lại sức mạnh bền bỉ với vật liệu tối thiểu để giữ cho khung m&aacute;y nhẹ.</p>
        <p><img src="https://laptopaz.vn/media/lib/2196_01.png" alt=""></p>
        <p>Nh&agrave; sản xuất cũng đ&atilde; rất ch&uacute; đ&aacute;o khi bề mặt chiếu nghỉ tay được l&agrave;m bằng hợp kim nh&ocirc;m-magi&ecirc; c&oacute; khả năng chống v&acirc;n tay.</p>
    </div>
    <p><strong>Sức mạnh khủng trong khung m&aacute;y 14-inch</strong></p>
    <p><img src="https://laptopaz.vn/media/lib/2196_111.jpg" alt=""></p>
    <p>Mang tới hiệu năng mạnh mẽ để gi&uacute;p người d&ugrave;ng chinh phục mọi t&aacute;c vụ, ASUS đ&atilde; hợp t&aacute;c với AMD để tạo ra bộ xử l&yacute; CPU phi&ecirc;n bản đặc biệt cho d&ograve;ng <a href="https://laptopaz.vn/laptop-gaming.html" rel="noopener" target="_blank" title="laptop gaming">laptop gaming</a> của m&igrave;nh l&agrave; AMD Ryzen&trade; R9 5900HS Processor với mức ti&ecirc;u thụ điện năng v&agrave; nhiệt tạo ra thấp. Kết hợp với RAM 16GB v&agrave; ổ cứng 1TB PCIE G3 SSD đem lại tốc độ xử l&yacute;, khởi động m&aacute;y nhanh ch&oacute;ng.&nbsp;</p>
    <p>M&aacute;y được trang bị NVIDIA&reg; GeForce&reg; RTX&nbsp;3060 c&oacute; tốc độ xung nhịp cao hỗ trợ bởi ROG Boost cho ph&eacute;p bạn chuyển từ chơi game tốc độ nhanh sang tạo nội dung trong nh&aacute;y mắt.</p>
    <p><strong>2. L&agrave;m việc chủ động mọi nơi</strong></p>
    <p><img src="https://laptopaz.vn/media/lib/2196_112.jpg" alt=""><br>L&agrave;m được nhiều việc hơn ở bất cứ đ&acirc;u với thời lượng pin d&agrave;i cả ng&agrave;y với bộ sạc chuẩn Type-C<br>Được trang bị chip Intel&reg; Wi-Fi 6 mới nhất với Gig+ (802.11ax), bạn c&oacute; thể chơi game một c&aacute;ch đ&aacute;ng tin cậy ở tốc độ tương đương mạng d&acirc;y bất cứ nơi n&agrave;o c&oacute; kết nối tương th&iacute;ch. Wi-Fi 6 (Gig+) tăng tốc độ v&agrave; hiệu quả mạng, cung cấp kết nối tốt hơn cho c&aacute;c kh&ocirc;ng gian đ&ocirc;ng đ&uacute;c như qu&aacute;n c&agrave; ph&ecirc; v&agrave; thư viện.|<br>Điều khiển m&agrave;n h&igrave;nh thứ hai để đa nhiệm hiệu quả hơn th&ocirc;ng qua cổng USB-C hỗ trợ DisplayPort 1.4.</p>
    <p><strong>3. Chất lượng hiển thị vượt trội</strong></p>
    <p><img src="https://laptopworld.vn/media/lib/8010_hnhnh.jpg" alt=""></p>
    <p>Với m&agrave;n h&igrave;nh FHD (C&oacute; t&ugrave;y chọn m&agrave;n h&igrave;nh l&ecirc;n tới 2K) tận hưởng lối chơi mượt m&agrave; hơn tr&ecirc;n t&ugrave;y chọn m&agrave;n h&igrave;nh&nbsp;144Hz (C&oacute; t&ugrave;y chọn m&agrave;n h&igrave;nh 120Hz)&nbsp;si&ecirc;u tốc. C&ocirc;ng nghệ Adaptive Sync đồng bộ h&oacute;a tần số qu&eacute;t m&agrave;n h&igrave;nh với tốc độ khung h&igrave;nh của GPU để loại bỏ hiện tượng x&eacute; h&igrave;nh.</p>
    <p>X&aacute;c thực Pantone đảm bảo rằng m&agrave;u sắc ch&iacute;nh x&aacute;c. C&aacute;c viền si&ecirc;u mỏng xung quanh m&agrave;n h&igrave;nh đem đến tỉ lệ m&agrave;n h&igrave;nh lớn l&ecirc;n đến 85% so với th&acirc;n m&aacute;y mang đến trải nghiệm h&igrave;nh ảnh giải tr&iacute; đắm ch&igrave;m hơn.</p>
    <p><strong>4. Trải nghiệm &acirc;m thanh đắm ch&igrave;m</strong></p>
    <p><img src="https://laptopaz.vn/media/lib/2196_114.jpg" alt=""><br>C&ocirc;ng nghệ Dolby Atmos v&agrave; 4 loa cho trải nghiệm &acirc;m thanh đa chiều đ&uacute;ng nghĩa. T&iacute;nh năng chống ồn AI hai chiều mang đến &acirc;m thanh trong trẻo v&agrave; r&otilde; r&agrave;ng hơn cho c&aacute;c cuộc tr&ograve; chuyện, ph&aacute;t trực tiếp v&agrave; hơn thế nữa.&nbsp;<br>&Acirc;m thanh v&ograve;m ảo 5.1.2 được cung cấp bởi c&ocirc;ng nghệ Dolby Atmos kết hợp với Loa tweeter đ&ocirc;i truyền &acirc;m thanh trực tiếp. Với loa trầm Smart Amp k&eacute;p ph&aacute;t ra &acirc;m thanh bật ra xung quanh.<br>Chuyển đổi giữa 6 chế độ đặt trước để tối ưu h&oacute;a c&agrave;i đặt dựa tr&ecirc;n loại tr&ograve; chơi v&agrave; loại h&igrave;nh giải tr&iacute;, hoặc thực hiện c&aacute;c sửa đổi thủ c&ocirc;ng ph&ugrave; hợp với sở th&iacute;ch của bạn.</p>
    <p><strong>5.&nbsp;Hệ thống tản nhiệt</strong></p>
    <p><img src="https://laptopaz.vn/media/lib/2196_115.jpg" alt=""></p>
    <p>Laptop năm nay sẽ m&aacute;t hơn bao giờ hết nhờ v&agrave;o khả năng l&agrave;m m&aacute;t đột ph&aacute; với keo tản nhiệt kim loại lỏng tr&ecirc;n CPU</p>
    <p><strong>6. B&agrave;n ph&iacute;m&nbsp;</strong></p>
    <p><img src="https://laptopaz.vn/media/lib/2196_116.jpg" alt=""></p>
    <p>H&agrave;nh tr&igrave;nh ph&iacute;m 1.7mm LED đơn sắc trắng.&nbsp;Đặc biệt c&oacute; t&iacute;nh năng đăng nhập v&acirc;n tay t&iacute;ch hợp tr&ecirc;n n&uacute;t nguồn, gi&uacute;p đăng nhập m&aacute;y t&iacute;nh x&aacute;ch tay đơn giản, nhanh ch&oacute;ng.<br>Trang bị c&aacute;c ph&iacute;m n&oacute;ng chuy&ecirc;n dụng như tăng giảm &acirc;m lượng, tắt tiếng micro v&agrave; phần mềm ROG Armory Crate trong tầm tay để c&oacute; thể thao t&aacute;c dễ d&agrave;ng. C&ocirc;ng nghệ Overstroke mang đến điểm k&iacute;ch hoạt cao hơn trong mỗi lần nhấn ph&iacute;m để c&oacute; độ phản hồi nhanh hơn v&agrave; thiết kế ErgoLift n&acirc;ng b&agrave;n ph&iacute;m l&ecirc;n một g&oacute;c để gi&uacute;p việc g&otilde; ph&iacute;m thoải m&aacute;i.</p>
</div>
<div>
    <div>
        <div>
            <div>
                <div>
                    <div><br></div>
                </div>
            </div>
        </div>
    </div>
</div>', N'Ryzen 9-5900HS', N'16GB DDR4 3200MHz', N'SSD 1TB  NVMe', N'NVIDIA RTX 3060 6GB', N'14 FHD IPS 144Hz', N'No Webcam', N'Wi-Fi 6(802.11ax) 1x RJ45 LAN port Bluetooth 5.1 (Dual band) 2*2 1x USB 3.2 Gen 2 Type-C 2x USB 3.2 Gen 1 Type-A 1x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC 1x HDMI 2.0b 1x 3.5mm Combo Audio Jack', N'1.6 kg', N'4-cell, 76WHrs', N'Windows 10 bản quyền', 0, N'/images/pictures/asus_g14_pic_!.jpg', CAST(N'2022-04-09 16:21:07.447' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (62, N'Laptop Gaming Acer Nitro 5 2021 AN515-57', 1012, CAST(21000000 AS Decimal(18, 0)), 10, CAST(18900000 AS Decimal(18, 0)), N'[REF] Laptop Gaming Acer Nitro 5 2021 AN515-57 (Core i5 - 11400H, 8GB, 256GB, GTX1650, 15.6'''' FHD IPS 144Hz)
', N'<div>
    <div>
        <p>Nếu bạn đang t&igrave;m kiếm một chiếc laptop vừa c&oacute; khả năng đ&aacute;p ứng được nhiều chương tr&igrave;nh đồ họa, c&aacute;c ứng dụng game &quot;nặng&quot; m&agrave; vẫn đem đến trải nghiệm mượt m&agrave; v&agrave; chuy&ecirc;n nghiệp cho người sử dụng. Th&igrave; bạn kh&ocirc;ng thể bỏ qua chiếc laptop&nbsp;Acer Nitro 5 2021 AN515 Core i5 - chiếc laptop đang rất được&nbsp;ưa chuộng tr&ecirc;n thị trường. H&atilde;y c&ugrave;ng LaptopAZ đi t&igrave;m hiểu kỹ hơn nh&eacute;!</p>
        <p data-gtm-vis-has-fired-11082105_181="1" data-gtm-vis-has-fired-11082105_183="1"><img src="https://laptopaz.vn/media/lib/2320_DSC07752.jpg" alt="" width="801" height="498"></p>
        <h2>Acer Nitro 5 2021 thiết kế mạnh mẽ hơn</h2>
        <p>Nitro 5 2021 AN515-57 c&oacute; k&iacute;ch thước m&agrave;n h&igrave;nh l&agrave; 15,6 inch c&ugrave;ng với CPU Core i5 - 11400H. Tận hưởng trải nghiệm chơi game mượt m&agrave;, kh&ocirc;ng bị nh&ograve;e. M&agrave;n h&igrave;nh viền mỏng cũng đ&atilde; được tăng tỷ lệ so với th&acirc;n m&aacute;y l&ecirc;n 80%. Mức độ s&aacute;ng cũng được tăng l&ecirc;n 300 nits, trước đ&acirc;y chỉ l&agrave; 275 nits ở phi&ecirc;n bản Nitro 5 trước đ&acirc;y.</p>
        <p>Thiết kế b&ecirc;n ngo&agrave;i cũng nổi bật hơn một ch&uacute;t, với một mảng m&agrave;u đỏ cho c&aacute;c v&acirc;y ở mặt sau của laptop. Thay đổi n&agrave;y thay thế cho bản lề m&agrave;u đỏ, &ecirc;m hơn so với năm ngo&aacute;i.&nbsp;B&agrave;n ph&iacute;m&nbsp;LED đỏ&nbsp;c&oacute; đ&egrave;n nền gi&uacute;p l&agrave;m phong ph&uacute; trải nghiệm chơi game v&agrave; đẹp hơn.&nbsp;Nitro 5 2021&nbsp;AN515 cũng được thiết kế để đ&aacute;p ứng mọi nhu cầu chơi game nhờ cấu h&igrave;nh, t&iacute;nh năng v&agrave; vị tr&iacute; thiết kế được điều chỉnh đặc biệt cho c&aacute;c hoạt động chơi game.</p>
        <p><img src="https://laptopaz.vn/media/lib/2320_DSC07769.jpg" alt="" width="799" height="449"></p>
        <h2>Card đồ họa với GPU NVIDIA GTX 1650</h2>
        <p>NVIDIA&reg; GeForce&reg; GTX 1650&nbsp;được hỗ trợ bởi hiệu suất đồ họa cải tiến của kiến tr&uacute;c&nbsp;NVIDIA Turing &trade;. Được thiết kế để mang đến sự kết hợp mạnh mẽ giữa đổi mới chơi game, đồ họa thế hệ tiếp theo v&agrave; tiết kiệm năng lượng. Với hiệu suất&nbsp;nhanh hơn tới 80%&nbsp;so với&nbsp;GTX 1050, đ&acirc;y l&agrave; bộ card si&ecirc;u tốc cho c&aacute;c tr&ograve; chơi phổ biến nhất hiện nay v&agrave; ngay cả với c&aacute;c tựa game hiện đại.</p>
        <p><img src="https://laptopaz.vn/media/lib/2320_DSC07777.jpg" alt="" width="801" height="451"></p>
        <h2>Khả năng n&acirc;ng cấp vượt&nbsp;trội</h2>
        <ul>
            <li>2 khe Ram tối đa 64GB&nbsp;</li>
            <li>2 khe SSD M.2 NVMe&nbsp;</li>
            <li>1 khe 2,5 inch SATA</li>
        </ul>
        <p><img src="https://laptopaz.vn/media/lib/2320_Screenshot2022-03-20135106.jpg" alt="" width="1591" height="779"></p>
        <p><strong>Cổng kết nối&nbsp;</strong></p>
        <ul>
            <li>&nbsp;3 cổng USB A 3.2 gen 1</li>
            <li>1 cổng RJ45</li>
            <li>1 cổng audio combo 3,5mm</li>
            <li>1 cổng USB type C thunderbolt 4</li>
            <li>1 cổng HDMI 2.0&nbsp;</li>
            <li>1 cổng nguồn&nbsp;</li>
        </ul>
        <p><img src="https://laptopaz.vn/media/lib/2320_DSC07737.jpg" alt="" width="1602" height="901"></p>
        <p><img src="https://laptopaz.vn/media/product/2051_0_6.jpg" alt=""></p>
        <p><img src="https://laptopaz.vn/media/lib/2320_DSC07733.jpg" alt=""></p>
        <h2>Hệ thống nhiệt cải tiến với quạt k&eacute;p&nbsp;</h2>
        <p>Bạn kh&ocirc;ng cần lo lắng về vấn đề qu&aacute; n&oacute;ng m&aacute;y nữa, Acer Nitro 5 Gaming 2021 đ&atilde; được bổ sung giải ph&aacute;p tản nhiệt s&aacute;ng tạo với thiết kế mới nhất để mang lại hiệu quả l&agrave;m m&aacute;t tốt hơn, ngay cả khi m&aacute;y chạy khối lượng c&ocirc;ng việc nặng.&nbsp;</p>
        <p>Được trang bị hệ thống l&agrave;m m&aacute;t quạt k&eacute;p sử dụng c&aacute;c cổng h&uacute;t/xả v&agrave; 4 lỗ tho&aacute;t nhiệt được đặt ở vị tr&iacute; chiến lược để đạt được mức tăng tổng thể 25% về hiệu suất nhiệt so với mẫu&nbsp;Acer Nitro 5 2020.</p>
        <p><img src="https://laptopaz.vn/media/lib/2320_DSC07705.jpg" alt=""></p>
        <p>Kh&ocirc;ng thể kh&ocirc;ng kể đến c&ocirc;ng nghệ&nbsp;Acer CoolBoost&nbsp;với 4 lỗ th&ocirc;ng gi&oacute; ở ph&iacute;a dưới v&agrave; kết hợp với ứng dụng NitroSense để theo d&otilde;i nhiệt độ v&agrave; điều chỉnh hệ thống tản nhiệt. Hệ thống n&agrave;y được tối ưu h&oacute;a hơn nữa bởi c&ocirc;ng nghệ&nbsp;CoolBoost &trade;&nbsp;c&oacute; thể&nbsp;tăng tốc độ quạt l&ecirc;n 10%&nbsp;v&agrave;&nbsp;l&agrave;m m&aacute;t CPU/GPU l&ecirc;n 9%. Tất cả c&aacute;c t&aacute;c vụ điện to&aacute;n được đảm bảo trở n&ecirc;n thoải m&aacute;i hơn với c&ocirc;ng nghệ CoolBoost &trade; như một giải ph&aacute;p s&aacute;ng tạo để l&agrave;m m&aacute;t tốt hơn.</p>
        <p><strong>Kết luận:</strong> Nitro 5 2021 AN515-57 l&agrave; một trong những sự lựa chọn h&agrave;ng đầu của d&ograve;ng m&aacute;y Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng kh&ocirc;ng k&eacute;m phần tinh tế, kết hợp c&ugrave;ng cấu h&igrave;nh mạnh mẽ v&agrave; tản nhiệt m&aacute;t mẻ, Nitro 5 2021 AN515-57 tự tin c&oacute; thể chinh phục được đa số c&aacute;c Game Online, Offline thời thượng hiện nay. Hơn thế nữa Nitro 5 2021 AN515-57 cũng đủ sức đ&aacute;p ứng c&aacute;c t&aacute;c vụ thiết kế đồ họa, c&ocirc;ng việc, giải tr&iacute; một c&aacute;ch mượt m&agrave; nhất.</p>
    </div>
</div>
<div>
    <div>
        <div>
            <div>
                <div><br></div>
            </div>
        </div>
    </div>
</div>', N'Core i5 - 11400H (6 nhân/ 12 luồng)', N'RAM	 8GB DDR4 Bus 3200MHz  + 1 khe Ram (tối đa 64GB)', N'	 256GB SSD NVMe  +1 Khe M.2 NVMe + 1 HDD 2.5 inch', N'Geforce GTX 1650 4GB (55W)', N'15.6'''' FHD IPS 144Hz 64% sRGB', N'HD 720P', N'3 cổng USB A 3.2 gen 1 1 cổng RJ45 1 cổng audio combo 3,5mm 1 cổng USB type C thunderbolt 4 1 cổng HDMI 2.0  1 cổng nguồn ', N'2.25 kg', N'4 Cell, 48 Whr', N'Windows 11 bản quyền', 1, N'/images/pictures/acer_nitro5_pic_1.jpg', CAST(N'2022-04-09 16:24:41.403' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (63, N'Laptop Gaming Acer Nitro 5 2021 AN515-57', 1012, CAST(22000000 AS Decimal(18, 0)), 11, CAST(19580000 AS Decimal(18, 0)), N'[Mới 100%] Laptop Gaming Acer Nitro 5 2021 AN515-57 (Core i5 - 11400H, 8GB, 256GB, GTX1650, 15.6'''' FHD IPS 144Hz)
', N'<div>
    <div>
        <p>Nếu bạn đang t&igrave;m kiếm một chiếc laptop vừa c&oacute; khả năng đ&aacute;p ứng được nhiều chương tr&igrave;nh đồ họa, c&aacute;c ứng dụng game &quot;nặng&quot; m&agrave; vẫn đem đến trải nghiệm mượt m&agrave; v&agrave; chuy&ecirc;n nghiệp cho người sử dụng. Th&igrave; bạn kh&ocirc;ng thể bỏ qua chiếc laptop&nbsp;Acer Nitro 5 2021 AN515 Core i5 - chiếc laptop đang rất được&nbsp;ưa chuộng tr&ecirc;n thị trường. H&atilde;y c&ugrave;ng LaptopAZ đi t&igrave;m hiểu kỹ hơn nh&eacute;!</p>
        <p data-gtm-vis-has-fired-11082105_181="1" data-gtm-vis-has-fired-11082105_183="1"><img src="https://laptopaz.vn/media/lib/2320_DSC07752.jpg" alt="" width="801" height="498"></p>
        <h2>Acer Nitro 5 2021 thiết kế mạnh mẽ hơn</h2>
        <p>Nitro 5 2021 AN515-57 c&oacute; k&iacute;ch thước m&agrave;n h&igrave;nh l&agrave; 15,6 inch c&ugrave;ng với CPU Core i5 - 11400H. Tận hưởng trải nghiệm chơi game mượt m&agrave;, kh&ocirc;ng bị nh&ograve;e. M&agrave;n h&igrave;nh viền mỏng cũng đ&atilde; được tăng tỷ lệ so với th&acirc;n m&aacute;y l&ecirc;n 80%. Mức độ s&aacute;ng cũng được tăng l&ecirc;n 300 nits, trước đ&acirc;y chỉ l&agrave; 275 nits ở phi&ecirc;n bản Nitro 5 trước đ&acirc;y.</p>
        <p>Thiết kế b&ecirc;n ngo&agrave;i cũng nổi bật hơn một ch&uacute;t, với một mảng m&agrave;u đỏ cho c&aacute;c v&acirc;y ở mặt sau của laptop. Thay đổi n&agrave;y thay thế cho bản lề m&agrave;u đỏ, &ecirc;m hơn so với năm ngo&aacute;i.&nbsp;B&agrave;n ph&iacute;m&nbsp;LED đỏ&nbsp;c&oacute; đ&egrave;n nền gi&uacute;p l&agrave;m phong ph&uacute; trải nghiệm chơi game v&agrave; đẹp hơn.&nbsp;Nitro 5 2021&nbsp;AN515 cũng được thiết kế để đ&aacute;p ứng mọi nhu cầu chơi game nhờ cấu h&igrave;nh, t&iacute;nh năng v&agrave; vị tr&iacute; thiết kế được điều chỉnh đặc biệt cho c&aacute;c hoạt động chơi game.</p>
        <p><img src="https://laptopaz.vn/media/lib/2320_DSC07769.jpg" alt="" width="799" height="449"></p>
        <h2>Card đồ họa với GPU NVIDIA GTX 1650</h2>
        <p>NVIDIA&reg; GeForce&reg; GTX 1650&nbsp;được hỗ trợ bởi hiệu suất đồ họa cải tiến của kiến tr&uacute;c&nbsp;NVIDIA Turing &trade;. Được thiết kế để mang đến sự kết hợp mạnh mẽ giữa đổi mới chơi game, đồ họa thế hệ tiếp theo v&agrave; tiết kiệm năng lượng. Với hiệu suất&nbsp;nhanh hơn tới 80%&nbsp;so với&nbsp;GTX 1050, đ&acirc;y l&agrave; bộ card si&ecirc;u tốc cho c&aacute;c tr&ograve; chơi phổ biến nhất hiện nay v&agrave; ngay cả với c&aacute;c tựa game hiện đại.</p>
        <p><img src="https://laptopaz.vn/media/lib/2320_DSC07777.jpg" alt="" width="801" height="451"></p>
        <h2>Khả năng n&acirc;ng cấp vượt&nbsp;trội</h2>
        <ul>
            <li>2 khe Ram tối đa 64GB&nbsp;</li>
            <li>2 khe SSD M.2 NVMe&nbsp;</li>
            <li>1 khe 2,5 inch SATA</li>
        </ul>
        <p><img src="https://laptopaz.vn/media/lib/2320_Screenshot2022-03-20135106.jpg" alt="" width="1591" height="779"></p>
        <p><strong>Cổng kết nối&nbsp;</strong></p>
        <ul>
            <li>&nbsp;3 cổng USB A 3.2 gen 1</li>
            <li>1 cổng RJ45</li>
            <li>1 cổng audio combo 3,5mm</li>
            <li>1 cổng USB type C thunderbolt 4</li>
            <li>1 cổng HDMI 2.0&nbsp;</li>
            <li>1 cổng nguồn&nbsp;</li>
        </ul>
        <p><img src="https://laptopaz.vn/media/lib/2320_DSC07737.jpg" alt="" width="1602" height="901"></p>
        <p><img src="https://laptopaz.vn/media/product/2051_0_6.jpg" alt=""></p>
        <p><img src="https://laptopaz.vn/media/lib/2320_DSC07733.jpg" alt=""></p>
        <h2>Hệ thống nhiệt cải tiến với quạt k&eacute;p&nbsp;</h2>
        <p>Bạn kh&ocirc;ng cần lo lắng về vấn đề qu&aacute; n&oacute;ng m&aacute;y nữa, Acer Nitro 5 Gaming 2021 đ&atilde; được bổ sung giải ph&aacute;p tản nhiệt s&aacute;ng tạo với thiết kế mới nhất để mang lại hiệu quả l&agrave;m m&aacute;t tốt hơn, ngay cả khi m&aacute;y chạy khối lượng c&ocirc;ng việc nặng.&nbsp;</p>
        <p>Được trang bị hệ thống l&agrave;m m&aacute;t quạt k&eacute;p sử dụng c&aacute;c cổng h&uacute;t/xả v&agrave; 4 lỗ tho&aacute;t nhiệt được đặt ở vị tr&iacute; chiến lược để đạt được mức tăng tổng thể 25% về hiệu suất nhiệt so với mẫu&nbsp;Acer Nitro 5 2020.</p>
        <p><img src="https://laptopaz.vn/media/lib/2320_DSC07705.jpg" alt=""></p>
        <p>Kh&ocirc;ng thể kh&ocirc;ng kể đến c&ocirc;ng nghệ&nbsp;Acer CoolBoost&nbsp;với 4 lỗ th&ocirc;ng gi&oacute; ở ph&iacute;a dưới v&agrave; kết hợp với ứng dụng NitroSense để theo d&otilde;i nhiệt độ v&agrave; điều chỉnh hệ thống tản nhiệt. Hệ thống n&agrave;y được tối ưu h&oacute;a hơn nữa bởi c&ocirc;ng nghệ&nbsp;CoolBoost &trade;&nbsp;c&oacute; thể&nbsp;tăng tốc độ quạt l&ecirc;n 10%&nbsp;v&agrave;&nbsp;l&agrave;m m&aacute;t CPU/GPU l&ecirc;n 9%. Tất cả c&aacute;c t&aacute;c vụ điện to&aacute;n được đảm bảo trở n&ecirc;n thoải m&aacute;i hơn với c&ocirc;ng nghệ CoolBoost &trade; như một giải ph&aacute;p s&aacute;ng tạo để l&agrave;m m&aacute;t tốt hơn.</p>
        <p><strong>Kết luận:</strong> Nitro 5 2021 AN515-57 l&agrave; một trong những sự lựa chọn h&agrave;ng đầu của d&ograve;ng m&aacute;y Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng kh&ocirc;ng k&eacute;m phần tinh tế, kết hợp c&ugrave;ng cấu h&igrave;nh mạnh mẽ v&agrave; tản nhiệt m&aacute;t mẻ, Nitro 5 2021 AN515-57 tự tin c&oacute; thể chinh phục được đa số c&aacute;c Game Online, Offline thời thượng hiện nay. Hơn thế nữa Nitro 5 2021 AN515-57 cũng đủ sức đ&aacute;p ứng c&aacute;c t&aacute;c vụ thiết kế đồ họa, c&ocirc;ng việc, giải tr&iacute; một c&aacute;ch mượt m&agrave; nhất.</p>
    </div>
</div>
<div>
    <div>
        <div>
            <div>
                <div><br></div>
            </div>
        </div>
    </div>
</div>', N'Core i5 - 11400H (6 nhân/ 12 luồng)', N'8GB DDR4 Bus 3200MHz  + 1 khe Ram (tối đa 64GB)', N'256GB SSD NVMe  +1 Khe M.2 NVMe + 1 HDD 2.5 inch', N'Geforce GTX 1650 4GB (55W)', N'15.6'''' FHD IPS 144Hz 64% sRGB', N'HD 720P', N'3 cổng USB A 3.2 gen 1 1 cổng RJ45 1 cổng audio combo 3,5mm 1 cổng USB type C thunderbolt 4 1 cổng HDMI 2.0  1 cổng nguồn', N'2.25 kg', N'4 Cell, 48 Whr', N'Windows 11 bản quyền', 0, N'/images/pictures/acer_nitro5_pic_1.jpg', CAST(N'2022-04-09 16:37:19.943' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (64, N'Acer Nitro 5 Eagle AN515-57', 1012, CAST(27800000 AS Decimal(18, 0)), 15, CAST(23630000 AS Decimal(18, 0)), N'[Mới 100%] Acer Nitro 5 Eagle AN515-57 (Core i5-11400H, 8GB, 512GB, RTX 3050, 15.6'''' FHD IPS 144Hz)
', N'<div>
    <div>
        <p>Acer Nitro 5 2021 AN515 Core i5 d&agrave;nh cho ai?</p>
        <p>&nbsp;</p>
        <p><br></p>
        <p>Nếu bạn đang t&igrave;m kiếm một chiếc laptop vừa c&oacute; khả năng đ&aacute;p ứng được nhiều chương tr&igrave;nh đồ họa, c&aacute;c ứng dụng game &quot;nặng&quot; m&agrave; vẫn đem đến trải nghiệm mượt m&agrave; v&agrave; chuy&ecirc;n nghiệp cho người sử dụng. Th&igrave; bạn kh&ocirc;ng thể bỏ qua chiếc laptop Acer Nitro 5 2021 AN515 Core i5 - chiếc laptop đang rất được ưa chuộng tr&ecirc;n thị trường. H&atilde;y c&ugrave;ng LaptopAZ đi t&igrave;m hiểu kỹ hơn nh&eacute;!</p>
        <p><br></p>
        <p><br></p>
        <p>Acer Nitro 5 2021 thiết kế mạnh mẽ hơn</p>
        <p>Chiếc m&aacute;y n&agrave;y c&oacute; k&iacute;ch thước m&agrave;n h&igrave;nh l&agrave; 15,6 inch c&ugrave;ng với hai t&ugrave;y chọn Intel Core i5-11400H v&agrave; Intel Core i7-11800H. Tận hưởng trải nghiệm chơi game mượt m&agrave;, kh&ocirc;ng bị nh&ograve;e với tốc độ l&agrave;m mới 144Hz. M&agrave;n h&igrave;nh viền mỏng cũng đ&atilde; được tăng tỷ lệ so với th&acirc;n m&aacute;y l&ecirc;n 80%. Mức độ s&aacute;ng cũng được tăng l&ecirc;n 300 nits, trước đ&acirc;y chỉ l&agrave; 275 nits ở phi&ecirc;n bản Nitro 5 trước đ&acirc;y.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Thiết kế b&ecirc;n ngo&agrave;i cũng nổi bật hơn một ch&uacute;t, với một mảng m&agrave;u đỏ cho c&aacute;c v&acirc;y ở mặt sau của laptop. Thay đổi n&agrave;y thay thế cho bản lề m&agrave;u đỏ, &ecirc;m hơn so với năm ngo&aacute;i. B&agrave;n ph&iacute;m RGB 4 v&ugrave;ng c&oacute; đ&egrave;n nền gi&uacute;p l&agrave;m phong ph&uacute; trải nghiệm chơi game v&agrave; đẹp hơn. Nitro 5 2021 AN515-57 cũng được thiết kế để đ&aacute;p ứng mọi nhu cầu chơi game nhờ cấu h&igrave;nh, t&iacute;nh năng v&agrave; vị tr&iacute; thiết kế được điều chỉnh đặc biệt cho c&aacute;c hoạt động chơi game.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Card đồ họa với GPU NVIDIA RTX 3050</p>
        <p>NVIDIA GeForce RTX 3050 được hỗ trợ bởi hiệu suất đồ họa cải tiến của kiến tr&uacute;c NVIDIA Turing. Được thiết kế để mang đến sự kết hợp mạnh mẽ giữa đổi mới chơi game, đồ họa thế hệ tiếp theo v&agrave; tiết kiệm năng lượng. Với hiệu suất nhanh hơn tới 20% so với GTX 1650Ti, đ&acirc;y l&agrave; bộ card si&ecirc;u tốc cho c&aacute;c tr&ograve; chơi phổ biến nhất hiện nay v&agrave; ngay cả với c&aacute;c tựa game hiện đại.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Dễ d&agrave;ng n&acirc;ng cấp dung lượng</p>
        <p>Ngo&agrave;i việc sử dụng phần cứng mới nhất như bộ vi xử l&yacute; CPU Intel Core thế hệ thứ 11 v&agrave; d&ograve;ng card NVIDIA GeForce RTX, Nitro 5 2021 cũng bao gồm c&aacute;c khả năng n&acirc;ng cấp gi&uacute;p d&ograve;ng Nitro vượt trội hơn so với phi&ecirc;n bản c&ugrave;ng loại.</p>
        <p><br></p>
        <p>Đi k&egrave;m với khả năng t&ugrave;y chỉnh bộ nhớ đến c&aacute;c t&ugrave;y chọn lưu trữ. Người d&ugrave;ng c&oacute; thể lắp RAM dung lượng l&ecirc;n đến 64GB, cũng như hai khe cắm NVMe SSD v&agrave; một khe cắm SSD SATA 2,5 inch. Ngo&agrave;i cổng Ethernet E2600, d&agrave;nh ri&ecirc;ng cho biến thể Intel, cổng USB C cũng hỗ trợ Thunderbolt 4 đa chức năng v&agrave; c&oacute; tốc độ truyền dữ liệu nhanh hơn gấp 8 lần so với USB 3.0 th&ocirc;ng thường.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Hai khe cắm SSD gi&uacute;p việc th&ecirc;m một SSD v&agrave;o Nitro 5 gaming thậm ch&iacute; c&ograve;n dễ d&agrave;ng hơn. Kh&ocirc;ng chỉ vậy, hai khe cắm n&agrave;y đ&atilde; hỗ trợ giao thức NVMe v&agrave; được trang bị một bộ tản nhiệt SSD đặc biệt trong mỗi khe, gi&uacute;p hiệu suất SSD kh&ocirc;ng bị giảm khi nhiệt độ tăng l&ecirc;n.</p>
        <p><br></p>
        <p>Nếu bạn vẫn muốn tăng dung lượng lưu trữ của m&igrave;nh nhiều để tiện cho c&ocirc;ng việc? Th&igrave; ch&uacute;ng ta c&oacute; hai khe cắm RAM c&oacute; thể được lấp đầy l&ecirc;n đến 64GB RAM DDR4 3200 MHz hỗ trợ k&ecirc;nh đ&ocirc;i.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Intel Wi-Fi 6 AX201 (802.11ax) v&agrave; Killer Ethernet E2600</p>
        <p>Một t&iacute;nh năng mới kh&aacute;c cho m&ocirc; h&igrave;nh năm nay, Acer Nitro 5 2021 c&oacute; Intel Wi-Fi 6 AX201 (802.11ax) v&agrave; Killer DoubleShot Pro cải thiện hiệu suất v&agrave; độ ổn định mạng ưu ti&ecirc;n chơi game. Điều khiển Ethernet tự động ph&aacute;t hiện lỗi giữa c&aacute;c luồng tr&ograve; chơi, video v&agrave; tr&ograve; chuyện để chọn mức ưu ti&ecirc;n băng th&ocirc;ng nhằm mang lại trải nghiệm kh&ocirc;ng c&oacute; độ trễ. Khi chọn chế độ tự động, tr&igrave;nh tối ưu h&oacute;a mạng của c&aacute;c chiếc laptop Acer gaming 2021 c&oacute; thể ph&acirc;n biệt c&aacute;c chương tr&igrave;nh nặng để kh&ocirc;ng xảy ra sự cố kết nối. Ngo&agrave;i ra, người d&ugrave;ng c&oacute; thể tự đặt mức độ ưu ti&ecirc;n của chương tr&igrave;nh, thay đổi ph&acirc;n bổ băng th&ocirc;ng cho từng ứng dụng v&agrave; thậm ch&iacute; chặn một số ứng dụng nhất định để đảm bảo kết nối tốt nhất.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Hệ thống nhiệt cải tiến với quạt k&eacute;p&nbsp;</p>
        <p>Bạn kh&ocirc;ng cần lo lắng về vấn đề qu&aacute; n&oacute;ng m&aacute;y nữa, Acer Nitro 5 Gaming 2021 đ&atilde; được bổ sung giải ph&aacute;p tản nhiệt s&aacute;ng tạo với thiết kế mới nhất để mang lại hiệu quả l&agrave;m m&aacute;t tốt hơn, ngay cả khi m&aacute;y chạy khối lượng c&ocirc;ng việc nặng.&nbsp;</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Được trang bị hệ thống l&agrave;m m&aacute;t quạt k&eacute;p sử dụng c&aacute;c cổng h&uacute;t/xả v&agrave; 4 lỗ tho&aacute;t nhiệt được đặt ở vị tr&iacute; chiến lược để đạt được mức tăng tổng thể 25% về hiệu suất nhiệt so với mẫu Acer Nitro 5 2020.</p>
        <p><br></p>
        <p>Kh&ocirc;ng thể kh&ocirc;ng kể đến c&ocirc;ng nghệ Acer CoolBoost với 4 lỗ th&ocirc;ng gi&oacute; ở ph&iacute;a dưới v&agrave; kết hợp với ứng dụng NitroSense để theo d&otilde;i nhiệt độ v&agrave; điều chỉnh hệ thống tản nhiệt. Hệ thống n&agrave;y được tối ưu h&oacute;a hơn nữa bởi c&ocirc;ng nghệ CoolBoost &nbsp;c&oacute; thể tăng tốc độ quạt l&ecirc;n 10% v&agrave; l&agrave;m m&aacute;t CPU/GPU l&ecirc;n 9%. Tất cả c&aacute;c t&aacute;c vụ điện to&aacute;n được đảm bảo trở n&ecirc;n thoải m&aacute;i hơn với c&ocirc;ng nghệ CoolBoost &nbsp;như một giải ph&aacute;p s&aacute;ng tạo để l&agrave;m m&aacute;t tốt hơn.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Tổng Kết: Chiếc laptop Acer Nitro 5 2021 n&agrave;y sẽ mang đến cho bạn những gi&acirc;y ph&uacute;t chiến game, l&agrave;m việc thật đ&atilde; mắt đấy sẽ l&agrave; một trong những lựa chọn tốt để bạn vừa l&agrave;m việc, giải tr&iacute; v&agrave; thư gi&atilde;n.</p>
    </div>
</div>
<div>
    <div>
        <div>
            <div><br></div>
        </div>
    </div>
</div>', N'Intel® Core™ i5-11400H', N'8GB DDR4 Bus 3200MHz', N'512GB SSD M2 NVMe', N'NVIDIA GeForce RTX 3050 4GB GDDR6', N'15.6" FHD (1920 x 1080) IPS, 144Hz, Anti-Glare', N'HD 720P', N'1x USB 3.2 Gen 2 Type-C Ports Supporting: DisplayPort over USB-C, Thunderbolt 4, USB charging 5 V; 3 A  1x USB 3.2 Gen 2 port featuring power-off USB charging 2x USB 3.2 Gen 1 ports RJ45 1 x HDMI 2.1 port with HDCP support 1x 3.5 mm headphone/speaker jack, supporting headsets with built-in microphone DC-in jack for AC adapter', N'2. kg', N'	4 Cell 57.5WHr', N'Windows 10 bản quyền', 0, N'/images/pictures/acer_nitro_5_an515_pic_1.JPG', CAST(N'2022-04-09 16:39:56.807' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (65, N'Acer Nitro 5 Tiger 2022 AN515-58-773Y', 1012, CAST(35000000 AS Decimal(18, 0)), 15, CAST(29750000 AS Decimal(18, 0)), N'[Mới 100%] Acer Nitro 5 Tiger 2022 AN515-58-773Y (Core i7 - 12700H, 8GB, 512GB, RTX 3050Ti, 15.6" FHD IPS 144Hz)
', N'<div>
    <div>
        <h1><strong>Laptop Acer Nitro 5 Tiger 2022- Cấu h&igrave;nh đỉnh cao, được trang bị chip Intel Gen 12 mới nhất ở thời điểm hiện tại.&nbsp;</strong></h1>
        <p><strong><strong><img src="https://laptopaz.vn/media/lib/2322_nitro54.jpg" alt=""></strong></strong></p>
        <p><em>H&igrave;nh: Thiết kế bề ngo&agrave;i Nitro 5 Tiger 2022</em></p>
        <p>Chiếc laptop Gaming Nitro Tiger 5 Tiger bản 2022 được Nitro ra mắt v&agrave;o sự kiện CES mới đ&acirc;y. Đ&acirc;y l&agrave; chiếc laptop sở hữu cấu h&igrave;nh si&ecirc;u khủng với với bộ CPU Intel Core i7 Alder Lake 12700H Gen 12 mới nhất c&ugrave;ng card rời GeForce RTX 3050 4 GB. Một miền đất đứa đối với c&aacute;c game thủ đ&uacute;ng kh&ocirc;ng n&agrave;o. Ngay sau đ&acirc;y ch&uacute;ng ta sẽ đi t&igrave;m hiểu xem con Nitro 5 Tiger c&oacute; g&igrave; đ&aacute;ng được mong chờ n&agrave;o.&nbsp;</p>
        <p><strong>THIẾT KẾ</strong></p>
        <p>Về mặt thiết kế, vừa nh&igrave;n l&agrave; ch&uacute;ng ta c&oacute; thể nhận ra Acer Nitro 5 Tiger thay đổi 180* so với đ&agrave;n anh của n&oacute;. Mặt A của m&aacute;y giờ đ&acirc;y được t&ocirc; điểm bằng c&aacute;c đường họa tiết đa sắc, gi&uacute;p m&aacute;y trở n&ecirc;n nổi bật giữa đ&aacute;m đ&ocirc;ng. Phong c&aacute;ch tối giản nhưng lại v&ocirc; c&ugrave;ng tinh tế, hiện đại.&nbsp;</p>
        <p><strong><strong><img src="https://laptopaz.vn/media/lib/2322_nitrong5tiger2022.jpg" alt=""><br></strong></strong><em>H&igrave;nh: thi&ecirc;t kế ngo&agrave;i Acer Nitro 5 Tiger 2022</em><strong><strong><br></strong></strong></p>
        <p>Ở đằng sau, khe tho&aacute;t nhiệt được thiết kế thanh tho&aacute;t v&agrave; cao cấp hơn với t&ocirc;ng m&agrave;u đen bạc.. Với thiết kế như vậy, vừa giữ được lối đi cũ đậm chất gaming, vừa mang hướng xu thế hiện đại.</p>
        <p><strong><strong><img src="https://laptopaz.vn/media/lib/2322_nitro59.jpg" alt=""></strong></strong></p>
        <p>So với một số đối thủ, Nitro 5 Tiger c&oacute; lợi thế ở Webcam, b&agrave;n ph&iacute;m full-size, đầy đủ ph&iacute;m số, gi&uacute;p l&agrave;m việc từ xa tiện lợi. Tuy nhi&ecirc;n, trackpad tr&ecirc;n thiết bị c&oacute; k&iacute;ch thước b&eacute; v&agrave; cảm gi&aacute;c vuốt kh&ocirc;ng mượt</p>
        <p><strong>CỔNG KẾT NỐI</strong></p>
        <p><strong><strong><img src="https://laptopaz.vn/media/lib/2322_nitro56.jpg" alt=""></strong></strong></p>
        <ul>
            <li><strong><em><strong><em>3 cổng USB 3.2 Type-A&nbsp;</em></strong></em></strong></li>
            <li><strong><em>1 cổng HDMI</em></strong></li>
            <li><strong><em>1 jack &acirc;m thanh 3.5mm</em></strong></li>
            <li><strong><em>1 cổng mạng LAN&nbsp;</em></strong></li>
            <li><strong><em>1 cổng USB Type-C t&iacute;ch hợp Thunderbolt 4</em></strong></li>
        </ul>
        <p><strong>M&Agrave;N H&Igrave;NH:</strong></p>
        <p><em><img src="https://laptopaz.vn/media/lib/2322_nitro511.jpg" alt=""></em></p>
        <ul>
            <li><strong><em>Phổ m&agrave;u: 66% sRGB, 49% adobeRGB</em></strong></li>
            <li><strong><em>Độ S&aacute;ng: 304 nits</em></strong></li>
            <li><strong><em>Độ tương phản: 1520:1</em></strong></li>
            <li><strong><em>Độ sai m&agrave;u (deltaE): 2.75</em></strong><em><br></em></li>
        </ul>
        <p><strong>HIỆU NĂNG</strong><strong><br></strong><strong>Phi&ecirc;n bản cấu h&igrave;nh trong b&agrave;i test (Lưu &yacute;: Phi&ecirc;n bản i7 12700H/ RTX 3050Ti sẽ c&oacute; hiệu năng kh&aacute;c)<br></strong><em>CPU: Core i5 12500H ( 12 nh&acirc;n/ 16 luồng )</em></p>
        <p><em>GPU: RTX 3050 4GB Vram (95W)</em></p>
        <p><em>RAM: 16GB (Dual Channel)</em></p>
        <p><em>SSD: 512GB M.2 NVMe</em></p>
        <p><em>M&agrave;n h&igrave;nh: FHD IPS 144hz</em></p>
        <p><strong>Hiệu năng chơi game khi thử nghiệm sản phẩm khi lắp 2 thanh ram 8GB:<em><br></em></strong></p>
        <p><img src="https://laptopaz.vn/media/lib/2322_nitro511.jpg" alt=""></p>
        <p><em>Tựa game: League of Legends</em></p>
        <p><img src="https://laptopaz.vn/media/lib/2322_nitro512.jpg" alt="">&nbsp;</p>
        <p><em>Tựa game: Shadow of Tomb Raider</em></p>
        <p><strong>Lưu &yacute;:&nbsp;</strong>Nếu sử dụng một thanh ram 8GB hiệu năng sẽ c&oacute; sự sụt giảm đ&aacute;ng kể.&nbsp;</p>
        <p><strong>NHIỆT ĐỘ:</strong></p>
        <p>Một điểm nữa m&agrave; Acer tự h&agrave;o đ&oacute; l&agrave; hệ thống tản nhiệt trang bị tr&ecirc;n Nitro 5 Tiger 2022 (7100 v&ograve;ng tr&ecirc;n ph&uacute;t). Quạt to, mạnh v&agrave; tất nhi&ecirc;n rồi, m&aacute;t v&ocirc; c&ugrave;ng. Đ&acirc;y sẽ l&agrave; sự lựa chọn tuyệt vời d&agrave;nh cho Game thủ th&iacute;ch quạt to v&agrave; m&aacute;y m&aacute;t.&nbsp;</p>
        <p><img src="https://laptopaz.vn/media/lib/2322_nitro5tiger15.jpg" alt=""></p>
        <p>&nbsp;</p>
        <p><br></p>
        <p><strong>N&Acirc;NG CẤP:</strong></p>
        <p><strong><img src="https://laptopaz.vn/media/lib/2322_nitro58.jpg" alt=""></strong></p>
        <p><em>h&igrave;nh: B&ecirc;n trong Acer Nitro 5 Tiger 2022</em></p>
        <ul>
            <li><strong>2 Khe RAM DDR4 tối đa 64 GB&nbsp;</strong></li>
            <li><strong>1 khe 2,5 Inchs SATA&nbsp;</strong></li>
            <li><strong>2 khe M.2 NVMe.</strong></li>
        </ul>
        <p><strong>KẾT LUẬN:&nbsp;</strong>Acer Nitro 5 Tiger 2022 l&agrave; một sản phẩm gaming phổ th&ocirc;ng đ&aacute;ng mua. Ưu điểm lớn nhất của sản phẩm n&agrave;y l&agrave; hệ thống tản nhiệt đồ sộ, tốc độ quạt gi&oacute; lớn, thiết kế hầm hố, ph&ugrave; hợp với những game thủ c&aacute; t&iacute;nh mạnh. Anh em c&oacute; thể n&acirc;ng cấp th&ecirc;m 1 thanh RAM 8GB để c&oacute; thể chơi c&aacute;c tựa game nặng như League of Legends, Shadow of Tomb Raider hay l&agrave; Valorant&hellip; mượt m&agrave; hơn rất nhiều.</p>
    </div>
</div>
<div>
    <div>
        <div><br></div>
    </div>
</div>', N'Core i7 - 12700H (6 Nhân hiệu năng cao, 8 Nhân tiết kiệm điện)', N'8GB DDR4 3200Mhz  + 1 khe ram DDR4 chờ', N'	 SSD 512GB NVMe  + 1 Khe SSD M2 Nvme  + 1 Khe 2,5 inchs Sata', N'NVIDIA® GeForce® RTX 3050Ti 4GB GDDR6 (95W)', N'15.6 inchs, FHD (1920 x 1080), IPS, 144Hz, LCD', N'HD 720P', N'1 x USB 3.2 Gen 2 hỗ trợ sạc  2 x USB 3.2 Gen 1   1 x USB Type-C port: USB 3.2 Gen 2 (up to 10 Gbps)  1 x HDMI® 2.0 ', N'2.4 kg', N'4 Cell 57Wh', N'Windows 11 Home bản quyền', 0, N'/images/pictures/acer_tiger_pic_1.JPG', CAST(N'2022-04-09 16:42:24.507' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (66, N'Acer Nitro 5 Tiger 2022 AN515-58-52SP', 1012, CAST(28000000 AS Decimal(18, 0)), 10, CAST(25200000 AS Decimal(18, 0)), N'[Mới 100%] Acer Nitro 5 Tiger 2022 AN515-58-52SP (Core i5 - 12500H, 8GB, 512GB, RTX 3050, 15.6" FHD IPS 144Hz)
', N'<div>
    <div>
        <h1><strong>Laptop Acer Nitro 5 Tiger 2022- Cấu h&igrave;nh đỉnh cao, được trang bị chip Intel Gen 12 mới nhất ở thời điểm hiện tại.&nbsp;</strong></h1>
        <p><strong><strong><img src="https://laptopaz.vn/media/lib/2322_nitro54.jpg" alt=""></strong></strong></p>
        <p><em>H&igrave;nh: Thiết kế bề ngo&agrave;i Nitro 5 Tiger 2022</em></p>
        <p>Chiếc laptop Gaming Nitro Tiger 5 Tiger bản 2022 được Nitro ra mắt v&agrave;o sự kiện CES mới đ&acirc;y. Đ&acirc;y l&agrave; chiếc laptop sở hữu cấu h&igrave;nh si&ecirc;u khủng với với bộ CPU Intel Core i7 Alder Lake 12700H Gen 12 mới nhất c&ugrave;ng card rời GeForce RTX 3050 4 GB. Một miền đất đứa đối với c&aacute;c game thủ đ&uacute;ng kh&ocirc;ng n&agrave;o. Ngay sau đ&acirc;y ch&uacute;ng ta sẽ đi t&igrave;m hiểu xem con Nitro 5 Tiger c&oacute; g&igrave; đ&aacute;ng được mong chờ n&agrave;o.&nbsp;</p>
        <p><strong>THIẾT KẾ</strong></p>
        <p>Về mặt thiết kế, vừa nh&igrave;n l&agrave; ch&uacute;ng ta c&oacute; thể nhận ra Acer Nitro 5 Tiger thay đổi 180* so với đ&agrave;n anh của n&oacute;. Mặt A của m&aacute;y giờ đ&acirc;y được t&ocirc; điểm bằng c&aacute;c đường họa tiết đa sắc, gi&uacute;p m&aacute;y trở n&ecirc;n nổi bật giữa đ&aacute;m đ&ocirc;ng. Phong c&aacute;ch tối giản nhưng lại v&ocirc; c&ugrave;ng tinh tế, hiện đại.&nbsp;</p>
        <p><strong><strong><img src="https://laptopaz.vn/media/lib/2322_nitrong5tiger2022.jpg" alt=""><br></strong></strong><em>H&igrave;nh: thi&ecirc;t kế ngo&agrave;i Acer Nitro 5 Tiger 2022</em><strong><strong><br></strong></strong></p>
        <p>Ở đằng sau, khe tho&aacute;t nhiệt được thiết kế thanh tho&aacute;t v&agrave; cao cấp hơn với t&ocirc;ng m&agrave;u đen bạc.. Với thiết kế như vậy, vừa giữ được lối đi cũ đậm chất gaming, vừa mang hướng xu thế hiện đại.</p>
        <p><strong><strong><img src="https://laptopaz.vn/media/lib/2322_nitro59.jpg" alt=""></strong></strong></p>
        <p>So với một số đối thủ, Nitro 5 Tiger c&oacute; lợi thế ở Webcam, b&agrave;n ph&iacute;m full-size, đầy đủ ph&iacute;m số, gi&uacute;p l&agrave;m việc từ xa tiện lợi. Tuy nhi&ecirc;n, trackpad tr&ecirc;n thiết bị c&oacute; k&iacute;ch thước b&eacute; v&agrave; cảm gi&aacute;c vuốt kh&ocirc;ng mượt</p>
        <p><strong>CỔNG KẾT NỐI</strong></p>
        <p><strong><strong><img src="https://laptopaz.vn/media/lib/2322_nitro56.jpg" alt=""></strong></strong></p>
        <ul>
            <li><strong><em><strong><em>3 cổng USB 3.2 Type-A&nbsp;</em></strong></em></strong></li>
            <li><strong><em>1 cổng HDMI</em></strong></li>
            <li><strong><em>1 jack &acirc;m thanh 3.5mm</em></strong></li>
            <li><strong><em>1 cổng mạng LAN&nbsp;</em></strong></li>
            <li><strong><em>1 cổng USB Type-C t&iacute;ch hợp Thunderbolt 4</em></strong></li>
        </ul>
        <p><strong>M&Agrave;N H&Igrave;NH:</strong></p>
        <p><em><img src="https://laptopaz.vn/media/lib/2322_nitro511.jpg" alt=""></em></p>
        <ul>
            <li><strong><em>Phổ m&agrave;u: 66% sRGB, 49% adobeRGB</em></strong></li>
            <li><strong><em>Độ S&aacute;ng: 304 nits</em></strong></li>
            <li><strong><em>Độ tương phản: 1520:1</em></strong></li>
            <li><strong><em>Độ sai m&agrave;u (deltaE): 2.75</em></strong><em><br></em></li>
        </ul>
        <p><strong>HIỆU NĂNG</strong><strong><br></strong><strong>Phi&ecirc;n bản cấu h&igrave;nh trong b&agrave;i test (Lưu &yacute;: Phi&ecirc;n bản i7 12700H/ RTX 3050Ti sẽ c&oacute; hiệu năng kh&aacute;c)<br></strong><em>CPU: Core i5 12500H ( 12 nh&acirc;n/ 16 luồng )</em></p>
        <p><em>GPU: RTX 3050 4GB Vram (95W)</em></p>
        <p><em>RAM: 16GB (Dual Channel)</em></p>
        <p><em>SSD: 512GB M.2 NVMe</em></p>
        <p><em>M&agrave;n h&igrave;nh: FHD IPS 144hz</em></p>
        <p><strong>Hiệu năng chơi game khi thử nghiệm sản phẩm khi lắp 2 thanh ram 8GB:<em><br></em></strong></p>
        <p><img src="https://laptopaz.vn/media/lib/2322_nitro511.jpg" alt=""></p>
        <p><em>Tựa game: League of Legends</em></p>
        <p><img src="https://laptopaz.vn/media/lib/2322_nitro512.jpg" alt="">&nbsp;</p>
        <p><em>Tựa game: Shadow of Tomb Raider</em></p>
        <p><strong>Lưu &yacute;:&nbsp;</strong>Nếu sử dụng một thanh ram 8GB hiệu năng sẽ c&oacute; sự sụt giảm đ&aacute;ng kể.&nbsp;</p>
        <p><strong>NHIỆT ĐỘ:</strong></p>
        <p>Một điểm nữa m&agrave; Acer tự h&agrave;o đ&oacute; l&agrave; hệ thống tản nhiệt trang bị tr&ecirc;n Nitro 5 Tiger 2022 (7100 v&ograve;ng tr&ecirc;n ph&uacute;t). Quạt to, mạnh v&agrave; tất nhi&ecirc;n rồi, m&aacute;t v&ocirc; c&ugrave;ng. Đ&acirc;y sẽ l&agrave; sự lựa chọn tuyệt vời d&agrave;nh cho Game thủ th&iacute;ch quạt to v&agrave; m&aacute;y m&aacute;t.&nbsp;</p>
        <p><img src="https://laptopaz.vn/media/lib/2322_nitro5tiger15.jpg" alt=""></p>
        <p>&nbsp;</p>
        <p><br></p>
        <p><strong>N&Acirc;NG CẤP:</strong></p>
        <p><strong><img src="https://laptopaz.vn/media/lib/2322_nitro58.jpg" alt=""></strong></p>
        <p><em>h&igrave;nh: B&ecirc;n trong Acer Nitro 5 Tiger 2022</em></p>
        <ul>
            <li><strong>2 Khe RAM DDR4 tối đa 64 GB&nbsp;</strong></li>
            <li><strong>1 khe 2,5 Inchs SATA&nbsp;</strong></li>
            <li><strong>2 khe M.2 NVMe.</strong></li>
        </ul>
        <p><strong>KẾT LUẬN:&nbsp;</strong>Acer Nitro 5 Tiger 2022 l&agrave; một sản phẩm gaming phổ th&ocirc;ng đ&aacute;ng mua. Ưu điểm lớn nhất của sản phẩm n&agrave;y l&agrave; hệ thống tản nhiệt đồ sộ, tốc độ quạt gi&oacute; lớn, thiết kế hầm hố, ph&ugrave; hợp với những game thủ c&aacute; t&iacute;nh mạnh. Anh em c&oacute; thể n&acirc;ng cấp th&ecirc;m 1 thanh RAM 8GB để c&oacute; thể chơi c&aacute;c tựa game nặng như League of Legends, Shadow of Tomb Raider hay l&agrave; Valorant&hellip; mượt m&agrave; hơn rất nhiều.</p>
    </div>
</div>
<div>
    <div>
        <div><br></div>
    </div>
</div>', N'Core i5 - 12500H', N'8GB DDR4 3200Mhz', N'SSD 512GB NVMe  + 1 Khe SSD M2 Nvme  + 1 Khe 2,5 inchs Sata', N'NVIDIA® GeForce® RTX 3050Ti 4GB GDDR6 (95W)', N'15.6 inch FHD (1920 x 1080) IPS 144Hz slim bezel LCD', N'HD 720P', N'1 x USB 3.2 Gen 2 port featuring power-off USB charging  2 x USB 3.2 Gen 1 ports  1 x USB Type-C port: USB 3.2 Gen 2 (up to 10 Gbps)  1 x HDMI® 2.0 port with HDCP suppor', N'2.4 kg', N'4 Cell 57Wh', N'Windows 11 Home bản quyền', 0, N'/images/pictures/acer_tiger_pic_1.JPG', CAST(N'2022-04-09 16:49:38.360' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (67, N'Acer Predator Triton 300', 1012, CAST(39000000 AS Decimal(18, 0)), 10, CAST(35100000 AS Decimal(18, 0)), N'[Mới 100%] Acer Predator Triton 300 Core i7-10750H, 16GB, 512GB, RTX 2070 Max-Q, 15.6'''' FHD 240Hz
', N'<div>
    <div>
        <div>
            <h2>PREDATOR TRITON 300 laptop thời trang, chơi game thời thượng</h2>
            <p><img src="https://laptopaz.vn/media/product/2002_a4.jpg" alt=""></p>
            <p>Được trang bị đồ họa NVIDIA&reg; GeForce RTX &trade; 30 Series1, l&ecirc;n đến Bộ xử l&yacute; Intel&reg; Core &trade; i7 v&agrave; C&ocirc;ng nghệ quạt 3D AeroBlade &trade; thế hệ thứ 5 được thiết kế ri&ecirc;ng của ch&uacute;ng t&ocirc;i - chiếc m&aacute;y n&agrave;y lu&ocirc;n sẵn s&agrave;ng để chơi - mọi l&uacute;c mọi nơi.</p>
            <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a2.jpg" alt=""></p>
            <p>BẬT M&Iacute; TRONG lớp vỏ kim loại, tối m&agrave;u của n&oacute; l&agrave; tất cả những g&igrave; bạn cần: l&ecirc;n đến Bộ xử l&yacute; Intel&reg; Core &trade; i7, đồ họa GeForce RTX &trade; 30 Series, bộ nhớ DDR4 3200MHz l&ecirc;n đến 16GB v&agrave; nhiều bộ nhớ PCIe tốc độ cao &nbsp;để điền từ thư viện tr&ograve; chơi của bạn.</p>
            <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a3.jpg" alt=""></p>
            <p><img src="https://laptopaz.vn/media/product/2002_a5.jpg" alt=""></p>
            <p>NVIDIA&reg; GEFORCE RTX &trade; 30 SERIES C&aacute;c GPU n&agrave;y mang lại hiệu suất tối ưu cho game thủ v&agrave; người s&aacute;ng tạo. &nbsp;Ch&uacute;ng được cung cấp năng lượng bởi kiến tr&uacute;c Bộ khuếch đại RTX thế hệ thứ 2 của NVIDIA - với L&otilde;i d&ograve; tia mới, L&otilde;i Tensor v&agrave; c&aacute;c bộ xử l&yacute; đa xử l&yacute; ph&aacute;t trực tuyến để c&oacute; một bước nhảy vọt về hiệu suất. &nbsp;M&aacute;y t&iacute;nh x&aacute;ch tay n&agrave;y cũng sử dụng C&ocirc;ng nghệ NVIDIA&reg; Max-Q Thế hệ thứ 3 để c&oacute; hiệu suất v&agrave; hiệu suất cao nhất.</p>
            <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a1.jpg" alt=""></p>
            <p>3RD GEN TENSOR CORES Nhận th&ocirc;ng lượng gấp 2 lần với cấu tr&uacute;c thưa thớt v&agrave; c&aacute;c thuật to&aacute;n AI n&acirc;ng cao như DLSS. &nbsp;C&aacute;c l&otilde;i n&agrave;y mang lại hiệu suất tr&ograve; chơi tăng đ&aacute;ng kể v&agrave; khả năng AI ho&agrave;n to&agrave;n mới.</p>
            <p>2ND GEN RT CORES T&iacute;nh năng d&ograve; tia m&ocirc; phỏng h&agrave;nh vi thực của &aacute;nh s&aacute;ng để mang lại chất lượng điện ảnh, thời gian thực cho c&aacute;c tr&ograve; chơi trực quan nhất.</p>
            <p>C&Ocirc;NG NGHỆ 3RD GEN MAX-Q Mọi kh&iacute;a cạnh của m&aacute;y t&iacute;nh x&aacute;ch tay, chip, phần mềm, thiết kế PCB, ph&acirc;n phối điện v&agrave; nhiệt, đều được tối ưu h&oacute;a cho năng lượng v&agrave; hiệu suất.</p>
            <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a6.png" alt=""></p>
            <p>C&Ocirc;NG NGHỆ QUẠT 3D THẾ HỆ 5 AEROBLADE &trade; Để giữ kh&ocirc;ng kh&iacute; m&aacute;t di chuyển nhanh ch&oacute;ng qua m&aacute;y t&iacute;nh x&aacute;ch tay, Triton 300 sử dụng phương ph&aacute;p tiếp cận quạt k&eacute;p v&agrave; c&ocirc;ng nghệ Quạt 3D AeroBlade &trade; thế hệ thứ 5 được thiết kế ri&ecirc;ng của ch&uacute;ng t&ocirc;i.</p>
            <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a4.jpg" alt=""></p>
            <p>THIẾT KẾ BIONIC Lấy cảm hứng từ cơ chế bay im lặng, mạnh mẽ được kiểm tra tr&ecirc;n động vật, ch&uacute;ng t&ocirc;i đ&atilde; tạo cho quạt của m&igrave;nh một cạnh răng cưa, cho ph&eacute;p nhiều kh&ocirc;ng kh&iacute; đi qua hơn.</p>
            <p>M&Agrave;N H&Igrave;NH SI&Ecirc;U MỎNG Mỗi trong số 89 lưỡi dao sinh học chỉ d&agrave;y 0,08mm v&agrave; ho&agrave;n to&agrave;n bằng kim loại với r&atilde;nh thụt k&eacute;p ổn định.</p>
            <p>HƯỚNG DẪN GI&Oacute; Được thiết kế để chuyển hướng luồng kh&ocirc;ng kh&iacute; ch&iacute;nh x&aacute;c đến nơi dự định v&agrave; ổn định hơn nữa quạt ở tốc độ cao - giảm nhiễu loạn v&agrave; tiếng ồn.</p>
            <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a2.jpg" alt=""></p>
            <p>L&Agrave;M CHO TỐC ĐỘ Quyết định cuộc gọi n&agrave;o cho bạn: FHD b&ugrave;ng nổ ở 240Hz hay QHD nguy&ecirc;n sơ ở 165Hz. &nbsp;Phản hồi tăng tốc 3ms cũng gi&uacute;p cho việc khởi động m&aacute;y t&iacute;nh x&aacute;ch tay n&agrave;y l&ecirc;n thiết bị cao trở th&agrave;nh trải nghiệm liền mạch, kh&ocirc;ng bị x&eacute; h&igrave;nh với độ mờ tối thiểu.</p>
            <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a3.jpg" alt=""></p>
        </div>
        <div>
            <p>PORTS APLENTY Cắm tất cả c&aacute;c thiết bị ngoại vi của bạn v&agrave;o đầy đủ c&aacute;c cổng, bao gồm HDMI 2.1, miniDP 1.4 v&agrave; Thunderbolt &trade; 4 Type-C cực nhanh. &nbsp;Chỉ ri&ecirc;ng th&ocirc;ng số kỹ thuật HDMI 2.1 cho ph&eacute;p bạn dễ d&agrave;ng cắm v&agrave;o m&agrave;n h&igrave;nh ngo&agrave;i chẳng hạn như 4K ở 120Hz.</p>
            <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a1.jpg" alt=""></p>
        </div>
    </div>
</div>
<div>
    <div><br></div>
</div>', N'Intel® Core™ i7-10750H', N'16GB DDR4 Bus 3200MHz', N'SSD 512GB NVMe', N'NVIDIA GeForce RTX 2070 Max-Q', N'15.6 inch FHD IPS 240Hz', N'HD 720P', N' 2 x USB 3.2 (Thế hệ thứ nhất)  1 x USB 3.2 (Thế hệ thứ hai) Loại C  1 x Cổng USB 3.2 (Thế hệ thứ hai) với sạc tắt nguồn  1 x Cổng hiển thị nhỏ  1 x Cổng HDMI', N'2.5 kg', N'5 Hours', N'Windows 10 bản quyền', 2, N'/images/pictures/acer_predator_pic_1.JPG', CAST(N'2022-04-09 16:52:24.487' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (68, N'Acer Predator Triton 500', 1012, CAST(52000000 AS Decimal(18, 0)), 12, CAST(45760000 AS Decimal(18, 0)), N'[Mới 100%] Acer Predator Triton 500 (Core i7-10875H, 32GB, 1TB, VGA RTX 2070 Super, 15.6 inch FHD 300Hz)
', N'<div>
    <div>
        <div>
            <p>Acer Việt Nam ch&iacute;nh thức giới thiệu bản n&acirc;ng cấp mới nhất của laptop gaming Predator Triton 500 trong d&ograve;ng sản phẩm gaming Predator của m&igrave;nh. Triton 500 l&agrave; mẫu laptop gaming nổi tiếng với thiết kế vỏ nh&ocirc;m nguy&ecirc;n khối, si&ecirc;u mỏng, si&ecirc;u nhẹ, sử dụng vi xử l&yacute; v&agrave; card đồ họa mới nhất từ Intel v&agrave; NVIDIA đầu ti&ecirc;n tại thị trường Việt Nam, cũng như hệ thống tản nhiệt ti&ecirc;n tiến.</p>
            <p><strong>Thiết kế si&ecirc;u mỏng nhẹ</strong></p>
            <p><strong>Laptop</strong> Triton 500 đang khẳng định vị thế dẫn đầu xu hướng&nbsp;<strong>laptop gaming</strong> si&ecirc;u mỏng nhẹ với độ mỏng 17.9mm v&agrave; nhẹ chỉ 2.1kg . &nbsp;Nổi bật với c&aacute;c đường n&eacute;t sắc xảo v&agrave; tinh tế, logo Predator c&oacute; đ&egrave;n led ph&aacute;t s&aacute;ng m&agrave;u Electric Blue tr&ecirc;n nền vỏ nh&ocirc;m nguy&ecirc;n khối của Triton 500 l&agrave; điểm nhấn ấn tượng. So với thế hệ trước, logo của Triton 500 mới đ&atilde; được tối giản nhưng lại c&oacute; phần ngầu hơn, như đang th&aacute;ch thức mọi đối thủ trước mặt n&oacute;.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src="https://laptopaz.vn/media/product/1924_32688_acer_predator_triton_500_pt515_52_75fr_5_1f3c0a8113224e1a86cc2cb49f51ad0a_master.png" alt=""></p>
            <p>&nbsp;</p>
            <h2><strong>B&Agrave;N PH&Iacute;M RGB PER-KEY NỔI BẬT</strong></h2>
            <p>Trang bị b&agrave;n ph&iacute;m với 86 ph&iacute;m c&oacute; thể t&ugrave;y chỉnh m&agrave;u cho từng ph&iacute;m, dễ d&agrave;ng thực hiện bằng phần mềm Predator Sense. Với mỗi ph&iacute;m sẽ c&oacute; 16,8 triệu m&agrave;u để lựa chọn, game thủ sẽ c&oacute; nhiều c&aacute;ch s&aacute;ng tạo v&agrave; sở hữu b&agrave;n ph&iacute;m d&agrave;nh ri&ecirc;ng cho m&igrave;nh.</p>
            <p>B&agrave;n ph&iacute;m với c&aacute;c cụm WASD v&agrave; cụm ph&iacute;m điều hướng được l&agrave;m nổi bật, chuyển m&agrave;u h&agrave;i h&ograve;a theo sự thay đổi đ&egrave;n nền RGB từng ph&iacute;m</p>
            <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="https://laptopaz.vn/media/product/1924_32688_acer_predator_triton_500_pt515_52_75fr_2_fdcdf9eb485041f3883d0bb9be48d1cd_master.png" alt=""></p>
            <p><strong>M&agrave;n h&igrave;nh</strong></p>
            <p>M&agrave;n h&igrave;nh của Triton 500 c&oacute; viền mỏng chỉ 6.3 mm, gi&uacute;p chiếc m&aacute;y đạt tỷ lệ m&agrave;n h&igrave;nh so với th&acirc;n m&aacute;y lớn. V&ograve;ng bo m&agrave;n h&igrave;nh ngũ gi&aacute;c g&oacute;c cạnh kết hợp với viền m&agrave;n h&igrave;nh si&ecirc;u mỏng v&agrave; khả năng mở m&agrave;n h&igrave;nh g&oacute;c 180 độ khiến thiết kế của Triton 500 l&agrave; thiết kế gaming độc đ&aacute;o kh&ocirc;ng thể nhầm lẫn. &nbsp;M&agrave;n h&igrave;nh 15.6 inch Full HD với tấm nền IPS kết hợp với tần số qu&eacute;t 300Hz v&agrave; tốc độ phản hồi si&ecirc;u nhanh mang lại trải nghiệm gaming ho&agrave;n hảo</p>
            <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img src="https://laptopaz.vn/media/product/1924_32687_acer_predator_triton_500_pt515_52_75fr_0af704c51e744262a234805d3bfa01e2_master.png" alt=""></p>
            <p><strong>Tản nhiệt</strong></p>
            <p>Chiếc m&aacute;y n&agrave;y được trang bị tới 3 quạt tản nhiệt, gồm một quạt tản nhiệt AeroBlade 3D mới thế hệ thứ 4 với hiệu năng tản nhiệt hơn 45%. Quạt n&agrave;y được cấu th&agrave;nh từ 59 l&aacute; quạt c&aacute;nh th&eacute;p, mỏng chỉ 0.1mm, c&oacute; r&atilde;nh răng cưa ở mỗi l&aacute; th&eacute;p gi&uacute;p giảm thểu tiếng ồn khi hoạt động ở cường độ cao.&nbsp;Thiết kế Vortex Flow cải tiến tr&ecirc;n Triton 500 mới mang khả năng h&uacute;t gi&oacute; mạnh hơn v&agrave;o th&acirc;n m&aacute;y, tạo ra luồng kh&iacute; xo&aacute;y, n&acirc;ng cao hiệu quả tản nhiệt khi giảm được 16% lượng nhiệt, 7% độ ồn so với phi&ecirc;n bản cũ.</p>
            <p>N&uacute;t Turbo được thiết kế tiện lợi đặt ngay tr&ecirc;n b&agrave;n ph&iacute;m cho ph&eacute;p &eacute;p xung phần cứng, tăng tốc độ quạt ngay lập tức, gi&uacute;p nhiệt độ hệ thống giữ ở mức ổn định đồng thời &quot;giữ nhiệt&quot; cho những trận đấu đầy căng thẳng.</p>
            <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src="https://laptopaz.vn/media/product/1924_32688_acer_predator_triton_500_pt515_52_75fr_5_1f3c0a8113224e1a86cc2cb49f51ad0a_master.png" alt=""></p>
            <p><strong>Hiệu năng cực khủng</strong></p>
            <p>Trang bị vi xử l&yacute; Intel&reg; Core&trade; i7-10875H (2.30 GHz upto 5.10 GHz, 16MB) v&agrave; card đồ họa mới nhất từ NVIDIA GeForce RTX 2070 Super&trade; 8GB GDDR6. B&ecirc;n cạnh đ&oacute; l&agrave; sự g&oacute;p sức của ổ SSD dung lượng 1024GB PCIe NVMe v&agrave; bộ nhớ RAM 32GB DDR4 2933MHz &nbsp;mang lại hiệu suất đỉnh cao v&agrave; đảm bảo t&iacute;nh ch&acirc;n thực của h&igrave;nh ảnh ở mức độ đ&aacute;ng kinh ngạc.</p>
            <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src="https://laptopaz.vn/media/product/1924_32687_acer_predator_triton_500_pt515_52_75fr_0af704c51e744262a234805d3bfa01e2_master.png" alt=""></p>
        </div>
    </div>
</div>
<div><br></div>', N'Intel® Core™ i7-10875H', N'32GB DDR4 Bus 3200MHz', N'SSD 1TB NVMe', N'NVIDIA RTX 2070 Super', N'15.6 inch FHD IPS 300Hz', N'HD 720P', N' Thunderbolt 3  3 x USB 3.2  HDMI  LAN (RJ45)Mini DisplayPort', N'2.1 kg', N'4-cell, 84 Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/acer_predator_pic_1.JPG', CAST(N'2022-04-09 16:56:53.637' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (69, N'Acer Nitro 5 2021 AN515-45', 1012, CAST(25000000 AS Decimal(18, 0)), 12, CAST(22000000 AS Decimal(18, 0)), N'[Mới 100%] Acer Nitro 5 2021 AN515-45 (Ryzen 5 - 5600H, 8GB, 512GB, GTX 1650, 15.6" FHD 144Hz)
', N'<div>
    <div>
        <div>
            <p><strong>Laptop Acer Nitro 5 AMD AN515-45-R3SM NH.QBMSV.005 B&Ugrave;NG NỔ SỨC MẠNH VỚI AMD&nbsp;RYZEN 5000</strong><strong>&nbsp; &nbsp;&nbsp;</strong></p>
            <p><img src="https://laptopaz.vn/media/product/1994_n1.png" alt=""></p>
            <p>Năm 2021 ch&agrave;o đ&oacute;n nhiều gương mặt laptop gaming &ldquo;tuy cũ m&agrave; mới&rdquo;, v&igrave; sao lại như vậy? <strong>Nitro 5</strong> &ndash; c&aacute;i t&ecirc;n đ&atilde; qu&aacute; quen thuộc với c&aacute;c game thủ v&agrave; cũng l&agrave; niềm ao ước của nhiều anh em nhưng trong năm 2021 n&agrave;y &nbsp;Acer đ&atilde; cho ra mắt phi&ecirc;n bản <strong>Nitro 5</strong> 2021 t&iacute;ch hợp bộ vi xử l&yacute; AMD Ryzen 5000 series đầu ti&ecirc;n tại Việt Nam.</p>
            <p><strong>Ngoại h&igrave;nh ấn tượng</strong></p>
            <p>Phải n&oacute;i trong nhiều năm qua<strong>,&nbsp;Nitro 5</strong> đ&atilde; ng&agrave;y c&agrave;ng được chăm ch&uacute;t tỉ mỉ về thiết kế khiến em n&oacute; kh&ocirc;ng hề nh&agrave;m ch&aacute;n m&agrave; ngược lại lu&ocirc;n khiến c&aacute;c anh em bị thu h&uacute;t bởi ngoại h&igrave;nh ấn tượng, c&aacute; t&iacute;nh của m&igrave;nh. Với c&aacute;c anh em game thủ &quot;s&agrave;nh điệu&quot; th&igrave; h&igrave;nh thức &nbsp;l&agrave; một trong những ti&ecirc;u ch&iacute; quan trọng khi chọn lựa mua cho m&igrave;nh 1 chiếc chiếc laptop gaming, với <strong>Nitro 5</strong> th&igrave; c&aacute;c anh em d&ugrave; kh&oacute; t&iacute;nh đến mấy cũng lu&ocirc;n h&agrave;i l&ograve;ng với ngoại h&igrave;nh &quot;chất ngầu&quot; nhưng trọng lượng lại kh&ocirc;ng qu&aacute; nặng nề chỉ 2.2kg, thoải m&aacute;i để bạn &nbsp;mang theo đến bất k&igrave; đ&acirc;u.</p>
            <p><img src="https://laptopaz.vn/media/product/1994_n4.jpg" alt=""></p>
            <p><strong>Nitro 5</strong> sử dụng chất liệu nhựa cao cấp, bền đẹp đồng thời với chất liệu n&agrave;y cũng g&oacute;p phần cắt giảm chi ph&iacute;. Cảm quan ban đầu th&igrave; chiếc <strong>Nitro 5</strong> n&agrave;y cũng giống như c&aacute;c thế hệ tiền nhiệm trước, kh&ocirc;ng c&oacute; qu&aacute; nhiều kh&aacute;c biệt với c&aacute;c đường n&eacute;t g&oacute;c cạnh, hầm hố, thiết kế 04 hốc tản nhiệt lớn xung quanh v&agrave; led RGB 04 v&ugrave;ng ở khu vực b&agrave;n ph&iacute;m.</p>
            <p>Nắp capo ch&iacute;nh l&agrave; sự kh&aacute;c biệt so với thế hệ tiền nhiệm khi &nbsp;kh&ocirc;ng c&ograve;n sự &ldquo;hiện diện&rdquo; của hai đường ph&acirc;y xước như tr&ecirc;n phi&ecirc;n bản AN515 2020.</p>
            <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src="https://laptopaz.vn/media/product/1994_n5.jpg" alt=""></p>
            <p>Bản lề chắc chắn c&oacute; thể mở m&aacute;y l&ecirc;n bằng 1 tay v&agrave; cho g&oacute;c mở m&agrave;n h&igrave;nh l&ecirc;n 160 độ.</p>
            <p>Phần viền&nbsp;m&agrave;n h&igrave;nh&nbsp;được tinh chỉnh mỏng hơn chỉ c&ograve;n 7,02 mm khiến to&agrave;n bộ th&acirc;n m&aacute;y sẽ nhỏ gọn hơn thế hệ trước nhưng k&iacute;ch thước m&agrave;n h&igrave;nh kh&ocirc;ng giảm,&nbsp;mang đến khả năng trải nghiệm thị gi&aacute;c v&ocirc; c&ugrave;ng m&atilde;n nh&atilde;n khi giải tr&iacute;, xem phim hoặc chơi game.</p>
            <p>&nbsp; <img src="https://laptopaz.vn/media/product/1994_n2.jpg" alt=""></p>
            <p>C&oacute; thể mở nắp chỉ bằng một tay để lộ b&agrave;n ph&iacute;m kiểu chiclet k&iacute;ch thước đầy đủ với b&agrave;n ph&iacute;m số. B&agrave;n ph&iacute;m full-size với layout sắp xếp hợp l&iacute;, h&agrave;nh tr&iacute;nh ph&iacute;m kh&aacute; s&acirc;u gi&uacute;p người chơi g&otilde; ph&iacute;m thoải m&aacute;i, kh&aacute; nhạy. Vẫn trang bị đ&egrave;n nền RGB 4 v&ugrave;ng tr&ecirc;n b&agrave;n ph&iacute;m như Nitro 5 2020. &nbsp;Cụm ph&iacute;m W-A-S-D v&agrave; 04 ph&iacute;m điều hướng đều được thiết kế kh&aacute; nổi bật tr&ecirc;n tổng thể b&agrave;n ph&iacute;m, font chữ to gi&uacute;p người chơi dễ nhận biết khi chơi game.</p>
            <p>TouchPad c&oacute; viền m&agrave;u đỏ c&oacute; k&iacute;ch thước 106mm x 78mm v&agrave; được đặt lệch sang b&ecirc;n tr&aacute;i.</p>
            <p><img src="https://laptopaz.vn/media/product/1994_n3.jpg" alt=""></p>
            <p>Về cổng kết nối, <strong>Nitro 5 2021</strong> kh&ocirc;ng qu&ecirc;n trang bị đầy đủ v&agrave; đa dạng nhất c&aacute;c cổng kết nối : cổng USB-C, &nbsp;cổng USB-A, HDMI cho bạn dễ d&agrave;ng kết nối với TV hoặc m&agrave;n h&igrave;nh rời b&ecirc;n ngo&agrave;i, cổng LAN RJ-45 v&agrave; jack tai nghe 3.5mm.</p>
            <p>Tuy m&aacute;y kh&ocirc;ng c&ograve;n trang bị khe thẻ nhớ nhưng h&atilde;ng đ&atilde; &ldquo;b&ugrave; đắp&rdquo; cho người d&ugrave;ng cổng USB type C &nbsp;gi&uacute;p truyền dữ liệu v&agrave; sạc c&aacute;c thiết bị b&ecirc;n ngo&agrave;i.</p>
            <p>&nbsp; <img src="https://laptopaz.vn/media/lib/1994_n6.png" alt=""></p>
            <p>Jack cắm d&acirc;y nguồn điện được chuyển ra ph&iacute;a sau với mục đ&iacute;ch để quạt th&ocirc;ng gi&oacute; c&oacute; vị tr&iacute; th&iacute;ch hợp hơn.&nbsp;</p>
            <p>Sạc bằng bộ đổi nguồn AC 135W, 19,5V, 6,92A với ch&acirc;n cắm 5,5mm. &nbsp;Bộ sạc n&agrave;y mỏng v&agrave; nhẹ hơn nhiều bộ sạc kh&aacute;c. Qu&aacute; tr&igrave;nh sạc đầy chỉ mất khoảng 2,5 giờ với đ&egrave;n LED sạc chuyển từ m&agrave;u hổ ph&aacute;ch sang m&agrave;u xanh lam</p>
            <p><strong>Tản nhiệt</strong></p>
            <p>Nhận biết được tầm quan trọng của tản nhiệt tới hiệu suất chơi game v&agrave; tuổi thọ của m&aacute;y t&iacute;nh x&aacute;ch tay, n&ecirc;n ở Nitro 5 2021 kh&aacute; &ldquo;đầu tư&rdquo; cho hệ thống tản nhiệt với 2 quạt cỡ lớn, v&agrave; 3 ống đồng tản nhiệt được sơn c&aacute;ch nhiệt. Kết hợp c&ocirc;ng nghệ <strong>CoolBoost</strong> gi&uacute;p tăng tốc độ quạt l&ecirc;n 10%, đ&acirc;y l&agrave; c&ocirc;ng nghệ gi&uacute;p tối ưu ho&aacute; hiệu suất nhờ kết hợp giữa phần cứng v&agrave; phần mềm. C&ocirc;ng nghệ n&agrave;y l&agrave; độc quyền của Nitro 5 v&agrave; Nitro 7.</p>
            <p><img src="https://laptopaz.vn/media/product/1994_n1.png" alt=""></p>
            <p>&nbsp;</p>
            <p>C&aacute;c t&aacute;c vụ n&agrave;o nặng sẽ được ưu ti&ecirc;n&nbsp;tản nhiệt&nbsp;tốt để kh&ocirc;ng l&agrave;m giảm hiệu năng, b&igrave;nh thường khi c&aacute;c anh em chạy c&aacute;c t&aacute;c vụ chơi game b&igrave;nh thường th&igrave; m&aacute;y n&oacute;ng từ 70 đến 85 độ C n&ecirc;n hệ thống tản nhiệt sẽ kh&ocirc;ng hoạt động hết c&ocirc;ng suất.<strong>&nbsp;CoolBoost</strong> được k&iacute;ch hoạt khi c&aacute;c anh em sử dụng c&aacute;c phần mềm nặng như render đồ hoạ, chơi game hoặc nhiệt độ của m&aacute;y tr&ecirc;n 85 độ C hay, m&aacute;y sẽ giảm từ 5 đến 10 độ C một c&aacute;ch nhanh ch&oacute;ng.</p>
            <p><img src="https://laptopaz.vn/media/product/1994_n4.jpg" alt=""></p>
            <p>Nghe th&igrave; phức tạp nhưng c&ocirc;ng nghệ tiến tiến<strong>&nbsp;CoolBoost</strong> được điều khiển &nbsp;rất dễ d&agrave;ng bằng phần mềm Nitro Sense c&oacute; khả năng bật CoolBoost với điều chỉnh ba chế độ tăng tốc quạt v&agrave; gi&uacute;p m&aacute;y giảm nhiệt độ ngay lập tức.</p>
            <p>Chỉ với một n&uacute;t chạm, anh em đ&atilde; c&oacute; thể truy cập nhanh v&agrave;o v&agrave;o Ph&iacute;m n&oacute;ng ngay tr&ecirc;n b&agrave;n ph&iacute;m. C&oacute; thể theo d&otilde;i nhiệt độ v&agrave; tốc độ quạt, c&oacute; thể điều chỉnh m&agrave;u b&agrave;n ph&iacute;m RGB.</p>
            <p>&nbsp; &nbsp;<img src="https://laptopaz.vn/media/product/1994_n5.jpg" alt=""></p>
            <p><strong>Chất lượng h&igrave;nh ảnh</strong></p>
            <p>M&agrave;n h&igrave;nh IPS&nbsp;c&oacute; k&iacute;ch thước 15.6 inch với độ ph&acirc;n giải Full HD mang tới h&igrave;nh ảnh hiển thị r&otilde; n&eacute;t, m&agrave;u sắc ch&acirc;n thực ở g&oacute;c nh&igrave;n rộng kể cả ở g&oacute;c nh&igrave;n hẹn nhất.</p>
            <p><img src="https://laptopaz.vn/media/lib/1994_n6.png" alt=""></p>
            <p>Với c&aacute;c anh em m&ecirc; mẩn c&aacute;c tựa game cần tốc độ nhanh như tựa game bắn s&uacute;ng FPS, đ&aacute; b&oacute;ng, đua xe tốc độ cao th&igrave; <strong>tần số qu&eacute;t 144Hz</strong> chắc chắn l&agrave; th&ocirc;ng số ho&agrave;n hảo m&agrave; bạn đang mong chờ ở chiếc laptop gaming. Với c&aacute;c th&ocirc;ng số kh&aacute;c l&agrave; độ s&aacute;ng cao 300 nits v&agrave; độ phủ m&agrave;u sRGB gần 100% th&igrave; so với c&aacute;c phi&ecirc;n bản tiền nhiệm trước th&igrave; Nitro 5 2021 c&oacute; dải m&agrave;u v&agrave; độ s&aacute;ng tương tự.</p>
            <p><img src="https://laptopaz.vn/media/product/1994_n2.jpg" alt=""></p>
            <p><strong>Hiệu năng</strong></p>
            <p>Điểm &ldquo;s&aacute;ng gi&aacute;&rdquo; nhất tr&ecirc;n chiếc laptop <strong>Nitro 5 2021</strong> n&agrave;y l&agrave; cấu h&igrave;nh cực mạnh, với sự g&oacute;p mặt của chip <strong>AMD Ryzen&trade; 5-5600H</strong> kết hợp với <strong>8GB DDR4 3200Mhz</strong> v&agrave; card đồ họa <strong>NVIDIA GTX 1650 4GB</strong>. Nh&igrave;n qua th&ocirc;i cũng đ&atilde; đủ thu h&uacute;t c&aacute;c anh em game thủ phải kh&aacute;m ph&aacute; rồi.</p>
            <p><img src="https://laptopaz.vn/media/product/1994_n3.jpg" alt=""></p>
            <p>Sử dụng con chip <strong>AMD Ryzen&trade; 5000 Series</strong>&nbsp; c&oacute; xung nhịp 3.3GHz upto 4.2GHz, 6 nh&acirc;n 12 luồng l&agrave; bộ xử l&yacute; laptop ti&ecirc;n tiến nhất tr&ecirc;n thế giới để, được chế tạo bằng c&ocirc;ng nghệ vi xử l&yacute; 7nm đột ph&aacute; mới nhất mang lại hiệu quả vượt trội, hiệu suất cao, chạy mượt m&agrave; c&aacute;c ứng dụng nặng. Kết hợp với bộ nhớ RAM 8GB DDR4 3200Mhz &nbsp;hỗ trợ đa nhiệm đa t&aacute;c vụ tốt hơn cho người d&ugrave;ng.</p>
            <p><img src="https://anphat.com.vn/media/lib/23-04-2021/nitro-5-ksp-2-l.jpg" alt="" width="794" height="441"></p>
            <p>Ngo&agrave;i ra m&aacute;y c&ograve;n được trang bị ổ&nbsp;NVMe SSD&nbsp;dung lượng 512GB kh&aacute; lớn gi&uacute;p người d&ugrave;ng c&oacute; thể tận hưởng tốc độ truyển tải dữ liệu v&agrave; khởi động si&ecirc;u nhanh, gi&uacute;p bạn kh&ocirc;ng bao giờ bị &ldquo;chậm trễ&rdquo; với c&aacute;c t&aacute;c vụ nặng như chơi game..</p>
            <p>Kh&ocirc;ng thể kh&ocirc;ng nhắc tới chiếc Card đồ họa rời Geforce GTX 1650 &ldquo;huyền thoại&rdquo;, sẽ thật thiếu s&oacute;t cho Nitro 5 2021 kh&ocirc;ng trang bị cho m&igrave;nh chiếc card đồ họa rời mạnh mẽ đến từ&nbsp;VGA NVIDIA. Với khả năng chiến mượt m&agrave; với mức FPS ổn định ở c&aacute;c tựa game nặng đang rất Hot tr&ecirc;n thị trường hiện nay: Shadow of Tomb Raider, Assassin&apos;s Creed Odyssey, Battlefield 5, Far Cry New Dawn, ,&hellip;ở mức đồ họa Medium tới High.</p>
            <p>Chơi game muốn mượt m&agrave; th&igrave; đừng qu&ecirc;n ch&uacute; trọng tới đường truyền kết nối mạng, n&ecirc;n bạn c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m với C&ocirc;ng nghệ <strong>Wifi 6</strong> v&agrave; <strong>Killer&trade; Ethernet</strong> đảm bảo đường truyền lu&ocirc;n ổn định v&agrave; tốc độ si&ecirc;u nhanh.</p>
            <p>&nbsp; &nbsp; <img src="https://laptopaz.vn/media/product/1994_n1.png" alt=""></p>
            <p><strong>Khả năng năng cấp cực đỉnh</strong></p>
            <p>Nếu như nhu cầu của bạn cho giải tr&iacute; cao hơn th&igrave; đừng lo về khả năng n&acirc;ng cấp của chiếc m&aacute;y n&agrave;y, bạn ho&agrave;n to&agrave;n c&oacute; thể n&acirc;ng cấp dễ d&agrave;ng ngay tr&ecirc;n Nitro 5 2021. Ở phần RAM, vẫn cho người d&ugrave;ng dễ t&ugrave;y biến cấu h&igrave;nh ở mức cao nhất với 02 khe RAM chuẩn DDR4 tối đa l&ecirc;n đến 32GB. C&ograve;n ở phần ổ cứng th&igrave; thật &ldquo;h&agrave;o ph&oacute;ng&rdquo; khi h&atilde;ng đ&atilde; hỗ trợ để người d&ugrave;ng c&oacute; thể n&acirc;ng cấp th&ecirc;m l&ecirc;n tới&nbsp;tối đa 2 TB SSD v&agrave; 2TB HDD.</p>
            <h2>&Acirc;m thanh sống động, ch&acirc;n thực</h2>
            <p>Một chiếc laptop &quot;xịn&quot; như vậy kh&ocirc;ng thể thiếu những c&ocirc;ng nghệ &acirc;m thanh tốt, trải nghiệm thế giới &acirc;m thanh ch&acirc;n thực sống động nhờ được t&iacute;ch hợp phần mềm &acirc;m thanh DTS:X&reg; Ultra gi&uacute;p t&aacute;i tạo &acirc;m thanh 3D v&agrave; Acer True Harmony với 6 chế độ t&ugrave;y chỉnh &acirc;m thanh. Với &acirc;m thanh chất lượng cao, người chơi sẽ thực sự được h&ograve;a m&igrave;nh v&agrave;o kh&ocirc;ng gian trong game cũng như nh&acirc;n vật m&agrave; bạn h&oacute;a th&acirc;n.</p>
            <p><strong>Kết luận:&nbsp;</strong>Acer Nitro 5 2021 AN515<strong>&nbsp;</strong>l&agrave; một trong những sự lựa chọn h&agrave;ng đầu của d&ograve;ng m&aacute;y Gaming. Sở hữu thiết kế hầm hố nhưng cũng kh&ocirc;ng k&eacute;m phần tinh tế, kết hợp c&ugrave;ng cấu h&igrave;nh mạnh mẽ v&agrave; tản nhiệt m&aacute;t mẻ, Acer Nitro 5 2021 AN515 tự tin c&oacute; thể chinh phục được đa số c&aacute;c Game Online, Offline thời thượng hiện nay. Hơn thế nữa Acer Nitro 5 2021 AN515 cũng đủ sức đ&aacute;p ứng c&aacute;c t&aacute;c vụ thiết kế đồ họa, c&ocirc;ng việc, giải tr&iacute; một c&aacute;ch mượt m&agrave; nhất.</p>
        </div>
    </div>
</div>
<div><br></div>', N'Ryzen 5 - 5600H', N'Ryzen 5 - 5600H', N'SSD 512GB NVMe', N'NVIDIA® GeForce® GTX 1650 4GB GDDR6', N'15.6 inch FHD(1920 x 1080) IPS 144Hz slim bezel LCD', N'HD 720P', N'1 x USB 3.2 Gen 2 port featuring power-off USB charging', N'2.2 kg', N'4 Cell 57Wh', N'Windows 10 Home bản quyền', 1, N'/images/pictures/acer_nitro5_pic_1.jpg', CAST(N'2022-04-09 16:58:35.473' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (70, N'Acer Predator Triton 300', 1012, CAST(39000000 AS Decimal(18, 0)), 8, CAST(35880000 AS Decimal(18, 0)), N'[Mới 100%] Acer Predator Triton 300 Core i7-10750H, 16GB, 512GB, RTX 2070 Max-Q, 15.6'''' FHD 240Hz
', N'<div>
    <div>
        <div>
            <div>
                <h2>PREDATOR TRITON 300 laptop thời trang, chơi game thời thượng</h2>
                <p><img src="https://laptopaz.vn/media/product/2002_a4.jpg" alt=""></p>
                <p>Được trang bị đồ họa NVIDIA&reg; GeForce RTX &trade; 30 Series1, l&ecirc;n đến Bộ xử l&yacute; Intel&reg; Core &trade; i7 v&agrave; C&ocirc;ng nghệ quạt 3D AeroBlade &trade; thế hệ thứ 5 được thiết kế ri&ecirc;ng của ch&uacute;ng t&ocirc;i - chiếc m&aacute;y n&agrave;y lu&ocirc;n sẵn s&agrave;ng để chơi - mọi l&uacute;c mọi nơi.</p>
                <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a2.jpg" alt=""></p>
                <p>BẬT M&Iacute; TRONG lớp vỏ kim loại, tối m&agrave;u của n&oacute; l&agrave; tất cả những g&igrave; bạn cần: l&ecirc;n đến Bộ xử l&yacute; Intel&reg; Core &trade; i7, đồ họa GeForce RTX &trade; 30 Series, bộ nhớ DDR4 3200MHz l&ecirc;n đến 16GB v&agrave; nhiều bộ nhớ PCIe tốc độ cao &nbsp;để điền từ thư viện tr&ograve; chơi của bạn.</p>
                <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a3.jpg" alt=""></p>
                <p><img src="https://laptopaz.vn/media/product/2002_a5.jpg" alt=""></p>
                <p>NVIDIA&reg; GEFORCE RTX &trade; 30 SERIES C&aacute;c GPU n&agrave;y mang lại hiệu suất tối ưu cho game thủ v&agrave; người s&aacute;ng tạo. &nbsp;Ch&uacute;ng được cung cấp năng lượng bởi kiến tr&uacute;c Bộ khuếch đại RTX thế hệ thứ 2 của NVIDIA - với L&otilde;i d&ograve; tia mới, L&otilde;i Tensor v&agrave; c&aacute;c bộ xử l&yacute; đa xử l&yacute; ph&aacute;t trực tuyến để c&oacute; một bước nhảy vọt về hiệu suất. &nbsp;M&aacute;y t&iacute;nh x&aacute;ch tay n&agrave;y cũng sử dụng C&ocirc;ng nghệ NVIDIA&reg; Max-Q Thế hệ thứ 3 để c&oacute; hiệu suất v&agrave; hiệu suất cao nhất.</p>
                <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a1.jpg" alt=""></p>
                <p>3RD GEN TENSOR CORES Nhận th&ocirc;ng lượng gấp 2 lần với cấu tr&uacute;c thưa thớt v&agrave; c&aacute;c thuật to&aacute;n AI n&acirc;ng cao như DLSS. &nbsp;C&aacute;c l&otilde;i n&agrave;y mang lại hiệu suất tr&ograve; chơi tăng đ&aacute;ng kể v&agrave; khả năng AI ho&agrave;n to&agrave;n mới.</p>
                <p>2ND GEN RT CORES T&iacute;nh năng d&ograve; tia m&ocirc; phỏng h&agrave;nh vi thực của &aacute;nh s&aacute;ng để mang lại chất lượng điện ảnh, thời gian thực cho c&aacute;c tr&ograve; chơi trực quan nhất.</p>
                <p>C&Ocirc;NG NGHỆ 3RD GEN MAX-Q Mọi kh&iacute;a cạnh của m&aacute;y t&iacute;nh x&aacute;ch tay, chip, phần mềm, thiết kế PCB, ph&acirc;n phối điện v&agrave; nhiệt, đều được tối ưu h&oacute;a cho năng lượng v&agrave; hiệu suất.</p>
                <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a6.png" alt=""></p>
                <p>C&Ocirc;NG NGHỆ QUẠT 3D THẾ HỆ 5 AEROBLADE &trade; Để giữ kh&ocirc;ng kh&iacute; m&aacute;t di chuyển nhanh ch&oacute;ng qua m&aacute;y t&iacute;nh x&aacute;ch tay, Triton 300 sử dụng phương ph&aacute;p tiếp cận quạt k&eacute;p v&agrave; c&ocirc;ng nghệ Quạt 3D AeroBlade &trade; thế hệ thứ 5 được thiết kế ri&ecirc;ng của ch&uacute;ng t&ocirc;i.</p>
                <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a4.jpg" alt=""></p>
                <p>THIẾT KẾ BIONIC Lấy cảm hứng từ cơ chế bay im lặng, mạnh mẽ được kiểm tra tr&ecirc;n động vật, ch&uacute;ng t&ocirc;i đ&atilde; tạo cho quạt của m&igrave;nh một cạnh răng cưa, cho ph&eacute;p nhiều kh&ocirc;ng kh&iacute; đi qua hơn.</p>
                <p>M&Agrave;N H&Igrave;NH SI&Ecirc;U MỎNG Mỗi trong số 89 lưỡi dao sinh học chỉ d&agrave;y 0,08mm v&agrave; ho&agrave;n to&agrave;n bằng kim loại với r&atilde;nh thụt k&eacute;p ổn định.</p>
                <p>HƯỚNG DẪN GI&Oacute; Được thiết kế để chuyển hướng luồng kh&ocirc;ng kh&iacute; ch&iacute;nh x&aacute;c đến nơi dự định v&agrave; ổn định hơn nữa quạt ở tốc độ cao - giảm nhiễu loạn v&agrave; tiếng ồn.</p>
                <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a2.jpg" alt=""></p>
                <p>L&Agrave;M CHO TỐC ĐỘ Quyết định cuộc gọi n&agrave;o cho bạn: FHD b&ugrave;ng nổ ở 240Hz hay QHD nguy&ecirc;n sơ ở 165Hz. &nbsp;Phản hồi tăng tốc 3ms cũng gi&uacute;p cho việc khởi động m&aacute;y t&iacute;nh x&aacute;ch tay n&agrave;y l&ecirc;n thiết bị cao trở th&agrave;nh trải nghiệm liền mạch, kh&ocirc;ng bị x&eacute; h&igrave;nh với độ mờ tối thiểu.</p>
                <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a3.jpg" alt=""></p>
            </div>
            <div>
                <p>PORTS APLENTY Cắm tất cả c&aacute;c thiết bị ngoại vi của bạn v&agrave;o đầy đủ c&aacute;c cổng, bao gồm HDMI 2.1, miniDP 1.4 v&agrave; Thunderbolt &trade; 4 Type-C cực nhanh. &nbsp;Chỉ ri&ecirc;ng th&ocirc;ng số kỹ thuật HDMI 2.1 cho ph&eacute;p bạn dễ d&agrave;ng cắm v&agrave;o m&agrave;n h&igrave;nh ngo&agrave;i chẳng hạn như 4K ở 120Hz.</p>
                <p>&nbsp;<img src="https://laptopaz.vn/media/product/2002_a1.jpg" alt=""></p>
            </div>
        </div>
    </div>
</div>
<div><br></div>', N'Intel® Core™ i7-10750H', N'16GB DDR4 Bus 3200MHz', N'SSD 512GB NVMe', N'NVIDIA GeForce RTX 2070 Max-Q', N'15.6 inch FHD IPS 240Hz', N'HD 720P', N' nối	  2 x USB 3.2 (Thế hệ thứ nhất)  1 x USB 3.2 (Thế hệ thứ hai) Loại C  1 x Cổng USB 3.2 (Thế hệ thứ hai) với sạc tắt nguồn  1 x Cổng hiển thị nhỏ  1 x Cổng HDMI', N'2.5 kg', N'74Wh', N'Windows 10 bản quyền', 0, N'/images/pictures/acer_predator_pic_1.JPG', CAST(N'2022-04-09 17:00:27.200' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (71, N'Acer Nitro 5 Eagle AN515-57', 1012, CAST(31000000 AS Decimal(18, 0)), 15, CAST(26350000 AS Decimal(18, 0)), N'[Mới 100%] Acer Nitro 5 Eagle AN515-57 (Core i7-11800H, 8GB, 512GB, RTX 3050 4GB, 15.6'''' FHD 144Hz)
', N'<h2><span>Acer Nitro 5 Eagle AN515&nbsp;thiết kế mạnh mẽ hơn</span></h2>
<p><span>Chiếc m&aacute;y n&agrave;y&nbsp;c&oacute; k&iacute;ch thước m&agrave;n h&igrave;nh l&agrave; 15,6 inch c&ugrave;ng với hai t&ugrave;y chọn&nbsp;Intel Core i5-11400H&nbsp;v&agrave;&nbsp;Intel Core i7-11800H. Tận hưởng trải nghiệm chơi game mượt m&agrave;, kh&ocirc;ng bị nh&ograve;e với tốc độ l&agrave;m mới&nbsp;144Hz. M&agrave;n h&igrave;nh viền mỏng cũng đ&atilde; được tăng tỷ lệ so với th&acirc;n m&aacute;y l&ecirc;n 80%. Mức độ s&aacute;ng cũng được tăng l&ecirc;n 300 nits, trước đ&acirc;y chỉ l&agrave; 275 nits ở phi&ecirc;n bản Nitro 5 trước đ&acirc;y.</span></p>
<p><img src="https://laptopaz.vn/media/lib/2271_8.jpg" alt="" /></p>
<p><span>Thiết kế b&ecirc;n ngo&agrave;i cũng nổi bật hơn một ch&uacute;t, với một mảng m&agrave;u đỏ cho c&aacute;c v&acirc;y ở mặt sau của laptop. Thay đổi n&agrave;y thay thế cho bản lề m&agrave;u đỏ, &ecirc;m hơn so với năm ngo&aacute;i.&nbsp;B&agrave;n ph&iacute;m RGB 4 v&ugrave;ng&nbsp;c&oacute; đ&egrave;n nền gi&uacute;p l&agrave;m phong ph&uacute; trải nghiệm chơi game v&agrave; đẹp hơn.&nbsp;Acer Nitro 5 Eagle AN515 cũng được thiết kế để đ&aacute;p ứng mọi nhu cầu chơi game nhờ cấu h&igrave;nh, t&iacute;nh năng v&agrave; vị tr&iacute; thiết kế được điều chỉnh đặc biệt cho c&aacute;c hoạt động chơi game.</span></p>
<p><span>&nbsp;<img src="https://laptopaz.vn/media/lib/2271_4.jpg" alt="" /></span></p>
<h2><span>Card đồ họa với GPU NVIDIA RTX 3050</span></h2>
<p><span>NVIDIA&nbsp;GeForce&nbsp;RTX 3050&nbsp;được hỗ trợ bởi hiệu suất đồ họa cải tiến của kiến ​​tr&uacute;c&nbsp;NVIDIA Turing. Được thiết kế để mang đến sự kết hợp mạnh mẽ giữa đổi mới chơi game, đồ họa thế hệ tiếp theo v&agrave; tiết kiệm năng lượng. Với hiệu suất&nbsp;nhanh hơn tới 20%&nbsp;so với&nbsp;GTX 1650Ti, đ&acirc;y l&agrave; bộ card si&ecirc;u tốc cho c&aacute;c tr&ograve; chơi phổ biến nhất hiện nay v&agrave; ngay cả với c&aacute;c tựa game hiện đại.</span></p>
<p><span>&nbsp;<img src="https://laptopaz.vn/media/lib/2271_7.jpg" alt="" /></span></p>
<h2><span>Dễ d&agrave;ng n&acirc;ng cấp dung lượng</span></h2>
<p><span>Ngo&agrave;i việc sử dụng phần cứng mới nhất như bộ vi xử l&yacute;&nbsp;CPU&nbsp;Intel&nbsp;Core&nbsp;thế hệ thứ 11&nbsp;v&agrave; d&ograve;ng card&nbsp;NVIDIA&nbsp;GeForce&nbsp;RTX,&nbsp;Acer Nitro 5 Eagle AN515 cũng bao gồm c&aacute;c khả năng n&acirc;ng cấp gi&uacute;p d&ograve;ng Nitro vượt trội hơn so với phi&ecirc;n bản c&ugrave;ng loại.</span></p>
<p><span>Đi k&egrave;m với khả năng t&ugrave;y chỉnh bộ nhớ đến c&aacute;c t&ugrave;y chọn lưu trữ. Người d&ugrave;ng c&oacute; thể lắp RAM dung lượng l&ecirc;n đến 64GB, cũng như hai khe cắm NVMe SSD v&agrave; một khe cắm SSD SATA 2,5 inch. Ngo&agrave;i cổng Ethernet E2600, d&agrave;nh ri&ecirc;ng cho biến thể Intel, cổng USB C cũng hỗ trợ&nbsp;Thunderbolt 4&nbsp;đa chức năng v&agrave; c&oacute; tốc độ truyền dữ liệu nhanh hơn gấp 8 lần so với USB 3.0 th&ocirc;ng thường.</span></p>
<p><span>&nbsp;<img src="https://laptopaz.vn/media/lib/2271_6.jpg" alt="" /></span></p>
<p><span>Hai khe cắm SSD gi&uacute;p việc th&ecirc;m một SSD v&agrave;o&nbsp;Acer Nitro 5 Eagle AN515 thậm ch&iacute; c&ograve;n dễ d&agrave;ng hơn. Kh&ocirc;ng chỉ vậy, hai khe cắm n&agrave;y đ&atilde; hỗ trợ giao thức NVMe v&agrave; được trang bị một bộ tản nhiệt SSD đặc biệt trong mỗi khe, gi&uacute;p hiệu suất SSD kh&ocirc;ng bị giảm khi nhiệt độ tăng l&ecirc;n.</span></p>
<p><span>Nếu bạn vẫn muốn tăng dung lượng lưu trữ của m&igrave;nh nhiều để tiện cho c&ocirc;ng việc? Th&igrave; ch&uacute;ng ta c&oacute; hai khe cắm RAM c&oacute; thể được lấp đầy l&ecirc;n đến 64GB RAM DDR4 3200 MHz&nbsp;hỗ trợ k&ecirc;nh đ&ocirc;i.</span></p>
<p><span>&nbsp;<img src="https://laptopaz.vn/media/lib/2271_2.jpg" alt="" /></span></p>
<h2><span>Intel Wi-Fi 6 AX201 (802.11ax) v&agrave; Killer Ethernet E2600</span></h2>
<p><span>Một t&iacute;nh năng mới kh&aacute;c cho m&ocirc; h&igrave;nh năm nay,&nbsp;Acer Nitro 5 Eagle AN515 c&oacute; Intel Wi-Fi 6 AX201 (802.11ax)&nbsp;v&agrave;&nbsp;Killer DoubleShot Pro&nbsp;cải thiện hiệu suất v&agrave; độ ổn định mạng ưu ti&ecirc;n chơi game. Điều khiển Ethernet tự động ph&aacute;t hiện lỗi giữa c&aacute;c luồng tr&ograve; chơi, video v&agrave; tr&ograve; chuyện để chọn mức ưu ti&ecirc;n băng th&ocirc;ng nhằm mang lại trải nghiệm kh&ocirc;ng c&oacute; độ trễ. Khi chọn chế độ tự động, tr&igrave;nh tối ưu h&oacute;a mạng của c&aacute;c chiếc&nbsp;laptop Acer gaming 2021&nbsp;c&oacute; thể ph&acirc;n biệt c&aacute;c chương tr&igrave;nh nặng để kh&ocirc;ng xảy ra sự cố kết nối. Ngo&agrave;i ra, người d&ugrave;ng c&oacute; thể tự đặt mức độ ưu ti&ecirc;n của chương tr&igrave;nh, thay đổi ph&acirc;n bổ băng th&ocirc;ng cho từng ứng dụng v&agrave; thậm ch&iacute; chặn một số ứng dụng nhất định để đảm bảo kết nối tốt nhất.</span></p>
<p><span>&nbsp;<img src="https://laptopaz.vn/media/lib/2271_5.jpg" alt="" /></span></p>
<h2><span>Hệ thống nhiệt cải tiến với quạt k&eacute;p&nbsp;</span></h2>
<p><span>Bạn kh&ocirc;ng cần lo lắng về vấn đề qu&aacute; n&oacute;ng m&aacute;y nữa,&nbsp;Acer Nitro 5 Eagle AN515 đ&atilde; được bổ sung giải ph&aacute;p tản nhiệt s&aacute;ng tạo với thiết kế mới nhất để mang lại hiệu quả l&agrave;m m&aacute;t tốt hơn, ngay cả khi m&aacute;y chạy khối lượng c&ocirc;ng việc nặng.&nbsp;</span></p>
<p><span>&nbsp;<img src="https://laptopaz.vn/media/lib/2271_3.jpg" alt="" /></span></p>
<p><span>Được trang bị hệ thống l&agrave;m m&aacute;t quạt k&eacute;p sử dụng c&aacute;c cổng h&uacute;t/xả v&agrave; 4 lỗ tho&aacute;t nhiệt được đặt ở vị tr&iacute; chiến lược để đạt được mức tăng tổng thể 25% về hiệu suất nhiệt so với mẫu&nbsp;Acer Nitro 5 2020.</span></p>
<p><span>Kh&ocirc;ng thể kh&ocirc;ng kể đến c&ocirc;ng nghệ&nbsp;Acer CoolBoost&nbsp;với 4 lỗ th&ocirc;ng gi&oacute; ở ph&iacute;a dưới v&agrave; kết hợp với ứng dụng NitroSense để theo d&otilde;i nhiệt độ v&agrave; điều chỉnh hệ thống tản nhiệt. Hệ thống n&agrave;y được tối ưu h&oacute;a hơn nữa bởi c&ocirc;ng nghệ&nbsp;CoolBoost&nbsp;&nbsp;c&oacute; thể&nbsp;tăng tốc độ quạt l&ecirc;n 10%&nbsp;v&agrave;&nbsp;l&agrave;m m&aacute;t CPU/GPU l&ecirc;n 9%. Tất cả c&aacute;c t&aacute;c vụ điện to&aacute;n được đảm bảo trở n&ecirc;n thoải m&aacute;i hơn với c&ocirc;ng nghệ CoolBoost &nbsp;như một giải ph&aacute;p s&aacute;ng tạo để l&agrave;m m&aacute;t tốt hơn.</span></p>
<p><span><strong>Tổng Kết:</strong>&nbsp;Chiếc laptop&nbsp;Acer Nitro 5 Eagle AN515 n&agrave;y sẽ mang đến cho bạn những gi&acirc;y ph&uacute;t chiến game, l&agrave;m việc thật đ&atilde; mắt đấy&nbsp;sẽ l&agrave; một trong những lựa chọn tốt để bạn vừa l&agrave;m việc, giải tr&iacute; v&agrave; thư gi&atilde;n.</span></p>', N'Intel® Core™ i7-11800H', N'8GB DDR4 Bus 3200MHz', N'512GB SSD M2 NVMe', N'NVIDIA GeForce RTX 3050 4GB GDDR6', N'15.6" FHD (1920 x 1080) IPS, 144Hz, Anti-Glare', N'HD 720P', N'Type-A USB 3.1 (Gen 1), Type-A USB2.0, LAN, HDMI 2.0B, COMBO audio jack', N'2. kg', N'4 Cell, 48 Whr', N'Windows 10 bản quyền', 0, N'/images/pictures/acer_nitro_5_an515_pic_1.JPG', CAST(N'2022-04-09 17:06:09.120' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (72, N'Laptop Gaming Acer Nitro 5 2021 AN515-57-5700 ', 1012, CAST(25000000 AS Decimal(18, 0)), 14, CAST(21500000 AS Decimal(18, 0)), N'[REF] Laptop Gaming Acer Nitro 5 2021 AN515-57-5700 (Core i5 - 11400H, 8GB, 512GB, RTX3050, 15.6'''' FHD IPS 144Hz)
', N'<div>
    <div>
        <p>Acer Nitro 5 2021 AN515 Core i5 d&agrave;nh cho ai?</p>
        <p>&nbsp;</p>
        <p><br></p>
        <p>Nếu bạn đang t&igrave;m kiếm một chiếc laptop vừa c&oacute; khả năng đ&aacute;p ứng được nhiều chương tr&igrave;nh đồ họa, c&aacute;c ứng dụng game &quot;nặng&quot; m&agrave; vẫn đem đến trải nghiệm mượt m&agrave; v&agrave; chuy&ecirc;n nghiệp cho người sử dụng. Th&igrave; bạn kh&ocirc;ng thể bỏ qua chiếc laptop Acer Nitro 5 2021 AN515 Core i5 - chiếc laptop đang rất được ưa chuộng tr&ecirc;n thị trường. H&atilde;y c&ugrave;ng LaptopAZ đi t&igrave;m hiểu kỹ hơn nh&eacute;!</p>
        <p><br></p>
        <p><br></p>
        <p>Acer Nitro 5 2021 thiết kế mạnh mẽ hơn</p>
        <p>Chiếc m&aacute;y n&agrave;y c&oacute; k&iacute;ch thước m&agrave;n h&igrave;nh l&agrave; 15,6 inch c&ugrave;ng với hai t&ugrave;y chọn Intel Core i5-11400H v&agrave; Intel Core i7-11800H. Tận hưởng trải nghiệm chơi game mượt m&agrave;, kh&ocirc;ng bị nh&ograve;e với tốc độ l&agrave;m mới 144Hz. M&agrave;n h&igrave;nh viền mỏng cũng đ&atilde; được tăng tỷ lệ so với th&acirc;n m&aacute;y l&ecirc;n 80%. Mức độ s&aacute;ng cũng được tăng l&ecirc;n 300 nits, trước đ&acirc;y chỉ l&agrave; 275 nits ở phi&ecirc;n bản Nitro 5 trước đ&acirc;y.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Thiết kế b&ecirc;n ngo&agrave;i cũng nổi bật hơn một ch&uacute;t, với một mảng m&agrave;u đỏ cho c&aacute;c v&acirc;y ở mặt sau của laptop. Thay đổi n&agrave;y thay thế cho bản lề m&agrave;u đỏ, &ecirc;m hơn so với năm ngo&aacute;i. B&agrave;n ph&iacute;m RGB 4 v&ugrave;ng c&oacute; đ&egrave;n nền gi&uacute;p l&agrave;m phong ph&uacute; trải nghiệm chơi game v&agrave; đẹp hơn. Nitro 5 2021 AN515-57 cũng được thiết kế để đ&aacute;p ứng mọi nhu cầu chơi game nhờ cấu h&igrave;nh, t&iacute;nh năng v&agrave; vị tr&iacute; thiết kế được điều chỉnh đặc biệt cho c&aacute;c hoạt động chơi game.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Card đồ họa với GPU NVIDIA RTX 3050</p>
        <p>NVIDIA GeForce RTX 3050 được hỗ trợ bởi hiệu suất đồ họa cải tiến của kiến tr&uacute;c NVIDIA Turing. Được thiết kế để mang đến sự kết hợp mạnh mẽ giữa đổi mới chơi game, đồ họa thế hệ tiếp theo v&agrave; tiết kiệm năng lượng. Với hiệu suất nhanh hơn tới 20% so với GTX 1650Ti, đ&acirc;y l&agrave; bộ card si&ecirc;u tốc cho c&aacute;c tr&ograve; chơi phổ biến nhất hiện nay v&agrave; ngay cả với c&aacute;c tựa game hiện đại.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Dễ d&agrave;ng n&acirc;ng cấp dung lượng</p>
        <p>Ngo&agrave;i việc sử dụng phần cứng mới nhất như bộ vi xử l&yacute; CPU Intel Core thế hệ thứ 11 v&agrave; d&ograve;ng card NVIDIA GeForce RTX, Nitro 5 2021 cũng bao gồm c&aacute;c khả năng n&acirc;ng cấp gi&uacute;p d&ograve;ng Nitro vượt trội hơn so với phi&ecirc;n bản c&ugrave;ng loại.</p>
        <p><br></p>
        <p>Đi k&egrave;m với khả năng t&ugrave;y chỉnh bộ nhớ đến c&aacute;c t&ugrave;y chọn lưu trữ. Người d&ugrave;ng c&oacute; thể lắp RAM dung lượng l&ecirc;n đến 64GB, cũng như hai khe cắm NVMe SSD v&agrave; một khe cắm SSD SATA 2,5 inch. Ngo&agrave;i cổng Ethernet E2600, d&agrave;nh ri&ecirc;ng cho biến thể Intel, cổng USB C cũng hỗ trợ Thunderbolt 4 đa chức năng v&agrave; c&oacute; tốc độ truyền dữ liệu nhanh hơn gấp 8 lần so với USB 3.0 th&ocirc;ng thường.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Hai khe cắm SSD gi&uacute;p việc th&ecirc;m một SSD v&agrave;o Nitro 5 gaming thậm ch&iacute; c&ograve;n dễ d&agrave;ng hơn. Kh&ocirc;ng chỉ vậy, hai khe cắm n&agrave;y đ&atilde; hỗ trợ giao thức NVMe v&agrave; được trang bị một bộ tản nhiệt SSD đặc biệt trong mỗi khe, gi&uacute;p hiệu suất SSD kh&ocirc;ng bị giảm khi nhiệt độ tăng l&ecirc;n.</p>
        <p><br></p>
        <p>Nếu bạn vẫn muốn tăng dung lượng lưu trữ của m&igrave;nh nhiều để tiện cho c&ocirc;ng việc? Th&igrave; ch&uacute;ng ta c&oacute; hai khe cắm RAM c&oacute; thể được lấp đầy l&ecirc;n đến 64GB RAM DDR4 3200 MHz hỗ trợ k&ecirc;nh đ&ocirc;i.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Intel Wi-Fi 6 AX201 (802.11ax) v&agrave; Killer Ethernet E2600</p>
        <p>Một t&iacute;nh năng mới kh&aacute;c cho m&ocirc; h&igrave;nh năm nay, Acer Nitro 5 2021 c&oacute; Intel Wi-Fi 6 AX201 (802.11ax) v&agrave; Killer DoubleShot Pro cải thiện hiệu suất v&agrave; độ ổn định mạng ưu ti&ecirc;n chơi game. Điều khiển Ethernet tự động ph&aacute;t hiện lỗi giữa c&aacute;c luồng tr&ograve; chơi, video v&agrave; tr&ograve; chuyện để chọn mức ưu ti&ecirc;n băng th&ocirc;ng nhằm mang lại trải nghiệm kh&ocirc;ng c&oacute; độ trễ. Khi chọn chế độ tự động, tr&igrave;nh tối ưu h&oacute;a mạng của c&aacute;c chiếc laptop Acer gaming 2021 c&oacute; thể ph&acirc;n biệt c&aacute;c chương tr&igrave;nh nặng để kh&ocirc;ng xảy ra sự cố kết nối. Ngo&agrave;i ra, người d&ugrave;ng c&oacute; thể tự đặt mức độ ưu ti&ecirc;n của chương tr&igrave;nh, thay đổi ph&acirc;n bổ băng th&ocirc;ng cho từng ứng dụng v&agrave; thậm ch&iacute; chặn một số ứng dụng nhất định để đảm bảo kết nối tốt nhất.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Hệ thống nhiệt cải tiến với quạt k&eacute;p&nbsp;</p>
        <p>Bạn kh&ocirc;ng cần lo lắng về vấn đề qu&aacute; n&oacute;ng m&aacute;y nữa, Acer Nitro 5 Gaming 2021 đ&atilde; được bổ sung giải ph&aacute;p tản nhiệt s&aacute;ng tạo với thiết kế mới nhất để mang lại hiệu quả l&agrave;m m&aacute;t tốt hơn, ngay cả khi m&aacute;y chạy khối lượng c&ocirc;ng việc nặng.&nbsp;</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Được trang bị hệ thống l&agrave;m m&aacute;t quạt k&eacute;p sử dụng c&aacute;c cổng h&uacute;t/xả v&agrave; 4 lỗ tho&aacute;t nhiệt được đặt ở vị tr&iacute; chiến lược để đạt được mức tăng tổng thể 25% về hiệu suất nhiệt so với mẫu Acer Nitro 5 2020.</p>
        <p><br></p>
        <p>Kh&ocirc;ng thể kh&ocirc;ng kể đến c&ocirc;ng nghệ Acer CoolBoost với 4 lỗ th&ocirc;ng gi&oacute; ở ph&iacute;a dưới v&agrave; kết hợp với ứng dụng NitroSense để theo d&otilde;i nhiệt độ v&agrave; điều chỉnh hệ thống tản nhiệt. Hệ thống n&agrave;y được tối ưu h&oacute;a hơn nữa bởi c&ocirc;ng nghệ CoolBoost &nbsp;c&oacute; thể tăng tốc độ quạt l&ecirc;n 10% v&agrave; l&agrave;m m&aacute;t CPU/GPU l&ecirc;n 9%. Tất cả c&aacute;c t&aacute;c vụ điện to&aacute;n được đảm bảo trở n&ecirc;n thoải m&aacute;i hơn với c&ocirc;ng nghệ CoolBoost &nbsp;như một giải ph&aacute;p s&aacute;ng tạo để l&agrave;m m&aacute;t tốt hơn.</p>
        <p><br></p>
        <p><br></p>
        <p><br></p>
        <p>Tổng Kết: Chiếc laptop Acer Nitro 5 2021 n&agrave;y sẽ mang đến cho bạn những gi&acirc;y ph&uacute;t chiến game, l&agrave;m việc thật đ&atilde; mắt đấy sẽ l&agrave; một trong những lựa chọn tốt để bạn vừa l&agrave;m việc, giải tr&iacute; v&agrave; thư gi&atilde;n.</p>
    </div>
</div>
<div>
    <div>
        <div>
            <div><br></div>
        </div>
    </div>
</div>', N'Core i5 - 11400H (6 nhân/ 12 luồng)', N'8GB DDR4 Bus 3200MHz', N'512GB SSD M2 NVMe', N'NVIDIA GeForce RTX 3050 4GB GDDR6', N'15.6" FHD (1920 x 1080) IPS, 144Hz, Anti-Glare', N'HD 720P', N'Type-A USB 3.1 (Gen 1), Type-A USB2.0, LAN, HDMI 2.0B, COMBO audio jack', N'2.2 kg', N'3-cell, 48WHrs', N'Windows 11 bản quyền', 0, N'/images/pictures/acer_nitro_5_an515_pic_1.JPG', CAST(N'2022-04-09 17:07:43.540' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
INSERT [dbo].[Product] ([id], [name], [categoryId], [price], [percentSale], [promotionPrice], [shortDescript], [content], [cpu], [ram], [hardDrive], [cardVGA], [screenMonitor], [camera], [connector], [weight], [battery], [operatingSystem], [viewCount], [imageUrl], [createDate], [status], [warranty]) VALUES (73, N'Acer Nitro 5 2021 AN515', 1012, CAST(30000000 AS Decimal(18, 0)), 10, CAST(27000000 AS Decimal(18, 0)), N'[Mới 100%] Acer Nitro 5 2021 AN515 (Ryzen 7 - 5800H, 16GB, 512GB, RTX 3050, 15.6" FHD IPS 144Hz)
', N'<p><span><span>Laptop Acer Nitro 5 AMD AN515 - B&Ugrave;NG NỔ SỨC MẠNH VỚI AMD&nbsp;RYZEN 5000</span></span></p>
<p><span>Năm 2021 ch&agrave;o đ&oacute;n nhiều gương mặt laptop gaming &ldquo;tuy cũ m&agrave; mới&rdquo;, v&igrave; sao lại như vậy?&nbsp;Nitro 5&nbsp;&ndash; c&aacute;i t&ecirc;n đ&atilde; qu&aacute; quen thuộc với c&aacute;c game thủ v&agrave; cũng l&agrave; niềm ao ước của nhiều anh em nhưng trong năm 2021 n&agrave;y &nbsp;Acer đ&atilde; cho ra mắt phi&ecirc;n bản&nbsp;Nitro 5&nbsp;2021 t&iacute;ch hợp bộ vi xử l&yacute;&nbsp;AMD&nbsp;Ryzen&nbsp;5000 series&nbsp;đầu ti&ecirc;n tại Việt Nam.&nbsp;<span>&nbsp;&nbsp;&nbsp;</span></span></p>
<p><span><img src="https://laptopaz.vn/media/product/1994_n1.png" alt="" /></span></p>
<p><span><span>Ngoại h&igrave;nh ấn tượng</span></span></p>
<p><span>Phải n&oacute;i trong nhiều năm qua<span>,&nbsp;Nitro 5</span>&nbsp;đ&atilde; ng&agrave;y c&agrave;ng được chăm ch&uacute;t tỉ mỉ về thiết kế khiến em n&oacute; kh&ocirc;ng hề nh&agrave;m ch&aacute;n m&agrave; ngược lại lu&ocirc;n khiến c&aacute;c anh em bị thu h&uacute;t bởi ngoại h&igrave;nh ấn tượng, c&aacute; t&iacute;nh của m&igrave;nh. Với c&aacute;c anh em game thủ "s&agrave;nh điệu" th&igrave; h&igrave;nh thức&nbsp; l&agrave; một trong những ti&ecirc;u ch&iacute; quan trọng khi chọn lựa mua cho m&igrave;nh 1 chiếc&nbsp;chiếc laptop gaming, với&nbsp;<span>Nitro 5</span>&nbsp;th&igrave; c&aacute;c anh em d&ugrave; kh&oacute; t&iacute;nh đến mấy cũng lu&ocirc;n h&agrave;i l&ograve;ng với ngoại h&igrave;nh "chất ngầu" nhưng trọng lượng lại kh&ocirc;ng qu&aacute; nặng nề chỉ 2.3kg, thoải m&aacute;i để bạn&nbsp; mang theo đến bất k&igrave; đ&acirc;u.</span></p>
<p><span><img src="https://laptopaz.vn/media/product/1994_n4.jpg" alt="" /></span></p>
<p><span><span>Nitro 5</span>&nbsp;sử dụng chất liệu nhựa cao cấp, bền đẹp đồng thời với chất liệu n&agrave;y cũng g&oacute;p phần cắt giảm chi ph&iacute;. Cảm quan ban đầu th&igrave; chiếc&nbsp;<span>Nitro 5</span>&nbsp;n&agrave;y cũng giống như c&aacute;c thế hệ tiền nhiệm trước, kh&ocirc;ng c&oacute; qu&aacute; nhiều kh&aacute;c biệt với c&aacute;c đường n&eacute;t g&oacute;c cạnh, hầm hố, thiết kế&nbsp;04 hốc tản nhiệt lớn xung quanh v&agrave; led RGB 04 v&ugrave;ng ở khu vực b&agrave;n ph&iacute;m.</span></p>
<p><span>Nắp capo ch&iacute;nh l&agrave; sự kh&aacute;c biệt so với thế hệ tiền nhiệm khi&nbsp; kh&ocirc;ng c&ograve;n sự &ldquo;hiện diện&rdquo; của&nbsp;hai đường&nbsp;ph&acirc;y xước như tr&ecirc;n phi&ecirc;n bản AN515 2020.</span></p>
<p><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src="https://laptopaz.vn/media/product/1994_n5.jpg" alt="" /></span></p>
<p><span>Bản lề chắc chắn c&oacute; thể mở m&aacute;y l&ecirc;n bằng 1 tay v&agrave; cho g&oacute;c mở m&agrave;n h&igrave;nh l&ecirc;n 160 độ.</span></p>
<p><span>Phần viền&nbsp;m&agrave;n h&igrave;nh&nbsp;được tinh chỉnh mỏng hơn chỉ c&ograve;n 7,02 mm khiến to&agrave;n bộ th&acirc;n m&aacute;y sẽ nhỏ gọn hơn thế hệ trước nhưng k&iacute;ch thước m&agrave;n h&igrave;nh kh&ocirc;ng giảm,&nbsp;mang đến khả năng trải nghiệm thị gi&aacute;c v&ocirc; c&ugrave;ng m&atilde;n nh&atilde;n khi giải tr&iacute;, xem phim hoặc chơi game.</span></p>
<p><span>&nbsp;&nbsp;<img src="https://laptopaz.vn/media/product/1994_n2.jpg" alt="" /></span></p>
<p><span>C&oacute; thể mở nắp chỉ bằng một tay để lộ&nbsp;b&agrave;n ph&iacute;m&nbsp;kiểu chiclet k&iacute;ch thước đầy đủ với b&agrave;n ph&iacute;m số.&nbsp;B&agrave;n ph&iacute;m full-size với layout sắp xếp hợp l&iacute;, h&agrave;nh tr&iacute;nh ph&iacute;m kh&aacute; s&acirc;u gi&uacute;p người chơi g&otilde; ph&iacute;m thoải m&aacute;i, kh&aacute; nhạy. Vẫn trang bị đ&egrave;n nền RGB 4 v&ugrave;ng tr&ecirc;n b&agrave;n ph&iacute;m như Nitro 5 2020. Cụm ph&iacute;m W-A-S-D v&agrave; 04 ph&iacute;m điều hướng đều được thiết kế kh&aacute; nổi bật tr&ecirc;n tổng thể b&agrave;n ph&iacute;m, font chữ to gi&uacute;p người chơi dễ nhận biết khi chơi game.</span></p>
<p><span>TouchPad c&oacute; viền m&agrave;u đỏ c&oacute; k&iacute;ch thước 106mm x 78mm v&agrave; được đặt lệch sang b&ecirc;n tr&aacute;i.</span></p>
<p><img src="https://laptopaz.vn/media/product/1994_n3.jpg" alt="" /></p>
<p><span>Về cổng kết nối,&nbsp;<span>Nitro 5 2021</span>&nbsp;kh&ocirc;ng qu&ecirc;n trang bị đầy đủ v&agrave; đa dạng nhất c&aacute;c cổng kết nối: cổng USB-C, cổng USB-A, HDMI cho bạn dễ d&agrave;ng kết nối với TV hoặc m&agrave;n h&igrave;nh rời b&ecirc;n ngo&agrave;i, cổng LAN RJ-45 v&agrave; jack tai nghe 3.5mm.</span></p>
<p><span>Tuy m&aacute;y kh&ocirc;ng c&ograve;n trang bị khe&nbsp;thẻ nhớ&nbsp;nhưng h&atilde;ng đ&atilde; &ldquo;b&ugrave; đắp&rdquo; cho người d&ugrave;ng cổng USB type C&nbsp; gi&uacute;p truyền dữ liệu v&agrave; sạc c&aacute;c thiết bị b&ecirc;n ngo&agrave;i.</span></p>
<p><span>&nbsp;&nbsp;<img src="https://laptopaz.vn/media/lib/1994_n6.png" alt="" /></span></p>
<p><span>Jack cắm d&acirc;y nguồn điện được chuyển ra ph&iacute;a sau với mục đ&iacute;ch để quạt th&ocirc;ng gi&oacute; c&oacute; vị tr&iacute; th&iacute;ch hợp hơn.&nbsp;</span></p>
<p><span>Sạc bằng bộ đổi nguồn AC 135W, 19,5V, 6,92A với ch&acirc;n cắm 5,5mm.&nbsp; Bộ sạc n&agrave;y mỏng v&agrave; nhẹ hơn nhiều bộ sạc kh&aacute;c. Qu&aacute; tr&igrave;nh sạc đầy chỉ mất khoảng 2,5 giờ với đ&egrave;n LED sạc chuyển từ m&agrave;u hổ ph&aacute;ch sang m&agrave;u xanh lam</span></p>
<p><span><span>Tản nhiệt</span></span></p>
<p><span>Nhận biết được tầm quan trọng của tản nhiệt tới hiệu suất chơi game v&agrave; tuổi thọ của m&aacute;y t&iacute;nh x&aacute;ch tay, n&ecirc;n ở&nbsp;Nitro 5 2021 kh&aacute; &ldquo;đầu tư&rdquo; cho hệ thống tản nhiệt với 2 quạt cỡ lớn, v&agrave; 3 ống đồng tản nhiệt được sơn c&aacute;ch nhiệt. Kết hợp c&ocirc;ng nghệ&nbsp;<span>CoolBoost</span>&nbsp;gi&uacute;p tăng tốc độ quạt l&ecirc;n 10%, đ&acirc;y l&agrave; c&ocirc;ng nghệ&nbsp;gi&uacute;p tối ưu ho&aacute; hiệu suất&nbsp;nhờ&nbsp;kết hợp giữa phần cứng v&agrave; phần mềm. C&ocirc;ng nghệ n&agrave;y l&agrave; độc quyền của Nitro 5 v&agrave; Nitro 7.</span></p>
<p><img src="https://laptopaz.vn/media/product/1994_n1.png" alt="" /></p>
<p><span>&nbsp;</span></p>
<p><span>C&aacute;c t&aacute;c vụ n&agrave;o nặng sẽ được ưu ti&ecirc;n&nbsp;tản nhiệt&nbsp;tốt để kh&ocirc;ng l&agrave;m giảm hiệu năng, b&igrave;nh thường khi c&aacute;c anh em chạy c&aacute;c t&aacute;c vụ chơi game b&igrave;nh thường th&igrave; m&aacute;y n&oacute;ng từ 70 đến 85 độ C n&ecirc;n hệ thống tản nhiệt sẽ kh&ocirc;ng hoạt động hết c&ocirc;ng suất.<span>&nbsp;CoolBoost</span>&nbsp;được k&iacute;ch hoạt khi c&aacute;c anh em sử dụng c&aacute;c phần mềm nặng như render đồ hoạ, chơi game hoặc nhiệt độ của m&aacute;y tr&ecirc;n 85 độ C hay, m&aacute;y sẽ giảm từ 5 đến 10 độ C một c&aacute;ch nhanh ch&oacute;ng.</span></p>
<p><img src="https://laptopaz.vn/media/product/1994_n4.jpg" alt="" /></p>
<p><span>Nghe th&igrave; phức tạp nhưng c&ocirc;ng nghệ tiến tiến<span>&nbsp;CoolBoost</span>&nbsp;được điều khiển &nbsp;rất dễ d&agrave;ng bằng phần mềm Nitro Sense c&oacute;&nbsp;khả năng bật CoolBoost với điều chỉnh ba chế độ tăng tốc quạt v&agrave; gi&uacute;p m&aacute;y giảm nhiệt độ ngay lập tức.</span></p>
<p><span>Chỉ với một n&uacute;t chạm, anh em đ&atilde; c&oacute; thể truy cập nhanh v&agrave;o v&agrave;o Ph&iacute;m n&oacute;ng ngay tr&ecirc;n b&agrave;n ph&iacute;m. C&oacute; thể theo d&otilde;i nhiệt độ v&agrave; tốc độ quạt, c&oacute; thể điều chỉnh m&agrave;u b&agrave;n ph&iacute;m RGB.</span></p>
<p><span>&nbsp; &nbsp;<img src="https://laptopaz.vn/media/product/1994_n5.jpg" alt="" /></span></p>
<p><span><span>Chất lượng h&igrave;nh ảnh</span></span></p>
<p><span>M&agrave;n h&igrave;nh IPS&nbsp;c&oacute; k&iacute;ch thước 15.6 inch với độ ph&acirc;n giải Full HD mang tới h&igrave;nh ảnh hiển thị r&otilde; n&eacute;t, m&agrave;u sắc ch&acirc;n thực ở g&oacute;c nh&igrave;n rộng kể cả ở g&oacute;c nh&igrave;n hẹn nhất.</span></p>
<p><img src="https://laptopaz.vn/media/lib/1994_n6.png" alt="" /></p>
<p><span>Với c&aacute;c anh em m&ecirc; mẩn c&aacute;c tựa game cần tốc độ nhanh như tựa game bắn s&uacute;ng FPS, đ&aacute; b&oacute;ng, đua xe tốc độ cao th&igrave;&nbsp;<span>tần số qu&eacute;t 144Hz</span>&nbsp;chắc chắn l&agrave; th&ocirc;ng số ho&agrave;n hảo m&agrave; bạn đang mong chờ ở chiếc laptop gaming. Với c&aacute;c th&ocirc;ng số kh&aacute;c l&agrave; độ s&aacute;ng cao 300 nits v&agrave; độ phủ m&agrave;u sRGB gần 100%&nbsp;th&igrave; so với c&aacute;c phi&ecirc;n bản tiền nhiệm trước th&igrave; Nitro 5 2021 c&oacute;&nbsp;dải m&agrave;u v&agrave; độ s&aacute;ng tương tự.</span></p>
<p><img src="https://laptopaz.vn/media/product/1994_n2.jpg" alt="" /></p>
<p><span><span>Hiệu năng</span></span></p>
<p><span>Điểm &ldquo;s&aacute;ng gi&aacute;&rdquo; nhất tr&ecirc;n chiếc laptop&nbsp;<span>Nitro 5 2021</span>&nbsp;n&agrave;y l&agrave; cấu h&igrave;nh cực mạnh, với sự g&oacute;p mặt của chip&nbsp;<span>AMD Ryzen&trade; 7-5800H</span>&nbsp;kết hợp với&nbsp;<span>16GB DDR4 3200Mhz</span>&nbsp;v&agrave; card đồ họa&nbsp;<span>NVIDIA RTX 3050 4GB</span>. Nh&igrave;n qua th&ocirc;i cũng đ&atilde; đủ thu h&uacute;t c&aacute;c anh em game thủ phải kh&aacute;m ph&aacute; rồi.</span></p>
<p><img src="https://laptopaz.vn/media/product/1994_n3.jpg" alt="" /></p>
<p><span>Sử dụng con chip&nbsp;<span>AMD Ryzen&trade; 5000 Series</span>&nbsp;&nbsp;c&oacute; xung nhịp&nbsp;3.3GHz upto 4.2GHz,&nbsp;6 nh&acirc;n&nbsp;12&nbsp;luồng&nbsp;l&agrave; bộ xử l&yacute; laptop ti&ecirc;n tiến nhất tr&ecirc;n thế giới để, được chế tạo bằng c&ocirc;ng nghệ vi xử l&yacute; 7nm đột ph&aacute; mới nhất mang lại hiệu quả vượt trội, hiệu suất cao, chạy mượt m&agrave; c&aacute;c ứng dụng nặng. Kết hợp với bộ nhớ RAM&nbsp;8GB DDR4 3200Mhz&nbsp;&nbsp;hỗ trợ đa nhiệm đa t&aacute;c vụ tốt hơn cho người d&ugrave;ng.</span></p>
<p><span>&nbsp; &nbsp;<img src="https://anphat.com.vn/media/lib/23-04-2021/nitro-5-ksp-2-l.jpg" alt="" width="794" height="441" /></span></p>
<p><span>Ngo&agrave;i ra m&aacute;y c&ograve;n được trang bị ổ&nbsp;NVMe SSD&nbsp;dung lượng 512GB kh&aacute; lớn gi&uacute;p người d&ugrave;ng c&oacute; thể tận hưởng tốc độ truyển tải dữ liệu v&agrave; khởi động si&ecirc;u nhanh, gi&uacute;p bạn kh&ocirc;ng bao giờ bị &ldquo;chậm trễ&rdquo; với c&aacute;c t&aacute;c vụ nặng như chơi game..</span></p>
<p><span>Kh&ocirc;ng thể kh&ocirc;ng nhắc tới chiếc Card đồ họa rời Geforce RTX 3050 &ldquo;huyền thoại&rdquo;, sẽ thật thiếu s&oacute;t cho Nitro 5 2021 kh&ocirc;ng trang bị cho m&igrave;nh chiếc card đồ họa rời mạnh mẽ đến từ&nbsp;VGA NVIDIA. Với khả năng chiến mượt m&agrave; với mức FPS ổn định ở c&aacute;c tựa game nặng đang rất Hot tr&ecirc;n thị trường hiện nay: Shadow of Tomb Raider, Assassin''s Creed Odyssey, Battlefield 5, Far Cry New Dawn, ,&hellip;ở mức đồ họa Medium tới High.</span></p>
<p><span>Chơi game muốn mượt m&agrave; th&igrave; đừng qu&ecirc;n ch&uacute; trọng tới đường truyền kết nối mạng, n&ecirc;n bạn c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m với C&ocirc;ng nghệ&nbsp;<span>Wifi 6</span>&nbsp;v&agrave;&nbsp;<span>Killer&trade; Ethernet</span>&nbsp;đảm bảo đường truyền lu&ocirc;n ổn định v&agrave; tốc độ si&ecirc;u nhanh.</span></p>
<p><span>&nbsp; &nbsp;&nbsp;<img src="https://laptopaz.vn/media/product/1994_n1.png" alt="" /></span></p>
<p><span><span>Khả năng năng cấp cực đỉnh</span></span></p>
<p><span>Nếu như nhu cầu của bạn cho giải tr&iacute; cao hơn th&igrave; đừng lo về khả năng n&acirc;ng cấp của chiếc m&aacute;y n&agrave;y, bạn ho&agrave;n to&agrave;n c&oacute; thể n&acirc;ng cấp dễ d&agrave;ng ngay tr&ecirc;n Nitro 5 2021. Ở phần RAM, vẫn cho người d&ugrave;ng dễ t&ugrave;y biến cấu h&igrave;nh ở mức cao nhất với 02 khe RAM chuẩn DDR4 tối đa l&ecirc;n đến 32GB. C&ograve;n ở phần ổ cứng th&igrave; thật &ldquo;h&agrave;o ph&oacute;ng&rdquo; khi h&atilde;ng đ&atilde; hỗ trợ để người d&ugrave;ng c&oacute; thể n&acirc;ng cấp th&ecirc;m l&ecirc;n tới&nbsp;tối đa 2 TB SSD v&agrave; 2TB HDD.</span></p>
<h2><span>&Acirc;m thanh sống động, ch&acirc;n thực</span></h2>
<p><span>&nbsp;Một chiếc laptop "xịn" như vậy kh&ocirc;ng thể thiếu những c&ocirc;ng nghệ &acirc;m thanh tốt, trải nghiệm thế giới &acirc;m thanh ch&acirc;n thực sống động nhờ được t&iacute;ch hợp phần mềm &acirc;m thanh DTS:X&reg; Ultra gi&uacute;p t&aacute;i tạo &acirc;m thanh 3D v&agrave; Acer True Harmony với 6 chế độ t&ugrave;y chỉnh &acirc;m thanh. Với &acirc;m thanh chất lượng cao, người chơi sẽ thực sự được h&ograve;a m&igrave;nh v&agrave;o kh&ocirc;ng gian trong game cũng như nh&acirc;n vật m&agrave; bạn h&oacute;a th&acirc;n.</span></p>', N'Ryzen 7 - 5800H', N'16GB DDR4 3200Mhz', N'SSD 512GB NVMe', N'NVIDIA® GeForce® RTX 3050 4GB GDDR6', N'15.6 inch FHD(1920 x 1080) IPS 144Hz slim bezel LCD', N'HD 720P', N'Type-A USB 3.1 (Gen 1), Type-A USB2.0, LAN, HDMI 2.0B, COMBO audio jack', N'2.25 kg', N'4 Cell, 48 Whr', N'Windows 11 bản quyền', 12, N'/images/pictures/acer_nitro_5_an515_pic_1.JPG', CAST(N'2022-04-09 17:16:10.783' AS DateTime), N'Còn hàng', N'12 tháng chính hãng')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [customerName], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (6, N'test@email.com', N'admin', N'test@email.com', N'11111', N'Địa chỉ test', N'Mej5eQ3tZEEHBLJamzADcKvrIaB1uv6hpj7LbTN4NIY+zO58', N'Đang hoạt động', N'ADMIN')
INSERT [dbo].[User] ([id], [username], [customerName], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (7, N'hung', N'Vũ Văn Hùng', N'hung@gmail.com', N'2', N'2', N'+LYU+c5O08z4zNgooSCoDHBMJOSZq6ACaSooK8g4gZqpQfKw', N'Đang hoạt động', N'USER')
INSERT [dbo].[User] ([id], [username], [customerName], [email], [phonenumber], [address], [password], [status], [userType]) VALUES (8, N'hungvu', N'Vũ Văn Hùng', N'vuhung03062000@gmail.com', N'0373857323', N'Hải Dương', N'k6KIp4A8s94zhwoU9p3mmVjU4wT0mxcqpaRUPLfM/I/z2M/6', N'Đang hoạt động', N'USER')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[User_Comment] ON 

INSERT [dbo].[User_Comment] ([id], [rating], [content], [datePost], [productId], [userId]) VALUES (2, 2, N'dasd', CAST(N'2022-04-12 17:16:46.363' AS DateTime), 1, 7)
INSERT [dbo].[User_Comment] ([id], [rating], [content], [datePost], [productId], [userId]) VALUES (4, 4, N'fdasf', CAST(N'2022-04-12 17:51:47.847' AS DateTime), 1, 7)
INSERT [dbo].[User_Comment] ([id], [rating], [content], [datePost], [productId], [userId]) VALUES (5, 5, N'Không thể không kể đến công nghệ Acer CoolBoost với 4 lỗ thông gió ở phía dưới và kết hợp với ứng dụng NitroSense để theo dõi nhiệt độ và điều chỉnh hệ thống tản nhiệt. Hệ thống này được tối ưu hóa hơn nữa bởi công nghệ CoolBoost ™ có thể tăng tốc độ quạt lên 10% và làm mát CPU/GPU lên 9%. Tất cả các tác vụ điện toán được đảm bảo trở nên thoải mái hơn với công nghệ CoolBoost ™ như một giải pháp sáng tạo để làm mát tốt hơn.

Kết luận: Nitro 5 2021 AN515-57 là một trong những sự lựa chọn hàng đầu của dòng máy Gaming. Sở hữu thiết kế mạnh mẽ nhưng cũng không kém phần tinh tế, kết hợp cùng cấu hình mạnh mẽ và tản nhiệt mát mẻ, Nitro 5 2021 AN515-57 tự tin có thể chinh phục được đa số các Game Online, Offline thời thượng hiện nay. Hơn thế nữa Nitro 5 2021 AN515-57 cũng đủ sức đáp ứng các tác vụ thiết kế đồ họa, công việc, giải trí một cách mượt mà nhất. Hiện tại LaptopAZ đang có những chương trình ưu đãi vô cùng tuyệt vời khi khách hàng đặt mua Nitro 5 2021 AN515-57 ngay từ ngày hôm nay!', CAST(N'2022-04-12 17:52:00.000' AS DateTime), 1, 7)
INSERT [dbo].[User_Comment] ([id], [rating], [content], [datePost], [productId], [userId]) VALUES (20, 5, N'đây là đánh giá 5*', CAST(N'2022-04-14 08:45:41.407' AS DateTime), 1, 7)
INSERT [dbo].[User_Comment] ([id], [rating], [content], [datePost], [productId], [userId]) VALUES (23, 4, N'laptop ngon bổ rẻ, đáng mua trong tầm giá', CAST(N'2022-05-14 17:03:12.820' AS DateTime), 2, 6)
SET IDENTITY_INSERT [dbo].[User_Comment] OFF
/****** Object:  Index [IX_userId]    Script Date: 5/14/2022 5:04:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_userId] ON [dbo].[Bill]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_billId]    Script Date: 5/14/2022 5:04:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_billId] ON [dbo].[BillDetail]
(
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_productId]    Script Date: 5/14/2022 5:04:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_productId] ON [dbo].[BillDetail]
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_categoryId]    Script Date: 5/14/2022 5:04:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_categoryId] ON [dbo].[Product]
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BillDetail_dbo.Product_productId] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_dbo.BillDetail_dbo.Product_productId]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_dbo.Category_categoryId] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Product_dbo.Category_categoryId]
GO
ALTER TABLE [dbo].[User_Comment]  WITH CHECK ADD  CONSTRAINT [FK__User_Comm__produ__4F47C5E3] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_Comment] CHECK CONSTRAINT [FK__User_Comm__produ__4F47C5E3]
GO
ALTER TABLE [dbo].[User_Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User_userId] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_Comment] CHECK CONSTRAINT [FK_Comment_User_userId]
GO
USE [master]
GO
ALTER DATABASE [LaptopStoreDB] SET  READ_WRITE 
GO
