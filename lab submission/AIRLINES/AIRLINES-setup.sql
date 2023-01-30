CREATE TABLE Airlines(
Id INT PRIMARY KEY,
Airline VARCHAR(30),
Abbreviation VARCHAR(20),
Country VARCHAR(20)
);


CREATE TABLE Airports100(
City VARCHAR(30),
AirportCode CHAR(3) PRIMARY KEY,
AirportName VARCHAR(50),
Country VARCHAR(20),
CountryAbbrev VARCHAR(10)
);


CREATE TABLE Flights(
Airline INT,
FlightNo INT,
SourceAirport CHAR(3),
DestAirport CHAR(3),
PRIMARY KEY(Airline, FlightNo)
);


ALTER TABLE Flights
ADD FOREIGN KEY(Airline) REFERENCES Airlines(Id),
ADD FOREIGN KEY(SourceAirport) REFERENCES Airports100(AirportCode),
ADD FOREIGN KEY(DestAirport) REFERENCES Airports100(AirportCode);