CREATE DATABASE ICUManagementSystem;
use ICUManagementSystem

CREATE TABLE Patients(
PatientID int primary key,
Name varchar(50),
Age int,
Gender varchar(10),
Address varchar(100),
Phone int,
AdmissionDate Date
);

CREATE TABLE Billing(
BillID int primary key,
Amount int,
Status varchar(20),
BillingDate Date,
PatientID int
Foreign key(PatientID) references Patients(PatientID)
);

CREATE TABLE Insurance(
InsuranceID int primary key,
Provider varchar(50),
PolicyNumber int,
CoverageAmount int,
ExpirationDate Date,
PatientID int
Foreign key (PatientID) references Patients(PatientID)
);

CREATE TABLE LabTest(
TestID int,
TestType varchar(10),
Result varchar(10),
TestDate Date,
PatientID int,
Foreign key (PatientID) references Patients(PatientID)
);

Drop Table LabTest;

Create Table EmergencyContact(
ContactID int primary key,
Name varchar(50),
Relation varchar(20),
Phone int,
PatientID int,
Foreign key (PatientID) references Patients(PatientID)
);

CREATE TABLE LabTest(
TestID int primary key,
TestType varchar(10),
Result varchar(10),
TestDate Date,
PatientID int,
Foreign key (PatientID) references Patients(PatientID)
);

CREATE TABLE ICURoom(
RoomID int primary key,
RoomNumber int,
Availability varchar(10),
PatientID int
Foreign key (PatientID) references Patients(PatientID)
);

CREATE TABLE FamilyMember(
PatientID int primary key,
Name varchar(50),
Relation varchar(20),
phone int
Foreign key (PatientID) references Patients(PatientID)
);

CREATE TABLE Doctors(
DoctorID int primary key,
Name varchar(50),
Speciality varchar(20),
Phone int,
Email varchar(100)
);

CREATE TABLE Surgery(
SurgeryID int primary key,
SurgeryType varchar(50),
SurgeryDate Date,
Outcome varchar(30),
DoctorID int,
PatientID int,
Foreign key(DoctorID) references Doctors(DoctorID),
Foreign key (PatientID) references Patients(PatientID)
);

CREATE TABLE Prescription(
PrescriptionID int primary key,
Medication varchar(30),
Dosage int,
StartDate Date,
EndDate Date,
DoctorID int,
PatientID int,
Foreign key(DoctorID) references Doctors(DoctorID),
Foreign key (PatientID) references Patients(PatientID)
);

CREATE TABLE Appointment(
AppointmentID int primary key,
Date Date,
purpose varchar(30),
DoctorID int,
PatientID int,
Foreign key(DoctorID) references Doctors(DoctorID),
Foreign key (PatientID) references Patients(PatientID)
);

CREATE TABLE Nurse(
NurseID int primary key,
Name varchar(50),
Shift varchar(20),
Phone int
);

CREATE TABLE Monitoring(
MonitorID int primary key,
HeartRate int,
BP int,
DateTime DATETIME,
NurseID int,
PatientID int,
Foreign key (NurseID) references Nurse(NurseID),
Foreign key (PatientID) references Patients(PatientID)
);

ALTER TABLE Patients
ALTER COLUMN Phone VARCHAR(15);

ALTER TABLE EmergencyContact
ALTER COLUMN Phone VARCHAR(15);

ALTER TABLE Doctors
ALTER COLUMN Phone VARCHAR(15);

ALTER TABLE FamilyMember
ALTER COLUMN Phone VARCHAR(15);

ALTER TABLE Nurse
ALTER COLUMN Phone VARCHAR(15);

