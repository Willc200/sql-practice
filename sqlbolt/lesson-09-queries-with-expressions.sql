-- SQLBolt Lesson 9
-- https://sqlbolt.com/lesson/select_queries_with_expressions

-- Q1: List all movies and their combined sales in millions of dollars
SELECT movies.title AS movie_title, (boxoffice.domestic_sales + international_sales) / 1000000 AS millions_of_dollars FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id;

-- Q2: List all movies and their ratings in percent
SELECT movies.title AS movie_title, boxoffice.rating * 10 AS rating_in_percent FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id;

-- Q3: List all movies that were released on even number years
SELECT movies.title AS movie_title, year AS movie_year FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id WHERE movie_year % 2 = 0;