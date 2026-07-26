-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: cl_sports_league
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `conference`
--

DROP TABLE IF EXISTS `conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conference` (
  `ConferenceID` int NOT NULL AUTO_INCREMENT,
  `DivisionID` int NOT NULL,
  `Conference_Name` varchar(40) NOT NULL,
  PRIMARY KEY (`ConferenceID`),
  KEY `DivisionID` (`DivisionID`),
  CONSTRAINT `conference_ibfk_1` FOREIGN KEY (`DivisionID`) REFERENCES `division` (`DivisionID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference`
--

LOCK TABLES `conference` WRITE;
/*!40000 ALTER TABLE `conference` DISABLE KEYS */;
INSERT INTO `conference` VALUES (1,1,'BIG 12'),(2,2,'BIG 10'),(3,3,'SEC'),(4,4,'BIG EAST'),(5,4,'PAC 12'),(6,3,'ACC'),(7,2,'Mountain West'),(8,1,'American Athletic Conference'),(9,1,'Ivy'),(10,2,'FBS');
/*!40000 ALTER TABLE `conference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division` (
  `DivisionID` int NOT NULL AUTO_INCREMENT,
  `Division_Name` varchar(40) NOT NULL,
  PRIMARY KEY (`DivisionID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'West'),(2,'Midwest'),(3,'Northeast'),(4,'South');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `PlayerID` int NOT NULL AUTO_INCREMENT,
  `TeamID` int NOT NULL,
  `PositionID` int NOT NULL,
  `First_Name` varchar(40) NOT NULL,
  `Last_Name` varchar(40) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`PlayerID`),
  KEY `TeamID` (`TeamID`),
  KEY `PositionID` (`PositionID`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TeamID`) ON UPDATE CASCADE,
  CONSTRAINT `player_ibfk_2` FOREIGN KEY (`PositionID`) REFERENCES `position` (`PositionID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,1,2,'Kobe','Bryant','1978-08-23',44),(2,1,1,'Magic','Johnson','1959-08-14',63),(3,2,2,'Allen','Iverson','1975-06-07',47),(4,2,3,'Carmelo','Anthony','1984-05-29',38),(5,3,2,'Michael','Jordan','1963-02-17',60),(6,4,3,'Paul','George','1990-05-02',32),(7,5,3,'Julius','Erving','1950-02-22',73),(8,6,3,'Larry','Bird','1956-12-07',66),(9,7,5,'Shaquille','O\'Neal','1972-03-06',51),(10,8,4,'Charles','Barkley','1963-02-20',60),(11,9,1,'Jamal','Crawford','1990-03-20',33),(12,1,4,'Steve','Nash','1974-02-07',49);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_stats`
--

DROP TABLE IF EXISTS `player_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_stats` (
  `StatsID` int NOT NULL AUTO_INCREMENT,
  `PlayerID` int NOT NULL,
  `Points` int NOT NULL,
  `Assists` int NOT NULL,
  `Steals` int NOT NULL,
  `Games_Played` int NOT NULL,
  PRIMARY KEY (`StatsID`),
  KEY `PlayerID` (`PlayerID`),
  CONSTRAINT `player_stats_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_stats`
--

LOCK TABLES `player_stats` WRITE;
/*!40000 ALTER TABLE `player_stats` DISABLE KEYS */;
INSERT INTO `player_stats` VALUES (1,1,39283,6306,1391,1554),(2,2,17707,10141,1724,1198),(3,3,26668,6119,1983,914),(4,4,28997,3730,1360,1190),(5,5,132292,5633,2514,1251),(6,6,14265,2365,827,764),(7,7,30026,5176,2272,1298),(8,8,21791,5695,1556,1106),(9,9,28596,4628,1210,1207),(10,10,26397,4215,1643,1073),(11,11,19414,5611,1292,1327),(12,12,17387,10335,899,1217);
/*!40000 ALTER TABLE `player_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `PositionID` int NOT NULL AUTO_INCREMENT,
  `Position_Name` varchar(35) NOT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Point Guard'),(2,'Shooting Guard'),(3,'Small Forward'),(4,'Power Forward'),(5,'Center');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `StateID` int NOT NULL AUTO_INCREMENT,
  `ConferenceID` int NOT NULL,
  `State_Name` varchar(40) NOT NULL,
  PRIMARY KEY (`StateID`),
  KEY `ConferenceID` (`ConferenceID`),
  CONSTRAINT `state_ibfk_1` FOREIGN KEY (`ConferenceID`) REFERENCES `conference` (`ConferenceID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,1,'California'),(2,2,'Colorado'),(3,3,'Illinois'),(4,4,'Indiana'),(5,5,'New York'),(6,6,'Massachussetts'),(7,7,'Florida'),(8,8,'Texas'),(9,9,'Georgia'),(10,10,'Arizona');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `TeamID` int NOT NULL AUTO_INCREMENT,
  `StateID` int NOT NULL,
  `Team_Name` varchar(40) NOT NULL,
  `Wins` int NOT NULL,
  `Losses` int NOT NULL,
  `Total_Points` int NOT NULL,
  `Total_Games` int NOT NULL,
  `City_Name` varchar(30) NOT NULL,
  PRIMARY KEY (`TeamID`),
  KEY `StateID` (`StateID`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`StateID`) REFERENCES `state` (`StateID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,1,'Lakers',3914,2553,365675,9273,'Los Angeles'),(2,2,'Nuggets',2301,2529,230703,5105,'Denver'),(3,3,'Bulls',2694,2529,263032,6301,'Chicago'),(4,4,'Pacers',2318,2345,231021,5121,'Indianapolis'),(5,5,'Nets',1635,2037,172241,3908,'Brooklyn'),(6,6,'Celtics',3731,2705,380874,7985,'Boston'),(7,7,'Heat',1501,1350,153329,2851,'Miami'),(8,8,'Rockets',2616,2289,274148,5201,'Houston'),(9,9,'Hawks',3287,3690,572596,6132,'Atlanta'),(10,10,'Suns',2454,2325,481143,4934,'Phoenix');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cl_sports_league'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08 21:02:49
