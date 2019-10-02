CREATE DATABASE 'Entries';
USE Entries;

CREATE TABLE `entry` (
  `entry_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10),
  `priority_id` int(10),
  `title` varchar(100) NOT NULL,
  `text` varchar(300) NOT NULL,
  PRIMARY KEY (`entry_id`),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
  FOREIGN KEY (priority_id) REFERENCES priority(priority_id)
--  UNIQUE KEY `entry_id_UNIQUE` (`entry_id`),
--  UNIQUE KEY `title_UNIQUE` (`title`)
);

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(100),
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  FOREIGN KEY (role_id) REFERENCES role(role_id)
);

CREATE TABLE `priority` (
  `priority_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  PRIMARY KEY (`priority_id`),
);

CREATE TABLE `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `read` boolean,
  `write` boolean,
  `edit` boolean,
  `remove` boolean,
  PRIMARY KEY (`role_id`)
);

INSERT INTO `user` (role_id, name, password)
VALUES ('0', 'admin', '1234');

INSERT INTO `role` (title, read, write, edit, remove)
VALUES ('admin', '1', '1', '1', '1');

INSERT INTO `entry` (user_id, priority_id, title, text)
VALUES ('0', '0', 'firsttext', 'Das ist eine kurze Beispielnotiz.');













ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1

