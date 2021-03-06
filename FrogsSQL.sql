USE [TestDB]
GO
/****** Object:  Table [dbo].[Frogs]    Script Date: 6/9/2015 5:41:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Frogs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](10) NULL,
	[Environment] [nvarchar](100) NULL,
	[Birth] [date] NULL,
	[Death] [date] NULL,
 CONSTRAINT [PK__Frogs__3214EC279690D251] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
