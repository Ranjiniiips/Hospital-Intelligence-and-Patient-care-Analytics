-- Hospital Intelligence & Patient Care Analytics
-- Day 1: Patient Basic Analysis

USE hospital_analytics;

-- 1. Display all patients
SELECT *
FROM patients;

-- 2. Display selected columns
SELECT patient_name, age, city
FROM patients;

-- 3. Find patients from Bangalore
SELECT *
FROM patients
WHERE city = 'Bangalore';

-- 4. Find patients older than 50
SELECT *
FROM patients
WHERE age > 50;

-- 5. Find female patients
SELECT *
FROM patients
WHERE gender = 'Female';

-- 6. Find male patients from Bangalore
SELECT *
FROM patients
WHERE gender = 'Male'
AND city = 'Bangalore';

-- 7. Find patients younger than 40
SELECT *
FROM patients
WHERE age < 40;

-- 8. Find female patients aged 60 or above
SELECT *
FROM patients
WHERE gender = 'Female'
AND age >= 60;

-- 9. Find patients who are not from Chennai
SELECT *
FROM patients
WHERE city <> 'Chennai';

-- 10. Find patients aged between 30 and 60
SELECT *
FROM patients
WHERE age BETWEEN 30 AND 60;

-- 11. Find unique cities
SELECT DISTINCT city
FROM patients;

-- 12. Find unique blood groups
SELECT DISTINCT blood_group
FROM patients;

-- 13. Find unique genders
SELECT DISTINCT gender
FROM patients;
