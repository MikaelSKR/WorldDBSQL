🌍 World SQL Project

This project demonstrates SQL proficiency through exploration and analysis of the classic world database. It features a variety of query tasks designed to extract insights on population, city structures, country metrics, and more.

📂 Database Overview

The world database consists of the following key tables:

city: Includes information about cities such as name, country code, district, and population.

country: Contains data on countries including their population, surface area, government form, capital, and GNP.

countrylanguage: Lists languages spoken in each country with a percentage value.

🧠 Skills Demonstrated

SQL Filtering (WHERE, LIKE, BETWEEN)

Aggregation Functions (COUNT, AVG)

Sorting (ORDER BY)

Joins (INNER JOIN)

Subqueries

Window Functions (ROW_NUMBER())

Calculated Fields

🔍 Project Tasks Breakdown

Task Examples:

Population Analysis: Most and least populous cities/countries

Name Patterns: Cities starting with or containing certain patterns

Country Insights: Highest life expectancy, capital cities

Data Aggregation: Average population by country

Comparative Analysis: GDP per capita filtering and ranking

Pagination: Top cities by rank with OFFSET and ROW_NUMBER()

🗂️ Project Structure

world-sql-project/
├── README.md
├── schema/
│   └── world_schema.sql
├── queries/
│   ├── task_01_to_10.sql
│   └── task_11_to_19.sql
├── outputs/                 # Optional CSV or screenshots
└── visuals/                 # Optional charts or plots

🚀 How to Use

Import schema/world_schema.sql into your MySQL instance.

Run the queries from the queries/ folder.

(Optional) Save outputs to CSV or visualize using Python, Excel, or Tableau.

🧾 Example Query

-- Top 10 most populous cities
SELECT Name, CountryCode, Population
FROM city
ORDER BY Population DESC
LIMIT 10;

🔗 Connect

https://www.mikir.uk/

https://www.linkedin.com/in/mikaelshakir/

