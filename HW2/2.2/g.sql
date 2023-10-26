UPDATE Owns
SET aid = (
    SELECT MAX(aid) + 1
    FROM Account
);