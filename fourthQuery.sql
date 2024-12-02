SELECT 
    g.group_lesson_id,
    TO_CHAR(g.time_given, 'FMDay') AS weekday_name,
    gr.value AS genre_value,
    CASE
        WHEN COUNT(sgl.student_id) = g.max_students THEN 'No seats'
        WHEN COUNT(sgl.student_id) >= g.max_students - 2 THEN '1 or 2 Seats'
        ELSE 'Many seats'
    END AS seat_availability
FROM 
    ensemble_lesson e
JOIN 
    group_lesson g ON e.group_lesson_id = g.group_lesson_id
JOIN 
    genre gr ON e.genre_id = gr.genre_id
LEFT JOIN 
    student_group_lesson sgl ON g.group_lesson_id = sgl.group_lesson_id
WHERE 
    g.time_given >= CURRENT_DATE 
    AND g.time_given < CURRENT_DATE + INTERVAL '1 week'
GROUP BY 
    g.group_lesson_id, g.time_given, gr.value, g.max_students
ORDER BY 
    g.time_given;