-- Dummy Data SQL File

-- Marital Status
INSERT INTO marital_status 
VALUES
(1, 'Single'),
(2, 'Married'),
(3, 'Divorced'),
(4, 'Widowed'),
(5, 'Separated');

SELECT * FROM marital_status;

-- Guardian Type
INSERT INTO guardian_type
VALUES
(1, 'Parent'),
(2, 'Uncle/Aunt'),
(3, 'Sibling'),
(4, 'Grandparent'),
(5, 'Other');

SELECT * FROM guardian_type;

-- Grades
INSERT INTO grades
VALUES
('A', 70, 'Distinction'),
('B', 60, 'Merit'),
('C', 50, 'Credit'),
('D', 45, 'Pass'),
('E', 40, 'Fail 1'),
('F', 0, 'Fail 2');

SELECT * FROM grades;

-- Genders
INSERT INTO genders
VALUES
(1, 'Female'),
(2, 'Male'),
(3, 'Rather Not Say');

SELECT * FROM genders;

-- Staff Position
INSERT INTO staff_positions (position_id, position_name)
VALUES
(11, 'Principal'),
(12, 'Vice Principal - Academics'),
(13, 'Vice Principal - Admin'),
(14, 'Teacher'),
(15, 'Bursar'),
(16, 'Teaching Assistant'),
(17, 'Secretary/Receptionist'),
(18, 'Guidance Counsellor'),
(19, 'Housemaster/mistress'),
(21, 'ICT');

SELECT * FROM staff_positions;
UPDATE staff_positions
SET num_staff = 0
WHERE position_id > 10;

