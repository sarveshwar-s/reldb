
-- OPERATIONS TO GET TEACHER INFORMATION ------------------------------------------------
-- selecting teachers and their associated bank details
select t.teachername,t.personalemail as Personal_contact,t.salarypersession,b.bankName,b.iban,b.bic from teacher t
inner join bankdetails b on b.fk_teacherid=t.teacherId;

-- selecting already referenced teachers
select t.teachername,tl.email as EPITA_EMAIL,t.salarypersession,b.bankName,b.iban,b.bic from teacher t
inner join bankdetails b on b.fk_teacherid=t.teacherId inner join teacher_login tl on tl.fk_teacherId = t.teacherId;

-- student report page
-- SHOWS STUDENT GRADE AND MARKS IN PARTICULAR COURSE AND THEIR ATTENDANCE FOR THE SESSION
select s.personalemail,c.coursename,c.coursecredits,r.grade,r.marks,a.fk_sessionId,a.status as Attendance from results r 
inner join student s on s.studentId=r.fk_studentId
inner join course c on r.fk_courseid = c.courseid
inner join attendance a on a.fk_studentId = s.studentId;

-- selecting classes scheduled for the day with program name,teacher and room
select r.roomName,t.teacherName,s.sdate,p.programName from session s inner join room r on s.fk_roomId = r.roomId
inner join programs p on s.fk_programId = p.programId
inner join teacher t on s.fk_teacherId=t.teacherId where s.sdate='2021-05-21' and sessiontype='ON-CAMPUS';

-- selecting students payment history and linking with student details
select student.personalEmail,student.phonenumber,spay.paymentdate,spay.amount from student_payment spay 
left join student on student.studentId = spay.fk_studentId;

-- select students payment based on intake to generate payment receipt 
select fk_studentid,student.personalEmail, intake.intakeYear, student_payment.paidSemester from student_payment 
inner join student on student.studentId = student_payment.fk_studentId 
inner join intake on student.fk_intakeId = intake.intakeId where intake.intakeYear='2021' and paidSemester=1;

-- selecting students who are candidates
select * from student where status='Candidate';

-- selecting students who are enrolled into the program
select * from student where status='Enrolled';



select * from results;
select * from course;
select * from exam;
-- select programName,grade,fk_studentId,personalEmail from results left join programs on results.fk_programId = programs.programId 
-- left join student on results.fk_studentId= student.studentId where results.fk_programId=3;
select * from student;
select * from session;

select * from teacher;

-- -- -- -- -- SELECT QUERIES FOR ALL TABlES -- -- --  -- -- -- 
select * from attendance;
select * from bankdetails;
select * from course;
select * from exam;
select * from intake;
select * from program_course;
select * from programs;
select * from results;
select * from room;
select * from session;
select * from student;
select * from teacher;
select * from teacher_login;
select * from users;
