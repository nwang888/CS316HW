SELECT name, address
FROM drinker
WHERE drinker.name IN (
  (SELECT drinker
  FROM likes
  WHERE beer = 'Dixie')
  INTERSECT
  (SELECT drinker
  FROM likes
  WHERE beer = 'Corona')
)