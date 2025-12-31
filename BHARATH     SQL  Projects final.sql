-- create the database --
create database hospitalmanagmentsystem;
-- use the database --
use hospitalmanagmentsystem ;
-- create the table --
create table doctor(
employeeid varchar(10) not null,
Name varchar(150) not null,
position VARCHAR(150) not null
);  
insert into doctor values
(1,'Dr.bhuvan Dorian','Staff Internist'),
(2,'Dr.Elliot Reid','Attending Physician'),
(3,'Dr.Christopher Turk','Surgical Attending Physician'),
(4,'Dr.Percival Cox','Senior Attending Physician'),
(5,'Dr.Bob Kelso','Head Chief of pulmonology'),
(6,'Dr.Todd Quinlan','Surgical Attending Physician'),
(7,'Dr.John Wen','Surgical Attending Physician'),
(8,'Dr.Keith Dudemeister','Resident'),
(9,'Dr.Molly Clock','Attending Psychiatrist'),
(10,'Dr.Imani Harper','Senior Attending Nephrologist');
select * from doctor;

create table department(
department_id varchar(100) not null ,
dept_name varchar(150) not null,
head int not null
);
Insert into department values
(1,'General Medicine',4),
(2,'Surgery',7),
(3,'Psychiatry',9),
(4,'Cardiology',13),
(5,'Nephrology',10),
(6,'Urology',35),
(7,'Neurology',30),
(8,'Physiotherapy',27),
(9,'ENT',15),
(10,'Pulmonology',5);
select*from department;

create table Nurse(
nurse_id varchar(100) not null  ,
Name varchar(150) not null,
position varchar(150) not null,
registered varchar(10) not null
);

insert into Nurse values 
(1,'Carla Espinosa','Head Nurse','Yes'),
(2,'Laverne Roberts','Nurse','Yes'),
(3,'Paul Flowers','Nurse','No'),
(4,'Anna Rubel','Team Leader','No'),
(5,'Teresa Buttler','Sister Ir','Yes'),
(6,'Katthie Mathews','Nurse','Yes'),
(7,'Rose Hughes','Head Nurse','Yes'),
(8,'Carolina Gomez','Nurse','No'),
(9,'Danna Martinez','Sister IR','No'),
(10,'Olive Peterson','Head Nurse','Yes');
select * from Nurse;

create table Patient(
patient_id varchar(100) not null,
Name varchar(100) not null,
surname varchar(100) not null,
address varchar(100) not null,
Gender varchar(150) not null,
phone varchar(150) not null
);
insert into  Patient values
(01,'John','Smith','42 Foobar Lane','Male','555-0256-896'),
(02,'Grace','Ritchie','37 Snafu Drive','Female','555-0512-657'),
(03,'Remo','Xavier','101 Omgbbq Street','Male','555-1204-345'),
(04,'Dennis','Doe','1100 Foobaz Avenue','Male','555-2048-345'),
(05,'John','Smith','123 Main St','Male','555-123-4567'),
(06,'Emily','Johnson','56 Elm St','Female','555-234-5678'),
(07,'Michael','Williams','789 Oak St','Male','555-345-6789'),
(08,'Sarah','Brown','101 Pine St','Female','555-456-7890'),
(09,'David','Jones','234 Maple St', 'Male','555-567-8901'),
(10,'Jessica','Davis','567 Cedar St','Female','555-678-9012');
select * from Patient;

create table  PATIENT_DIAGNOSIS(
Diagnosis varchar(150) not null,
Prescription varchar(150) not null,
Patient_ID varchar (100),
Physician_id varchar(100)
);
insert into  PATIENT_DIAGNOSIS values
('Hypertension','Lisinopril',1,2),
('Arthritis','Naproxen & Aspirin',4,17), 
('Anxiety Disorder','Fluoxetine',3,9),     
('Muscular Dystrophy','Corticosteroids',5,24),                            
('Asthma','Albuterol',2,2),        
('IgA Nephropathy','Budesonide',30,10),     
('Chronic Pain','Tramadol',6,7),    
('Acoustic neuroma','Radiation therapy',7,13),     
('Septic Shock','Corticosteroids:Hydrocortisone',8,25),   
('Kidney Stones','Ibuprofen, Acetaminophen',9,28),     
('Parkinsons Disease,Pramipexole','Ropinirole',10,19),  
('Chronic Obstructive Pulmonary Disease (COPD)','Fluticasone,Budesonide',11,5), 
('Neonatal Jaundice','Phototherapy',12,33),  
('Chronic Pain','Tramadol',13,3); 

-- The fullname of the patients whose gender is male --
SELECT CONCAT(NAME,' ',SURNAME) AS Patients_Fullname,GENDER FROM PATIENT WHERE GENDER = 'MALE';

-- The name of the nurse who are the head of their department and are registered --
SELECT * FROM NURSE WHERE POSITION ='Head Nurse' AND REGISTERED = "YES";

-- Name of the patient to Robert Fernandez having patientid as 5 --
UPDATE PATIENT SET NAME = 'Robert',SURNAME = 'Fernandez' WHERE PATIENT_ID = 5; 

 -- Drop phone column from patient table --
ALTER TABLE Patient DROP phone;

---- Like Operator ----

-- Name of the patients starting with letter A --
SELECT CONCAT(NAME,' ',SURNAME) AS FULL_NAME,GENDER FROM Patient WHERE CONCAT(NAME,' ',SURNAME) LIKE 'A%';

-- The name of the patients whose third letter is M --
SELECT CONCAT(NAME,' ',SURNAME) AS FULL_NAME,GENDER FROM PATIENT WHERE CONCAT(NAME,' ',SURNAME) LIKE '__M%';

---- JOINS ----

 -- Name of the physicians who are the head of each department --
select p.name as Doctor_name,d.dept_name from physician p inner join department d on p.employeeid = d.head;

-- Patient who has diagnosed with chronic pain --
SELECT * FROM Patient
WHERE patient_id IN (SELECT Patient_ID FROM PATIENT_DIAGNOSIS WHERE Diagnosis = 'Chronic Pain');


