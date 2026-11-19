Hospital Intelligence & Patient Care Analytics
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

SELECT 
city,
COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC;

SELECT 
blood_group,
COUNT(*) AS total_patients
FROM patients
GROUP BY blood_group
ORDER BY total_patients DESC;

SELECT 
blood_group,
COUNT(*) AS total_patients
FROM patients
GROUP BY blood_group
ORDER BY total_patients DESC;

SELECT 
city,
COUNT(*) AS total_patients
FROM patients
GROUP BY city
HAVING COUNT(*) > 2;

SELECT COUNT(DISTINCT city) AS unique_cities
FROM patients;

SELECT COUNT(DISTINCT blood_group) AS unique_blood_groups
FROM patients;

SELECT DISTINCT city
FROM patients
ORDER BY city;

SELECT
    city,
    COUNT(*) AS total_patients
FROM patients
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY total_patients DESC;

Create  table departments (
    department_id INT primary key,
    department_name VARCHAR(100));

INSERT INTO departments
(department_id, department_name)
VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'General Medicine'),
(5, 'Pediatrics');

select * from departments;

CREATE TABLE admissions (
    admission_id INT PRIMARY KEY,
    patient_id INT,
    department_id INT,
    admission_date DATE,
    discharge_date DATE
);

INSERT INTO admissions
(admission_id, patient_id, department_id, admission_date, discharge_date)
VALUES
(1001, 101, 1, '2026-08-01', '2026-08-05'),
(1002, 102, 2, '2026-08-03', '2026-08-07'),
(1003, 103, 4, '2026-08-04', '2026-08-06'),
(1004, 104, 1, '2026-08-05', '2026-08-10'),
(1005, 105, 3, '2026-08-07', '2026-08-12'),
(1006, 106, 5, '2026-08-08', '2026-08-09'),
(1007, 107, 4, '2026-08-10', '2026-08-13'),
(1008, 108, 2, '2026-08-11', '2026-08-16'),
(1009, 109, 3, '2026-08-12', '2026-08-15'),
(1010, 110, 1, '2026-08-15', '2026-08-20');

select * from admissions;

SELECT
    patients.patient_id,
    patients.patient_name,
    admissions.admission_date
FROM patients
INNER JOIN admissions
ON patients.patient_id = admissions.patient_id;

select patients.patient_id, patients.patient_name, admissions.admission_date from patients left join admissions on admissions.patient_id = patients.patient_id;

select * from admissions;

select patients.patient_id, patients.patient_name, admissions.admission_date,departments.department_name from patients left join admissions on admissions.patient_id = patients.patient_id left join departments on departments.department_id = admissions.department_id;

select patients.patient_id, patients.patient_name, departments.department_name, COUNT(admissions.admission_id) as total_admissions from patients left join admissions on admissions.patient_id = patients.patient_id  left join departments on departments.department_id = admissions.department_id group by  patients.patient_id,departments.department_name;

SELECT
    departments.department_name,
    COUNT(admissions.admission_id) AS total_admissions
FROM departments
LEFT JOIN admissions
    ON departments.department_id = admissions.department_id
GROUP BY departments.department_name
ORDER BY total_admissions DESC;

select * from admissions;

select * from departments;

SELECT
    CASE
        WHEN age < 18 THEN 'Child'
        WHEN age BETWEEN 18 AND 40 THEN 'Young Adult'
        WHEN age BETWEEN 41 AND 60 THEN 'Middle Aged'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS total_patients
FROM patients
GROUP BY
    CASE
        WHEN age < 18 THEN 'Child'
        WHEN age BETWEEN 18 AND 40 THEN 'Young Adult'
        WHEN age BETWEEN 41 AND 60 THEN 'Middle Aged'
        ELSE 'Senior'
    END;

SELECT patient_name,age
FROM patients
WHERE age > (
    SELECT AVG(age)
    FROM patients
);

select patient_name,age from patients where age = ( select max(age) from patients);

select patient_name,age from patients where age = ( select min(age) from patients);

