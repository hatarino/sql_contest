SELECT
    AGE_GRP.AGE_NAME AS "年齢階層",
    SUM(
        CASE
            WHEN
                SLEEP_TIME_DTL.TIME_CODE = 120
                THEN SLEEP_TIME_DTL.TARGET_POP
            ELSE 0
        END
    )
        AS "5時間未満",
    SUM(
        CASE
            WHEN
                SLEEP_TIME_DTL.TIME_CODE = 130
                THEN SLEEP_TIME_DTL.TARGET_POP
            ELSE 0
        END
    )
        AS "5時間以上6時間未満",
    SUM(
        CASE
            WHEN
                SLEEP_TIME_DTL.TIME_CODE = 140
                THEN SLEEP_TIME_DTL.TARGET_POP
            ELSE 0
        END
    )
        AS "6時間以上7時間未満",
    SUM(
        CASE
            WHEN
                SLEEP_TIME_DTL.TIME_CODE = 150
                THEN SLEEP_TIME_DTL.TARGET_POP
            ELSE 0
        END
    )
        AS "7時間以上8時間未満",
    SUM(
        CASE
            WHEN
                SLEEP_TIME_DTL.TIME_CODE = 160
                THEN SLEEP_TIME_DTL.TARGET_POP
            ELSE 0
        END
    )
        AS "8時間以上9時間未満",
    SUM(
        CASE
            WHEN
                SLEEP_TIME_DTL.TIME_CODE = 170
                THEN SLEEP_TIME_DTL.TARGET_POP
            ELSE 0
        END
    )
        AS "9時間以上",
    SUM(
        CASE
            WHEN
                SLEEP_TIME_DTL.TIME_CODE = 180
                THEN SLEEP_TIME_DTL.TARGET_POP
            ELSE 0
        END
    )
        AS "不詳"
FROM SLEEP_TIME_DTL
INNER JOIN AGE_GRP ON SLEEP_TIME_DTL.AGE_CODE = AGE_GRP.AGE_CODE
GROUP BY SLEEP_TIME_DTL.AGE_CODE
ORDER BY SLEEP_TIME_DTL.AGE_CODE;
