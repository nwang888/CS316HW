INSERT INTO Trade (aid, seq, type, timestamp, sym, shares, price)
VALUES ((SELECT aid FROM Account ORDER BY aid LIMIT 1), 1, 'buy', '1900-11-11 11:11:11', '111', 1, 1);