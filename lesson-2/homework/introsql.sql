-- 24. Alter Inventory table: Price to FLOAT
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

-- 25. Add IDENTITY column ProductCode

CREATE TABLE Inventory_New (
    ProductCode INT IDENTITY(1000,5) PRIMARY KEY,
    ProductID INT,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Price FLOAT,
    CreatedAt DATETIME,
    StockQuantity INT
);

-- Copy data
INSERT INTO Inventory_New (ProductID, ProductName, ProductCategory, Price, CreatedAt, StockQuantity)
SELECT ProductID, ProductName, ProductCategory, Price, CreatedAt, StockQuantity
FROM Inventory;

-- Drop old table and rename new
DROP TABLE Inventory;
EXEC sp_rename 'Inventory_New', 'Inventory';

-- DONE ✅
