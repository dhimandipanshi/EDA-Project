Select *
From DataWarehouse..[gold.dim_customers]

--Find 
SELECT DISTINCT country From DataWarehouse..[gold.dim_customers]

SELECT DISTINCT category,subcategory,product_name From DataWarehouse..[gold.dim_products]
ORDER BY 1,2,3

--Find The date of the first and last order
SELECT MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(year,MIN(order_date),MAX(order_date))AS order_range_years
FROM DataWarehouse..[gold.fact_sales]

--Find the youngest and oldest customer
SELECT MIN(birthdate) AS Oldest,
DATEDIFF(year,MIN(birthdate), GETDATE()) AS oldest_age,
MAX(birthdate) AS Youngest,
DATEDIFF(year,MAX(birthdate), GETDATE()) AS youngest_age
FROM DataWarehouse..[gold.dim_customers]

