UPDATE Broker
SET ssn = (
    SELECT ssn
    FROM Owns
    ORDER BY ssn
    LIMIT 1
);