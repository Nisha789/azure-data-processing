CREATE SCHEMA sales_mart;

CREATE TABLE sales_mart.SalesAggregate(
	YEAR_ID integer,
	MONTH_ID integer,
	totalSales decimal(18,2)
);

select * from sales_mart.SalesAggregate;
