-- Journeying Through Astronaut Profiles.
SELECT * FROM astronauts;

-- Astronaut Status: Counting the Cosmic Pioneers.
SELECT status, COUNT(status) AS Number
FROM astronauts
GROUP BY status;

-- Exploring Astronauts' Military Branch Diversity.
SELECT Military_Branch, COUNT(Military_Branch) Number
FROM astronauts
GROUP BY Military_Branch;

-- Top Military Ranks Among Astronauts.
SELECT Military_Rank, COUNT(Military_Rank) 
FROM `astronauts` 
GROUP BY Military_Rank
ORDER BY COUNT(Military_Rank)  DESC
LIMIT 5;

-- Exploring Astronaut Demographics: Gender Insights
SELECT gender, COUNT(gender) Number
FROM astronauts
GROUP BY gender;

-- Astronauts' Life Expectancy: A Cosmic Perspective
SELECT ROUND(AVG(life_Expectancy)) AS Average_Life_Expectancy
FROM (
    SELECT 
        CASE 
            WHEN Status = 'Deceased' THEN (YEAR(Death_Date) - YEAR(Birth_Date))
            ELSE (2023 - YEAR(Birth_Date))
        END AS life_Expectancy
    FROM 
        astronauts
) AS life_expectancies;
#69

-- Honoring Female Astronauts: Life Expectancy.
SELECT ROUND(AVG(Female_life_Expectancy)) AS Female_Average_Life_Expectancy
FROM (
    SELECT 
        CASE 
            WHEN Status = 'Deceased' AND Gender = 'Female' THEN (YEAR(Death_Date) - YEAR(Birth_Date))
            WHEN Status != 'Deceased' AND Gender = 'Female' THEN (2023 - YEAR(Birth_Date))
            ELSE NULL
        END AS Female_life_Expectancy
    FROM 
        astronauts
) AS female_life_expectancies;

#62

-- Celebrating Male Astronauts: Life Expectancy.
SELECT ROUND(AVG(Male_life_Expectancy)) AS Male_Average_Life_Expectancy
FROM (
    SELECT 
        CASE 
            WHEN Status = 'Deceased' AND Gender = 'Male' THEN (YEAR(Death_Date) - YEAR(Birth_Date))
            WHEN Status != 'Deceased' AND Gender = 'Male' THEN (2023 - YEAR(Birth_Date))
            ELSE NULL
        END AS Male_life_Expectancy
    FROM 
        astronauts
) AS Male_life_expectancies;
#70

-- Cosmic Scholars: Top Graduate Majors of Astronauts.
SELECT 
    Graduate_Major,
    COUNT(*) AS Number
FROM 
    astronauts
GROUP BY 
    Graduate_Major
ORDER BY 
    Number DESC
LIMIT 10;

-- Educational Odyssey: Astronauts and Their Degrees.
SELECT 
      (SELECT COUNT(*) FROM astronauts) AS Number_of_Astronauts,
      (SELECT COUNT(Undergraduate_Major) FROM astronauts) AS Astronauts_with_Undergraduate_Degrees,
      (SELECT COUNT(Graduate_Major) FROM astronauts) AS Astronauts_with_Graduate_Degrees

FROM astronauts
LIMIT 1;

-- Astronaut Birthplaces: Launching from Earth's Diverse Cities.
SELECT 
    SUBSTRING_INDEX(Birth_Place, ',', -1) AS STATE,
    COUNT(*) AS Astronaut_Count
FROM 
    astronauts
GROUP BY 
    STATE
ORDER BY 
    Astronaut_Count DESC
LIMIT 5;

-- Voyages Beyond: Astronauts' Space Flights and Spacewalks
SELECT 
    ROUND(AVG(Space_Flights), 2) AS Average_Number_Of_Space_Flights,
    ROUND(AVG(Space_Walks), 2) AS Average_Number_Of_Space_Walks
FROM 
    astronauts;














