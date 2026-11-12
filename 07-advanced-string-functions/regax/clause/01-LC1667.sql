SELECT
    user_id,
    CONCAT(
        UPPER(LEFT(name,1)),
        LOWER(SUBSTRING(name,2))
    ) AS name
FROM
    Users
ORDER BY
    user_id;

-- upper(left) it converts first letter into capital
-- lower(substring) it converts rest into smaller