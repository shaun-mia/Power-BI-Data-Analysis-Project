# Bangladesh Crime Analysis 2024

## Overview

This project involves the analysis of crime data across Bangladesh for the year 2024. The dataset includes crime statistics from various police units, covering both Metropolitan areas and Regional areas. The goal is to summarize the crime data, display top crimes by unit, and visualize the distribution of crime types for each unit.

## Key Features

- **Crime Distribution Analysis**: Crime data is categorized by different crime types, including robbery, murder, theft, etc.
- **Metropolitan vs. Regional Crime Comparison**: Visualizations and KPIs show differences in crime distribution between Metropolitan and Regional areas.
- **Top 5 Crimes**: The top 5 most frequent crimes are highlighted for each police unit.
- **Yearly Crime Statistics**: The overall crime statistics are summarized for the year 2024, with specific KPIs focusing on total crimes by crime type.

## Data Structure

The data consists of multiple columns representing different crime types and police units:

- **Crime_Statistics_2024 Table Columns**:
  - `Names of Unit`: (e.g., DMP, CMP, KMP, etc.)
  - `Dacoity`, `Robbery`, `Murder`, `Speedy Trial`, `Riot`, `Woman & Child Repression`, `Kidnapping`, `Police Assault`, `Burglary`, `Theft`, `Other Cases`, `Arms Act`, `Explosive Act`, `Narcotics`, `Smuggling`: Crime types
  - Each row contains crime statistics for a specific unit.

## Steps Involved

### 1. Data Restructuring

We need to reshape the crime statistics data to create a more manageable format for analysis. This is done using DAX to pivot the crime data.

**Restructured Data for Metropolitan Units**:

```dax
Metropolitan_Crime_Restructure = 
UNION(
    SELECTCOLUMNS(FILTER(Crime_Statistics_2024, [Names of Unit] IN {"DMP", "CMP", "KMP", "RMP", "BMP", "SMP", "RPMP", "GMP"}),
    "Names of Unit", [Names of Unit],
    "Crime Type", "Dacoity", "Crime Count", [Dacoity]),

    SELECTCOLUMNS(FILTER(Crime_Statistics_2024, [Names of Unit] IN {"DMP", "CMP", "KMP", "RMP", "BMP", "SMP", "RPMP", "GMP"}),
    "Names of Unit", [Names of Unit],
    "Crime Type", "Robbery", "Crime Count", [Robbery]),
    
    -- Repeat for each crime type...
)
```

**Restructured Data for Range Units**:

```dax
Range_Crime_Restructure = 
UNION(
    SELECTCOLUMNS(FILTER(Crime_Statistics_2024, [Names of Unit] IN {"Dhaka Range", "Mymensingh Range", "Chittagong Range", "Sylhet Range", "Khulna Range", "Barishal Range", "Rajshahi Range", "Rangpur Range", "Railway Range"}),
    "Names of Unit", [Names of Unit],
    "Crime Type", "Dacoity", "Crime Count", [Dacoity]),

    SELECTCOLUMNS(FILTER(Crime_Statistics_2024, [Names of Unit] IN {"Dhaka Range", "Mymensingh Range", "Chittagong Range", "Sylhet Range", "Khulna Range", "Barishal Range", "Rajshahi Range", "Rangpur Range", "Railway Range"}),
    "Names of Unit", [Names of Unit],
    "Crime Type", "Robbery", "Crime Count", [Robbery]),
    
    -- Repeat for each crime type...
)
```

### 2. DAX Measures for Summing Crime Cases

After restructuring the data, create DAX measures to calculate the total cases for each unit.

**Example Measure** for Total Crimes in DMP:

```dax
DMP_Total_Crimes = 
CALCULATE(SUM(Metropolitan_Crime_Restructure[Crime Count]), 
    Metropolitan_Crime_Restructure[Names of Unit] = "DMP")
```

Repeat similar DAX measures for other units and crime types.

### 3. Visualization in Power BI

Use the restructured data and DAX measures to create visualizations:

1. **Top 5 Crimes for Each Unit**: Use bar charts or column charts to visualize the top 5 crime types in each unit.
2. **Crime Distribution by Unit**: Create a stacked bar chart or pie chart to show the distribution of crime types across different units.
3. **Monthly Crime Trends**: A line chart can display monthly trends in crime cases.

**Top 5 Crimes in DMP**:

- Create a table or bar chart.
- Add `Names of Unit` and `Crime Type` as dimensions.
- Use `Crime Count` as the value.
- Sort the crime types by descending count to display the top 5.

### 4. KPIs

Some useful KPIs to display on the dashboard:

- **Total Crime Cases**: The total number of crime cases across all units.
  
```dax
Total_Crime_Cases = SUM(Crime_Statistics_2024[Dacoity]) + 
                    SUM(Crime_Statistics_2024[Robbery]) + 
                    SUM(Crime_Statistics_2024[Murder]) + 
                    -- Include all other crime types
```

- **Highest Crime Unit**: Display the unit with the highest number of total crime cases.

```dax
Highest_Crime_Unit = 
CALCULATE(
    MAXX(
        VALUES(Crime_Statistics_2024[Names of Unit]),
        [Total Crime Cases]
    )
)
```

### 5. Dashboard Design

#### Title and Subtitle

For a cohesive design, the page titles and subtitles could be:

- **Title**: "Bangladesh Crime Analysis 2024"
- **Subtitle**: "Crime Distribution and Trends across Metropolitan and Regional Units"

### 6. Final Dashboard

Once the data is restructured and measures are created, use Power BI to place the visualizations on a dashboard. Arrange them as follows:

- **Top Section**: KPIs (Total Crime Cases, Highest Crime Unit)
- **Middle Section**: Crime Distribution (Bar charts showing crime types for each unit)
- **Bottom Section**: Top 5 Crimes for each unit


Live Dashboard: https://shaun-mia.netlify.app/projects/bangladesh-crime-data-analysis-2024

Download the PDF dataset from the official website: [police.gov.bd](https://www.police.gov.bd/storage/upload/announcement/AMFCcIkA46b4sL1ijCMtSrzTE24Rd)

---

## Conclusion

This project provides a detailed overview of crime statistics in Bangladesh for the year 2024, offering insights into the distribution and trends of crime across different police units. The dashboard allows stakeholders to make informed decisions based on real-time crime data.


## 👤 Author

[![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/shaun-mia)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/shaun-mia/)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:shaunmia.cse@gmail.com)