INSERT INTO Patients  VALUES
(1, 'John Doe', 45, 'Male', '123 Main St', 1111111111, '2025-05-01'),
(2, 'Jane Smith', 30, 'Female', '456 Elm St', 2222222222, '2025-05-02'),
(3, 'Mike Johnson', 60, 'Male', '789 Oak St', 3333333333, '2025-05-03'),
(4, 'Emily Davis', 28, 'Female', '321 Pine Ave', 4444444444, '2025-05-04'),
(5, 'Robert Brown', 50, 'Male', '654 Cedar Rd', 5555555555, '2025-05-05'),
(6, 'Linda Wilson', 35, 'Female', '987 Birch Blvd', 6666666666, '2025-05-06'),
(7, 'David Lee', 42, 'Male', '159 Walnut Ln', 7777777777, '2025-05-07'),
(8, 'Sarah Kim', 27, 'Female', '753 Chestnut Dr', 8888888888, '2025-05-08'),
(9, 'James White', 33, 'Male', '852 Poplar St', 9999999999, '2025-05-09'),
(10, 'Karen Harris', 40, 'Female', '951 Maple Ct', 1010101010, '2025-05-10'),
(11, 'Paul Martinez', 55, 'Male', '159 Spruce Ave', 1212121212, '2025-05-11'),
(12, 'Nancy Clark', 48, 'Female', '753 Cypress Ln', 1313131313, '2025-05-12'),
(13, 'Steven Walker', 38, 'Male', '357 Fir Rd', 1414141414, '2025-05-13'),
(14, 'Laura Hall', 29, 'Female', '258 Aspen Way', 1515151515, '2025-05-14'),
(15, 'George Allen', 62, 'Male', '654 Redwood Blvd', 1616161616, '2025-05-15');

SELECT * FROM Patients;

INSERT INTO Billing  VALUES
(1001, 4500, 'Paid', '2025-05-01', 1),
(1002, 3000, 'Unpaid', '2025-05-02', 2),
(1003, 5200, 'Paid', '2025-05-03', 3),
(1004, 2700, 'Unpaid', '2025-05-04', 4),
(1005, 6100, 'Paid', '2025-05-05', 5),
(1006, 4900, 'Paid', '2025-05-06', 6),
(1007, 3200, 'Unpaid', '2025-05-07', 7),
(1008, 5300, 'Paid', '2025-05-08', 8),
(1009, 3900, 'Unpaid', '2025-05-09', 9),
(1010, 4700, 'Paid', '2025-05-10', 10),
(1011, 5800, 'Unpaid', '2025-05-11', 11),
(1012, 3600, 'Paid', '2025-05-12', 12),
(1013, 4200, 'Paid', '2025-05-13', 13),
(1014, 3400, 'Unpaid', '2025-05-14', 14),
(1015, 5100, 'Paid', '2025-05-15', 15);


INSERT INTO Insurance  VALUES
(2001, 'Guardian Life', 100101, 10000, '2026-05-01', 1),
(2002, 'MetLife', 100102, 15000, '2026-05-02', 2),
(2003, 'Delta Health', 100103, 12000, '2026-05-03', 3),
(2004, 'Prudential', 100104, 9000, '2026-05-04', 4),
(2005, 'StateCare', 100105, 11000, '2026-05-05', 5),
(2006, 'SunLife', 100106, 13000, '2026-05-06', 6),
(2007, 'Aetna', 100107, 14000, '2026-05-07', 7),
(2008, 'BlueCross', 100108, 10000, '2026-05-08', 8),
(2009, 'Humana', 100109, 9500, '2026-05-09', 9),
(2010, 'Cigna', 100110, 10500, '2026-05-10', 10),
(2011, 'UnitedHealth', 100111, 12500, '2026-05-11', 11),
(2012, 'WellCare', 100112, 8800, '2026-05-12', 12),
(2013, 'Allianz', 100113, 11700, '2026-05-13', 13),
(2014, 'Liberty Mutual', 100114, 10200, '2026-05-14', 14),
(2015, 'Transamerica', 100115, 13500, '2026-05-15', 15);

ALTER TABLE LabTest
ALTER COLUMN TestType varchar(50);
ALTER TABLE LabTest
ALTER COLUMN Result varchar(50);

