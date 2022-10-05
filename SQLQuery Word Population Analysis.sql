CREATE DATABASE world_population1

SELECT * FROM world_population1

SELECT *
FROM world_population1
WHERE Country LIKE '_s%'

SELECT *
FROM world_population1
WHERE Country LIKE 's%'

SELECT TOP 10*
FROM  world_population1
WHERE Area_km BETWEEN 100 and 50000

SELECT TOP 10 *
FROM world_population1
ORDER BY Area_km

SELECT MIN(Area_km)
FROM world_population1
WHERE Country LIKE 'N%'


SELECT MAX(Area_km)
FROM world_population1
WHERE Country LIKE 'N%'

SELECT TOP 10* FROM world_population1
ORDER BY Area_km DESC

/*---------Select Area_km, Density_per_km, Growth_Rate, World_Population_Percentage
 Where Country Starts with C and Capital starts with S or E
Ordering By _2022_Population in Asc order----------*/
SELECT  Area_km, Density_per_km, Growth_Rate, World_Population_Percentage
FROM world_population1
WHERE Country LIKE 'C%' 
AND Capital LIKE 'S%' OR Continent LIKE  'E%'
ORDER BY _2022_Population ASC

/*-----------Select Country, Capital, _2020_Population 
from world_population1 for people who have no
World_Population_Percentage and are Continent starting with AF ------------*/

SELECT Country, Capital, _2020_Population
FROM world_population1
WHERE World_Population_Percentage=0 OR Continent LIKE  'AF%'

/*-----------Select Country, Capital, _2020_Population, _2022_Population, Continent
from world_population1 for Countries where Population Difference between 2020 and 2022 is 
between 10000 and 100000
and are Continent starting with AS ------------*/

SELECT Country, Capital,Continent, _2020_Population, _2022_Population,
(_2022_Population - _2020_Population) AS PopulationDIFFERENCE
FROM world_population1
WHERE Continent LIKE  'AS%' AND (_2022_Population - _2020_Population) BETWEEN 10000 AND 100000

/*-----------Select Country, Capital, _2020_Population, _2022_Population, Continent
from world_population1 for Countries where Population Difference between 2020 and 2022 is 
greater than 9900000
and are Continent starting with AS ------------*/


SELECT Country, Capital, _2020_Population, _2022_Population, Continent, 
(_2022_Population - _2020_Population) AS PopulationDIFFERENCE
FROM world_population1
WHERE Continent LIKE  'AS%' AND (_2022_Population - _2020_Population) > 9900000

/*-----------Select Country, Capital, _2020_Population, _2022_Population, Continent
from world_population1 for Countries where Population Difference between 2020 and 2022 is 
greater than 9900000
and are Continent starting with AF ------------*/

SELECT Country, Capital, _2020_Population, _2022_Population, Continent, 
(_2022_Population - _2020_Population) AS PopulationDIFFERENCE
FROM world_population1
WHERE Continent LIKE  'AF%' AND (_2022_Population - _2020_Population) > 9900000

SELECT Country, Capital, Continent, _2022_Population, _2020_Population, _2015_Population
FROM world_population1
ORDER BY _2022_Population, _2020_Population, _2015_Population DESC

/*-----------Select Country, Capital, Continent, World_Population_Percentage
from world_population1 for World_Population_Percentage = 0
and are Continent starting with No ------------*/
SELECT Country, Capital, Continent, World_Population_Percentage
FROM world_population1
WHERE World_Population_Percentage = 0 AND Continent LIKE 'NO%'

/*------List each country name where the population is larger than that of 'Russia'--*/
SELECT Country, Capital, Continent, _2015_Population FROM world_population1
  WHERE _2015_Population >
     (SELECT _2015_Population FROM world_population1
      WHERE Country='Russia')

/*------Show the countries in Europe with a per capita GDP greater than 'United Kingdom'-----*/
SELECT Country, Capital, Continent, Growth_Rate from world_population1
WHERE  Growth_Rate >
(SELECT Growth_Rate FROM world_population1
where Country = 'United Kingdom')


/*------ Which country has a Density_per_km more than Canada but less than Russia in 1970? Show the name and the population....*/
SELECT Country, Capital, Continent, Density_per_km, _1970_Population FROM world_population1
WHERE Density_per_km >= (SELECT Density_per_km FROM world_population1
WHERE Country = 'CANADA') AND Density_per_km <=
(SELECT Density_per_km FROM world_population1
WHERE Country = 'RUSSIA')

/*------- 13) Find the country that has all the vowels and no spaces in its name.
---* You can use the phrase Country NOT LIKE '%a%' to exclude characters from your results.
--- * The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'---*/

SELECT Country, Capital
FROM world_population1
WHERE Country LIKE '%a%' AND Country LIKE '%e%'AND 
Country LIKE '%i%' AND Country LIKE '%o%' AND Country LIKE '%u%' AND Country NOT LIKE '% %';


/*-----Some countries have populations more than three times that of any of their neighbours (in the same continent). 
Give the countries and continents---*/

SELECT Country, Continent, _2022_Population, _2020_Population
 FROM world_population1 x
   WHERE _2022_Population > ALL(SELECT _2022_Population*3 FROM world_population1 y
							WHERE x.Country = y.Country 
							AND _2022_Population > 0
							AND x.Country != y.Country
                            AND Continent LIKE '%A__A')
                        






