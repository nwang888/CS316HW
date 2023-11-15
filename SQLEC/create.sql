CREATE TABLE customers (
  CustomerID int NOT NULL,
  CustomerName varchar(50) DEFAULT NULL,
  ContractName varchar(20) DEFAULT NULL,
  Address varchar(80) DEFAULT NULL,
  City varchar(20) DEFAULT NULL,
  PostalCode varchar(10) DEFAULT NULL,
  Country varchar(20) DEFAULT NULL,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE employees (
  EmployeeID int NOT NULL,
  LastName varchar(40) DEFAULT NULL,
  FirstName varchar(20) DEFAULT NULL,
  BirthDate date DEFAULT NULL,
  Photo varchar(100) DEFAULT NULL,
  Notes varchar(500) DEFAULT NULL,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE shippers (
  ShipperID int NOT NULL,
  ShipperName varchar(30) DEFAULT NULL,
  Phone varchar(14) DEFAULT NULL,
  PRIMARY KEY (ShipperID)
);

CREATE TABLE suppliers (
  SupplierID int NOT NULL,
  SuppliersName varchar(80) DEFAULT NULL,
  ContactName varchar(30) DEFAULT NULL,
  Address varchar(80) DEFAULT NULL,
  City varchar(20) DEFAULT NULL,
  PostalCode varchar(10) DEFAULT NULL,
  Country varchar(20) DEFAULT NULL,
  Phone varchar(16) DEFAULT NULL,
  PRIMARY KEY (SupplierID)
);

CREATE TABLE categories (
  CategoryID int NOT NULL,
  CategoryName varchar(20) DEFAULT NULL,
  DescriptionText varchar(100) DEFAULT NULL,
  PRIMARY KEY (CategoryID)
);

CREATE TABLE products (
  ProductID int NOT NULL,
  ProductName varchar(80) DEFAULT NULL,
  SuppliersID int DEFAULT NULL,
  CategoryID int DEFAULT NULL,
  Unit varchar(50) DEFAULT NULL,
  Price float DEFAULT NULL,
  PRIMARY KEY (ProductID),
  FOREIGN KEY (CategoryID) REFERENCES categories (CategoryID),
  FOREIGN KEY (SuppliersID) REFERENCES suppliers (SupplierID)
);

CREATE TABLE orders (
  OrderID int NOT NULL,
  CustomerID int DEFAULT NULL,
  EmployeeID int DEFAULT NULL,
  OrderDate date DEFAULT NULL,
  ShipperID int DEFAULT NULL,
  PRIMARY KEY (OrderID),
  FOREIGN KEY (CustomerID) REFERENCES customers (CustomerID),
  FOREIGN KEY (EmployeeID) REFERENCES employees (EmployeeID),
  FOREIGN KEY (ShipperID) REFERENCES shippers (ShipperID)
);

CREATE TABLE ordersdetails (
  OrderDetailID int NOT NULL,
  OrderID int DEFAULT NULL,
  ProductID int DEFAULT NULL,
  Quantity smallint DEFAULT NULL,
  PRIMARY KEY (OrderDetailID),
  FOREIGN KEY (OrderID) REFERENCES orders (OrderID),
  FOREIGN KEY (ProductID) REFERENCES products (ProductID)
);
