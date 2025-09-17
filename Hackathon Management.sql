DROP TABLE IF EXISTS users;
CREATE TABLE users(
	userid SERIAL PRIMARY KEY,
	email VARCHAR(20),
	password VARCHAR(10)
);

INSERT INTO users (email, password) VALUES
	('sonu@gmail.com', '!@BJHff5'),
	('Samar@gmail.com', '#$DFG24d'),
	('adtiya@yahoo.com', 'bdh*HJ5'),
	('Mqtar@firefox.com', 'NJ*&hj23'),
	('jaipur@gmail.com', 'sur12^Gg');

SELECT * FROM users;


DROP TABLE IF EXISTS coordinator;
CREATE TABLE coordinator(
	coId INT PRIMARY KEY REFERENCES member(memberId),
	role VARCHAR(20) DEFAULT 'Volunteer',
	state VARCHAR(20) DEFAULT 'Active'
);

INSERT INTO coordinator(coId, role, state) VALUES
	(25, 'Executive', 'Not Active'),
	(14, 'Database Coordinator', 'Active'),
	(23, 'Volunteer', 'Not Active');

SELECT * FROM coordinator;

DROP TABLE IF EXISTS member;
CREATE TABLE member(
	memberId INT PRIMARY KEY,
	Fname VARCHAR(20),
	Lname VARCHAR(20),
	PhoneNum INT,
	Email VARCHAR(50),
	department VARCHAR(20),
	yearofStudy INT,
	Enrollment INT,
	Participated_track VARCHAR(20),
	GitLink VARCHAR(50),
	linkedlnLink VARCHAR(50)
);

COPY member(memberId, Fname, Lname, Email, department, yearofStudy)
FROM '‪D:\member.csv'
CSV HEADER;

INSERT INTO member(memberId, Fname, Lname, Email, department, yearofStudy)
VALUES
	(1 ,'Rohit', 'Kumar', 'balljoseph@wth.net','CSE', 2023),
	(2, 'Paridhi', 'Gupta', 'kimberlybennett@curtis.com', 'CSE', 2028),
	(3, 'Utkarsh' ,'Kumar', 'beanmichael@burnet.net', 'ECE/EI',2028),
	(14, 'Rachit', 'Singh', 'amandahood@warren.com','CSE', 2028),
	(25, 'Jatin', 'Kumar', 'connerjohn@yahoo.com', 'CSE', 2028),
	(23, 'Prakshi',	'Agarwal', 'ricemiguel@yahoo.com', 'CSE', 2028);


SELECT * FROM member;

CREATE TABLE team(
	teamid INT PRIMARY KEY,
	numOfMember INT,
	teamName VARCHAR(20),
	topic text
);

INSERT INTO team (teamid, numOfMember, teamName, topic) VALUES
	(402, 4, 'TecNovas', 'Rainwater Harvesting'),
	(802, 5, 'Hackedlik', 'Jharkhand Tourism'),
	(782, 2, 'GreenWheel', 'Cab Sharing');

SELECT * FROM team;

SELECT CONCAT(m.Fname, ' ', m.Lname) AS Full_name, c.role, c.state
FROM member AS m
JOIN 
coordinator AS c
ON m.memberId = c.coId;

SELECT m.Fname, m.Lname, c.state
FROM member AS m
JOIN 
coordinator AS c
ON m.memberId = c.coId
WHERE c.state = 'Active';