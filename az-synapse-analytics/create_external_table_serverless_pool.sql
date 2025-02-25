CREATE DATABASE SalesDB;

USE SalesDB;

CREATE SCHEMA Sales;

CREATE EXTERNAL DATA SOURCE RawDataExternalLoc
WITH (
    LOCATION = 'https://adlsstgaccdemoneu.dfs.core.windows.net/synapse-datastore/'
);

CREATE EXTERNAL FILE FORMAT csvFormat
WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '"',
        FIRST_ROW = 2 -- Skip the header row
    )
);

CREATE EXTERNAL TABLE Sales.Orders
(
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
)
WITH (
    LOCATION = 'raw-data/sales_data.csv', -- Path within the container
    DATA_SOURCE = RawDataExternalLoc,
    FILE_FORMAT = csvFormat
);

SELECT COUNT(*) from Sales.Orders;

SELECT TOP 5 * FROM Sales.Orders;