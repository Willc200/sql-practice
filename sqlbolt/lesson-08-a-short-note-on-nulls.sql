-- SQLBolt Lesson 8
-- https://sqlbolt.com/lesson/select_queries_with_nulls

-- Q1: Find the name and role of all employees who have not been assigned to a building
SELECT name, role FROM employees WHERE building IS NULL;

-- Q2: Find the names of the buildings that hold no employees
SELECT * FROM buildings b LEFT JOIN employees e ON b.building_name = e.building WHERE e.building IS NULL;