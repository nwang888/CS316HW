SELECT B1.name AS bar1, B2.name AS bar2
FROM Bar B2, Bar B1
WHERE B1.name <> B2.name
AND NOT EXISTS (
    (SELECT S1.beer
    FROM Serves S1
    WHERE B1.name = S1.bar)
    EXCEPT
    (SELECT S2.beer
    FROM Serves S2
    WHERE B2.name = S2.bar)
)
AND EXISTS (
    (SELECT S2.beer
    FROM Serves S2
    WHERE B2.name = S2.bar)
    EXCEPT
    (SELECT S1.beer
    FROM Serves S1
    WHERE B1.name = S1.bar)
)