SELECT DISTINCT 
COUNT(CASE WHEN S.name LIKE 
CONCAT('%',LEFT('Жуковский',6),'%') THEN S.name ELSE NULL END) AS 'Похожие с одной буквой', 
COUNT(CASE WHEN S.name LIKE 
CONCAT('%',LEFT('Жуковский',5),'%') THEN S.name ELSE NULL END) AS 'Похожие с двумя буквами'
FROM StudentsRB.name1 as S;