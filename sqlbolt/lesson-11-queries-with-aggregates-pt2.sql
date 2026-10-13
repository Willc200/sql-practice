-- SQLBolt Lesson 11
-- https://sqlbolt.com/lesson/select_queries_with_aggregates_pt_2

-- Q1: Find the number of Artists in the studio (without a HAVING clause)
SELECT COUNT(role) AS role_count, role FROM employees WHERE role = 'Artist';

-- Q2: Find the number of Employees of each role in the studio
SELECT COUNT(role) AS role_count, role FROM employees GROUP BY role;

-- Q3: Find the total number of years employed by all Engineers
SELECT SUM(years_employed) AS total_number_years_employed, role FROM employees GROUP BY role HAVING role = 'Engineer';