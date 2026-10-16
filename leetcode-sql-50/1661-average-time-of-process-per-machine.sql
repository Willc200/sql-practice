-- LeetCode 1661: Average Time of Process per Machine (Easy)
-- https://leetcode.com/problems/average-time-of-process-per-machine/

;WITH StartTime AS (
    SELECT machine_id, process_id, timestamp
    FROM activity
    WHERE activity_type = 'start'
),

EndTime AS (
    SELECT machine_id, process_id, timestamp
    FROM activity
    WHERE activity_type = 'end'
)

SELECT e.machine_id, ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM StartTime s JOIN EndTime e ON s.process_id = e.process_id AND s.machine_id = e.machine_id
GROUP BY e.machine_id;