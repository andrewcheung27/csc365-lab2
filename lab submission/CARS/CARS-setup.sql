CREATE TABLE Continents(
ContId INT PRIMARY KEY,
Continent VARCHAR(20),
UNIQUE(Continent)
);


CREATE TABLE Countries(
CountryId INT PRIMARY KEY,
CountryName VARCHAR(20),
Continent INT,
FOREIGN KEY(Continent) REFERENCES Continents(ContId),
UNIQUE(CountryName, Continent)
);


CREATE TABLE CarMakers(
Id INT PRIMARY KEY,
Maker VARCHAR(20),
FullName VARCHAR(30),
Country INT,
FOREIGN KEY(Country) REFERENCES Countries(CountryId)
);


CREATE TABLE ModelList(
ModelId INT PRIMARY KEY,
Maker INT,
Model VARCHAR(20),
FOREIGN KEY(Maker) REFERENCES CarMakers(Id),
UNIQUE(Model)
);


CREATE TABLE CarNames(
Id INT PRIMARY KEY,
Model VARCHAR(20),
Make VARCHAR(40),
FOREIGN KEY(Model) REFERENCES ModelList(Model)
);


CREATE TABLE CarsData(
Id INT PRIMARY KEY,
MPG INT,
Cylinders INT,
Edispl INT,
Horsepower INT,
Weight INT,
Accelerate DECIMAL(4, 1),
CarYear YEAR,
FOREIGN KEY(Id) REFERENCES CarNames(Id)
);
