use HospitalManagement_Project9;
go


/********************************************************************************
* Procedure for inserting data into Doctor,Patient and LabReport tables
*/

create procedure Multiple_insertion
(
@lab_no int,
@patientID int,
@doctorID int,
@doc_firstName nvarchar(45),
@doc_lastName nvarchar(45),
@doc_department nvarchar(45),
@doc_emid nvarchar(45),
@patientFirstName nvarchar(45),
@patientLastName nvarchar(45),
@patientd_o_b date,
@patient_gen nvarchar(30),
@patientWeight int,
@patientDisease nvarchar(45),
@patientBloodGroup nvarchar(4),
@patient_emid nvarchar(45),
@patient_contno nvarchar(45)
)
As
begin

/*checking whether id present or not:Validation*/
declare @exist as int = 0
select @exist = count(patientID) 
from hospital_management.patient
where patientID = @patientID

if @exist > 0
begin
	raiserror('ID already present',1 ,1)
	return 0
end

/*insert into patient*/

insert into hospital_management.patient
(
patientID,
patientFirstName,
patientLastName,
patientBirthDate,
patientGender,
patientWeight,
patientDisease,
pateintBloodGroup,
PatientEmailId,
PatientContactNumber
)
values
(
@patientID,
@patientFirstName,
@patientLastName,
@patientd_o_b,
@patient_gen,
@patientWeight,
@patientDisease,
@patientBloodGroup,
@patient_emid,
@patient_contno 
)

/*checking whether id present or not:Validation*/

declare @exist_labno as int = 0
select @exist_labno = count(labNo) 
from hospital_management.labreport
where labNo = @lab_no

if @exist_labno > 0
begin
	raiserror('Lab Number already present',1 ,1)
	return 0
end

/* insert into lab report*/
insert into hospital_management.labreport
(
labNo, pateintID, patientFirstName, patientLastName, patientWeight, patientBloodGroup, doctorFirstName, doctorLastName
)
values
(
@lab_no, @patientID, @patientFirstName, @patientLastName, @patientWeight, @patientBloodGroup, @doc_firstName, @doc_lastName
)

/*checking whether id present or not:Validation*/
declare @exist_docID as int = 0
select @exist_docID = count(doctorID) 
from hospital_management.doctor
where doctorId = @doctorID

if @exist_docID > 0
begin
	raiserror('ID already present',1 ,1)
	return 0
end
/* insert into Doctor table*/
insert into hospital_management.doctor
(
doctorId, doctorFirstName, doctorLastName, doctorDepartment, doctorEmailId, LabReport_labNo
)
values
(
@doctorID,@doc_firstName, @doc_lastName,@doc_department, @doc_emid, @lab_no
)

/*check whether inserted record returned or not*/
If @@ROWCOUNT =1
	return 1
else
	return 0
end

go
go

/*inserting data*/
--1
EXEC Multiple_insertion  '1','101','1100','Michal','Swain','Surgery','swain@gmail.com','Julia','Bosh',
'1990-06-10', 'F','53','Hernia','O+','julia@gmail.com','617888977' 
--2
EXEC Multiple_insertion '2','102','1101','Jennifer','Alerbt','General','jennifer@gmail.com','Joe','Ogando',
'1993-07-11', 'M','62','Thyroid','B+','joe@gmail.com','617444455'
--3
EXEC Multiple_insertion '3','103','1102','Robert','Rooney','General','rooney@gmail.com','Lewis','Macaskill','1981-09-21', 'M','72',
'Diabetes','A-','lewis@gmail.com','9174144558'
--4
EXEC Multiple_insertion '4','104','1103','Jason','Chang','Opthalmology','chang@gmail.com','Thaise','Patrone','2001-08-11', 'F','42','Uveitis'
,'O+','thaise@gmail.com','9674166551'
--5
EXEC Multiple_insertion '5','105','1104','Brittany','Yang','Dermatology','yang@gmail.com','Maria','Ramirez','1971-08-21', 
'F','75','Eczema','O+','thaise@gmail.com','987772102'
--6
EXEC Multiple_insertion '6','106','1105','Valerie','Nora','Endocrinology','nora@gmail.com','Gaberiella','Ogando',
'2001-06-11', 'F','42','Diabetes','A+','gabby@gmail.com','9823945672'
--7
EXEC Multiple_insertion '7','107','1106','Christina','Jones','Gynacology','jones@gmail.com','Scarlett','Gates','1989-08-11', 
'F','58','Endometriosis.','AB+','gates@gmail.com','9233020202'
--8
EXEC Multiple_insertion '8','108','1107','Bradd','Johnson','Cardiology','johnson@gmail.com','Mirinda','Ruarez','1988-11-14', 
'F','55','Coronary artery disease','AB+','ruarez@gmail.com','9912345768'
--9
EXEC Multiple_insertion '9','109','1108','Shefali','Roberts','Neurology','roberts@gmail.com','Christopher','Patrone','2005-12-15', 
'M','45','Peripheral Neuropathy','AB+','christ@gmail.com','9199921102'
--10
EXEC Multiple_insertion '10','110','1109','Kenny','Nguyen','Urology','kenny@gmail.com','Zee','Weiner','1990-02-03', 
'F','63','Overactive Bladder ','AB-','zee@gmail.com','93998190211'



