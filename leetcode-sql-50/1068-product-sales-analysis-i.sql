-- LeetCode 1068: Product Sales Analysis I (Easy)
-- https://leetcode.com/problems/product-sales-analysis-i/

SELECT product_name, year, price 
FROM sales s JOIN product p ON s.product_id = p.product_id 
WHERE sale_id IS NOT NULL;