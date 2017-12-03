USE [PaperDb]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 2017/12/2 14:07:48 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 2017/12/2 14:07:48 ******/
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
/****** Object:  Table [dbo].[KeyWordConnection]    Script Date: 2017/12/2 14:07:48 ******/
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
/****** Object:  Table [dbo].[KeyWords]    Script Date: 2017/12/2 14:07:48 ******/
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
/****** Object:  Table [dbo].[Option]    Script Date: 2017/12/2 14:07:48 ******/
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
/****** Object:  Table [dbo].[TypeConnection]    Script Date: 2017/12/2 14:07:48 ******/
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

INSERT [dbo].[Article] ([id], [Title], [Author], [UpateTime], [Summary], [Link]) VALUES (15, N'测试二', N'作者2', CAST(0x00009E5E00000000 AS DateTime), N'ddd', N'https://www.baidu.com')
INSERT [dbo].[Article] ([id], [Title], [Author], [UpateTime], [Summary], [Link]) VALUES (17, N'2016', N'ddddd', CAST(0x0000A58000000000 AS DateTime), N'ddd', N'https://www.baidu.com')
INSERT [dbo].[Article] ([id], [Title], [Author], [UpateTime], [Summary], [Link]) VALUES (18, N'2017', N'aaa', CAST(0x0000A6EE00000000 AS DateTime), N'aaa', N'https://www.baidu.com/test')
INSERT [dbo].[Article] ([id], [Title], [Author], [UpateTime], [Summary], [Link]) VALUES (19, N'hello', N'hello', CAST(0x0000A6EE00000000 AS DateTime), N'helo', N'https://www.baidu.com')
INSERT [dbo].[Article] ([id], [Title], [Author], [UpateTime], [Summary], [Link]) VALUES (20, N'adfasdf', N'asdf', CAST(0x0000946100000000 AS DateTime), N'asdfasdf', N'https://www.baidu.com/test')
INSERT [dbo].[Article] ([id], [Title], [Author], [UpateTime], [Summary], [Link]) VALUES (22, N'广西红树林湿地资源非使用价值评估', N'伍淑婕', CAST(0x0000A6EE00000000 AS DateTime), N'采用条件价值法,通过支付意愿调查,对广西红树林湿地的非使用价值进行了评估。结果表明,广西红树林的非使用价值为37.61亿元,其中存在价值16.66亿元;遗产价值10.94亿元;选择价值10.00亿元。广西红树林人均支付意愿值为50元,总支付意愿率为59.2%;除年龄与支付意愿无关外,性别、职业、文化程度、技术职称、收入水平、了解程度、偏爱程度等都与支付意愿呈极显著相关关系;性别与WTP值相关,但不显著,而其他因素与WTP值呈现极显著相关。', N'http://kns.cnki.net/kns/brief/default_result.aspx')
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

INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (36, 17, 6)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (37, 18, 6)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (42, 15, 8)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (44, 19, 7)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (45, 19, 10)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (46, 20, 6)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (49, 22, 6)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (50, 22, 10)
INSERT [dbo].[KeyWordConnection] ([id], [ArticleId], [KeyWordId]) VALUES (51, 22, 8)
SET IDENTITY_INSERT [dbo].[KeyWordConnection] OFF
SET IDENTITY_INSERT [dbo].[KeyWords] ON 

INSERT [dbo].[KeyWords] ([id], [Name]) VALUES (6, N'关键字六')
INSERT [dbo].[KeyWords] ([id], [Name]) VALUES (7, N'关键字七')
INSERT [dbo].[KeyWords] ([id], [Name]) VALUES (8, N'关键字八')
INSERT [dbo].[KeyWords] ([id], [Name]) VALUES (10, N'关键词9')
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
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (31, N'河北', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (32, N'山东', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (33, N'浙江', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (34, N'江苏', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (35, N'上海', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (36, N'福建', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (37, N'广东', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (38, N'广西', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (39, N'海南', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (40, N'湖北', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (41, N'湖南', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (42, N'陕西', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (43, N'四川', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (44, N'甘肃', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (45, N'其他', 4)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (46, N'红树林', 5)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (47, N'内陆水系（河湖江塘）', 5)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (48, N'沙滩', 5)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (49, N'湿地系统', 5)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (50, N'珊瑚礁', 5)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (51, N'海洋资源', 5)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (52, N'其他', 5)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (53, N'旅游成本法', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (54, N'特征价值法', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (55, N'市场价值法', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (56, N'影子工程法', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (57, N'费用支出法', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (58, N'生产函数法', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (59, N'恢复和防护费用法', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (60, N'专家评估法', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (61, N'特征评估法', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (62, N'CVM和TCM', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (63, N'综合', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (64, N'其他', 7)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (67, N'文化', 9)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (68, N'支持', 9)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (69, N'综合', 9)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (70, N'其他', 9)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (71, N'tobit', 10)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (72, N'logit', 10)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (73, N'probit', 10)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (74, N'综合', 10)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (75, N'其他', 10)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (76, N'防护价值', 11)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (77, N'综合', 11)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (78, N'其他', 11)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (79, N'存在价值', 12)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (80, N'修复价值', 12)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (81, N'综合', 12)
INSERT [dbo].[Option] ([id], [Name], [CategoryId]) VALUES (82, N'其他', 12)
SET IDENTITY_INSERT [dbo].[Option] OFF
SET IDENTITY_INSERT [dbo].[TypeConnection] ON 

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
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (172, 15, 9)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (173, 15, 11)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (174, 15, 13)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (175, 15, 15)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (176, 15, 17)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (177, 15, 19)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (178, 15, 22)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (179, 15, 23)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (180, 15, 25)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (181, 19, 9)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (182, 19, 11)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (183, 19, 13)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (184, 19, 15)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (185, 19, 17)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (186, 19, 19)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (187, 19, 21)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (188, 19, 77)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (189, 19, 25)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (190, 20, 9)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (191, 20, 11)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (192, 20, 13)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (193, 20, 15)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (194, 20, 17)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (195, 20, 19)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (196, 20, 21)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (197, 20, 23)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (198, 20, 25)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (217, 22, 9)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (218, 22, 11)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (219, 22, 13)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (220, 22, 15)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (221, 22, 17)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (222, 22, 19)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (223, 22, 21)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (224, 22, 23)
INSERT [dbo].[TypeConnection] ([id], [ArticleId], [OptionId]) VALUES (225, 22, 25)
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
