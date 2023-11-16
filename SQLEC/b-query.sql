-- For each product category,
-- list the total number of orders for this category.
-- Even when an order contains multiple products in the category or large quantities of products in this category, it should be counted only once towards the total for that category.
-- Show the category name and the number of orders, sorted by the latter in descending order. If no order has been placed for a category, the number should be shown as 0.
-- For example, here are some sample rows from the correct output:
--   categoryname  | numorders 
-- ----------------+-----------
--  Beverages      |        37
--  Produce        |        10
--  Eclectic       |         0

SELECT c.categoryname, COUNT(DISTINCT o.orderid) as numorders
FROM categories c
JOIN products p ON c.categoryid = p.categoryid
JOIN ordersdetails od ON p.productid = od.productid
JOIN orders o ON od.orderid = o.orderid
GROUP BY c.categoryname
ORDER BY numorders DESC;