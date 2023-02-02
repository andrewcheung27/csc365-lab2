/* Author: Andrew Cheung */
/* Email: acheun29@calpoly.edu */


CREATE TABLE Band(
Id INT PRIMARY KEY,
Firstname VARCHAR(20),
Lastname VARCHAR(20),
UNIQUE(Firstname, Lastname)
);


CREATE TABLE Songs(
SongId INT PRIMARY KEY,
Title VARCHAR(50),
UNIQUE(Title)
);


CREATE TABLE Albums(
AId INT PRIMARY KEY,
Title VARCHAR(40),
YearReleased YEAR,
Label VARCHAR(30),
Type VARCHAR(10),
UNIQUE(Title)
);


CREATE TABLE Tracklists(
AlbumId INT,
AlbumPosition INT,
SongId INT,
PRIMARY KEY(AlbumId, SongId, AlbumPosition),
FOREIGN KEY(AlbumId) REFERENCES Albums(AId),
FOREIGN KEY(SongId) REFERENCES Songs(SongId)
);


CREATE TABLE Instruments(
SongId INT,
BandmateId INT,
Instrument VARCHAR(20),
PRIMARY KEY(SongId, BandmateId, Instrument),
FOREIGN KEY(SongId) REFERENCES Songs(SongId),
FOREIGN KEY(BandmateId) REFERENCES Band(Id)
);


CREATE TABLE Performance(
SongId INT,
Bandmate INT,
StagePosition VARCHAR(10),
PRIMARY KEY(SongId, Bandmate),
FOREIGN KEY(SongId) REFERENCES Songs(SongId),
FOREIGN KEY(Bandmate) REFERENCES Band(Id)
);


CREATE TABLE Vocals(
SongId INT,
Bandmate INT,
Type VARCHAR(10),
PRIMARY KEY(SongId, Bandmate, Type),
FOREIGN KEY(SongId) REFERENCES Songs(SongId),
FOREIGN KEY(Bandmate) REFERENCES Band(Id)
);
