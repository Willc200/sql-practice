-- LeetCode 197: Rising Temperature (Easy)
-- https://leetcode.com/problems/rising-temperature/

SELECT today.id
FROM weather today INNER JOIN weather yesterday ON today.recorddate = DATEADD(day, 1, yesterday.recorddate)
WHERE today.temperature > yesterday.temperature;