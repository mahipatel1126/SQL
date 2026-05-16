-- Duplicate Emails - LeetCode SQL

-- Find duplicate emails from Person table

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;