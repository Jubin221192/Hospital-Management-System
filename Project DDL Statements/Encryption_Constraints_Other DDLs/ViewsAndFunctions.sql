--VIEW 1
-- Creating View to Display Total Bill of Patient
Create View [TotalBill] AS Select  BillNumber, patiendId, labCharge +doctorCharge -HealthInsurance +NursingCharge+NumberofDays+RoomCharge AS [TotalBill]
FROM Bill;

Select * FROM TotalBill;

--VIEW 2
--View to Display Patients Admitted in the Month of June
Create View [PatientsInJune] As Select patientID, LabNo, RoomNo, AdmissionDate FROM Inpatient
Where MONTH(AdmissionDate) = 6; 

Select * FROM PatientsInJune;

--COMPUTED COLUMN BASED ON FUNCTION
--create deterministic function with schemebinding
-- 1
Create function RoomCharge(@val int)
Returns int
with schemabinding
As
Begin 
     Return @val*10;
End

--add a computed column with persisted option 
Alter Table Bill 
Add RoomCharge As dbo.RoomCharge(NumberofDays) persisted
Go

-- Check resulting computed Column
select * from Bill;

-- function to find age of a patient
Create function PatientAge(@val date)
Returns int
with schemabinding
As
Begin 
     Return DATEDIFF(DAY, @val, GetDate()) / 365;
     

End

-- Add column age into Patients table
Alter Table Patient 
Add Age As dbo.PatientAge(PatientBirthdate) 
Go

-- check the outcome in Patient
select * from Patient;



--FUNCTION FOR CHECK CONSTRAINT SO THAT ONLY SEVERLY ILL PATIENTS WILL BE ADMITTED TO THE HOSPITAL 

Create function Patient_Admit(@patientID varchar(45))
Returns smallint
AS
Begin
      Declare @count smallint= 0;
	  Select @count = COUNT(patientID)
	         From LabReport 
	         Where patientID = @patientID and
	         patientSeverity = 'not severe';
      Return @count;
END;

Alter Table Inpatient
Add Constraint patientadmit1 Check (dbo.Patient_Admit(patientID) = 0)

insert into LabReport(patientID,doctorID,patientWeight,patientSeverity,patientBloodGroup)
Values(100,101,188,'not severe','A+')

-- testing constraint by trying to add 'not severe' in inpatient table
Insert into  Inpatient (patientID,labNo,roomNo, AdmissionDate, Condition)
Values (100,528,708,'2019-06-01','not severe');



-- COLUMN LEVEL ENCRYPTION TO ENCRYPT PATIENT BLOODGROUP
Create master key encryption by 
password = 'Test@123'
GO

select * from labReport;

Create certificate labcert
    with subject = 'Patient Blood'

Create Symmetric key SSN_KEY_1
           With Algorithm = AES_256
		   Encryption by certificate labcert

Open symmetric key SSN_Key_1
     Decryption by Certificate labcert



-- Encrypt LabReport BloodGroup Column and store in encrypted PatientData Column

-- Add a column EncryptBloodGroup to LabReports

Alter Table LabReport
Add EncryptPatientData varbinary(128)

Update LabReport
SET EncryptPatientData = ENCRYPTBYKEY(KEY_GUID('SSN_Key_1'),patientBloodGroup)
Go

select * from LabReport;

--Decryption

Open Symmetric Key SSN_Key_1
     Decryption By Certificate labcert
	 select labNo, PatientID, patientBloodGroup AS 'ActualBloodGroup', EncryptPatientData, CONVERT(varchar,DECRYPTBYKEY(EncryptPatientData)) AS 'DecryptedPatientData' from LabReport;




