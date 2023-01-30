CREATE TABLE List(
LastName VARCHAR(20),
FirstName VARCHAR(20),
Grade INT,
Classroom INT,
PRIMARY KEY(LastName, FirstName, Classroom)
);


CREATE TABLE Teachers(
LastName VARCHAR(20),
FirstName VARCHAR(20),
Classroom INT PRIMARY KEY
);


ALTER TABLE List
ADD FOREIGN KEY(Classroom) REFERENCES Teachers(Classroom);