/*Table level constraint using CHECK keyword*/
ALTER TABLE hospital_management.patient
ADD CONSTRAINT bloodGrp_const
CHECK (pateintBloodGroup in ('A+','B+','A-','B-','AB+','AB-','O+', 'O-'))

/*******************************************************************
  * Procedure Ends
*/





/***********************************************************************
 *Procedure for Inserting a data into Appointment*/

go 
create procedure Appointment_Insertion
(
@app_id int,
@app_date date
)
As
begin

/*checking whether id present or not*/
declare @exist_app as int = 0
select @exist_app = count(AppointmentID) 
from hospital_management.appointment
where AppointmentID = @app_id

if @exist_app > 0
begin
	raiserror('ID already present',1 ,1)
	return 0
end

/*insert into Appointment*/
insert into hospital_management.appointment
(
AppointmentID, appointmentDate)
values
( @app_id, @app_date)

/*check whether inserted record returned or not*/
If @@ROWCOUNT =1
	return 1
else
	return 0
end

go

/*inserting data*/
--1
EXEC Appointment_Insertion '300','2019-06-23'
--2
EXEC Appointment_Insertion '301','2019-06-24'
--3
EXEC Appointment_Insertion '302','2019-06-25'
--4
EXEC Appointment_Insertion '303','2019-06-26'
--5
EXEC Appointment_Insertion '304','2019-06-27'
--6
EXEC Appointment_Insertion '305','2019-06-28'
--7
EXEC Appointment_Insertion '306','2019-06-29'
--8
EXEC Appointment_Insertion '307','2019-06-30'
--9
EXEC Appointment_Insertion '308','2019-07-01'
--10
EXEC Appointment_Insertion '309','2019-07-02'


/**************************************************************************************
* Procedure to update Appointment Table
*/

go
create procedure appointment_update
@patient_id int,
@date_of_app date,
@dfn nvarchar(45),
@dln nvarchar(45)

as 
begin
declare @appoint_id int;
declare @pfn nvarchar(45);
declare @pln nvarchar(45);

select @appoint_id = AppointmentID from hospital_management.appointment where appointmentDate =@date_of_app

if((select patientDisease from hospital_management.patient where patientID = @patient_id) = 'Hernia')
	
	select @pfn = patientFirstName, @pln= patientLastName from hospital_management.patient where patientID = @patient_id
	update hospital_management.appointment
	set doctorFirstName = @dfn , doctorLastName = @dln, patientFirstName =@pfn , patientLastName =@pln
	where AppointmentID = @appoint_id

if ((select patientDisease from hospital_management.patient where patientID = @patient_id) = 'Thyroid')
	select @pfn = patientFirstName, @pln= patientLastName from hospital_management.patient where patientID = @patient_id
	update hospital_management.appointment
	set doctorFirstName = @dfn , doctorLastName = @dln, patientFirstName =@pfn , patientLastName =@pln
	where AppointmentID = @appoint_id

if((select patientDisease from hospital_management.patient where patientID = @patient_id) = 'Peripheral Neuropathy')
	
	select @pfn = patientFirstName, @pln= patientLastName from hospital_management.patient where patientID = @patient_id
	update hospital_management.appointment
	set doctorFirstName = @dfn , doctorLastName = @dln, patientFirstName =@pfn , patientLastName =@pln
	where AppointmentID = @appoint_id

