INSERT INTO public.programs(
	programid, programname, duration, description, programfees, total_credits, numberofintakes, numberofsemesters, semesterduration, programlanguage)
	VALUES (1,'AIS',18,'Courses about ai', 18000, 120, 2,4, 3, 'English');
INSERT INTO public.programs(
	programid, programname, duration, description, programfees, total_credits, numberofintakes, numberofsemesters, semesterduration, programlanguage)
	VALUES (2,'DSA',18,'Courses about data science', 12900, 120, 2,4, 3, 'English');
INSERT INTO public.programs(
	programid, programname, duration, description, programfees, total_credits, numberofintakes, numberofsemesters, semesterduration, programlanguage)
	VALUES (3,'SE',18,'Courses about Software development', 12900, 120, 2,4, 3, 'English');
		
select * from programs;

-- INSERTING INTO INTAKE TABLE
INSERT INTO public.intake(
	intakeid, intakeyear, intakesession)
	VALUES (1, 2021, 'Spring');
INSERT INTO public.intake(
	intakeid, intakeyear, intakesession)
	VALUES (2, 2020, 'Fall');
INSERT INTO public.intake(
	intakeid, intakeyear, intakesession)
	VALUES (3, 2021, 'Fall');

select * from intake;

-- INSERTING INTO TEACHER TABLE
INSERT INTO public.teacher(
	teacherid, teachername, personalemail, address, city, country, diploma, salarypersession, domainofexpertise, hoursperweek, teachertype)
	VALUES (1,'Teacher_A', 'teacherA@gmail.com', '123 victor hugo', 'Paris', 'France', 'BAC+5', 500, 'AI',10, 'independant');
INSERT INTO public.teacher(
	teacherid, teachername, personalemail, address, city, country, diploma, salarypersession, domainofexpertise, hoursperweek, teachertype)
	VALUES (2,'Teacher_B', 'teacherB@gmail.com', '123 Rue francais', 'Paris', 'France', 'PhD', 800, 'Data Science',25, 'internal');
INSERT INTO public.teacher(
	teacherid, teachername, personalemail, address, city, country, diploma, salarypersession, domainofexpertise, hoursperweek, teachertype)
	VALUES (3,'Teacher_C', 'teacherC@gmail.com', '123 Rue peter', 'Lille', 'France', 'BAC+5', 600, 'Software Eng',10, 'independant');


select * from teacher;

-- INSERTING INTO TEACHER_LOGIN
INSERT INTO public.teacher_login(
	referenceid, fk_teacherid, email, tpassword)
	VALUES (1, 1, 'teacherA@epita.fr','abc123');
INSERT INTO public.teacher_login(
	referenceid, fk_teacherid, email, tpassword)
	VALUES (2, 2, 'teacherB@epita.fr','bca123');
INSERT INTO public.teacher_login(
	referenceid, fk_teacherid, email, tpassword)
	VALUES (3, 3, 'teacherC@epita.fr','cba123');

select * from teacher_login;

-- alter table bankdetails alter column iban type varchar(50);

-- INSERTING INTO BANKDETAILS TABLE
INSERT INTO public.bankdetails(
	bankindex, bankname, iban, bic, bankbranch, fk_teacherid)
	VALUES (1, 'BNP Paribas', 'FR1212323412432', 'BNPFR123', 'Paris', 1);
INSERT INTO public.bankdetails(
	bankindex, bankname, iban, bic, bankbranch, fk_teacherid)
	VALUES (2, 'BNP Paribas', 'FR4564572355477', 'BNPFR134', 'villejuif', 2);
INSERT INTO public.bankdetails(
	bankindex, bankname, iban, bic, bankbranch, fk_teacherid)
	VALUES (3, 'CIC BANQUE', 'FR2452514567836', 'CICFR123', 'Lille', 3);

select * from bankdetails;


-- INSERTING INTO THE COURSE TABLE
INSERT INTO public.course(
	courseid, coursename, courseduration,coursedescription, coursecredits, fk_teacherid)
	VALUES (1, 'Machine learning 1', 3,'About Machine learning', 3, 1);
INSERT INTO public.course(
	courseid, coursename, courseduration,coursedescription, coursecredits, fk_teacherid)
	VALUES (2, 'ADV JAVA', 3,'About java', 3, 3);
INSERT INTO public.course(
	courseid, coursename, courseduration,coursedescription, coursecredits, fk_teacherid)
	VALUES (3, 'Data Visualization', 3, 'About data visualization',2, 2);
INSERT INTO public.course(
	courseid, coursename, courseduration,coursedescription, coursecredits, fk_teacherid)
	VALUES (4, 'Advanced Algorithm', 3, 'About algorithms',3, 1);

select * from course;

-- INSERTING INTO PROGRAM_COURSE common table
INSERT INTO public.program_course(
	fk_courseid, fk_programid, fk_intakeid)
	VALUES (1, 1, 1);
INSERT INTO public.program_course(
	fk_courseid, fk_programid, fk_intakeid)
	VALUES (2, 3, 1);
