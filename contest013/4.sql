WITH RANKING_HEALTH_CHECKUP AS (
    SELECT
        MEMBER_CODE,
        CHECKUP_DATE,
        ROW_NUMBER() OVER (PARTITION BY MEMBER_CODE ORDER BY CHECKUP_DATE DESC) AS RANK, -- noqa
        WEIGHT
    FROM HEALTH_CHECKUP
)

SELECT
    RANKING_HEALTH_CHECKUP.CHECKUP_DATE AS CK_DATE,
    MEMBER_MST.MEMBER_CODE AS CODE,
    MEMBER_MST.LAST_NAME || '' || MEMBER_MST.FIRST_NAME AS NAME,
    ROUND(RANKING_HEALTH_CHECKUP.WEIGHT - RANKING_HEALTH_CHECKUP_2.WEIGHT, 1)
        AS CHG_WT
FROM RANKING_HEALTH_CHECKUP
INNER JOIN RANKING_HEALTH_CHECKUP AS RANKING_HEALTH_CHECKUP_2
    ON
        RANKING_HEALTH_CHECKUP.MEMBER_CODE
        = RANKING_HEALTH_CHECKUP_2.MEMBER_CODE
        AND RANKING_HEALTH_CHECKUP.RANK = 1
        AND RANKING_HEALTH_CHECKUP_2.RANK = 2
INNER JOIN MEMBER_MST
    ON RANKING_HEALTH_CHECKUP.MEMBER_CODE = MEMBER_MST.MEMBER_CODE
WHERE ABS(CHG_WT) >= 5
ORDER BY CHG_WT DESC, MEMBER_MST.MEMBER_CODE DESC;
