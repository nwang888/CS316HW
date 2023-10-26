----------------------------------------------------------------------
-- (a) & (b) Modify the CREATE TABLE statements as needed to add
-- constraints.  Do not otherwise change the column names or types.

CREATE TABLE Person
(ssn DECIMAL(10,0) NOT NULL,
 name VARCHAR(256) NOT NULL,
 address VARCHAR(256) NOT NULL,
 PRIMARY KEY (ssn));

CREATE TABLE Broker
(ssn DECIMAL(10,0) NOT NULL,
 license VARCHAR(20) NOT NULL,
 phone DECIMAL(10,0) NOT NULL,
 manager DECIMAL(10,0),
 PRIMARY KEY (ssn),
 FOREIGN KEY (ssn) REFERENCES Person(ssn),
 FOREIGN KEY (manager) REFERENCES Broker(ssn));

CREATE TABLE Account
(aid INTEGER NOT NULL,
 brokerssn DECIMAL(10,0) NOT NULL,
 PRIMARY KEY (aid),
 FOREIGN KEY (brokerssn) REFERENCES Broker(ssn));

CREATE TABLE Owns
(ssn DECIMAL(10,0) NOT NULL,
 aid INTEGER NOT NULL,
 FOREIGN KEY (aid) REFERENCES Account(aid),
 FOREIGN KEY (ssn) REFERENCES Person(ssn));

-- CREATE TABLE Owns
-- (ssn DECIMAL(10,0) NOT NULL,
--  aid INTEGER NOT NULL,
--  FOREIGN KEY (aid) REFERENCES Account(aid));

CREATE TABLE Stock
(sym CHAR(5) NOT NULL,
 price DECIMAL(10,2) NOT NULL,
 PRIMARY KEY (sym));

CREATE TABLE Trade
(aid INTEGER NOT NULL,
 seq INTEGER NOT NULL,
 type CHAR(4) NOT NULL CHECK (type IN ('buy', 'sell')),
 timestamp TIMESTAMP NOT NULL,
 sym CHAR(5) NOT NULL,
 shares DECIMAL(10,2) NOT NULL,
 price DECIMAL(10,2) NOT NULL,
 
 PRIMARY KEY (aid, seq),
 FOREIGN KEY (sym) REFERENCES Stock(sym),
 FOREIGN KEY (aid) REFERENCES Account(aid));

----------------------------------------------------------------------
-- (c) There is no room for mistakes at PITS. Since PITS records only
-- completed trades, enforce that the Trade table is append-only
-- (i.e., no DELETE or UPDATE is allowed) using a trigger. Further
-- enforce that within each account, trades must be recorded
-- sequentially over time: i.e., compared with old trades in the same
-- account, a new trade must have a seq that is strictly larger, and a
-- timestamp that is no less than the old values.

CREATE FUNCTION TF_TradeSeqAppendOnly() RETURNS TRIGGER AS $$
BEGIN
  -- YOUR IMPLEMENTATION GOES HERE >>>
  -- Do not modify the CREATE TRIGGER statement that follows.
  IF TG_OP = 'UPDATE' OR TG_OP = 'DELETE' THEN
    RAISE EXCEPTION 'This table is append-only';
  END IF;

  IF EXISTS (
      SELECT 1
      FROM Trade
      WHERE aid = NEW.aid AND Trade.timestamp > NEW.timestamp
  ) OR EXISTS (
      SELECT 1
      FROM Trade
      WHERE aid = NEW.aid AND Trade.seq > NEW.seq
  ) THEN
    RAISE EXCEPTION 'New trade does not have a greater timestamp or sequence than old trades';
  END IF;
  RETURN NEW;
  -- <<< YOUR IMPLEMENTATION ENDS HERE
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TG_TradeSeqAppendOnly
  BEFORE INSERT OR UPDATE OR DELETE ON Trade
  FOR EACH ROW
  EXECUTE PROCEDURE TF_TradeSeqAppendOnly();

----------------------------------------------------------------------
-- (d) Using triggers, enforce that brokers cannot own accounts,
-- either by themselves or jointly with others.

CREATE FUNCTION TF_BrokerNotAccountOwner() RETURNS TRIGGER AS $$
BEGIN
  -- YOUR IMPLEMENTATION GOES HERE >>>
  -- Do not modify the CREATE TRIGGER statements that follow.
  -- Check if Owns has an ssn that also exists in Broker
  -- IF EXISTS (
  --   SELECT 1
  --   FROM (((SELECT Owns.ssn FROM Owns) INTERSECT (SELECT Broker.ssn FROM Broker)) AS Overlap)
  -- ) THEN
  --   RAISE EXCEPTION 'Broker cannot own an account';
  -- END IF;

  IF TG_TABLE_NAME = 'broker' AND EXISTS (
      SELECT 1
      FROM Owns
      WHERE Owns.ssn = New.ssn
    ) THEN
      RAISE EXCEPTION 'Broker cannot own an account';
  END IF;

  IF TG_TABLE_NAME = 'owns' AND EXISTS (
      SELECT 1
      FROM Broker
      WHERE Broker.ssn = New.ssn
    ) THEN
      RAISE EXCEPTION 'Account Owner cannot be Broker';
  END IF;

  -- IF EXISTS (
  --   SELECT 1
  --   FROM Owns, Broker 
  --   WHERE Owns.aid = NEW.aid AND Owns.ssn = Broker.ssn
  -- ) THEN
  --   RAISE EXCEPTION 'Brokers cannot own accounts';
  -- END IF;

  RETURN NEW;
  -- <<< YOUR IMPLEMENTATION ENDS HERE
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TG_BrokerNotAccountOwner_Broker
  BEFORE INSERT OR UPDATE OF ssn ON Broker
  -- note that DELETE won't cause a violation
  FOR EACH ROW
  EXECUTE PROCEDURE TF_BrokerNotAccountOwner();

CREATE TRIGGER TG_BrokerNotAccountOwner_Owns
  BEFORE INSERT OR UPDATE OF ssn ON Owns
  -- note that DELETE won't cause a violation
  FOR EACH ROW
  EXECUTE PROCEDURE TF_BrokerNotAccountOwner();

----------------------------------------------------------------------
-- (e) Define a view Holds (aid, sym, amount) that returns the current
-- account holdings, computed from the Trade table. You may assume
-- that all accounts start with holding nothing and all transactions
-- are recorded in Trade.

CREATE VIEW Holds(aid, sym, shares) AS
  -- YOUR IMPLEMENTATION GOES HERE >>>
  -- Do not modify the CREATE FUNCTION and TRIGGER statements that follow.
  -- Stub implementation (incorrect):
  SELECT aid, sym, SUM(
        CASE
            WHEN Trade.type = 'buy' THEN Trade.shares
            ELSE -Trade.shares
        END
    ) AS amount
  FROM Trade
  GROUP BY aid, sym;
  -- <<< YOUR IMPLEMENTATION ENDS HERE

CREATE FUNCTION TF_NoOverSell() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.type = 'sell' AND
     NEW.shares > COALESCE((SELECT shares FROM Holds WHERE aid = NEW.aid AND sym = NEW.sym), 0) THEN
    RAISE EXCEPTION 'cannot sell more than the number of % shares currently held',
                    NEW.sym;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TG_NoOverSell
  BEFORE INSERT ON Trade
  FOR EACH ROW
  EXECUTE PROCEDURE TF_NoOverSell();
