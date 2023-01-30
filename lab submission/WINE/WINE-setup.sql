CREATE TABLE Appellations(
Number INT,
Appellation VARCHAR(40) PRIMARY KEY,
County VARCHAR(20),
State VARCHAR(20),
Area VARCHAR(30),
isAVA VARCHAR(3),
UNIQUE(Number)
);


CREATE TABLE Grapes(
ID INT,
Grape VARCHAR(30) PRIMARY KEY,
Color VARCHAR(10),
UNIQUE(ID)
);


CREATE TABLE Wine(
Number INT PRIMARY KEY,
Grape VARCHAR(30),
Winery VARCHAR(40),
Appellation VARCHAR(40),
Name VARCHAR(60),
VintageYear	YEAR,
Price INT,
Score INT,
Cases INT
);


ALTER TABLE Wine
ADD FOREIGN KEY(Grape) REFERENCES Grapes(Grape),
ADD FOREIGN KEY(Appellation) REFERENCES Appellations(Appellation);