select patient_name,city from patients where city in ( select city from patients group by city having count(*) >= 2);

select patient_name,age from patients where city in ( select city from patients group by city having count(*) >= 2);

select patient_name, age,city from patients where city not in ('bangalore');

select patient_name,age,city from  patients where city in( select city from patients group by city having count(*) < 2);

WITH city_counts AS (
    SELECT city
    FROM patients
    GROUP BY city
    HAVING COUNT(*) >= 2
)
SELECT patient_name, age, city
FROM patients
WHERE city IN (
    SELECT city
    FROM city_counts
);

 with city_avg as (
     select age 
     from patients 
     where avg(age) group by age)
     select patient_name, city ,age from patients where age > (select avg(age) from patients);

WITH city_avg AS (
    SELECT
        city,
        AVG(age) AS average_age
    FROM patients
    GROUP BY city
)
SELECT
    city,
    average_age
FROM city_avg;

 WITH city_patient_count AS (
    SELECT
        city,
        COUNT(*) AS patient_count
    FROM patients
    GROUP BY city
)
SELECT
    city,
    patient_count
FROM city_patient_count;

with city_patient_count as( select city,count(*) as patient_count from patients group by city)
select city,patient_count from city_patient_count where patient_count > 2;

with city_avg as (select city,avg(age) as average_age from patients group by city) select city,average_age from city_avg where average_age > 40;

with city_max_age as (select city, max(age) as oldest_age from patients group by city ) select city,oldest_age from city_max_age; 

with Average_Age as ( select gender,avg(age) as average_age from patients group by gender) select gender,average_age from Average_age where average_age > 40;

WITH average_age AS (
    SELECT
        gender,
        AVG(age) AS average_age
    FROM patients
    GROUP BY gender
)
SELECT
    gender,
    average_age
FROM average_age
WHERE average_age > 40;



WITH department_counts AS (
    SELECT
        department_id,
        COUNT(*) AS total_admissions
    FROM admissions
    GROUP BY department_id
)
SELECT
    departments.department_name,
    department_counts.total_admissions
FROM departments
LEFT JOIN department_counts
    ON departments.department_id = department_counts.department_id;

with department_counts as (
    select department_id,
    count(*) as total_admissions
    from admissions
    group by department_id
)
select 
    departments.department_name,
    department_counts.total_admissions
    from departments
    left join department_counts
    on 
    departments.department_id = department_counts.department_id
    where department_counts.total_admissions > 2;
   
WITH department_counts AS (
    SELECT
        department_id,
        COUNT(*) AS total_admissions
    FROM admissions
    GROUP BY department_id
)
SELECT
    departments.department_name,
    department_counts.total_admissions
FROM departments
LEFT JOIN department_counts
    ON departments.department_id = department_counts.department_id
WHERE department_counts.total_admissions > 2;

with department_age as(
    select admissions.department_id,
    avg(patients.age) as average_age
    from patients
    join   admissions
     on patients.patient_id = admissions.patient_id
    group by admissions.department_id
)
select 
     departments.department_name,
     department_age.average_age
     from departments
     join  department_age
    ON departments.department_id = department_age.department_id
WHERE department_age.average_age > 40;

SELECT patient_name, age
FROM patients
WHERE EXISTS (
    SELECT 1
    FROM admissions
    WHERE admissions.patient_id = patients.patient_id
);

select patient_name,age
from patients
where exists (
    select 1
    from admissions
    where admissions.patient_id = patients.patieny_id
);

select patient_name,age
from patients
where not exists (
    select 1
    from admissions
    where admissions.patient_id = patients.patient_id
);

select patient_name,city
from patients
where city = 'bangalore'
UNION
select patient_name,city
from patients
where city = 'hassan';

select patient_name,city
from patients
where city ='mysore'
union all
select patient_name,city 
from patients
where city = 'bangalore';

select patient_name , city 
from patients
where city = 'bangalore'
union
select patient_name,city 
from patients
where city = 'mysore'
union 
select patient_name,city 
from patients
where city = 'hassan';

