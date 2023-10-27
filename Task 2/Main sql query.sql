CREATE TABLE student_table(
    Student_id SERIAL PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    email_id VARCHAR ( 255 ) NOT NULL,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_Birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT
);

INSERT INTO student_table(Student_id,Stu_name,Department,email_id,Phone_no,Address,Date_of_Birth,Gender,Major,GPA,Grade)
VALUES
    (1,'Priya','Computer Science','priya@gmail.com',815921,'12 Clarkson','1996-01-13','Female','Computer Science',9.5,'A'),
(2,'Mani','Arts','Mani@gmail.com',815922,'1 Hamster Road','1996-02-03','Male','Arts',7.5,'B'),
(3,'Senthil','Acountancy','senthil@gmail.com',815931,'1 Winston Rioad','1996-11-19','Male','Commerce',8.0,'B'),
(4,'Rema','Congnitive Science','rema@gmail.com',815951,'12 Newwest lane','1996-07-04','Female','Congnitive Science',6.9,'C'),
(5,'Sravan','Philisophy','sravan@gmail.com',815101,'321 5th street Clarkson','1996-08-19','Male','Philisophy',4.1,'D'),
(6,'Mary','Computer Science','mary@gmail.com',816921,'06176 Godrej Aqua','1996-10-26','Female','Computer Science',4.1,'D'),
(7,'Klin','Mathematics','klin@gmail.com',818029,'B614 Purva Zenium','1996-11-22','Male','Mathematics',6.9,'B'),
(8,'Maya','Computer Science','maya@gmail.com',811101,'A616 Sycon cresida','1996-12-19','Female','Computer Science',6.5,'C'),
(9,'Kevin','Mathematics','kevin@gmail.com',818029,'A305 DS max Synergy','1997-11-01','Male','Mathematics',8.9,'A'),
(10,'Nyya','Computer Science','nyya@gmail.com',811101,'E401 Victoria Haven','1996-12-12','Female','Computer Science',7.5,'B');


select *
from student_table
ORDER BY Grade DESC;

Select *
from student_table
where Gender = 'Male';

select *
from student_table
where GPA < 5.0;

UPDATE student_table
set email_id = ' priya123@gmail.com', Grade = 'B'
where Student_id = 1;
select * from student_table;


select Stu_name,DATEDIFF(YEAR,Date_of_Birth, GETDATE()) AS age
from student_table
where Grade = 'B';

Select Department,Gender,avg(GPA) as Avg_GPA
from student_table
group by Department,Gender;

ALTER TABLE student_table RENAME TO student_info;
select * from student_info;

select Stu_name
from student_info
order by GPA DESC
LIMIT 1;