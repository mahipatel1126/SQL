-- =====================================================
-- Problem: Salespersons Without RED Orders
-- =====================================================

/*

Problem Statement:
Write a solution to find the names of all the salespersons
who did not have any orders related to the company
with the name "RED".

Tables:
1. SalesPerson
2. Company
3. Orders

Approach:
- Join Orders and Company tables using com_id
- Find salespersons who worked with company 'RED'
- Exclude them using NOT IN

*/

-- =====================================================
-- SQL Query
-- =====================================================

SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT o.sales_id
    FROM Orders o
    JOIN Company c
    ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);

-- =====================================================
-- Expected Output
-- =====================================================

/*

+------+
| name |
+------+
| Amy  |
| Mark |
| Alex |
+------+

*/