if((select patientDisease from hospital_management.patient where patientID = @patient_id) = 'Uveitis')
	
	select @pfn = patientFirstName, @pln= patientLastName from hospital_management.patient where patientID = @patient_id
	
	update hospital_management.appointment
	set doctorFirstName = @dfn , doctorLastName = @dln, patientFirstName =@pfn , patientLastName =@pln
	where AppointmentID = @appoint_id

if((select patientDisease from hospital_management.patient where patientID = @patient_id) = 'Eczema')
	
	select @pfn = patientFirstName, @pln= patientLastName from hospital_management.patient where patientID = @patient_id
	
	update hospital_management.appointment
	set doctorFirstName = @dfn , doctorLastName = @dln, patientFirstName =@pfn , patientLastName =@pln
	where AppointmentID = @appoint_id

if((select patientDisease from hospital_management.patient where patientID = @patient_id) = 'Coronary artery disease')
	
	select @pfn = patientFirstName, @pln= patientLastName from hospital_management.patient where patientID = @patient_id
	
	update hospital_management.appointment
	set doctorFirstName = @dfn , doctorLastName =@dln, patientFirstName =@pfn , patientLastName =@pln
	where AppointmentID = @appoint_id

if((select patientDisease from hospital_management.patient where patientID = @patient_id) = 'Endometriosis.')
	
	select @pfn = patientFirstName, @pln= patientLastName from hospital_management.patient where patientID = @patient_id
	
	update hospital_management.appointment
	set doctorFirstName = @dfn , doctorLastName = @dln, patientFirstName =@pfn , patientLastName =@pln
	where AppointmentID = @appoint_id

if((select patientDisease from hospital_management.patient where patientID = @patient_id) = 'Overactive Bladder ')
	
	select @pfn = patientFirstName, @pln= patientLastName from hospital_management.patient where patientID = @patient_id
	
	update hospital_management.appointment
	set doctorFirstName = @dfn, doctorLastName = @dln, patientFirstName =@pfn , patientLastName =@pln
	where AppointmentID = @appoint_id



end
go

Execute appointment_update '101','2019-06-23','Michal','Swain'
Execute appointment_update '102','2019-06-24','Jennifer','Alerbt'
Execute appointment_update '104','2019-06-25','Brittany','Yang'
Execute appointment_update '105','2019-06-26', 'Valerie', 'Nora'
Execute appointment_update '107','2019-06-27', 'Christina','Jones'
Execute appointment_update '108','2019-06-28', 'Bradd',' Johnson'
Execute appointment_update '109','2019-06-29', 'Shefali','Roberts'
Execute appointment_update '110','2019-06-30', 'Kenny', 'Nguyen'
/*********************************************************************************
* Procedure Ends
*/


/*********************************************************************************
* Procedure for Patient Has Doctor Populate
*/
go
create procedure patient_doctor_populate
@patientFirstName nvarchar(45),
@doc_firstName nvarchar(45)

as
begin
	declare @pat_id int;
	declare @doc_id int;
	declare @lab_rep_id int;

	select @pat_id =patientID from hospital_management.patient where patientFirstName = @patientFirstName

	select @doc_id= doctorId, @lab_rep_id= LabReport_labNo  from hospital_management.doctor where doctorFirstName = @doc_firstName

	insert into hospital_management.patient_has_doctor values(@pat_id, @doc_id, @lab_rep_id)

end

go


--1
execute patient_doctor_populate 'Julia','Michal'
--2
execute patient_doctor_populate 'Joe','Jennifer'
--3
execute patient_doctor_populate 'Lewis','Robert'
--4
execute patient_doctor_populate 'Thaise','Jason'
--5
execute patient_doctor_populate 'Maria','Brittany'
--6
execute patient_doctor_populate 'Gaberiella','Valerie'
--7
execute patient_doctor_populate 'Scarlett','Christina'
--8
execute patient_doctor_populate 'Mirinda','Bradd'
--9
execute patient_doctor_populate 'Christopher','Shefali'
--10
execute patient_doctor_populate 'Zee','Kenny'
/*************************************************************************
* Procedure Ends
*/




/*************************************************************************
* Procedure For Feedback Table
*/

go

create procedure feedack_insert
@feed_id int,
@comments nvarchar(45),
@date date,
@patientId int,
@doctorId int

