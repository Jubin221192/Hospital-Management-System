--Inserting data into Admin
insert into Admin(securitycode, emailid, password)
Values(123, 'admin@hospital.com', 'admin123'),
      (125, 'admin_new@hospital.com', 'admin321')

-- Inserting data in Doctor

insert into Doctor(doctorFirstName,doctorLastName,DoctorDepartment,Doctor_email)
Values ('Jack', 'Stone', 'Orthopedic', 'jackS@hospital.com'),
('Mike', 'Jay', 'Surgery', 'JM@hospital.com'),
('Tom', 'Petty', 'Gynacology', 'TP@hospital.com'),
('Stone', 'Cold', 'Cancer', 'SC@hospital.com'),
('Jack', 'John', 'Pediatritic', 'jJ@hospital.com'),
('Sam', 'Smith', 'Orthopedic', 'SS@hospital.com'),
('Nick', 'Bear', 'Orthopedic', 'NB@hospital.com'),
('Evelyn', 'James', 'Sugregy', 'EJ@hospital.com'),
('Rose', 'Taylor', 'Medicine', 'RT@hospital.com'),
('Nitin', 'Jadhav', 'Psychology', 'NJS@hospital.com'),
('Kate', 'Jad', 'Psychology', 'KateJ@hospital.com')



insert into Patient (PatientFirstName,PatientLastName,PatientGender,PatientBirthdate,PatientDisease,PatientEmailID,PatientContactNumber,PatientBloodGroup)
Values('Jim', 'Smith','Male','1990-02-07', 'HeartAttack', 'Jims.com', '413321150', 'A+'),
       ('Rok', 'Rok','Male','1960-05-19', 'KneeProblem', 'Rok.com', '413322150' , 'A-'),
	   ('David', 'Smith','Male','1990-02-12', 'Liver', 'Daviddd.com', '411321150' , 'O+'),
	   ('Jim', 'kelly','Male','1999-11-22', 'Kidney', 'Jimsss.com', '413321151', 'O+'),
	   ('dave', 'rock','Male','1995-02-21', 'Diabetes', 'dave.com', '413321152', 'AB+'),
	   ('kelly', 'June','Female','1970-02-02', 'BrokenBone', 'kl.com', '413321153', 'AB+'),
	   ('kelly', 'Smith','Female','1992-02-22', 'HeartAttack', 'kll.com', '413321154', 'A+'),
	   ('homel', 'Iran','Male','1990-08-22', 'Backpain', 'hom.com', '413321155', 'A+'),
	   ('Ak', 'Dough','Male','1980-02-23', 'Trauma', 'ak.com', '4133211514', 'A-'),
	   ('Snoop', 'Smith','Male','1991-02-22', 'HeartAttack', 'snp.com', '413321156', 'O+'),
	   ('Jamie', 'Lee','Female','1985-05-22', 'Kidney', 'JL.com', '413321151', 'B+'),
	   ('Cat', 'Dennis','Male','1990-06-22', 'Lung', 'cat.com', '41332115011', 'B+'),
	   ('Noah', 'Trevor','Male','1996-02-22', 'Skin', 'Noh.com', '4133211530', 'A-')



-- inserting outpatient data into Patients

insert into Patient (PatientFirstName,PatientLastName,PatientGender,PatientBirthdate,PatientDisease,PatientEmailID,PatientContactNumber,PatientBloodGroup)
Values('John', 'Smith','Male','1990-02-07', 'HeartAttack', 'John.com', '413321150', 'A+'),
       ('Liam', 'Rok','Male','1969-05-19', 'KneeProblem', 'liam.com', '41333150' , 'A-'),
	   ('Cassian', 'Smith','Male','1990-02-12', 'Liver', 'caasscom', '411321150' , 'O+'),
	   ('Jim', 'kelly','Male','1999-11-22', 'Kidney', 'Jimssss.com', '613321151', 'O+'),
	   ('dan', 'rock','Male','1995-02-21', 'Kidney', 'dann.com', '713321152', 'AB+'),
	   ('kel', 'June','Female','1970-02-02', 'BrokenBone', 'kel.com', '613321153', 'AB+'),
	   ('kelly', 'Smith','Female','1992-02-22', 'HeartAttack', 'kell.com', '713321154', 'A+'),
	   ('Pharell', 'Iran','Male','1990-08-22', 'Backpain', 'ph.com', '813321155', 'A+'),
	   ('Joel', 'Dough','Male','1980-02-23', 'Kidney', 'jo.com', '3133211514', 'A-'),
	   ('Louis', 'Smith','Male','1991-02-22', 'Liver', 'lu.com', '513321156', 'O+'),
	   ('karen', 'Lee','Female','1985-05-22', 'Kidney', 'kar.com', '513321151', 'B+'),
	   ('Larry', 'Dennis','Male','1990-06-22', 'Lung', 'lar.com', '81332115011', 'B+');



-- Inserting uing Data import Wizard

Bulk insert Appointment
From 'C:/DMDD/ProjectMain/appoint_t.csv'

with (rowterminator = '\n',
      fieldterminator = ','
	  )

