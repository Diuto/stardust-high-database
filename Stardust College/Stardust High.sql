-- Drop any existing schemas of the same name
DROP SCHEMA IF EXISTS stardust;

-- Create a new Stardust schema
CREATE SCHEMA stardust;

-- Set stardust as the active schema for subsequent queries
USE stardust;


-- Create tables
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
    term VARCHAR(10) NOT NULL,
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

