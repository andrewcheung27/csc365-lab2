CREATE TABLE CarMakers(
Id INT PRIMARY KEY,
Maker VARCHAR(20),
FullName VARCHAR(30),
Country INT
);


CREATE TABLE CarNames(
Id INT PRIMARY KEY,
Model VARCHAR(20),
Make VARCHAR(40)
);


CREATE TABLE CarsData(
Id INT PRIMARY KEY,
MPG INT,
Cylinders INT,
Edispl INT,
Horsepower INT,
Weight INT,
Accelerate DECIMAL(4, 1),
CarYear YEAR
);


CREATE TABLE Continents(
ContId INT PRIMARY KEY,
Continent VARCHAR(20)
);


CREATE TABLE Countries(
CountryId INT PRIMARY KEY,
CountryName VARCHAR(20),
Continent INT
);


CREATE TABLE ModelList(
ModelId INT PRIMARY KEY,
Maker INT,
Model VARCHAR(20),
UNIQUE(Model)
);


ALTER TABLE CarMakers
ADD FOREIGN KEY(Country) REFERENCES Countries(CountryId);


ALTER TABLE CarNames
ADD FOREIGN KEY(Model) REFERENCES ModelList(Model);


ALTER TABLE CarsData
ADD FOREIGN KEY(Id) REFERENCES CarNames(Id);


ALTER TABLE Countries
ADD FOREIGN KEY(Continent) REFERENCES Continents(ContId);


ALTER TABLE ModelList
ADD FOREIGN KEY(Maker) REFERENCES CarMakers(Id);
