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

-- ============================================================
-- Hospital Intelligence & Patient Care Analytics
-- File: 03_sorting_filtering.sql
-- Topic: ORDER BY, ASC, DESC, BETWEEN, LIMIT
-- ============================================================

USE hospital_analytics;


-- ============================================================
-- 1. Sort patients from youngest to oldest
-- ============================================================

SELECT patient_name, age, city
FROM patients
ORDER BY age ASC;


-- ============================================================
-- 2. Sort patients from oldest to youngest
-- ============================================================

SELECT patient_name, age, city
FROM patients
ORDER BY age DESC;


-- ============================================================
-- 3. Find patients aged between 30 and 60
-- BETWEEN includes both 30 and 60
-- ============================================================

SELECT patient_name, age, city
FROM patients
WHERE age BETWEEN 30 AND 60;


-- ============================================================
-- 4. Display the first 5 patients
-- ============================================================

SELECT *
FROM patients
LIMIT 5;


-- ============================================================
-- 5. Find the 3 oldest patients
-- ============================================================

SELECT patient_name, age, city
FROM patients
ORDER BY age DESC
LIMIT 3;


-- ============================================================
-- 6. Find the 3 youngest patients
-- ============================================================

SELECT patient_name, age, city
FROM patients
ORDER BY age ASC
LIMIT 3;


-- ============================================================
-- 7. Sort patient names alphabetically
-- ============================================================

SELECT patient_name, age, city
FROM patients
ORDER BY patient_name ASC;


-- ============================================================
-- 8. Find female patients aged between 30 and 60
-- ============================================================

SELECT patient_name, age, city
FROM patients
WHERE gender = 'Female'
AND age BETWEEN 30 AND 60;


-- ============================================================
-- 9. Find the 3 oldest female patients
-- ============================================================

SELECT patient_name, age, city
FROM patients
WHERE gender = 'Female'
ORDER BY age DESC
LIMIT 3;


-- ============================================================
-- 10. Find the 3 oldest female patients from Bangalore
-- Project analysis query
-- ============================================================

SELECT patient_name, age, city
FROM patients
WHERE gender = 'Female'
AND city = 'Bangalore'
ORDER BY age DESC
LIMIT 3;

SELECT COUNT(*) AS total_patients
FROM patients;

SELECT ROUND(AVG(age), 2) AS average_patient_age
FROM patients;

SELECT MIN(age) AS youngest_patient_age
FROM patients;

SELECT MAX(age) AS oldest_patient_age
FROM patients;

SELECT COUNT(*) AS female_patients
FROM patients
WHERE gender = 'Female';

SELECT COUNT(*) AS male_patients
FROM patients
WHERE gender = 'Male';
