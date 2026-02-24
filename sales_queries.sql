-- =====================================================
-- SALES DATA FULL-STACK ANALYTICS PROJECT (MySQL Layer)
-- =====================================================

-- Create database
CREATE DATABASE sales_project;

-- Use database
USE sales_project;

-- -----------------------------------------------------
-- Basic Data Exploration
-- -----------------------------------------------------

-- Total number of records
SELECT COUNT(*) AS Total_Records
FROM sales;

-- Preview first 5 rows
SELECT *
FROM sales
LIMIT 5;

-- -----------------------------------------------------
-- Business Aggregations
-- -----------------------------------------------------

-- Total Revenue
SELECT SUM(`Total Revenue`) AS Total_Revenue
FROM sales;

-- Revenue by Sales Channel
SELECT `Sales Channel`,
       SUM(`Total Revenue`) AS Channel_Revenue
FROM sales
GROUP BY `Sales Channel`;

-- Profit by Region (Highest to Lowest)
SELECT `Region`,
       SUM(`Total Profit`) AS Total_Profit
FROM sales
GROUP BY `Region`
ORDER BY Total_Profit DESC;

-- -----------------------------------------------------
-- Filtered Business Questions
-- -----------------------------------------------------

-- Total Revenue from Online Sales
SELECT SUM(`Total Revenue`) AS Online_Revenue
FROM sales
WHERE `Sales Channel` = 'Online';

-- Best Performing Region for Online Sales
SELECT `Region`,
       SUM(`Total Revenue`) AS Online_Revenue
FROM sales
WHERE `Sales Channel` = 'Online'
GROUP BY `Region`
ORDER BY Online_Revenue DESC;

-- -----------------------------------------------------
-- Profit Margin by Region
-- -----------------------------------------------------

SELECT `Region`,
       SUM(`Total Profit`) / NULLIF(SUM(`Total Revenue`), 0) AS Profit_Margin
FROM sales
GROUP BY `Region`
ORDER BY Profit_Margin DESC;