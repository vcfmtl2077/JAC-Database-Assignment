CREATE DATABASE IF NOT EXISTS `BookstoreDB`;

USE `BookstoreDB`;

CREATE TABLE `Authors` (
    `author_id` int NOT NULL,
    `first_name` varchar(50) DEFAULT NULL,
    `last_name` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`author_id`)
);

INSERT INTO
    `Authors`
VALUES
    (1001, 'Rebecca', 'Yarros'),
    (1002, 'Bonnie', 'Garmus'),
    (1003, 'Alex', 'Michaelides'),
    (1004, 'Robert', 'Greene'),
    (1005, 'Evie', 'Woods');

CREATE TABLE `Books` (
    `book_id` int NOT NULL,
    `title` varchar(100),
    `publication_year` int,
    `author_id` int,
    PRIMARY KEY (`book_id`),
    CONSTRAINT `Book_Author_Author_FK` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`)
);

INSERT INTO
    `Books`
VALUES
    (20001, 'Fourth Wing', 2023, 1001),
    (20002, 'Lessons in Chemistry', 2022, 1002),
    (20003, 'The Silent Patient', 2021, 1003),
    (20004, 'The 48 Laws of Power', 2000, 1004),
    (20005, 'The Lost Bookshop', 2023, 1005),
    (20006, 'Iron Flame', 2023, 1001);

CREATE TABLE `Customers` (
    `customer_id` int NOT NULL,
    `first_name` varchar(50) DEFAULT NULL,
    `last_name` varchar(50) DEFAULT NULL,
    `email` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`customer_id`)
);

INSERT INTO
    `Customers`
VALUES
    (51000, 'MARIA', 'PINA', 'pn123@gmail.com'),
    (51001, 'JOHNSON', 'WOODS', 'af3dew@gmail.com'),
    (51002, 'KESHA', 'LIMBA', 'klm321d@hotmail.com'),
    (51003, 'FENDY', 'WILLS', 'cdsui3j3@live.com'),
    (
        51004,
        'HANNA',
        'KIM',
        'pdoiqwjjv78893@yahoo.com'
    ),
    (51005, 'DING', 'KAWAKI', 'asdwef123@outlook.com'),
    (51006, 'VINCENT', 'WOOD', 'dasdfdew@gmail.com');

CREATE TABLE `Orders` (
    `order_id` int NOT NULL,
    `customer_id` int DEFAULT NULL,
    `order_date` date DEFAULT NULL,
    PRIMARY KEY (`order_id`),
    KEY `Order_Customer_FK_idx` (`customer_id`),
    CONSTRAINT `Order_Customer_FK` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`)
);

INSERT INTO
    `Orders`
VALUES
    (600100, 51000, '2022-01-03'),
    (600101, 51001, '2022-01-22'),
    (600102, 51003, '2022-07-15'),
    (600103, 51004, '2023-11-05'),
    (600104, 51001, '2024-01-05');

CREATE TABLE `OrderItems` (
    `order_item_id` int NOT NULL,
    `order_id` int,
    `book_id` int,
    `quantity` int,
    `unit_price` decimal(10, 2),
    PRIMARY KEY (`order_item_id`),
    KEY `OrderItems_Books_FK_idx` (`book_id`),
    KEY `OrderItems_Orders_FK_idx` (`order_id`),
    CONSTRAINT `OrderItems_Books_FK` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`),
    CONSTRAINT `OrderItems_Orders_FK` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
);

INSERT INTO
    `OrderItems`
VALUES
    (401001, 600100, 20001, 2, 19.80),
    (401002, 600101, 20002, 1, 19.80),
    (401003, 600102, 20004, 2, 24.80),
    (401004, 600103, 20001, 1, 19.80),
    (401005, 600104, 20002, 2, 19.80),
    (401006, 600104, 20003, 3, 25.50);

/* a */
UPDATE
    `BookstoreDB`.`Books`
SET
    `publication_year` = '2001'
WHERE
    (`book_id` = '20004');

/* b */
ALTER TABLE
    `BookstoreDB`.`Customers`
ADD
    COLUMN `address` VARCHAR(200) NULL
AFTER
    `email`;

/* c */
ALTER TABLE
    `BookstoreDB`.`OrderItems` DROP FOREIGN KEY `OrderItems_Books_FK`,
    DROP FOREIGN KEY `OrderItems_Orders_FK`;

ALTER TABLE
    `BookstoreDB`.`OrderItems`
ADD
    CONSTRAINT `OrderItems_Books_FK` FOREIGN KEY (`book_id`) REFERENCES `BookstoreDB`.`Books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD
    CONSTRAINT `OrderItems_Orders_FK` FOREIGN KEY (`order_id`) REFERENCES `BookstoreDB`.`Orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    `BookstoreDB`.`Orders` DROP FOREIGN KEY `Order_Customer_FK`;

ALTER TABLE
    `BookstoreDB`.`Orders`
ADD
    CONSTRAINT `Order_Customer_FK` FOREIGN KEY (`customer_id`) REFERENCES `BookstoreDB`.`Customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

DELETE FROM
    `BookstoreDB`.`Orders`
WHERE
    (`order_date` <= '2023-01-01');

/* 7 */
ALTER TABLE
    Customers
add
    UNIQUE(email);

/* 8 */
DELETE FROM
    `BookstoreDB`.`Orders`
WHERE
    (`order_id` = '600100');

/* 9 */
SELECT
    *
FROM
    `BookstoreDB`.`Books`
WHERE
    author_id = 1001;

/* 10 */
UPDATE
    `BookstoreDB`.`Customers`
SET
    `email` = 'dasdfdew2233@gmail.com'
WHERE
    (`customer_id` = '51006');