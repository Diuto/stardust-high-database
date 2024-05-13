-- Drop any existing schemas of the same name
DROP SCHEMA IF EXISTS stardust;

-- Create a new Stardust schema
CREATE SCHEMA stardust;

-- Set stardust as the active schema for subsequent queries
USE stardust;


-- PART I: Create tables
CREATE TABLE staff_positions (
	position_id INTEGER PRIMARY KEY,
    position_name VARCHAR(50) NOT NULL,
    num_staff INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE marital_status (
	status_id INTEGER PRIMARY KEY,
    marital_status VARCHAR(50) NOT NULL
);

CREATE TABLE guardian_type (
	type_id INTEGER PRIMARY KEY,
    guardian_type VARCHAR(50) NOT NULL
);

CREATE TABLE genders (
	gender_id INTEGER PRIMARY KEY,
    gender VARCHAR(20) NOT NULL
);

CREATE TABLE grades (
	grade_id VARCHAR(5) PRIMARY KEY,
    min_score INTEGER
);

CREATE TABLE academic_year (
	year_id VARCHAR(20),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE term (
	term_id INTEGER PRIMARY KEY,
    term_name VARCHAR(20) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    academic_year VARCHAR(20) NOT NULL REFERENCES academic_year(year_id)
);

CREATE TABLE subjects (
	subject_id INTEGER PRIMARY KEY,
    subject_name VARCHAR(70) NOT NULL,
    teacher_id INTEGER,
    category VARCHAR (20) NOT NULL
);

CREATE TABLE staff (
	staff_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(150),
    gender_id VARCHAR(50) REFERENCES genders (gender_id),
    phone VARCHAR(20),
    position_id INTEGER NOT NULL,
    marital_id INTEGER,
    FOREIGN KEY (position_id) REFERENCES staff_positions (position_id),
    FOREIGN KEY (marital_id) REFERENCES marital_status (status_id)
);

CREATE TABLE classes (
	class_id INTEGER PRIMARY KEY,
    class_name VARCHAR(10) NOT NULL,
    form_teacher_id INTEGER NOT NULL,
    num_students INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (form_teacher_id) REFERENCES staff(staff_id)
);

CREATE TABLE guardians (
	guardians_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone VARCHAR(20),
    guardian_type_id INTEGER,
    marital_status_id INTEGER,
    FOREIGN KEY (guardian_type_id) REFERENCES guardian_type (type_id),
    FOREIGN KEY (marital_status_id) REFERENCES marital_status (status_id)
);

CREATE TABLE students(
	student_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(150),
    gender VARCHAR(20) REFERENCES genders(gender_id),
    date_of_birth DATE,
    guardian_id INTEGER NOT NULL REFERENCES guardians(guardian_id),
    date_joined DATE NOT NULL,
    class_id INTEGER NOT NULL REFERENCES classes(class_id)
);

CREATE TABLE results (
	student_id INTEGER REFERENCES students(student_id),
    subject_id INTEGER REFERENCES subjects(subject_id),
    academic_year VARCHAR(25) references academic_year(year_id),
    term_id INTEGER REFERENCES term(term_id),
    test1 INTEGER,
    test2 INTEGER,
    exam INTEGER,
    subject_date DATE
);

-- PART II: Database Objects
-- 1. Academic Year triggers
CREATE TRIGGER year_id
BEFORE INSERT ON academic_year
FOR EACH ROW 
	SET new.year_id = CONCAT(
						YEAR(start_date), 
						'/',
                        YEAR(end_date)
					);
CREATE TRIGGER student_class_update
AFTER INSERT ON academic_year
FOR EACH ROW
	UPDATE students
    SET class_id = class_id + 1
    WHERE class_id < 7;
CREATE TRIGGER num_students_class
AFTER INSERT ON academic_year
FOR EACH ROW
FOLLOWS student_class_update
	UPDATE classes
    SET num_students = (SELECT 
							COUNT(*) 
						FROM students
                        WHERE classes.class_id = students.class_id
                        )
	WHERE classes.class_id > 0;

-- Staff Table Triggers
CREATE TRIGGER staff_id
BEFORE INSERT ON staff
FOR EACH ROW
	SET new.staff_id = CONCAT(
							new.position_id, 
							00,
							(SELECT num_staff FROM staff_positions WHERE staff_position.positions_id = new.position_id)
						);
CREATE TRIGGER staff_email 
BEFORE INSERT ON staff
FOR EACH ROW
FOLLOWS staff_id
	SET new.email = CASE WHEN middle_name IS NOT NULL
						THEN CONCAT(first_name, '.', LEFT(middle_name, 1),'.', lastname, '@staff.stardust.com')
					ELSE CONCAT(first_name, '.', lastname, '@staff.stardust.com')
                    END;
CREATE TRIGGER update_num_staff
AFTER INSERT ON staff
FOR EACH ROW
	UPDATE staff_positions
	SET num_staff = num_staff + 1
    WHERE position_id = new.position_id;


-- Students Table Triggers
CREATE TRIGGER student_id
BEFORE INSERT ON students
FOR EACH ROW
	SET new.student_id = CONCAT(
						YEAR(date_joined), 
                        (
							SELECT num_students
                            FROM classes
                            WHERE classes.class_id = new.class_id
						)+101
					);
CREATE TRIGGER student_email
BEFORE INSERT ON students
FOR EACH ROW
FOLLOWS student_id
	SET new.email = CASE WHEN middle_name IS NOT NULL
						THEN CONCAT(first_name, '.', LEFT(middle_name, 1),'.', lastname, '@student.stardust.com')
					ELSE CONCAT(first_name, '.', lastname, '@student.stardust.com')
                    END;
CREATE TRIGGER update_class_students
AFTER INSERT ON students
FOR EACH ROW
	UPDATE classes
    SET num_students = num_students + 1
    WHERE classes.class_id = new.class_id;

-- Result Triggers
CREATE TRIGGER result_date
BEFORE INSERT ON results
FOR EACH ROW 
	SET new.subject_date = CAST(NOW() AS DATE);
    
-- Term Triggers
CREATE TRIGGER term_id
BEFORE INSERT ON term
FOR EACH ROW
	SET new.term_id = CONCAT(
						REPLACE(
							REPLACE(
								'2022/2023', '20', '')
							, '/', '')
						, CASE WHEN term_name = 'First' THEN '01'
								WHEN term_name = 'Second' THEN '02'
                                WHEN term_name = 'Third' THEN '03'
							ELSE NULL
                            END
						);