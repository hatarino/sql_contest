SELECT
    CUST_CODE AS CODE,
    CUST_NAME AS NAME,
    CUST_USER_NAME AS USER_NAME
FROM CUSTOMER
WHERE CUST_NAME LIKE '株式会社%' OR CUST_NAME LIKE '%商事%'
ORDER BY CUST_CODE DESC;