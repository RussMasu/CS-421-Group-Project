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
Enrollment_Val ENUM('small','medium','large'),
PRIMARY KEY(School_Name)
);
CREATE TABLE School_Person(
School_Name varchar(100) NOT NULL,
Username varchar(20) NOT NULL,
Start_Date date NOT NULL,
End_Date date,
FOREIGN KEY(School_Name) REFERENCES School(School_Name),
FOREIGN KEY(Username) REFERENCES Person(Username),
PRIMARY KEY(School_Name,Username)
);
CREATE TABLE SchoolPerson_Degree(
School_Name varchar(100) NOT NULL,
Username varchar(20) NOT NULL,
Degree varchar(40) NOT NULL,
FOREIGN KEY(School_Name) REFERENCES School(School_Name),
FOREIGN KEY(Username) REFERENCES Person(Username),
PRIMARY KEY(School_Name,Username,Degree)
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
Keyword ENUM('Intetview','Career Advice','Personal Life','Undergrad','Postgrad') NOT NULL,
FOREIGN KEY(Advice_ID) REFERENCES Advice(Advice_ID),
PRIMARY KEY(Advice_ID,Keyword)
);
CREATE TABLE Job(
Job_ID TINYINT NOT NULL,
Job_Title varchar(100) NOT NULL,
Pay DECIMAL(11,2),
Salaried Boolean,
Interview_Process varchar(10000),
Benefits varchar(1000),
PRIMARY KEY (Job_ID)
);
CREATE TABLE Job_Person(
Job_ID TINYINT NOT NULL,
Username varchar(20) NOT NULL,
Start_Date date NOT NULL,
End_Date date,
PRIMARY KEY (Job_ID, Username),
FOREIGN KEY (Job_ID) REFERENCES Job(Job_ID),
FOREIGN KEY (Username) REFERENCES Person(Username)
);
CREATE TABLE Company(
Company_Name varchar(100) NOT NULL,
Num_Emp TINYINT,
Address varchar(40) NOT NULL,
PRIMARY KEY (Company_Name)
);
CREATE TABLE Company_Job(
Company_Name varchar(100) NOT NULL,
Job_ID TINYINT NOT NULL,
FOREIGN KEY (Company_Name) REFERENCES Company(Company_Name),
FOREIGN KEY (Job_ID) REFERENCES Job(Job_ID),
PRIMARY KEY (Company_Name, Job_ID)
);
CREATE TABLE Company_Industry(
Company_Name varchar(20) NOT NULL,
Industry ENUM('Basic Industries','Capital Goods','Consumer Durables',
'Consumer Non-Durables','Consumer Services','Energy','Finance',
'Healthcare','Public Utilities','Technology', 'Transporation',
'Miscellaenous') NOT NULL,
FOREIGN KEY (Company_Name) REFERENCES Company(Company_Name),
PRIMARY KEY (Company_Name, Industry)
);
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('ZacP','Zac_Perry','Student','2020-05-01','zacp@fakemail.com, 555 Urban Heights, HI');
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('SpinyPhish','Kayla Matthews','Student','2021-05-01','kaybay@fakemail.com');
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('MrX',NULL,NULL,NULL,NULL);
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('Tilly Burton','Tilly Burton','Student',NULL,'555-465-7125, 55 Rainbow Street, Up Town, HI, TBurton@uni.edu');
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('rbot15',NULL,'Student','2022-04-30',NULL);
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('Zotius Helle','Zotius Helle','Alumni','1950-06-10','zohelle@fakemail.com');
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('Sven47','Sven Asketilll','Alumni','1975-06-21',NULL);
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('Shannon Lawsons','Shaelaw','Alumni',NULL,'shal@fmail.com');
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('Madaline W W',NULL,'Alumni',NULL,NULL);
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('Paprika','Bella Asketill',NULL,NULL,'basket@fmail.com, 555 Hilo Bay, Hilo HI 96720');
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('MrGreen','Rajnish Green','Faculty','1960-12-25','mrg@uni.edu University of Hawaii at Hilo');
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('RRandal','Ray Randall','Faculty',NULL,NULL);
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('Myron R','Myron Reducto','Faculty','1992-04-02',NULL);
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('Kaya G',NULL,'Faculty','2010-03-12',NULL);
INSERT INTO Person(Username,Pname,FAS_VAl,Graduation_Date,Contact_Info)
VALUES('Lane Burton','Lane N. Burton','Faculty','2020-03-02','555-465-7125, 55 Rainbow Street, Up Town, HI, Burton@uni.edu');
INSERT INTO Person_MajorField(Major_Field,Username)
VALUES('Computer Science','ZacP');
INSERT INTO Person_MajorField(Major_Field,Username)
VALUES('Physics','rbot15');
INSERT INTO Person_MajorField(Major_Field,Username)
VALUES('Computer Science','SpinyPhish');
INSERT INTO Person_MajorField(Major_Field,Username)
VALUES('Psysics','SpinyPhish');
INSERT INTO Person_MajorField(Major_Field,Username)
VALUES('Psysics','RRandal');
INSERT INTO Person_MajorField(Major_Field,Username)
VALUES('Computer Science','Lane Burton');
INSERT INTO Person_MajorField(Major_Field,Username)
VALUES('Computer Science','Sven47');
INSERT INTO Person_MajorField(Major_Field,Username)
VALUES('Computer Science','Shannon Lawsons');
INSERT INTO Person_MajorField(Major_Field,Username)
VALUES('Biology','Shannon Lawsons');
