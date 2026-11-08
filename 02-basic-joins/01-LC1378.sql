-- asks you to combine two database tables to display each employee's unique_id alongside their name. If an employee does not have a matching unique_id, the output must show NULL instead.

SELECT eu.unique_id, e.name
FROM Employees AS e
LEFT JOIN EmployeeUNI eu
    ON e.id = eu.id;