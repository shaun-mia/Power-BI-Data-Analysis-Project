# HR Analytics Dashboard

## Project Overview

The HR Analytics Dashboard is designed to provide HR teams with actionable insights into employee performance, satisfaction, demographics, and attrition trends. By integrating SQL-based HR data, this dashboard empowers data-driven decision-making, enabling HR teams to improve organizational performance.

 You can view the dashboard live on my [portfolio site](https://shaun-mia.github.io/).
 Or [Web](https://app.powerbi.com/view?r=eyJrIjoiMGZhYjY1NjItZDZiYS00NWRiLWE4NDAtNjQzMTMxZGVhMjU2IiwidCI6IjEyYjQwYmQxLTllNjEtNDMyOS1iNGJmLTk2MjQ1NTgzOGQ4OCIsImMiOjEwfQ%3D%3D)

![image](https://github.com/user-attachments/assets/ab7d0226-a395-44b8-bce6-84d87a950d4e)

## Objective

Develop an interactive Power BI dashboard using SQL-based HR data to offer insights into employee performance, satisfaction, and demographics. The dashboard will help HR teams make informed decisions to improve employee experience, reduce attrition, and optimize performance.

---

## Task Breakdown

### Step 1: Data Preparation

**1.1 Import & Normalize Data**

- **Import HR Dataset**: Import the HR dataset into an SQL database.
- **Normalize Data**: Normalize the data by creating dimension tables:
  - **Employee**: Contains employee-specific information (e.g., ID, name, gender, age).
  - **Education**: Contains employee education levels.
  - **Satisfaction**: Contains various satisfaction scores (job satisfaction, relationship satisfaction, etc.).
  - **Rating**: Contains employee performance ratings.
  - **Fact Table**: A fact table for employee performance metrics, including reviews, satisfaction levels, and training opportunities.

**1.2 Data Transformation**

- **Clean the Data**: Use SQL queries to handle missing values, remove duplicates, and standardize values.
- **Ensure Consistency**: Ensure that all records follow a consistent format and no invalid or missing data exists in key columns (e.g., Gender, Salary, etc.).

To import your HR data file into a MySQL database using a data path (for example, a CSV file), you can follow these steps. This process involves:

1. **Prepare the Data File** (for example, a CSV file).
2. **Create the Table** in MySQL.
3. **Import the CSV Data** using MySQL's `LOAD DATA INFILE` command.

### Prepare the Data File

Ensure your data file (e.g., `hr_data.csv`) is formatted correctly. The file should look like this (with columns matching your table schema):

### Create Table in MySQL

Next, create the `hr_data` table in MySQL with the appropriate columns, as shown earlier in this conversation. Here's the code again for reference:

```sql
CREATE SCHEMA hr_analysis;

CREATE TABLE hr_analysis.hr_data (
    EmployeeID VARCHAR(20),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    BusinessTravel VARCHAR(50),
    Department VARCHAR(50),
    DistanceFromHome INT,
    State VARCHAR(10),
    Ethnicity VARCHAR(50),
    Education VARCHAR(50),
    EducationField VARCHAR(50),
    JobRole VARCHAR(50),
    MaritalStatus VARCHAR(20),
    Salary INT,
    StockOptionLevel INT,
    OverTime VARCHAR(10),
    HireDate DATE,
    Attrition VARCHAR(10),
    YearsAtCompany INT,
    YearsInMostRecentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
    ReviewDate DATE,
    EnvironmentSatisfaction VARCHAR(20),
    JobSatisfaction VARCHAR(20),
    RelationshipSatisfaction VARCHAR(20),
    TrainingOpportunitiesWithinYear INT,
    TrainingOpportunitiesTaken INT,
    WorkLifeBalanceRating VARCHAR(20),
    SelfRating INT,
    ManagerRating INT
);
```

### Step 3: Import the CSV Data into MySQL Using `LOAD DATA INFILE`

To load the data from the CSV file into your MySQL table, use the `LOAD DATA INFILE` command. Here’s how:

```sql
LOAD DATA INFILE '/path/to/your/hr_data.csv'
INTO TABLE hr_analysis.hr_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(EmployeeID, FirstName, LastName, Gender, Age, BusinessTravel, Department, DistanceFromHome, 
State, Ethnicity, Education, EducationField, JobRole, MaritalStatus, Salary, StockOptionLevel, 
OverTime, HireDate, Attrition, YearsAtCompany, YearsInMostRecentRole, YearsSinceLastPromotion, 
YearsWithCurrManager, ReviewDate, EnvironmentSatisfaction, JobSatisfaction, RelationshipSatisfaction, 
TrainingOpportunitiesWithinYear, TrainingOpportunitiesTaken, WorkLifeBalanceRating, SelfRating, ManagerRating);
```

### Explanation of the Command:
- **`/path/to/your/hr_data.csv`**: Replace this with the actual path to your CSV file on the server.
- **`FIELDS TERMINATED BY ','`**: Specifies that columns in the CSV are separated by commas.
- **`ENCLOSED BY '"'`**: Indicates that values are enclosed in double quotes, useful if there are commas inside values.
- **`LINES TERMINATED BY '\n'`**: Specifies that each line in the file corresponds to a new record.
- **`IGNORE 1 LINES`**: Skips the first line, assuming it contains column headers.
- **Column names**: The column names in the CSV should match the ones in the table, or you need to modify the list to reflect the correct order.

### Step 4: Verify the Data Import

Once the data is loaded, you can verify the insertion by running a simple query:

```sql
SELECT * FROM hr_analysis.hr_data LIMIT 5;
```

### Result for the `hr_data`:

| EmployeeID | FirstName | LastName | Gender | Age | BusinessTravel | Department | DistanceFromHome | State | Ethnicity | Education | EducationField | JobRole        | MaritalStatus | Salary | StockOptionLevel | OverTime | HireDate   | Attrition | YearsAtCompany | YearsInMostRecentRole | YearsSinceLastPromotion | YearsWithCurrManager | ReviewDate | EnvironmentSatisfaction | JobSatisfaction | RelationshipSatisfaction | TrainingOpportunitiesWithinYear | TrainingOpportunitiesTaken | WorkLifeBalanceRating | SelfRating | ManagerRating |
|------------|-----------|----------|--------|-----|-----------------|------------|------------------|-------|-----------|-----------|-----------------|----------------|---------------|--------|------------------|----------|------------|-----------|----------------|-----------------------|--------------------------|----------------------|------------|------------------------|-----------------|--------------------------|--------------------------------|---------------------------|-----------------------|------------|---------------|
| 3012-1A41  | Leonelle  | Simco    | Female | 30  | Some Travel     | Sales      | 27               | IL    | White     | Doctorate | Marketing       | Sales Executive | Divorced     | 102059 | 1                | No       | 2012-01-03 | No        | 10             | 4                     | 9                        | 7                     | 2014-10-31 | Neutral                | Satisfied        | Dissatisfied            | 1                              | 0                         | Meets Expectation      | 4          | 3             |
| 3012-1A41  | Leonelle  | Simco    | Female | 30  | Some Travel     | Sales      | 27               | IL    | White     | Doctorate | Marketing       | Sales Executive | Divorced     | 102059 | 1                | No       | 2012-01-03 | No        | 10             | 4                     | 9                        | 7                     | 2019-10-30 | Very Dissatisfied       | Neutral          | Dissatisfied            | 3                              | 1                         | Meets Expectation      | 5          | 4             |
| 3012-1A41  | Leonelle  | Simco    | Female | 30  | Some Travel     | Sales      | 27               | IL    | White     | Doctorate | Marketing       | Sales Executive | Divorced     | 102059 | 1                | No       | 2012-01-03 | No        | 10             | 4                     | 9                        | 7                     | 2018-10-30 | Very Satisfied          | Very Satisfied  | Satisfied               | 3                              | 0                         | Exceeds Expectation    | 5          | 5             |
| 3012-1A41  | Leonelle  | Simco    | Female | 30  | Some Travel     | Sales      | 27               | IL    | White     | Doctorate | Marketing       | Sales Executive | Divorced     | 102059 | 1                | No       | 2012-01-03 | No        | 10             | 4                     | 9                        | 7                     | 2017-10-30 | Satisfied               | Satisfied        | Very Satisfied         | 3                              | 1                         | Needs Improvement      | 3          | 2             |
| 3012-1A41  | Leonelle  | Simco    | Female | 30  | Some Travel     | Sales      | 27               | IL    | White     | Doctorate | Marketing       | Sales Executive | Divorced     | 102059 | 1                | No       | 2012-01-03 | No        | 10             | 4                     | 9                        | 7                     | 2016-10-30 | Neutral                | Neutral          | Dissatisfied            | 3                              | 0                         | Exceeds Expectation    | 3          | 3             |


### **SQL Data Cleaning**

#### ** Remove Duplicates**
```sql
-- Create a temporary table to store DISTINCT records
CREATE TEMPORARY TABLE temp_hr_data AS
SELECT DISTINCT * FROM hr_data;

-- Delete all records from hr_data
DELETE FROM hr_data;

-- Insert DISTINCT records back into hr_data
INSERT INTO hr_data SELECT * FROM temp_hr_data;

-- Drop the temporary table
DROP TEMPORARY TABLE temp_hr_data;
```

#### ** Standardize Categorical Values**
```sql
-- Update Gender to ensure consistent values
UPDATE hr_data
SET Gender = CASE
    WHEN Gender = 'male' THEN 'Male'
    WHEN Gender = 'female' THEN 'Female'
    ELSE Gender
END;

-- Update OverTime to ensure consistent values
UPDATE hr_data
SET OverTime = CASE
    WHEN OverTime = 'yes' THEN 'Yes'
    WHEN OverTime = 'no' THEN 'No'
    ELSE OverTime
END;

-- Update MaritalStatus to ensure consistent values
UPDATE hr_data
SET MaritalStatus = CASE
    WHEN MaritalStatus = 'single' THEN 'Single'
    WHEN MaritalStatus = 'married' THEN 'Married'
    WHEN MaritalStatus = 'divorced' THEN 'Divorced'
    WHEN MaritalStatus = 'widowed' THEN 'Widowed'
    ELSE MaritalStatus
END;

-- Update Attrition to ensure consistent values
UPDATE hr_data
SET Attrition = CASE
    WHEN Attrition = 'yes' THEN 'Yes'
    WHEN Attrition = 'no' THEN 'No'
    ELSE Attrition
END;
```

#### ** Handle Missing Data**
```sql
-- Set default value for Salary if NULL
UPDATE hr_data
SET Salary = 60000
WHERE Salary IS NULL;

-- Set default value for Gender if NULL
UPDATE hr_data
SET Gender = 'Prefer NOT To Say'
WHERE Gender IS NULL;

-- Set default value for OverTime if NULL
UPDATE hr_data
SET OverTime = 'No'
WHERE OverTime IS NULL;

-- Remove rows with missing essential columns
DELETE FROM hr_data
WHERE EmployeeID IS NULL OR ReviewDate IS NULL;

-- Remove impossible values (e.g., Age)
DELETE FROM hr_data
WHERE Age < 18 OR Age > 100;
```



### ** SQL Data Normalization**

```sql
DELIMITER $$

-- Drop procedure if it exists
DROP PROCEDURE IF EXISTS create_hr_star_schema $$

-- Create procedure to normalize data and set up the schema
CREATE PROCEDURE create_hr_star_schema()
BEGIN
    -- Dimension Table: dim_employee
    CREATE TABLE IF NOT EXISTS hr_analysis.dim_employee (
        employee_id VARCHAR(50) PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        gender ENUM('Male', 'Female', 'Non-Binary', 'Prefer NOT To Say'),
        age INT,
        business_travel VARCHAR(50),
        department VARCHAR(50),
        distance_from_home INT,
        state VARCHAR(50),
        ethnicity VARCHAR(50),
        job_role VARCHAR(100),
        marital_status ENUM('Single', 'Married', 'Divorced', 'Widowed'),
        salary INT,
        stock_option_level INT,
        over_time ENUM('Yes', 'No'),
        hire_date DATE,
        attrition ENUM('Yes', 'No'),
        years_at_company INT,
        years_in_most_recent_role INT,
        years_since_last_promotion INT,
        years_with_curr_manager INT
    );

    -- Dimension Table: dim_educationlevel
    CREATE TABLE IF NOT EXISTS hr_analysis.dim_educationlevel (
        education_id INT AUTO_INCREMENT PRIMARY KEY,
        education_level VARCHAR(50) UNIQUE
    );

    -- Dimension Table: dim_ratinglevel
    CREATE TABLE IF NOT EXISTS hr_analysis.dim_ratinglevel (
        rating_id INT AUTO_INCREMENT PRIMARY KEY,
        rating_level VARCHAR(50) UNIQUE
    );

    -- Dimension Table: dim_satisfiedlevel
    CREATE TABLE IF NOT EXISTS hr_analysis.dim_satisfiedlevel (
        satisfaction_id INT AUTO_INCREMENT PRIMARY KEY,
        satisfaction_level VARCHAR(50) UNIQUE
    );

    -- Fact Table: fact_performancerating
    CREATE TABLE IF NOT EXISTS hr_analysis.fact_performancerating (
        fact_id INT AUTO_INCREMENT PRIMARY KEY,
        employee_id VARCHAR(50),
        review_date DATE,
        environment_satisfaction_id INT,
        job_satisfaction_id INT,
        relationship_satisfaction_id INT,
        training_opportunities_within_year INT,
        training_opportunities_taken INT,
        work_life_balance_rating_id INT,
        self_rating INT,
        manager_rating INT,
        FOREIGN KEY (employee_id) REFERENCES hr_analysis.dim_employee(employee_id),
        FOREIGN KEY (environment_satisfaction_id) REFERENCES hr_analysis.dim_satisfiedlevel(satisfaction_id),
        FOREIGN KEY (job_satisfaction_id) REFERENCES hr_analysis.dim_satisfiedlevel(satisfaction_id),
        FOREIGN KEY (relationship_satisfaction_id) REFERENCES hr_analysis.dim_satisfiedlevel(satisfaction_id),
        FOREIGN KEY (work_life_balance_rating_id) REFERENCES hr_analysis.dim_ratinglevel(rating_id)
    );

    -- Insert data into dim_employee
    INSERT IGNORE INTO hr_analysis.dim_employee (employee_id, first_name, last_name, gender, age, business_travel, department, distance_from_home, state, ethnicity, job_role, marital_status, salary, stock_option_level, over_time, hire_date, attrition, years_at_company, years_in_most_recent_role, years_since_last_promotion, years_with_curr_manager)
    SELECT DISTINCT EmployeeID, FirstName, LastName, Gender, Age, BusinessTravel, Department, DistanceFromHome, State, Ethnicity, JobRole, MaritalStatus, Salary, StockOptionLevel, OverTime, HireDate, Attrition, YearsAtCompany, YearsInMostRecentRole, YearsSinceLastPromotion, YearsWithCurrManager
    FROM hr_data;

    -- Insert data into dim_educationlevel
    INSERT IGNORE INTO hr_analysis.dim_educationlevel (education_level)
    SELECT DISTINCT Education FROM hr_data;

    -- Insert data into dim_ratinglevel
    INSERT IGNORE INTO hr_analysis.dim_ratinglevel (rating_level)
    SELECT DISTINCT WorkLifeBalanceRating FROM hr_data;

    -- Insert data into dim_satisfiedlevel
    INSERT IGNORE INTO hr_analysis.dim_satisfiedlevel (satisfaction_level)
    SELECT DISTINCT EnvironmentSatisfaction FROM hr_data
    UNION
    SELECT DISTINCT JobSatisfaction FROM hr_data
    UNION
    SELECT DISTINCT RelationshipSatisfaction FROM hr_data;

    -- Insert data into fact_performancerating
    INSERT INTO hr_analysis.fact_performancerating (employee_id, review_date, environment_satisfaction_id, job_satisfaction_id, relationship_satisfaction_id, training_opportunities_within_year, training_opportunities_taken, work_life_balance_rating_id, self_rating, manager_rating)
    SELECT 
        e.employee_id,
        r.ReviewDate,
        es.satisfaction_id AS environment_satisfaction_id,
        js.satisfaction_id AS job_satisfaction_id,
        rs.satisfaction_id AS relationship_satisfaction_id,
        r.TrainingOpportunitiesWithinYear,
        r.TrainingOpportunitiesTaken,
        wl.rating_id AS work_life_balance_rating_id,
        r.SelfRating,
        r.ManagerRating
    FROM hr_data r
    LEFT JOIN hr_analysis.dim_employee e ON r.EmployeeID = e.employee_id
    LEFT JOIN hr_analysis.dim_satisfiedlevel es ON r.EnvironmentSatisfaction = es.satisfaction_level
    LEFT JOIN hr_analysis.dim_satisfiedlevel js ON r.JobSatisfaction = js.satisfaction_level
    LEFT JOIN hr_analysis.dim_satisfiedlevel rs ON r.RelationshipSatisfaction = rs.satisfaction_level
    LEFT JOIN hr_analysis.dim_ratinglevel wl ON r.WorkLifeBalanceRating = wl.rating_level;

END $$

DELIMITER ;

-- Call the procedure to create the HR star schema
CALL create_hr_star_schema();
```

## Here is the table representation of the data for education levels:

| EducationID | Education Level         |
|-------------|-------------------------|
| 1           | No Formal Qualifications |
| 2           | High School             |
| 3           | Bachelors               |
| 4           | Masters                 |
| 5           | Doctorate               |

## Here is the table representation of the job satisfaction levels:

| JobSatisfactionID | Job Satisfaction Level |
|-------------------|------------------------|
| 1                 | Very Dissatisfied      |
| 2                 | Dissatisfied           |
| 3                 | Neutral                |
| 4                 | Satisfied              |
| 5                 | Very Satisfied         |

## Here is the table representation of the performance ratings:

| PerformanceRatingID | Performance Rating     |
|---------------------|------------------------|
| 1                   | Unacceptable           |
| 2                   | Needs Improvement      |
| 3                   | Meets Expectation      |
| 4                   | Exceeds Expectation    |
| 5                   | Above and Beyond       |

## Here is the employee table based on the provided data:

| EmployeeID | FirstName | LastName | Gender   | Age | BusinessTravel | Department       | DistanceFromHome | State | Ethnicity          | EducationID | EducationField   | JobRole             | MaritalStatus | Salary | StockOptionLevel | OverTime | HireDate   | Attrition | YearsAtCompany | YearsInMostRecentRole | YearsSinceLastPromotion | YearsWithCurrManager | ReviewDate | EnvironmentSatisfaction | JobSatisfaction | RelationshipSatisfaction | TrainingOpportunitiesWithinYear | TrainingOpportunitiesTaken | WorkLifeBalanceRating | SelfRating | ManagerRating |
|------------|-----------|----------|----------|-----|-----------------|------------------|------------------|-------|--------------------|-------------|------------------|----------------------|---------------|--------|------------------|----------|------------|-----------|----------------|-----------------------|--------------------------|----------------------|------------|------------------------|-----------------|--------------------------|--------------------------------|---------------------------|-----------------------|------------|---------------|
| 3012-1A41  | Leonelle  | Simco    | Female   | 30  | Some Travel     | Sales            | 27               | IL    | White              | 5           | Marketing         | Sales Executive      | Divorced     | 102059 | 1                | No       | 2012-01-03 | No        | 10             | 4                     | 9                        | 7                     | 2014-10-31 | Neutral                | Satisfied        | Dissatisfied            | 1                              | 0                         | Meets Expectation      | 4          | 3             |
| CBCB-9C9D  | Leonerd   | Aland    | Male     | 38  | Some Travel     | Sales            | 23               | CA    | White              | 4           | Marketing         | Sales Executive      | Single      | 157718 | 0                | Yes      | 2012-01-04 | No        | 10             | 6                     | 10                       | 0                     | 2015-03-25 | Very Satisfied         | Satisfied        | Satisfied               | 2                              | 1                         | Meets Expectation      | 5          | 4             |
| 95D7-1CE9  | Ahmed     | Sykes    | Male     | 43  | Some Travel     | Human Resources  | 29               | CA    | Asian or Asian American | 4           | Marketing         | HR Business Partner  | Married     | 309964 | 1                | No       | 2012-01-04 | No        | 10             | 6                     | 10                       | 8                     | 2016-02-28 | Satisfied               | Satisfied        | Very Satisfied         | 4                              | 0                         | Exceeds Expectation    | 3          | 5             |
| 47A0-559B  | Ermentrude| Berrie   | Non-Binary| 39  | Some Travel     | Technology       | 12               | IL    | White              | 3           | Computer Science  | Engineering Manager  | Married     | 293132 | 0                | No       | 2012-01-05 | No        | 10             | 10                    | 10                       | 0                     | 2018-07-23 | Very Dissatisfied       | Neutral          | Dissatisfied            | 3                              | 2                         | Needs Improvement      | 5          | 3             |
| 42CC-040A  | Stace     | Savege   | Female   | 29  | Some Travel     | Human Resources  | 29               | CA    | White              | 2           | Technical Degree  | Recruiter            | Single      | 49606  | 0                | Yes      | 2012-01-05 | Yes       | 6              | 1                     | 1                        | 6                     | 2017-02-01 | Very Satisfied         | Very Satisfied   | Very Satisfied          | 1                              | 1                         | Exceeds Expectation    | 5          | 5             |


## Here is the **Performance** table based on the provided data:

| PerformanceID | EmployeeID | ReviewDate | JobSatisfaction | EnvironmentSatisfaction | RelationshipSatisfaction | WorkLifeBalanceRating | SelfRating | ManagerRating |
|---------------|------------|------------|-----------------|--------------------------|--------------------------|-----------------------|------------|---------------|
| PR01          | 79F7-78EC  | 1/2/2013   | 5               | 4                        | 5                        | 1                     | 0          | 4             |
| PR02          | B61E-0F26  | 1/3/2013   | 5               | 4                        | 4                        | 1                     | 3          | 4             |
| PR03          | F5E3-48BB  | 1/3/2013   | 3               | 4                        | 5                        | 3                     | 2          | 3             |
| PR04          | 0678-748A  | 1/4/2013   | 5               | 3                        | 2                        | 2                     | 0          | 2             |
| PR05          | 541F-3E19  | 1/4/2013   | 5               | 2                        | 3                        | 1                     | 0          | 4             |

### Step 2: Power BI Integration

**2.1 Data Import**

- **Import Cleaned Data**: Import the cleaned and normalized data from the SQL database into Power BI.

Here is the full content for the `README.md` file based on your request:

---

## DimDate

The **DimDate** table is an essential part of the HR Analytics Dashboard in Power BI. It enables time-based analysis across multiple dimensions such as year, quarter, month, week, and fiscal year, based on employee data. By creating a calendar table with a range that spans the minimum and maximum hire dates in the **Dim_Employee** table, the **DimDate** table allows HR teams to perform detailed trend analyses on employee performance, satisfaction, attrition, and other HR metrics.

## Purpose

The **DimDate** table facilitates time intelligence calculations in Power BI, enabling HR professionals to analyze trends in employee data over different periods. This table helps categorize and group data by year, quarter, month, week, and fiscal period for reporting and analysis.

## Table Structure

The **DimDate** table includes several useful date-related columns that provide insights into time-based patterns in HR data:

### 1. **Year**
- Numeric representation of the year (e.g., 2023).

### 2. **Year Start & Year End**
- The start and end dates of each year (e.g., January 1st and December 31st).

### 3. **Month Number**
- The month number (1 to 12, where 1 = January, 12 = December).

### 4. **Month Start & Month End**
- The start and end dates for each month (e.g., January 1st to January 31st).

### 5. **Days in Month**
- The total number of days in each month (e.g., 31 for January, 28 or 29 for February).

### 6. **Year-Month Number**
- A concatenated value representing both the year and month in numeric format (e.g., "202311" for November 2023).

### 7. **Year-Month Name**
- A concatenated text representation of the year and month (e.g., "2023-Nov").

### 8. **Day Number**
- The day of the month (e.g., 1 for the 1st day of the month).

### 9. **Day Name & Day Name Short**
- The full name (e.g., "Monday") and short name (e.g., "Mon") of the day.

### 10. **Day of Week**
- Numeric representation of the day of the week (1 = Sunday, 7 = Saturday).

### 11. **Month Name & Month Name Short**
- The full name of the month (e.g., "January") and short name (e.g., "Jan").

### 12. **Quarter**
- The fiscal quarter for the date (e.g., 1 for Q1, 2 for Q2, etc.).

### 13. **Quarter Name**
- The name of the quarter (e.g., "Q1" for the first quarter).

### 14. **Year-Quarter Number**
- A concatenation of year and quarter (e.g., "2023Q1" for Q1 of 2023).

### 15. **Quarter Start & Quarter End**
- The start and end dates of the fiscal quarter (e.g., Q1 starts January 1st and ends March 31st).

### 16. **Week Number**
- The week number of the year (e.g., 1 for the first week of the year).

### 17. **Week Start & Week End**
- The start and end dates for each week.

### 18. **Fiscal Year**
- The fiscal year for the date, calculated based on the fiscal start month.

### 19. **Fiscal Quarter**
- The fiscal quarter number based on the fiscal year.

### 20. **Fiscal Month**
- The fiscal month number (1 to 12) adjusted according to the fiscal year start.

## Code to Create DimDate Table

The following DAX code creates the **DimDate** table. It takes into account the minimum and maximum hire dates in the **Dim_Employee** table to create a calendar table that spans the entire range of hire dates.

```DAX
DimDate = 
VAR _minYear = YEAR(MIN(Dim_Employee[HireDate]))
VAR _maxYear = YEAR(MAX(Dim_Employee[HireDate]))
VAR _fiscalStart = 4  -- Fiscal year start month (April)

RETURN
ADDCOLUMNS(
    CALENDAR(
        DATE(_minYear,1,1),  -- Start date: The first date of the minimum year found in Dim_Employee[HireDate]
        DATE(_maxYear,12,31) -- End date: The last date of the maximum year found in Dim_Employee[HireDate]
    ),
    "Year", YEAR([Date]),
    "Year Start", DATE(YEAR([Date]), 1, 1),
    "Year End", DATE(YEAR([Date]), 12, 31),
    "Month Number", MONTH([Date]),
    "Month Start", DATE(YEAR([Date]), MONTH([Date]), 1),
    "Month End", EOMONTH([Date], 0),
    "Days in Month", DATEDIFF(DATE(YEAR([Date]), MONTH([Date]), 1), EOMONTH([Date], 0), DAY) + 1,
    "Year-Month Number", INT(FORMAT([Date], "YYYYMM")),
    "Year-Month Name", FORMAT([Date], "YYYY-MMM"),
    "Day Number", DAY([Date]),
    "Day Name", FORMAT([Date], "DDDD"),
    "Day Name Short", FORMAT([Date], "DDD"),
    "Day of Week", WEEKDAY([Date]),
    "Month Name", FORMAT([Date], "MMMM"),
    "Month Name Short", FORMAT([Date], "MMM"),
    "Quarter", QUARTER([Date]),
    "Quarter Name", "Q" & FORMAT([Date], "Q"),
    "Year-Quarter Number", INT(FORMAT([Date], "YYYYQ")),
    "Year-Quarter Name", FORMAT([Date], "YYYY") & " Q" & FORMAT([Date], "Q"),
    "Quarter Start", DATE(YEAR([Date]), (QUARTER([Date]) * 3) - 2, 1),
    "Quarter End", EOMONTH(DATE(YEAR([Date]), QUARTER([Date]) * 3, 1), 0),
    "Week Number", WEEKNUM([Date]),
    "Week Start", [Date] - WEEKDAY([Date]) + 1,
    "Week End", [Date] + 7 - WEEKDAY([Date]),
    "Fiscal Year", IF(_fiscalStart = 1, YEAR([Date]), YEAR([Date]) + QUOTIENT(MONTH([Date]) + (13 - _fiscalStart), 13)),
    "Fiscal Quarter", QUARTER(DATE(YEAR([Date]), MOD(MONTH([Date]) + (13 - _fiscalStart) - 1, 12) + 1, 1)),
    "Fiscal Month", MOD(MONTH([Date]) + (13 - _fiscalStart) - 1, 12) + 1
)
```
Once the **DimDate** table is created, it can be linked to other tables such as **Dim_Employee** and **Fact_PerformanceRating** using date-based relationships. This allows users to create time-based visualizations such as trends, comparisons, and performance evaluations across different time periods.

### Example Use Cases:
- Analyzing employee performance over different fiscal quarters.
- Visualizing attrition trends month-by-month or year-by-year.
- Tracking employee satisfaction by different time periods (e.g., year, quarter).

---

**2.2 Relationships**

- **Build Relationships**: Establish relationships between the dimension tables and fact table, using relevant keys such as `employee_id`, `department`, and `satisfaction_level`.

---

### Step 3: Dashboard Development

**Page 1: Employee Overview**

- **Title**: Employee Overview
- **Subtitle**: Summary of Active Employees and Hiring Trends

**Visuals**:
1. **Bar Chart**: Active Employees by Education Level and Gender.
2. **Clustered Column Chart**: Employee Hiring Trends over time.
3. **Table**: Active Employees by Department and Job Role.
4. **KPI Cards**:
   - Total Employees
   - Active Employees
   - Inactive Employees
   - Attrition Rate
**Interactive Features**:
- Slicers to filter data by **Department**, **Gender**, and **Job Role**.
- Navigation buttons to switch between pages.

Here are the DAX formulas for the metrics you requested:

### 1. **Total Employees**

This measure counts the total number of employees in the dataset.

```DAX
Total Employees = COUNTROWS(Employee)
```

### 2. **Active Employees**

This measure counts the number of active employees, where the **Attrition** column is 0 (assuming 0 indicates active status).

```DAX
Active Employees = CALCULATE(COUNTROWS(Employee), Employee[Attrition] = 0)
```

### 3. **Inactive Employees**

This measure counts the number of inactive employees, where the **Attrition** column is 1 (assuming 1 indicates an inactive status, such as employees who left).

```DAX
Inactive Employees = CALCULATE(COUNTROWS(Employee), Employee[Attrition] = 1)
```

### 4. **Attrition Rate**

This measure calculates the attrition rate, which is the percentage of inactive employees out of the total employees.

```DAX
Attrition Rate = DIVIDE([Inactive Employees], [Total Employees], 0)
```

- The `DIVIDE` function ensures that if the **Total Employees** is 0 (e.g., in cases where no employees are present), the result will be 0 instead of an error.

These DAX measures should work as expected if you have an **Attrition** column (with values like 0 for active employees and 1 for inactive employees). Let me know if you need any adjustments or further assistance!

---

**Page 2: Employee Performance Metrics**

- **Title**: Employee Performance Metrics
- **Subtitle**: Review Job Satisfaction and Work-Life Balance Trends

**Visuals**:
1. **KPI Cards**:
   - Hire Date
   - Last Review Date
   - Next Review Date (calculated field)
2. **Gauge Chart**: Job Satisfaction Score
3. **Gauge Chart**: Work-Life Balance Score
4. **Line Charts**:
   - Job Satisfaction by Year
   - Relationship Satisfaction by Year
   - Work-Life Balance by Year
   - Self-Rating by Year
   - Environment Satisfaction by Year
   - Manager Rating by Year

**Interactive Features**:
- Slicers to filter data by **Employee**, **Department**, and **Date Range**.
- Navigation buttons for page switching.


### **Next Review Date (calculated field)**

This DAX formula calculates the **Next Review Date** by checking the employee’s last review date and then adding 365 days (one year). If no review has occurred yet, it will calculate the next review based on the hire date plus one year.

```DAX
NextReviewDate = 
VAR SelectedEmployeeID = SELECTEDVALUE(Dim_Employee[EmployeeID])
VAR LastReview =
    MAXX(
        FILTER(
            Fact_PerformanceRating,
            Fact_PerformanceRating[EmployeeID] = SelectedEmployeeID
                && NOT(ISBLANK(Fact_PerformanceRating[ReviewDate]))
        ),
        Fact_PerformanceRating[ReviewDate]
    )
VAR HireDate = SELECTEDVALUE(Dim_Employee[HireDate])
VAR NextReview =
    IF(
        ISBLANK(LastReview),
        DATE(YEAR(HireDate) + 1, MONTH(HireDate), DAY(HireDate)),
        LastReview + 365
    )
RETURN
    FORMAT(NextReview, "MM/dd/yyyy")
```

### Explanation:
- **`SelectedEmployeeID = SELECTEDVALUE(Dim_Employee[EmployeeID])`**: This stores the ID of the selected employee.
- **`LastReview = MAXX(...)`**: This gets the most recent review date from the **Fact_PerformanceRating** table.
- **`NextReview`**: If there's no **LastReview**, it will calculate the next review date as one year from the **HireDate**. Otherwise, it adds 365 days to the **LastReview** date.
- **`FORMAT(NextReview, "MM/dd/yyyy")`**: This formats the **NextReview** date as **MM/dd/yyyy**.

### **Last Review Date (calculated field)**

This DAX formula calculates the **Last Review Date** by checking the most recent review date from the **Fact_PerformanceRating** table. If no review exists, it returns "No review has happened".

```DAX
LastReviewDate = 
VAR SelectedEmployeeID = SELECTEDVALUE(Dim_Employee[EmployeeID])
VAR LastReview =
    MAXX(
        FILTER(
            Fact_PerformanceRating,
            Fact_PerformanceRating[EmployeeID] = SelectedEmployeeID
                && NOT(ISBLANK(Fact_PerformanceRating[ReviewDate]))
        ),
        Fact_PerformanceRating[ReviewDate]
    )
RETURN
    IF(ISBLANK(LastReview), "No review has happened", FORMAT(LastReview, "MM/dd/yyyy"))
```

### Explanation:
- **`SelectedEmployeeID = SELECTEDVALUE(Dim_Employee[EmployeeID])`**: This stores the ID of the selected employee.
- **`LastReview = MAXX(...)`**: This retrieves the most recent **ReviewDate** for the selected employee.
- **`IF(ISBLANK(LastReview), "No review has happened", ...)`**: If there is no **LastReview** date, it returns "No review has happened". Otherwise, it formats and returns the **LastReview** date as **MM/dd/yyyy**.

These DAX formulas will work in your Power BI model and display the **Next Review Date** and **Last Review Date** accurately for each employee.

---

**Page 3: Employee Demographics**

- **Title**: Employee Demographics
- **Subtitle**: Understand Employee Diversity and Performance Trends

**Visuals**:
1. **Column-Line Chart**: Total Employees and Average Salary by Ethnicity.
2. **Line Chart**: Employee Performance Trends Over Time.
3. **Bar Chart**: Age Distribution of Employees.
4. **Bar Chart**: Active Employees by Marital Status.
5. **Treemap**: Job Satisfaction by Job Role.
6. **KPI Cards**:
   - Youngest Age
   - Oldest Age
   - Average Age
   - Active Employees

**Interactive Features**:
- Include slicers to filter by **Gender**, **Marital Status**, and **Ethnicity**.
- Add navigation buttons for smooth transitions between pages.

### **Youngest Age (KPI Card)**

This DAX formula calculates the youngest age of all employees by finding the minimum value of the `Age` column in the **Dim_Employee** table.

```DAX
YoungestAge = 
MIN(Dim_Employee[Age])
```

### **Oldest Age (KPI Card)**

This DAX formula calculates the oldest age of all employees by finding the maximum value of the `Age` column in the **Dim_Employee** table.

```DAX
OldestAge = 
MAX(Dim_Employee[Age])
```

### **Average Age (KPI Card)**

This DAX formula calculates the average age of all employees by calculating the mean of the `Age` column in the **Dim_Employee** table.

```DAX
AverageAge = 
AVERAGE(Dim_Employee[Age])
```

### **Active Employees (KPI Card)**

This DAX formula calculates the number of active employees. Here, it assumes that **Attrition** is a column in the **Dim_Employee** table and "Yes" means the employee has left, while "No" means the employee is still active. The formula counts employees where **Attrition = "No"**.

```DAX
ActiveEmployees = 
CALCULATE(
    COUNTROWS(Dim_Employee),
    Dim_Employee[Attrition] = "No"
)
```

---

**Page 4: Attrition Insights**

- **Title**: Attrition Insights
- **Subtitle**: Detailed Reporting on Attrition and Satisfaction Trends

**Visuals**:
1. **Line Chart**: Attrition by Hire Date.
2. **Bar Chart**: Attrition Employees by Education Level and Gender.
3. **Bar Chart**: Job Satisfaction by Age Group and Gender.
4. **Clustered Bar Chart**: Attrition Employees by Department and Gender.
5. **KPI Cards**:
   - Total Attrition
   - Highest Attrition Department
   - Lowest Satisfaction Department

**Interactive Features**:
- Slicers to filter by **Department**, **Education Level**, and **Gender**.
- Add navigation buttons for smooth transitions between pages.

### **Total Attrition (KPI Card)**

This DAX formula calculates the total number of employees who have left the company, assuming the **Attrition** column in the **Dim_Employee** table has a value of "Yes" for employees who left.

```DAX
TotalAttrition = 
CALCULATE(
    COUNTROWS(Dim_Employee),
    Dim_Employee[Attrition] = "Yes"
)
```

### **Highest Attrition Department (KPI Card)**

This DAX formula calculates the department with the highest attrition rate. It assumes you have a **Department** column in the **Dim_Employee** table and the **Attrition** column for tracking if an employee has left. This formula finds the department with the maximum attrition rate.

```DAX
HighestAttritionDepartment = 
VAR DepartmentAttritionRate =
    SUMMARIZE(
        Dim_Employee,
        Dim_Employee[Department],
        "AttritionCount", 
            CALCULATE(COUNTROWS(Dim_Employee), Dim_Employee[Attrition] = "Yes"),
        "TotalCount", 
            COUNTROWS(Dim_Employee)
    )
VAR DepartmentWithMaxAttrition = 
    TOPN(
        1, 
        DepartmentAttritionRate, 
        [AttritionCount] / [TotalCount], 
        DESC
    )
RETURN
    MAXX(DepartmentWithMaxAttrition, Dim_Employee[Department])
```

### **Lowest Satisfaction Department (KPI Card)**

This DAX formula calculates the department with the lowest average satisfaction level. It assumes you have a **Department** column in the **Dim_Employee** table and a satisfaction level column in the **Fact_PerformanceRating** table (e.g., **JobSatisfaction**, **EnvironmentSatisfaction**). Here, we use **JobSatisfaction** as an example.

```DAX
LowestSatisfactionDepartment = 
VAR DepartmentSatisfaction =
    SUMMARIZE(
        Dim_Employee,
        Dim_Employee[Department],
        "AvgSatisfaction", 
            CALCULATE(AVERAGE(Fact_PerformanceRating[JobSatisfaction]))
    )
VAR DepartmentWithMinSatisfaction = 
    TOPN(
        1, 
        DepartmentSatisfaction, 
        [AvgSatisfaction], 
        ASC
    )
RETURN
    MAXX(DepartmentWithMinSatisfaction, Dim_Employee[Department])
```
---

### Additional Features

1. **Navigation Buttons**:
   - Place interactive buttons on each page for seamless navigation between pages.
2. **Dynamic Titles and Filters**:
   - Ensure that the titles and visuals update dynamically based on slicer selections, providing a more personalized dashboard experience.

---

### Step 6: Final Review & Presentation

**6.1 Visual Design**: Ensure that all visuals are clear, consistent, and easy to interpret. Use color schemes and formats that enhance readability and make the dashboard user-friendly.

**6.2 Sharing**:
   - Save the Power BI report as a `.pbix` file.
   - Prepare a detailed summary report that explains the key findings from the dashboard, the data sources, and how HR teams can use the insights for decision-making.

---

## Key Technologies & Tools Used:

- **SQL**: For data import, normalization, and transformation.
- **Power BI**: For building the interactive dashboard and visualizations.
- **DAX**: For calculated fields and measures in Power BI.

---

## Conclusion

This HR Analytics Dashboard is a powerful tool for HR teams to monitor employee performance, satisfaction, and demographics. By integrating SQL-based data into Power BI, it provides a comprehensive view of key HR metrics, enabling teams to make data-driven decisions that improve overall organizational performance and employee satisfaction.

---

## 👤 Author

[![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/shaun-mia)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/shaun-mia/)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:shaunmia.cse@gmail.com)
