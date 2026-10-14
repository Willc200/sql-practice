-- SQLBolt Lesson 14
-- https://sqlbolt.com/lesson/updating_rows

-- Q1: The director for A Bug's Life is incorrect, it was actually directed by John Lasseter
UPDATE movies
SET director = 'John Lasseter'
WHERE id = 2;

-- Q2: The year that Toy Story 2 was released is incorrect, it was actually released in 1999
UPDATE movies
SET year = 1999
WHERE id = 3;

-- Q3: Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich
UPDATE movies
SET title = 'Toy Story 3', director = 'Lee Unkrich'
WHERE id = 11;