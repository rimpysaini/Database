USE [10369466]
GO
/****** Object:  User [user_10369466]    Script Date: 19/05/2017 09:42:52 ******/
CREATE USER [user_10369466] FOR LOGIN [STUDENT\10369466] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user_10369466]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [user_10369466]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user_10369466]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [user_10369466]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchCode] [int] NOT NULL,
	[Phone] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[BranchAddress] [nvarchar](50) NULL,
	[BranchCity] [nvarchar](50) NULL,
	[BranchCountry] [nvarchar](50) NOT NULL,
	[OrderLine] [int] NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[BranchCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CheckPayment]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckPayment](
	[CustomerPhoneNumber] [int] NULL,
	[CheckNo] [int] NOT NULL,
	[BankName] [nvarchar](50) NULL,
	[PaymentDate] [date] NULL,
	[Amount] [money] NULL,
	[BranchCode] [int] NULL,
 CONSTRAINT [PK_CheckPayment] PRIMARY KEY CLUSTERED 
(
	[CheckNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerPhoneNumber] [int] NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerPhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[BranchCode] [int] NULL,
	[ReportTo] [nvarchar](50) NULL,
	[Designation] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderLine] [int] NOT NULL,
	[ProductCode] [int] NULL,
	[QuantityOrder] [int] NULL,
	[PriceTotal] [money] NULL,
	[OrderNumber] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderLine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderNumber] [int] NOT NULL,
	[OrderDate] [date] NULL,
	[ShippingDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[CustomerPhoneNumber] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductCode] [int] NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Availibility] [nchar](10) NOT NULL,
	[ProductVendor] [nvarchar](50) NOT NULL,
	[QuatityInStock] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[OrderNumber]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OrderNumber] 
AS

SELECT Orders.OrderNumber,Orders.OrderDate,OrderDetails.OrderLine

FROM Orders
INNER JOIN OrderDetails
ON Orders.OrderNumber = OrderDetails.OrderNumber
WHERE Orders.OrderNumber >3
;