/*checking whether id present or not:Validation*/
as 
begin
	declare @patientFirstName nvarchar(45);
	declare @patientLastName nvarchar(45);
	declare @doctorFirstName nvarchar(45);
	declare @doctorLastName nvarchar(45);
	
	select @doctorFirstName = doctorFirstName, @doctorLastName= doctorLastName from hospital_management.doctor 
	where doctorId = @doctorId;

	select @patientFirstName = patientFirstName, @patientLastName = patientLastName from hospital_management.patient
	where patientID = @patientId

	insert into hospital_management.feedback values
	(
	@feed_id, @patientId , @patientFirstName, @patientLastName, @doctorFirstName, @doctorLastName, @comments,@date, @doctorId
	)
end

--1
Execute feedack_insert '7700','hernia operation required','2019-07-01','101','1100'
--2
Execute feedack_insert '7701','Thyroid operation required','2019-07-01','102','1101'
--3
Execute feedack_insert '7702','Diabetes special care needed','2019-07-01','103','1102'
--4
Execute feedack_insert '7703','Uveitis operation required','2019-07-01','104','1103'
--5
Execute feedack_insert '7704','Eczema special care needed','2019-07-01','105','1104'
--6
Execute feedack_insert '7705','Diabetes special care needed','2019-07-01','106','1105'
--7
Execute feedack_insert '7706','Endometriosis. operation required','2019-07-01','107','1106'
--8
Execute feedack_insert '7707','Coronary artery disease special care needed','2019-07-01','108','1107'
--9
Execute feedack_insert '7708','Peripheral Neuropathy operation required','2019-07-01','109','1108'
--10
Execute feedack_insert '7709','Overactive Bladder  special care needed','2019-07-01','110','1109'

select * from hospital_management.feedback

/*************************************************************************
* Procedure Ends
*/




/*************************************************************************
* Procedure For Lab Report
*/

go 
create procedure patient_severity
@pat_id int

as
begin

	if((select patientDisease from hospital_management.patient where patientID = @pat_id) in 
	   ('Hernia','Coronary artery disease','Overactive Bladder '))
		update hospital_management.labreport set patientSeverity = '5' where pateintID = @pat_id

	else if((select patientDisease from hospital_management.patient where patientID = @pat_id) in ('Endometriosis.','Peripheral Neuropathy'))
		update hospital_management.labreport set patientSeverity = '4' where pateintID = @pat_id

	else
		update hospital_management.labreport set patientSeverity = '3' where pateintID = @pat_id
		

end
go

--1
execute patient_severity '101'
--2
execute patient_severity '102'
--3
execute patient_severity '103'
--4
execute patient_severity '104'
--5
execute patient_severity '105'
--6
execute patient_severity '106'
--7
execute patient_severity '107'
--8
execute patient_severity '108'
--9
execute patient_severity '109'
--10
execute patient_severity '110'

select * from hospital_management.labreport;

/*************************************************************************
* Procedure Ends
*/


/*************************************************************************
* Procedure Bill and Room 
*/

go
create procedure insert_bill_room
@lab_no int,
@room_num int,
@bill_no int,
@room_type nvarchar(45),
@patient_insurance int

as
begin
	declare @pid int;
	select @pid = pateintID from hospital_management.labreport where labNo = @lab_no

	insert into hospital_management.room (roomNumber, roomType) values (@room_num, @room_type)
	begin
		if ( (select patientID from hospital_management.room where roomNumber=@room_num) is null)
			update hospital_management.room
			set roomStatus = 'Available'
			where roomNumber = @room_num
	end
	insert into hospital_management.bill (billNumber, patientId, healthInsurance) values(@bill_no, @pid, @patient_insurance)
end

--1
Execute insert_bill_room  '1', '11101', '12101' , 'ICU', '4000'
--2
Execute insert_bill_room  '2', '11102', '12102' , 'General', '4200'
--3
Execute insert_bill_room  '3', '11103', '12103' , 'General', '4400'
--4
Execute insert_bill_room  '4', '11104', '12104' , 'General', '4600'
--5
Execute insert_bill_room  '5', '11105', '12105' , 'General', '4800'
--6
Execute insert_bill_room  '6', '11106', '12106' , 'General', '5000'
--7
Execute insert_bill_room  '7', '11107', '12107' , 'Emergency', '5200'
--8
Execute insert_bill_room  '8', '11108', '12108' , 'ICU', '5400'
--9
Execute insert_bill_room  '9', '11109', '12109' , 'Emergency', '5600'
--10
Execute insert_bill_room  '10', '111010', '12110' , 'ICU', '5800'


