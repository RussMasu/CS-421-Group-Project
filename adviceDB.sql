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
Major_Field varchar(100),
Username varchar(100),
FOREIGN KEY (Username) REFERENCES Person(Username)
);
CREATE TABLE Club(
Club_Name varchar(100) NOT NULL,
Site_link varchar(1000),
PRIMARY KEY (Club_Name)
)
CREATE TABLE Club_Person(
Club_Name varchar(100) NOT NULL,
Username varchar(20) NOT NULL,
FOREIGN KEY (Club_Name) REFERENCES Club(Club_Name),
FOREIGN KEY (Username) REFERENCES Person(Username),
PRIMARY KEY (Club_Name,Username)
)