GO
INSERT [dbo].[Branch] ([BranchCode], [Phone], [Email], [BranchAddress], [BranchCity], [BranchCountry], [OrderLine]) VALUES (1, 917865439, N'ireland@gmail.com', N'23 griffon street', N'Ballsbridge', N'Ireland', 2001)
INSERT [dbo].[Branch] ([BranchCode], [Phone], [Email], [BranchAddress], [BranchCity], [BranchCountry], [OrderLine]) VALUES (2, 995678330, N'india@yahoo.com', N'101 ward 8', N'Sadhaura', N'India', 2003)
INSERT [dbo].[Branch] ([BranchCode], [Phone], [Email], [BranchAddress], [BranchCity], [BranchCountry], [OrderLine]) VALUES (3, 916783530, N'Ireland1@gmail.com', N'6 Hollywell', N'Swords', N'Ireland', 2004)
INSERT [dbo].[Branch] ([BranchCode], [Phone], [Email], [BranchAddress], [BranchCity], [BranchCountry], [OrderLine]) VALUES (4, 227655420, N'england@rediffmail.com', N'sunbury upon thames', N'england', N'uk', 2005)
INSERT [dbo].[Branch] ([BranchCode], [Phone], [Email], [BranchAddress], [BranchCity], [BranchCountry], [OrderLine]) VALUES (5, 457565540, N'paris@gmail.com', N'99 James Hall', N'Paris', N'France', 2006)
INSERT [dbo].[Branch] ([BranchCode], [Phone], [Email], [BranchAddress], [BranchCity], [BranchCountry], [OrderLine]) VALUES (6, 765387650, N'spain@yahoo.com', N'condolmar 5', N'Barcelona', N'Spain', 2007)
INSERT [dbo].[CheckPayment] ([CustomerPhoneNumber], [CheckNo], [BankName], [PaymentDate], [Amount], [BranchCode]) VALUES (876756233, 1423, N'PNB', CAST(N'2017-05-07' AS Date), 230.0000, 1)
INSERT [dbo].[CheckPayment] ([CustomerPhoneNumber], [CheckNo], [BankName], [PaymentDate], [Amount], [BranchCode]) VALUES (96675670, 2345, N'AIB', CAST(N'2017-05-01' AS Date), 340.0000, 2)
INSERT [dbo].[CheckPayment] ([CustomerPhoneNumber], [CheckNo], [BankName], [PaymentDate], [Amount], [BranchCode]) VALUES (98767862, 23536, N'Ulster', CAST(N'2017-05-01' AS Date), 700.0000, 3)
INSERT [dbo].[CheckPayment] ([CustomerPhoneNumber], [CheckNo], [BankName], [PaymentDate], [Amount], [BranchCode]) VALUES (548797786, 43576, N'AIB', CAST(N'2017-05-04' AS Date), 800.0000, 4)
INSERT [dbo].[CheckPayment] ([CustomerPhoneNumber], [CheckNo], [BankName], [PaymentDate], [Amount], [BranchCode]) VALUES (456878670, 45657, N'SBI', CAST(N'2017-04-14' AS Date), 240.0000, 5)
INSERT [dbo].[CheckPayment] ([CustomerPhoneNumber], [CheckNo], [BankName], [PaymentDate], [Amount], [BranchCode]) VALUES (654540830, 76034, N'BOI', CAST(N'2017-05-05' AS Date), 450.0000, 6)
INSERT [dbo].[CheckPayment] ([CustomerPhoneNumber], [CheckNo], [BankName], [PaymentDate], [Amount], [BranchCode]) VALUES (227565530, 98776, N'Axis', CAST(N'2017-04-11' AS Date), 3460.0000, 4)
INSERT [dbo].[Customers] ([CustomerPhoneNumber], [CustomerName], [LastName], [Address], [City], [State], [Country]) VALUES (96675670, N'Rob', N'Smith', N'7 stephans street', N'Ballbridge', N'Ballsbridge', N'Ireland')
INSERT [dbo].[Customers] ([CustomerPhoneNumber], [CustomerName], [LastName], [Address], [City], [State], [Country]) VALUES (98767862, N'James', N'Carrigon', N'Fitzwillians block2', N'Dublin', N'Dublin', N'Ireland')
INSERT [dbo].[Customers] ([CustomerPhoneNumber], [CustomerName], [LastName], [Address], [City], [State], [Country]) VALUES (227565530, N'Eddie', N'Ward', N'j7 left coast lane', N'england', N'London', N'UK')
INSERT [dbo].[Customers] ([CustomerPhoneNumber], [CustomerName], [LastName], [Address], [City], [State], [Country]) VALUES (456878670, N'Mathew', N'Matt', N'465 Wing houseboard', N'Ambala', N'Hissar', N'India')
INSERT [dbo].[Customers] ([CustomerPhoneNumber], [CustomerName], [LastName], [Address], [City], [State], [Country]) VALUES (548797786, N'Margret', N'Kaur', N'124 Building church street', N'Madraid', N'Madraid', N'Spain')
INSERT [dbo].[Customers] ([CustomerPhoneNumber], [CustomerName], [LastName], [Address], [City], [State], [Country]) VALUES (654540830, N'Lucy', N'Morry', N'876 Downtown', N'Paris', N'Paris', N'France')
INSERT [dbo].[Customers] ([CustomerPhoneNumber], [CustomerName], [LastName], [Address], [City], [State], [Country]) VALUES (876756233, N'Rita', N'Rani', N'43 Dharamshala Road', N'Yamuna Nagar', N'Haryana', N'India')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [BranchCode], [ReportTo], [Designation]) VALUES (101, N'Sarah', N'James', 2, N'Sales Manager', N'Sales Representive')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [BranchCode], [ReportTo], [Designation]) VALUES (102, N'
Hanah', N'Mulligan', 3, N'Sales Manager', N'Sales Represent')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [BranchCode], [ReportTo], [Designation]) VALUES (103, N'Shean', N'Kelly', 1, N'Head Manager', N'Sales Manager')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [BranchCode], [ReportTo], [Designation]) VALUES (104, N'Rose', N'Kerry', 5, N'Area Manager', N'Head Manager')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [BranchCode], [ReportTo], [Designation]) VALUES (105, N'Lucy', N'Rose', 4, N'Assistant Manager', N'Sales Manager')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [BranchCode], [ReportTo], [Designation]) VALUES (106, N'John', N'Saini', 6, N'Assistant Manager', N'Sales Manager')
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [BranchCode], [ReportTo], [Designation]) VALUES (107, N'Emilly', N'Smith', 4, N'Sales Head', N'Head Manager')
INSERT [dbo].[OrderDetails] ([OrderLine], [ProductCode], [QuantityOrder], [PriceTotal], [OrderNumber]) VALUES (2001, 1234, 2, 400.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderLine], [ProductCode], [QuantityOrder], [PriceTotal], [OrderNumber]) VALUES (2002, 1235, 1, 500.0000, 2)
INSERT [dbo].[OrderDetails] ([OrderLine], [ProductCode], [QuantityOrder], [PriceTotal], [OrderNumber]) VALUES (2003, 1236, 4, 360.0000, 3)
INSERT [dbo].[OrderDetails] ([OrderLine], [ProductCode], [QuantityOrder], [PriceTotal], [OrderNumber]) VALUES (2004, 1237, 3, 2210.0000, 2)
INSERT [dbo].[OrderDetails] ([OrderLine], [ProductCode], [QuantityOrder], [PriceTotal], [OrderNumber]) VALUES (2005, 1238, 5, 1500.0000, 4)
INSERT [dbo].[OrderDetails] ([OrderLine], [ProductCode], [QuantityOrder], [PriceTotal], [OrderNumber]) VALUES (2006, 1239, 1, 700.0000, 7)
INSERT [dbo].[OrderDetails] ([OrderLine], [ProductCode], [QuantityOrder], [PriceTotal], [OrderNumber]) VALUES (2007, 12310, 2, 2000.0000, 5)
INSERT [dbo].[OrderDetails] ([OrderLine], [ProductCode], [QuantityOrder], [PriceTotal], [OrderNumber]) VALUES (2008, 12311, 7, 5600.0000, 6)
INSERT [dbo].[Orders] ([OrderNumber], [OrderDate], [ShippingDate], [Status], [CustomerPhoneNumber]) VALUES (1, CAST(N'2017-04-17' AS Date), CAST(N'2017-06-09' AS Date), N'InProgress', 96675670)
INSERT [dbo].[Orders] ([OrderNumber], [OrderDate], [ShippingDate], [Status], [CustomerPhoneNumber]) VALUES (2, CAST(N'2017-05-02' AS Date), CAST(N'2017-05-02' AS Date), N'Delivered', 98767862)
INSERT [dbo].[Orders] ([OrderNumber], [OrderDate], [ShippingDate], [Status], [CustomerPhoneNumber]) VALUES (3, CAST(N'2017-04-04' AS Date), CAST(N'2017-05-20' AS Date), N'InProgress', 227565530)
INSERT [dbo].[Orders] ([OrderNumber], [OrderDate], [ShippingDate], [Status], [CustomerPhoneNumber]) VALUES (4, CAST(N'2017-05-01' AS Date), CAST(N'2017-05-11' AS Date), N'Delivered', 456878670)
INSERT [dbo].[Orders] ([OrderNumber], [OrderDate], [ShippingDate], [Status], [CustomerPhoneNumber]) VALUES (5, CAST(N'2017-04-24' AS Date), CAST(N'2017-05-27' AS Date), N'Shipped', 548797786)
INSERT [dbo].[Orders] ([OrderNumber], [OrderDate], [ShippingDate], [Status], [CustomerPhoneNumber]) VALUES (6, CAST(N'2017-04-12' AS Date), CAST(N'2017-05-20' AS Date), N'Shipped', 654540830)
INSERT [dbo].[Orders] ([OrderNumber], [OrderDate], [ShippingDate], [Status], [CustomerPhoneNumber]) VALUES (7, CAST(N'2017-05-08' AS Date), CAST(N'2017-06-17' AS Date), N'InProgress', 876756233)
INSERT [dbo].[Product] ([ProductCode], [Name], [Price], [Availibility], [ProductVendor], [QuatityInStock]) VALUES (1234, N'Fan                                               ', 200.0000, N'yes       ', N'Khaitan', 10)
INSERT [dbo].[Product] ([ProductCode], [Name], [Price], [Availibility], [ProductVendor], [QuatityInStock]) VALUES (1235, N'WashingMachine                                    ', 500.0000, N'yes       ', N'Whirlpool', 20)
INSERT [dbo].[Product] ([ProductCode], [Name], [Price], [Availibility], [ProductVendor], [QuatityInStock]) VALUES (1236, N'Toster                                            ', 90.0000, N'no        ', N'Philips', 0)
INSERT [dbo].[Product] ([ProductCode], [Name], [Price], [Availibility], [ProductVendor], [QuatityInStock]) VALUES (1237, N'PlazmaTV                                          ', 1070.0000, N'yes       ', N'Sony', 40)
INSERT [dbo].[Product] ([ProductCode], [Name], [Price], [Availibility], [ProductVendor], [QuatityInStock]) VALUES (1238, N'Speaker                                           ', 150.0000, N'yes       ', N'Erricson', 22)
INSERT [dbo].[Product] ([ProductCode], [Name], [Price], [Availibility], [ProductVendor], [QuatityInStock]) VALUES (1239, N'AirConditioner                                    ', 700.0000, N'yes       ', N'Akai', 56)
INSERT [dbo].[Product] ([ProductCode], [Name], [Price], [Availibility], [ProductVendor], [QuatityInStock]) VALUES (12310, N'Heater                                            ', 1000.0000, N'no        ', N'Onida', 0)
INSERT [dbo].[Product] ([ProductCode], [Name], [Price], [Availibility], [ProductVendor], [QuatityInStock]) VALUES (12311, N'WaterFilter                                       ', 800.0000, N'yes       ', N'Philips', 67)
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_OrderDetails] FOREIGN KEY([OrderLine])
REFERENCES [dbo].[OrderDetails] ([OrderLine])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_OrderDetails]
GO
ALTER TABLE [dbo].[CheckPayment]  WITH CHECK ADD  CONSTRAINT [FK_Branch_BranchCode] FOREIGN KEY([BranchCode])
REFERENCES [dbo].[Branch] ([BranchCode])
GO
ALTER TABLE [dbo].[CheckPayment] CHECK CONSTRAINT [FK_Branch_BranchCode]
GO
ALTER TABLE [dbo].[CheckPayment]  WITH CHECK ADD  CONSTRAINT [FK_Customers_CustomerPhoneNumber] FOREIGN KEY([CustomerPhoneNumber])
REFERENCES [dbo].[Customers] ([CustomerPhoneNumber])
GO
ALTER TABLE [dbo].[CheckPayment] CHECK CONSTRAINT [FK_Customers_CustomerPhoneNumber]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Branch] FOREIGN KEY([BranchCode])
REFERENCES [dbo].[Branch] ([BranchCode])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Branch]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductCode])
REFERENCES [dbo].[Product] ([ProductCode])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Orders_CustomerPhoneNumber] FOREIGN KEY([OrderNumber])
REFERENCES [dbo].[Orders] ([OrderNumber])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Orders_CustomerPhoneNumber]
GO
/****** Object:  StoredProcedure [dbo].[CheckAmount]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckAmount]
@Amount money
AS
SELECT Count(Amount) AS [Amount Greater than given Amount]
FROM CheckPayment
WHERE Amount > @Amount

GO
/****** Object:  StoredProcedure [dbo].[uspCheckAmount]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspCheckAmount]
@Amount money
AS
SELECT Count(Amount) AS [Amount Greater than given Amount]
FROM CheckPayment
WHERE Amount > @Amount

GO
/****** Object:  StoredProcedure [dbo].[uspCustomersCity]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspCustomersCity] @City nvarchar(50)
AS 
SELECT * FROM Customers
WHERE City = @City
GO
/****** Object:  StoredProcedure [dbo].[uspEmployeeName]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspEmployeeName]
@pattern char(1)
AS
SELECT [FirstName],[LastName]
FROM Employee
WHERE [FirstName] LIKE '%' + @pattern

GO
/****** Object:  StoredProcedure [dbo].[uspGetCountry]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetCountry] (
@Phone int
)
AS
BEGIN
SELECT BranchCountry FROM Branch
WHERE Phone = @Phone
END

GO
/****** Object:  StoredProcedure [dbo].[uspShippingDate]    Script Date: 19/05/2017 09:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspShippingDate]
@date date
AS
SELECT OrderDate,OrderDetails.OrderNumber,OrderLine
FROM Orders JOIN OrderDetails ON Orders.OrderNumber = OrderDetails.OrderNumber
WHERE ShippingDate > @date

GO
