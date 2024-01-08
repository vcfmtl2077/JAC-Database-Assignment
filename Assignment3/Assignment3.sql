CREATE DATABASE IF NOT EXISTS `Assignment3`;

USE `Assignment3`;

CREATE TABLE `Courses` (
    `course_id` int NOT NULL,
    `course_name` varchar(45) DEFAULT NULL,
    `instructor` varchar(45) DEFAULT NULL,
    `credits` int DEFAULT NULL,
    PRIMARY KEY (`course_id`)
);

CREATE TABLE `Students` (
    `student_id` int NOT NULL,
    `student_name` varchar(45) DEFAULT NULL,
    `major` varchar(45) DEFAULT NULL,
    `age` int DEFAULT NULL,
    PRIMARY KEY (`student_id`)
);

INSERT INTO
    Assignment3.Students (student_id, student_name, major, age, avg_grade)
VALUES
    (1, 'Alice', 'Biology', 20, NULL),
    (2, 'Bob', 'History', 22, NULL),
    (3, 'Carol', 'Math', 21, NULL),
    (4, 'David', 'Physics', 23, NULL);

INSERT INTO
    Assignment3.Courses (course_id, course_name, instructor, credits)
VALUES
    (101, 'Biology 101', 'Dr. Smith', 4),
    (102, 'History 101', 'Prof. Johnson', 3),
    (103, 'Math 101', 'Prof. Brown', 3),
    (104, 'Physics 101', 'Dr. White', 4);

/* 0 */
ALTER TABLE
    `Assignment3`.`Students`
ADD
    COLUMN `avg_grade` INT NULL
AFTER
    `age`;

/* 1 */
SELECT
    `Students`.`student_name`
FROM
    `Assignment3`.`Students`
WHERE
    `Students`.`major` = 'Biology';

/* 2 */
SELECT
    `Courses`.`course_name`,
    `Courses`.`instructor`
FROM
    `Assignment3`.`Courses`
WHERE
    `Courses`.`credits` > 3;

/* 3 */
SELECT
    `Students`.`student_name`
FROM
    `Assignment3`.`Students`
WHERE
    `Students`.`age` > 21.5;

/* 4 */
SELECT
    `Courses`.`course_name`,
    `Courses`.`instructor`
FROM
    `Assignment3`.`Courses`
WHERE
    `Courses`.`credits` < 4;

/* 5 */
SELECT
    *
FROM
    `Assignment3`.`Courses`
WHERE
    `Courses`.`instructor` = 'Dr. Smith';

/* 6 */
SELECT
    `Students`.`student_name`
FROM
    `Assignment3`.`Students`
WHERE
    `Students`.`major` = 'Biology'
    OR `Students`.`major` = 'History';

/* 7 */
SELECT
    `Students`.`student_name`,
    `Students`.`age`
FROM
    `Assignment3`.`Students`
WHERE
    `Students`.`major` <> 'Math';

/* 8 */
SELECT
    `Courses`.`course_name`,
    `Courses`.`credits`
FROM
    `Assignment3`.`Courses`;

/* 9 */
SELECT
    *
FROM
    `Assignment3`.`Students`
WHERE
    `Students`.`age` = (
        SELECT
            MIN(`Students`.`age`)
        FROM
            `Assignment3`.`Students`
    );