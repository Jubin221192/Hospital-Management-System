--create database HospitalManagementSystem_Final;

--use HospitalManagementSystem_Final

CREATE TABLE [Patient] (
  [PatientID] INT IDENTITY(1,1)NOT NULL UNIQUE ,
  [PatientFirstName] VARCHAR(45) NOT NULL,
  [PatientLastName] VARCHAR(45) NOT NULL,
  [PatientGender] VARCHAR (30) NOT NULL,
  [PatientBirthdate] DATE NOT NULL,
  [PatientDisease] VARCHAR(45) NOT NULL,
  [PatientBloodGroup] VARCHAR(45) NOT NULL,
  [PatientEmailID] VARCHAR (45) UNIQUE,
  [PatientContactNumber] VARCHAR(45)NOT NULL,
  PRIMARY KEY ([PatientID])
);

CREATE INDEX [Key] ON  [Patient] ([PatientFirstName], [PatientLastName], [PatientGender], [PatientBirthdate], [PatientDisease], [PatientBloodGroup], [PatientEmailID], [PatientContactNumber]);


CREATE TABLE [Doctor] (
  [Doctorid] INT IDENTITY(100,1)NOT NULL UNIQUE ,
  [doctorFirstName] VARCHAR(45) NOT NULL  ,
  [doctorLastName] VARCHAR(45)NOT NULL ,
  [DoctorDepartment] VARCHAR(45) NOT NULL ,
  [Doctor_email] VARCHAR(45)NOT NULL UNIQUE,
  PRIMARY KEY ([Doctorid])
);

CREATE INDEX [Key] ON  [Doctor] ([doctorFirstName], [doctorLastName], [DoctorDepartment], [Doctor_email]);



CREATE TABLE [Patient_has_Doctor] (
  [PatientID] INT NOT NULL,
  [Doctorid] INT NOT NULL,
);

CREATE INDEX [PK,FK] ON  [Patient_has_Doctor] ([PatientID], [Doctorid]);


CREATE TABLE [Patient_has_Appointment] (
  [Patient_PatientID] INT NOT NULL,
  [Appointment_AppointmentID] INT NOT NULL,
  [Appointment_Admin_securityCode] INT NOT NULL
);

CREATE INDEX [PK,FK] ON  [Patient_has_Appointment] ([Patient_PatientID], [Appointment_AppointmentID]);

CREATE INDEX [Key] ON  [Patient_has_Appointment] ([Appointment_Admin_securityCode]);

CREATE TABLE [Admin] (
  [securitycode] INT NOT NULL UNIQUE,
  [emailId] VARCHAR(45) NOT NULL UNIQUE,
  [password] VARCHAR(45)NOT NULL UNIQUE,
  PRIMARY KEY ([securitycode])
);

CREATE INDEX [Key] ON  [Admin] ([emailId], [password]);

CREATE TABLE [Appointment] (
  [AppointmentID ] INT IDENTITY(200,2) NOT NULL UNIQUE,
  [Patient_PatientId]VARCHAR(45) NOT NULL,
   [Doctor_Doctorid] VARCHAR(45) NOT NULL,
  [appointmentDate] DATE NOT NULL,
  [Admin_securityCode] INT NOT NULL,
  PRIMARY KEY ([AppointmentID ])
);

CREATE INDEX [FK] ON  [Appointment] ([Doctor_Doctorid], [Patient_PatientId], [Admin_securityCode]);

CREATE INDEX [Key] ON  [Appointment] ([appointmentDate]);



CREATE TABLE [Doctors_has_feedback] (
  [Doctor_LabReportno] INT NOT NULL,
  [Feedback_PatientID] INT,
  [Doctor_Doctorid] INT
);

CREATE INDEX [PK,FK] ON  [Doctors_has_feedback] ([Doctor_LabReportno], [Feedback_PatientID]);

CREATE INDEX [Key] ON  [Doctors_has_feedback] ([Doctor_Doctorid]);


CREATE TABLE [LabReport] (
  [labNo] INT  IDENTITY(500,1)NOT NULL UNIQUE,
  [patientID] INT NOT NULL,
  [doctorID] VARCHAR(45) NOT NULL,
  [patientWeight] INT,
  [patientSeverity] VARCHAR(45) NOT NULL,
  [patientBloodGroup] VARCHAR(45) NOT NULL,
  
  PRIMARY KEY ([labNo])
);

CREATE INDEX [Key] ON  [LabReport] ([patientID], [patientSeverity], [patientBloodGroup], [doctorID]);


CREATE TABLE [Feedback] (
  [feedbackID] INT IDENTITY(700,1) NOT NULL UNIQUE,
  [patientID] INT NOT NULL,
  [patientFirstName] VARCHAR(45),
  [patientLastName] VARCHAR(45),
  PRIMARY KEY ([feedbackID])
);

CREATE INDEX [Key] ON  [Feedback] ([patientID], [patientFirstName], [patientLastName]);


