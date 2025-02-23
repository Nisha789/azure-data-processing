create schema sales_mart;

create table [sales_mart].[AggregatedSales](
	[ProductName] nvarchar(4000),
	[TotalQuantity] bigint,
	[EventCount] bigint,
	[WindowEndTime] datetime2
)