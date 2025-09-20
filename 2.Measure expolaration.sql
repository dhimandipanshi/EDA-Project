


--GENERATE A REPORT THAT SHOWS ALL KEY METRICS OF THE BUSINESS
SELECT 'Total sales' as measure_name, SUM(sales_amount) As measure_value from DataWarehouse..[gold.fact_sales]
UNION ALL
SELECT 'Items_sold ' as measure_name, SUM(quantity) As measure_value from DataWarehouse..[gold.fact_sales]
UNION ALL
SELECT 'Avg_selling_price' as measure_name ,AVG(price) As measure_value from DataWarehouse..[gold.fact_sales]
UNION ALL
SELECT 'Total_orders' as measure_name ,COUNT(DISTINCT order_number) As measure_value from DataWarehouse..[gold.fact_sales]
UNION ALL
SELECT 'No_products'  as measure_name ,COUNT(product_number) As measure_value  from DataWarehouse..[gold.dim_products]
UNION ALL
SELECT'No_customers 'as measure_name, COUNT(customer_id) As  measure_value from DataWarehouse..[gold.dim_customers]
UNION ALL
SELECT 'No_customers_placed_orders' as measure_name,COUNT(DISTINCT customer_key) As measure_value from DataWarehouse..[gold.fact_sales]