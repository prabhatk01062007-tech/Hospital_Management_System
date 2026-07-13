CREATE DATABASE hospital_db;
USE hospital_db;

CREATE TABLE Patients(
Patient_Id INT PRIMARY KEY,
Patient_Name varchar(100),
Age INT,
Gender varchar(30),
City varchar(30),
`Number` varchar(50)
);

CREATE TABLE Doctors(
Doctor_Id INT PRIMARY KEY,
Doctor_Name VARCHAR(100),
Department VARCHAR(50),
Experience INT,
Consultance_Fee DECIMAL(10,2)
);

CREATE TABLE Appointments(
Appointment_id INT PRIMARY KEY,
Patient_Id INT,
Doctor_Id INT,
Appointment_Date DATE,
`Status` varchar(30),
FOREIGN KEY(Patient_Id ) REFERENCES Patients(Patient_Id),
FOREIGN KEY(Doctor_Id ) REFERENCES Doctors(Doctor_Id)
);

CREATE TABLE Treatments(
Treatment_Id INT PRIMARY KEY,
Appointment_id INT,
Disease varchar(50),
`Status` varchar(30),
Medicine_cost DECIMAL(10,2),
FOREIGN KEY(Appointment_id) REFERENCES Appointments(Appointment_id)
);

CREATE TABLE BILLS(
Bill_Id INT PRIMARY KEY,
Appointment_id INT,
Room_Charge DECIMAL(10,2),
Doctor_fee DECIMAL(10,2),
Payment_Status VARCHAR(30),
FOREIGN KEY(Appointment_id) REFERENCES Appointments(Appointment_id)
);

INSERT INTO Patients
VALUES
	(101, "Prabhat Kumar", 19, "M", "Hilsa", 7827703484),
    (102, "Shreya Sinha", 20, "F", "Samastipur", 8956748398),
    (103, "Pushp Kumar", 20, "M", "Samastipur", 5634876453 ),
    (104, "Rishu Kumar", 19, "M", "Hilsa", 6534982156),
    (105, "Divya Kumari", 20, "F", "Hilsa", 9123239050),
    (106, "Ankit Srivastva", 35, "M", "Mumbai", 6746738263),
    (107, "Raju Mistri", 49, "M", "Patna", 7827707684),
    (108, "Sudhansu Rajput", 39, "M", "Jaipur", 9827703484),
    (109, "Riya Rajput", 19, "F", "Hilsa", 7827703498),
    (110, "Piyush Kumar", 21, "M", "Sitamarhi", 7667703484),
    (111, "Pramesh Anand", 21, "M", "Bhagalpur", 7827712484),
    (112, "Ankit kumar", 19, "M","Sitamarhi", 7827708884),
    (113, "Chandan Kumar", 19, "M", "Hilsa", 5827703484),
    (114, "Anand Gupta", 19, "M", "Buxar", 7827701284),
    (115, "Shalulu Sinha", 20, "F", "Jaipur", 7827703484);
    
INSERT INTO DOCTORS
VALUES
	(01, "Dr Ajay Sinha", "Surgion", 3, 100),
    (02, "Dr Prince Singh", "Surgion", 5, 300),
    (03, "Dr Subham Chaubey", "Gyenecologist", 3, 1000),
    (04, "Dr Riya Mishra", "Dentist", 2, 500);

INSERT INTO Appointments
VALUES 
	(2501, 101, 01, '2026-05-25', 'pending'),
    (2502, 102, 04, '2026-05-23', 'completed'),
    (2503, 103, 02, '2026-5-14', 'completed'),
    (2504, 104, 02, '2026-05-24', 'rescheduled'),
    (2505, 105, 03, '2026-06-07', 'rescheduled'),
    (2506, 106, 02, '2026-1-05', 'pending'),
    (2507, 107, 04, '2026-05-02', 'no show'),
    (2508, 108, 04, '2026-07-11', 'completed'),
    (2509, 109, 03, '2026-01-22', 'completed'),
    (2510, 110, 04, '2026-6-23', 'completed'),
    (2511, 111, 01, '2026-02-20', 'completed'),
    (2512, 112, 02, '2026-05-03', 'completed'),
    (2513, 113, 01, '2026-05-03', 'pending'),
    (2514, 114, 02, '2026-05-02', 'no show'),
    (2515, 115, 03, '2026-05-15', 'completed');
    

INSERT INTO Treatments
VALUES
	(9001, 2501, 'Typhoid', 'Completed', 10000),
    (9002, 2502, 'Mouth Pain', 'Completed', 50),
    (9003, 2503, 'Malaria', 'Ongoing', 1000),
    (9004, 2504, 'Fever', 'Completed', 1000),
    (9005, 2505, 'Cervicitis', 'Ongoing', 70000),
    (9006, 2506, 'Cancer', 'Completed', 400000),
    (9007, 2507, 'Dental Cavity', 'Completed', 3000),
    (9008, 2508, 'Denta cavity', 'Completed', 3000),
    (9009, 2509, 'Cervicitis', 'Ongoing', 90000),
    (9010, 2510, 'Tooth Abscess', 'Ongoing', 1000),
    (9011, 2511, 'Cough','Completed', 100),
    (9012, 2512, 'Leg injury', 'Ongoing', 10000),
    (9013, 2513, 'Finger injury', 'Completed', 10000),
    (9014, 2514, 'Fever', 'Completed', 500),
    (9015, 2515, 'Cervicitis', 'Completed', 10000);

INSERT INTO Bills
VALUES
	(401, 2501, 300, 100, 'Pending'),
    (402, 2502, 100, 100, 'Completed'),
    (403, 2503, 500, 100, 'Completed'),
    (404, 2504, 600, 100, 'Completed'),
    (405, 2505, 900, 100, 'Completed'),
    (406, 2506, 100, 100, 'Completed'),
    (408, 2508, 800, 100, 'Pending'),
    (409, 2509, 700, 100, 'Completed'),
    (410, 2510, 500, 100, 'Completed'),
    (411, 2511, 400, 100, 'Completed'),
    (412, 2512, 200, 100, 'Completed'),
    (413, 2513, 700, 100, 'Completed'),
    (414, 2514, 500, 100, 'Pending'),
    (415, 2515, 100, 100, 'Pending');