SELECT ROUND(AVG(LAT_N), 4)
FROM (
    SELECT
        LAT_N,
        @rownum := @rownum + 1 AS rn
    FROM station, (SELECT @rownum := 0) AS r
    ORDER BY LAT_N
) AS t
WHERE rn IN (
    FLOOR((@rownum + 1) / 2),
    CEIL((@rownum + 1) / 2)
);
