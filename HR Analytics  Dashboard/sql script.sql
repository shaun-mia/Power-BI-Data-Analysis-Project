-- Create schema for HR data
CREATE SCHEMA IF NOT EXISTS hr_analytics;

-- Switch to the new schema
USE hr_analytics;

-- Create the hr_data table
CREATE TABLE hr_data (
    Age INT,
    Attrition VARCHAR(3),
    BusinessTravel VARCHAR(50),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EmployeeCount INT,
    EmployeeNumber INT PRIMARY KEY,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(50),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 CHAR(1),
    OverTime VARCHAR(3),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);

-- Load data from CSV file
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/hr_data.csv'
INTO TABLE hr_data
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Age, Attrition, BusinessTravel, DailyRate, Department, DistanceFromHome, Education, EducationField, EmployeeCount, EmployeeNumber, EnvironmentSatisfaction, Gender, HourlyRate, JobInvolvement, JobLevel, JobRole, JobSatisfaction, MaritalStatus, MonthlyIncome, MonthlyRate, NumCompaniesWorked, Over18, OverTime, PercentSalaryHike, PerformanceRating, RelationshipSatisfaction, StandardHours, StockOptionLevel, TotalWorkingYears, TrainingTimesLastYear, WorkLifeBalance, YearsAtCompany, YearsInCurrentRole, YearsSinceLastPromotion, YearsWithCurrManager);

-- Display first few rows to verify data
SELECT * FROM hr_data
LIMIT 5;



-- Check for missing values in critical columns (Attrition, Business Travel, Job Role, Education Level)
SELECT COUNT(*) AS missing_attrition
FROM hr_data
WHERE Attrition IS NULL;

SELECT COUNT(*) AS missing_business_travel
FROM hr_data
WHERE `BusinessTravel` IS NULL;

SELECT COUNT(*) AS missing_job_role
FROM hr_data
WHERE `JobRole` IS NULL;

SELECT COUNT(*) AS missing_education_level
FROM hr_data
WHERE `Education` IS NULL;


-- Replace missing values with default values
UPDATE hr_data
SET Attrition = 'No'
WHERE Attrition IS NULL;

UPDATE hr_data
SET `BusinessTravel` = 'Not Specified'
WHERE `BusinessTravel` IS NULL;

UPDATE hr_data
SET `JobRole` = 'Unknown'
WHERE `JobRole` IS NULL;

UPDATE hr_data
SET `Education` = 'Unknown'
WHERE `Education` IS NULL;


UPDATE hr_data
SET Age = CAST(Age AS SIGNED),
    MonthlyIncome = CAST(MonthlyIncome AS DECIMAL(10, 2)),
    YearsAtCompany = CAST(YearsAtCompany AS SIGNED)
WHERE Age IS NOT NULL
  AND MonthlyIncome IS NOT NULL
  AND YearsAtCompany IS NOT NULL;




DELIMITER $$

CREATE PROCEDURE hr_star_schema()
BEGIN

-- Create Dimension Tables

-- Dimension for Age
CREATE TABLE IF NOT EXISTS dim_age (
    age_id INT AUTO_INCREMENT PRIMARY KEY,
    age_range VARCHAR(255)
);

-- Dimension for Attrition (Yes/No)
CREATE TABLE IF NOT EXISTS dim_attrition (
    attrition_id INT AUTO_INCREMENT PRIMARY KEY,
    attrition_status VARCHAR(255)
);

-- Dimension for Business Travel
CREATE TABLE IF NOT EXISTS dim_business_travel (
    business_travel_id INT AUTO_INCREMENT PRIMARY KEY,
    travel_type VARCHAR(255)
);

-- Dimension for Department
CREATE TABLE IF NOT EXISTS dim_department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(255)
);

-- Dimension for Education
CREATE TABLE IF NOT EXISTS dim_education (
    education_id INT AUTO_INCREMENT PRIMARY KEY,
    education_level VARCHAR(255)
);

-- Dimension for Job Role
CREATE TABLE IF NOT EXISTS dim_job_role (
    job_role_id INT AUTO_INCREMENT PRIMARY KEY,
    job_role_name VARCHAR(255)
);

-- Dimension for Gender
CREATE TABLE IF NOT EXISTS dim_gender (
    gender_id INT AUTO_INCREMENT PRIMARY KEY,
    gender_type VARCHAR(255)
);

