-- ============================================
-- Insert Orders and Run Queries
-- ============================================

-- INSERT 40 rows into Orders table with random dates
INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity, TotalAmount) VALUES
(1, 1, 2, '2023-05-14', 1, 800.00),
(2, 2, 3, '2024-09-07', 2, 800.00),
(3, 3, 4, '2022-11-22', 1, 250.00),
(4, 4, 5, '2021-03-30', 3, 150.00),
(5, 5, 6, '2025-07-19', 1, 30.00),
(6, 6, 7, '2022-08-25', 2, 300.00),
(7, 7, 8, '2024-06-10', 1, 200.00),
(8, 8, 9, '2021-12-04', 4, 40.00),
(9, 9, 10, '2023-02-18', 1, 10.00),
(10, 10, 11, '2025-09-27', 2, 360.00),
(11, 11, 12, '2023-10-11', 1, 500.00),
(12, 12, 13, '2024-04-03', 1, 25.00),
(13, 13, 14, '2022-07-29', 2, 60.00),
(14, 14, 15, '2021-01-22', 3, 135.00),
(15, 15, 16, '2025-11-15', 1, 80.00),
(16, 16, 17, '2022-10-08', 1, 60.00),
(17, 17, 18, '2023-06-21', 2, 40.00),
(18, 18, 19, '2021-09-13', 5, 50.00),
(19, 19, 20, '2025-03-05', 2, 50.00),
(20, 20, 21, '2024-08-14', 1, 60.00),
(21, 21, 22, '2022-12-01', 1, 100.00),
(22, 22, 23, '2023-09-09', 1, 15.00),
(23, 23, 24, '2021-07-18', 2, 180.00),
(24, 24, 25, '2025-06-23', 3, 15.00),
(25, 25, 26, '2023-03-12', 4, 100.00),
(26, 26, 27, '2022-04-07', 1, 450.00),
(27, 27, 28, '2024-11-30', 1, 600.00),
(28, 28, 29, '2021-02-25', 1, 500.00),
(29, 29, 30, '2025-05-28', 2, 240.00),
(30, 30, 31, '2023-08-20', 1, 350.00),
(31, 31, 32, '2022-01-17', 1, 450.00),
(32, 32, 33, '2025-09-10', 1, 40.00),
(33, 33, 34, '2021-04-04', 2, 100.00),
(34, 34, 35, '2024-07-15', 3, 120.00),
(35, 35, 36, '2022-10-31', 1, 60.00),
(36, 36, 37, '2023-12-22', 1, 35.00),
(37, 37, 38, '2021-06-06', 2, 110.00),
(38, 38, 39, '2025-02-01', 1, 40.00),
(39, 39, 40, '2023-11-26', 3, 120.00),
(40, 40, 1, '2024-03-09', 1, 1200.00);

-- ============================================
-- EASY TASKS
-- ============================================

-- 1. Get all employee names and their departments
SELECT EmpName, DeptName
FROM Employees
JOIN Departments ON Employees.DeptID = Departments.DeptID;

-- 2. List all products with their price after applying discount
SELECT 
    ProductName,
    Price,
    Discount,
    Price - (Price * Discount / 100) AS DiscountedPrice
FROM Products_Discounted;

-- 3. Show total number of sales made by each employee
SELECT 
    EmployeeID,
    COUNT(*) AS TotalSales
FROM Sales
GROUP BY Employee

Albatta! Quyida siz bergan SQL koddagi xatolar toʻgʻrilangan, strukturasi yaxshilangan, va GitHub’ga yuklash uchun toza va toʻliq `orders-and-queries.sql` fayl ko‘rinishida yozilgan. Bu faylda:

- Orders jadvali yaratiladi.
- 40 ta satr Orders jadvaliga to‘g‘ri formatda kiritiladi.
- Employees, Products_Discounted, Sales kabi jadval va ustun nomlari tekshirib chiqildi.
- SQL Server’ga mos so‘rovlar tuzildi (masalan, LIMIT o‘rniga TOP 1 ishlatilgan).

---

### 📄 orders-and-queries.sql

```sql
-- =============================================
-- Orders Table and Analytical Queries Script
-- Compatible with Microsoft SQL Server
-- =============================================

-- Create the Orders table (if it doesn't exist)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
