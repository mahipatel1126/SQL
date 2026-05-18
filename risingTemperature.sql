-- =========================================================
-- Problem: Rising Temperature
-- Platform: LeetCode
-- =========================================================

-- Problem Description:
-- Write an SQL query to find all dates' IDs where the
-- temperature is higher than the previous day (yesterday).

-- Table: Weather
--
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
--
-- id is the unique column.
-- No two rows have the same recordDate.


-- Example

-- Input:
--
-- +----+------------+-------------+
-- | id | recordDate | temperature |
-- +----+------------+-------------+
-- | 1  | 2015-01-01 | 10          |
-- | 2  | 2015-01-02 | 25          |
-- | 3  | 2015-01-03 | 20          |
-- | 4  | 2015-01-04 | 30          |
-- +----+------------+-------------+

-- Output:
--
-- +----+
-- | id |
-- +----+
-- | 2  |
-- | 4  |
-- +----+

-- Explanation:
-- On 2015-01-02:
-- Temperature increased from 10 to 25
--
-- On 2015-01-04:
-- Temperature increased from 20 to 30


-- SQL Solution


SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;

-- =============
-- Explanation


-- 1. Self Join
-- We join the Weather table with itself.
--
-- w1 -> current day
-- w2 -> previous day

-- 2. DATEDIFF()
-- DATEDIFF(w1.recordDate, w2.recordDate) = 1
--
-- checks if the dates are exactly one day apart.

-- Example:
-- DATEDIFF('2015-01-02', '2015-01-01') = 1

-- 3. Temperature Comparison
-- w1.temperature > w2.temperature
--
-- checks whether today's temperature is higher
-- than yesterday's temperature.

