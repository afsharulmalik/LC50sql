SELECT
    query_name,
    ROUND(AVG(rating/position),2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

--! This counts every single row in the group or table, regardless of what the rating is. This gives you the total number of queries.