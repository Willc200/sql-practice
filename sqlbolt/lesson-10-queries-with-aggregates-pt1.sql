-- SQLBolt Lesson 10
-- https://sqlbolt.com/lesson/select_queries_with_aggregates

-- Q1: Find the longest time that an employee has been at the studio
SELECT MAX(years_employed) AS years_employed FROM employees;

-- Q2: For each role, find the average number of years employed by employees in that role
SELECT AVG(years_employed) AS average_years_employed, role FROM employees GROUP BY role;

-- Q3: Find the total number of employee years worked in each building
SELECT SUM(years_employed) AS total_number_years_worked, building FROM employees GROUP BY building;