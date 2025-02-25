SELECT TOP 100 * FROM
    OPENROWSET (
        BULK 'https://adlsstgaccdemoneu.dfs.core.windows.net/synapse-datastore/orders_dataset.csv',
        FORMAT = 'csv',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result];