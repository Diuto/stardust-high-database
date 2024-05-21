SET @@autocommit = 0;
DROP PROCEDURE student_subjects;
DELIMITER //
CREATE PROCEDURE student_subjects
(IN id_student INTEGER, IN class VARCHAR(20))
BEGIN
IF class IS NULL OR (SELECT class_id FROM students WHERE student_id = id_student) < 4 THEN
	SELECT subject_name, elective, 
    CASE WHEN s.middle_name IS NOT NULL 
			THEN CONCAT(s.first_name, ' ', s.middle_name, ' ', s.surname)
		ELSE CONCAT(s.first_name, ' ', s.surname) END AS teacher,
	s.email AS teacher_email
    FROM subjects
    LEFT JOIN staff s ON teacher_id = staff_id
    WHERE category = 'Junior';
ELSE -- (SELECT class_id FROM students WHERE student_id = id_student) >3 THEN
	SELECT subject_name, elective, 
    CASE WHEN s.middle_name IS NOT NULL 
			THEN CONCAT(s.first_name, ' ', s.middle_name, ' ', s.surname)
		ELSE CONCAT(s.first_name, ' ', s.surname) END AS teacher,
	s.email AS teacher_email
    FROM subjects
    LEFT JOIN staff s ON teacher_id = staff_id
    WHERE category = 'Senior'
    UNION
    SELECT subject_name, elective, 
    CASE WHEN s.middle_name IS NOT NULL 
			THEN CONCAT(s.first_name, ' ', s.middle_name, ' ', s.surname)
		ELSE CONCAT(s.first_name, ' ', s.surname) END AS teacher,
	s.email AS teacher_email
    FROM subjects
    LEFT JOIN staff s ON teacher_id = staff_id
    WHERE LOWER(category) LIKE LOWER(CONCAT('%', class, '%'));
/*ELSE
	SELECT * FROM subjects
    WHERE category = 'Junior';*/
END IF;
END //
DELIMITER ;

-- CALL student_subjects(2018101, 'Art');
COMMIT;


DELIMITER //
CREATE PROCEDURE student_details (IN stud_id integer)
BEGIN
	SELECT 
		s.student_id,
		CASE WHEN s.middle_name IS NULL THEN CONCAT(s.first_name, ' ', s.surname)
				ELSE CONCAT(s.first_name, ' ', s.middle_name, ' ', s.surname)
		END AS full_name,
		s.email,
		g.gender,
		YEAR(NOW()) - YEAR(s.date_of_birth) AS age,
		c.class_name AS class,
		CASE WHEN st.middle_name IS NULL THEN CONCAT(st.first_name, ' ', st.surname)
				ELSE CONCAT(st.first_name, ' ', st.middle_name, ' ', st.surname)
		END AS class_teacher
	FROM students s
	LEFT JOIN genders g ON s.gender_id = g.gender_id
	LEFT JOIN classes c ON s.class_id = c.class_id
	LEFT JOIN staff st ON c.form_teacher_id = st.staff_id
    WHERE s.student_id = stud_id;
END //
DELIMITER ;

-- CALL student_details(2021101);


DELIMITER //
CREATE PROCEDURE guardians_wards (IN guard_id INT)
BEGIN
	SELECT
	s.student_id,
		CASE WHEN s.middle_name IS NULL THEN CONCAT(s.first_name, ' ', s.surname)
				ELSE CONCAT(s.first_name, ' ', s.middle_name, ' ', s.surname)
		END AS full_name,
		s.email,
		g.gender,
		YEAR(NOW()) - YEAR(s.date_of_birth) AS age,
		c.class_name AS class,
		CASE WHEN st.middle_name IS NULL THEN CONCAT(st.first_name, ' ', st.surname)
				ELSE CONCAT(st.first_name, ' ', st.middle_name, ' ', st.surname)
		END AS class_teacher,
        st.phone AS teacher_phone,
        st.email AS teacher_email
    FROM students s
	LEFT JOIN genders g ON s.gender_id = g.gender_id
	LEFT JOIN classes c ON s.class_id = c.class_id
	LEFT JOIN staff st ON c.form_teacher_id = st.staff_id
    WHERE guardian_id = guard_id;
END //
DELIMITER ;

-- CALL guardians_wards(1003);


-- Student Results
DELIMITER //
CREATE PROCEDURE student_results 
(IN stud_id INT, IN acad_year VARCHAR(20), IN term_i VARCHAR(20))
BEGIN
	WITH res1 AS (
	SELECT
		s.subject_name,
		test1,
		test2,
		exam,
		test1+test2+exam AS total
	FROM results r
	LEFT JOIN subjects s ON r.subject_id = s.subject_id
	WHERE student_id = stud_id 
		AND term_id = (
			SELECT term_id FROM term 
            WHERE academic_year = acad_year AND term_name = term_i
            )
	UNION
	SELECT 
		'Overall Avg:',
		null,
		NULL,
		null,
		ROUND(AVG(test1+test2+exam), 2)
	FROM results
	WHERE student_id = stud_id 
		AND term_id = (
			SELECT term_id FROM term 
            WHERE academic_year = acad_year AND term_name = term_i
            )
),
grad AS (
	SELECT *, COALESCE(LAG(min_score, 1) OVER(), 100) AS next_score
	FROM grades
)
SELECT 
	subject_name,
    test1, test2, exam,
    total,
    grade_id AS grade,
    honour
FROM res1 r
LEFT JOIN grad g
ON r.total > g.min_score
	AND r.total BETWEEN g.min_score AND next_score;
END //
DELIMITER ;

-- CALL student_results(2020101, '2022/2023', 'First');


-- Teacher's Students
DELIMITER //
CREATE PROCEDURE form_teacher_students 
(IN teach_id INT)
BEGIN
	SELECT
		s.student_id,
		CASE WHEN s.middle_name IS NULL THEN CONCAT(s.first_name, ' ', s.surname)
					ELSE CONCAT(s.first_name, ' ', s.middle_name, ' ', s.surname)
			END AS full_name,
		s.email,
		s.date_of_birth,
		CASE WHEN gd.middle_name IS NULL THEN CONCAT(gd.first_name, ' ', gd.surname)
					ELSE CONCAT(gd.first_name, ' ', gd.middle_name, ' ', gd.surname)
			END AS guardian_name,
		gd.phone AS guardian_contact,
		gd.email AS guardian_email
	FROM students s
	LEFT JOIN classes c
	ON s.class_id = c.class_id
	LEFT JOIN genders g
	ON s.gender_id = g.gender_id
	LEFT JOIN guardians gd
	ON gd.guardian_id = s.guardian_id
	WHERE form_teacher_id = teach_id;
END //
DELIMITER ;

-- CALL form_teacher_students(14054);

-- Students in a Class
DELIMITER //
CREATE PROCEDURE num_students_class
(IN class_i VARCHAR(20), OUT num_students INTEGER)
BEGIN
	SELECT COUNT(*) INTO num_students
    FROM students s LEFT JOIN classes c ON s.class_id = c.class_id 
    WHERE class_name LIKE CONCAT('%', class_i, '%');
    SELECT
		s.student_id,
		CASE WHEN s.middle_name IS NULL THEN CONCAT(s.first_name, ' ', s.surname)
					ELSE CONCAT(s.first_name, ' ', s.middle_name, ' ', s.surname)
			END AS full_name,
		s.email
    FROM students s LEFT JOIN classes c ON s.class_id = c.class_id 
    WHERE class_name LIKE CONCAT('%', class_i, '%');
END //
DELIMITER ;

-- CALL num_students_class ('JSS2', @totalstudents);
-- SELECT @totalstudents;