Insert Into Appointment(Doctor_Doctorid, Patient_PatientId, appointmentDate,Admin_securityCode)
Values ('118','10','2019-01-11', 123),
       ('115','6','2019-05-30' ,123),
	   ('111','12','2019-03-21' ,123),
	   ('115','2','2018-02-16' ,123),
	   ('121','7','2019-05-15' ,123),
	   ('119','8','2019-03-11',125),
	   ('116','14','2019-04-01',125),
	   ('118','14','2019-01-22',125),
	   ('121','3','2019-01-06',125),
	   ('113','11','2019-06-21',123),
	   ('114','5','2019-03-11',123)


-- Inserting outpatient values into Appoinment
Insert Into Appointment(Patient_PatientId,Doctor_Doctorid,appointmentDate,Admin_securityCode)
Values (1,101,'2019-05-21',123),
(5,108,'2019-06-21',123),
(6,106,'2019-07-21',123),
(9,109,'2019-05-11',123),
(10,101,'2019-07-17',123),
(11,108,'2019-05-21',123),
(14,101,'2019-06-21',123),
(15,105,'2019-02-01',123),
(16,107,'2019-05-21',123),
(17,107,'2019-01-21',123),
(18,101,'2019-05-01',123),
(20,101,'2019-01-22',123),
(21,106,'2019-02-21',125),
(22,108,'2019-05-22',125),
(23,108,'2019-03-21',125),
(24,101,'2019-05-17',125),
(25,101,'2019-06-21',125);


-- inserting  data into LabReport
insert into LabReport(patientID,doctorID,patientWeight,patientSeverity,patientBloodGroup)
Values(1,101,188,'severe','A+'),
(2,106,188,'severe','A-'),
(3,101,153,'severe','O+'),
(5,108,200,'severe','AB+'),
(6,106,322,'severe','AB+'),
(7,101,193,'severe','A+'),
(8,100,250,'severe','A+'),
(9,109,200,'severe','A-'),
(10,101,210,'severe','O+'),
(11,108,203,'severe','B+'),
(12,103,230,'severe','B+'),
(13,103,221,'severe','A-'),
(14,101,195,'severe','A+'),
(16,107,177,'severe','O+'),
(17,107,158,'not severe','O+'),
(18,101,200,'not severe','AB+'),
(19,105,230,'not severe','AB+'),
(20,101,200,'not severe','A+'),
(21,106,201,'not severe','A+'),
(22,108,230,'not severe','A-'),
(23,108,201,'not severe','O+'),
(24,101,200,'not severe','B+'),
(25,101,246,'not severe','B+');





-- Using Data import Wizard for inserting data in Patient_has_Doctor

Bulk insert Patient_has_Doctor
From 'C:/DMDD/ProjectMain/pat_doc.csv'

with (rowterminator = '\n',
      fieldterminator = ','
	  )

select * from Doctor_has_appointment;
Insert into Doctor_has_appointment ([Appointment_AppointmentID ],Doctor_Doctorid, Appointment_Admin_securityCode)
Values (200,109,123),
       (202,108,123),
	   (204,101,123),
	   (206,108,123),
	   (208,105,123),
	   (210,101,125),
	   (212, 108,125),
	   (214,108,125),
	   (216, 100,123),
	   (218,108,123),
	   (220,108,123);


-- Inserting data into Feedback
Insert Into Feedback(patientID,patientFirstName,patientLastName)
Select patientID, patientFirstName,patientLastName FROM Patient


-- Inserting data into Doctor_has_feedback
Insert into Doctors_has_feedback (Doctor_Doctorid, Doctor_LabReportno, Feedback_PatientID)
Values (100,51,3),
       (101,56,8),
	   (101,52,4),
	   (101,59,12),
	   (105,55,7),
	   (107,50,13),
	   (108,58,11),
	   (108,51,14),
	   (108,50,2),
	   (108,53,5),
	   (108,54,6),
	   (109,57,10);

-- Inserting data feedback_has_patients
Insert into Feedback_has_patients(Feedback_Doctor_doctorID, Patient_PatientID)
Values (100,3),
       (101,8),
	   (101,4),
	   (101,12),
	   (105,7),
	   (107,13),
	   (108,11),
	   (108,14),
	   (108,2),
	   (108,5),
	   (108,6),
	   (109,10);


-- Inserting data into Visitors
Insert into Visitors( visitorFirstName,visitorLastName, PatientID, PatientFirstName,PatientLastName)
Values  ('Iona', 'Henry', 10, 'AK', 'Dough'),
       ('Tony', 'Stark', 11, 'Snoop','Smith'),
	   ('Hansel', 'Pat', 3,'dave','Rok'),
	   ('Abhi', 'Trevor', 14,'Noah','Trevor'),
	   ('Darryl', 'Cruz', 8,'kelly', 'Smith'),
	   ('Will', 'Smith', 7,'Jim','Kelly'),
       ('Jerry', 'Gayle', 2,'Jim','Smith'),
	   ('Dino', 'Callum', 5,'Homel','Iran'),
	   ('Roger', 'Fed', 4,'David','Smith'),
	   ('Leo', 'Ronald', 12,'Rok','Rok'),
	   ('Ray', 'John', 6,'Jamie','Lee'),
	   ('John', 'Dennis', 13,'Cat','Dennis');



