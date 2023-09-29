SELECT DISTINCT likes.drinker
FROM frequents, likes
WHERE bar IN (
  SELECT bar
  FROM serves
  WHERE beer = 'Budweiser'
)
AND frequents.drinker = likes.drinker
AND 
likes.drinker NOT IN (
    SELECT l.drinker
    FROM likes as l
    WHERE beer = 'Budweiser'
)