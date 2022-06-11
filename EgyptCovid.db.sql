-- Head DataSet
SELECT * 
FROM covid19
--WHERE continent IS NOT NULL and location like "Egypt"
LIMIT 10;

-- Choose the usefull column
SELECT iso_code,continent , location , date ,new_cases ,total_cases , new_deaths, total_deaths , population, median_age
FROM covid19
WHERE continent IS NOT NULL
ORDER by date

-- Corona's first appearance in China which has 92 New Cases
SELECT continent , location , date ,new_cases 
FROM covid19
WHERE continent IS NOT NULL and new_cases IS NOT NULL
ORDER by date , new_cases DESC

-- The country with the total cases , United States has the highest cases
SELECT continent , location , Sum(total_cases) as [Total Cases]
FROM covid19
WHERE continent IS NOT NULL 
GROUP BY continent, location
ORDER by [Total Cases] DESC

-- The country with the total deaths , United States has the highest deaths
SELECT continent , location , Sum(CAST(total_deaths as INT)) as [Total deaths]
FROM covid19
WHERE continent IS NOT NULL 
GROUP BY continent, location
ORDER by [Total deaths] DESC

-- Death Percentage 
SELECT  location , total_deaths, total_cases, (sum(round(total_deaths))  / sum(round(total_cases ))) * 100 as [Death Percentage]
FROM covid19
WHERE continent IS NOT NULL 
GROUP BY 1,2,3
ORDER by 1

-- Death Percentage per day
SELECT location , date , total_cases ,total_deaths  , (round(total_deaths) /round(total_cases))* 100 as deathPercentage
from covid19
WHERE continent IS NOT NULL
ORDER by 1 

-- Showing Countries with highest Death count per population
SELECT location  , MAX(CAST(Total_deaths as INT )) AS TotalDeathCount
from covid19
WHERE continent IS NOT NULL
GROUP by 1
ORDER by TotalDeathCount DESC

-- Percent Population Infectioned in Egypt per day 
SELECT location , date , total_cases , population , (round(total_cases) /round(population))* 100 as percentPopulationInfectioned
from covid19
where location like 'Egypt'
AND continent IS NOT NULL
ORDER by 1 

-- Looking at countries with highest infection rate compared to population 
SELECT location  , population , MAX(total_cases) AS HighestInfectionCount, MAX(round(total_cases) /round(population))* 100 as PercentPopulationInfectioned
from covid19
WHERE continent IS NOT NULL
GROUP by 1,2 
ORDER by PercentPopulationInfectioned DESC

-- The relationship between median age and total death
SELECT location  , median_age , sum(Total_deaths) [Total Deaths]
from covid19
WHERE median_age is NOT NULL AND location NOT like "World"
GROUP BY 1,2
ORDER BY 3 DESC