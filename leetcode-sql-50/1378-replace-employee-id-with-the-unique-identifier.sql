-- LeetCode 1378: Replace Employee ID With The Unique Identifier (Easy)
-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/

SELECT unique_id, name 
FROM employees e LEFT JOIN employeeuni ei ON e.id = ei.id;