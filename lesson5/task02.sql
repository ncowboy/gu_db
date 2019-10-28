DROP DATABASE IF EXISTS gu_db_lesson5;
CREATE DATABASE gu_db_lesson5;
USE gu_db_lesson5;

DROP TABLE IF EXISTS users
;
CREATE TABLE users
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    created_at VARCHAR(64) DEFAULT NULL,
    updated_at VARCHAR(64) DEFAULT NULL
);

INSERT INTO users (created_at, updated_at)
VALUES ('20.12.2017 12:45', '20.12.2017 15:10');
INSERT INTO users (created_at, updated_at)
VALUES ('01.01.2015 8:10', '12.01.2016 18:10');
INSERT INTO users (created_at, updated_at)
VALUES ('12.09.2017 5:45', '15.09.2017 8:48');

UPDATE users
SET created_at=STR_TO_DATE(created_at, '%d.%m.%Y %H:%i');
UPDATE users
SET updated_at=STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');

ALTER TABLE users
    MODIFY COLUMN created_at TIMESTAMP;
ALTER TABLE users
    MODIFY COLUMN updated_at TIMESTAMP;