/*************************************************************************
* Procedure Ends
*/


/***********************************************************************************
* Procedure for automatically Updating three tables
*/

go
create procedure in_out_patient
@patientid int,
@date date,
@roomNo int


as
begin
	declare @lab_no int;
	declare @patientFirstName nvarchar(45);
	declare @patientLastName nvarchar(45);
	declare @bill_no int;
	declare @patient_severity int;

	select @lab_no = labNo, @patient_severity=patientSeverity, @patientFirstName = patientFirstName, 
	@patientLastName = patientLastName from hospital_management.labreport where pateintID = @patientid;
	
	select @bill_no = billNumber from hospital_management.bill where patientId = @patientid;

	if (@patient_severity in (4,5))
		if((select patientID from hospital_management.room where patientID = @patientid) is null) 	
			if(@patient_severity = 5)
				update hospital_management.room
				set patientID = @patientid, roomStatus = 'booked'
				where roomType = 'ICU' and roomNumber=@roomNo

			else if(@patient_severity = 4)
				update hospital_management.room
				set patientID = @patientid, roomStatus = 'booked'
				where roomType in ('Emergency' ,'General') and roomNumber=@roomNo


	if(@patient_severity = 3)  
		insert into hospital_management.outpatient
		values(@patientid, @patientFirstName, @patientLastName, @lab_no, @date, @bill_no)

end

--1
execute in_out_patient '101','2019-08-01','11101'

--2
execute in_out_patient '102','2019-07-02','11102'
--3
execute in_out_patient '103','2019-07-03','11103'

--4
execute in_out_patient '104','2019-07-04','11104'

--5
execute in_out_patient '105','2019-07-05','11105'

--6
execute in_out_patient '106','2019-07-06','11106'


select  * from hospital_management.room;
select * from hospital_management.outpatient;

/***********************************************************************************
* Procedure Ends
*/


/***********************************************************************************
* Procedure for Inpatient
*/

go
create procedure inser_inpatient
@patientId int

as 
begin
declare @lab_no int;
declare @room_no int;
declare @patientFirstName nvarchar(45);
declare @patientLastName nvarchar(45);
declare @patient_ins int;
declare @pat_billNo int;

IF EXISTS(select patientID from hospital_management.room where patientID = @patientId)
	select @room_no = roomNumber from hospital_management.room where patientID = @patientId
	select @lab_no = labNo, @patientFirstName = patientFirstName, @patientLastName = patientLastName 
	from hospital_management.labreport where pateintID = @patientId
	select @pat_billNo = billNumber,@patient_ins = healthInsurance from hospital_management.bill where patientId = @patientId

	insert into hospital_management.inpatient(patientID, labNo, patientFirstName, patientLastName, healthInsurance, Room_roomNumber, Bill_billNumber)
	values(@patientId, @lab_no, @patientFirstName, @patientLastName, @patient_ins, @room_no, @pat_billNo)

end
go

--1
execute inser_inpatient '101'
--1
execute inser_inpatient '107'
--1
execute inser_inpatient '108'
--1
execute inser_inpatient '109'
--1
execute inser_inpatient '110'

go


/***********************************************************************************
* Procedure Ends
*/


/***********************************************************************************
* View of Appointment
*/
go
create VIEW Appointment
AS SELECT AppointmentID, a.patientFirstName,a.patientLastName,doctorFirstName,
doctorLastName,p.patientDisease,PatientContactNumber,appointmentDate
FROM hospital_management.appointment as a
inner join hospital_management.patient as p
on p.patientFirstName=a.patientFirstName
go
select * from Appointment;

/***********************************************************************************
* Room Allotment 
*/

select * from hospital_management.room;
go
create VIEW RoomAllotment
AS SELECT roomNumber, ip.patientFirstName,ip.patientLastName,ap.doctorFirstName,ap.doctorLastName,
roomType,roomStatus
FROM hospital_management.room as r
inner join hospital_management.inpatient as ip
on ip.patientID=r.patientID
inner join hospital_management.appointment as ap
on ip.patientFirstName=ap.patientFirstName
go
select * from  RoomAllotment;





/*********************************************************************************
* Procedure for Feedback Has Patient Populate
*/
go
create procedure feedback_has_patient_populate
@patientFirstName nvarchar(45),
@doctorFirstName nvarchar(45)

