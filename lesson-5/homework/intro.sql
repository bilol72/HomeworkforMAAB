-- ================================
-- Lesson 5: Aliases, Unions, and Conditional Columns
-- ================================

-- Assume necessary tables already exist: Products, Products_Discounted, Customers, Employees, Sales, Orders

-- EASY LEVEL TASKS

-- 1. Rename ProductName column as Name using alias
SELECT ProductName AS Name FROM Products;

-- 2. Rename Customers table as Client using alias
SELECT * FROM Customers AS Client;

-- 3. Combine ProductName from Products and Products_Discounted using UNION (removes duplicates)
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

-- 4. Find common ProductNames using INTERSECT
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;

-- 5. Select distinct customer names and countries
SELECT DISTINCT Name, Country FROM Customers;

-- 6. Create a column with CASE: 'High' if Price > 1000, else 'Low'
SELECT 
    ProductName, 
    Price,
    CASE 
        WHEN Price > 1000 THEN 'High'
        ELSE 'Low'
    END AS PriceLevel
FROM Products;

-- 7. Use IIF: 'Yes' if StockQuantity > 100, else 'No'
SELECT 
    ProductName,
    StockQuantity,
    IIF(StockQuantity > 100, 'Yes', 'No') AS InStock
FROM Products_Discounted;

-- =========================================

-- MEDIUM LEVEL TASKS

-- 1. UNION between Products and Products_Discounted (same as easy task 3)
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

-- 2. Products that are not in Products_Discounted using EXCEPT
SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;

-- 3. Conditional column with IIF: Expensive vs Affordable
SELECT 
    ProductName,
    Price,
    IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;

-- 4. Find employees younger than 25 or with salary greater than 60,000
SELECT * 
FROM Employees
WHERE Age < 25 OR Salary > 60000;

-- 5. Update salary: +10% if department is HR or EmployeeID = 5
UPDATE Employees
SET Salary = Salary * 1.10
WHERE Department = 'HR' OR EmployeeID = 5;

-- =========================================

-- HARD LEVEL TASKS

-- 1. Use CASE to assign sales tiers based on SaleAmount
SELECT 
    SaleID,
    SaleAmount,
    CASE 
        WHEN SaleAmount > 500 THEN 'Top Tier'
        WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
        ELSE 'Low Tier'
    END AS SaleCategory
FROM Sales;

-- 2. Customer IDs who have orders but no sales (EXCEPT)
SELECT DISTINCT CustomerID FROM Orders
EXCEPT
SELECT DISTINCT CustomerID FROM Sales;

-- 3. CASE discount logic by quantity ordered
SELECT 
    CustomerID,
    Quantity,
    CASE 
        WHEN Quantity = 1 THEN '3%'
        WHEN Quantity BETWEEN 2 AND 3 THEN '5%'
        ELSE '7%'
    END AS DiscountPercentage
FROM Orders;

-- END OF LESSON 5
