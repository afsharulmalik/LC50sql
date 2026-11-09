SELECT
    e.name,
    b.bonus
FROM Employee AS e
LEFT JOIN Bonus AS b
    ON e.empId = b.empId
WHERE bonus IS NULL OR bonus < 1000;