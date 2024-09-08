-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: gas_book_db
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `pwd` varchar(16) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'java@1991');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer_detail`
--

DROP TABLE IF EXISTS `consumer_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumer_detail` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `did` int NOT NULL,
  `pwd` varchar(16) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(10) NOT NULL,
  `pin` int NOT NULL,
  `m_no` bigint NOT NULL,
  `e_id` varchar(30) NOT NULL,
  `reg_date` date DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'Not Registered',
  PRIMARY KEY (`cid`),
  KEY `con_dis_id` (`did`),
  CONSTRAINT `con_dis_id` FOREIGN KEY (`did`) REFERENCES `distributor_detail` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer_detail`
--

LOCK TABLES `consumer_detail` WRITE;
/*!40000 ALTER TABLE `consumer_detail` DISABLE KEYS */;
INSERT INTO `consumer_detail` VALUES (2,1,'java@1991','Javed Tamboli','Charoli,Pune','Pune',411033,8787954652,'javedtamboli@gmail.com','2020-02-07','Active'),(3,2,'333333','Mayur Mahale','Sangavi,Pune','Pune',411003,7877777777,'mmm@gmail.com','2020-02-08','Active'),(5,1,'555555','Shashi Bhure','Akurdi,Pune','Pune',411002,9904436106,'shashi@gmail.com','2020-02-09','Active'),(6,1,NULL,'Chetan Kadam','Bandara,Mumbai','Mumbai',411333,9876543210,'chetankadam@gmail.com','2020-01-02','Active'),(101,1,'maxlength=\"16\"','Nitesh Kadam','16 No,Pune','Pune',411033,9898989898,'kk@gmail.com','2020-01-27','Active'),(225,1,'225225','Vikas Kulkarni','Vasant Vihar,Nagpur','Nagpur',522144,8565655521,'vikas@gmail.com','2020-02-21','Active');
/*!40000 ALTER TABLE `consumer_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributor_detail`
--

DROP TABLE IF EXISTS `distributor_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributor_detail` (
  `did` int NOT NULL AUTO_INCREMENT,
  `pwd` varchar(16) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(10) NOT NULL,
  `pin` int NOT NULL,
  `m_no` bigint NOT NULL,
  `e_id` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Deactive',
  `proof` text NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor_detail`
--

LOCK TABLES `distributor_detail` WRITE;
/*!40000 ALTER TABLE `distributor_detail` DISABLE KEYS */;
INSERT INTO `distributor_detail` VALUES (1,'java@1991','Girish Agency','Kalewadi,Pune','Pune',411033,9898989898,'abc@gmail.com','Active','distributor/proof/1.jpg'),(2,'222222','Prerana Pvt Ltd','Bandara,Mumbai','Mumbai',355002,8547856321,'gpvtltd@hotmail.com','Active','distributor/proof/2.jpg'),(9,'111111','Orchid Ltd','Chamori,Nagpur','Nagpur',555656,7898765421,'nan@ymail.com','Active','distributor/proof/9.jpg'),(10,'333333','Panchavati Group','Panchavati,Nashik','Nashik',366444,9875452121,'tapo@gmail.com','Deactive','distributor/proof/10.png');
/*!40000 ALTER TABLE `distributor_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_complain`
--

DROP TABLE IF EXISTS `feedback_complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback_complain` (
  `cid` int NOT NULL,
  `did` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `type` varchar(10) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  KEY `fc_con_id` (`cid`),
  KEY `fc_dis_id` (`did`),
  CONSTRAINT `fc_con_id` FOREIGN KEY (`cid`) REFERENCES `consumer_detail` (`cid`),
  CONSTRAINT `fc_dis_id` FOREIGN KEY (`did`) REFERENCES `distributor_detail` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_complain`
--

LOCK TABLES `feedback_complain` WRITE;
/*!40000 ALTER TABLE `feedback_complain` DISABLE KEYS */;
INSERT INTO `feedback_complain` VALUES (5,1,'2020-02-25','10:34:46','Feedback','Product related','Last product delivery taken two weeks.'),(5,1,'2020-02-25','10:34:53','Feedback','Website related','Your website\'s interface is awesome.'),(225,1,'2020-02-25','10:35:48','Complaint','Defected Product','Delivered product is defected.'),(225,1,'2020-02-25','10:35:54','Feedback','Website related','Good user-interface.'),(3,2,'2020-04-06','18:14:48','Complaint','Notification related','Since two month, I didn\'t getting any SMS/Email regarding product delivery, I am doing manually by checking order status in website. Please fix this issue.'),(3,2,'2020-04-06','13:12:41','Feedback','Website related','Awesome');
/*!40000 ALTER TABLE `feedback_complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `did` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `amt` float NOT NULL DEFAULT '475',
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`oid`),
  KEY `od_con_id` (`cid`),
  KEY `od_dis_id` (`did`),
  CONSTRAINT `od_con_id` FOREIGN KEY (`cid`) REFERENCES `consumer_detail` (`cid`),
  CONSTRAINT `od_dis_id` FOREIGN KEY (`did`) REFERENCES `distributor_detail` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (10,5,1,'2020-02-14','10:07:17',475,'Delivered'),(15,5,1,'2020-02-14','10:15:24',475,'Delivered'),(16,5,1,'2020-02-14','11:13:52',475,'Delivered'),(17,225,1,'2020-02-21','10:10:04',475,'Delivered'),(18,225,1,'2020-02-26','10:04:35',475,'Approved'),(19,5,1,'2020-02-21','18:36:45',475,'Delivered'),(24,5,1,'2020-02-22','13:32:31',475,'Pending'),(25,3,2,'2020-03-06','17:39:56',475,'Pending'),(26,2,1,'2020-04-04','09:47:21',475,'Pending');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-03  0:39:47
