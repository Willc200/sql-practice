-- SQLBolt Lesson 6
-- https://sqlbolt.com/lesson/select_queries_with_joins

-- Q1: Find the domestic and international sales for each movie
SELECT * FROM movies inner join boxoffice on movies.id = boxoffice.movie_id;

-- Q2: Show the sales numbers for each movie that did better internationally rather than domestically
SELECT * FROM movies inner join boxoffice on movies.id = boxoffice.movie_id where international_sales > domestic_sales;

-- Q3: List all the movies by their ratings in descending order
SELECT * FROM movies inner join boxoffice on movies.id = boxoffice.movie_id order by rating desc;