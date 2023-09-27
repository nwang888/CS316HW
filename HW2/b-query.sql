SELECT drinker AS name,
  address
FROM Frequents
  INNER JOIN drinker ON Frequents.drinker = drinker.name
WHERE times_a_week = 2
  AND bar = 'Down Under Pub'