SELECT 
    number_of_siblings, 
    COUNT(*) AS student_count
FROM (
    -- Subquery for students with siblings
    SELECT student_id, 
           COUNT(DISTINCT sibling_id) AS number_of_siblings
    FROM sibling
    GROUP BY student_id
    
    UNION ALL
    
    -- Subquery for students with no siblings
    SELECT st.student_id, 
           0 AS number_of_siblings
    FROM student st
    LEFT JOIN sibling s ON st.student_id = s.student_id
    WHERE s.student_id IS NULL
) AS sibling_counts
GROUP BY number_of_siblings
ORDER BY number_of_siblings;