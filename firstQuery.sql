WITH month_series AS (
    SELECT generate_series(1, 12) AS month
),
individual_counts AS (
    SELECT EXTRACT(MONTH FROM time_given) AS month, COUNT(*) AS row_count
    FROM individual_lesson
    WHERE EXTRACT(YEAR FROM time_given) = 2024
    GROUP BY month
),
group_counts AS (
    SELECT EXTRACT(MONTH FROM time_given) AS month, COUNT(*) AS row_count
    FROM group_lesson
    WHERE EXTRACT(YEAR FROM time_given) = 2024
    GROUP BY month
),
ensemble_counts AS (
    SELECT EXTRACT(MONTH FROM g.time_given) AS month, COUNT(*) AS row_count
    FROM ensemble_lesson e
    JOIN group_lesson g ON e.group_lesson_id = g.group_lesson_id
    WHERE EXTRACT(YEAR FROM g.time_given) = 2024
    GROUP BY month
)
SELECT 
    m.month,
    COALESCE(i.row_count, 0) AS individual_lesson_count,
    COALESCE(g.row_count, 0) - COALESCE(e.row_count, 0) AS group_lesson_count,
    COALESCE(e.row_count, 0) AS ensemble_lesson_count,
    COALESCE(i.row_count, 0) + COALESCE(g.row_count, 0) AS total_count
FROM 
    month_series m
LEFT JOIN individual_counts i ON m.month = i.month
LEFT JOIN group_counts g ON m.month = g.month
LEFT JOIN ensemble_counts e ON m.month = e.month
WHERE (COALESCE(i.row_count, 0) + COALESCE(g.row_count, 0)) > 0
ORDER BY m.month;



