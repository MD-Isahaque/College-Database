# College Management System
 create database collegemangsys;
 use collegemangsys;
 
# Course
create table course (Course_ID int primary key, Course_Name varchar(20) not null unique);
describe course;

insert into course values (1, "FSD"),(2, "DS&DA"),(3,"DSE");
select * from course;

# Instructor
create table instructor (Ins_ID int primary key, Fullname varchar(25) not null, Gender varchar(2) not null, age int, mob bigint unique, email_id varchar(20) unique);

# Instructor
insert into instructor values (101, "Satvika Thakkar", "F", 29, 76475758585, "satvika@itvdeant.com"),
(102, "Jessica Dias", "F", 33, 76475758545, "jessica@itvdeant.com"),
(103, "Priya Jadhav", "F", 32, 76475758567, "priya@itvdeant.com"),
(104, "Monish Khan", "M", 28, 76475758895, "monish@itvdeant.com");
select * from instructor;

# Student
create table student (SID int primary key, Full_name varchar(15)  not null, Gender varchar(2) not null, age int, mob bigint unique,
email_id varchar(20) unique, Course_ID int, foreign key (Course_ID) references course (Course_ID));

insert into student values (1011, 'Rahul Bisht', "M", 23, 76456365905,"rahul@gmail.com",1),
(1012, 'Veronica Dias', "F", 20, 76456368905, "veronica@gmail.com",3),
(1013, 'Riya Sharma', "F", 29, 76456366905, "riya@gmail.com",1),
(1014, 'Deepak Shah', "M", 25, 76456395905, "deepak@gmail.com",2),
(1015, 'Payal Kapadia', "F", 30, 76256365905,"payal@gmail.com",3);
select * from student;

# Subject
create table Modules (MOD_ID int primary key, MOD_NAME set ("MYSQL","PYTHON","DJANGO","POWER BI","ML","ADVANCE EXCEL","AWP"), Course_ID int,
foreign key (Course_ID) references course(Course_ID));

insert into Modules values (2001, "MYSQL,PYTHON,DJANGO", 1),
(2002, "PYTHON,POWER BI,ADVANCE EXCEL",2),
(2003, "MYSQL,AWP,ML",3);
select * from Modules;

create table transactions (TID int primary key, Amount dec(7,2), SID int, Foreign key (SID) references student(SID));

insert into transactions values (201, 4500,1014), (2022, 55000,1011), (2023, 65000, 1012),(2024,10000, 1013);
select * from transactions;

# Batch
create table batch (BID int primary key, Course_ID int, Instructor_ID int,SID int, Batch_Start_Date date, 
foreign key (Course_ID) references course(Course_ID),
foreign key (Instructor_ID) references instructor (Ins_ID),
foreign key (SID) references student (SID));
describe batch;

insert into batch values (1, 2, 102, 1012, '2023-12-18'),
(2, 1, 101,1011,'2023-12-19'),
(3,3,103,1013, '2023-12-20'),
(4,1, 104, 1014,'2023-12-19'), 
(5, 2, 102, 1015,'2023-12-18');

select * from batch;