-- Staff
INSERT INTO staff (first_name, middle_name, surname, gender_id, phone, position_id, date_joined, marital_id) 
VALUES
('Isabella','May','Carter',1,'08034522157',12,'2012-4-19',2)
,('Michael','Robert','Rogers',2,'08042909585',14,'2011-10-24',2)
,('Courtney','Rose','Washington',1,'08085173776',14,'2019-10-5',1)
,('Aubrey','Mae','Scott',1,'08003919354',11,'2011-1-10',2)
,('Grace','Margaret','Robinson',1,'08179776491',14,'2019-11-20',1)
,('Andrew','Eugene','Simmons',2,'08001369360',14,'2021-10-23',1)
,('Brianna','Elizabeth','Allen',1,'08074134768',16,'2014-8-27',2)
,('Brianna',NULL,'Brown',1,'08131908278',14,'2014-6-20',1)
,('Nicholas','Wayne','Roberts',2,'08105496450',16,'2013-7-22',2)
,('Lillian','Renee','Rivera',1,'08041814095',14,'2019-5-7',1)
,('Tiffany','Nicole','Cook',1,'08050954826',14,'2015-12-23',1)
,('Stephen',NULL,'Bell',2,'08026171342',14,'2018-8-4',3)
,('Audrey','Louise','Gonzales',1,'08066451504',16,'2013-8-8',2)
,('Alyssa','Nicole','Simmons',1,'08098212596',16,'2019-12-3',3)
,('Brittany','Jean','Bryant',1,'08058193076',14,'2021-5-1',3)
,('Tyler','William','Wright',2,'08144424650',14,'2010-10-30',1)
,('Amelia','Mary','Clark',1,'08069621123',14,'2014-10-6',1)
,('Eric',NULL,'Ross',2,'08050260159',14,'2019-3-22',3)
,('Jonathan','Francis','Cook',2,'08043889894',14,'2010-1-31',1)
,('Thomas','Charles','Evans',2,'08187416879',14,'2016-10-4',2)
,('Stephanie','Lou','Washington',1,'08072230598',14,'2020-7-24',2)
,('Tyler','Alan','Evans',2,'08013441684',14,'2020-9-21',2)
,('Oliver','John','Rogers',2,'08115739432',17,'2010-8-12',1)
,('Michelle','Ann','Simmons',1,'08070807527',14,'2018-3-18',2)
,('Richard','Edward','Clark',2,'08169467162',14,'2021-2-19',2)
,('Michael',NULL,'Stewart',2,'08128108257',14,'2015-5-2',2)
,('Jennifer',NULL,'Baker',1,'08063694107',14,'2023-1-11',1)
,('Alexandra','Lou','Hernandez',1,'08031626528',16,'2021-9-25',1)
,('Alexandra','Marie','Wilson',1,'08136034109',16,'2016-5-21',2)
,('James',NULL,'Patterson',2,'08084536369',16,'2018-5-31',2)
,('John',NULL,'Carter',2,'08198165141',14,'2020-6-25',3)
,('Lillian','Renee','White',1,'08041148641',16,'2017-11-15',2)
,('Sara','Grace','Turner',1,'08063411640',14,'2021-9-19',2)
,('Natalie','Mary','White',1,'08054524731',14,'2022-2-5',1)
,('Sofia','Jean','Thompson',1,'08135617877',14,'2012-11-3',1)
,('Dylan','Andrew','Nelson',2,'08125892337',14,'2018-12-4',3)
,('Timothy','George','Alexander',2,'08196925519',17,'2012-10-1',1)
,('Maria',NULL,'Bennett',1,'08127560161',14,'2010-2-28',5)
,('Audrey','Renee','Adams',1,'08111217000',14,'2013-7-23',2)
,('Tiffany',NULL,'Stewart',1,'08008610535',17,'2018-12-20',1)
,('Andrew',NULL,'Coleman',2,'08156407632',14,'2020-12-24',2)
,('Eric','Eugene','Washington',2,'08121510840',14,'2012-5-10',2)
,('Amelia','Dawn','Scott',1,'08061378936',14,'2014-8-18',1)
,('Kaitlyn',NULL,'Flores',1,'08119014113',14,'2020-4-18',1)
,('Tiffany','Nicole','Johnson',1,'08158923617',14,'2012-4-23',3)
,('Tyler','Henry','Price',2,'08129082277',14,'2016-5-25',1)
,('Joshua','Andrew','Evans',2,'08088203709',14,'2018-2-11',1)
,('Chelsea','Anne','Collins',1,'08048843051',13,'2011-4-12',5)
,('Elizabeth','Irene','Anderson',1,'08186993715',14,'2021-4-24',5)
,('Brian','Joseph','Campbell',2,'08197616606',14,'2019-7-22',2)
,('Amelia','Sue','Bryant',1,'08038973995',14,'2024-3-15',1)
,('Ashley','Sue','Morris',1,'08080758082',14,'2013-9-5',3)
,('Austin','Joseph','Cook',2,'08098833220',14,'2012-3-19',2)
,('Tyler','Alan','Bell',2,'08139438070',14,'2023-4-22',2)
,('Ashley','Kay','Martinez',1,'08054409416',14,'2012-3-13',1)
,('Rebecca','Sue','Gray',1,'08026959023',16,'2021-7-12',4)
,('Austin','Joseph','Patterson',2,'08141789001',16,'2010-12-31',5)
,('Courtney','Anne','Thompson',1,'08188958374',14,'2019-11-18',3)
,('James','Richard','Washington',2,'08114557106',14,'2019-2-10',5)
,('Jennifer','Michelle','Rivera',1,'08143652364',14,'2021-2-22',1)
,('Andrew',NULL,'Patterson',2,'08057541486',16,'2016-8-20',2)
,('Lillian','Mae','Turner',1,'08041767050',21,'2018-5-6',3)
,('James','Lee','James',2,'08005334128',14,'2017-9-10',1)
,('Amelia','Nicole','Baker',1,'08113783492',14,'2019-6-27',3)
,('Jeremy','Alexander','Perez',2,'08191515699',14,'2011-10-29',2)
,('Robert',NULL,'Clark',2,'08045399122',21,'2019-7-23',1)
,('Victoria','Lou','Parker',1,'08054624099',14,'2012-7-3',2)
,('Charlotte','Louise','Green',1,'08165063632',14,'2014-1-20',2)
,('Haley','Mae','Griffin',1,'08097681488',15,'2014-5-16',3)
,('Melissa','Faith','Hill',1,'08095199444',15,'2010-4-23',3)
,('Aiden','David','Rogers',2,'08167449729',18,'2011-6-28',1)
,('Sophia','Anne','Carter',1,'08172116919',18,'2014-10-9',2)
,('Amber','Lynn','Washington',1,'08056388000',14,'2011-9-17',2)
,('Stephen','Joseph','Roberts',2,'08195625132',16,'2022-10-2',1)
,('Courtney','Dawn','Ramirez',1,'08103885778',14,'2015-10-2',2)
,('Olivia','Lynn','Bennett',1,'08098368475',14,'2022-3-16',1)
,('Stephen','Wayne','Lopez',2,'08193843982',21,'2023-8-7',1)
,('Lauren',NULL,'King',1,'08174591953',14,'2011-4-4',3)
,('Nathan','Lee','Bailey',2,'08145892807',14,'2019-11-18',3)
,('Amber','Sue','Perry',1,'08043895578',14,'2013-1-17',5);

