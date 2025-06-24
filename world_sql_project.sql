-- world_schema.sql is assumed to be in the schema/ folder

-- File: queries/task_01_to_10.sql

-- Task 1: Count cities in the USA
SELECT COUNT(*) AS total_cities
FROM city
WHERE CountryCode = 'USA';

-- Task 2: Country with the highest life expectancy
SELECT Name, LifeExpectancy
FROM country
ORDER BY LifeExpectancy DESC
LIMIT 1;

-- Task 3: Cities with 'New' in the name
SELECT Name, CountryCode
FROM city
WHERE Name LIKE '%New%';

-- Task 4: Top 10 most populous cities
SELECT Name, CountryCode, Population
FROM city
ORDER BY Population DESC
LIMIT 10;

-- Task 5: Cities with populations over 2 million
SELECT Name, CountryCode, Population
FROM city
WHERE Population > 2000000
ORDER BY Population DESC;

-- Task 6: Cities starting with 'Be'
SELECT Name, CountryCode
FROM city
WHERE Name LIKE 'Be%';

-- Task 7: Cities with population between 500,000 and 1,000,000
SELECT Name, CountryCode, Population
FROM city
WHERE Population BETWEEN 500000 AND 1000000
ORDER BY Population DESC;

-- Task 8: Alphabetical list of cities
SELECT Name, CountryCode
FROM city
ORDER BY Name ASC;

-- Task 9: Most populous city
SELECT Name, Population
FROM city
ORDER BY Population DESC
LIMIT 1;

-- Task 10: Frequency of city names
SELECT Name, COUNT(*) AS Frequency
FROM city
GROUP BY Name
ORDER BY Name ASC;


-- File: queries/task_11_to_19.sql

-- Task 11: Least populous city
SELECT Name, Population
FROM city
ORDER BY Population ASC
LIMIT 1;

-- Task 12: Most populous country
SELECT Name, Population
FROM country
ORDER BY Population DESC
LIMIT 1;

-- Task 13: Capital city of Spain
SELECT city.Name
FROM city
JOIN country ON city.ID = country.Capital
WHERE country.Name = 'Spain';

-- Task 14: Cities in Europe
SELECT city.Name, country.Name AS Country
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE country.Continent = 'Europe'
ORDER BY city.Name ASC;

-- Task 15: Average city population per country
SELECT city.CountryCode, country.Name, AVG(city.Population) AS AvgPopulation
FROM city
JOIN country ON city.CountryCode = country.Code
GROUP BY city.CountryCode, country.Name
ORDER BY AvgPopulation DESC;

-- Task 16: Largest capital cities
SELECT city.Name AS Capital, country.Name AS Country, city.Population
FROM City city
JOIN Country country ON city.ID = country.Capital
ORDER BY city.Population DESC;

-- Task 17: 20 least densely populated countries
SELECT Name AS Country, Population, SurfaceArea, (Population / SurfaceArea) AS PopulationDensity
FROM Country
WHERE SurfaceArea > 0
ORDER BY PopulationDensity ASC
LIMIT 20;

-- Task 18: Cities with above-average GDP per capita
SELECT c.Name AS City, c.Population, co.GNP, (co.GNP / c.Population) AS GDP_per_Capita
FROM city c
INNER JOIN country co ON c.CountryCode = co.Code
WHERE co.GNP IS NOT NULL
  AND c.Population IS NOT NULL
  AND c.Population > 0
  AND co.GNP / c.Population > (
    SELECT AVG(co.GNP / c.Population)
    FROM city c
    INNER JOIN country co ON c.CountryCode = co.Code
    WHERE co.GNP IS NOT NULL AND c.Population IS NOT NULL AND c.Population > 0
);

-- Task 19 Option 1: Cities ranked 31 to 40 by population using OFFSET
SELECT Name AS City, CountryCode, Population
FROM City
ORDER BY Population DESC
LIMIT 10 OFFSET 30;

-- Task 19 Option 2: Cities ranked 31 to 40 using ROW_NUMBER()
SELECT *
FROM (
  SELECT *, ROW_NUMBER() OVER (ORDER BY Population DESC) AS RowNum
  FROM city
) AS Cities
WHERE RowNum BETWEEN 31 AND 40;
