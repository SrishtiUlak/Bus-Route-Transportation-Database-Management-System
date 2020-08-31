-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: busRoute
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

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
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus` (
  `Vehicle_NO` int(11) NOT NULL AUTO_INCREMENT,
  `Route_ID` int(11) DEFAULT NULL,
  `Total_Student` int(11) DEFAULT NULL,
  PRIMARY KEY (`Vehicle_NO`),
  KEY `Route_ID` (`Route_ID`),
  CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`Route_ID`) REFERENCES `route` (`Route_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (1,1,30),(2,2,10),(3,3,15),(4,4,20),(5,5,8),(6,6,15),(7,8,8),(8,7,12);
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bussschedule`
--

DROP TABLE IF EXISTS `bussschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bussschedule` (
  `Schedule_ID` int(11) NOT NULL,
  `Depature_Time` varchar(50) NOT NULL,
  `Arrival_Time` varchar(50) NOT NULL,
  PRIMARY KEY (`Schedule_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bussschedule`
--

LOCK TABLES `bussschedule` WRITE;
/*!40000 ALTER TABLE `bussschedule` DISABLE KEYS */;
INSERT INTO `bussschedule` VALUES (1,'7:15','4:00'),(2,'7:00','4:15'),(3,'7:30','3:45'),(4,'7:00','4:00'),(5,'7:05','4:10'),(6,'7:20','4:00'),(7,'7:10','4:00'),(8,'7:15','4:00');
/*!40000 ALTER TABLE `bussschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `Driver_ID` int(11) NOT NULL,
  `Driver_Name` varchar(100) DEFAULT NULL,
  `Vehicle_Number` int(11) NOT NULL,
  `Phone_Number` int(11) NOT NULL,
  PRIMARY KEY (`Driver_ID`),
  KEY `Vehicle_Number` (`Vehicle_Number`),
  CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`Vehicle_Number`) REFERENCES `bus` (`Vehicle_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Alfie Conner',8,2147483647),(2,'Freddie Ortiz',5,2147483647),(3,'Isabella Little',6,2147483647),(4,'Lily Frye',4,2147483647),(5,'Sophia Simmons',2,2147483647),(6,'Juan Carlos',1,2147483647),(7,'Sara Frye',7,2147483647),(8,'Annamaria Smith',3,2147483647);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `Route_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Place` varchar(100) NOT NULL,
  `Schedule_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Route_ID`),
  KEY `Schedule_ID` (`Schedule_ID`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`Schedule_ID`) REFERENCES `bussschedule` (`Schedule_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Sitapaila - Teku',1),(2,'Basundhara -Nayabazaar',2),(3,'Babarmahal -Jadibuti',3),(4,'Galphutar -OM Hospital',4),(5,'Gathaghar -Tinkune',5),(6,'Birhospital- Koteshwor',6),(7,'Thapathali- Koteshwor',7),(8,'Tripurshwo- Koteshwor',8);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `Student_ID` int(11) NOT NULL,
  `Student_Name` varchar(50) NOT NULL,
  `Class` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Harry Mccarty',1,'Kalimati Salik'),(2,'Jack Lara',3,'DapasiChwok'),(3,'George Ballard',6,'Baneshwor'),(4,'Noah Figueroa',6,'Chakrapath'),(5,'Jacob Carroll',7,'Suryabinayak'),(6,' Mike Smith',9,'Lainchour DDC'),(7,'Juan Carlos',4,'Ghantaghar'),(8,'Jane Smit',5,'Jawlakhel Bus'),(9,'Bob Smith',3,'Bijuli Bazaar');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentschedule`
--

DROP TABLE IF EXISTS `studentschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentschedule` (
  `Serial_Number` int(11) NOT NULL AUTO_INCREMENT,
  `Student` int(11) NOT NULL,
  `Schedule` int(11) NOT NULL,
  PRIMARY KEY (`Serial_Number`),
  KEY `Student` (`Student`),
  KEY `Schedule` (`Schedule`),
  CONSTRAINT `studentschedule_ibfk_1` FOREIGN KEY (`Student`) REFERENCES `student` (`Student_ID`),
  CONSTRAINT `studentschedule_ibfk_2` FOREIGN KEY (`Schedule`) REFERENCES `bussschedule` (`Schedule_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentschedule`
--

LOCK TABLES `studentschedule` WRITE;
/*!40000 ALTER TABLE `studentschedule` DISABLE KEYS */;
INSERT INTO `studentschedule` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,1),(7,7,6),(8,8,7),(9,9,8);
/*!40000 ALTER TABLE `studentschedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-21 19:58:55
