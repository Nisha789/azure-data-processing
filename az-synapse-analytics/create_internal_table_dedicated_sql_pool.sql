CREATE SCHEMA Sales;

CREATE TABLE Sales.Orders(
    ORDERNUMBER INT,
    QUANTITYORDERED INT,
    PRICEEACH FLOAT,
    ORDERLINENUMBER INT,
    SALES FLOAT,
    ORDERDATE VARCHAR(50),
    STATUS VARCHAR(50),
    QTR_ID INT,
    MONTH_ID INT,
    YEAR_ID INT
);

COPY INTO Sales.Orders
FROM 'https://adlsstgaccdemoneu.dfs.core.windows.net/synapse-datastore/raw-data/'
WITH (
    FILE_TYPE = 'CSV',
    FIELDTERMINATOR = ',',
    FIRSTROW = 2 -- Skip the header row
);

SELECT COUNT(*) from Sales.Orders;

SELECT TOP 5 * FROM Sales.Orders;