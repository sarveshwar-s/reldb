create table student(
	studentId integer not null primary key,
	fk_programId integer not null,
	fk_intakeId integer not null,
	personalEmail varchar(255) not null,
	phoneNumber varchar(15) not null,
	address varchar(500) not null,
	city varchar(50) not null,
	country varchar(50) not null,
	birthdate date not null,
	yearsOfExperience integer not null,
	status varchar(255) not null
);

create table student_payment(
	paymentId integer not null primary key,
	fk_studentId integer not null,
	paymentDate date not null,
	amount numeric not null,
	paymentType varchar(100) not null,
	status varchar(50) not null,
	paidSemester integer not null
);



-- Creating the intake table
create table intake(
	intakeid integer not null primary key,
	intakeYear integer not null,
	intakeSession varchar not null
);

-- Creating teacher table
create table teacher(
	teacherId integer not null primary key,
	teacherName varchar(200) not null,
	personalEmail varchar(255) not null,
	address varchar(500) not null,
	city varchar(100) not null,
	country varchar(100) not null,
	diploma varchar(255) not null,
	salaryPerSession numeric not null,
	domainOfExpertise varchar(255) not null,
	hoursPerWeek numeric not null,
	teacherType varchar(50) not null
);

-- DROP TABLE teacher CASCADE;
-- select * from teacher;

-- creating a bank details table for teachers
create table bankdetails(
	bankIndex integer not null primary key,
	bankName varchar(300) not null,
	iban varchar(255) not null,
	bic varchar(100) not null,
	bankBranch varchar(255) not null,
	fk_teacherId integer not null
);

-- Creating a teacher login when they are referenced
create table teacher_login(
	referenceId integer not null primary key,
	fk_teacherId integer not null unique,
	email varchar(255) not null unique,
	tpassword varchar(255) not null
);

-- creating programs table (AIS,DSA,ISM,..)
create table programs(
	programId integer not null primary key,
	programName varchar(500) not null,
	duration numeric not null,
	description varchar(1000) not null,
	programFees numeric not null,
	total_credits numeric not null,
	numberOfIntakes numeric not null,
	numberOfSemesters numeric not null,
	semesterDuration numeric not null,
	programLanguage varchar(100) not null
);

-- creating the courses table(Realational db, java, python,..etc)
create table course(
	courseId integer not null primary key,
	courseName varchar(255) not null,
	courseDuration numeric not null,
	courseDescription varchar(1000) not null,
	courseCredits numeric not null,
	fk_teacherId integer not null
);

-- Intermediate table linking programs and its courses along with their intakes
create table program_course(
	fk_courseId integer not null,
	fk_programId integer not null,
	fk_intakeId integer not null
);

-- CREATING SESSION TABLE
create table session(
	sessionId integer not null primary key,
	fk_programId integer not null,
	fk_teacherId integer not null,
	fk_examId integer,
	fk_roomId integer not null,
	starttime time not null,
	endtime time not null,
	sessionType varchar(255) not null,
	sdate date NOT NULL,
	fk_courseid integer
);

-- ALTER TABLE session
-- DROP CONSTRAINT fk_programid;
-- alter table session add column fk_courseId integer;

-- ALTER TABLE session ALTER COLUMN fk_examId DROP NOT NULL;
-- alter table session alter column fk_examId type integer;
create table attendance(
	attendanceId integer not null primary key,
	fk_studentId integer not null,
	fk_sessionId integer not null,
	fk_courseId integer not null,
	status varchar(255) not null
);

create table exam(
	examId integer not null primary key,
	examName varchar(500) not null,
	examDuration integer not null,
	fk_courseId integer not null,
	fk_programId integer not null,
	examType varchar(255) not null,
	examWeightage numeric not null
);

create table room(
	roomId integer not null primary key,
	roomName varchar(255) not null,
	capacity integer not null,
	status varchar(100) not null
);

create table results(
	fk_examId integer not null,
	fk_studentId integer not null,
	fk_programId integer not null,
	fk_courseId integer not null,
	grade varchar(10) not null,
    marks integer not null
);

create table users(
	email varchar(255) not null primary key,
	userName varchar(255) not null,
	upassword varchar(255) not null,
	userRole varchar(255) not null
);