-- Inserting data into Feedback_has_Visitors
insert into Feedback_has_Visitors(Feedback_Doctor_doctorID,Feedback_patientID,Visitors_visitorID)
Values (100,3,616),
       (101,8,618),
	   (101,4,622),
	   (101,12,623),
	   (105,7,619),
	   (107,13,625),
	   (108,11,615),
	   (108,14,617),
	   (108,2,620),
	   (108,5,621),
	   (108,6,624),
	   (109,10,614);

-- Inserting data into Room
Insert into Room (patientID,roomType,roomStatus)
Values (3, 'ICU', 'Occupied'),
       (8,'Emergeny Room','Occupied'),
	   (4,'General','Occupied'),
	   (12, 'ICU','Occupied'),
	   (7,'General','Occupied'),
	   (13,'General','Occupied'),
	   (11, 'ICU','Occupied'),
	   (14 ,'Emergeny Room','Occupied'),
	   (2, 'ICU','Occupied'),
	   (5,'General','Occupied'),
	   (6, 'ICU','Occupied'),
	   (NULL,'General','Available'),
	   (NULL,'General','Available'),
	   (NULL,'ICU','Available'),
	   (NULL,'ICU','Available'),
	   (NULL,'Emergency Room','Available'),
	   (NULL,'Emergency Room','Available');

-- Inserting data into Nurse
Insert Into Nurse(nurseFirstName,nurseLastName)
Values ('Jenny', 'Hank'),
       ('Tony', 'Terry'),
	   ('Mellisa', 'Moore'),
	   ('Abi', 'Dan'),
	   ('Avii', 'Cruz'),
	   ('Wilma', 'Smith'),
       ('James', 'Gayle'),
	   ('Jane', 'Dawson'),
	   ('Maxi', 'Fedrick'),
	   ('Andi', 'Case'),
	   ('Cheryl', 'Smith'),
	   ('John', 'Danish');



-- Inserting data into Inpatient
Insert into  Inpatient (patientID,labNo,roomNo, AdmissionDate, Condition)
Values (2,507,708,'2019-06-01','Severe'),
(3,503,700,'2019-05-21','Severe'),
(4,509,702,'2019-06-11','Severe'),
(5,508,709,'2019-07-01','Severe'),
(6,511,710,'2019-07-11','Severe'),
(7,506,704,'2019-07-19','Severe'),
(8,505,701,'2019-06-05','Severe'),
(11,502,706,'2019-06-01','Severe'),
(12,510,703,'2019-07-20','Severe'),
(13,512,705,'2019-06-28','Severe'),
(14,504,707,'2019-06-25','Severe');



-- Inserting using Data Import Wizard
Bulk insert Inpatient_has_Nurse
From 'C:/DMDD/ProjectMain/inpat_nurse.csv'

with (rowterminator = '\n',
      fieldterminator = ','
	  )

Insert into LabReport_has_Inpatient(patientID,labNo)
 Values (2,	507),
(3,	503),
(4,	509),
(5,	508),
(6	,511),
(10	,501),
(11	,502),
(12	,510),
(13	,512),
(14	,504);


--Procedure to insert data into Labreport_has_OutPatient
Create Procedure InsertLab_has_outpatient

@LabReport_labNo INT,
@Outpatient_patientID INT

AS

Begin

Insert into Labreport_has_outPatient(LabReport_labNO,Outpatient_patientID)
Values(@LabReport_labNo,@Outpatient_patientID)
END

-- Enter data for Labreport_has_OutPatient using the procedure InsertLab_has_outpatient

EXEC InsertLab_has_outpatient 512,14
EXEC InsertLab_has_outpatient 513,15
EXEC InsertLab_has_outpatient 514,17
EXEC InsertLab_has_outpatient 515,18
EXEC InsertLab_has_outpatient 516,19
EXEC InsertLab_has_outpatient 517,20
EXEC InsertLab_has_outpatient 518,21
EXEC InsertLab_has_outpatient 519,22
EXEC InsertLab_has_outpatient 511,23
EXEC InsertLab_has_outpatient 512,24



Insert Into Bill (patiendId, labCharge,doctorCharge,HealthInsurance,NursingCharge,NumberofDays)
Values (1,200,500,1000,200,10),
(2,500,500,1000,200,12),
(3,322,500,1000,200,20),
(4,222,500,0,200,4),
(5,800,500,1000,200,14),
(6,200,500,400,200,4),
(7,700,600,0,150,20),
(8,311,600,400,150,16),
(9,200,600,400,150,15),
(10,340,600,0,150,10),
(11,200,600,400,150,20),
(12,250,600,400,150,27),
(13,250,600,400,150,7),
(14,250,600,0,50,0),
(15,200,200,0,50,0),
(18,300,200,0,50,0),
(19,200,200,0,50,0),
(20,300,200,0,0,0),
(21,300,200,0,0,0),
(22,200,200,0,0,0),
(23,300,200,0,0,0),
(24,300,200,0,0,0),
(25,200,200,0,0,0);


