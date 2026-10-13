-- SQLBolt Lesson 7
-- https://sqlbolt.com/lesson/select_queries_with_outer_joins

-- Q1: Find the list of all buildings that have employees 
SELECT DISTINCT building FROM employees;

-- Q2: Find the list of all buildings and their capacity
SELECT * FROM buildings;

-- Q3: List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT role, building_name FROM buildings LEFT JOIN employees ON buildings.building_name = employees.building;