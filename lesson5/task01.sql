DROP DATABASE IF EXISTS gu_db_lesson5;
CREATE DATABASE gu_db_lesson5;
USE gu_db_lesson5;

DROP TABLE IF EXISTS users
;
CREATE TABLE users
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NULL,
    updated_at TIMESTAMP DEFAULT NULL
);

INSERT INTO users (created_at, updated_at)
VALUES (NULL, NULL);
INSERT INTO users (created_at, updated_at)
VALUES (NULL, NULL);
INSERT INTO users (created_at, updated_at)
VALUES (NULL, NULL);

UPDATE users
SET created_at=NOW()
WHERE created_at IS NULL;

UPDATE users
SET updated_at=NOW()
WHERE updated_at IS NULL;



