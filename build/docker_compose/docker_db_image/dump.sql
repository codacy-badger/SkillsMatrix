USE `mysql`;

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES ('localhost','skillsmatrixuser','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9','N','2018-06-26 08:27:17',NULL,'N');
UNLOCK TABLES;

CREATE DATABASE `skillsmatrix` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `skillsmatrix`;

DROP TABLE IF EXISTS `skills`;

CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CharSet=utf8mb4;

LOCK TABLES `skills` WRITE;
INSERT INTO `skills` VALUES (1,'CISCO','2018-06-27 17:32:30'),(2,'RADIUS','2018-06-27 17:34:22'),(3,'VLAN','2018-06-28 03:00:03');
UNLOCK TABLES;

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CharSet=utf8mb4;

LOCK TABLES `positions` WRITE;
INSERT INTO `positions` VALUES (1,'SYSTEMS ADMINISTRATOR','2018-06-27 17:32:30'),(2,'IT MANAGER','2018-06-27 17:34:22'),(3,'WEB DEVELOPER','2018-06-28 03:00:03');
UNLOCK TABLES;

DROP TABLE IF EXISTS `titles`;

CREATE TABLE `titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CharSet=utf8mb4;

LOCK TABLES `titles` WRITE;
INSERT INTO `titles` VALUES (1,'MR.','2018-06-27 17:32:30'),(2,'MISS.','2018-06-27 17:34:22'),(3,'MS.','2018-06-28 03:00:03');
UNLOCK TABLES;

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CharSet=utf8mb4;

LOCK TABLES `rooms` WRITE;
INSERT INTO `rooms` VALUES (1,'W001','2018-06-27 17:32:30'),(2,'W002','2018-06-27 17:34:22'),(3,'W003','2018-06-28 03:00:03');
UNLOCK TABLES;

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CharSet=utf8mb4;

LOCK TABLES `permissions` WRITE;
INSERT INTO `permissions` VALUES (1,'USER','2018-06-27 17:32:30'),(2,'MANAGER','2018-06-27 17:34:22'),(3,'ADMINISTRATOR','2018-06-28 03:00:03');
UNLOCK TABLES;

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CharSet=utf8mb4;

LOCK TABLES `locations` WRITE;
INSERT INTO `locations` VALUES (1,'DUBLIN','2018-06-27 17:32:30'),(2,'LIMERICK','2018-06-27 17:34:22'),(3,'CORK','2018-06-28 03:00:03');
UNLOCK TABLES;

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CharSet=utf8mb4;

LOCK TABLES `departments` WRITE;
INSERT INTO `departments` VALUES (1,'IT SERVICES','2018-06-27 17:32:30'),(2,'ADMINISTRATION','2018-06-27 17:34:22'),(3,'MARKETING','2018-06-28 03:00:03');
UNLOCK TABLES;

DROP TABLE IF EXISTS `statuses`;

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `description` (`description`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CharSet=utf8mb4;

LOCK TABLES `statuses` WRITE;
INSERT INTO `statuses` VALUES (1,'ACTIVE','2018-06-27 17:32:30'),(2,'INACTIVE','2018-06-27 17:34:22'),(3,'SICK LEAVE','2018-06-28 03:00:03');
UNLOCK TABLES;

DROP TABLE IF EXISTS `people`;

CREATE TABLE `people` (
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
  `title` int(11) NULL,
  `department` int(11) NULL,
  `position` int(11) NULL,
  `location` int(11) NULL,
  `room` int(11) NULL,
  `status` int(11) NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  FOREIGN KEY fk_title(title) REFERENCES titles(id),
  FOREIGN KEY fk_department(department) REFERENCES departments(id),
  FOREIGN KEY fk_position(position) REFERENCES positions(id),
  FOREIGN KEY fk_location(location) REFERENCES locations(id),
  FOREIGN KEY fk_room(room) REFERENCES rooms(id),
  FOREIGN KEY fk_status(status) REFERENCES statuses(id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CharSet=utf8mb4;

LOCK TABLES 
  `people` WRITE,
  `titles` WRITE,
  `departments` WRITE,
  `positions` WRITE,
  `locations` WRITE,
  `rooms` WRITE,
  `statuses` WRITE;
INSERT INTO `people`
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
    public = '1',
    title = ( SELECT id FROM titles WHERE description = 'Mr.' LIMIT 1),
    department = ( SELECT id FROM departments WHERE description = 'IT SERVICES' LIMIT 1),
    position = ( SELECT id FROM positions WHERE description = 'SYSTEMS ADMINISTRATOR' LIMIT 1),
    location = ( SELECT id FROM locations WHERE description = 'DUBLIN' LIMIT 1),
    room = ( SELECT id FROM rooms WHERE description = 'W001' LIMIT 1),
    status = ( SELECT id FROM statuses WHERE description = 'ACTIVE' LIMIT 1);
UNLOCK TABLES;

GRANT ALL PRIVILEGES ON skillsmatrix.* TO 'skillsmatrixuser'@'localhost';