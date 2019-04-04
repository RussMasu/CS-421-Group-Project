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

INSERT INTO Job_Person(Job_ID, Username, Start_Date, End_Date)
VALUES(000001,'ZacP',2005-03-01, 2007-05-30);
INSERT INTO Job_Person(Job_ID, Username, Start_Date, End_Date)
VALUES(000002,'ZacP',2007-06-01, NULL);
INSERT INTO Job_Person(Job_ID, Username, Start_Date, End_Date)
VALUES(000003,'RRandal',2006-08-25, NULL);
INSERT INTO Job_Person(Job_ID, Username, Start_Date, End_Date)
VALUES(000004,'Tilly Burton',2018-09-01, NULL);
INSERT INTO Job_Person(Job_ID, Username, Start_Date, End_Date)
VALUES(000005,'Shaelaw',2014-01-15, NULL);
INSERT INTO Job_Person(Job_ID, Username, Start_Date, End_Date)
VALUES(000006,'Sven47',2009-07-23, NULL);

INSERT INTO Job(Job_ID,Job_Title,Pay,Salaried,Interview Process, Benefits)
VALUES(000001,'Software Engineer',60000,1,NULL,'Medical and Dental');
INSERT INTO Job(Job_ID,Job_Title,Pay,Salaried,Interview Process, Benefits)
VALUES(000002,'Senior Software Engineer',70000,1,'Standard web application, then phone interviews, then in-person interviews','Medical and Dental');
INSERT INTO Job(Job_ID,Job_Title,Pay,Salaried,Interview Process, Benefits)
VALUES(000003,'Mechanical Engineer',84000,1,'In-person interview, need knowledge of CAD','Medical');
INSERT INTO Job(Job_ID,Job_Title,Pay,Salaried,Interview Process, Benefits)
VALUES(000004,'Waiter',13.25,0,NULL,NULL);
INSERT INTO Job(Job_ID,Job_Title,Pay,Salaried,Interview Process, Benefits)
VALUES(000005,'Research and Development Department Manager',120000,1,NULL,'Medical and Dental');
INSERT INTO Job(Job_ID,Job_Title,Pay,Salaried,Interview Process, Benefits)
VALUES(000006,'CEO',400000,1,'Promoted internally','Medical and Dental');

INSERT INTO Company_Job(Company Name,Job_ID)
VALUES('Jane Marr Studios Programming Solutions',000001);
INSERT INTO Company_Job(Company Name,Job_ID)
VALUES('Jane Marr Studios Programming Solutions',000002);
INSERT INTO Company_Job(Company Name,Job_ID)
VALUES('Boeing Commercial Airplanes',000003);
INSERT INTO Company_Job(Company Name,Job_ID)
VALUES('Southside Bar and Grill',000004);
INSERT INTO Company_Job(Company Name,Job_ID)
VALUES('Conagra Fooods',000005);
INSERT INTO Company_Job(Company Name,Job_ID)
VALUES('New Day Supplementals',000006);

INSERT INTO Company(Company_Name, Num_Emp, Address)
VALUES('Jane Marr Studios Programming Solutions', 15, '1205 Kinoole Street, Hilo, HI 96720');
INSERT INTO Company(Company_Name, Num_Emp, Address)
VALUES('Boeing Commercial Airplanes', 40000, 'P. O. Box 3707 Seattle, Washington 98124');
INSERT INTO Company(Company_Name, Num_Emp, Address)
VALUES('Southside Bar and Grill', 42, '16th Place, 22 Street, Smallville, Kentucky 94182');
INSERT INTO Company(Company_Name, Num_Emp, Address)
VALUES('Conagra Foods', 400000, 'Conagra Brands 222 W. Merchandise Mart Plaza Suite 1300 Chicago, IL 60654');
INSERT INTO Company(Company_Name, Num_Emp, Address)
VALUES('New Day Supplementals', 500, '66 Orden Ave, Cheyenne, Wyoming 30742');

INSERT INTO Company_Industry(Company_Name, Industry)
VALUES('Jane Marr Studios Programming Solutions', 'Consumer Services');
INSERT INTO Company_Industry(Company_Name, Industry)
VALUES('Boeing Commercial Airplanes', 'Transporation');
INSERT INTO Company_Industry(Company_Name, Industry)
VALUES('Boeing Commercial Airplanes', 'Technology');
INSERT INTO Company_Industry(Company_Name, Industry)
VALUES('Southside Bar and Grill', 'Consumer Services');
INSERT INTO Company_Industry(Company_Name, Industry)
VALUES('Conagra Foods', 'Consumer Non-Durables');
INSERT INTO Company_Industry(Company_Name, Industry)
VALUES('New Day Supplementals', 'Consumer Non-Durables');
