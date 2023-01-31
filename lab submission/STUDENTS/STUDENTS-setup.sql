CREATE TABLE Teachers(
LastName VARCHAR(20),
FirstName VARCHAR(20),
Classroom INT PRIMARY KEY,
UNIQUE(FirstName, LastName)
);


CREATE TABLE List(
LastName VARCHAR(20),
FirstName VARCHAR(20),
Grade INT,
Classroom INT,
PRIMARY KEY(LastName, FirstName, Classroom),
FOREIGN KEY(Classroom) REFERENCES Teachers(Classroom)
);