as
begin
	declare @feedback_id int;
	declare @patient_id int;
	declare @doctor_id int;

	select @feedback_id =feedbackID,@doctor_id=Doctor_doctorId from hospital_management.feedback 
	where doctorFirstName = @doctorFirstName

	select @patient_id=patientID  from hospital_management.patient where patientFirstName = @patientFirstName

	insert into hospital_management.feedback_has_patient values(@feedback_id,@doctor_id, @patient_id)

end

go

execute feedback_has_patient_populate 'Julia','Michal'
--2
execute feedback_has_patient_populate 'Joe','Jennifer'
--3
execute feedback_has_patient_populate 'Lewis','Robert'
--4
execute feedback_has_patient_populate 'Thaise','Jason'
--5
execute feedback_has_patient_populate 'Maria','Brittany'
--6
execute feedback_has_patient_populate 'Gaberiella','Valerie'
--7
execute feedback_has_patient_populate 'Scarlett','Christina'
--8
execute feedback_has_patient_populate 'Mirinda','Bradd'
--9
execute feedback_has_patient_populate 'Christopher','Shefali'
--10
execute feedback_has_patient_populate 'Zee','Kenny'

select * from hospital_management.feedback_has_patient;

/*********************************************************************************
* Procedure Ends
*/




/*********************************************************************************
* Procedure for Doctor Has Feeedback Populate
*/
go
alter procedure doctor_has_feedback_populate
@patientFirstName nvarchar(45),
@doctorFirstName nvarchar(45)

as
begin
	declare @doctor_id int;
	declare @doctor_lab int;
	declare @feedpatient_id int;
	declare @feed_doctor_id int;


	select @feedpatient_id =patientID, @feed_doctor_id=Doctor_doctorId from hospital_management.feedback 
	where patientFirstName = @patientFirstName

	select @doctor_id=doctorId,@doctor_lab=LabReport_labNo  from hospital_management.doctor where doctorFirstName = @doctorFirstName

	insert into hospital_management.doctor_has_feedback values(@doctor_id,@doctor_lab, @feedpatient_id,@feed_doctor_id)

end

go

execute doctor_has_feedback_populate 'Julia','Michal'
--2
execute doctor_has_feedback_populate 'Joe','Jennifer'
--3
execute doctor_has_feedback_populate 'Lewis','Robert'
--4
execute doctor_has_feedback_populate 'Thaise','Jason'
--5
execute doctor_has_feedback_populate 'Maria','Brittany'
--6
execute doctor_has_feedback_populate 'Gaberiella','Valerie'
--7
execute doctor_has_feedback_populate 'Scarlett','Christina'
--8
execute doctor_has_feedback_populate 'Mirinda','Bradd'
--9
execute doctor_has_feedback_populate 'Christopher','Shefali'
--10
execute doctor_has_feedback_populate 'Zee','Kenny'

/********************************************************************************************
Procedure ends
*/




/********************************************************************************************
Procedure for nurse and visitors
*/

go
create procedure Multiple_insertion2
(
@nurseId int,
@visitorID int,
@patientID int,
@nurse_firstName nvarchar(45),
@nurse_lastName nvarchar(45),
@visitorFirstName nvarchar(45),
@visitorLastName nvarchar(45),
@patientFirstName nvarchar(45),
@patientLastName nvarchar(45)
)
As
begin

/*checking whether id present or not:Validation*/
declare @exist as int = 0
select @exist = count(nurseID) 
from hospital_management.nurse
where nurseID =@nurseId 

if @exist > 0
begin
	raiserror('ID already present',1 ,1)
	return 0
end

/*insert into patient*/

insert into hospital_management.nurse
(
nurseID,
nurseFirstName,
nurseLastName,
patientId,
patientFirstName,
patientLastName
)
values
(
@nurseId,
@nurse_firstName,
@nurse_lastName,
@patientID,
@patientFirstName,
@patientLastName
)

/*checking whether id present or not:Validation*/

declare @exist_visitor as int = 0
select @exist_visitor = count(@visitorID) 
from hospital_management.visitors
where @visitorID = @visitorID

if @exist_visitor > 0
begin
	raiserror('Visitor already present',1 ,1)
	return 0
end

/* insert into Visitor*/
insert into hospital_management.visitors
(
visitorID, visitorFirstName, visitorLastName, patientID,patientFirstName, patientLastName
)
values
(
@visitorID, @visitorFirstName, @visitorLastName, @patientID, @patientFirstName, @patientLastName
)

