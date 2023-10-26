DELETE FROM Broker
WHERE ssn IN (
    SELECT manager
    FROM Broker
    WHERE manager IS NOT NULL
    LIMIT 1
);