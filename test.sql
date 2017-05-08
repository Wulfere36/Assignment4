CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2015_07_23_141214_create_projects_and_tasks_tables',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Title 1','Slug1','Some news about title 1'),(2,'Title 2','Slug2','Some news about title 2');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(32) DEFAULT NULL,
  `Lastname` varchar(32) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Age` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'Johnny','Doe','M',19),(2,'Bob','Black','M',40),(3,'Zoe','Chan','F',21),(4,'Kona','Khan','F',32),(5,'Kader','Khan','M',56),(6,'Kona',NULL,'F',20);
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonebook`
--

DROP TABLE IF EXISTS `phonebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonebook` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonebook`
--

LOCK TABLES `phonebook` WRITE;
/*!40000 ALTER TABLE `phonebook` DISABLE KEYS */;
INSERT INTO `phonebook` VALUES (1,'Fred','5556664444'),(2,'Wilma','5556663333'),(3,'Barney','1234567890'),(5,'Betty','6555444789');
/*!40000 ALTER TABLE `phonebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Project 1','project-1','2015-07-23 18:27:07','2015-07-23 18:27:07'),(2,'Project 2','project-2','2015-07-23 18:27:07','2015-07-23 18:27:07'),(3,'Project 3','project-3','2015-07-23 18:27:07','2015-07-23 18:27:07');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Jimmy','jimmy@email.com'),(2,'Wilma','wilmaf@email.com'),(3,'Fred','fredf@email.ca');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,1,'Task 1','task-1',0,'My first task','2015-07-23 18:27:07','2015-07-23 18:27:07'),(2,1,'Task 2','task-2',0,'My first task','2015-07-23 18:27:07','2015-07-23 18:27:07'),(3,1,'Task 3','task-3',0,'My first task','2015-07-23 18:27:07','2015-07-23 18:27:07'),(4,3,'Task 4 New Name','This is a slug for the new record',1,'This is a description for the new task','2015-07-23 18:27:07','2015-07-23 18:27:07'),(5,1,'Task 5','task-5',1,'My third task','2015-07-23 18:27:07','2015-07-23 18:27:07'),(6,2,'Task 6','task-6',1,'My fourth task','2015-07-23 18:27:07','2015-07-23 18:27:07'),(9,3,'Testing the PDO','This is a slug for the new record',1,'This is a description for the new task','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,3,'Testing the PDO','This is a slug for the new record',1,'This is a description for the new task','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,3,'Testing the PDO again','This is a slug for the new record',1,'This is a description for the new task','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,3,'Testing the PDO again and again','This is a slug for the new record',1,'This is a description for the new task','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,3,'Testing the PDO again and again','This is a slug for the new record',1,'This is a description for the new task','0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,3,'Testing the PDO again and again','This is a slug for the new record',1,'This is a description for the new task','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,3,'Testing the PDO again and again x 3','This is a slug for the new record',1,'This is a description for the new task','0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,3,'Testing the PDO again and again x 4','This is a slug for the new record',1,'This is a description for the new task','0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,3,'Testing the PDO again and again x 5','This is a slug for the new record',1,'This is a description for the new task','0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,3,'Testing the PDO again and again x 5','This is a slug for the new record',1,'This is a description for the new task','0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,3,'Testing the PDO again and again x 5','This is a slug for the new record',1,'This is a description for the new task','0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,3,'Testing the PDO again and again x 5','This is a slug for the new record',1,'This is a description for the new task','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titems02`
--

DROP TABLE IF EXISTS `titems02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titems02` (
  `iid` int(5) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(20) DEFAULT NULL,
  `Qty` int(5) DEFAULT NULL,
  `uid` int(5) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `uid` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `tuser02` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titems02`
--

LOCK TABLES `titems02` WRITE;
/*!40000 ALTER TABLE `titems02` DISABLE KEYS */;
INSERT INTO `titems02` VALUES (1,'TV2',10,1),(2,'PC2 ',21,1),(7,'Toaster',12,1),(8,'Blender A2000',32,1),(9,'Stereo',10,1),(11,'JimmyItem 1a',5,2),(12,'JimmyItem 2',12,1),(13,'JimmyItem 3',12,2),(15,'item11111',2,2),(19,'New Item MS',456,2),(20,'BY Item 1',2,6);
/*!40000 ALTER TABLE `titems02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuser02`
--

DROP TABLE IF EXISTS `tuser02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuser02` (
  `uid` int(5) NOT NULL AUTO_INCREMENT,
  `LoginName` varchar(20) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `LoginPass` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `LoginName_UNIQUE` (`LoginName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuser02`
--

LOCK TABLES `tuser02` WRITE;
/*!40000 ALTER TABLE `tuser02` DISABLE KEYS */;
INSERT INTO `tuser02` VALUES (1,'user01','mary stevenson 01','pass01'),(2,'jimmy','Jimmy Thomas','pass01'),(3,'jimmy2','Jimmy R Thomas','pass01'),(5,'jimmy23','Jimmy JR Thomas','pass01'),(6,'Brenda','Brenda Beardson','pass01');
/*!40000 ALTER TABLE `tuser02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'test'
--

--
-- Dumping routines for database 'test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-08 11:27:31