INSERT INTO LabTest VALUES
(3001, 'Blood Test', 'Normal', '2025-05-01', 1),
(3002, 'X-Ray', 'Clear', '2025-05-02', 2),
(3003, 'MRI', 'No Issues', '2025-05-03', 3),
(3004, 'CT Scan', 'Minor Issue', '2025-05-04', 4),
(3005, 'ECG', 'Normal', '2025-05-05', 5),
(3006, 'Blood Test', 'Low Iron', '2025-05-06', 6),
(3007, 'X-Ray', 'Fracture', '2025-05-07', 7),
(3008, 'MRI', 'Normal', '2025-05-08', 8),
(3009, 'CT Scan', 'Clear', '2025-05-09', 9),
(3010, 'ECG', 'Irregular', '2025-05-10', 10),
(3011, 'Blood Test', 'Normal', '2025-05-11', 11),
(3012, 'X-Ray', 'Clear', '2025-05-12', 12),
(3013, 'MRI', 'Minor Lesion', '2025-05-13', 13),
(3014, 'CT Scan', 'Normal', '2025-05-14', 14),
(3015, 'ECG', 'Normal', '2025-05-15', 15);


INSERT INTO EmergencyContact VALUES
(101, 'John Doe', 'Father', 1234567890, 1),
(102, 'Jane Smith', 'Mother', 2345678901, 2),
(103, 'Alice Brown', 'Sister', 3456789012, 3),
(104, 'Bob White', 'Brother', 4567890123, 4),
(105, 'Charlie Green', 'Friend', 5678901234, 5),
(106, 'David Black', 'Uncle', 6789012345, 6),
(107, 'Emily Johnson', 'Aunt', 7890123456, 7),
(108, 'Frank Harris', 'Cousin', 8901234567, 8),
(109, 'Grace Taylor', 'Wife', 9012345678, 9),
(110, 'Henry Miller', 'Husband', 1234509876, 10),
(111, 'Ivy Clark', 'Daughter', 2345610987, 11),
(112, 'Jack Lewis', 'Father', 3456721098, 12),
(113, 'Kathy Walker', 'Mother', 4567832109, 13),
(114, 'Liam Hall', 'Brother', 5678943210, 14),
(115, 'Mona Scott', 'Friend', 6789054321, 15);

INSERT INTO FamilyMember VALUES
(1, 'Mark Turner', 'Father', 1234567890),
(2, 'Lisa Parker', 'Mother', 2345678901),
(3, 'Robert King', 'Brother', 3456789012),
(4, 'Sophia Miller', 'Sister', 4567890123),
(5, 'James Wilson', 'Father', 5678901234),
(6, 'Olivia Brown', 'Mother', 6789012345),
(7, 'Ethan Davis', 'Brother', 7890123456),
(8, 'Ava Martinez', 'Sister', 8901234567),
(9, 'Lucas Harris', 'Husband', 9012345678),
(10, 'Mia Clark', 'Wife', 1234509876),
(11, 'Noah Allen', 'Father', 2345610987),
(12, 'Amelia Young', 'Mother', 3456721098),
(13, 'William Walker', 'Brother', 4567832109),
(14, 'Benjamin Moore', 'Sister', 5678943210),
(15, 'Charlotte Taylor', 'Daughter', 6789054321);

