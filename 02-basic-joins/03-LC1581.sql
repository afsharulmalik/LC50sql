-- Isme hume un customers ki list nikalni hai jo mall/store me aaye toh sahi (visit kiya) par unhone koi shopping nahi ki (koi transaction nahi kiya), aur saath hi yeh bhi batana hai ki aisi kitni visits thi.

-- SELECT 
--     v.customer_id,
--     COUNT(v.visit_id) AS count_no_trans
-- FROM Visits AS v
-- LEFT JOIN Transactions AS t 
--     ON v.visit_id = t.visit_id
-- WHERE t.transaction_id IS NULL
-- GROUP BY v.customer_id;

SELECT 
    customer_id, 
    COUNT(visit_id) AS count_no_trans
FROM 
    Visits
WHERE 
    visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY 
    customer_id;