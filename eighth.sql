SELECT 'second_name' as table_name,
COUNT(CASE WHEN LENGTH(name)=SMinMaxAvg.min THEN LENGTH(name) ELSE NULL END) as 'Мин.длина',
COUNT(CASE WHEN LENGTH(name)=SMinMaxAvg.max THEN LENGTH(name) ELSE NULL END) as 'Макс.длина',
COUNT(CASE WHEN LENGTH(name)=SMinMaxAvg.middle THEN LENGTH(name) ELSE NULL END) as 'Ср.длина'
FROM StudentsRB.name1,
(SELECT MIN(LENGTH(name)) AS min,
	    MAX(LENGTH(name)) AS max,
        SUM(LENGTH(name)) DIV COUNT(LENGTH(name)) as middle
FROM StudentsRB.name1) as SMinMaxAvg
UNION ALL

SELECT 'first_name' as table_name,
COUNT(CASE WHEN LENGTH(name)=FMinMaxAvg.min THEN LENGTH(name) ELSE NULL END) as 'Мин.длина',
COUNT(CASE WHEN LENGTH(name)=FMinMaxAvg.max THEN LENGTH(name) ELSE NULL END) as 'Макс.длина',
COUNT(CASE WHEN LENGTH(name)=FMinMaxAvg.middle THEN LENGTH(name) ELSE NULL END) as 'Ср.длина'
FROM StudentsRB,
(SELECT MIN(LENGTH(name)) AS min,
	    MAX(LENGTH(name)) AS max,
        SUM(LENGTH(name)) DIV COUNT(LENGTH(name)) as middle
FROM StudentsRB) as FMinMaxAvg
UNION ALL

SELECT 'university' as table_name,
COUNT(CASE WHEN LENGTH(name)=UMinMaxAvg.min THEN LENGTH(name) ELSE NULL END) as 'Мин.длина',
COUNT(CASE WHEN LENGTH(name)=UMinMaxAvg.max THEN LENGTH(name) ELSE NULL END) as 'Макс.длина',
COUNT(CASE WHEN LENGTH(name)=UMinMaxAvg.middle THEN LENGTH(name) ELSE NULL END) as 'Ср.длина'
FROM StudentsRB.university,
(SELECT MIN(LENGTH(name)) AS min,
	    MAX(LENGTH(name)) AS max,
        SUM(LENGTH(name)) DIV COUNT(LENGTH(name)) as middle
FROM StudentsRB.university) as UMinMaxAvg
UNION ALL

SELECT 'country' as table_name,
COUNT(CASE WHEN LENGTH(country)=CMinMaxAvg.min THEN LENGTH(country) ELSE NULL END) as 'Мин.длина',
COUNT(CASE WHEN LENGTH(country)=CMinMaxAvg.max THEN LENGTH(country) ELSE NULL END) as 'Макс.длина',
COUNT(CASE WHEN LENGTH(country)=CMinMaxAvg.middle THEN LENGTH(country) ELSE NULL END) as 'Ср.длина'
FROM StudentsRB.country,
(SELECT MIN(LENGTH(country)) AS min,
	    MAX(LENGTH(country)) AS max,
        SUM(LENGTH(country)) DIV COUNT(LENGTH(country)) as middle
FROM StudentsRB.country) as CMinMaxAvg
UNION ALL

SELECT 'region' as table_name,
COUNT(CASE WHEN LENGTH(region)=RMinMaxAvg.min THEN LENGTH(region) ELSE NULL END) as 'Мин.длина',
COUNT(CASE WHEN LENGTH(region)=RMinMaxAvg.max THEN LENGTH(region) ELSE NULL END) as 'Макс.длина',
COUNT(CASE WHEN LENGTH(region)=RMinMaxAvg.middle THEN LENGTH(region) ELSE NULL END) as 'Ср.длина'
FROM StudentsRB.region,
(SELECT MIN(LENGTH(region)) AS min,
	    MAX(LENGTH(region)) AS max,
        SUM(LENGTH(region)) DIV COUNT(LENGTH(region)) as middle
FROM StudentsRB.region) as RMinMaxAvg
UNION ALL

SELECT 'city' as table_name,
COUNT(CASE WHEN LENGTH(city_name)=CityMinMaxAvg.min THEN LENGTH(city_name) ELSE NULL END) as 'Мин.длина',
COUNT(CASE WHEN LENGTH(city_name)=CityMinMaxAvg.max THEN LENGTH(city_name) ELSE NULL END) as 'Макс.длина',
COUNT(CASE WHEN LENGTH(city_name)=CityMinMaxAvg.middle THEN LENGTH(city_name) ELSE NULL END) as 'Ср.длина'
FROM StudentsRB.city,
(SELECT MIN(LENGTH(city_name)) AS min,
	    MAX(LENGTH(city_name)) AS max,
        SUM(LENGTH(city_name)) DIV COUNT(LENGTH(city_name)) as middle
FROM StudentsRB.city) as CityMinMaxAvg;
