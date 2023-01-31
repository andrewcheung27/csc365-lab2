CREATE TABLE Marathon(
Place INT PRIMARY KEY,
MarathonTime TIME,
Pace TIME,
GroupPlace INT,
MarathonGroup VARCHAR(10),
Age INT,
Sex CHAR(1),
BIBNumber INT,
FirstName VARCHAR(20),
LastName VARCHAR(20),
Town VARCHAR(20),
State CHAR(2),
UNIQUE(MarathonGroup, Sex, GroupPlace)
);
