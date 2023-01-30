CREATE TABLE Reservations(
Code INT PRIMARY KEY,
Room VARCHAR(3),
CheckIn DATE,
CheckOut DATE,
Rate DECIMAL(6, 2),
LastName VARCHAR(20),
FirstName VARCHAR(20),
Adults INT,
Kids INT
);


CREATE TABLE Rooms(
RoomId VARCHAR(3) PRIMARY KEY,
roomName VARCHAR(30),
beds INT,
bedType VARCHAR(10),
maxOccupancy INT,
basePrice INT,
decor VARCHAR(20)
);


ALTER TABLE Reservations
ADD FOREIGN KEY(Room) REFERENCES Rooms(RoomId);
