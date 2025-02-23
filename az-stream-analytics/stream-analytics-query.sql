WITH stg as (
    SELECT 
        arrayElement.arrayvalue.product_name as ProductName,
        CAST(arrayElement.arrayvalue.quantity as bigint) as Quantity,
        event.order_id,
        event.customer_id,
        event.store_id,
        event.store_location.city as City,
        event.store_location.country as country
    FROM
        [input-eventhub] as event
    CROSS APPLY
        GetArrayElements(event.order_details) as arrayElement
    )
    SELECT
        ProductName,
        SUM(Quantity) as TotalQuantity,
        COUNT(*) as EventCount,
        System.Timestamp as WindowEndTime
    INTO
        [output-sql-db]
    FROM 
        stg
    GROUP BY
        TUMBLINGWINDOW(minute,1),
        ProductName;