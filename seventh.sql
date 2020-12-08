SELECT 'second_name' AS table_name, MIN(LENGTH(name)) min, MAX(LENGTH(name)) max, AVG(LENGTH(name)) middle
FROM StudentsRB.name1
UNION ALL
SELECT 'first_name' AS table_name, MIN(LENGTH(name)) min, MAX(LENGTH(name)) max, AVG(LENGTH(name)) middle
FROM StudentsRB.name2
UNION ALL
SELECT 'country' AS table_name, MIN(LENGTH(name)) min, MAX(LENGTH(name)) max, AVG(LENGTH(name)) middle
FROM StudentsRB.country
UNION ALL
SELECT 'city' AS table_name, MIN(LENGTH(name)) min, MAX(LENGTH(name)) max, AVG(LENGTH(name)) middle
FROM StudentsRB.city
UNION ALL
SELECT 'region' AS table_name, MIN(LENGTH(name)) min, MAX(LENGTH(name)) max, AVG(LENGTH(name)) middle
FROM StudentsRB.region
UNION ALL
SELECT 'university' AS table_name, MIN(LENGTH(name)) min, MAX(LENGTH(name)) max, AVG(LENGTH(name)) middle
FROM StudentsRB.university;
