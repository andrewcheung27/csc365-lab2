CREATE TABLE Campuses(
Id INT PRIMARY KEY,
Campus VARCHAR(60),
Location VARCHAR(20),
County VARCHAR(20),
YearOpened INT
);


CREATE TABLE CsuFees(
Campus INT,
AcademicYear YEAR,
CampusFee INT,
PRIMARY KEY(Campus, AcademicYear)
);


CREATE TABLE Degrees(
AcademicYear YEAR,
Campus INT,
Degrees INT,
PRIMARY KEY(Campus, AcademicYear)
);


CREATE TABLE DisciplineEnrollments(
Campus INT,
Discipline INT,
AcademicYear YEAR,
Undergraduate INT,
Graduate INT,
PRIMARY KEY(Campus, AcademicYear, Discipline)
);


CREATE TABLE Disciplines(
Id INT PRIMARY KEY,
Name VARCHAR(30)
);


CREATE TABLE Enrollments(
Campus INT,
AcademicYear YEAR,
TotalEnrollment_AY INT,
FTE_AY INT,
PRIMARY KEY(Campus, AcademicYear)
);


CREATE TABLE Faculty(
Campus INT,
AcademicYear YEAR,
Faculty DECIMAL(5, 1),
PRIMARY KEY(Campus, AcademicYear)
);


ALTER TABLE CsuFees
ADD FOREIGN KEY(Campus) REFERENCES Campuses(Id);


ALTER TABLE Degrees
ADD FOREIGN KEY(Campus) REFERENCES Campuses(Id);


ALTER TABLE DisciplineEnrollments
ADD FOREIGN KEY(Campus) REFERENCES Campuses(Id),
ADD FOREIGN KEY(Discipline) REFERENCES Disciplines(Id);


ALTER TABLE Enrollments
ADD FOREIGN KEY(Campus) REFERENCES Campuses(Id);


ALTER TABLE Faculty
ADD FOREIGN KEY(Campus) REFERENCES Campuses(Id);
