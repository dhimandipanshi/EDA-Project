 --FIND TOTAL CUSTOMERS BY COUNTRY/GNEDER
SELECT 
country,
COUNT(customer_id) as total_customers
FROM DataWarehouse..[gold.dim_customers]
GROUP BY country
ORDER BY total_customers DESC

SELECT 
gender,
COUNT(customer_id) as total_customers
FROM DataWarehouse..[gold.dim_customers]
GROUP BY gender
ORDER BY total_customers DESC

 --FIND TOTAL PRODUCTS BY CATEGORY
SELECT 
category,
COUNT(product_key) as total_products
FROM DataWarehouse..[gold.dim_products]
GROUP BY category
ORDER BY total_products DESC

-- WHAT IS The AVEREAGE COST IN EACH CAtegory
SELECT 
category,
AVG(cost) as avg_cost
FROM DataWarehouse..[gold.dim_products]
GROUP BY category
ORDER BY avg_cost DESC

--WHAT IS TEH TOTAL REVENUE GENERATED FRO EACH CATEGORY
SELECT 
p.category,
SUM(f.sales_amount) as total_revenue
FROM DataWarehouse..[gold.fact_sales] f
LEFT JOIN DataWarehouse..[gold.dim_products] p
ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC

-- FIND TOTAL REVENUE IS GENEREATEED BY EACH CUSTOMER
SELECT 
c.customer_key,
c.first_name ,
c.last_name,
SUM(f.sales_amount) AS total_revenue
FROM DataWarehouse..[gold.fact_sales] f
LEFT JOIN DataWarehouse..[gold.dim_customers] c
ON c.customer_key= f.customer_key
GROUP BY 
c.customer_key,
c.first_name ,
c.last_name
ORDER BY total_revenue DESC


-- WHAT IS THE DISTURIBUTION OF SOLD IETMS ACROSS COUNTRIES

