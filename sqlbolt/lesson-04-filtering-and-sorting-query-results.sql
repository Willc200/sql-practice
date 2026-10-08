-- SQLBolt Lesson 4
-- https://sqlbolt.com/lesson/filtering_sorting_query_results

-- Q1: List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT director FROM movies order by 1 asc;

-- Q2: List the last four Pixar movies released (ordered from most recent to least)
SELECT * FROM movies order by year desc limit 4;

-- Q3: List the first five Pixar movies sorted alphabetically
SELECT * FROM movies order by title asc limit 5;

-- Q4: List the next five Pixar movies sorted alphabetically
SELECT * FROM movies order by title asc limit 5 offset 5;
