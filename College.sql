--IF EXISTS (SELECT * FROM sys.databases WHERE name = 'KeysDemoDB')
--DROP DATABASE College
--GO

create database College
go

use College
go

create table Students(
ID int identity (1,1)not null constraint Pk_students primary key clustered,
Fname varchar(25) not null,
Lname varchar(25) not null,
DOB datetime,
SSN int not null,
Address varchar(20),
City varchar(45) not null,
State varchar(45)not null,
Zip int not null,
Phone# bigint not null
);

create table Classes(
ID int identity (1,1) not null constraint Pk_Classes primary key clustered,
StudentID int not null CONSTRAINT FK_Classes_Students FOREIGN KEY (StudentID) REFERENCES dbo.Students(ID),
Title varchar(20)not null,
Number int not null,
Department varchar(20) not null
);

create table Scores(
ID int identity (1,1) not null constraint Pk_Scores primary key clustered,
ClassID int not null constraint FK_Scores_Classes foreign key (ClassID) references dbo.Classes(ID),
Type varchar(20) not  null,
Description varchar(20),
DateAssigned datetime  not null,
DateDue datetime not null,
DateSubmitted datetime,
PointsEarned int,
PointPossible int not null
);

insert into Students(Fname, Lname, DOB, SSN, Address, City, State, Zip, Phone#)
values ('Connie','Fry', '1992-09-13', 2033, '290 Main St.', 'Topeka', 'KS', 66601, 7857857855),
       ('Joe', 'Cottoneye', '1980-02-16', 4940, '2919 Poppy Rd.', 'Random Lake', 'WI',53075, 9406621212),
	   ('Sakura' ,'Oda', '1999-03-12', 1111, '100 Waratte Rd.', 'Beverly Hills', 'CA', 90213, 3105090210),
	   ('Chad', 'Fratboy', '1996-11-20', 2099, '60 W. 95th St.','New York','NY', 10025, 2127882446),
	   ('Ruth', 'Marcillo', '1942-12-23', 62109, '540A Igthus Dr.', 'Miami', 'FL', 33133, 7863554209),
	   ('Mbeke','Owusu', '1979-06-04', 9070, '12 Suna Rd.', 'Kampala', 'UG', 00026, 2562020388),
	   ('Ebony DarkNess Dementia','Raven Way', '2007-06-06', 6666, '403C Slytherin', 'London', 'UK', 53212, 6142349078)
	   
insert into Classes(StudentID, Title, Number, Department)
values (1, 'Kinetic Chemistry', 204, 'SCI'),
       (1, 'Technical Writing', 244, 'CS'),
	   (2, 'English II', 201, 'ENG'),
	   (3, 'Modern Dance II', 345, 'DNC'),
	   (3, 'Vocal Technique', 303, 'MUS'),
       (4, 'World Religion', 194, 'REL'),
	   (5, 'Human Biology', 108, 'SCI'),
	   (6, 'Senior Seminar', 405, 'UGS'),
	   (6, 'Color Theory II', 355, 'ART'),
	   (7, 'Creative Writing', 202, 'ENG')

alter table Scores
alter column Description varchar(45)

insert into Scores(ClassID, Type, Description, DateAssigned, DateDue, DateSubmitted, PointsEarned, PointPossible)
values (1, 'HW', 'Write 2 pg essay', '2017-11-11', '2017-12-01', '2017-11-30', 41, 50),
       (1, 'Lab', 'Worksheets from book', '2017-10-31', '2017-11-02', '2017-11-11', 4, 10),
	   (2, 'Exam', 'Midterm', '2017-10-05', '2017-10-05', '2017-10-05', 93, 100),
	   (2, 'HW', 'Research', '2018-01-17', '2018-01-19', '2017-01-19', 10, 10),
	   (3, 'Quiz', 'Ch 3, 4, 6', '2018-02-14', '2018-02-14', '2018-02-14', 8, 12),
	   (3, 'HW', 'Group Research Paper', '2017-04-16', '2017-05-10', '2017-05-09', 29, 30),
	   (4, 'HW', '1min Routine to song', '2018-01-14', '2018-01-30', '2018-01-30', 14, 15),
	   (5, 'Exam', 'Group Performance', '2018-01-25', '2018-03-02', '2018-03-02', 58, 60),
	   (6, 'Quiz', 'Ch 4-10', '2017-09-29', '2017-09-29', '2017-10-16', 12, 45),
	   (7, 'Lab', 'Chapter Experiment', '2018-02-15', '2018-02-25', '2018-02-20', 20, 20),
	   (8, 'Exam', 'Portfolio', '2018-03-07', '2018-05-10', '', 00, 70),
	   (9, 'Lab', 'Color pallette project', '2017-08-22', '2017-08-30', '2018-01-01', 12, 20),
	   (9, 'Quiz', 'Ch 6 terms', '2017-09-01', '2017-09-01', '2018-01-01', 7, 10),
	   (10, 'HW', 'Short Story', '2016-07-07', '2016-07-07', '2017-07-07', 0, 0)

	   select* from (Students s
	   inner join Classes c on s.ID = c.StudentID
	   inner join Scores sc on c.ID = sc.ClassID);
	   
