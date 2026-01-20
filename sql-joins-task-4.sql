-- Task 4: SQL Joins (INNER, LEFT) + Business Questions
-- Dataset: Chinook Database
-- Database: MySQL

-- 1. INNER JOIN: Customers with Orders
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    i.InvoiceId,
    i.InvoiceDate,
    i.Total
FROM customer c
INNER JOIN invoice i
ON c.CustomerId = i.CustomerId;

-- 2. LEFT JOIN: Customers with No Orders
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM customer c
LEFT JOIN invoice i
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

-- 3. Revenue per Product
SELECT 
    t.TrackId,
    t.Name AS ProductName,
    SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM invoiceline il
INNER JOIN track t
ON il.TrackId = t.TrackId
GROUP BY t.TrackId, t.Name
ORDER BY TotalRevenue DESC;

-- 4. Category-wise Revenue
SELECT 
    g.Name AS Category,
    SUM(il.UnitPrice * il.Quantity) AS CategoryRevenue
FROM invoiceline il
INNER JOIN track t ON il.TrackId = t.TrackId
INNER JOIN genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY CategoryRevenue DESC;

-- 5. Business Question: Sales in USA between dates
SELECT 
    c.Country,
    i.InvoiceDate,
    i.Total
FROM customer c
INNER JOIN invoice i
ON c.CustomerId = i.CustomerId
WHERE c.Country = 'USA'
AND i.InvoiceDate BETWEEN '2012-01-01' AND '2013-12-31';
