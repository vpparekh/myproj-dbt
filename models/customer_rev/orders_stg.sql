SELECT
    OrderID,
    OrderDate,
    CustomerID,
    EmployeeID,
    StoreID,
    Status AS StatusCD,
    CASE
        WHEN Status = '01' THEN 'In Progress'
        WHEN Status = '02' THEN 'Completed'
        WHEN Status = '03' THEN 'Cancelled'
        ELSE NULL
    END AS StatusDesc,
    Updated_at,
    current_timestamp as dbt_updated_at    
FROM
    {{ source('landing', 'orders') }}
