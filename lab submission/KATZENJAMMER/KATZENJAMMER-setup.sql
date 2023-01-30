CREATE TABLE Albums(
AId INT PRIMARY KEY,
Title VARCHAR(40),
YearReleased YEAR,
Label VARCHAR(30),
Type VARCHAR(10)
);


CREATE TABLE Band(
Id INT PRIMARY KEY,
Firstname VARCHAR(20),
Lastname VARCHAR(20)
);


CREATE TABLE Instruments(
SongId INT,
BandmateId INT,
Instrument VARCHAR(20),
PRIMARY KEY(SongId, BandmateId, Instrument)
);


CREATE TABLE Performance(
SongId INT,
Bandmate INT,
StagePosition VARCHAR(10),
PRIMARY KEY(SongId, Bandmate)
);


CREATE TABLE Songs(
SongId INT PRIMARY KEY,
Title VARCHAR(50)
);


CREATE TABLE Tracklists(
AlbumId INT,
AlbumPosition INT,
SongId INT,
PRIMARY KEY(AlbumId, SongId)
);


CREATE TABLE Vocals(
SongId INT,
Bandmate INT,
Type VARCHAR(10),
PRIMARY KEY(SongId, Bandmate, Type)
);


ALTER TABLE Instruments
ADD FOREIGN KEY(SongId) REFERENCES Songs(SongId),
ADD FOREIGN KEY(BandmateId) REFERENCES Band(Id);


ALTER TABLE Performance
ADD FOREIGN KEY(SongId) REFERENCES Songs(SongId),
ADD FOREIGN KEY(Bandmate) REFERENCES Band(Id);


ALTER TABLE Tracklists
ADD FOREIGN KEY(AlbumId) REFERENCES Albums(AId),
ADD FOREIGN KEY(SongId) REFERENCES Songs(SongId);


ALTER TABLE Vocals
ADD FOREIGN KEY(SongId) REFERENCES Songs(SongId),
ADD FOREIGN KEY(Bandmate) REFERENCES Band(Id);
