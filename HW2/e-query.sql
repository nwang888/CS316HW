SELECT drinker
FROM frequents
WHERE bar IN (
  SELECT bar
  FROM serves
  WHERE beer = 'Budweiser'
)
INTERSECT
SELECT drinker
FROM likes
WHERE drinker NOT IN (
    SELECT drinker
    FROM likes
    WHERE beer = 'Budweiser'
)