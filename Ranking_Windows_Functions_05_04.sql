/*
Created By: Kendall Ruber
Challenge Solution: Ranking Windows Functions
Task: Write a query using RANK() or DENSE_RANK() that pulls all registration information for the
first three people that registered for the Red30Tech Conference in each state.
*/
WITH Ranking AS (
	SELECT * ,
	RANK() OVER (PARTITION BY [State] ORDER BY [Registration Date]) as Top
	FROM [Red30Tech].[dbo].[ConventionAttendees$]
)
SELECT * FROM RANKING WHERE Top in (1,2,3)
