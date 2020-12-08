SELECT 'second_name' AS table_name, MIN(LENGTH(name)) min, MAX(LENGTH(name)) max, AVG(LENGTH(name)) middle
FROM StudentsRB.name1
UNION ALL
SELECT 'first_name' AS table_name, MIN(LENGTH(name)) min, MAX(LENGTH(name)) max, AVG(LENGTH(name)) middle
FROM StudentsRB.name2
UNION ALL
SELECT 'country' AS table_name, MIN(LENGTH(name)) min, MAX(LENGTH(country)) max, AVG(LENGTH(country)) middle
FROM StudentsRB.country
UNION ALL
SELECT 'city' AS table_name, MIN(LENGTH(name)) min, MAX(LENGTH(city_name)) max, AVG(LENGTH(city_name)) middle
FROM StudentsRB.city
UNION ALL
SELECT 'region' AS table_name, MIN(LENGTH(name)) min, MAX(LENGTH(region)) max, AVG(LENGTH(region)) middle
FROM StudentsRB.region
UNION ALL
SELECT 'university' AS table_name, MIN(LENGTH(name)) min, MAX(LENGTH(name)) max, AVG(LENGTH(name)) middle
FROM StudentsRB.university;
