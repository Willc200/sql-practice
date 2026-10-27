-- PGExercises: Joins
-- https://pgexercises.com/questions/joins/
-- Dialect: PostgreSQL

-- Q1: Retrieve the start times of members' bookings
SELECT starttime 
FROM cd.bookings bookings INNER JOIN cd.members members ON bookings.memid = members.memid 
WHERE members.surname = 'Farrell' AND members.firstname = 'David';

-- Q2: Work out the start times of bookings for tennis courts
SELECT bookings.starttime AS start, facilities.name 
FROM cd.bookings bookings INNER JOIN cd.facilities facilities ON bookings.facid = facilities.facid 
WHERE facilities.name LIKE 'Tennis Court%' AND bookings.starttime >= '2012-09-21' AND bookings.starttime < '2012-09-22' ORDER BY bookings.starttime ASC;

-- Q3: Produce a list of all members who have recommended another member
SELECT DISTINCT recs.firstname AS firstname, recs.surname AS surname 
FROM cd.members mems INNER JOIN cd.members recs ON recs.memid = mems.recommendedby 
ORDER BY surname, firstname ASC;

-- Q4: Produce a list of all members, along with their recommender
SELECT members.firstname AS memfname, members.surname AS memsname, recs.firstname AS recfname, recs.surname AS recsname 
FROM cd.members members LEFT JOIN cd.members recs ON recs.memid = members.recommendedby
ORDER BY members.surname, members.firstname ASC;

-- Q5: Produce a list of all members who have used a tennis court
SELECT DISTINCT mem.firstname || ' ' || mem.surname AS member, fac.name AS facility
FROM cd.members mem INNER JOIN cd.bookings bookings ON mem.memid = bookings.memid
INNER JOIN cd.facilities fac ON bookings.facid = fac.facid
WHERE fac.name LIKE 'Tennis Court%'
ORDER BY member, facility;

-- Q6: Produce a list of costly bookings
SELECT mems.firstname || ' ' || mems.surname AS member, facs.name AS facility,
	CASE 
	    WHEN mems.memid = 0 THEN facs.guestcost * booking.slots
	    ELSE facs.membercost * booking.slots
	END AS cost
FROM cd.bookings booking INNER JOIN cd.members mems ON booking.memid = mems.memid
INNER JOIN cd.facilities facs ON booking.facid = facs.facid
WHERE booking.starttime >= '2012-09-14' 
AND booking.starttime < '2012-09-15'
AND ((mems.memid = 0 AND facs.guestcost * booking.slots > 30) OR (mems.memid != 0 AND facs.membercost * booking.slots > 30))
ORDER BY cost DESC;

-- Q7: Produce a list of all members, along with their recommender, using no joins
SELECT DISTINCT mems.firstname || ' ' || mems.surname AS member, 
(SELECT recs.firstname || ' ' || recs.surname AS recommender FROM cd.members recs WHERE mems.recommendedby = recs.memid)
FROM cd.members mems
ORDER BY member ASC

-- Q8: Produce a list of costly bookings, using a subquery
SELECT member, facility, cost
FROM (
    SELECT
        mems.firstname || ' ' || mems.surname AS member,
        facs.name AS facility,
        CASE
            WHEN mems.memid = 0 THEN facs.guestcost  * bookings.slots
            ELSE                     facs.membercost * bookings.slots
        END AS cost
    FROM cd.members mems
    INNER JOIN cd.bookings bookings
        ON mems.memid = bookings.memid
    INNER JOIN cd.facilities facs
        ON bookings.facid = facs.facid
    WHERE bookings.starttime >= '2012-09-14'
      AND bookings.starttime <  '2012-09-15'
) AS costs
WHERE cost > 30
ORDER BY cost DESC;
