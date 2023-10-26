SELECT B.name AS beer, MIN(S.price) AS price, S.bar
FROM Beer B
LEFT JOIN Serves S ON B.name = S.beer
GROUP BY B.name, S.bar
HAVING MIN(S.price) = (
    SELECT MIN(price)
    FROM Serves
    WHERE beer = B.name
) OR MIN(S.price) IS NULL