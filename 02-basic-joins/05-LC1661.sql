-- Ek factory website hai jisme kaafi saari machines hain. Har ek machine alag-alag processes run karti hai. Hamein ek Activity table diya gaya hai jo kuch aesa dikhta hai:

-- Hamein har ek machine ke liye Average Processing Time nikalna hai, aur answer ko 3 decimal places tak round karna hai.

-- SELECT
--     a1.machine_id,
--     ROUND(AVG(a2.timestamp - a1.timestamp),3) AS processing_time
-- FROM Activity AS a1
-- JOIN Activity AS a2
--     ON a1.machine_id = a2.machine_id
--     AND a1.process_id = a2.process_id
-- WHERE a1.activity_type = 'start'
-- AND a2.activity_type = 'end'
-- GROUP BY a1.machine_id;


-- subqueries wala solution 

SELECT
    machine_id,
    ROUND(AVG(end_time - start_time), 3) AS processing_time
FROM (
    SELECT
        machine_id,
        process_id,
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time,
        MAX(CASE WHEN activity_type = 'end'   THEN timestamp END) AS end_time
    FROM Activity
    GROUP BY machine_id, process_id
) AS process_times
GROUP BY machine_id;