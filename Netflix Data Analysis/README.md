# Netflix Data Analysis with Power BI  

This project explores Netflix's extensive data catalog through dynamic Power BI dashboards. It provides deep insights into trends, content types, ratings, regional analysis, and runtime statistics, enabling users to uncover meaningful patterns and insights from Netflix's global offerings.

---

## 📖 Introduction  

Netflix is one of the world's leading entertainment platforms, offering diverse content, including movies and TV shows. This project utilizes Power BI to analyze Netflix's dataset, providing an interactive and visually rich environment for understanding content distribution, trends, and performance metrics.

---

## 📊 About the Project  

This Power BI dashboard project is designed to give users a comprehensive understanding of Netflix's data. The dashboards are built with visually engaging themes inspired by Netflix's brand identity, ensuring an immersive experience. 

The project leverages **DAX (Data Analysis Expressions)** for dynamic calculations, allowing for advanced metrics and insights into Netflix's data. It is suitable for data analysts, researchers, and Netflix enthusiasts to explore trends and extract meaningful insights.

---

## 🌐 Live View  

- **Dataset on Kaggle**: The dataset used for this project is publicly available on Kaggle. You can find it here: [Netflix Dataset on Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows).  
- **Live Dashboard View**: Explore the live version of this project on my portfolio website: [shaun-mia.github.io/](https://shaun-mia.github.io/).

---

## 🔍 Project Insights  

### Key Dashboards and Visuals:
1. **Home Dashboard**  
   - Introduction to the analysis, featuring an interactive menu for navigation.
   - Custom-designed Netflix-inspired theme with red gradients for a cinematic feel.

2. **Overview**  
   - Total content breakdown (Movies vs. TV Shows).
   - Content distribution by release year and type.
   - Top 10 titles by IMDB scores.
   - Average runtime by type and age certification insights.

3. **Ratings and Duration Analysis**  
   - IMDB rating trends by type (Movie/TV Show).  
   - Analysis of content duration, including movies and multi-season TV shows.  

4. **Regional Insights (India and USA)**  
   - Content count and trends for specific regions like India and the United States.
   - Popular content types for these countries.

5. **TV Shows vs. Movies**  
   - Comparative insights between TV shows and movies.
   - Percentage of movies vs. TV shows in the catalog.
   - Visuals highlighting the total runtime distribution.

---

## 📈 Visual Highlights  

1. **Bar Charts**:  
   - Visualize the most popular IMDB-rated titles.
   - Analyze content type trends.

2. **Donut Charts**:  
   - Showcase the proportion of content types (Movies vs. TV Shows).  
   - Represent runtime averages and regional certifications.

3. **Line Graphs**:  
   - Display trends in Netflix's content release over the years.

4. **Histograms**:  
   - Show runtime distribution across the catalog.  

5. **Custom Gradient Backgrounds**:  
   - Red gradient and cinematic-themed backgrounds inspired by Netflix.

---

## 🛠️ Key DAX Calculations  

The project extensively uses **DAX expressions** for dynamic calculations and aggregations. Below are some examples:

- **Content by Region**:  
  ```DAX
  India = COUNTROWS(FILTER(netflix_data, netflix_data[country] = "India"))
  USA = COUNTROWS(FILTER(netflix_data, netflix_data[country] = "United States"))
  ```

- **Maximum Duration**:  
  ```DAX
  MaxDuration = MAX(netflix_data[duration])
  ```

- **Movies Percentage**:  
  ```DAX
  MoviesPercentage = DIVIDE(COUNTROWS(FILTER(netflix_data, netflix_data[type] = "Movie")), [TotalContent], 0)
  ```

- **Total Movies and TV Shows**:  
  ```DAX
  Total Movies = COUNTROWS(FILTER(netflix_data, netflix_data[type] = "Movie"))
  Total TVShows = COUNTROWS(FILTER(netflix_data, netflix_data[type] = "TV Show"))
  ```

- **Total Content**:  
  ```DAX
  TotalContent = COUNT(netflix_data[show_id])
  ```

---


## 📂 How to Use  

1. Open the Power BI file containing the Netflix dataset and dashboards.  
2. Navigate through the pages to explore different analyses (Home, Overview, Ratings & Duration, Regional Insights, etc.).  
3. Use filters (type, region, year) to customize your analysis.  
4. Hover over visuals for tooltips and deeper insights.  

---

## 📦 Tools and Technologies  

- **Power BI**: For creating interactive and visually rich dashboards.  
- **DAX (Data Analysis Expressions)**: For advanced calculations and aggregations.  
- **Netflix Dataset**: Includes information about movies, TV shows, ratings, release years, and more.

---

## 💡 Conclusion  

This project provides a deep dive into Netflix's content catalog, offering actionable insights through Power BI. It combines powerful data analytics with a sleek design, enabling users to explore Netflix's trends and performance effectively.  