-- Fact Table for HR Employee Data
CREATE TABLE IF NOT EXISTS fact_hr_data (
    employee_number INT PRIMARY KEY,
    age_id INT,
    attrition_id INT,
    business_travel_id INT,
    department_id INT,
    education_id INT,
    job_role_id INT,
    gender_id INT,
    daily_rate INT,
    distance_from_home INT,
    environment_satisfaction INT,
    hourly_rate INT,
    job_involvement INT,
    job_level INT,
    job_satisfaction INT,
    marital_status VARCHAR(255),
    monthly_income INT,
    monthly_rate INT,
    num_companies_worked INT,
    over18 VARCHAR(255),
    over_time VARCHAR(255),
    percent_salary_hike INT,
    performance_rating INT,
    relationship_satisfaction INT,
    standard_hours INT,
    stock_option_level INT,
    total_working_years INT,
    training_times_last_year INT,
    work_life_balance INT,
    years_at_company INT,
    years_in_current_role INT,
    years_since_last_promotion INT,
    years_with_curr_manager INT,
    FOREIGN KEY (age_id) REFERENCES dim_age(age_id),
    FOREIGN KEY (attrition_id) REFERENCES dim_attrition(attrition_id),
    FOREIGN KEY (business_travel_id) REFERENCES dim_business_travel(business_travel_id),
    FOREIGN KEY (department_id) REFERENCES dim_department(department_id),
    FOREIGN KEY (education_id) REFERENCES dim_education(education_id),
    FOREIGN KEY (job_role_id) REFERENCES dim_job_role(job_role_id),
    FOREIGN KEY (gender_id) REFERENCES dim_gender(gender_id)
);

-- Insert Data into Dimension Tables

-- Insert distinct Age Ranges into dim_age
INSERT INTO dim_age (age_range)
SELECT DISTINCT 
    CASE
        WHEN Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        WHEN Age BETWEEN 55 AND 64 THEN '55-64'
        WHEN Age >= 65 THEN '65+'
    END AS age_range
FROM hr_data
WHERE Age IS NOT NULL;

-- Insert distinct Attrition Status into dim_attrition
INSERT INTO dim_attrition (attrition_status)
SELECT DISTINCT Attrition
FROM hr_data
WHERE Attrition IS NOT NULL;

-- Insert distinct Business Travel Types into dim_business_travel
INSERT INTO dim_business_travel (travel_type)
SELECT DISTINCT BusinessTravel
FROM hr_data
WHERE BusinessTravel IS NOT NULL;

-- Insert distinct Departments into dim_department
INSERT INTO dim_department (department_name)
SELECT DISTINCT Department
FROM hr_data
WHERE Department IS NOT NULL;

-- Insert distinct Education Levels into dim_education
INSERT INTO dim_education (education_level)
SELECT DISTINCT Education
FROM hr_data
WHERE Education IS NOT NULL;

-- Insert distinct Job Roles into dim_job_role
INSERT INTO dim_job_role (job_role_name)
SELECT DISTINCT JobRole
FROM hr_data
WHERE JobRole IS NOT NULL;

-- Insert distinct Genders into dim_gender
INSERT INTO dim_gender (gender_type)
SELECT DISTINCT Gender
FROM hr_data
WHERE Gender IS NOT NULL;

-- Insert data into Fact Table fact_hr_data
INSERT INTO fact_hr_data (
    employee_number, age_id, attrition_id, business_travel_id, department_id, education_id, job_role_id, 
    gender_id, daily_rate, distance_from_home, environment_satisfaction, hourly_rate, job_involvement, job_level, 
    job_satisfaction, marital_status, monthly_income, monthly_rate, num_companies_worked, over18, over_time, 
    percent_salary_hike, performance_rating, relationship_satisfaction, standard_hours, stock_option_level, 
    total_working_years, training_times_last_year, work_life_balance, years_at_company, years_in_current_role, 
    years_since_last_promotion, years_with_curr_manager
)
SELECT 
    e.EmployeeNumber, 
    a.age_id, 
    at.attrition_id, 
    bt.business_travel_id, 
    d.department_id, 
    ed.education_id, 
    j.job_role_id, 
    g.gender_id,
    e.DailyRate, 
    e.DistanceFromHome, 
    e.EnvironmentSatisfaction, 
    e.HourlyRate, 
    e.JobInvolvement, 
    e.JobLevel, 
    e.JobSatisfaction, 
    e.MaritalStatus, 
    e.MonthlyIncome, 
    e.MonthlyRate, 
    e.NumCompaniesWorked, 
    e.Over18, 
    e.OverTime, 
    e.PercentSalaryHike, 
    e.PerformanceRating, 
    e.RelationshipSatisfaction, 
    e.StandardHours, 
    e.StockOptionLevel, 
    e.TotalWorkingYears, 
    e.TrainingTimesLastYear, 
    e.WorkLifeBalance, 
    e.YearsAtCompany, 
    e.YearsInCurrentRole, 
    e.YearsSinceLastPromotion, 
    e.YearsWithCurrManager
FROM hr_data e
LEFT JOIN dim_age a ON CASE
        WHEN e.Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN e.Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN e.Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN e.Age BETWEEN 45 AND 54 THEN '45-54'
        WHEN e.Age BETWEEN 55 AND 64 THEN '55-64'
        WHEN e.Age >= 65 THEN '65+'
    END = a.age_range
LEFT JOIN dim_attrition at ON e.Attrition = at.attrition_status
LEFT JOIN dim_business_travel bt ON e.BusinessTravel = bt.travel_type
LEFT JOIN dim_department d ON e.Department = d.department_name
LEFT JOIN dim_education ed ON e.Education = ed.education_level
LEFT JOIN dim_job_role j ON e.JobRole = j.job_role_name
LEFT JOIN dim_gender g ON e.Gender = g.gender_type;

END $$

DELIMITER ;

-- Call the procedure to normalize the data
CALL hr_star_schema();

