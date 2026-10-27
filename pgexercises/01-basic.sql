-- PGExercises: Basic
-- https://pgexercises.com/questions/basic/
-- Dialect: PostgreSQL

-- Q1: Retrieve everything from a table
SELECT * 
FROM cd.facilities;

-- Q2: Retrieve specific columns from a table
SELECT name, membercost 
FROM cd.facilities;

-- Q3: Control which rows are retrieved
SELECT * 
FROM cd.facilities 
WHERE membercost > 0;

-- Q4: Control which rows are retrieved - part 2
SELECT facid, name, membercost, monthlymaintenance 
FROM cd.facilities 
WHERE membercost > 0 AND (membercost < monthlymaintenance * 0.02);

-- Q5: Basic string searches
SELECT * 
FROM cd.facilities 
WHERE name LIKE '%Tennis%';

-- Q6: Matching against multiple possible values
SELECT * 
FROM cd.facilities 
WHERE facid IN (1, 5); 


-- Q7: Classify results into buckets
SELECT name, 
	CASE WHEN (monthlymaintenance > 100) THEN
		'expensive'
	ELSE
		'cheap'	   
	END AS cost 
	FROM cd.facilities;

-- Q8: Working with dates
SELECT memid, surname, firstname, joindate 
FROM cd.members 
WHERE joindate >= '2012-09-01';

-- Q9: Removing duplicates, and ordering results
SELECT DISTINCT surname 
FROM cd.members 
ORDER BY surname ASC LIMIT 10;

-- Q10: Combining results from multiple queries
SELECT surname 
FROM cd.members
UNION
SELECT name 
FROM cd.facilities;

-- Q11: Simple aggregation
SELECT joindate AS latest 
FROM cd.members 
ORDER BY joindate DESC LIMIT 1;

-- Q12: More aggregation
SELECT firstname, surname, joindate 
FROM cd.members 
ORDER BY joindate DESC LIMIT 1;