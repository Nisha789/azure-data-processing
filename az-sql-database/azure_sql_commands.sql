create schema sales_mart;

CREATE TABLE sales_mart.sales
(
	sale_id INT PRIMARY KEY IDENTITY(1,1),
	product_name nvarchar(100),
	quantity int,
	saleamount decimal(18,2),
	saleDate datetime
);

INSERT INTO [sales_mart].[Sales]
VALUES 
    ('Laptop', 5, 4500.00, '2024-01-15 10:30:00'),
    ('Smartphone', 10, 8000.00, '2024-02-01 14:20:00'),
    ('Headphones', 20, 3000.00, '2024-03-10 09:15:00'),
    ('Monitor', 7, 7000.00, '2024-04-25 12:45:00'),
    ('Keyboard', 15, 1500.00, '2024-05-05 16:10:00');

select * from [sales_mart].[sales];