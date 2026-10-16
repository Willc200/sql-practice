-- LeetCode 1683: Invalid Tweets (Easy)
-- https://leetcode.com/problems/invalid-tweets/

SELECT tweet_id 
FROM tweets 
WHERE LEN(content) > 15;