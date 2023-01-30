CREATE TABLE Customers(
Id INT PRIMARY KEY,
LastName VARCHAR(20),
FirstName VARCHAR(20)
);


CREATE TABLE Goods(
Id VARCHAR(128) PRIMARY KEY,
Flavor VARCHAR(20),
Food VARCHAR(20),
Price DECIMAL(5, 2)
);


CREATE TABLE Items(
Receipt INT,
Ordinal INT,
Item VARCHAR(20),
PRIMARY KEY(Item, Receipt, Ordinal)
);


CREATE TABLE Receipts(
ReceiptNumber INT PRIMARY KEY,
ReceiptDate DATE,
CustomerId INT NOT NULL
);


ALTER TABLE Items
ADD FOREIGN KEY(Receipt) REFERENCES Receipts(ReceiptNumber),
ADD FOREIGN KEY(Item) REFERENCES Goods(Id);


ALTER TABLE Receipts
ADD FOREIGN KEY(CustomerId) REFERENCES Customers(Id);
