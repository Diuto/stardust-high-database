SHOW GRANTS FOR root@localhost;
/*
GRANT SELECT, 
INSERT, 
UPDATE, 
DELETE, 
CREATE, 
DROP,
RELOAD, 
SHUTDOWN, 
PROCESS, 
FILE, 
REFERENCES, 
INDEX, 
ALTER, 
SHOW DATABASES, 
SUPER, 
CREATE TEMPORARY TABLES, 
LOCK TABLES, 
EXECUTE, 
REPLICATION SLAVE, 
REPLICATION CLIENT, 
CREATE VIEW, 
SHOW VIEW, 
CREATE ROUTINE, 
ALTER ROUTINE, 
CREATE USER, 
EVENT, 
TRIGGER, 
CREATE TABLESPACE, 
CREATE ROLE, DROP ROLE ON *.* TO `root`@`localhost` WITH GRANT OPTION'
*/


SELECT @@autocommit;
SET @@autocommit = 0;

CREATE USER -- Create Users; the ICT staff and the class teachers. The last 3 users are ICT staff; administrators
	'nathan.l.bailey'@'staff.stardust.com' IDENTIFIED BY 'nathan123l',
	'brianna.e.allen'@'staff.stardust.com' IDENTIFIED BY 'brianna123e',
	'nicholas.w.roberts'@'staff.stardust.com' IDENTIFIED BY 'nicholas123w',
	'audrey.l.gonzales'@'staff.stardust.com' IDENTIFIED BY 'audrey123l',
	'alyssa.n.simmons'@'staff.stardust.com' IDENTIFIED BY 'alyssa123n',
	'alexandra.l.hernandez'@'staff.stardust.com' IDENTIFIED BY 'alexandra123l',
	'alexandra.m.wilson'@'staff.stardust.com' IDENTIFIED BY 'alexandra123m',
    'lillian.m.turner'@'staff.stardust.com' IDENTIFIED BY 'lillian123m',
	'robert.clark'@'staff.stardust.com' IDENTIFIED BY 'robert123c',
	'stephen.w.lopez'@'staff.stardust.com' IDENTIFIED BY 'stephen123w'
PASSWORD EXPIRE; -- To ensure the users create a new password upon first login
	

GRANT ALL PRIVILEGES ON stardust.*
TO 'lillian.m.turner'@'staff.stardust.com'; -- Lillian M. Turner is the Database Admin; gets all privileges

CREATE ROLE DBManager;	-- New role, Database Managers (other ICT staff)
GRANT					-- Grants privileges to the new role
	CREATE,
	ALTER,
    CREATE TEMPORARY TABLES,
    CREATE VIEW,
    EVENT,
    EXECUTE,
    INDEX,
    INSERT, 
    SELECT, 
    SHOW VIEW, 
    TRIGGER, 
    UPDATE 
ON stardust.* TO DBManager;

GRANT 'DBManager'		-- Adds users to the new role
TO 
'robert.clark'@'staff.stardust.com', 'stephen.w.lopez'@'staff.stardust.com';

-- Select privilege for the form teachers so they can use stored procedures
GRANT SELECT, EXECUTE ON stardust.*
TO
	'nathan.l.bailey'@'staff.stardust.com',
	'brianna.e.allen'@'staff.stardust.com',
	'nicholas.w.roberts'@'staff.stardust.com',
	'audrey.l.gonzales'@'staff.stardust.com',
	'alyssa.n.simmons'@'staff.stardust.com',
	'alexandra.l.hernandez'@'staff.stardust.com',
	'alexandra.m.wilson'@'staff.stardust.com';

COMMIT;

