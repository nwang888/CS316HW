-- Find which customers ordered 'Singaporean Hokkien Fried Mee'.
-- Simply list these customers’ names; no duplicates.

SELECT DISTINCT c.customername
FROM customers c
JOIN orders o ON c.customerid = o.customerid
JOIN ordersdetails od ON o.orderid = od.orderid
JOIN products p ON p.productid = od.productid
WHERE p.productname = 'Singaporean Hokkien Fried Mee';