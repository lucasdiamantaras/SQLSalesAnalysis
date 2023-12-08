select * from dbo.online_retail;

-- some analysis queries

-- Calculate total sales per country
-- Unit price is in Pound sterling (or, British pound or simply GBP)
SELECT Country, SUM(UnitPrice * Quantity) AS [TotalSales_£]
FROM dbo.online_retail
GROUP BY Country
ORDER BY [TotalSales_£] DESC;


-- Count the number of orders per customer
SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS NumberOfOrders
FROM dbo.online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY NumberOfOrders DESC;

-- Identify the most popular items
SELECT StockCode, Description, COUNT(*) AS TimesSold
FROM dbo.online_retail
GROUP BY StockCode, Description
ORDER BY TimesSold DESC;

-- Analyze monthly sales trends
SELECT YEAR(InvoiceDate) AS Year, MONTH(InvoiceDate) AS Month, SUM(UnitPrice * Quantity) AS MonthlySales
FROM dbo.online_retail
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Year, Month;

-- Calculate the average spend per invoice
SELECT InvoiceNo, AVG(UnitPrice * Quantity) AS AvgSpend
FROM dbo.online_retail
GROUP BY InvoiceNo
ORDER BY AvgSpend DESC;

-- Find the top spending customers
SELECT CustomerID, SUM(UnitPrice * Quantity) AS TotalSpend
FROM dbo.online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalSpend DESC;
