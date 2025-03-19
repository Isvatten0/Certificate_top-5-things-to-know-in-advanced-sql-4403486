/*
Created By: Kendall Ruber
Modified by: Luke Roberts
Challenge Solution: ROW_NUMBER()
Task: Write a query using ROW_NUMBER() that returns the OrderNum, OrderDate, CustName, ProdCategory, ProdName, and 
Order Total of the top 3 orders that have the highest Order Total from each ProdCategory purchased by Boehm Inc.
*/

-- Preview data if necessary
-- SELECT * FROM [Red30Tech].[dbo].[OnlineRetailSales$]

-- Solution: Remember your solution may look slightly different than mine! You could also use a subquery to accomplish this.
WITH TopOrders as (
	SELECT  OrderNum,
	        OrderDate,
		CustName, 
		ProdCategory, 
		ProdName, 
		[Order Total],
	ROW_NUMBER() OVER(PARTITION BY [ProdCategory] ORDER BY [Order Total] DESC) as ORDERS
	FROM  [Red30Tech].[dbo].[OnlineRetailSales$]
	WHERE CustName = 'Boehm Inc.'
)

SELECT  OrderNum,
	OrderDate,
	CustName,
	ProdCategory,
	ProdName,
	[Order Total] FROM TopOrders 
WHERE ORDERS in (1,2,3)
ORDER BY [ProdCategory],[Order Total] DESC
