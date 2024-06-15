SELECT
    CLASS_NAME AS CLASS,
    PERSON_NAME AS PERSON,
    MAX(AMT) AS HOUSEHOLDS
FROM HOUSEHOLD
WHERE PERSON_CODE != '1' AND CLASS_CODE != '01'
GROUP BY CLASS_CODE, CLASS_NAME
HAVING AMT = MAX(AMT)
ORDER BY CLASS_CODE ASC;