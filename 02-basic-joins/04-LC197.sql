SELECT wa.id
FROM Weather AS wa
JOIN Weather AS wb
    ON DATEDIFF(wa.recordDate, wb.recordDate) = 1
WHERE wa.temperature > wb.temperature;

-- DATEDIFF SQL ka ek inbuilt function hai jo do dates ke beech ka farq (difference) nikalta hai. Yeh dino (days) me answer deta hai.