SELECT * FROM staff; -- WHERE POSITION_ID = 16;

-- Subjects
INSERT INTO subjects (subject_id,subject_name,category,elective,teacher_id) 
VALUES
 (101,'English Language','Junior',0,14001)
,(301,'English Language','Senior',0,14002)
,(201,'Mathematics','Junior',0,14003)
,(302,'Mathematics','Senior',0,14004)
,(202,'Basic Science','Junior',0,14005)
,(203,'Social Studies','Junior',0,14006)
,(204,'Home Econmics','Junior',0,14007)
,(205,'Igbo','Junior',1,14008)
,(401,'Igbo','Arts',1,14009)
,(206,'Yoruba','Junior',1,14055)
,(402,'Yoruba','Arts',1,14011)
,(207,'Hausa','Junior',1,14012)
,(403,'Hausa','Arts',1,14013)
,(208,'Business Studies','Junior',0,14014)
,(209,'Cultural/Creative Arts','Junior',0,14015)
,(210,'Civic Education','Junior',0,14016)
,(303,'Civic Education','Senior',0,14017)
,(211,'Physical Health Education','Junior',1,14018)
,(212,'History','Junior',0,14019)
,(404,'History','Arts',0,14020)
,(213,'Basic Technology','Junior',0,14021)
,(214,'Agricultural Science','Junior',0,14022)
,(601,'Agricultural Science','Science',1,14023)
,(215,'Computer Science','Junior',0,14024)
,(304,'Computer Science','Senior',0,14025)
,(216,'Music','Junior',1,14026)
,(405,'Music','Arts',1,14027)
,(406,'Literature-in-English','Arts',0,14028)
,(217,'Christian Religious Studies','Junior',1,14029)
,(305,'Christian Religious Studies','Senior',1,14030)
,(218,'Islamic Religious Studies','Junior',1,14031)
,(306,'Islamic Religious Studies','Senior',1,14032)
,(219,'Arabic','Junior',1,14033)
,(220,'French','Junior',1,14034)
,(221,'Latin','Junior',1,14035)
,(307,'Arabic','Senior',1,14036)
,(308,'French','Senior',1,14037)
,(309,'Latin','Senior',1,14038)
,(602,'Biology','Science',0,14039)
,(603,'Physics','Science',0,14040)
,(604,'Chemistry','Science',0,14041)
,(310,'Economics','Senior',0,14042)
,(605,'Further Mathematics','Science',1,14043)
,(606,'Geography','Science',1,14044)
,(407,'Government','Arts',0,14045)
,(501,'Insurance','Commercial',1,14046)
,(502,'Commerce','Commercial',0,14047)
,(503,'Financial Accounting','Commercial',0,14048)
,(504,'Office Practice','Commercial',1,14049)
,(505,'Book Keeping','Commercial',1,14050)
,(311,'Food and Nutrition','Senior',1,14051)
,(312,'Marketing','Senior',1,14052)
,(607,'Technical Drawing','Science',1,14053);

SELECT * FROM subjects;

-- Classes
INSERT INTO classes (class_id, class_name, form_teacher_id)
VALUES
(1, 'JSS1', 16001),
(2, 'JSS2', 16002),
(3, 'JSS3', 16003),
(4, 'SS1', 16004),
(5, 'SS2', 16005),
(6, 'SS3', 16006),
(7, 'Alumni', 14054);

SELECT * FROM classes;