CREATE TABLE [Visitors] (
  [VisitorID] INT IDENTITY(600,1)NOT NULL UNIQUE,
  [visitorFirstName] VARCHAR(45)  ,
  [visitorLastName] VARCHAR(45)  ,
  [PatientID] INT NOT NULL ,
  [PatientFirstName] VARCHAR(45) NOT NULL ,
  [PatientLastName] VARCHAR(45) NOT NULL ,
  PRIMARY KEY ([VisitorID])
);

CREATE INDEX [Key] ON  [Visitors] ([visitorFirstName], [visitorLastName], [PatientID], [PatientFirstName], [PatientLastName]);


CREATE TABLE [Inpatient] (
  [patientID] INT NOT NULL UNIQUE,
  [labNo] INT ,
  [Condition] VARCHAR(45),
  [roomNo] INT NOT NULL ,
  [AdmissionDate] Date,
  PRIMARY KEY ([patientID])
);

CREATE INDEX [Key] ON  [Inpatient] ([labNo],[Condition], [roomNo],[AdmissionDate]);

CREATE TABLE [Room] (
  [roomNumber] INT IDENTITY(700,1) NOT NULL UNIQUE,
  [patientID] INT  ,
  [roomType] VARCHAR(45) ,
  [roomStatus] VARCHAR(45) ,
  PRIMARY KEY ([roomNumber])
);

CREATE INDEX [Key] ON  [Room] ([patientID], [roomType], [roomStatus]);


CREATE TABLE [Nurse] (
  [nurseID] INT IDENTITY(800,1)NOT NULL UNIQUE,
  [nurseFirstName] VARCHAR(45) NOT NULL ,
  [nurseLastName] VARCHAR(45) NOT NULL ,

  PRIMARY KEY ([nurseID])
);

CREATE INDEX [Key] ON  [Nurse] ([nurseFirstName], [nurseLastName]);

CREATE TABLE [Inpatient_has_Nurse] (
  [Inpatient_patientID] INT NOT NULL ,
  [Inpatient_Roomno] INT NOT NULL ,
  [Nurse_NurseId] INT NOT NULL 
);

CREATE INDEX [PK,FK] ON  [Inpatient_has_Nurse] ([Inpatient_patientID], [Nurse_NurseId]);

CREATE INDEX [FK] ON  [Inpatient_has_Nurse] ([Inpatient_Roomno]);


CREATE TABLE [Bill] (
  [BillNumber] INT IDENTITY(1000,2)NOT NULL UNIQUE,
  [patiendId] INT,
  [labCharge] INT,
  [doctorCharge] INT,
  [HealthInsurance] INT,
  [NursingCharge] INT,

  [NumberofDays] INT

  PRIMARY KEY ([BillNumber])
);

CREATE INDEX [Key] ON  [Bill] ([patiendId], [labCharge],  [doctorCharge], [HealthInsurance], [NursingCharge]);

CREATE TABLE [OutPatient] (
  [PatientID] INT NOT NULL UNIQUE,
  [patientFirstName] VARCHAR(45) NOT NULL,
  [patientLastName] VARCHAR(45) NOT NULL,
  [Date] Date,
  [BillNo] INT NOT NULL,
  PRIMARY KEY ([PatientID])
);

CREATE INDEX [Key] ON  [OutPatient] ([patientFirstName], [patientLastName], [Date], [BillNo]);

CREATE TABLE [Doctor_has_appointment] (
  [Doctor_Doctorid] INT,
  [Appointment_Admin_securityCode] INT,
  [Appointment_AppointmentID ] INT
);

CREATE INDEX [PK,FK] ON  [Doctor_has_appointment] ([Doctor_Doctorid], [Appointment_AppointmentID ]);

CREATE INDEX [Key] ON  [Doctor_has_appointment] ([Appointment_Admin_securityCode]);


CREATE TABLE [Feedback_has_patients] (
 
  [Patient_PatientID] INT,
  [Feedback_Doctor_doctorID] INT
);

CREATE INDEX [PK,FK] ON  [Feedback_has_patients] ([Feedback_Doctor_doctorID], [Patient_PatientID]);


CREATE TABLE [Feedback_has_Visitors] (
  [Feedback_patientID] INT,
  [Feedback_Doctor_doctorID] INT,
  [Visitors_visitorID] INT
);

CREATE INDEX [PK,FK] ON  [Feedback_has_Visitors] ([Feedback_patientID], [Visitors_visitorID]);

CREATE INDEX [Key] ON  [Feedback_has_Visitors] ([Feedback_Doctor_doctorID]);

CREATE TABLE [LabReport_has_Inpatient] (
  [labNo] INT,
  [patientID] INT
);

CREATE INDEX [PK,FK] ON  [LabReport_has_Inpatient] ([labNo], [patientID]);

CREATE TABLE [LabReport_has_OutPatient] (
  [LabReport_labNO] INT,
  [Outpatient_patientID] INT
);

CREATE INDEX [PK,FK] ON  [LabReport_has_OutPatient] ([LabReport_labNO], [Outpatient_patientID]);
