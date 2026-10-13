-- SQLBolt Lesson 12
-- https://sqlbolt.com/lesson/select_queries_order_of_execution

-- Q1: Find the number of movies each director has directed
SELECT COUNT(director) AS movie_count, director FROM movies GROUP BY director;

-- Q2: Find the total domestic and international sales that can be attributed to each director
SELECT SUM(boxoffice.domestic_sales + boxoffice.international_sales), movies.director FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id GROUP BY director;