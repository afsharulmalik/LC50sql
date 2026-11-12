-- lat aur lon ka combination unique hona chaiye jo ki hum dekh skte hai 20 20 repeat ho rha hai toh usko remove kar denge

-- aur 10 10 ka tiv_2015 hai woh ek se jyada baar aana chaiye jo aa v rha hai 

-- output hoga tiv_2016 par k value ka sum 

SELECT
    ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM
    Insurance
WHERE tiv_2015 IN(
    SELECT
        tiv_2015
    FROM
        Insurance
    GROUP BY
        tiv_2015
    HAVING COUNT(*) > 1
) AND (lat, lon) IN (
    SELECT
        lat, lon
    FROM
        Insurance
    GROUP BY
        lat, lon
    HAVING COUNT(*) = 1
);