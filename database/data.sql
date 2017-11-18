USE [PaperDb]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 2017/11/18 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](80) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[UpateTime] [datetime] NOT NULL,
	[Summary] [nvarchar](max) NOT NULL,
	[Link] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 2017/11/18 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KeyWordConnection]    Script Date: 2017/11/18 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyWordConnection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[KeyWordId] [int] NOT NULL,
 CONSTRAINT [PK_KeyWordConnection] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KeyWords]    Script Date: 2017/11/18 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyWords](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_KeyWords] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Option]    Script Date: 2017/11/18 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Option](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Option] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeConnection]    Script Date: 2017/11/18 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeConnection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[OptionId] [int] NOT NULL,
 CONSTRAINT [PK_TypeConnection] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([id], [Title], [Author], [UpateTime], [Summary], [Link]) VALUES (14, N'测试一', N'作者1', CAST(0x0000A41300000000 AS DateTime), N'ddddd', N'https://www.baidu.com')
INSERT [dbo].[Article] ([id], [Title], [Author], [UpateTime], [Summary], [Link]) VALUES (15, N'测试二', N'作者2', CAST(0x00009E5E00000000 AS DateTime), N'ddd', N'https://www.baidu.com')
INSERT [dbo].[Article] ([id], [Title], [Author], [UpateTime], [Summary], [Link]) VALUES (17, N'2016', N'ddddd', CAST(0x0000A58000000000 AS DateTime), N'ddd', N'https://www.baidu.com')
INSERT [dbo].[Article] ([id], [Title], [Author], [UpateTime], [Summary], [Link]) VALUES (18, N'2017', N'aaa', CAST(0x0000A6EE00000000 AS DateTime), N'aaa', N'https://www.baidu.com/test')
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [Name]) VALUES (4, N'地区')
INSERT [dbo].[Category] ([id], [Name]) VALUES (5, N'生态系统类型')
INSERT [dbo].[Category] ([id], [Name]) VALUES (6, N'文献综述')
INSERT [dbo].[Category] ([id], [Name]) VALUES (7, N'一级评估')
INSERT [dbo].[Category] ([id], [Name]) VALUES (8, N'二级评估')
INSERT [dbo].[Category] ([id], [Name]) VALUES (9, N'生态系统服务类型')
INSERT [dbo].[Category] ([id], [Name]) VALUES (10, N'模型')
INSERT [dbo].[Category] ([id], [Name]) VALUES (11, N'使用价值')
INSERT [dbo].[Category] ([id], [Name]) VALUES (12, N'非使用价值')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[KeyWordConnection] ON 

INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (33, 15, 11)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (34, 15, 8)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (35, 15, 12)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (36, 17, 6)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (37, 18, 6)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (38, 14, 6)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (39, 14, 7)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (40, 14, 11)
SET IDENTITY_INSERT [dbo].[KeyWordConnection] OFF
SET IDENTITY_INSERT [dbo].[KeyWords] ON 

INSERT [dbo].[KeyWords] ([id], [Name]) VALUES (6, N'关键字六')
INSERT [dbo].[KeyWords] ([id], [Name]) VALUES (7, N'关键字七')
INSERT [dbo].[KeyWords] ([id], [Name]) VALUES (8, N'关键字八')
INSERT [dbo].[KeyWords] ([id], [Name]) VALUES (10, N'关键词9')
INSERT [dbo].[KeyWords] ([id], [Name]) VALUES (11, N'66666')
INSERT [dbo].[KeyWords] ([id], [Name]) VALUES (12, N'测试关键字')
SET IDENTITY_INSERT [dbo].[KeyWords] OFF
SET IDENTITY_INSERT [dbo].[Option] ON 

INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (9, N'黑龙江', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (10, N'辽宁', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (11, N'海滨海湾', 5)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (12, N'海洋公园', 5)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (13, N'是', 6)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (14, N'否', 6)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (15, N'条件价值评估法', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (16, N'选择实验法', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (17, N'效益转移法', 8)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (18, N'meta', 8)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (19, N'供给', 9)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (20, N'调节', 9)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (21, N'CVM贝叶斯MCMC', 10)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (22, N'RUM随机效用', 10)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (23, N'使用价值', 11)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (24, N'景观价值', 11)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (25, N'遗产价值', 12)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (26, N'选择价值', 12)
SET IDENTITY_INSERT [dbo].[Option] OFF
SET IDENTITY_INSERT [dbo].[TypeConnection] ON 

INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (136, 15, 9)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (137, 15, 11)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (138, 15, 13)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (139, 15, 15)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (140, 15, 17)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (141, 15, 19)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (142, 15, 21)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (143, 15, 23)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (144, 15, 25)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (145, 17, 9)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (146, 17, 11)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (147, 17, 13)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (148, 17, 15)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (149, 17, 17)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (150, 17, 19)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (151, 17, 21)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (152, 17, 23)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (153, 17, 25)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (154, 18, 9)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (155, 18, 11)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (156, 18, 13)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (157, 18, 15)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (158, 18, 17)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (159, 18, 19)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (160, 18, 21)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (161, 18, 23)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (162, 18, 25)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (163, 14, 9)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (164, 14, 11)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (165, 14, 13)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (166, 14, 15)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (167, 14, 17)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (168, 14, 19)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (169, 14, 21)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (170, 14, 23)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (171, 14, 25)
SET IDENTITY_INSERT [dbo].[TypeConnection] OFF
ALTER TABLE [dbo].[KeyWordConnection]  WITH CHECK ADD  CONSTRAINT [FK_KeyWordConnection_Article] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KeyWordConnection] CHECK CONSTRAINT [FK_KeyWordConnection_Article]
GO
ALTER TABLE [dbo].[KeyWordConnection]  WITH CHECK ADD  CONSTRAINT [FK_KeyWordConnection_KeyWords] FOREIGN KEY([KeyWordId])
REFERENCES [dbo].[KeyWords] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KeyWordConnection] CHECK CONSTRAINT [FK_KeyWordConnection_KeyWords]
GO
ALTER TABLE [dbo].[Option]  WITH CHECK ADD  CONSTRAINT [FK_Option_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Option] CHECK CONSTRAINT [FK_Option_Category]
GO
ALTER TABLE [dbo].[TypeConnection]  WITH CHECK ADD  CONSTRAINT [FK_TypeConnection_Article] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TypeConnection] CHECK CONSTRAINT [FK_TypeConnection_Article]
GO
ALTER TABLE [dbo].[TypeConnection]  WITH CHECK ADD  CONSTRAINT [FK_TypeConnection_Option] FOREIGN KEY([OptionId])
REFERENCES [dbo].[Option] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TypeConnection] CHECK CONSTRAINT [FK_TypeConnection_Option]
GO
