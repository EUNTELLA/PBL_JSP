SET character_set_client = utf8;
SET character_set_connection = utf8;
SET character_set_results = utf8;
CREATE DATABASE IF NOT EXISTS mysns
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE mysns;

CREATE TABLE IF NOT EXISTS user(
    id VARCHAR(128) PRIMARY KEY, -- "email"
    password VARCHAR(32),
    name VARCHAR(32),
    bio VARCHAR(512),
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS feed(
    no INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id VARCHAR(128), -- "email"
    title VARCHAR(128),
    content VARCHAR(4096),
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    images VARCHAR(1024)
);

CREATE TABLE IF NOT EXISTS reply(
    no INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    feed_no INT UNSIGNED,
    id VARCHAR(128),
    content VARCHAR(1024),
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
