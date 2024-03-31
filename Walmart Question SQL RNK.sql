-- solution to select the product id, year, quantity, 
--price for the first year of every product sold.

WITH CTE AS
	(
	SELECT product_id,year as First_Year,quantity,price,
	RANK()OVER (PARTITION BY product_id ORDER by year) as RNK
	FROM SALES
	)
SELECT product_id,First_Year,
quantity,price
FROM CTE where RNK=1


