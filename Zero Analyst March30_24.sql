--select * from products


--SQL Query to find the Top Selling Products in Each Category--



WITH CTE AS
	(
		SELECT *,
		RANK() OVER(PARTITION BY CATEGORY ORDER BY quantity_sold Desc )as RNK
		from products
	)
Select product_name,category,quantity_sold,RNK from CTE where RNK=1