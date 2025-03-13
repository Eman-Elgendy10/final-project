use [SuperMarket Sales];
--1.	Sales per month 
	SELECT 
    MONTH(CAST(Date AS DATE)) AS Month, 
    SUM(Total) AS Total_Sales
FROM [supermarket_sales - Sheet1]
GROUP BY MONTH(CAST(Date AS DATE))
ORDER BY Month;

--2.	Sales by gender 
SELECT 
    Gender, 
    SUM(Total) AS Total_Sales
FROM [supermarket_sales - Sheet1]
GROUP BY Gender
ORDER BY Total_Sales DESC;

-- 3.	which customer type buys more?

SELECT 
    Customer_type, 
    SUM(Total) AS Total_Sales
FROM [supermarket_sales - Sheet1]
GROUP BY [Customer_type]
ORDER BY Total_Sales DESC;

--	4.	which city or branch has the most sales?
-- By City 
SELECT TOP 1 
    City, 
    SUM(Total) AS Total_Sales
FROM [supermarket_sales - Sheet1]
GROUP BY City
ORDER BY Total_Sales DESC;
--By Branch
SELECT TOP 1 
    Branch, 
    SUM(Total) AS Total_Sales
FROM [supermarket_sales - Sheet1]
GROUP BY Branch
ORDER BY Total_Sales DESC;

--5.	Sales by products 
SELECT 
    Product_line AS Product, 
    SUM(Total) AS Total_Sales
FROM [supermarket_sales - Sheet1]
GROUP BY Product_line
ORDER BY Total_Sales DESC;

--6.	Top products by quantity 
SELECT TOP 5 
    Product_line AS Product, 
    SUM(Quantity) AS Total_Quantity_Sold
FROM [supermarket_sales - Sheet1]
GROUP BY Product_line
ORDER BY Total_Quantity_Sold DESC;

--7.	Top products by profit 
SELECT TOP 5 
    Product_line AS Product, 
    SUM([gross_income]) AS Total_Profit
FROM [supermarket_sales - Sheet1]
GROUP BY Product_line
ORDER BY Total_Profit DESC;

--8.	Top rated products 
SELECT TOP 5 
    Product_line AS Product, 
    AVG(Rating) AS Avg_Rating
FROM [supermarket_sales - Sheet1]
GROUP BY Product_line
ORDER BY Avg_Rating DESC;

--9.	how customers prefer to pay (payment method) 
SELECT 
    Payment, 
    COUNT(*) AS Frequency
FROM [supermarket_sales - Sheet1]
GROUP BY Payment
ORDER BY Frequency DESC;

--10. Cogs to sales per month 
SELECT 
    MONTH(CAST(Date AS DATE)) AS Month, 
    SUM(cogs) AS Total_COGS, 
    SUM(Total) AS Total_Sales
FROM [supermarket_sales - Sheet1]
GROUP BY MONTH(CAST(Date AS DATE))
ORDER BY Month;

--11.    the best-selling times 
SELECT 
    DATEPART(HOUR, CAST(Time AS TIME)) AS Hour, 
    SUM(Total) AS Total_Sales
FROM [supermarket_sales - Sheet1]
GROUP BY DATEPART(HOUR, CAST(Time AS TIME))
ORDER BY Total_Sales DESC;

--12.      Relation between rating & profit /quantity 
SELECT 
    ROUND(Rating, 0) AS Rating_Group, 
    AVG([gross_income]) AS Avg_Profit
FROM [supermarket_sales - Sheet1]
GROUP BY ROUND(Rating, 0)
ORDER BY Rating_Group;

--rating  & quantity 
SELECT 
    ROUND(Rating, 0) AS Rating_Group, 
    AVG(Quantity) AS Avg_Quantity_Sold
FROM [supermarket_sales - Sheet1]
GROUP BY ROUND(Rating, 0)
ORDER BY Rating_Group;

--13.	 the average amount customers spend per invoice.
SELECT 
    AVG(Total) AS Avg_Spending_Per_Invoice
FROM [supermarket_sales - Sheet1];