-- SELECT e1.name
-- FROM Employee e1
-- JOIN Employee e2 ON e1.id = e2.managerId
-- GROUP BY e1.id, e1.name
-- HAVING COUNT(e2.id) >= 5;

-- Kya ho raha hai:
-- e1 = manager ki row, e2 = report ki row.
-- e1.id = e2.managerId — har manager ko uske reports ke saath jodo.
-- GROUP BY e1.id, e1.name — har manager ke reports ek group mein.
-- HAVING COUNT(e2.id) >= 5 — sirf wo managers jinke paas ≥5 reports hain.
-- Fayda: WHERE managerId IS NOT NULL ki zaroorat nahi — JOIN khud NULL wale rows ko drop kar deta hai (NULL kisi id se match nahi karta). But GROUP BY mein e1.name include karna zaroori hai (SQL standard ke hisaab se, agar SELECT mein hai toh GROUP BY mein hona chahiye — MySQL mein sometimes chal jata hai bina, but safe raho)



SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
);