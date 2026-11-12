SELECT
    d1.name AS Department,
    e1.name AS Employee,
    e1.salary AS Salary
FROM
    Employee e1 
INNER JOIN
    Department d1
ON 
    e1.departmentId = d1.id
WHERE
    3 > (
        SELECT
            COUNT(DISTINCT(e2.salary))
        FROM
            Employee e2
        WHERE
            e2.salary > e1.salary
        AND
            e1.departmentId = e2.departmentId
    );