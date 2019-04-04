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
PRIMARY KEY (Job_ID, Username, Start_Date),
FOREIGN KEY (Job_ID) REFERENCES Job(Job_ID),
FOREIGN KEY (Username) REFERENCES Person(Username)
);
CREATE TABLE Company(
Company_Name varchar(20) NOT NULL,
Num_Emp TINYINT,
Address varchar(40) NOT NULL,
PRIMARY KEY (Company_Name)
);
CREATE TABLE Company_Job(
Company_Name varchar(20) NOT NULL,
Job_ID TINYINT NOT NULL,
PRIMARY KEY (Company_Name, Job_ID),
FOREIGN KEY (Company_Name) REFERENCES Company(Company_Name)
FOREIGN KEY (Job_ID) REFERENCES Job(Job_ID)
);
CREATE TABLE Company_Industry(
Company_Name varchar(20) NOT NULL,
Industry_ID ENUM('Small', 'Medium', 'Large') NOT NULL,
PRIMARY KEY (Company_Name, Industry_ID),
FOREIGN KEY (Company_Name) REFERENCES Company(Company_Name)
);


INSERT INTO Job(Job_ID,Job_Title,Pay,Salaried,Interview Process, Benefits)
VALUES(000001,'Software Engineer',60000,1,NULL,'Medical and Dental');
INSERT INTO Job(Job_ID,Job_Title,Pay,Salaried,Interview Process, Benefits)
VALUES(000002,'Software Engineer',70000,1,'Standard web application, then phone interviews, then in-person interviews','Medical and Dental');
INSERT INTO Job(Job_ID,Job_Title,Pay,Salaried,Interview Process, Benefits)
VALUES(000003,'Mechanical Engineer',84000,1,'In-person interview, need knowledge of CAD','Medical');
INSERT INTO Job(Job_ID,Job_Title,Pay,Salaried,Interview Process, Benefits)
VALUES(000004,'Waiter',13.25,0,NULL,NULL);
INSERT INTO Job(Job_ID,Job_Title,Pay,Salaried,Interview Process, Benefits)
VALUES(000005,'Research and Development Department Manager',120000,1,NULL,'Medical and Dental');
INSERT INTO Job(Job_ID,Job_Title,Pay,Salaried,Interview Process, Benefits)
VALUES(000006,'CEO',400000,1,'Promoted internally','Medical and Dental');
