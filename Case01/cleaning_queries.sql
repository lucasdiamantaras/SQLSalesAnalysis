select * from dbo.online_retail;

-- Check for Missing Values:

SELECT COUNT(*) AS MissingCount, 'Description' AS Field
FROM dbo.online_retail
WHERE Description IS NULL
UNION ALL
SELECT COUNT(*) AS MissingCount, 'CustomerID' AS Field
FROM dbo.online_retail
WHERE CustomerID IS NULL
UNION ALL
SELECT COUNT(*) AS MissingCount, 'InvoiceNo' AS Field
FROM dbo.online_retail
WHERE InvoiceNo IS NULL
UNION ALL
SELECT COUNT(*) AS MissingCount, 'StockCode' AS Field
FROM dbo.online_retail
WHERE StockCode IS NULL;

-- Remove Records with Missing Values:

DELETE FROM dbo.online_retail
WHERE CustomerID IS NULL OR Description IS NULL;

-- Standardize Text Format:

UPDATE dbo.online_retail
SET Description = UPPER(Description);

-- Check and Remove Records with Negative or Zero Quantity:

SELECT * FROM dbo.online_retail
WHERE Quantity <= 0
ORDER BY Quantity DESC;

DELETE FROM dbo.online_retail
WHERE Quantity <= 0;

-- Check for Invalid Prices:

SELECT *
FROM dbo.online_retail
WHERE UnitPrice < 0;



