CREATE TABLE Studentinfo
(
STU_ID int PRIMARY KEY,
STU_NAME varchar(50),
DOB date,
PHONE_NO varchar(15),
EMAIL_ID varchar(100),
ADDRESS varchar(255));

#CreateCourseinfotable
    
CREATE TABLE Coursesinfo
(
COURSE_ID int PRIMARY KEY,
COURSE_NAME varchar(100),
COURSE_INSTRUCTORNAME varchar(50));

CREATE TABLE Enrollmentinfo
(
ENROLLMENT_ID int PRIMARY key ,
STU_ID int,
COURSE_ID int,
ENROLL_STATUS Varchar(15),
FOREIGN KEY(STU_ID) REFERENCES Studentinfo(STU_ID),
FOREIGN KEY(COURSE_ID) REFERENCES Coursesinfo(COURSE_ID)
);

insert into Studentinfo(STU_ID,STU_NAME,DOB,PHONE_NO,EMAIL_ID,ADDRESS)
VALUES
(1,'Priya','20-jan-2001',812955,'priya@gmail.com','ul. Filtrowa 68'),
(2,'Mani','13-Feb-2001',918281,'mani@gmail.com','Keskuskatu 45'),
(3,'Sree','30-Mar-2002',819289,'sree@gmail.com','Keskuskatu 50'),
(4,'Damien','13-Jun-2001',123456,'damien@gmail.com','Filtrowa 45'),
(5,'Sathya','3-Oct-2002',123489,'sathya@gmail.com','Skagen  50'),
(6,'Sanjay','26-Oct-2001',127889,'sanjay@gmail.com','Gateveien 15'),
(7,'Barani','30-DEc-2002',819010,'barani@gmail.com','Streetroad 50');

insert into Coursesinfo(COURSE_ID,COURSE_NAME,COURSE_INSTRUCTORNAME) 
VALUES
(101,'Math 101','Prof Jane'),
(102,'Social Studies','Prof Divya'),
(103,'English','Prof Karl'),
(105,'Arts','Prof Daya'),
(104,'Physics','Prof Gauri');

insert into Enrollmentinfo(ENROLLMENT_ID,STU_ID,COURSE_ID,ENROLL_STATUS)
VALUES
(1,1,101, 'Enrolled'),
(2,1,102, 'Enrolled'),
(3,2,101, 'Enrolled'),
(4,3,103, 'Enrolled'),
(5,3,102, 'Enrolled'),
(6,4,105, 'Enrolled'),
(7,4,104, 'Not Enrolled'),
(8,5,101, 'Not Enrolled'),
(9,5,102, 'Enrolled'),
(10,6,105, 'Enrolled'),
(11,5,101, 'Enrolled'),
(12,1,104, 'Not Enrolled'),
(13,2,103, 'Enrolled');

select Distinct SI.STU_NAME,SI.PHONE_NO,SI.EMAIL_ID,SI.ADDRESS,EI.ENROLL_STATUS
from Studentinfo SI join Enrollmentinfo EI
on SI.STU_ID = EI.STU_ID;

select CI.COURSE_NAME,CI.COURSE_INSTRUCTORNAME
FROM Coursesinfo CI
join Enrollmentinfo EI on CI.COURSE_ID = EI.COURSE_ID
where EI.STU_ID = 1;

select Distinct CI.COURSE_NAME,CI.COURSE_INSTRUCTORNAME
FROM Coursesinfo CI
join Enrollmentinfo EI on CI.COURSE_ID = EI.COURSE_ID
ORDER BY COURSE_NAME;

select CI.COURSE_NAME,CI.COURSE_INSTRUCTORNAME
FROM Coursesinfo CI
WHERE CI.COURSE_ID = 101;

select CI.COURSE_NAME,CI.COURSE_INSTRUCTORNAME
FROM Coursesinfo CI
WHERE CI.COURSE_ID IN (105,103);

select SI.STU_NAME
from Studentinfo SI
join Enrollmentinfo EI on SI.STU_ID = EI.STU_ID
join Coursesinfo CI on EI.COURSE_ID = CI.COURSE_ID
where CI.COURSE_NAME = 'Math 101';

select EI.STU_ID
from Enrollmentinfo EI
group by EI.STU_ID
having COUNT(Distinct EI.COURSE_ID) > 1;

select CI.COURSE_NAME,count(EI.STU_ID) as enrolled_student_count
from Coursesinfo CI
left join Enrollmentinfo EI on CI.COURSE_ID = EI.COURSE_ID
GROUP by CI.COURSE_NAME
Order By enrolled_student_count DESC;

select CI.COURSE_NAME,count(EI.STU_ID) as enrolled_student_count
from Coursesinfo CI
left join Enrollmentinfo EI on CI.COURSE_ID = EI.COURSE_ID
GROUP by CI.COURSE_NAME;

select CI.COURSE_INSTRUCTORNAME,count(EI.STU_ID) as enrolled_student_count
from Coursesinfo CI
left join Enrollmentinfo EI on CI.COURSE_ID = EI.COURSE_ID
GROUP by CI.COURSE_INSTRUCTORNAME;




