CREATE DATABASE IF NOT EXISTS `UniversityDB`;

USE `UniversityDB`;

DROP TABLE IF EXISTS `Courses`;

CREATE TABLE `Courses` (
    `course_id` int NOT NULL,
    `course_name` varchar(100) DEFAULT NULL,
    `credits` int DEFAULT NULL,
    PRIMARY KEY (`course_id`)
);

INSERT INTO
    `Courses`
VALUES
    (10001, 'Math', 5),
    (10002, 'Physics', 3),
    (10003, 'PhotoShop', 3),
    (10004, 'Database', 5),
    (10005, 'Network', 7),
    (10006, 'DataStructure', 4);

DROP TABLE IF EXISTS `Enrollments`;

CREATE TABLE `Enrollments` (
    `enrollment_id` int NOT NULL,
    `student_id` int DEFAULT NULL,
    `course_id` int DEFAULT NULL,
    `enrollment_date` date DEFAULT NULL,
    PRIMARY KEY (`enrollment_id`),
    KEY `Enrollments_Courses_FK` (`course_id`),
    KEY `Enrollments_Students_FK` (`student_id`),
    CONSTRAINT `Enrollments_Courses_FK` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`),
    CONSTRAINT `Enrollments_Students_FK` FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`)
);

INSERT INTO
    `Enrollments`
VALUES
    (30001, 51000, 10002, '2024-01-02'),
    (30002, 51003, 10004, '2024-01-02'),
    (30003, 51004, 10001, '2024-01-03'),
    (30004, 51002, 10005, '2024-01-04'),
    (30005, 51001, 10003, '2024-01-05'),
    (30006, 51000, 10003, '2024-01-04'),
    (30007, 51003, 10001, '2024-01-05'),
    (30008, 51002, 10001, '2024-01-05'),
    (30009, 51005, 10002, '2024-01-05');

DROP TABLE IF EXISTS `Students`;

CREATE TABLE `Students` (
    `student_id` int NOT NULL,
    `first_name` varchar(50) DEFAULT NULL,
    `last_name` varchar(50) DEFAULT NULL,
    `date_of_birth` date DEFAULT NULL,
    `email` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`student_id`)
);

INSERT INTO
    `Students`
VALUES
    (
        51000,
        'MARIA',
        'PINA',
        '1991-07-07',
        'pn123@gmail.com'
    ),
    (
        51001,
        'JOHNSON',
        'WOODS',
        '1995-12-05',
        'af3dew@gmail.com'
    ),
    (
        51002,
        'KESHA',
        'LIMBA',
        '1992-03-14',
        'klm321d@hotmail.com'
    ),
    (
        51003,
        'FENDY',
        'WILLS',
        '1993-05-12',
        'cdsui3j3@live.com'
    ),
    (
        51004,
        'HANNA',
        'KIM',
        '1994-09-25',
        'pdoiqwjjv78893@yahoo.com'
    ),
    (
        51005,
        'DING',
        'KAWAKI',
        '1994-10-13',
        'asdwef123@outlook.com'
    ),
    (
        51006,
        'VINCENT',
        'WOOD',
        '1992-02-17',
        'dasdfdew@gmail.com'
    );

/*
 4a
 */
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name
FROM
    Students s,
    Courses c,
    Enrollments e
WHERE
    s.student_id = e.student_id
    AND c.course_id = e.course_id;

/*
 4b
 */
SELECT
    c.course_name,
    COUNT(c.course_name)
FROM
    Students s,
    Courses c,
    Enrollments e
WHERE
    c.course_id = e.course_id
    AND s.student_id = e.student_id
GROUP BY
    c.course_name;

/*
 4c
 */
SELECT
    c.course_name
from
    Courses c
WHERE
    c.course_id not in (
        SELECT
            c2.course_id
        FROM
            Courses c2,
            Enrollments e2
        WHERE
            c2.course_id = e2.course_id
    );

/*
 4d
 */
UPDATE
    UniversityDB.Courses
SET
    credits = 7
WHERE
    course_id = 10001;

/*
 4e
 */
DELETE FROM
    UniversityDB.Enrollments
WHERE
    student_id = 51000;

/*
 4f
 */
SELECT
    s.student_id
from
    Students s
WHERE
    s.student_id not in (
        SELECT
            s2.student_id
        FROM
            Students s2,
            Enrollments e2
        WHERE
            s2.student_id = e2.student_id
    );