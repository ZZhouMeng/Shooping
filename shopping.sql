USE [shopping]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 07/06/2018 13:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[categoryid] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (1, N'宠物用品')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (2, N'厨房用品')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (3, N'零食')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (4, N'蔬菜')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (5, N'速冻食品')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (6, N'饮料')
INSERT [dbo].[Category] ([categoryid], [categoryname]) VALUES (7, N'水果')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 07/06/2018 13:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](16) NOT NULL,
	[paswd] [varchar](15) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[usertype] [int] NOT NULL,
	[sex] [varchar](10) NULL,
	[account] [float] NOT NULL,
 CONSTRAINT [PK__Users__CBA1B2572C3393D0] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Users__F3DBC5722F10007B] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([userid], [username], [paswd], [email], [phone], [usertype], [sex], [account]) VALUES (2, N'test1', N'123456', N'1065495345@qq.com', N'13587847926', 1, NULL, 314.70000000000005)
INSERT [dbo].[Users] ([userid], [username], [paswd], [email], [phone], [usertype], [sex], [account]) VALUES (3, N'admin', N'123456', N'1111111111@qq.com', N'12345678910', 0, NULL, 10000000)
INSERT [dbo].[Users] ([userid], [username], [paswd], [email], [phone], [usertype], [sex], [account]) VALUES (4, N'test2', N'123456', N'2222222222@qq.com', N'12345875451', 1, NULL, 156)
INSERT [dbo].[Users] ([userid], [username], [paswd], [email], [phone], [usertype], [sex], [account]) VALUES (5, N'test3', N'123456', N'1065495345@qq.com', N'13587847926', 1, NULL, 0)
INSERT [dbo].[Users] ([userid], [username], [paswd], [email], [phone], [usertype], [sex], [account]) VALUES (6, N'test5', N'123456', N'1111111111@qq.com', N'13567087296', 1, NULL, 0)
INSERT [dbo].[Users] ([userid], [username], [paswd], [email], [phone], [usertype], [sex], [account]) VALUES (7, N'test6', N'123456', N'1065495345@qq.com', N'13567087296', 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Goods]    Script Date: 07/06/2018 13:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Goods](
	[categoryid] [int] NOT NULL,
	[goodsid] [int] IDENTITY(1,1) NOT NULL,
	[goodsname] [varchar](50) NOT NULL,
	[preprice] [float] NOT NULL,
	[nowprice] [float] NOT NULL,
	[pepertory] [int] NOT NULL,
	[sale] [int] NOT NULL,
	[praisegrade] [float] NOT NULL,
	[describe] [text] NOT NULL,
	[display] [int] NOT NULL,
	[praisenum] [int] NOT NULL,
	[picture] [text] NOT NULL,
 CONSTRAINT [PK__Goods__1105F62A38996AB5] PRIMARY KEY CLUSTERED 
(
	[goodsid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Goods] ON
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (1, 1, N'仓鼠粮', 20, 18, 494, 11, 13, N'仓鼠喜欢吃的仓鼠粮', 1, 4, N'images/1.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (2, 3, N'不锈钢刀架', 50, 48, 15, 11, 52, N'非常好用的不锈钢刀架', 1, 13, N'images/2.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (3, 4, N'奥利奥夹心饼干', 10, 8, 100, 0, 10, N'超级好吃的奥利奥夹心饼干', 1, 3, N'images/3.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (4, 5, N'胡萝卜', 2, 1, 20, 0, 0, N'有营养的胡萝卜', 1, 1, N'images/4.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (5, 6, N'肉松卷', 40, 38, 16, 10, 13, N'老少皆宜的肉松卷', 1, 5, N'images/5.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (6, 7, N'RedBull红牛', 20, 10, 11, 11, 27, N'补充能量，精力十足！你的能量超乎你想象！', 1, 25, N'images/6.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (7, 8, N'奇异果', 10, 2, 20, 0, 3, N'富含多种营养的奇异果', 1, 10, N'images/7.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (1, 9, N'幼猫猫粮', 30, 20, 8, 2, 7, N'专门给幼猫吃的猫粮', 1, 3, N'images/幼猫猫粮.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (1, 14, N'兔子饲料', 20, 15, 9, 1, 5, N'兔子饲料', 1, 1, N'images/rabbit.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (1, 15, N'全犬期狗粮', 20, 18, 19, 1, 5, N'专门给全犬期的狗狗吃的狗粮', 1, 1, N'images/全犬期狗粮.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (1, 16, N'全犬期牛肉燕麦狗粮', 50, 30, 14, 1, 5, N'全犬期牛肉燕麦狗粮真的好营养！', 1, 1, N'images/全犬期牛肉燕麦狗粮.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (1, 17, N'深海六种鱼猫粮', 40, 30, 80, 0, 5, N'富含深海六种鱼的猫粮', 1, 1, N'images/深海六种鱼猫粮.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (1, 18, N'天然成猫猫粮', 70, 69, 99, 1, 5, N'天然成猫吃的猫粮！专为成猫打造！', 1, 1, N'images/天然成猫猫粮.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (1, 19, N'猫主食罐头', 60, 50, 999, 0, 5, N'猫主食罐头，猫可以当主食的罐头！', 1, 1, N'images/猫主食罐头.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (2, 20, N'玻璃防漏油壶大号', 30, 15, 14, 1, 5, N'玻璃防漏油壶大号，解决你的漏油烦恼', 1, 1, N'images/玻璃防漏油壶大号.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (2, 21, N'不锈钢碗盘架', 30, 18, 19, 1, 5, N'不锈钢碗盘架', 1, 1, N'images/不锈钢碗盘架.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (2, 22, N'太空铝厨房置物架', 20, 18, 100, 0, 5, N'太空铝做的厨房置物架', 1, 1, N'images/太空铝厨房置物架.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (3, 23, N'百草味夏威夷果', 20, 15, 15, 0, 21, N'百草味夏威夷果', 1, 7, N'images/百草味夏威夷果.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (3, 24, N'好时巧克力', 10, 8, 100, 0, 5, N'非常好吃的好时巧克力', 1, 1, N'images/好时巧克力.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (3, 25, N'乐事薯片', 10, 8.8, 999, 0, 5, N'天然的马铃薯的味道', 1, 1, N'images/乐事薯片.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (3, 26, N'绿箭口香糖', 5, 4.5, 1000, 0, 5, N'清新口气更亲近你', 1, 1, N'images/绿箭口香糖.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (3, 27, N'咪咪虾条', 1, 0.5, 500, 0, 5, N'童年回忆咪咪虾条', 1, 1, N'images/咪咪虾条.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (3, 28, N'三只松鼠巴旦木', 20, 15, 15, 0, 5, N'三只松鼠出品必为精品', 1, 1, N'images/三只松鼠巴旦木.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (3, 29, N'手工锅巴', 10, 8.8000001907348633, 100, 0, 5, N'真正的手工锅巴', 1, 1, N'images/手工锅巴.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (3, 30, N'旺旺小小酥', 5, 4.5, 20, 0, 5, N'一口一个小小酥', 1, 1, N'images/旺旺小小酥.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (3, 31, N'旺仔小馒头', 5, 4.5, 15, 0, 5, N'一口一个小馒头', 1, 1, N'images/旺仔小馒头.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (3, 32, N'闲趣饼干', 5, 4.5, 999, 0, 5, N'有事没事闲趣一下', 1, 1, N'images/闲趣饼干.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (3, 33, N'小浣熊干脆面', 1, 0.5, 500, 0, 5, N'小浣熊干脆面 超级好吃的干脆面', 1, 1, N'images/小浣熊干脆面.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (4, 34, N'荷兰黄瓜', 1, 0.800000011920929, 20, 0, 5, N'荷兰产的黄瓜', 1, 1, N'images/荷兰黄瓜.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (4, 35, N'金针菇', 0.5, 0.30000001192092896, 9, 1, 5, N'See You Tomarrow！', 1, 1, N'images/金针菇.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (4, 36, N'毛豆仁', 10, 8.8, 20, 0, 5, N'剥好的毛豆仁！', 1, 1, N'images/毛豆仁.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (4, 37, N'南瓜', 10, 5, 20, 0, 5, N'超级好吃的南瓜', 1, 1, N'images/南瓜.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (4, 38, N'山药', 5, 4.8000001907348633, 100, 0, 5, N'对身体好的山药', 1, 1, N'images/山药.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (4, 39, N'生菜', 2, 1, 20, 0, 5, N'无污染无公害的生菜', 1, 1, N'images/生菜.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (4, 40, N'土豆', 2, 1.7999999523162842, 20, 0, 5, N'超级好吃的土豆', 1, 1, N'images/土豆.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (4, 41, N'娃娃菜', 1, 0.800000011920929, 10, 0, 5, N'超级好吃的娃娃菜', 1, 1, N'images/娃娃菜.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (4, 42, N'西红柿', 3, 2, 10, 0, 5, N'美容养颜之西红柿', 1, 1, N'images/西红柿.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (4, 43, N'香菇', 1, 0.5, 10, 0, 5, N'香香的香菇', 1, 1, N'images/香菇.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (5, 44, N'巴沙鱼片', 10, 8.8000001907348633, 20, 0, 5, N'巴沙鱼片', 1, 1, N'images/巴沙鱼片.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (5, 45, N'鲅鱼水饺', 20, 15, 14, 1, 5, N'鲅鱼做的水饺', 1, 1, N'images/鲅鱼水饺.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (5, 46, N'白菜黑猪肉水饺', 10, 8.8000001907348633, 10, 0, 5, N'白菜黑猪肉水饺', 1, 1, N'images/白菜黑猪肉水饺.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (6, 47, N'AD钙奶1', 1.5, 1.3, 10, 0, 5, N'童年的回忆', 1, 1, N'images/AD钙奶.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (1, 48, N'旺仔牛奶', 23, 22, 500, 0, 5, N'我要旺！我要旺！', 1, 1, N'images/旺仔牛奶.jpg')
INSERT [dbo].[Goods] ([categoryid], [goodsid], [goodsname], [preprice], [nowprice], [pepertory], [sale], [praisegrade], [describe], [display], [praisenum], [picture]) VALUES (6, 49, N'AD钙奶', 1.5, 1.3, 500, 0, 5, N'童年的回忆', 0, 1, N'images/AD钙奶.jpg')
SET IDENTITY_INSERT [dbo].[Goods] OFF
/****** Object:  Table [dbo].[Delivery]    Script Date: 07/06/2018 13:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Delivery](
	[deliveryid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[province] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[area] [varchar](50) NOT NULL,
	[detail] [varchar](50) NOT NULL,
	[delitype] [int] NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[delname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[deliveryid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON
INSERT [dbo].[Delivery] ([deliveryid], [userid], [province], [city], [area], [detail], [delitype], [phone], [delname]) VALUES (6, 2, N'浙江省', N'温州市', N'瓯海区', N'温州大学', 0, N'13587847926', N'周萌')
INSERT [dbo].[Delivery] ([deliveryid], [userid], [province], [city], [area], [detail], [delitype], [phone], [delname]) VALUES (9, 2, N'上海', N'上海市', N'闵行区', N'东方明珠', 1, N'13567087296', N'周萌')
INSERT [dbo].[Delivery] ([deliveryid], [userid], [province], [city], [area], [detail], [delitype], [phone], [delname]) VALUES (10, 2, N'北京', N'北京市', N'大兴区', N'故宫', 0, N'13587847927', N'test1')
INSERT [dbo].[Delivery] ([deliveryid], [userid], [province], [city], [area], [detail], [delitype], [phone], [delname]) VALUES (15, 7, N'安徽省', N'巢湖市', N'无为县', N'安徽省66', 1, N'13856974566', N'哈哈哈')
SET IDENTITY_INSERT [dbo].[Delivery] OFF
/****** Object:  Table [dbo].[Cart]    Script Date: 07/06/2018 13:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[userid] [int] NOT NULL,
	[goodsid] [int] NOT NULL,
	[number] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordering]    Script Date: 07/06/2018 13:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ordering](
	[orderid] [varchar](100) NOT NULL,
	[userid] [int] NOT NULL,
	[deliveryid] [int] NOT NULL,
	[time] [datetime] NOT NULL,
	[goodsid] [int] NOT NULL,
	[number] [int] NOT NULL,
	[statement] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'7d1e4248-4fde-4ba6-9a51-7b3bb1b994dd', 2, 9, CAST(0x0000A91201175880 AS DateTime), 7, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'7d1e4248-4fde-4ba6-9a51-7b3bb1b994dd', 2, 9, CAST(0x0000A91201175880 AS DateTime), 3, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'7d1e4248-4fde-4ba6-9a51-7b3bb1b994dd', 2, 9, CAST(0x0000A91201175880 AS DateTime), 1, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'6b7697a5-6e67-4435-9575-7cc443fc9e18', 2, 6, CAST(0x0000A913016A05BC AS DateTime), 7, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'6b7697a5-6e67-4435-9575-7cc443fc9e18', 2, 6, CAST(0x0000A913016A05BC AS DateTime), 3, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'6b7697a5-6e67-4435-9575-7cc443fc9e18', 2, 6, CAST(0x0000A913016A05BC AS DateTime), 6, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'6b7697a5-6e67-4435-9575-7cc443fc9e18', 2, 6, CAST(0x0000A913016A05BC AS DateTime), 45, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'6b7697a5-6e67-4435-9575-7cc443fc9e18', 2, 6, CAST(0x0000A913016A05BC AS DateTime), 20, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'6b7697a5-6e67-4435-9575-7cc443fc9e18', 2, 6, CAST(0x0000A913016A05BC AS DateTime), 35, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'9306160a-ff5f-44e1-a22e-0980c6ffb70f', 2, 6, CAST(0x0000A9140138DBCC AS DateTime), 3, 1, 1)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'9306160a-ff5f-44e1-a22e-0980c6ffb70f', 2, 6, CAST(0x0000A9140138DBCC AS DateTime), 21, 1, 1)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'b3ef767a-6b96-4de1-83c4-b25b49d1d128', 2, 9, CAST(0x0000A914014E52B8 AS DateTime), 9, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'b3ef767a-6b96-4de1-83c4-b25b49d1d128', 2, 9, CAST(0x0000A914014E52B8 AS DateTime), 14, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'b3ef767a-6b96-4de1-83c4-b25b49d1d128', 2, 9, CAST(0x0000A914014E52B8 AS DateTime), 15, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'b3ef767a-6b96-4de1-83c4-b25b49d1d128', 2, 9, CAST(0x0000A914014E52B8 AS DateTime), 16, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'4f6ea3ac-38a3-46dd-b126-5bb15c824706', 2, 9, CAST(0x0000A914016770CC AS DateTime), 1, 2, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'4f6ea3ac-38a3-46dd-b126-5bb15c824706', 2, 9, CAST(0x0000A914016770CC AS DateTime), 6, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'4f6ea3ac-38a3-46dd-b126-5bb15c824706', 2, 9, CAST(0x0000A914016770CC AS DateTime), 3, 1, 2)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'9306160a-ff5f-44e1-a22e-0980c6ffb70f', 2, 6, CAST(0x0000A9140138DBCC AS DateTime), 1, 1, 1)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'9306160a-ff5f-44e1-a22e-0980c6ffb70f', 2, 6, CAST(0x0000A9140138DBCC AS DateTime), 9, 1, 1)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'9306160a-ff5f-44e1-a22e-0980c6ffb70f', 2, 6, CAST(0x0000A9140138DBCC AS DateTime), 18, 1, 1)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'd4533c00-4a9b-4733-96da-7189ee62c02c', 2, 9, CAST(0x0000A914013C7D18 AS DateTime), 3, 1, 0)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'd4533c00-4a9b-4733-96da-7189ee62c02c', 2, 9, CAST(0x0000A914013C7D18 AS DateTime), 7, 2, 0)
INSERT [dbo].[Ordering] ([orderid], [userid], [deliveryid], [time], [goodsid], [number], [statement]) VALUES (N'd4533c00-4a9b-4733-96da-7189ee62c02c', 2, 9, CAST(0x0000A914013C7D18 AS DateTime), 1, 2, 0)
/****** Object:  Default [DF_Delivery_delitype]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Delivery] ADD  CONSTRAINT [DF_Delivery_delitype]  DEFAULT ((0)) FOR [delitype]
GO
/****** Object:  Default [DF_Goods_sale]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Goods] ADD  CONSTRAINT [DF_Goods_sale]  DEFAULT ((0)) FOR [sale]
GO
/****** Object:  Default [DF_Goods_praisegrade]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Goods] ADD  CONSTRAINT [DF_Goods_praisegrade]  DEFAULT ((0)) FOR [praisegrade]
GO
/****** Object:  Default [DF_Goods_display]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Goods] ADD  CONSTRAINT [DF_Goods_display]  DEFAULT ((1)) FOR [display]
GO
/****** Object:  Default [DF_Goods_praisenum]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Goods] ADD  CONSTRAINT [DF_Goods_praisenum]  DEFAULT ((1)) FOR [praisenum]
GO
/****** Object:  Default [DF_Ordering_statement]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Ordering] ADD  CONSTRAINT [DF_Ordering_statement]  DEFAULT ((0)) FOR [statement]
GO
/****** Object:  Default [DF__Users__usertype__30F848ED]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__usertype__30F848ED]  DEFAULT ((1)) FOR [usertype]
GO
/****** Object:  Default [DF__Users__account__31EC6D26]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__account__31EC6D26]  DEFAULT ((0.0)) FOR [account]
GO
/****** Object:  ForeignKey [FK_Cart_Goods]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Goods] FOREIGN KEY([goodsid])
REFERENCES [dbo].[Goods] ([goodsid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Goods]
GO
/****** Object:  ForeignKey [FK_Cart_Users]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
/****** Object:  ForeignKey [FK_Delivery_Users]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Users]
GO
/****** Object:  ForeignKey [FK_Goods_Category]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Category] FOREIGN KEY([categoryid])
REFERENCES [dbo].[Category] ([categoryid])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Category]
GO
/****** Object:  ForeignKey [FK_Ordering_Delivery]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Ordering]  WITH CHECK ADD  CONSTRAINT [FK_Ordering_Delivery] FOREIGN KEY([deliveryid])
REFERENCES [dbo].[Delivery] ([deliveryid])
GO
ALTER TABLE [dbo].[Ordering] CHECK CONSTRAINT [FK_Ordering_Delivery]
GO
/****** Object:  ForeignKey [FK_Ordering_Goods]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Ordering]  WITH CHECK ADD  CONSTRAINT [FK_Ordering_Goods] FOREIGN KEY([goodsid])
REFERENCES [dbo].[Goods] ([goodsid])
GO
ALTER TABLE [dbo].[Ordering] CHECK CONSTRAINT [FK_Ordering_Goods]
GO
/****** Object:  ForeignKey [FK_Ordering_Users]    Script Date: 07/06/2018 13:14:54 ******/
ALTER TABLE [dbo].[Ordering]  WITH CHECK ADD  CONSTRAINT [FK_Ordering_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Ordering] CHECK CONSTRAINT [FK_Ordering_Users]
GO