INSERT INTO public.program_course(
	fk_courseid, fk_programid, fk_intakeid)
	VALUES (3, 2, 1);
INSERT INTO public.program_course(
	fk_courseid, fk_programid, fk_intakeid)
	VALUES (4, 1, 1);
INSERT INTO public.program_course(
	fk_courseid, fk_programid, fk_intakeid)
	VALUES (4, 2, 1);
INSERT INTO public.program_course(
	fk_courseid, fk_programid, fk_intakeid)
	VALUES (4, 3, 1);
INSERT INTO public.program_course(
	fk_courseid, fk_programid, fk_intakeid)
	VALUES (2, 1, 3);

select * from program_course;

-- INSERTING INTO ROOMS
INSERT INTO public.room(
	roomid, roomname, capacity, status)
	VALUES (1, 'Salle 604', 45, 'Available');
INSERT INTO public.room(
	roomid, roomname, capacity, status)
	VALUES (2, 'Salle 605', 15, 'Available');
INSERT INTO public.room(
	roomid, roomname, capacity, status)
	VALUES (3, 'Salle 606', 12, 'Available');
INSERT INTO public.room(
	roomid, roomname, capacity, status)
	VALUES (4, 'Salle 608', 18, 'Under Maintenance');

select * from room;

-- INSERTING INTO STUDENTS TABLE
INSERT INTO public.student(
	studentid, fk_programid, fk_intakeid, personalemail, phonenumber, address, city, country, birthdate, yearsofexperience,status)
	VALUES (1, 1, 1, 'student1@gmail.com', 123456789, '123 Val Road', 'NYC', 'USA', '1996-01-01', 1,'Enrolled');
INSERT INTO public.student(
	studentid, fk_programid, fk_intakeid, personalemail, phonenumber, address, city, country, birthdate, yearsofexperience,status)
	VALUES (2, 1, 1, 'student2@gmail.com', 123456789, '321 boston Road', 'BOSTON', 'USA', '1997-01-01', 1,'Enrolled');

INSERT INTO public.student(
	studentid, fk_programid, fk_intakeid, personalemail, phonenumber, address, city, country, birthdate, yearsofexperience,status)
	VALUES (3, 2, 1, 'student3@gmail.com', 3456234123, '152 Dubs Road', 'SAN FRANCISCO', 'USA', '1995-05-01', 0,'Enrolled');
INSERT INTO public.student(
	studentid, fk_programid, fk_intakeid, personalemail, phonenumber, address, city, country, birthdate, yearsofexperience,status)
	VALUES (4, 2, 1, 'student4@gmail.com', 7894551682, '185 Mack Road', 'Miami', 'USA', '1992-01-01', 6,'Enrolled');

INSERT INTO public.student(
	studentid, fk_programid, fk_intakeid, personalemail, phonenumber, address, city, country, birthdate, yearsofexperience,status)
	VALUES (5, 3, 1, 'student5@gmail.com', 456238789, '100 Mech Road', 'austin', 'USA', '1993-05-01', 2,'Enrolled');
INSERT INTO public.student(
	studentid, fk_programid, fk_intakeid, personalemail, phonenumber, address, city, country, birthdate, yearsofexperience,status)
	VALUES (6, 3, 1, 'student6@gmail.com', 9658987239, '956 New Road', 'austin', 'USA', '1985-08-01', 10,'Enrolled');
INSERT INTO public.student(
	studentid, fk_programid, fk_intakeid, personalemail, phonenumber, address, city, country, birthdate, yearsofexperience,status)
	VALUES (7, 3, 1, 'student7@gmail.com', 9897282139, '1246 NYC Road', 'kentucky', 'USA', '1989-11-01', 10,'Candidate');

-- alter table student add column status varchar(255);
-- alter table student alter column status set not null;
-- update student set status='Enrolled' where country='USA';
select * from student;

select * from student where studentid=2;

-- INSERTING INTO STUDENT_PAYMENT
INSERT INTO public.student_payment(
	paymentid, fk_studentid, paymentdate, amount, paymenttype, status,paidSemester)
	VALUES (101, 1, '2020-09-09', 6000, 'ONLINE', 'Enrolled',1);
INSERT INTO public.student_payment(
	paymentid, fk_studentid, paymentdate, amount, paymenttype, status,paidSemester)
	VALUES (102, 2, '2020-08-09', 6000, 'ONLINE', 'Enrolled',1);
INSERT INTO public.student_payment(
	paymentid, fk_studentid, paymentdate, amount, paymenttype, status,paidSemester)
	VALUES (103, 3, '2020-09-10', 1000, 'ONLINE', 'Enrolled',1);
INSERT INTO public.student_payment(
	paymentid, fk_studentid, paymentdate, amount, paymenttype, status,paidSemester)
	VALUES (104, 4, '2020-12-09', 2000, 'CASH', 'Enrolled',1);
INSERT INTO public.student_payment(
	paymentid, fk_studentid, paymentdate, amount, paymenttype, status,paidSemester)
	VALUES (105, 5, '2020-11-09', 5000, 'CHECK', 'Enrolled',1);
