-- ============================================
-- SQL Server Practice - Lesson 6
-- Author: Bilol Jumanboyev
-- Description: Puzzle-based SQL practice problems
-- ============================================


-- ============================================
-- Puzzle 1: Finding Distinct Values from Two Columns
-- ============================================

CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);

INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c', 'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');

-- Solution: Normalize and remove duplicates (a,b) ~ (b,a)
SELECT DISTINCT
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;



-- ============================================
-- Puzzle 2: Removing Rows with All Zeroes
-- ============================================

CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

INSERT INTO TestMultipleZero (A, B, C, D) VALUES 
(0,0,0,1),
(0,0,1,0),
(0,1,0,0),
(1,0,0,0),
(0,0,0,0),  -- This row should be excluded
(1,1,1,0);

-- Solution: Only show rows where the sum of values is more than 0
SELECT * FROM TestMultipleZero
WHERE ISNULL(A,0) + ISNULL(B,0) + ISNULL(C,0) + ISNULL(D,0) > 0;



-- ============================================
-- Puzzle 3: Find Rows with Odd IDs
-- ============================================

CREATE TABLE section1 (
    id INT,
    name VARCHAR(20)
);

INSERT INTO section1 VALUES 
(1, 'Been'),
(2, 'Roma'),
(3, 'Steven'),
(4, 'Paulo'),
(5, 'Genryh'),
(6, 'Bruno'),
(7, 'Fred'),
(8, 'Andro');

-- Solution: IDs that are odd
SELECT * FROM section1
WHERE id % 2 = 1;



-- ============================================
-- Puzzle 4: Person with the Smallest ID
-- ============================================

SELECT TOP 1 * FROM section1
ORDER BY id ASC;



-- ============================================
-- Puzzle 5: Person with the Highest ID
-- ============================================

SELECT TOP 1 * FROM section1
ORDER BY id DESC;



-- ============================================
-- Puzzle 6: Names Starting with 'b' (Case-insensitive)
-- ============================================

SELECT * FROM section1
WHERE name LIKE 'b%' COLLATE SQL_Latin1_General_CP1_CI_AS;



-- ============================================
-- Puzzle 7: Code Contains Literal Underscore (_)
-- ============================================

CREATE TABLE ProductCodes (
    Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');

-- Solution: Match literal underscore using ESCAPE
SELECT * FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';



-- ============================================
-- End of File
-- ============================================