INSERT INTO Doctors VALUES
(16, 'Dr. John Smith', 'Cardiology', 1234567890, 'john.smith@hospital.com'),
(17, 'Dr. Emily Davis', 'Neurology', 2345678901, 'emily.davis@hospital.com'),
(18, 'Dr. Robert Wilson', 'Orthopedics', 3456789012, 'robert.wilson@hospital.com'),
(19, 'Dr. Sarah Johnson', 'Pediatrics', 4567890123, 'sarah.johnson@hospital.com'),
(20, 'Dr. Michael Brown', 'Dermatology', 5678901234, 'michael.brown@hospital.com'),
(21, 'Dr. Olivia Taylor', 'General Surgery', 6789012345, 'olivia.taylor@hospital.com'),
(22, 'Dr. David Miller', 'Psychiatry', 7890123456, 'david.miller@hospital.com'),
(23, 'Dr. Laura White', 'Gynecology', 8901234567, 'laura.white@hospital.com'),
(24, 'Dr. James Clark', 'Anesthesia', 9012345678, 'james.clark@hospital.com'),
(25, 'Dr. Alice Harris', 'Radiology', 1234509876, 'alice.harris@hospital.com'),
(26, 'Dr. Benjamin Lee', 'Gastroenterology', 2345610987, 'benjamin.lee@hospital.com'),
(27, 'Dr. Charlotte Walker', 'Oncology', 3456721098, 'charlotte.walker@hospital.com'),
(28, 'Dr. William Allen', 'Endocrinology', 4567832109, 'william.allen@hospital.com'),
(29, 'Dr. Grace Scott', 'Ophthalmology', 5678943210, 'grace.scott@hospital.com'),
(30, 'Dr. Samuel Martin', 'Nephrology', 6789054321, 'samuel.martin@hospital.com');

INSERT INTO Surgery VALUES
(201, 'Heart Bypass', '2025-01-18', 'Successful', 16, 1),
(202, 'Hip Replacement', '2025-02-12', 'Complications', 17, 2),
(203, 'Spinal Fusion', '2025-03-08', 'Recovery Ongoing', 18, 3),
(204, 'Appendectomy', '2025-03-20', 'Successful', 19, 4),
(205, 'Cataract Surgery', '2025-04-05', 'Successful', 20, 5),
(206, 'C-section Delivery', '2025-04-12', 'Successful', 21, 6),
(207, 'Gallbladder Surgery', '2025-05-04', 'Recovery Ongoing', 22, 7),
(208, 'Knee Arthroscopy', '2025-05-18', 'Successful', 23, 8),
(209, 'Hernia Surgery', '2025-06-02', 'Successful', 24, 9),
(210, 'Neurosurgery', '2025-06-15', 'Successful', 25, 10),
(211, 'Liver Transplant', '2025-07-03', 'Complications', 26, 11),
(212, 'Brain Tumor Removal', '2025-07-14', 'Successful', 27, 12),
(213, 'Breast Cancer Removal', '2025-08-05', 'Successful', 28, 13),
(214, 'Bariatric Surgery', '2025-08-20', 'Successful', 29, 14),
(215, 'Prostatectomy', '2025-09-02', 'Recovery Ongoing', 30, 15);

INSERT INTO Prescription VALUES
(301, 'Aspirin', 100, '2025-01-15', '2025-02-15', 16, 1),
(302, 'Ibuprofen', 200, '2025-02-10', '2025-03-10', 17, 2),
(303, 'Amoxicillin', 500, '2025-03-05', '2025-03-20', 18, 3),
(304, 'Paracetamol', 500, '2025-03-15', '2025-04-15', 19, 4),
(305, 'Metformin', 1000, '2025-04-01', '2025-06-01', 20, 5),
(306, 'Insulin', 20, '2025-04-10', '2025-05-10', 21, 6),
(307, 'Lisinopril', 10, '2025-05-01', '2025-06-01', 22, 7),
(308, 'Furosemide', 40, '2025-05-15', '2025-06-15', 23, 8),
(309, 'Prednisone', 5, '2025-06-01', '2025-07-01', 24, 9),
(310, 'Omeprazole', 20, '2025-06-10', '2025-07-10', 25, 10),
(311, 'Simvastatin', 40, '2025-07-01', '2025-08-01', 26, 11),
(312, 'Gabapentin', 300, '2025-07-10', '2025-08-10', 27, 12),
(313, 'Hydrochlorothiazide', 25, '2025-08-01', '2025-09-01', 28, 13),
(314, 'Levothyroxine', 50, '2025-08-15', '2025-09-15', 29, 14),
(315, 'Cetirizine', 10, '2025-09-01', '2025-10-01', 30, 15);

