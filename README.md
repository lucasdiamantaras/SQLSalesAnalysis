
## Project Objective: 
Clean and analyze a dataset from an e-commerce platform to derive insights about sales trends, customer behavior, and product performance.

## The data: Online Retail Dataset from UCI Machine Learning Repository.

**Description**: "This is a dataset containing all the transactions occurring between 01/12/2010 and 09/12/2011 for a UK-based online retail. It includes attributes like invoice number, stock code, description, quantity, invoice date, unit price, customer ID, and country."

URL: UCI Machine Learning Repository - Online Retail Dataset https://archive.ics.uci.edu/dataset/352/online+retail

### Additional Variable Information (column information)
- InvoiceNo: Invoice number. Nominal, a 6-digit integral number uniquely assigned to each transaction. If this code starts with letter 'c', it indicates a cancellation. 
- StockCode: Product (item) code. Nominal, a 5-digit integral number uniquely assigned to each distinct product.
- Description: Product (item) name. Nominal.
- Quantity: The quantities of each product (item) per transaction. Numeric.	
- InvoiceDate: Invice Date and time. Numeric, the day and time when each transaction was generated.
- UnitPrice: Unit price. Numeric, Product price per unit in sterling.
- CustomerID: Customer number. Nominal, a 5-digit integral number uniquely assigned to each customer.
- Country: Country name. Nominal, the name of the country where each customer resides. 

## Data Analysis goals:

- Analyze sales trends over time.
- Customer segmentation based on purchasing behavior.
- Product performance analysis and identifying best-sellers and underperformers.

## Files (Case01):

"analysis_queries.sql", "cleaning_queries.sql" - SQL script containing all queries and transformations.

"Case01_analysis_results.xlsx" - Tables obtained from the queries extracted to .xlsx format

"Case01_Analysis_Vis.pbix" - A report in Power BI created with the query results in .xlsx format, visualizing key insights from the data.