-- -- -- -- -- STUDENT_PAYMENT TABLE FOREIGN KEYS -- -- -- -- -- 
-- CONNECTING STUDENT TABLE WITH STUDENT_PAYMENT TABLE (FOREIGN KEY)
alter table student_payment add constraint fk_studId foreign key(fk_studentId) references student(studentId);

-- -- -- -- -- STUDENT TABLE FOREIGN KEYS -- -- -- -- -- -- -- -- -- 
-- STUDENT--INTAKE
-- Defining foreign key intakeId in student table
alter table student add constraint fk_intakeid foreign key (fk_intakeId) references intake(intakeId);

-- STUDENT--COURSES
-- Defining foreign key programId in student table
alter table student add constraint fk_programid foreign key (fk_programid) references programs(programId);

-- -- -- -- -- BANK DETAILS FOREIGN KEYS -- -- -- -- -- -- -- -- -- 
-- Foreign key in bankdetails for connecting teacher with their bank
alter table bankdetails add constraint fk_teacherId foreign key(fk_teacherId) references teacher(teacherId);

-- -- -- -- -- COURSE SUB FOREIGN KEYS -- -- -- -- -- -- -- -- -- 
-- Linking the intermediate table with course based on courseId
alter table program_course add constraint fk_courseid foreign key(fk_courseId) references course(courseId);

-- Linking the intermediate table with program based on programId
alter table program_course add constraint fk_programid foreign key(fk_programId) references programs(programId);

-- Linking the intermediate table with intake based on intakeId
alter table program_course add constraint fk_intakeid foreign key(fk_intakeId) references intake(intakeId);

-- -- -- -- -- TEACHER_LOGIN FOREIGN KEYS -- -- -- -- -- -- 
-- TEACHER_LOGIN -- TEACHER 
alter table teacher_login add constraint fk_teacherid foreign key (fk_teacherId) references teacher(teacherId);

-- -- -- -- -- COURSE TABLE FOREIGN KEYS -- -- -- -- -- -- 
alter table course add constraint fk_courseteacherid foreign key (fk_teacherId) references teacher(teacherId);

-- -- -- -- -- SESSION FOREIGN KEYS -- -- -- -- -- -- 
-- SESSION - PROGRAMS session will have students from one or more programs 
alter table session add constraint fk_programid foreign key (fk_programId) references programs(programId);
-- SESSION - COURSES session will be associated with courses
alter table session add constraint fk_courseid foreign key (fk_courseId) references course(courseId);
-- SESSION - TEACHER session will have one teacher at a time 
alter table session add constraint fk_teacherid foreign key (fk_teacherId) references teacher(teacherId);
-- SESSION - EXAM if the session is an exam it will have an exam id
alter table session add constraint fk_examid foreign key (fk_examId) references exam(examId);
-- SESSION - ROOM each session will be scheduled in a room 
alter table session add constraint fk_roomid foreign key (fk_roomId) references room(roomId);

-- -- -- -- -- ATTENDANCE FOREIGN KEYS -- -- -- -- -- -- 
-- ATTENDANCE - STUDENT -- -- -- -- -- --
alter table attendance add constraint fk_studentid foreign key (fk_studentId) references student(studentId);
-- ATTTENDANCE - SESSION -- attendance is recorded for each session. 
alter table attendance add constraint fk_sessionid foreign key (fk_sessionId) references session(sessionId);
alter table attendance add constraint fk_courseid foreign key (fk_courseId) references course(courseId);

-- -- -- -- -- EXAM FOREIGN KEYS -- -- -- -- -- -- 
-- EXAM - COURSE. the exams are related to the courses.
alter table exam add constraint fk_courseid foreign key (fk_courseId) references course(courseId);
-- EXAM - PROGRAM. 
alter table exam add constraint fk_programid foreign key (fk_programId) references programs(programId);

-- -- -- -- RESULT FOREIGN KEYS -- -- -- -- -- --
-- RESULT - STUDENT. each result is associated with a student id
alter table results add constraint fk_studentid foreign key (fk_studentId) references student(studentId);
-- RESULT - PROGRAM each result is associated with program
alter table results add constraint fk_programid foreign key (fk_programId) references programs(programId);
-- RESULT - COURSE.
alter table results add constraint fk_courseid foreign key (fk_courseId) references course(courseId);

