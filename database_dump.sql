-- MySQL dump 10.13  Distrib 5.5.23, for Win32 (x86)
--
-- Host: localhost    Database: service
-- ------------------------------------------------------
-- Server version       5.5.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0
*/;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) unsigned NOT NULL,
  `fname` varchar(35) DEFAULT NULL,
  `lname` varchar(35) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(44) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (10,8,'Henriks','Magnusson','1993-12-12','Miami','37
529585','besaf@sadasd.ry'),(50,9,'Dmitry','Kaba','1992-06-19','vyl.Mayakovskogo'
,'+37529566325','K@B@mail.ru'),(53,20,'Sergey','Zhdanovich','1993-05-31','per.Ko
zlova','375298574066','beda67@mail.ru'),(54,23,'Daniil','Zaru','1991-03-14','Che
ch','+375442569854','Zaru@gmail.com'),(55,24,'Kolya','aka47','2015-09-27','mosco
w city','959623165','aka478@mail.ru'),(56,25,'Denzel','Washington','1992-06-04',
'Miami st.California','+47529566325','denzel@gmail.com'),(57,29,'Gregor','Cligan
','2009-07-24','Vesteros','nophone','only pigeons'),(58,30,'Jeyme','Lannister','
1855-02-16','vesteros casterly rock','nophones','just lions');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_card`
--

DROP TABLE IF EXISTS `client_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(10) NOT NULL,
  `make` varchar(30) DEFAULT NULL,
  `model` varchar(30) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `vin` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_card`
--

LOCK TABLES `client_card` WRITE;
/*!40000 ALTER TABLE `client_card` DISABLE KEYS */;
INSERT INTO `client_card` VALUES (8,9,'Toyota','RAV4','2015-01-01','556324562'),
(9,9,'Audi','tt','2007-09-03','589951651'),(20,8,'Porche','911','2014-09-26','56
5152132'),(23,10,'Citroen','Xantia','2011-01-01','523245562'),(24,20,'Renaut','M
egan','2007-01-01','223243562'),(25,23,'BMW','X5','2010-01-01','623343562'),(26,
25,'Porche','cayenne','2013-09-10','569696354'),(27,24,'Skoda','octavia','2009-0
9-03','969951651'),(28,8,'BMW','z3','2006-01-01','645343562'),(29,29,'Horse','St
allion','2015-09-03','66666666'),(30,30,'Horse','Brienna','2015-02-27','65641321
'),(40,10,'asd','asd','2015-10-02','sds'),(41,50,'asd','asd','2015-10-17','qweqw
');
/*!40000 ALTER TABLE `client_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` enum('progr','compl','cancel') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,3,'1993-11-15',20,'compl'),(4,3,'2000-02-22',5852
,'cancel'),(11,11,'2000-02-16',5600,'progr'),(12,23,'1977-06-17',1500,'progr'),(
13,13,'2004-02-22',7500,'progr'),(14,12,'2007-02-16',5600,'compl'),(15,14,'2009-
02-16',8800,'compl'),(16,15,'2015-09-06',1000,'compl'),(18,15,'2000-09-27',750,'
compl'),(19,15,'2004-09-06',10000,'compl'),(23,4,'1999-02-22',6000,'progr'),(34,
40,'2015-10-17',400,'cancel'),(36,41,'2015-10-10',10000,'compl'),(37,8,'2015-10-
25',5400,'compl');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-12  2:30:25