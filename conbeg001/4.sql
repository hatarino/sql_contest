SELECT
    ORDERS_DTL.ITEM_CODE AS CODE,
    ITEM.ITEM_NAME AS NAME,
    SUM(ORDERS_DTL.ORDER_QTY) AS SUM_QTY
FROM ORDERS
INNER JOIN
    ORDERS_DTL
    ON ORDERS.ORDER_NO = ORDERS_DTL.ORDER_NO
INNER JOIN
    WAREHOUSE
    ON ORDERS.WH_CODE = WAREHOUSE.WH_CODE AND WAREHOUSE.WH_NAME = '浦和倉庫'
LEFT OUTER JOIN ITEM
    ON ORDERS_DTL.ITEM_CODE = ITEM.ITEM_CODE
GROUP BY ORDERS_DTL.ITEM_CODE
HAVING SUM(ORDERS_DTL.ORDER_QTY) >= 50
ORDER BY SUM_QTY DESC, ORDERS_DTL.ITEM_CODE DESC;
