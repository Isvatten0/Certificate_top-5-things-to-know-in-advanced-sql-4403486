/*
Created By: Kendall Ruber
Challenge Solution: CTEs
Task: Write a query that uses a CTE to return the ProdCategory, ProdNumber, ProdName, and In Stock of 
items that have less than the average amount of products left in stock to help the business know which 
products they are running low on.
*/

-- Preview data if necessary 
-- select top (5) * FROM [Red30Tech].[dbo].[Inventory$]

WITH InStockLow (AvgStock) AS (
	SELECT AVG([In Stock]) AS AvgStock 
	FROM [Red30Tech].[dbo].[Inventory$]
)

SELECT I.[ProdCategory], I.[ProdNumber], I.[ProdName], I.[In Stock]
FROM [Red30Tech].[dbo].[Inventory$] I, InStockLow L
WHERE I.[In Stock] < L.AvgStock
