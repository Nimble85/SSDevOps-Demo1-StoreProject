USE [StoreDB]
GO

CREATE USER [IIS APPPOOL\StoreProject] FOR LOGIN [IIS APPPOOL\StoreProject] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\StoreProject]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\StoreProject]
GO

/****** Object:  Table [dbo].[Games]    Script Date: 23.02.2019 14:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Price] [decimal](16, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderLines]    Script Date: 23.02.2019 14:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLines](
	[OrderLineId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Game_GameID] [int] NULL,
	[Order_OrderId] [int] NULL,
 CONSTRAINT [PK_dbo.OrderLines] PRIMARY KEY CLUSTERED 
(
	[OrderLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 23.02.2019 14:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Line1] [nvarchar](max) NULL,
	[Line2] [nvarchar](max) NULL,
	[Line3] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[GiftWrap] [bit] NOT NULL,
	[Dispatched] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([GameID], [Name], [Description], [Category], [Price]) VALUES (1, N'SimCity', N'Градостроительный симулятор снова с вами! Создайте город своей мечты', N'Симулятор', CAST(1499.00 AS Decimal(16, 2)))
INSERT [dbo].[Games] ([GameID], [Name], [Description], [Category], [Price]) VALUES (2, N'TITANFALL', N'Эта игра перенесет вас во вселенную, где малое противопоставляется большому, природа – индустрии, а человек – машине', N'Шутер', CAST(2299.00 AS Decimal(16, 2)))
INSERT [dbo].[Games] ([GameID], [Name], [Description], [Category], [Price]) VALUES (3, N'Battlefield 4', N'Battlefield 4 – это определяющий для жанра, полный экшена боевик, известный своей разрушаемостью, равных которой нет', N'Шутер', CAST(899.40 AS Decimal(16, 2)))
INSERT [dbo].[Games] ([GameID], [Name], [Description], [Category], [Price]) VALUES (4, N'The Sims 4', N'В реальности каждому человеку дано прожить лишь одну жизнь. Но с помощью The Sims 4 это ограничение можно снять! 
		Вам решать — где, как и с кем жить, чем заниматься, чем украшать и обустраивать свой дом', N'Симулятор', CAST(15.00 AS Decimal(16, 2)))
INSERT [dbo].[Games] ([GameID], [Name], [Description], [Category], [Price]) VALUES (5, N'Dark Souls 2', N'Продолжение знаменитого ролевого экшена вновь заставит игроков пройти через сложнейшие испытания. Dark Souls II предложит 
		нового героя, новую историю и новый мир. Лишь одно неизменно – выжить в мрачной вселенной Dark Souls очень непросто.', N'RPG', CAST(949.00 AS Decimal(16, 2)))
INSERT [dbo].[Games] ([GameID], [Name], [Description], [Category], [Price]) VALUES (6, N'The Elder Scrolls V: Skyrim', N'После убийства короля Скайрима империя оказалась на грани катастрофы. Вокруг претендентов на престол сплотились новые союзы, 
		и разгорелся конфликт. К тому же, как предсказывали древние свитки, в мир вернулись жестокие и беспощадные драконы. Теперь будущее Скайрима и всей 
		империи зависит от драконорожденного — человека, в жилах которого течет кровь легендарных существ.', N'RPG', CAST(1399.00 AS Decimal(16, 2)))
INSERT [dbo].[Games] ([GameID], [Name], [Description], [Category], [Price]) VALUES (7, N'FIFA 14', N'Достоверный, красивый, эмоциональный футбол! Проверенный временем геймплей FIFA стал ещё лучше благодаря инновациям, поощряющим творческую игру в
		 центре поля и позволяющим задавать её темп.', N'Симулятор', CAST(699.00 AS Decimal(16, 2)))
INSERT [dbo].[Games] ([GameID], [Name], [Description], [Category], [Price]) VALUES (8, N'Need for Speed Rivals', N'Забудьте про стандартные режимы игры. Сотрите грань между одиночным и многопользовательским режимом в постоянном соперничестве 
		между гонщиками и полицией. Свободно войдите в мир, в котором ваши друзья уже участвуют в гонках и погонях. ', N'Симулятор', CAST(15.00 AS Decimal(16, 2)))
INSERT [dbo].[Games] ([GameID], [Name], [Description], [Category], [Price]) VALUES (9, N'Crysis 3', N'Действие игры разворачивается в 2047 году, а вам предстоит выступить в роли Пророка.', N'Шутер', CAST(1299.00 AS Decimal(16, 2)))
INSERT [dbo].[Games] ([GameID], [Name], [Description], [Category], [Price]) VALUES (10, N'Dead Space 3', N'В Dead Space 3 Айзек Кларк и суровый солдат Джон Карвер отправляются в космическое путешествие, чтобы узнать о происхождении некроморфов.', N'Шутер', CAST(499.00 AS Decimal(16, 2)))
INSERT [dbo].[Games] ([GameID], [Name], [Description], [Category], [Price]) VALUES (11, N'NFS 5', N'----', N'Гонка', CAST(1000.00 AS Decimal(16, 2)))
SET IDENTITY_INSERT [dbo].[Games] OFF
SET IDENTITY_INSERT [dbo].[OrderLines] ON 

INSERT [dbo].[OrderLines] ([OrderLineId], [Quantity], [Game_GameID], [Order_OrderId]) VALUES (3, 1, 1, 2)
INSERT [dbo].[OrderLines] ([OrderLineId], [Quantity], [Game_GameID], [Order_OrderId]) VALUES (4, 1, 9, 3)
INSERT [dbo].[OrderLines] ([OrderLineId], [Quantity], [Game_GameID], [Order_OrderId]) VALUES (5, 1, 2, 3)
SET IDENTITY_INSERT [dbo].[OrderLines] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [Name], [Line1], [Line2], [Line3], [City], [GiftWrap], [Dispatched]) VALUES (2, N'Денис Шамыгин', N'18, ул. Подгорная', NULL, NULL, N'Чернигов', 1, 0)
INSERT [dbo].[Orders] ([OrderId], [Name], [Line1], [Line2], [Line3], [City], [GiftWrap], [Dispatched]) VALUES (3, N'J', N'1-st st', NULL, NULL, N'Ttt', 1, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderLines_dbo.Games_GameID] FOREIGN KEY([Game_GameID])
REFERENCES [dbo].[Games] ([GameID])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_dbo.OrderLines_dbo.Games_GameID]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderLines_dbo.Order_OrderId] FOREIGN KEY([Order_OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_dbo.OrderLines_dbo.Order_OrderId]
GO
USE [master]
GO
ALTER DATABASE [StoreDB] SET  READ_WRITE 
GO
