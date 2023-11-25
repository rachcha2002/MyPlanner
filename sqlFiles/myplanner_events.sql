-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: myplanner
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `eventId` int NOT NULL AUTO_INCREMENT,
  `eventName` varchar(45) DEFAULT NULL,
  `eventDate` varchar(12) DEFAULT NULL,
  `eventTime` varchar(8) DEFAULT NULL,
  `numOfGuests` varchar(25) DEFAULT NULL,
  `hostName` varchar(45) DEFAULT NULL,
  `category` varchar(15) DEFAULT NULL,
  `budget` varchar(25) DEFAULT NULL,
  `venue` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `deco` varchar(45) DEFAULT NULL,
  `lights` varchar(45) DEFAULT NULL,
  `catering` varchar(45) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `userName` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'Pending',
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Scientia','2023-10-20','10:30 AM','2000','Rachith Tharana','Corporate Event','500000','Nelum Pokuna','Customize','Customize','Customize','Customize','Science event','rachiththarana18473@gmail.com','0711521161',NULL,'Pending'),(2,'Visualizera','2023-10-27','10:30 AM','400','Tharana M A','Corporate Event','900000','SLIIT-Isalands','none','none','none','none','Tech event','rachcha2002@gmail.com','0711521162','Rachith','Pending'),(4,'Aerogene','2023-10-27','10:30 AM','5000','Tharana Rachith','Corporate Event','8000000','Airport','Customize','Customize','Customize','Customize','Aviation ceremony','arachchige18473@gmail.com','0711521161','Rachith','Pending'),(7,'Momentera','2023-10-18','03:00PM','500','Dilmi','Private Party','150000','Randiya Hotels','pkg3','Customize','pkg3','pkg1','Annivasary part','vihanga@gmail.com','0711521161','Rachith','Pending'),(12,'Avra','2023-10-27','10:30 AM','800','Tharana','Corporate Event','8569','Airport','Customize','Customize','pkg1','pkg2','Aviation event','rachcha2002@gmail.com','0711521161','Rachith','Pending'),(16,'Viramaya','2023-10-28','10:30 AM','800','SLIIT','Corporate Event','500000','SLIIT','Customize','Customize','Customize','Customize','FOC event','rachiththarana18473@gmail.com','0711521161','Rachith','Pending'),(18,'Thala','2023-12-01','06:30 PM','800','Rachith','Corporate Event','500000','SLIIT Open Air Theater','initial','initial','initial','none','Classical Music Event','rachiththarana18473@gmail.com','0711521162','Rachith','Pending'),(20,'MyWedding','2023-10-26','10:30 AM','400','Tharana','Wedding','500000','Ahungall Beach Hotel','bestselling','bestselling','bestselling','bestselling','Want to make dawy special and momorable one','rachcha2002@gmail.com','0711521161','Rachith','Pending'),(21,'Githadis Birthday','2023-10-31','06:30 PM','50','Tharana','Private Party','100000','RaceCorse','initial','Customize','none','bestselling','Birthday party','rachiththarana18473@gmail.com','0711521161','Rachith','');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-27 13:21:02