INSERT INTO public.student_payment(
	paymentid, fk_studentid, paymentdate, amount, paymenttype, status,paidSemester)
	VALUES (106, 6, '2020-10-09', 6000, 'ONLINE', 'Enrolled',1);
INSERT INTO public.student_payment(
	paymentid, fk_studentid, paymentdate, amount, paymenttype, status,paidSemester)
	VALUES (107, 1, '2020-10-09', 6000, 'ONLINE', 'Enrolled',2);
-- alter table student_payment add column paidSemester integer;
-- alter table student_payment alter column paidSemester set not null;
-- update student_payment set paidSemester = 1 where status='Enrolled'; 


-- INSERTING DATA INTO EXAMS
INSERT INTO public.exam(
	examid, examname, examduration, fk_courseid, fk_programid,examType,examWeightage)
	VALUES (1, 'Machine Learning', 3, 1, 1,'quiz',50);
INSERT INTO public.exam(
	examid, examname, examduration, fk_courseid, fk_programid,examType,examWeightage)
	VALUES (2, 'Adv JAVA', 2, 2, 3,'quiz',50);
select * from exam;


select * from course;
	
-- INSERTING DATA INTO SESSION
INSERT INTO public.session(
	sessionid, fk_programid, fk_teacherid, fk_examid, fk_roomid, starttime, endtime, sessiontype, sdate,fk_courseid)
	VALUES (1, 1, 1, NULL, 1, '08:00:00', '10:00:00', 'ON-CAMPUS', '2021-05-17', 1);
INSERT INTO public.session(
	sessionid, fk_programid, fk_teacherid, fk_examid, fk_roomid, starttime, endtime, sessiontype, sdate, fk_courseid)
	VALUES (2, 1, 1, NULL, 1, '12:00:00', '14:00:00', 'ON-CAMPUS', '2021-05-21',1);

INSERT INTO public.session(
	sessionid, fk_programid, fk_teacherid, fk_examid, fk_roomid, starttime, endtime, sessiontype, sdate, fk_courseid)
	VALUES (3, 2, 2, NULL, 2, '12:00:00', '14:00:00', 'ON-CAMPUS', '2021-05-21',3);

INSERT INTO public.session(
	sessionid, fk_programid, fk_teacherid, fk_examid, fk_roomid, starttime, endtime, sessiontype, sdate, fk_courseid)
	VALUES (4, 3, 3, NULL, 2, '10:00:00', '14:00:00', 'ON-CAMPUS', '2021-05-20',3);

INSERT INTO public.session(
	sessionid, fk_programid, fk_teacherid, fk_examid, fk_roomid, starttime, endtime, sessiontype, sdate, fk_courseid)
	VALUES (5, 1, 1, 1, 2, '10:00:00', '13:00:00', 'EXAM', '2021-06-20',3);
INSERT INTO public.session(
	sessionid, fk_programid, fk_teacherid, fk_examid, fk_roomid, starttime, endtime, sessiontype, sdate, fk_courseid)
	VALUES (6, 3, 3, 2, 3, '10:00:00', '12:00:00', 'EXAM', '2021-06-22',2);

-- INSERTING DATA INTO ATTENDANCE TABLE
INSERT INTO public.attendance(
	attendanceid, fk_studentid, fk_sessionid, fk_courseid, status)
	VALUES (1, 1, 1, 1, 'PRESENT');
INSERT INTO public.attendance(
	attendanceid, fk_studentid, fk_sessionid, fk_courseid, status)
	VALUES (2, 2, 1, 1, 'PRESENT');
INSERT INTO public.attendance(
	attendanceid, fk_studentid, fk_sessionid, fk_courseid, status)
	VALUES (3, 3, 3, 3, 'PRESENT');
INSERT INTO public.attendance(
	attendanceid, fk_studentid, fk_sessionid, fk_courseid, status)
	VALUES (4, 4, 3, 3, 'PRESENT');
select * from attendance;

-- INSERTING DATA INTO RESULTS
INSERT INTO public.results(
	fk_examid, fk_studentid, fk_programid, fk_courseid, grade, marks)
	VALUES (1, 1, 1, 1, 'A', 90);
INSERT INTO public.results(
	fk_examid, fk_studentid, fk_programid, fk_courseid, grade, marks)
	VALUES (1, 2, 1, 1, 'B', 80);
INSERT INTO public.results(
	fk_examid, fk_studentid, fk_programid, fk_courseid, grade, marks)
	VALUES (2, 5, 3, 2, 'C', 70);
INSERT INTO public.results(
	fk_examid, fk_studentid, fk_programid, fk_courseid, grade, marks)
	VALUES (2, 6, 3, 2, 'S', 95);
	
INSERT INTO public.users(
	email, username, upassword, userrole)
	VALUES ('user1@gmail.com', 'user1', 'asdf@123', 'ADMIN');
INSERT INTO public.users(
	email, username, upassword, userrole)
	VALUES ('user2@gmail.com', 'user2', 'ewr@4253', 'ADMIN');