INSERT INTO ICURoom VALUES
(500, 5000, 'Occupied', 1),
(501, 5001, 'Available', 2),
(502, 5002, 'Occupied', 3),
(503, 5003, 'Available', 4),
(504, 5004, 'Occupied', 5),
(505, 5005, 'Available', 6),
(506, 5006, 'Occupied', 7),
(507, 5007, 'Available', 8),
(508, 5008, 'Occupied', 9),
(509, 5009, 'Available', 10),
(510, 5010, 'Occupied', 11),
(511, 5011, 'Available', 12),
(512, 5012, 'Occupied', 13),
(513, 5013, 'Available', 14),
(514, 5014, 'Occupied', 15);

INSERT INTO Appointment VALUES
(401, '2025-01-10', 'Routine Checkup', 16, 1),
(402, '2025-02-15', 'Follow-up Consultation', 17, 2),
(403, '2025-03-20', 'Emergency Care', 18, 3),
(404, '2025-04-05', 'Routine Checkup', 19, 4),
(405, '2025-05-10', 'Health Screening', 20, 5),
(406, '2025-06-15', 'Follow-up Consultation', 21, 6),
(407, '2025-07-01', 'Routine Checkup', 22, 7),
(408, '2025-08-10', 'Pre-Surgery Consultation', 23, 8),
(409, '2025-09-05', 'Post-Surgery Follow-up', 24, 9),
(410, '2025-10-20', 'Routine Checkup', 25, 10),
(411, '2025-11-15', 'Emergency Care', 26, 11),
(412, '2025-12-10', 'Health Screening', 27, 12),
(413, '2026-01-05', 'Follow-up Consultation', 28, 13),
(414, '2026-02-15', 'Routine Checkup', 29, 14),
(415, '2026-03-25', 'Post-Surgery Follow-up', 30, 15);

INSERT INTO Nurse VALUES
(75, 'Alice Johnson', 'Morning', '1234567890'),
(76, 'Bob Williams', 'Evening', '1234567891'),
(77, 'Charlie Smith', 'Night', '1234567892'),
(78, 'Diana Brown', 'Morning', '1234567893'),
(79, 'Eva White', 'Evening', '1234567894'),
(80, 'Frank Harris', 'Night', '1234567895'),
(81, 'Grace Martin', 'Morning', '1234567896'),
(82, 'Henry Clark', 'Evening', '1234567897'),
(83, 'Ivy Lewis', 'Night', '1234567898'),
(84, 'Jack Young', 'Morning', '1234567899'),
(85, 'Kara King', 'Evening', '1234567800'),
(86, 'Liam Scott', 'Night', '1234567801'),
(87, 'Mia Hall', 'Morning', '1234567802'),
(88, 'Nathan Allen', 'Evening', '1234567803'),
(89, 'Olivia Adams', 'Night', '1234567804');

INSERT INTO Monitoring VALUES 
(700, 75, 120, '2025-05-08 08:00:00', 75, 1),
(701, 80, 125, '2025-05-08 09:00:00', 76, 2),
(702, 78, 118, '2025-05-08 10:00:00', 77, 3),
(703, 82, 130, '2025-05-08 11:00:00', 78, 4),
(704, 77, 122, '2025-05-08 12:00:00', 79, 5),
(705, 74, 119, '2025-05-08 13:00:00', 80, 6),
(706, 79, 128, '2025-05-08 14:00:00', 81, 7),
(707, 76, 115, '2025-05-08 15:00:00', 82, 8),
(708, 81, 126, '2025-05-08 16:00:00', 83, 9),
(709, 75, 120, '2025-05-08 17:00:00', 84, 10),
(710, 79, 132, '2025-05-08 18:00:00', 85, 11),
(711, 80, 125, '2025-05-08 19:00:00', 86, 12),
(712, 78, 118, '2025-05-08 20:00:00', 87, 13),
(713, 83, 128, '2025-05-08 21:00:00', 88, 14),
(714, 76, 122, '2025-05-08 22:00:00', 89, 15);

SELECT * FROM Doctors;
