CREATE DATABASE IF NOT EXISTS `JacDBMid`;

USE `JacDBMid`;

DROP TABLE IF EXISTS `Departments`;

CREATE TABLE `Departments` (
    `department_id` int NOT NULL,
    `department_name` varchar(255) DEFAULT NULL,
    `location` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`department_id`)
);

INSERT INTO
    `Departments`
VALUES
    (1001, 'Market', 'New York'),
    (1002, 'Engineering', 'New York'),
    (1003, 'Finance', 'Montreal'),
    (1004, 'OP', 'Toronto');

CREATE TABLE `Employees` (
    `employee_id` int NOT NULL,
    `employee_name` varchar(255) DEFAULT NULL,
    `position` varchar(255) DEFAULT NULL,
    `salary` int DEFAULT NULL,
    `Joining_Date` date DEFAULT NULL,
    `department_id` int DEFAULT NULL,
    `birthdayyear` year DEFAULT NULL,
    PRIMARY KEY (`employee_id`),
    CONSTRAINT `Employees_Departments_department_id` FOREIGN KEY (`department_id`) REFERENCES `Departments` (`department_id`)
);

INSERT INTO
    JacDBMid.Employees (
        employee_id,
        employee_name,
        `position`,
        salary,
        Joining_Date,
        department_id,
        birthdayyear
    )
VALUES
    (
        2001001,
        'SAM',
        'Developers',
        65000,
        '2021-05-31',
        1002,
        1980
    ),
    (
        2001002,
        'Smith',
        'Developers',
        55000,
        '2022-07-30',
        1002,
        1992
    ),
    (
        2001003,
        'Jane',
        'Sales',
        56500,
        '2022-08-31',
        1001,
        1995
    ),
    (
        2001004,
        'Wendy',
        'Manager',
        61000,
        '2021-11-08',
        1004,
        1992
    ),
    (
        2001005,
        'Frank',
        'Accountant',
        62500,
        '2022-06-25',
        1003,
        1983
    ),
    (
        2001006,
        'Tom',
        'Manager',
        71000,
        '2023-01-01',
        1002,
        1978
    ),
    (
        2001007,
        'Lisa',
        'PD',
        75000,
        '2023-02-13',
        1001,
        1987
    ),
    (
        2001008,
        'Rain',
        'Operation',
        59000,
        '2023-03-14',
        1004,
        1999
    );

/*  Q1  */
ALTER TABLE
    `JacDBMid`.`Employees`
ADD
    COLUMN `Joining_Date` DATE NULL
AFTER
    `department_id`;

/*  Q2  */
SELECT
    `Employees`.`employee_name`
FROM
    `JacDBMid`.`Employees`
WHERE
    `Employees`.`position` = 'Manager';

/*  Q3  */
SELECT
    `Departments`.`department_name`,
    `Departments`.`location`
FROM
    `JacDBMid`.`Departments`;

/*  Q4  */
SELECT
    `Employees`.`employee_name`
FROM
    `JacDBMid`.`Employees`
WHERE
    `Employees`.`salary` > 60000;

/*  Q5  */
SELECT
    `Departments`.`department_name`,
    `Departments`.`location`
FROM
    `JacDBMid`.`Departments`
WHERE
    `Departments`.`location` <> 'New York';

/*  Q6  */
SELECT
    `Employees`.`employee_name`
FROM
    `JacDBMid`.`Employees`,
    `JacDBMid`.`Departments`
WHERE
    `Employees`.`department_id` = `Departments`.`department_id`
    AND `Departments`.`department_name` = 'IT';

/*  Q7  */
SELECT
    `Employees`.`employee_name`
FROM
    `JacDBMid`.`Employees`
WHERE
    `Employees`.`position` = 'Manager'
    OR `Employees`.`position` = 'Developers';

/*  Q8  */
SELECT
    `Employees`.`employee_name`,
    `Employees`.`salary`
FROM
    `JacDBMid`.`Employees`,
    `JacDBMid`.`Departments`
WHERE
    `Employees`.`department_id` = `Departments`.`department_id`
    AND `Departments`.`department_name` <> 'Finance';

/*  Q9  */
SELECT
    `Departments`.`department_name`,
    COUNT(`Departments`.`department_id`)
FROM
    `JacDBMid`.`Employees`,
    `JacDBMid`.`Departments`
WHERE
    `Employees`.`department_id` = `Departments`.`department_id`
GROUP BY
    `Employees`.`department_id`;

/*  Q10  */
SELECT
    *
FROM
    `JacDBMid`.`Employees`
WHERE
    `Employees`.`salary` = (
        SELECT
            MAX(`Employees`.`salary`)
        FROM
            `JacDBMid`.`Employees`
    );

/*  Q11  */
SELECT
    AVG(`Employees`.`salary`)
FROM
    `JacDBMid`.`Employees`;

/*  Q12  */
SELECT
    *
FROM
    `JacDBMid`.`Departments`
WHERE
    `Departments`.`department_name` LIKE 'M%';

/*  Q13  */
SELECT
    `Employees`.`employee_name`,
    `Employees`.`position`
FROM
    `JacDBMid`.`Employees`
WHERE
    `Employees`.`salary` BETWEEN 55000
    AND 65000;

/*  Q14  */
SELECT
    `Employees`.`employee_name`,
    `Employees`.`position`
FROM
    `JacDBMid`.`Employees`
WHERE
    `Employees`.`Joining_Date` < '2022-01-01';

/*  Q15  */
SELECT
    `Departments`.`department_name`,
    `Departments`.`location`
FROM
    `JacDBMid`.`Departments`
WHERE
    (
        SELECT
            COUNT(*)
        FROM
            `JacDBMid`.`Employees`
        WHERE
            `Employees`.`department_id` = `Departments`.`department_id`
    ) > 2;

/*  Q16  */
SELECT
    `Employees`.`employee_name`
FROM
    `JacDBMid`.`Employees`
WHERE
    `Employees`.`position` <> 'Developers';

/*  Q17  */
SELECT
    `Employees`.`employee_name`,
    `Employees`.`salary`
FROM
    `JacDBMid`.`Employees`
ORDER BY
    `Employees`.`salary` DESC
LIMIT
    2 OFFSET 1;

/*  Q18  */
SELECT
    `Departments`.`department_name`,
    `Departments`.`location`
FROM
    `JacDBMid`.`Departments`
WHERE
    `Departments`.`department_name` LIKE '%Marketing%';

/*  Q19  */
SELECT
    `Employees`.`employee_name`,
    `Employees`.`position`
FROM
    `JacDBMid`.`Employees`
WHERE
    `Employees`.`birthdayyear` < '1994-01-01';

/*  Q20  */
SELECT
    COUNT(`Employees`.`employee_id`)
FROM
    `JacDBMid`.`Employees`