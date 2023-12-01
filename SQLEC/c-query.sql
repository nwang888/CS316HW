-- For each month in 1996, count the number of employees who did not process any order in that month.
-- If there were no such employees in a given month, output 0. Sort output by month (ascending).
-- Some useful functions:
-- https://www.postgresql.org/docs/16/functions-datetime.html#FUNCTIONS-DATETIME-EXTRACT
-- https://www.postgresql.org/docs/16/functions-srf.html
-- For example, here are some sample rows from the correct output:
--  month | count 
-- -------+-------
--      6 |    10 
--      7 |     2 

SELECT EXTRACT(MONTH FROM o.orderdate) AS month 
FROM orders o
JOIN employees e ON e.employeeid = e.employeeid
WHERE NOT EXISTS (
    SELECT *
    FROM orders oo
    WHERE EXTRACT(MONTH FROM oo.orderdate) = EXTRACT(MONTH FROM o.orderdate)
    AND oo.employeeid = e.employeeid
)
GROUP BY month
ORDER BY month ASC;