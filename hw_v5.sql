CREATE DATABASE  IF NOT EXISTS `homework_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `homework_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: homework_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Author` (
  `AuthorID` int NOT NULL,
  `Firstname` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
INSERT INTO `Author` VALUES (1,'Suzanne','Collins'),(2,'Stephenie','Meyer'),(3,'J.K.','Rowling'),(4,'Dan','Brown'),(5,'Gillian','Flynn'),(6,'Paula','Hawkins'),(7,'George R.R.','Martin'),(8,'Kathryn','Stockett'),(9,'John','Green'),(10,'George','Orwell'),(11,'J.D.','Salinger'),(12,'Harper','Lee'),(13,'F. Scott','Fitzgerald'),(14,'Jane','Austen');
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Availability`
--

DROP TABLE IF EXISTS `Availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Availability` (
  `AvailabilityID` int NOT NULL,
  `Availability` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AvailabilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Availability`
--

LOCK TABLES `Availability` WRITE;
/*!40000 ALTER TABLE `Availability` DISABLE KEYS */;
INSERT INTO `Availability` VALUES (1,'Available'),(2,'Not Available');
/*!40000 ALTER TABLE `Availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book` (
  `BookID` int NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `ISBN` bigint DEFAULT NULL,
  `GenreID` int DEFAULT NULL,
  `AvailableID` int DEFAULT NULL,
  `PublicationYear` int DEFAULT NULL,
  `Pages` int DEFAULT NULL,
  PRIMARY KEY (`BookID`),
  KEY `GenreID` (`GenreID`),
  KEY `AvailableID` (`AvailableID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`GenreID`) REFERENCES `Genre` (`GenreID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`AvailableID`) REFERENCES `Availability` (`AvailabilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book`
--

LOCK TABLES `Book` WRITE;
/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
INSERT INTO `Book` VALUES (1,'Harry Potter and the Philosopher\'s Stone',9780747532743,1,1,1997,320),(2,'Harry Potter and the Chamber of Secrets',9780747538486,1,1,1998,352),(3,'Harry Potter and the Prisoner of Azkaban',9780747542155,1,1,1999,448),(4,'Harry Potter and the Goblet of Fire',9780747591054,1,1,2000,734),(5,'Harry Potter and the Order of the Phoenix',9780439358071,1,1,2003,870),(6,'Harry Potter and the Half-Blood Prince',9780747581086,1,1,2005,652),(7,'Harry Potter and the Deathly Hallows',9780545010221,1,1,2007,759),(8,'The Hunger Games',9780439023481,2,1,2008,374),(9,'Twilight',9780316015844,2,1,2005,498),(10,'The Da Vinci Code',9780307474278,3,1,2003,689),(11,'Gone Girl',9780307588371,4,1,2012,419),(12,'The Girl on the Train',9781594634024,3,2,2015,336),(13,'A Game of Thrones',9780553106633,1,1,1996,694),(14,'The Help',9780425232200,5,1,2009,464),(15,'The Fault in Our Stars',9780525478812,2,1,2012,313),(16,'1984',9780451524935,8,2,1949,328),(17,'The Catcher in the Rye',9780316769488,6,2,1951,277),(18,'To Kill a Mockingbird',9780061120084,6,2,1960,281),(19,'The Great Gatsby',9780743273565,6,2,1925,218),(20,'Pride and Prejudice',9780679783268,7,2,1813,279);
/*!40000 ALTER TABLE `Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book_Author`
--

DROP TABLE IF EXISTS `Book_Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book_Author` (
  `BookID` int NOT NULL,
  `AuthorID` int NOT NULL,
  PRIMARY KEY (`BookID`,`AuthorID`),
  KEY `AuthorID` (`AuthorID`),
  CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `Book` (`BookID`),
  CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`AuthorID`) REFERENCES `Author` (`AuthorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book_Author`
--

LOCK TABLES `Book_Author` WRITE;
/*!40000 ALTER TABLE `Book_Author` DISABLE KEYS */;
INSERT INTO `Book_Author` VALUES (8,1),(9,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(10,4),(11,5),(12,6),(13,7),(14,8),(15,9),(16,10),(17,11),(18,12),(19,13),(20,14);
/*!40000 ALTER TABLE `Book_Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BookLoan`
--

DROP TABLE IF EXISTS `BookLoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BookLoan` (
  `BookLoanID` int NOT NULL AUTO_INCREMENT,
  `BorrowDate` varchar(20) NOT NULL,
  `DueDate` varchar(20) NOT NULL,
  `ReturnDate` varchar(20) DEFAULT NULL,
  `MemberID` int DEFAULT NULL,
  `EmployeeID` int DEFAULT NULL,
  `BookID` int DEFAULT NULL,
  `TransactionTypeID` int DEFAULT NULL,
  `CheckoutLocationID` int DEFAULT NULL,
  `RenewalCount` int DEFAULT '0',
  `FineAmount` decimal(3,2) DEFAULT '0.00',
  PRIMARY KEY (`BookLoanID`),
  KEY `TransactionTypeID` (`TransactionTypeID`),
  KEY `CheckoutLocationID` (`CheckoutLocationID`),
  CONSTRAINT `bookloan_ibfk_1` FOREIGN KEY (`TransactionTypeID`) REFERENCES `TransactionType` (`TransactionTypeID`),
  CONSTRAINT `bookloan_ibfk_2` FOREIGN KEY (`CheckoutLocationID`) REFERENCES `CheckoutLocation` (`CheckoutLocationID`),
  CONSTRAINT `bookloan_chk_1` CHECK ((`RenewalCount` <= 2)),
  CONSTRAINT `check_max_renewal_count` CHECK ((`RenewalCount` <= 2))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookLoan`
--

LOCK TABLES `BookLoan` WRITE;
/*!40000 ALTER TABLE `BookLoan` DISABLE KEYS */;
INSERT INTO `BookLoan` VALUES (1,'01/03/2024','15/03/2024',NULL,11,1,4,1,2,0,0.00),(2,'16/03/2024','22/03/2024',NULL,7,19,15,1,4,0,0.00),(3,'05/03/2024','19/03/2024',NULL,1,5,17,1,4,0,0.00),(4,'16/03/2024','05/04/2024',NULL,7,2,15,2,1,1,0.00),(5,'10/03/2024','24/03/2024',NULL,14,18,14,1,3,0,0.00),(6,'10/03/2024','24/03/2024',NULL,14,18,2,1,3,0,0.00),(7,'01/03/2024','15/03/2024','15/03/2024',11,4,4,3,2,0,0.00),(8,'05/03/2024','19/03/2024','20/03/2024',1,8,17,3,4,0,0.00),(9,'10/03/2024','07/04/2024',NULL,14,17,14,2,1,1,0.00),(10,'22/03/2024','05/04/2024',NULL,20,12,19,1,2,0,0.00),(11,'22/03/2024','19/04/2024',NULL,20,14,19,2,1,1,0.00),(12,'16/03/2024','05/04/2024','04/04/2024',7,2,15,3,4,1,0.00),(13,'22/03/2024','03/05/2024',NULL,20,12,19,2,1,2,0.00),(14,'10/03/2024','24/03/2024','07/04/2024',14,3,2,3,3,0,5.60),(15,'10/03/2024','07/04/2024','07/04/2024',14,3,14,3,3,1,0.00),(16,'06/04/2024','20/04/2024',NULL,19,18,13,1,2,0,0.00),(17,'08/04/2024','20/04/2024',NULL,16,16,7,1,4,0,0.00),(18,'08/04/2024','20/04/2024','30/04/2024',16,20,7,3,4,0,1.60),(19,'06/04/2024','20/04/2024','01/05/2024',19,10,13,3,2,0,2.20),(20,'22/03/2024','03/05/2024','02/05/2024',20,13,19,3,2,2,0.00);
/*!40000 ALTER TABLE `BookLoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CheckoutLocation`
--

DROP TABLE IF EXISTS `CheckoutLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CheckoutLocation` (
  `CheckoutLocationID` int NOT NULL AUTO_INCREMENT,
  `LocationName` varchar(20) NOT NULL,
  `HouseNo` varchar(50) NOT NULL,
  `Street` varchar(200) NOT NULL,
  `TownCity` varchar(50) NOT NULL,
  `County` varchar(50) NOT NULL,
  `Postcode` varchar(20) NOT NULL,
  PRIMARY KEY (`CheckoutLocationID`),
  UNIQUE KEY `LocationName` (`LocationName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CheckoutLocation`
--

LOCK TABLES `CheckoutLocation` WRITE;
/*!40000 ALTER TABLE `CheckoutLocation` DISABLE KEYS */;
INSERT INTO `CheckoutLocation` VALUES (1,'Online','N/A','N/A','N/A','N/A','N/A'),(2,'Main Branch','23','Park Lane','Oakford','Lancanshire','LA12 6YZ'),(3,'Branch B','8','Elm Street','Birchwood','Lancanshire','LA12 7AB'),(4,'Branch C','11','Maple Avenue','Ashford','Kent','TN23 4CD');
/*!40000 ALTER TABLE `CheckoutLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre` (
  `GenreID` int NOT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
INSERT INTO `Genre` VALUES (1,'Fantasy'),(2,'Young Adult'),(3,'Mystery'),(4,'Thriller'),(5,'Historical Fiction'),(6,'Fiction'),(7,'Romance'),(8,'Dystopian');
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransactionType`
--

DROP TABLE IF EXISTS `TransactionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TransactionType` (
  `TransactionTypeID` int NOT NULL AUTO_INCREMENT,
  `TransactionAction` varchar(10) NOT NULL,
  PRIMARY KEY (`TransactionTypeID`),
  UNIQUE KEY `TransactionAction` (`TransactionAction`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransactionType`
--

LOCK TABLES `TransactionType` WRITE;
/*!40000 ALTER TABLE `TransactionType` DISABLE KEYS */;
INSERT INTO `TransactionType` VALUES (1,'Borrow'),(2,'Renew'),(3,'Return');
/*!40000 ALTER TABLE `TransactionType` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-18  0:01:55
