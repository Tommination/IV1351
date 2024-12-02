SELECT 
    i.instructor_id,
    EXTRACT(YEAR FROM i.time_given) AS year,
    EXTRACT(MONTH FROM i.time_given) AS month,
    COUNT(DISTINCT i.instrument_lesson_id) + COUNT(DISTINCT g.group_lesson_id) AS total_lessons,
    p.first_name,
    p.last_name
FROM 
    individual_lesson i
JOIN 
    group_lesson g
    ON i.instructor_id = g.instructor_id
    AND EXTRACT(YEAR FROM i.time_given) = EXTRACT(YEAR FROM g.time_given)
    AND EXTRACT(MONTH FROM i.time_given) = EXTRACT(MONTH FROM g.time_given)
JOIN 
    instructor instr ON i.instructor_id = instr.instructor_id
JOIN 
    person p ON instr.person_id = p.person_id
WHERE 
    EXTRACT(YEAR FROM i.time_given) = EXTRACT(YEAR FROM CURRENT_DATE)
    AND EXTRACT(MONTH FROM i.time_given) = EXTRACT(MONTH FROM CURRENT_DATE)
GROUP BY 
    i.instructor_id, EXTRACT(YEAR FROM i.time_given), EXTRACT(MONTH FROM i.time_given), p.first_name, p.last_name
HAVING 
	COUNT(DISTINCT i.instrument_lesson_id) + COUNT(DISTINCT g.group_lesson_id) > 4
ORDER BY 
    total_lessons DESC;