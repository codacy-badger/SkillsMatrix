USE `mysql`;

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES ('localhost','skillsmatrixuser','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9','N','2018-06-26 08:27:17',NULL,'N');
UNLOCK TABLES;

CREATE DATABASE `skillsmatrix` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

GRANT ALL PRIVILEGES ON skillsmatrix.* TO 'skillsmatrixuser'@'%';

USE `skillsmatrix`;

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(100) NULL,
  `lastname` varchar(100) NULL,
  `dateofbirth` date NULL,
  `email` varchar(255) NULL,
  `extension` varchar(255) NULL,
  `phone` varchar(255) NULL,
  `mobile` varchar(255) NULL,
  `fax` varchar(255) NULL,
  `comment` varchar(255) NULL,
  `public` int(11) NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

LOCK TABLES `person` WRITE;
INSERT INTO `person`
SET username = 'skillsmatrixuser',
    password = '$2y$10$hoVN/tj3FCBlA2D3Pjsp0O1Uv7BdiZxA5bSLNg6B1PEbwP9N3Pwwe',
    firstname = 'Skills',
    lastname = 'Matrix',
    dateofbirth = '01/01/01',
    email = 'skillsmatrix@skillsmatrix.com',
    extension = '666',
    phone = '6666666',
    mobile = '6666666',
    fax = '6666666',
    comment = 'Place Holder',
    public = '1';
UNLOCK TABLES;

DROP TABLE IF EXISTS `skill`;

CREATE TABLE `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

LOCK TABLES `skill` WRITE;
INSERT INTO `skill` VALUES (1,'CISCO','2018-06-27 17:32:30'),(2,'RADIUS','2018-06-27 17:34:22'),(3,'VLAN','2018-06-28 03:00:03');
UNLOCK TABLES;

DROP TABLE IF EXISTS `personSkill`;

CREATE TABLE `personSkill` (
  `personid` int(11) NOT NULL,
  `skillid` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`personid`,`skillid`),
  FOREIGN KEY (personid) REFERENCES person(id),
  FOREIGN KEY (skillid) REFERENCES skill(id)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'SYSTEMS ADMINISTRATOR','2018-06-27 17:32:30'),(2,'IT MANAGER','2018-06-27 17:34:22'),(3,'WEB DEVELOPER','2018-06-28 03:00:03');
UNLOCK TABLES;

DROP TABLE IF EXISTS `personRole`;

CREATE TABLE `personPosition` (
  `personid` int(11) NOT NULL,
  `positionid` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`personid`,`roleid`),
  FOREIGN KEY (personid) REFERENCES person(id),
  FOREIGN KEY (roleid) REFERENCES role(id)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

DROP TABLE IF EXISTS `title`;

CREATE TABLE `title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

LOCK TABLES `title` WRITE;
INSERT INTO `title` VALUES (1,'MR.','2018-06-27 17:32:30'),(2,'MISS.','2018-06-27 17:34:22'),(3,'MS.','2018-06-28 03:00:03');
UNLOCK TABLES;

CREATE TABLE `personTitle` (
  `personid` int(11) NOT NULL,
  `titleid` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`personid`,`titleid`),
  FOREIGN KEY (personid) REFERENCES person(id),
  FOREIGN KEY (titleid) REFERENCES title(id)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

LOCK TABLES `room` WRITE;
INSERT INTO `room` VALUES (1,'W001','2018-06-27 17:32:30'),(2,'W002','2018-06-27 17:34:22'),(3,'W003','2018-06-28 03:00:03');
UNLOCK TABLES;

CREATE TABLE `personRoom` (
  `personid` int(11) NOT NULL,
  `roomid` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`personid`,`roomid`),
  FOREIGN KEY (personid) REFERENCES person(id),
  FOREIGN KEY (roomid) REFERENCES room(id)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

LOCK TABLES `permission` WRITE;
INSERT INTO `permission` VALUES (1,'USER','2018-06-27 17:32:30'),(2,'MANAGER','2018-06-27 17:34:22'),(3,'ADMINISTRATOR','2018-06-28 03:00:03');
UNLOCK TABLES;

CREATE TABLE `personPermission` (
  `personid` int(11) NOT NULL,
  `permissionid` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`personid`,`permissionid`),
  FOREIGN KEY (personid) REFERENCES person(id),
  FOREIGN KEY (permissionid) REFERENCES permission(id)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

LOCK TABLES `location` WRITE;
INSERT INTO `location` VALUES (1,'DUBLIN','2018-06-27 17:32:30'),(2,'LIMERICK','2018-06-27 17:34:22'),(3,'CORK','2018-06-28 03:00:03');
UNLOCK TABLES;

CREATE TABLE `personLocation` (
  `personid` int(11) NOT NULL,
  `locationid` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`personid`,`locationid`),
  FOREIGN KEY (personid) REFERENCES person(id),
  FOREIGN KEY (locationid) REFERENCES location(id)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

LOCK TABLES `department` WRITE;
INSERT INTO `department` VALUES (1,'IT SERVICES','2018-06-27 17:32:30'),(2,'ADMINISTRATION','2018-06-27 17:34:22'),(3,'MARKETING','2018-06-28 03:00:03');
UNLOCK TABLES;

CREATE TABLE `personDepartment` (
  `personid` int(11) NOT NULL,
  `departmentid` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`personid`,`departmentid`),
  FOREIGN KEY (personid) REFERENCES person(id),
  FOREIGN KEY (departmentid) REFERENCES department(id)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

LOCK TABLES `status` WRITE;
INSERT INTO `status` VALUES (1,'ACTIVE','2018-06-27 17:32:30'),(2,'INACTIVE','2018-06-27 17:34:22'),(3,'SICK LEAVE','2018-06-28 03:00:03');
UNLOCK TABLES;

DROP TABLE IF EXISTS `personStatus`;

CREATE TABLE `personStatus` (
  `personid` int(11) NOT NULL,
  `statusid` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`personid`,`statusid`),
  FOREIGN KEY (personid) REFERENCES person(id),
  FOREIGN KEY (statusid) REFERENCES status(id)
) ENGINE=InnoDB DEFAULT CharSet=utf8mb4;