/*check whether inserted record returned or not*/
If @@ROWCOUNT =1
	return 1
else
	return 0
end

go
go


exec Multiple_insertion2 '1001','2001','101','Emily', 'Osment','David', 'Mark', 'Julia','Bosh'

exec Multiple_insertion2 '1002','2002','102',null, null,null,null, 'Joe','Ogando'

exec Multiple_insertion2 '1003','2003','103',null, null,null,null, 'Lewis','Macaskill'

exec Multiple_insertion2 '1004','2004','104',null, null,null,null, 'Thaise','Patrone'

exec Multiple_insertion2 '1005','2005','105',null, null,null,null, 'Maria','Ramirez'

exec Multiple_insertion2 '1006','2006','106','Riah',null, null,null,null, 'Gaberiella','Ogando'

exec Multiple_insertion2 '1007','2007','107','Milia', 'Sandres','George', 'Richardson', 'Scarlett','Gates'

exec Multiple_insertion2 '1008','2008','108',null, null,null,null, 'Mirinda','Ruarez'

exec Multiple_insertion2 '1009','2009','109','Cassey', 'Cabello','Zayn', 'William', 'Christopher','Patrone'

exec Multiple_insertion2 '1010','2010','110','Nina', 'Demello','Josh', 'Bennigton', 'Zee','Weiner'

select * from hospital_management.visitors;

/*
-----
Procedure for populating bill
*/

go
create procedure bill_calculation
@pid int

as 
begin
declare @inpat_id int;
IF exists(select patientID from hospital_management.inpatient where patientID = @pid)
begin
	update hospital_management.bill 
	set patientType = 'inpatient'
	where patientId = @pid
	if(@pid = 101)
		update hospital_management.bill 
		set labCharge = 800, doctorCharge = 500, advance = 200 , nursingCharge =200,
		numberOfDays = 7 , operationCharge = 700 , roomCharge = 20, medicineCharge = 300
		where patientId = @pid
	if(@pid = 107)
		update hospital_management.bill 
		set labCharge = 700, doctorCharge = 400, advance = 200 , nursingCharge =100,
		numberOfDays = 6 , operationCharge = 600 , roomCharge = 17, medicineCharge = 400
		where patientId = @pid
	if(@pid = 108)
		update hospital_management.bill 
		set labCharge = 1000, doctorCharge = 500, advance = 200 , nursingCharge =200,
		numberOfDays = 8 , operationCharge = 600 , roomCharge = 20, medicineCharge = 500
		where patientId = @pid
	if(@pid = 109)
		update hospital_management.bill 
		set labCharge = 500, doctorCharge = 500, advance = 200 , nursingCharge =150,
		numberOfDays = 4 , operationCharge = 800 , roomCharge = 18, medicineCharge = 450
		where patientId = @pid
	if(@pid = 110)
		update hospital_management.bill 
		set labCharge = 680, doctorCharge = 590, advance = 200 , nursingCharge =100,
		numberOfDays = 5 , operationCharge = 650 , roomCharge = 15, medicineCharge = 400
		where patientId = @pid
end
else
begin
	update hospital_management.bill 
	set patientType = 'outpatient', labCharge = 400, doctorCharge = 500
	where patientId = @pid
end
end

execute bill_calculation '110'
select * from hospital_management.bill

/*
----
Total  Bill of the patient
----
*/

go
create procedure total_bill_calculation
@pid int

as
begin
declare @billNu int;
declare @lab_ch int;
declare @doc_ch int;
declare @advance int;
declare @health_ins int;
declare @nurse_ch int;
declare @no_of_days int;
declare @oper_ch int;
declare @room_ch int;
declare @med_ch int;

select @billNu = billNumber, @lab_ch = labCharge, @doc_ch =doctorCharge, @health_ins =healthInsurance,
@nurse_ch = nursingCharge, @no_of_days =numberOfDays, @oper_ch = operationCharge , @room_ch = roomCharge,
@med_ch = medicineCharge from hospital_management.bill where patientId =@pid

update hospital_management.bill
set bill = @health_ins - (@lab_ch + @doc_ch + @nurse_ch + (7*@room_ch) + @oper_ch + @med_ch)
where patientId =@pid

END



EXECUTE total_bill_calculation '110'
select * from hospital_management.bill


