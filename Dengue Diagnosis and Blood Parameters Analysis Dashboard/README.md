
# Dengue Diagnosis and Blood Parameters Analysis Dashboard

This dashboard provides a detailed analysis of dengue case data, focusing on age demographics, diagnostic trends, and key blood parameters. Designed in Power BI, it includes a series of pages that allow users to explore data through interactive visuals, slicers, and KPIs, making it easier to identify trends and potential risk factors in dengue diagnosis. You can view the dashboard live on my [portfolio site](https://shaun-mia.github.io/).

---

### Dashboard Pages

#### **Page 1: Overview of Dengue Cases**
- **Purpose**: High-level summary of key metrics and trends in dengue cases.
- **Visuals**: Total cases, positive/negative counts, and basic demographic distribution.
- **KPIs**:
  - **Total Positive Cases**: 
    ```DAX
    Total Positive = CALCULATE(COUNTROWS(Dengue-Dataset), Dengue-Dataset[Result] = "positive")
    ```
  - **Total Negative Cases**: 
    ```DAX
    Total Negative = CALCULATE(COUNTROWS(Dengue-Dataset), Dengue-Dataset[Result] = "negative")
    ```

#### **Page 2: Age and Result Trends**
- **Purpose**: Explore age-based patterns in dengue test results.
- **Visuals**:
  - **Age Group Distribution** (Bar Chart)
  - **Result Count by Age Group** (Stacked Bar Chart)
  - **Age vs Positive Cases** (Line Chart)
  - **Gender and Age Group Distribution** (Clustered Column Chart)
- **DAX Measures**:
  - **Age Group Calculation**:
    ```DAX
    Age_Group = 
    SWITCH(
        TRUE(),
        'Dengue-Dataset'[Age] >= 5 && 'Dengue-Dataset'[Age] <= 12, "5-12",
        'Dengue-Dataset'[Age] >= 13 && 'Dengue-Dataset'[Age] <= 20, "13-20",
        'Dengue-Dataset'[Age] >= 21 && 'Dengue-Dataset'[Age] <= 28, "21-28",
        'Dengue-Dataset'[Age] >= 29 && 'Dengue-Dataset'[Age] <= 36, "29-36",
        'Dengue-Dataset'[Age] >= 37 && 'Dengue-Dataset'[Age] <= 44, "37-44",
        'Dengue-Dataset'[Age] >= 45 && 'Dengue-Dataset'[Age] <= 52, "45-52",
        'Dengue-Dataset'[Age] >= 53 && 'Dengue-Dataset'[Age] <= 60, "53-60",
        'Dengue-Dataset'[Age] >= 61 && 'Dengue-Dataset'[Age] <= 68, "61-68",
        'Dengue-Dataset'[Age] >= 69 && 'Dengue-Dataset'[Age] <= 76, "69-76",
        'Dengue-Dataset'[Age] >= 77 && 'Dengue-Dataset'[Age] <= 80, "77-80",
        "Other"
    )
    ```

#### **Page 3: Hematological Analysis**
- **Purpose**: Analyze blood parameters such as hemoglobin, WBC, and platelet count.
- **Visuals**:
  - **Blood Parameter Comparison by Result** (Box Plot)
  - **WBC vs Platelet Count** (Scatter Plot)
  - **Correlation Heatmap** (Matrix Chart)
  - **Average Platelet and Hemoglobin Levels by Result** (Clustered Bar Chart)
- **DAX Measures**:
  - **Average Hemoglobin**:
    ```DAX
    Avg Hemoglobin = AVERAGE(Dengue-Dataset[Hemoglobin(g/dl)])
    ```
  - **Average Platelet Count**:
    ```DAX
    Avg Platelet = AVERAGE(Dengue-Dataset[Total Platelet Count(/cumm)])
    ```
  - **Average WBC Count**:
    ```DAX
    Avg WBC = AVERAGE(Dengue-Dataset[Total WBC count(/cumm)])
    ```
  - **Hemoglobin and WBC Correlation**:
    ```DAX
    Correlation_Hemoglobin_WBC = 
    CORREL('Dengue-Dataset'[Hemoglobin(g/dl)], 'Dengue-Dataset'[Total WBC count(/cumm)])
    ```

#### **Page 4: Demographic and Result Correlations**
- **Purpose**: Investigate how demographic and blood parameters influence dengue test results.
- **Visuals**:
  - **Decomposition Tree**: Breaks down by age, gender, and blood parameters.
  - **Sankey Diagram**: Shows demographic flow to result (positive/negative).
  - **Waterfall Chart**: Depicts the impact of blood parameters on results.
- **Insights**: This page enables deeper analysis by allowing users to filter by age group, gender, and blood metrics to observe trends.

---

### Key Insights
- **Age-Related Trends**: Identifies high-risk age groups.
- **Blood Parameter Analysis**: Highlights patterns in WBC, platelet, and hemoglobin levels, showing how they correlate with positive results.
- **Demographic Influences**: Shows the impact of gender and age on dengue test results.

### Interaction and Slicers
- **Demographic Slicers**: Gender, Age Group, and Result-based filters on relevant pages enable dynamic exploration.
- **Linked Visuals**: Visuals on each page are interconnected to allow users to explore how changes in one metric affect others.


Live Dashboard: https://lnkd.in/g2UWZNqP

Download the PDF dataset from the official website: [police.gov.bd](https://www.police.gov.bd/storage/upload/announcement/AMFCcIkA46b4sL1ijCMtSrzTE24Rd)

---


## 👤 Author

[![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/shaun-mia)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/shaun-mia/)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:shaunmia.cse@gmail.com)
