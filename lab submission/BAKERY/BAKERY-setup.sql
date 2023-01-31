CREATE TABLE Goods(
Id VARCHAR(20) PRIMARY KEY,
Flavor VARCHAR(20),
Food VARCHAR(20),
Price DECIMAL(5, 2),
UNIQUE(Flavor, Food)
);


CREATE TABLE Customers(
Id INT PRIMARY KEY,
LastName VARCHAR(20),
FirstName VARCHAR(20)
);


CREATE TABLE Receipts(
ReceiptNumber INT PRIMARY KEY,
ReceiptDate DATE,
CustomerId INT,
FOREIGN KEY(CustomerId) REFERENCES Customers(Id)
);


CREATE TABLE Items(
Receipt INT,
Ordinal INT,
Item VARCHAR(20),
PRIMARY KEY(Item, Receipt, Ordinal),
FOREIGN KEY(Receipt) REFERENCES Receipts(ReceiptNumber),
FOREIGN KEY(Item) REFERENCES Goods(Id)
);
