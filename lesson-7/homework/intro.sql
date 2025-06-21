-- =============================================
-- LESSON 7 - Aggregate Functions and HAVING
-- Topics: MIN, MAX, COUNT, AVG, SUM, HAVING
-- SQL Server compatible
-- =============================================

-- 🟢 Easy-Level Tasks

-- 1. Find the minimum price of a product
SELECT MIN(Price) AS MinPrice
FROM Products;

-- 2. Find the maximum salary
SELECT MAX(Salary) AS MaxSalary
FROM Employees;

-- 3. Count total customers
SELECT COUNT(*) AS CustomerCount
FROM Customers;

-- 4. Count unique product categories
SELECT COUNT(DISTINCT Category) AS UniqueCategories
FROM Products;

-- 5. Total sales amount for product with ID 7
SELECT SUM(SaleAmount) AS TotalSales
FROM Sales
WHERE ProductID = 7;

-- 6. Average age of employees
SELECT AVG(Age) AS AvgAge
FROM Employees;

-- 7. Count employees in each department
SELECT DepartmentName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName;

-- 8. Min and max product price by category
SELECT Category, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;

-- 9. Total sales per customer (Sales table)
SELECT CustomerID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID;

-- 10. Departments with more than 5 employees
SELECT DepartmentName
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5;


-- 🟠 Medium-Level Tasks

-- 11. Total and average sales per product category
SELECT p.Category, SUM(s.SaleAmount) AS TotalSales, AVG(s.SaleAmount) AS AvgSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;

-- 12. Count of employees in HR department
SELECT COUNT(*) AS HR_EmployeeCount
FROM Employees
WHERE DepartmentName = 'HR';

-- 13. Highest and lowest salary by department
SELECT DepartmentName, MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary
FROM Employees
GROUP BY DepartmentName;

-- 14. Average salary per department
SELECT DepartmentName, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName;

-- 15. AVG salary and employee count per department
SELECT DepartmentName, AVG(Salary) AS AvgSalary, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName;

-- 16. Categories with average price > 400
SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;

-- 17. Total sales per year
SELECT YEAR(SaleDate) AS SaleYear, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate);

-- 18. Customers with at least 3 orders
SELECT CustomerID
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) >= 3;

-- 19. Departments with average salary > 60000
SELECT DepartmentName
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 60000;


-- 🔴 Hard-Level Tasks

-- 20. Avg price per category > 150
SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150;

-- 21. Customers with total sales > 1500
SELECT CustomerID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount) > 1500;

-- 22. Departments with average salary > 65000
SELECT DepartmentName, SUM(Salary) AS TotalSalary, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000;

-- 23. Orders (from TSQL2012) - total freight > $50 and least purchase
SELECT o.CustomerID, SUM(o.Freight) AS TotalFreightOver50, MIN(o.TotalAmount) AS LeastPurchase
FROM tsql2012.sales.orders o
WHERE o.Freight > 50
GROUP BY o.CustomerID;

-- 24. Total sales and unique products per month, months with ≥ 2 products
SELECT YEAR(OrderDate) AS SaleYear, MONTH(OrderDate) AS SaleMonth,
       SUM(TotalAmount) AS TotalSales,
       COUNT(DISTINCT ProductID) AS ProductCount
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(DISTINCT ProductID) >= 2;

-- 25. MIN and MAX quantity per year
SELECT YEAR(OrderDate) AS OrderYear,
       MIN(Quantity) AS MinQuantity,
       MAX(Quantity) AS MaxQuantity
FROM Orders
GROUP BY YEAR(OrderDate);
