SELECT 
    activity_date AS day, 
    COUNT(DISTINCT user_id) AS active_users
FROM 
    Activity
WHERE 
    activity_date > '2019-06-27' AND activity_date <= '2019-07-27'
GROUP BY activity_date;



-- Explanation

-- • WHERE activity_date > '2019-06-27' AND activity_date <= '2019-07-27': Filters the data for the 30-day period. Note that the problem asks for the period ending on 2019-07-27 inclusively, so the starting boundary is strictly greater than 30 days prior (or you can use DATEDIFF / BETWEEN).
-- • GROUP BY activity_date: Groups the rows by each specific day to calculate daily metrics.
-- • COUNT(DISTINCT user_id): Since a user can perform multiple activities (like open, scroll, or close) on the same day, DISTINCT ensures each user is only counted once per day.