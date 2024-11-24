
# Movies Analytics Dashboard

## Overview

The **Movies Analytics Dashboard** is an interactive Power BI dashboard built to provide detailed insights into movie performance, actor demographics, financials, and industry trends. The dashboard leverages data from multiple tables to create a comprehensive view of movies, including performance metrics like revenue, budget, IMDb ratings, and actor contributions. By using DAX calculations and visualizations, this project helps stakeholders in the movie industry make data-driven decisions.

 You can view the dashboard live on my [portfolio site](https://shaun-mia.github.io/).
 Or [Web](https://app.powerbi.com/view?r=eyJrIjoiYjMwZTBkMzktMmVkNS00NmFmLWI5ZDUtZTRjMjk0MTM5MDk1IiwidCI6IjEyYjQwYmQxLTllNjEtNDMyOS1iNGJmLTk2MjQ1NTgzOGQ4OCIsImMiOjEwfQ%3D%3D)
---

## Features

- **Movie Performance Analysis**: Insights into box office performance, production budgets, and IMDb ratings segmented by industry and language.
- **Actor Demographics & Performance**: Detailed analysis of actors, including the youngest actor, number of movies per actor, and their contribution to movie revenue.
- **Industry Trends**: Analyzes movies based on industry (e.g., Bollywood, Hollywood), release year, and financial success.
- **Currency Conversion**: Handles different currencies (INR, USD) for standardized financial analysis.
- **User Interactivity**: Interactive visuals that allow users to filter and drill down by industry, language, release year, and more.

---

## Data Model

The dashboard uses data from the following tables:

1. **Movies Table**: 
   - Columns: `movie_id`, `title`, `industry`, `release_year`, `imdb_rating`, `studio`, `language_id`.
   
2. **Actor Table**:
   - Columns: `actor_id`, `name`, `birth_year`.
   
3. **Financials Table**:
   - Columns: `movie_id`, `budget`, `box_office_collection`, `unit`, `currency`.
   
4. **Language Table**:
   - Columns: `language_id`, `name` (e.g., Hindi, Telugu, Kannada).

---

## DAX Formulas

### **1. Youngest Actor's Birth Year**

This measure calculates the youngest actor's birth year.

```DAX
Youngest Actor Birth Year = MAX(actors[birth_year])
```

### **2. Youngest Actor's Name**

This measure retrieves the name of the youngest actor based on their birth year.

```DAX
Youngest Actor Name = 
VAR YoungestYear = [Youngest Actor Birth Year]
RETURN
CALCULATE(
    FIRSTNONBLANK(actors[name], 1),
    FILTER(
        actors,
        actors[birth_year] = YoungestYear
    )
)
```

### **3. Total Budget Measure**

This measure calculates the total production budget in USD, considering different currencies.

```DAX
Total Budget = 
SWITCH(
    TRUE(),
    financials[currency] = "INR", financials[budget] * 0.012,  -- Conversion Rate INR to USD
    financials[currency] = "Millions", financials[budget],        -- Already in USD
    financials[currency] = "Billions", financials[budget] * 1000, -- Conversion Rate Billions to Millions
    financials[budget]  -- Default case
)
```

### **4. Revenue in USD Measure**

This measure converts the box office revenue to USD for standard comparison across different currencies (INR, USD, Billions).

```DAX
Revenue in USD = 
SWITCH(
    TRUE(),
    financials[currency] = "INR", financials[box_office_collection] * 0.012,  -- Conversion Rate INR to USD
    financials[currency] = "Millions", financials[box_office_collection],        -- Already in USD
    financials[currency] = "Billions", financials[box_office_collection] * 1000, -- Conversion Rate Billions to Millions
    financials[box_office_collection]  -- Default case
)
```

### **5. Box Office Collection Measure**

This measure calculates the total box office revenue, considering the currency unit.

```DAX
Total Box Office = 
SUMX(
    financials,
    SWITCH(
        TRUE(),
        financials[currency] = "INR", financials[box_office_collection] * 0.012,  -- INR to USD
        financials[currency] = "Millions", financials[box_office_collection],        -- Already in USD
        financials[currency] = "Billions", financials[box_office_collection] * 1000, -- Billions to Millions
        financials[box_office_collection]  -- Default case
    )
)
```

### **6. Average IMDb Rating Measure**

This measure calculates the average IMDb rating of all movies.

```DAX
Average IMDb Rating = AVERAGE(movies[imdb_rating])
```

### **7. Movies per Actor**

This measure calculates the number of movies each actor has participated in.

```DAX
Movies per Actor = 
CALCULATE(
    COUNTROWS(movie_actor),
    ALLEXCEPT(movie_actor, movie_actor[actor_id])
)
```

---

## Visualizations & Dashboards

The Movies Analytics Dashboard consists of the following pages, each with unique visuals and KPIs:

### **1. Movie Overview Page**
   - **KPIs**: Total Box Office Revenue, Total Budget, Total Number of Movies.
   - **Bar Chart**: Top 10 movies by revenue.
   - **Filters**: Industry, Language, Release Year.

### **2. Actor Analysis Page**
   - **Youngest Actor Name**: Displays the name of the youngest actor.
   - **KPIs**: Number of Movies per Actor, Total Revenue Contributed by Each Actor.
   - **Bar Chart**: Actor Contributions to Total Revenue, Number of Movies per Actor.

### **3. Industry Performance Page**
   - **Bar Chart**: Box office collections and budgets by industry.
   - **KPIs**: Revenue Growth per Industry, Comparison of Production Budgets vs. Revenue.

### **4. Financial Trends Page**
   - **KPIs**: Average Box Office Revenue, Average Production Budget.
   - **Line Chart**: Revenue vs. Budget comparison over time.
   - **Pie Chart**: Currency Distribution of Financial Data.

### **5. Movie Comparison Page**
   - **Bar Chart**: Comparison of selected movies by IMDb rating, revenue, and budget.
   - **Filters**: Allow selecting and comparing multiple movies.

---

## How to Use the Dashboard

1. **Filter by Industry**: Use the Industry filter to see movies from specific industries like Bollywood or Hollywood.
2. **Filter by Language**: Filter movies based on the language in which they were produced.
3. **Select a Movie**: Click on any movie in charts or tables to explore detailed information about it.
4. **Actor Insights**: View the "Actor Analysis" page to see actor demographics and their contribution to movie performance.
5. **Currency Standardization**: Financial data is automatically converted to USD for comparison across different currencies.

---

## Prerequisites

To use the Movies Analytics Dashboard, ensure the following:

- **Power BI Desktop**: Install Power BI Desktop on your system to open and interact with the dashboard.
- **Database Connection**: The dashboard is connected to a SQL database containing the movies, financials, actors, and language data.
- **Data Refresh**: Ensure that the data is refreshed and up-to-date in Power BI.

---

## How to Run the Project

1. **Download/Clone the Repository**: Download or clone the repository to your local machine.
2. **Open Power BI File**: Open the Power BI file **Movies Analytics Dashboard**.
3. **Refresh Data**: Refresh the data connection to ensure up-to-date information.
4. **Explore the Dashboard**: Interact with the visuals and use the filters to explore insights.

---


## Conclusion

The **Movies Analytics Dashboard** provides an integrated and interactive solution for movie industry analysis. With the help of advanced DAX measures, KPIs, and visually appealing charts, users can explore the financial and actor-related performance of movies across different industries and languages.

Feel free to extend and modify the dashboard based on your requirements, and enjoy exploring the rich insights that this dashboard offers!

---

## 👤 Author

[![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/shaun-mia)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/shaun-mia/)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:shaunmia.cse@gmail.com)
