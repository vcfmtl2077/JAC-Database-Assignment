CREATE DATABASE UniversityDB;

USE UniversityDB;

CREATE TABLE Students(
    StudentID int,
    FirstName varchar(255),
    LastName varchar(255),
    DateOfBirth date
);

CREATE TABLE Courses(
    CourseID int NOT NULL,
    CourseName varchar(255),
    Department varchar(255),
    Credit int,
    PRIMARY KEY(CourseID)
);

CREATE TABLE Enrollments(
    EnrollmentID int,
    EnrollmentName varchar(255),
    EnrollmentNumber int
);

CREATE TABLE Professors(
    ProfessorID int,
    FirstName varchar(255),
    LastName varchar(255),
    Department varchar(255)
);

CREATE TABLE Books(
    BookID int,
    Title varchar(255),
    Author varchar(255),
    PublicationYear int
);

CREATE TABLE Employees(
    EmployeeID int,
    FirstName varchar(255),
    LastName varchar(255),
    Position varchar(255)
);

CREATE TABLE Products(
    ProductID int,
    ß ProductName varchar(255),
    Category varchar(255),
    Price decimal
);

INSERT INTO
    `Books`
VALUES
    (1000, 'Fourth Wing', 'Rebecca Yarros', 2023),
    (
        1001,
        'Lessons in Chemistry',
        'Bonnie Garmus',
        2022
    ),
    (
        1002,
        'The Silent Patient',
        'Alex Michaelides',
        2021
    ),
    (
        1003,
        'The 48 Laws of Power',
        'Robert Greene and Joost Elffers',
        2000
    ),
    (1004, 'The Lost Bookshop', 'Evie Woods', 2023);

INSERT INTO
    `Courses`
VALUES
    (10001, 'Math', 'JAC-CE', 5),
    (10002, 'Physics', 'JAC-GE', 3),
    (10003, 'PhotoShop', 'JAC-PE', 3),
    (10004, 'Database', 'JAC-CE', 5),
    (10005, 'Network', 'JAC-GE', 7);

INSERT INTO
    `Employees`
VALUES
    (10100, 'John', 'Smith', 'SDE'),
    (10101, 'Ada', 'Wong', 'PM'),
    (10101, 'Mia', 'King', 'Designer'),
    (10105, 'Vincent', 'Wood', 'Operation'),
    (10103, 'Nathan', 'Fillion', 'SDE'),
    (10104, 'Jason', 'Alfred', 'DBA');

INSERT INTO
    `Enrollments`
VALUES
    (10010, '2023SUMMER', 100),
    (10011, '2023FALL', 120),
    (10012, '2023WINTER', 90),
    (10014, '2024SPRING', 90),
    (10015, '2024SUMMER', 110);

INSERT INTO
    `Professors`
VALUES
    (30001, 'James', 'Blunt', 'JAC-CE'),
    (30002, 'Amy', 'Brock', 'JAC-CE'),
    (30003, 'Tang', 'Song', 'JAC-PE'),
    (30004, 'Tangka', 'Kawaki', 'JAC-ME'),
    (30005, 'Angela', 'Anchor', 'JAC-DE');

INSERT INTO
    `Students`
VALUES
    (51000, 'MARIA', 'PINA', '1991-07-07'),
    (51001, 'JOHNSON', 'WOODS', '1995-12-05'),
    (51002, 'KESHA', 'LIMBA', '1992-03-14'),
    (51003, 'FENDY', 'WILLS', '1993-05-12'),
    (51004, 'HANNA', 'KIM', '1994-09-25');

INSERT INTO
    `Products`
VALUES
    (20010, 'DISH WASHER', 'APPLIANCE', 1000),
    (20011, 'WASHER', 'APPLIANCE', 1190),
    (20012, 'DRYER', 'APPLIANCE', 1050),
    (20013, 'MAC STUDIO', 'COMPUTER', 3000),
    (20014, 'IPAD', 'PAD', 800);