SELECT drinker AS name,
  address
FROM Drinker
  INNER JOIN (
    SELECT drinker
    FROM Likes
    WHERE beer IN ('Dixie', 'Corona')
  ) ON Likes.drinker = Drinker.name