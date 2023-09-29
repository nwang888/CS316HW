SELECT Beer.name
FROM Beer
WHERE NOT EXISTS (
    SELECT Serves.bar
    FROM Serves
    WHERE Serves.beer = Beer.name AND NOT EXISTS (
        SELECT Likes.drinker
        FROM Likes, Frequents
        WHERE  Likes.drinker = Frequents.drinker AND Likes.beer = Serves.beer AND Frequents.bar = Serves.bar
    )
)