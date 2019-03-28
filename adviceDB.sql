CREATE DATABASE adviceDB;
USE adviceDB;
CREATE TABLE Person (
Username varchar(20) NOT NULL,
PName varchar(100),
Graduation_Date date,
Contact_Info varchar(1000),
FAS_Val ENUM('Faculty','Alumni','Student'),
PRIMARY KEY (Username)
);
CREATE TABLE Person_MajorField(
Major_Field varchar(100) NOT NULL,
Username varchar(100) NOT NULL,
FOREIGN KEY (Username) REFERENCES Person(Username),
PRIMARY KEY(Major_Field,Username)
);
CREATE TABLE Club(
Club_Name varchar(100) NOT NULL,
Site_link varchar(1000),
PRIMARY KEY (Club_Name)
);
CREATE TABLE Club_Person(
Club_Name varchar(100) NOT NULL,
Username varchar(20) NOT NULL,
FOREIGN KEY (Club_Name) REFERENCES Club(Club_Name),
FOREIGN KEY (Username) REFERENCES Person(Username),
PRIMARY KEY (Club_Name,Username)
);
CREATE TABLE School(
School_Name varchar(100) NOT NULL,
Address varchar(100) NOT NULL,
Accreditation_Val ENUM('1','2'),
Enrollment_Val ENUM('small','medium','large'),
PRIMARY KEY(School_Name)
);
CREATE TABLE School_Person(
School_Name varchar(100) NOT NULL,
Username varchar(20) NOT NULL,
Degree_Val ENUM('Biology','Computer Science','Math'),
Start_Date date NOT NULL,
End_Date date,
FOREIGN KEY(School_Name) REFERENCES School(School_Name),
FOREIGN KEY(Username) REFERENCES Person(Username),
PRIMARY KEY(School_Name,Username)
);
CREATE TABLE Advice(
Advice_ID int(12) NOT NULL,
Advice text,
Username varchar(20) NOT NULL,
FOREIGN KEY (Username) REFERENCES Person(Username),
PRIMARY KEY	(Advice_ID,Username)
);
CREATE TABLE Advice_Keyword(
Advice_ID int(15) NOT NULL,
Keyword ENUM('Career Builder','linkedin') NOT NULL,
FOREIGN KEY(Advice_ID) REFERENCES Advice(Advice_ID),
PRIMARY KEY(Advice_ID,Keyword)
);
CREATE TABLE Resources(
Resources varchar(100) NOT NULL,
Advice_ID int(12),
FOREIGN KEY(Advice_ID) REFERENCES Advice(Advice_ID),
PRIMARY KEY(Resources,Advice_ID)
);
