USE [KristaTest]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 23.07.2024 17:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 23.07.2024 17:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DEPARTMENT_ID] [int] NOT NULL,
	[CHIEF_ID] [int] NULL,
	[NAME] [nvarchar](255) NULL,
	[SALARY] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [NAME]) VALUES (1, N'Dep1')
INSERT [dbo].[Department] ([ID], [NAME]) VALUES (2, N'Dep2')
INSERT [dbo].[Department] ([ID], [NAME]) VALUES (3, N'Dep3')
INSERT [dbo].[Department] ([ID], [NAME]) VALUES (4, N'Dep4')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (1, 1, NULL, N'Bob', 1000)
INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (2, 1, 1, N'Bob Jr', 100)
INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (3, 1, 1, N'Bob Jr 1', 3000)
INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (4, 1, 1, N'Bob Jr 2', 50)
INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (10, 2, NULL, N'Robert', 10000)
INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (11, 2, 10, N'Sean', 1000)
INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (12, 2, 10, N'Olga', 8000)
INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (13, 2, 10, N'Nataly', 15000)
INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (14, 2, 10, N'Stan', 4000)
INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (22, 3, NULL, N'Maria', 100000)
INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (23, 3, 22, N'Bob Jr 2', 20000)
INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (33, 4, NULL, N'Rodrigo', 60000)
INSERT [dbo].[Employee] ([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY]) VALUES (34, 4, NULL, N'Dilan', 60000)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DEPARTMENT_ID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
