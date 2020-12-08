SELECT name AS 'Фамилия' FROM StudentsRB.name1 
WHERE name = 'Жуковский';

SELECT name AS 'Имя' FROM StudentsRB.name2 WHERE name = 'Максим';

SELECT F.name AS 'Фамилия', L.name'Имя' FROM StudentsRB.name1 as F join StudentsRB.name2 as L
WHERE F.name = ' Жуковский ' and L.name = ' Максим';

