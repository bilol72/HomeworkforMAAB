-- ============================================
-- SQL Server Database Setup Script
-- Author: Your Name
-- Description: Creates tables, constraints, and sample data
-- ============================================

-- 1. Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Insert sample data into Products
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
    (1, 'Laptop', 1200.00),
    (2, 'Mouse', 25.50),
    (3, 'Keyboard', 45.99);

-- Add UNIQUE constraint to ProductName
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

-- Select products with Price greater than 50
SELECT * FROM Products WHERE Price > 50;

-- 2. Create Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

-- 3. Import Products from external file (BULK INSERT)
-- Note: Ensure file path and permissions are correct before running this
BULK INSERT Products
FROM 'C:\\data\\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- 4. Add CategoryID column to Products
ALTER TABLE Products
ADD CategoryID INT;

-- Add FOREIGN KEY to CategoryID
ALTER TABLE Products
ADD CONSTRAINT FK_Category
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

-- 5. Add CHECK constraint to ensure Price > 0
ALTER TABLE Products
ADD CONSTRAINT CHK_Price CHECK (Price > 0);

-- 6. Add Stock column with NOT NULL and default value
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

-- 7. Select Products with ISNULL applied to Price
SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;

-- 8. Create Customers table with Age constraint
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT CHECK (Age >= 18)
);

-- 9. Create Invoices table with IDENTITY
CREATE TABLE Invoices (
    InvoiceID INT IDENTITY(100, 10) PRIMARY KEY,
    InvoiceAmount DECIMAL(10, 2)
);

-- 10. Create OrderDetails with composite primary key
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);

-- 11. Create Departments table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- 12. Create Employees table with foreign key and cascading rules
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    DeptID INT,
    Email VARCHAR(100) UNIQUE,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
