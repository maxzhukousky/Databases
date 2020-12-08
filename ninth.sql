INSERT INTO StudentsRB.name3(name)
SELECT CASE WHEN SUBSTR(name,-1.1) IN ('ж','ц','щ','ч','ш') THEN
CONCAT(name,'евич') ELSE CONCAT(name,'ович') END as name
FROM StudentsRB.name2
WHERE SUBSTR(name,-1,1) NOT IN('а','я')
ORDER BY name;
