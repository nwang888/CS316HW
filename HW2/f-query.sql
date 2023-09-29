SELECT drinker
FROM likes
GROUP BY drinker
HAVING COUNT(*) >= 5