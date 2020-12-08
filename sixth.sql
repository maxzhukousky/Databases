SELECT DISTINCT 
COUNT(CASE WHEN S.name LIKE 
CONCAT('%',LEFT('Виталий',6),'%') THEN S.name ELSE NULL END) AS 'Похожие с одной буквой',
COUNT(CASE WHEN S.name LIKE 
CONCAT('%',LEFT('Виталий',5),'%') THEN S.name ELSE NULL END) AS 'Похожие с двумя буквами'
FROM StudentsRB.name2 as S;