-- Guardians
INSERT INTO guardians (first_name, middle_name, surname, email, gender_id, phone, guardian_type_id, marital_status_id)
VALUES
('John', 'Chijindu', 'Okeke', 'johnokeke@gmail.com', 2, '08031345678', 1, 2),
('Chinemerem', NULL , 'Ike-Okonkwo', 'chiikeokonkwo@gmail.com', 1, '09123456783', 1, 2),
('Chidiuto', 'Emmanuel', 'Okorie', 'diutookorie@gmail.com', 2, '08142175243', 2, 1),
('Goodness', 'Onyedikachi', 'Matthias', 'mathiasghud@gmail.com', 3, '07034567412', 4, 3),
('Oluwaseyi', 'Samuel', 'Adeogun', 'seyiadeogun@gmail.com', 2, '08189934748', 2, 1),
('Tsang', NULL, 'Tsung', 'tsangtsung@shaokhan.com', 3, '55501230123', 5, 5);

SELECT * FROM guardians;

-- Students
INSERT INTO students (first_name, middle_name, surname, gender_id, date_of_birth, guardian_id, date_joined, class_id)
VALUES
('Onochie', 'Jordan', 'Okorie', 2, '2010-05-22', 1003, '2020-09-10', 2),
('Oluwole', 'Samuel', 'Adeogun', 2, '2007-09-10', 1005, '2017-09-08', 5),
('Janet', NULL, 'Spark', 1, '2011-01-01', 1006, '2021-08-30', 1),
('Obiajulu', 'Praise', 'Okorie', 1, '2006-09-11', 1003, '2016-09-06', 6),
('Nicholas', 'Odinaka', 'Okeke', 2, '2002-11-18', 1001, '2015-09-05', 7),
('Anthony', 'Omachi', 'Ike-Okonkwo', 2, '2004-09-11', 1002, '2018-01-02', 5),
('Providence', 'Adaugo', 'Matthias', 1, '2011-12-20', 1004, '2021-09-10', 1),
('Promise', 'Chidindu', 'Matthias', 2, '2011-12-20', 1004, '2021-09-10', 1);

SELECT * FROM students;

-- Academic Sessions
INSERT INTO academic_year (start_date, end_date)
VALUES
('2022-09-12', '2023-07-23');

SELECT * FROM academic_year;

INSERT INTO term (term_name, start_date, end_date, academic_year)
VALUES
('First', '2022-09-12', '2022-12-14', '2022/2023'),
('Second', '2023-01-06', '2023-03-29', '2022/2023'),
('Third', '2023-04-21', '2023-07-23', '2022/2023');

SELECT * FROM term;


INSERT INTO results 
VALUES
(2020101, 101, '2022/2023', 222301, 17, 13, 42, '2022-12-03'),
(2020101, 201, '2022/2023', 222301, 12, 14, 39, '2022-12-03'),
(2020101, 202, '2022/2023', 222301, 13, 10, 45, '2022-12-03'),
(2020101, 203, '2022/2023', 222301, 18, 19, 51, '2022-12-03'),
(2020101, 204, '2022/2023', 222301, 9, 16, 43, '2022-12-03'),
(2020101, 205, '2022/2023', 222301, 17, 17, 34, '2022-12-03'),
(2020101, 208, '2022/2023', 222301, 15, 15, 48, '2022-12-03'),
(2020101, 209, '2022/2023', 222301, 11, 13, 37, '2022-12-03'),
(2020101, 210, '2022/2023', 222301, 10, 20, 47, '2022-12-03');

SELECT * FROM results;

SELECT
    COALESCE(s.subject_name, 'Overall Avg') AS subjects,
    ROUND(AVG(test1+test2+exam), 2) AS scores
FROM results r
LEFT JOIN subjects s ON r.subject_id = s.subject_id
GROUP BY s.subject_name WITH ROLLUP;


/* WITH res1 AS (
	SELECT
		s.subject_name,
		test1,
		test2,
		exam,
		test1+test2+exam AS total
	FROM results r
	LEFT JOIN subjects s ON r.subject_id = s.subject_id
	WHERE student_id = 2020101 and term_id = 222301
	UNION
	SELECT 
		'Overall Avg:',
		null,
		NULL,
		null,
		ROUND(AVG(test1+test2+exam), 2)
	FROM results
	WHERE student_id = 2020101 and term_id = 222301
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
    
;*/