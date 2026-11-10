--
-- +-------------+-------------+------------+-----------------------------+
-- | delivery_id | customer_id | order_date | customer_pref_delivery_date |
-- +-------------+-------------+------------+-----------------------------+
-- | 1           | 1           | 2019-08-01 | 2019-08-02                  |-s s: scheduled
-- | 2           | 2           | 2019-08-02 | 2019-08-02                  |-i i: immediate
-- | 5           | 3           | 2019-08-21 | 2019-08-22                  |-s
-- | 7           | 4           | 2019-08-09 | 2019-08-09                  |-i
-- +-------------+-------------+------------+-----------------------------+
-- Output: 
-- +----------------------+
-- | immediate_percentage |
-- +----------------------+
-- | 50.00                |
-- +----------------------+
--
-- sql query

SELECT
    ROUND(SUM(IF(order_date = customer_pref_delivery_date, 1, 0))*100 / COUNT(DISTINCT customer_id), 2) AS immediate_percentage  
FROM Delivery
WHERE (customer_id,order_date) IN (
    SELECT
    customer_id,
    MIN(order_date) AS first_order_date
FROM Delivery
GROUP BY customer_id
);