-- Some initial data to play with.  These INSERT statements should succeed.
-- Do NOT modify this section.

INSERT INTO Person VALUES
  (1001001000, 'Amy', '100 W. Main Street'),
  (2002002000, 'Ben', '101 W. Main Street'),
  (3003003000, 'Coy', '200 S. Duke Street'),
  (4004004000, 'Dan', '300 N. Duke Street'),
  (5005005000, 'Eve', '100 W. Main Street'),
  (6006006000, 'Flo', '160 9th Street'),
  (7007007000, 'Gus', '170 9th Street'),
  (8008008000, 'Haf', '810 Academy Road'),
  (9009009000, 'Ian', '920 Academy Road');

INSERT INTO Broker VALUES
  (2002002000, 'NC0002', '9191001002', 6006006000),
  (4004004000, 'NC0004', '9191001004', 6006006000),
  (6006006000, 'NC0006', '9191001006', 7007007000),
  (7007007000, 'NC0007', '9191001007', NULL),
  (9009009000, 'NC0009', '9191001009', 7007007000);

INSERT INTO Account VALUES
  (100, 4004004000),
  (300, 4004004000),
  (500, 6006006000),
  (800, 9009009000),
  (150, 6006006000),
  (138, 4004004000);

INSERT INTO Owns VALUES
  (1001001000, 100),
  (3003003000, 300),
  (5005005000, 500),
  (8008008000, 800),
  (1001001000, 150),
  (5005005000, 150),
  (1001001000, 138),
  (3003003000, 138),
  (8008008000, 138);

INSERT INTO Stock VALUES
  ('AAPL', 177.56),
  ('GOOGL', 135.26),
  ('XOM', 113.95);

INSERT INTO Trade VALUES
  (100, 1, 'buy', '2023-01-11 11:00:00', 'AAPL', 9.00, 132.92),
  (100, 2, 'sell', '2023-01-20 12:00:00', 'AAPL', 5.00, 137.28),
  (100, 3, 'buy', '2023-01-31 13:00:00', 'AAPL', 6.00, 143.68),

  (300, 1, 'buy', '2023-03-03 09:00:00', 'GOOGL', 3.33, 93.65),

  (500, 1, 'buy', '2023-05-01 11:00:00', 'XOM', 200.00, 112.76),
  (500, 2, 'sell', '2023-05-02 12:00:00', 'XOM', 150.00, 108.27),

  (800, 1, 'buy', '2003-01-18 11:00:00', 'GOOGL', 8.00, 91.12),
  (800, 2, 'buy', '2023-08-18 12:00:00', 'XOM', 800.00, 110.04),

  (150, 1, 'buy', '2023-05-01 12:01:00', 'AAPL', 5.00, 169.13),
  (150, 2, 'sell', '2023-05-02 12:02:00', 'AAPL', 1.00, 168.08),
  (150, 3, 'buy', '2023-05-03 12:03:00', 'GOOGL', 15.00, 105.41),

  (138, 1, 'buy', '2023-03-08 12:01:00', 'AAPL', 100.00, 179.32),
  (138, 2, 'buy', '2023-03-08 12:02:00', 'GOOGL', 3.00, 94.25),
  (138, 3, 'buy', '2023-03-08 12:03:00', 'XOM', 100.00, 108.15),
  (138, 4, 'sell', '2023-08-08 12:04:00', 'XOM', 20.00, 106.85);
