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
