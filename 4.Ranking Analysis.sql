--WHICH 5 PORDUCTS GENREATE THE HIGHEST REVENUE?
SELECT TOP 5
p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM DataWarehouse..[gold.dim_products] p
LEFT JOIN DataWarehouse..[gold.fact_sales] f
ON f.product_key=p.product_key
GROUP BY p.product_name
HAVING SUM(f.sales_amount) IS NOT NULL
ORDER BY total_revenue 


--WHAT ARE THE 5 WORST-PERFROMING PRODUCTS IN TERESM OF SALES?
SELECT *
FROM(
	SELECT 
	p.product_name,
	SUM(f.sales_amount) AS total_revenue,
	ROW_NUMBER () OVER (ORDER BY SUM(f.sales_amount) DESC)AS rank_products
	FROM DataWarehouse..[gold.dim_products] p
	LEFT JOIN DataWarehouse..[gold.fact_sales] f
	ON f.product_key=p.product_key
	GROUP BY p.product_name)t
WHERE rank_products <=5

--FIND TOP 10 CUSTOMERES WHO HAVE GENERTAED THE HIGHEST REVENUE
SELECT TOP 5
c.customer_key,
c.first_name,
c.last_name,
SUM(f.sales_amount) AS total_revenue
FROM DataWarehouse..[gold.dim_customers] c
LEFT JOIN DataWarehouse..[gold.fact_sales] f
ON f.customer_key=c.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_revenue DESC




