SELECT 'name1' as table_name,
COUNT(CASE WHEN LENGTH(name)=SMinMaxAvg.min THEN LENGTH(name) ELSE NULL END) as 'Мин.длина',
COUNT(CASE WHEN LENGTH(name)=SMinMaxAvg.max THEN LENGTH(name) ELSE NULL END) as 'Макс.длина',
COUNT(CASE WHEN LENGTH(name)=SMinMaxAvg.middle THEN LENGTH(name) ELSE NULL END) as 'Ср.длина'
FROM StudentsRB.name1,
(SELECT MIN(LENGTH(name)) AS min,
	    MAX(LENGTH(name)) AS max,
        SUM(LENGTH(name)) DIV COUNT(LENGTH(name)) as middle
FROM StudentsRB.name1) as SMinMaxAvg
UNION ALL

SELECT 'name2' as table_name,
COUNT(CASE WHEN LENGTH(name)=FMinMaxAvg.min THEN LENGTH(name) ELSE NULL END) as 'Мин.длина',
COUNT(CASE WHEN LENGTH(name)=FMinMaxAvg.max THEN LENGTH(name) ELSE NULL END) as 'Макс.длина',
COUNT(CASE WHEN LENGTH(name)=FMinMaxAvg.middle THEN LENGTH(name) ELSE NULL END) as 'Ср.длина'
FROM StudentsRB.name2,
(SELECT MIN(LENGTH(name)) AS min,
	    MAX(LENGTH(name)) AS max,
        SUM(LENGTH(name)) DIV COUNT(LENGTH(name)) as middle
FROM StudentsRB.name2) as FMinMaxAvg
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
COUNT(CASE WHEN LENGTH(name)=CMinMaxAvg.min THEN LENGTH(name) ELSE NULL END) as 'Мин.длина',
COUNT(CASE WHEN LENGTH(name)=CMinMaxAvg.max THEN LENGTH(country) ELSE NULL END) as 'Макс.длина',
COUNT(CASE WHEN LENGTH(name)=CMinMaxAvg.middle THEN LENGTH(name) ELSE NULL END) as 'Ср.длина'
FROM StudentsRB.country,
(SELECT MIN(LENGTH(name)) AS min,
	    MAX(LENGTH(name)) AS max,
        SUM(LENGTH(name)) DIV COUNT(LENGTH(name)) as middle
FROM StudentsRB.country) as CMinMaxAvg
UNION ALL

SELECT 'region' as table_name,
COUNT(CASE WHEN LENGTH(name)=RMinMaxAvg.min THEN LENGTH(name) ELSE NULL END) as 'Мин.длина',
COUNT(CASE WHEN LENGTH(name)=RMinMaxAvg.max THEN LENGTH(name) ELSE NULL END) as 'Макс.длина',
COUNT(CASE WHEN LENGTH(name)=RMinMaxAvg.middle THEN LENGTH(name) ELSE NULL END) as 'Ср.длина'
FROM StudentsRB.region,
(SELECT MIN(LENGTH(name)) AS min,
	    MAX(LENGTH(name)) AS max,
        SUM(LENGTH(name)) DIV COUNT(LENGTH(name)) as middle
FROM StudentsRB.region) as RMinMaxAvg
UNION ALL

SELECT 'city' as table_name,
COUNT(CASE WHEN LENGTH(name)=CityMinMaxAvg.min THEN LENGTH(name) ELSE NULL END) as 'Мин.длина',
COUNT(CASE WHEN LENGTH(name)=CityMinMaxAvg.max THEN LENGTH(name) ELSE NULL END) as 'Макс.длина',
COUNT(CASE WHEN LENGTH(name)=CityMinMaxAvg.middle THEN LENGTH(name) ELSE NULL END) as 'Ср.длина'
FROM StudentsRB.city,
(SELECT MIN(LENGTH(name)) AS min,
	    MAX(LENGTH(name)) AS max,
        SUM(LENGTH(name)) DIV COUNT(LENGTH(name)) as middle
FROM StudentsRB.city) as CityMinMaxAvg;
