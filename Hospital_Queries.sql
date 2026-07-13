SELECT *
FROM Doctors;

SELECT *
FROM Patients;

SELECT *
FROM appointments;

SELECT *
FROM bills;

SELECT *
FROM treatments;

-- Total number of Patient
SELECT COUNT(*) 
FROM patients;

-- Male Vs Female Patient
SELECT Gender, COUNT(*) 
FROM patients
GROUP BY Gender;

-- Average Patient Age
SELECT AVG(Age) AS Average_Age
FROM patients;

-- Patients from each city
SELECT City, COUNT(*) AS NO_Of_Patient
FROM patients
GROUP BY City
ORDER BY NO_Of_Patient
;

-- Oldest Patient
SELECT *
FROM patients
ORDER BY Age Desc
LIMIT 1
;

-- Numbers of doctors in each departments
SELECT DISTINCT Department, COUNT(*) AS NO_OF_DOCTORS
FROM doctors
GROUP BY Department
ORDER BY 2 ;

-- Highest consultation fee
SELECT MAX(Consultance_Fee) AS Highest_Consultaion_Fee
FROM doctors;

-- Most experienced doctor
SELECT *
FROM doctors
ORDER BY Experience DESC
LIMIT 1;

-- Average consultation fee
SELECT AVG(Consultance_Fee) AS Avg_Cons_Fee
FROM doctors;

-- Doctors with more than 4 appointments
SELECT Doctor_Name, COUNT(Appointment_id) AS More_Appointments
FROM doctors
JOIN appointments
	ON doctors.Doctor_Id = appointments.Doctor_Id
GROUP BY Doctor_Name
HAVING More_Appointments >=4
;

-- Total appointments
SELECT COUNT(*) AS Total_Appointments
FROM appointments;

-- Completed appointments
SELECT *
FROM appointments
WHERE `Status` = 'completed';

-- Cancelled Appointments
SELECT *
FROM appointments
WHERE Status = 'rescheduled'
	OR Status = 'no show'
;

-- Monthly appointments trend
SELECT MONTH(Appointment_Date) AS months, COUNT(*) AS NO_OF_Appointment
FROM appointments
GROUP BY MONTHS
ORDER BY 1,2;

-- Busiest day of the week
SELECT DAYNAME(Appointment_Date), COUNT(*) AS No_of_Patients
FROM appointments
GROUP BY DAYNAME(Appointment_Date)
HAVING COUNT(*) = (
	SELECT MAX(No_of_Patients)
    FROM (
    SELECT COUNT(*) AS No_of_Patients
    FROM appointments
    GROUP BY DAYNAME(Appointment_Date)
    ) AS Patient_that_day
    )
;

-- Most common disease
SELECT Disease, COUNT(*) AS total_cases
FROM treatments
group by Disease
HAVING COUNT(*) = (
	SELECT MAX(total_cases)
    FROM (
		SELECT COUNT(*) AS total_cases
		FROM treatments
		GROUP BY Disease
		) AS disease_count
    );

-- Average medicine cost
SELECT DISTINCT Disease, AVG(Medicine_cost) 
FROM treatments
GROUP BY Disease
ORDER BY AVG(Medicine_cost) DESC;

-- Most expensive treatment
SELECT Disease, Medicine_cost
FROM treatments
ORDER BY Medicine_cost DESC
LIMIT 1;

-- No of patient treated by each doctor
SELECT Doctor_Name, COUNT(*) AS no_of_patients
FROM treatments
JOIN appointments
	ON treatments.Appointment_id = appointments.Appointment_id
JOIN doctors
	ON appointments.Doctor_Id = doctors.Doctor_Id
GROUP BY Doctor_Name
;

-- Total hospital revenue
SELECT SUM(Medicine_cost + Room_Charge + Doctor_fee) AS Total_HP_revenue
FROM bills
JOIN appointments
	ON bills.Appointment_id = appointments.Appointment_id
JOIN treatments
	ON treatments.Appointment_id = appointments.Appointment_id
;

-- Average bill amount
SELECT AVG(Medicine_cost + Room_charge + Doctor_fee) AS avg_bill
FROM bills
JOIN appointments
	ON bills.Appointment_id = appointments.Appointment_id
JOIN treatments
	ON treatments.Appointment_id = appointments.Appointment_id
;

-- Revenue by department
SELECT Department, SUM(Medicine_cost + Room_charge + Doctor_fee + Consultance_Fee) AS REV_DEPARTMENT
FROM bills
JOIN appointments
	ON bills.Appointment_id = appointments.Appointment_id
JOIN treatments
	ON appointments.Appointment_id = treatments.Appointment_id
JOIN doctors
	ON appointments.Doctor_Id = doctors.Doctor_Id
GROUP BY Department
ORDER BY REV_DEPARTMENT DESC
;

-- Highest Paying Patient
SELECT Patient_Name, SUM(Medicine_cost + Room_charge + Doctor_fee + Consultance_Fee) AS PAYMENT
FROM bills
JOIN appointments
	ON bills.Appointment_id = appointments.Appointment_id
JOIN treatments
	ON appointments.Appointment_id = treatments.Appointment_id
JOIN doctors
	ON appointments.Doctor_Id = doctors.Doctor_Id
JOIN patients
	ON appointments.Patient_Id = patients.Patient_Id
GROUP BY Patient_Name
ORDER BY PAYMENT DESC
LIMIT 1
;

-- Unpaid bills
SELECT SUM(Room_Charge + Doctor_fee) AS Unpaid_bills
FROM bills
WHERE Payment_Status = 'Pending'
	OR Payment_Status = 'Incomplete'
;    