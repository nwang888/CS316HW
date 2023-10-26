-- WITH MaxTimestampTrade AS (
--     SELECT aid, timestamp, sym
--     FROM Trade
--     ORDER BY timestamp DESC
--     LIMIT 1
-- ),
-- NextSequence AS (
--     SELECT MAX(seq)+1 AS next_seq
--     FROM Trade
--     WHERE aid = (SELECT aid FROM MaxTimestampTrade)
-- )
-- INSERT INTO Trade (aid, seq, type, timestamp, sym, shares, price)
-- VALUES (
--     (SELECT aid FROM MaxTimestampTrade),
--     (SELECT next_seq FROM NextSequence),
--     'sell',
--     (SELECT timestamp FROM MaxTimestampTrade),
--     (SELECT sym FROM MaxTimestampTrade),
--     (SELECT shares FROM Holds WHERE aid = (SELECT aid FROM MaxTimestampTrade) AND sym = (SELECT sym FROM MaxTimestampTrade)),
--     1
-- );

INSERT INTO Trade
VALUES(100, 1, 'sell', '2023-11-11 11:11:11', 'AAPL', 10000.00, 1);