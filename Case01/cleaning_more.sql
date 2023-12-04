select * from dbo.online_retail;

--Identify Duplicate Records:
SELECT InvoiceNo, StockCode, COUNT(*)
FROM dbo.online_retail
GROUP BY InvoiceNo, StockCode
HAVING COUNT(*) > 1;

-- Remove Duplicate Records using a Common Table Expression:

WITH CTE_Duplicates AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY InvoiceNo, StockCode ORDER BY InvoiceNo) AS RowNumber
    FROM dbo.online_retail
)
DELETE FROM CTE_Duplicates WHERE RowNumber > 1;

-- Correct Data Types:

ALTER TABLE dbo.online_retail
ALTER COLUMN InvoiceDate DATETIME;

-- more cleaning
-- This example removes records where Quantity is extremely high or low
SELECT * FROM dbo.online_retail
WHERE Quantity < -1000 OR Quantity > 1000; 

-- Identifies invalid StockCode entries
SELECT StockCode
FROM dbo.online_retail
WHERE LEN(StockCode) != 5 OR ISNUMERIC(StockCode) = 0;

-- Remove records outside a specified date range

SELECT * FROM dbo.online_retail
WHERE InvoiceDate < '20100101' OR InvoiceDate > '20111231';

-- Example: Standardizing descriptions
UPDATE dbo.online_retail
SET Description = 'STANDARDIZED ITEM NAME'
WHERE Description IN ('Item Name Variant 1', 'Item Name Variant 2', ...);

-- Creating Indices on Frequently Used Columns (such as 'CustomerID'):

CREATE INDEX idx_customerid ON dbo.online_retail(CustomerID);


-- Integrity Checks (if applicable, for example, checking for valid 'CustomerID'):
-- Assuming there is a 'customers' table to cross-reference
DELETE FROM dbo.online_retail
WHERE CustomerID NOT IN (SELECT CustomerID FROM customers);
