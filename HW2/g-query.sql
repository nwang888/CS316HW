SELECT F.bar, F.drinker
FROM Frequents F
JOIN (
    SELECT bar, MAX(times_a_week) AS max_times
    FROM Frequents
    GROUP BY bar
) AS F_Max
ON F.bar = F_Max.bar AND F.times_a_week = F_Max.max_times
WHERE F.bar IN (
    SELECT Serves.bar
    FROM Serves
    WHERE Serves.beer = 'Corona'
)