select patient_id
from patients
UNION
select patient_id 
from admissions;

select patient_id
from patients
UNION all
select patient_id 
from admissions;


select  patients.patient_id
from patients
inner join admissions
on
admissions.patient_id = patients.patient_id;

select patients.patient_name , admissions.admission_date
from patients
inner join admissions
on 
admissions.patient_id = patients.patient_id;

select patients.patient_name , admissions.admission_date, departments.department_name
from patients
inner join admissions
on 
admissions.patient_id = patients.patient_id
inner join departments
on  
departments.department_id = admissions.department_id;


SELECT departments.department_name,
       COUNT(admissions.admission_id) AS total_admissions
FROM departments
INNER JOIN admissions
    ON admissions.department_id = departments.department_id
GROUP BY departments.department_name;

select departments.department_id ,
count(admissions.admission_id) as total_admissions
from departments
inner join admissions
on admissions.department_id = departments.department_id
group by departments.department_id
order by total_admissions desc 
limit 1;

SELECT patient_name,
       age,
       AVG(age) OVER () AS average_age
FROM patients;

select department_name,
      department_id,
      count(department_id) over () as total_department
      from departments;

      SELECT
    patient_name,
    gender,
    age,
    AVG(age) OVER (PARTITION BY gender) AS gender_avg_age
FROM patients;

select patient_name,
gender , patient_id , city,
count(*)
over (partition by  city ) as patients_city_cal
from patients;

select patient_name, city,gender,age,
row_number() over(order by age desc) as patients_row_number
from patients;

select patient_name ,city,age,
 row_number() over (partition by city
order by age desc) as city_based_row_no
from patients;

select patient_name, city,age,
row_number() over(partition by city order by age desc) as bangalore_patients
from patients where city = 'bangalore';

select patient_id ,patient_name ,age,city,
row_number() over(partition by city order by age desc) as mysore_patients
from patients where city = 'mysore';

select departments.department_name , departments.department_id,admissions.admission_date,
row_number() over(partition by departments.department_name 
order by admissions.admission_date ) as row_admissions_sort
from departments 
inner join admissions 
on admissions.department_id = departments.department_id ;

select patient_name, city ,age ,
row_number() over(partition by city 
order by age desc ) as city_row_sort
from patients;

with each_oldpatient_city as (
    select patient_name,
    city ,age ,
    row_number() over(partition by city order by age desc)
    as ranked_patients
    from patients
) select patient_name ,city,age from each_oldpatient_city
where ranked_patients = 1;

WITH ranked_patients AS (
    SELECT
        patient_name,
        city,
        age,
        ROW_NUMBER() OVER (
            PARTITION BY city
            ORDER BY age DESC
        ) AS city_rank
    FROM patients
)
SELECT
    patient_name,
    city,
    age
FROM ranked_patients
WHERE city_rank = 1;

select * from departments;

select * from admissions;

with department_admission_sort as (
    select departments.department_id,departments.department_name,
    admissions.admission_date,
    row_number() over(partition by departments.department_name order by admissions.admission_date asc) as department_date_admissionsort
    from departments
    inner join admissions
    on admissions.department_id = departments.department_id
)
select department_id,department_name,admission_date
from department_admission_sort where department_date_admissionsort =1;

select patient_name,city,age,
rank() over (partition by city order by age desc) as age_rank
from patients;

select patient_name,city,age,
 dense_rank() over (partition by city order by age desc) as age_rank
from patients;

with each_oldpatient_city as (
    select patient_name,
    city ,age ,
     dense_rank() over(partition by city order by age desc)
    as ranked_patients
    from patients
) select patient_name ,city,age,ranked_patients from each_oldpatient_city
where ranked_patients = 1;

SELECT
    patient_name,
    age,
    LAG(age) OVER (
        ORDER BY age
    ) AS previous_age
FROM patients;

