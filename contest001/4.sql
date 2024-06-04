SELECT
    TF.PF_CODE AS "都道府県コード",
    PREFECTURE.PF_NAME AS "都道府県名",
    MAX(CASE WHEN TF.RANK = 1 THEN NATIONALITY.NATION_NAME END)
        AS "1位 国名",
    MAX(CASE WHEN TF.RANK = 1 THEN TF.AMT END) AS "1位 人数",
    MAX(CASE WHEN TF.RANK = 2 THEN NATIONALITY.NATION_NAME END)
        AS "2位 国名",
    MAX(CASE WHEN TF.RANK = 2 THEN TF.AMT END) AS "2位 人数",
    MAX(CASE WHEN TF.RANK = 3 THEN NATIONALITY.NATION_NAME END)
        AS "3位 国名",
    MAX(CASE WHEN TF.RANK = 3 THEN TF.AMT END) AS "3位 人数",
    SUM(TF.AMT) AS "合計人数"
FROM (
    SELECT
        PF_CODE,
        NATION_CODE,
        AMT,
        ROW_NUMBER() OVER (PARTITION BY PF_CODE ORDER BY AMT DESC, NATION_CODE ASC) -- noqa
            AS RANK
    FROM FOREIGNER
    WHERE NATION_CODE != '113'
) AS TF
INNER JOIN PREFECTURE ON TF.PF_CODE = PREFECTURE.PF_CODE
INNER JOIN NATIONALITY ON TF.NATION_CODE = NATIONALITY.NATION_CODE
GROUP BY TF.PF_CODE
ORDER BY "合計人数" DESC, TF.PF_CODE ASC;
