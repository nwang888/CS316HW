SELECT frequents.bar, frequents.drinker
FROM frequents
WHERE NOT EXISTS (
    SELECT serves.bar, likes.drinker
    FROM likes, serves
    WHERE likes.drinker = frequents.drinker AND serves.bar = frequents.bar AND likes.beer = serves.beer
)