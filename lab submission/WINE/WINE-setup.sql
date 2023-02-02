/* Author: Andrew Cheung */
/* Email: acheun29@calpoly.edu */


CREATE TABLE Grapes(
ID INT,
Grape VARCHAR(30) PRIMARY KEY,
Color VARCHAR(10),
UNIQUE(ID)
);


CREATE TABLE Appellations(
Number INT,
Appellation VARCHAR(40),
County VARCHAR(20),
State VARCHAR(20),
Area VARCHAR(30),
isAVA VARCHAR(3),
PRIMARY KEY(Appellation, State),
UNIQUE(Number)
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
Cases INT,
FOREIGN KEY(Grape) REFERENCES Grapes(Grape),
FOREIGN KEY(Appellation) REFERENCES Appellations(Appellation),
UNIQUE(Winery, Appellation, Name, Grape, VintageYear)
);