select 
     patient_id ,
     lag(admission_date) over (
        order by admission_date
     ) as last_admission_date
     from admissions;
     
     select * from admissions;

select departments.department_id,departments.department_name,
admissions.admission_date ,lag(admission_date) over (partition by department_id order by admission_date)
as admissions_departments
from departments
inner join admissions
on  departments.department_id = admissions.department_id;

SELECT
    patient_id,
    admission_date,
    LEAD(admission_date) OVER (
        ORDER BY admission_date
    ) AS next_admission_date
FROM admissions;

select 
     departments.department_id, departments.department_name,
     admissions.admission_date,
     lead(admissions.admission_date) over (
        partition by department_id 
     ) as lead_admissions 
     from departments
     inner join admissions
     on departments.department_id = admissions.department_id;

     SELECT
    department_id,
    admission_date,
    FIRST_VALUE(admission_date) OVER (
        PARTITION BY department_id
        ORDER BY admission_date
    ) AS first_admission_date
FROM admissions;

SELECT
    department_id,
    admission_date,
    LAST_VALUE(admission_date) OVER (
        PARTITION BY department_id
        ORDER BY admission_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS latest_admission_date
FROM admissions;

select department_id , admission_id ,discharge_date ,
first_value(discharge_date) over (partition by department_id order by discharge_date rows between unbounded preceding and unbounded following)
as earliest_discharges
from admissions;

SELECT
    admission_id,
    department_id,
    COUNT(*) OVER (
        PARTITION BY department_id
    ) AS department_admission_count
FROM admissions;

select patient_id, city,
count(*) over (
    partition by city
) as admission_every_city
from patients;

select patient_name, city,age,
avg(age) over (
    partition by city
) as admission_every_city
from patients;

select patient_name, city,age,
 age - avg(age) over (
    partition by city
) as age_diff_city
from patients;

select patient_name, city,age,
 dense_rank() over (
    partition by city order by age desc
) as ranked_patients
from patients;

select  department_id,admission_id,admission_date,
count(*) over(partition by department_id order by admission_date rows between unbounded preceding and current row)
as diff_admission  from admissions; 

ALTER TABLE admissions
ADD bill_amount DECIMAL(10,2);

UPDATE admissions
SET bill_amount =
    CASE admission_id
        WHEN 1001 THEN 25000.00
        WHEN 1002 THEN 18000.00
        WHEN 1003 THEN 12000.00
        WHEN 1004 THEN 32000.00
        WHEN 1005 THEN 15000.00
        WHEN 1006 THEN 8000.00
        WHEN 1007 THEN 14000.00
        WHEN 1008 THEN 22000.00
        WHEN 1009 THEN 16000.00
        WHEN 1010 THEN 35000.00
    END;

    SELECT admission_id, admission_date, bill_amount
FROM admissions;

SELECT
    admission_id,
    admission_date,
    bill_amount,
    SUM(bill_amount) OVER (
        ORDER BY admission_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM admissions
ORDER BY admission_date;

SELECT
    admission_id,
    department_id,
    admission_date,
    bill_amount,
    SUM(bill_amount) OVER (
        PARTITION BY department_id
        ORDER BY admission_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS department_running_total
FROM admissions
ORDER BY department_id, admission_date;

SELECT
    admission_id,
    department_id,
    bill_amount,
    SUM(bill_amount) OVER (
        PARTITION BY department_id
    ) AS department_total_bill
FROM admissions;

SELECT
    admission_id,
    department_id,
    bill_amount,
    avg(bill_amount) OVER (
        PARTITION BY department_id
    ) AS department_avg_bill
FROM admissions;

SELECT
    admission_id,
    department_id,
    bill_amount,
    bill_amount - avg(bill_amount) OVER (
        PARTITION BY department_id
    ) AS department_avg_bill
FROM admissions;

SELECT
    admission_id,
    department_id,
    bill_amount,
    MIN(bill_amount) OVER (
        PARTITION BY department_id
    ) AS minimum_department_bill,
    MAX(bill_amount) OVER (
        PARTITION BY department_id
    ) AS maximum_department_bill
FROM admissions;

SELECT
    admission_id,
    department_id,
    bill_amount,
    sum(bill_amount) OVER (
        PARTITION BY department_id
    ) AS Highest_bill_in_that_department
FROM admissions;

SELECT
    admission_id,
    department_id,
    bill_amount,
    min(bill_amount) OVER (
        PARTITION BY department_id
    ) AS lowest_bill_in_department
FROM admissions;

SELECT
    patient_name,
    age,
    NTILE(4) OVER (
        ORDER BY age DESC
    ) AS age_group
FROM patients;


SELECT
    patient_name,
    age,city,
    NTILE(3) OVER (partition by city
        ORDER BY age DESC
    ) AS age_group
FROM patients;

select patient_name,
age, percent_rank() over (
    order by age asc
) as youngest_patients
from patients;

select patient_name,
age, percent_rank() over (partition by city 
    order by age desc
) as each_city_patients
from patients;

select patient_name,
age, cume_dist() over(
    order by age asc
) as cums_city_patients
from patients;

select patient_name,
age,  city , cume_dist() over( partition by city
    order by age asc
) as cums_city_patients
from patients;

select patient_name, age  
 from patients
 order by age asc 
 ;

 SELECT
    admission_id,
    patient_id,
    admission_date,
    discharge_date,
    DATEDIFF(discharge_date, admission_date) AS length_of_stay
FROM admissions;

select
 admission_date,patient_id,admission_date,
 discharge_date,
 datediff(discharge_date,admission_date  ) as stay_start_end
 from admissions order by admission_date desc;

SELECT
    AVG(DATEDIFF(discharge_date, admission_date)) AS average_stay
FROM admissions;

select departments.department_id ,departments.department_name,
avg(datediff(admissions.discharge_date, admissions.admission_date))
as average_stay_dep from departments inner join admissions
 on departments.department_id = admissions.department_id group by departments.department_id,departments.department_name;

 
SELECT
    departments.department_id,
    departments.department_name,
    AVG(
        DATEDIFF(
            admissions.discharge_date,
            admissions.admission_date
        )
    ) AS average_stay_dep
FROM departments
INNER JOIN admissions
    ON departments.department_id = admissions.department_id
GROUP BY
    departments.department_id,
    departments.department_name;

    select departments.department_id ,departments.department_name,
    avg(
        datediff( admissions.discharge_date ,admissions.admission_date))
        as highest_avg_stay_indep 
        from departments
        inner join admissions
        on departments.department_id = admissions.department_id
        order by highest_avg_stay_indep;
    
    
SELECT
    departments.department_id,
    departments.department_name,
    AVG(
        DATEDIFF(
            admissions.discharge_date,
            admissions.admission_date
        )
    ) AS highest_avg_stay_indep
FROM departments
INNER JOIN admissions
    ON departments.department_id = admissions.department_id
GROUP BY
    departments.department_id,
    departments.department_name
ORDER BY highest_avg_stay_indep DESC;

SELECT
    departments.department_id,
    departments.department_name,
    AVG(
        DATEDIFF(
            admissions.discharge_date,
            admissions.admission_date
        )
    ) AS average_stay
FROM departments
INNER JOIN admissions
    ON departments.department_id = admissions.department_id
GROUP BY
    departments.department_id,
    departments.department_name
ORDER BY average_stay DESC
LIMIT 1;

select departments.department_id ,departments.department_name,
count(admissions.admission_id)
as lengthiest_stay_in_dep 
from departments
inner join admissions
on admissions.department_id = departments.department_id
group by departments.department_id,
departments.department_name
having lengthiest_stay_in_dep > 2;

SELECT
    departments.department_id,
    departments.department_name,
    COUNT(admissions.admission_id) AS admission_count
FROM departments
INNER JOIN admissions
    ON admissions.department_id = departments.department_id
GROUP BY
    departments.department_id,
    departments.department_name
HAVING admission_count > 2;

SELECT
    departments.department_id,
    departments.department_name,
    COUNT(admissions.admission_id) AS admission_count
FROM departments
INNER JOIN admissions
    ON admissions.department_id = departments.department_id
GROUP BY
    departments.department_id,
    departments.department_name
HAVING admission_count > 2;

SELECT
    departments.department_id,
    departments.department_name,
    COUNT(admissions.admission_id) AS admission_count,
    AVG(
        DATEDIFF(
            admissions.discharge_date,
            admissions.admission_date
        )
    ) AS average_stay
FROM departments
INNER JOIN admissions
    ON admissions.department_id = departments.department_id
GROUP BY
    departments.department_id,
    departments.department_name
HAVING
    admission_count > 2
    AND average_stay > 5;

select  discharge_date,admission_date,
datediff(discharge_date,admission_date)
as null_check
from admissions where discharge_date is null;

select discharge_date,admission_date, 
datediff(discharge_date ,admission_date)
as null_check
from admissions where discharge_date  is not null;

select admission_date,discharge_date,admission_id,
datediff(
    coalesce(discharge_date,curdate()),
    admission_date)
as length_of_stay from admissions;

select patients.patient_name,admissions.admission_id,
admissions.admission_date,admissions.discharge_date,
datediff(
    curdate(),admissions.admission_date
) as current_stay_patients
from patients
inner join admissions
on patients.patient_id = admissions.patient_id
where discharge_date is null;

SELECT
    admission_id,
    admission_date,
    discharge_date
FROM admissions;

SELECT COUNT(*) AS ongoing_admissions
FROM admissions
WHERE discharge_date IS NULL;

describe admissions;

select admission_date,
year(admission_date) as admission_year ,count(*) as admission_count
from admissions
group by admission_date;

select 
month(admission_date) as admission_month , count(*) as admission_count
from admissions
group by   month(admission_date);

select 
month(admission_date) as admission_month,
year(admission_date) as admission_year,
count(*) as admission_count 
from admissions
group by month(admission_date),
year(admission_date)
order by admission_month,
admission_year;

SELECT
    MONTHNAME(admission_date) AS admission_month,
    COUNT(*) AS admission_count;/
FROM admissions
GROUP BY MONTH(admission_date), MONTHNAME(admission_date)
ORDER BY MONTH(admission_date);

Select 
      monthname(admission_id) as admission_list
      from admissions 
group by month(admission_date), monthname(admission_date)
order by month(admission_date);

 SELECT
    admission_date,
    MONTHNAME(admission_date) AS admission_month
FROM admissions;

SELECT
    admission_date
FROM admissions
ORDER BY admission_date;

SELECT
    admission_date,
    MONTH(admission_date) AS admission_month,
    MONTHNAME(admission_date) AS month_name
FROM admissions;

SELECT
    MIN(admission_date) AS earliest_admission,
    MAX(admission_date) AS latest_admission,
    COUNT(*) AS total_admissions
FROM admissions;

SELECT COUNT(*) AS total_admissions
FROM admissions;

SELECT DATABASE();
SELECT COUNT(*) AS total_admissions
FROM admissions;

SELECT DISTINCT
    YEAR(admission_date) AS admission_year,
    MONTH(admission_date) AS admission_month,
    MONTHNAME(admission_date) AS month_name
FROM admissions
ORDER BY admission_year, admission_month;

SELECT * FROM admissions;

INSERT INTO admissions
(admission_id, patient_id, department_id, admission_date, discharge_date, bill_amount)
VALUES
(1011, 101, 1, '2026-01-05', '2026-01-10', 45000.00),
(1012, 102, 2, '2026-01-12', '2026-01-18', 38000.00),
(1013, 103, 3, '2026-02-03', '2026-02-08', 29000.00),
(1014, 104, 5, '2026-02-10', '2026-02-13', 16000.00),
(1015, 105, 4, '2026-03-02', '2026-03-09', 52000.00),
(1016, 106, 1, '2026-03-15', '2026-03-25', 75000.00),
(1017, 107, 2, '2026-04-01', '2026-04-06', 41000.00),
(1018, 108, 3, '2026-04-12', '2026-04-16', 27000.00),
(1019, 109, 4, '2026-05-05', '2026-05-12', 48000.00),
(1020, 110, 1, '2026-05-20', '2026-05-28', 68000.00),
(1021, 101, 2, '2026-06-03', '2026-06-08', 35000.00),
(1022, 102, 3, '2026-06-15', '2026-06-22', 44000.00),
(1023, 103, 4, '2026-07-01', '2026-07-10', 59000.00),
(1024, 104, 5, '2026-07-15', '2026-07-18', 18000.00),
(1025, 105, 1, '2026-09-01', '2026-09-08', 62000.00),
(1026, 106, 2, '2026-09-05', '2026-09-12', 55000.00),
(1027, 107, 3, '2026-09-10', NULL, 39000.00),
(1028, 108, 4, '2026-09-12', NULL, 47000.00),
(1029, 109, 1, '2026-09-15', NULL, 51000.00),
(1030, 110, 5, '2026-09-18', NULL, 22000.00);

SELECT COUNT(*) AS total_admissions
FROM admissions;

SELECT
    MONTHNAME(admission_date) AS admission_month,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY
    MONTH(admission_date),
    MONTHNAME(admission_date)
ORDER BY
    MONTH(admission_date);

    SELECTselect admission_id,admission_date,discharge_date,
datediff(discharge_date,admission_date) as length_of_stay
if(
   datediff(discharge_date,admission_date)> 7,
   'long_stay','short_stay') as stay_in_week
  from admissions where discharge_date is not  null;

    DAYNAME(admission_date) AS admission_day,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY
    DAYOFWEEK(admission_date),
    DAYNAME(admission_date)
ORDER BY
    DAYOFWEEK(admission_date);

    select  admission_date ,Dayname(admission_date) as admission_day
     from admissions;

     select dayname(admission_date)as admission_day,
     count(*) as admission_count from admissions
     group by dayofweek(admission_date),
     dayname(admission_date)
     order by 
     dayofweek(admission_date);

select admission_date, dayname(admission_date) as admission_date ,
date_format(admission_date,'%d-%m-%y') as formated_date from admissions;

SELECT
    admission_id,
    admission_date,
    DATE_ADD(admission_date, INTERVAL 7 DAY) AS seven_day_date
FROM admissions;

select admission_id,admission_date,
date_add(admission_date,interval 3 day) as three_days_date
from admissions;

select admission_id,admission_date,
date_sub(admission_date,interval 7 day) as seven_day_backday
from admissions;

SELECT
    admission_date,
    DATE(admission_date) AS extracted_date
FROM admissions;

select admission_id,admission_date,
extract(year from admission_date) as extract_of_year,
extract(month from admission_date) as extract_of_month,
extract(day from admission_DATE) as extract_of_day
from admissions;

select discharge_date,admission_date,
timestampdiff(month,
admission_date,discharge_date) as stays_month from  
admissions
order by admission_date;

select admission_id, patient_id,admission_date,
datediff(curdate(),admission_date)  as lenght_of_stay
from admissions
where discharge_date is  null;


  SELECT
    admission_id,
    admission_date,
    discharge_date,
    DATEDIFF(discharge_date, admission_date) AS length_of_stay,

    IF(
        DATEDIFF(discharge_date, admission_date) > 7,
        'Long Stay',
        'Short Stay'
    ) AS stay_category

FROM admissions
WHERE discharge_date IS NOT NULL;

select admission_id,admission_date,discharge_date,
datediff(discharge_date,admission_date) as length_stay,
if (
    datediff(discharge_date,admission_date)> 7,
    'long stay' ,'short stay'
) as stay_variety
from admissions where discharge_date is not null;

SELECT
    admission_id,
    discharge_date,
    IFNULL(discharge_date, CURDATE()) AS effective_discharge_date
FROM admissions;

