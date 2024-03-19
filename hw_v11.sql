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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `AuthorID` int NOT NULL,
  `Firstname` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Suzanne','Collins'),(2,'Stephenie','Meyer'),(3,'J.K.','Rowling'),(4,'Dan','Brown'),(5,'Gillian','Flynn'),(6,'Paula','Hawkins'),(7,'George R.R.','Martin'),(8,'Kathryn','Stockett'),(9,'John','Green'),(10,'George','Orwell'),(11,'J.D.','Salinger'),(12,'Harper','Lee'),(13,'F. Scott','Fitzgerald'),(14,'Jane','Austen');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `availability`
--

DROP TABLE IF EXISTS `availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `availability` (
  `AvailabilityID` int NOT NULL,
  `Availability` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AvailabilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability`
--

LOCK TABLES `availability` WRITE;
/*!40000 ALTER TABLE `availability` DISABLE KEYS */;
INSERT INTO `availability` VALUES (1,'Available'),(2,'Not Available');
/*!40000 ALTER TABLE `availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
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
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`GenreID`) REFERENCES `genre` (`GenreID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`AvailableID`) REFERENCES `availability` (`AvailabilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Harry Potter and the Philosopher\'s Stone',9780747532743,1,1,1997,320),(2,'Harry Potter and the Chamber of Secrets',9780747538486,1,1,1998,352),(3,'Harry Potter and the Prisoner of Azkaban',9780747542155,1,1,1999,448),(4,'Harry Potter and the Goblet of Fire',9780747591054,1,1,2000,734),(5,'Harry Potter and the Order of the Phoenix',9780439358071,1,1,2003,870),(6,'Harry Potter and the Half-Blood Prince',9780747581086,1,1,2005,652),(7,'Harry Potter and the Deathly Hallows',9780545010221,1,1,2007,759),(8,'The Hunger Games',9780439023481,2,1,2008,374),(9,'Twilight',9780316015844,2,1,2005,498),(10,'The Da Vinci Code',9780307474278,3,1,2003,689),(11,'Gone Girl',9780307588371,4,1,2012,419),(12,'The Girl on the Train',9781594634024,3,2,2015,336),(13,'A Game of Thrones',9780553106633,1,1,1996,694),(14,'The Help',9780425232200,5,1,2009,464),(15,'The Fault in Our Stars',9780525478812,2,1,2012,313),(16,'1984',9780451524935,8,2,1949,328),(17,'The Catcher in the Rye',9780316769488,6,2,1951,277),(18,'To Kill a Mockingbird',9780061120084,6,2,1960,281),(19,'The Great Gatsby',9780743273565,6,2,1925,218),(20,'Pride and Prejudice',9780679783268,7,2,1813,279);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `BookID` int NOT NULL,
  `AuthorID` int NOT NULL,
  PRIMARY KEY (`BookID`,`AuthorID`),
  KEY `AuthorID` (`AuthorID`),
  CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`),
  CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`AuthorID`) REFERENCES `author` (`AuthorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (8,1),(9,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(10,4),(11,5),(12,6),(13,7),(14,8),(15,9),(16,10),(17,11),(18,12),(19,13),(20,14);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
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
  KEY `MemberID` (`MemberID`),
  KEY `BookID` (`BookID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `BookID` FOREIGN KEY (`BookID`) REFERENCES `Book` (`BookID`),
  CONSTRAINT `bookloan_ibfk_1` FOREIGN KEY (`TransactionTypeID`) REFERENCES `transactiontype` (`TransactionTypeID`),
  CONSTRAINT `bookloan_ibfk_2` FOREIGN KEY (`CheckoutLocationID`) REFERENCES `checkoutlocation` (`CheckoutLocationID`),
  CONSTRAINT `EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `MemberID` FOREIGN KEY (`MemberID`) REFERENCES `LibraryMember` (`MemberID`),
  CONSTRAINT `bookloan_chk_1` CHECK ((`RenewalCount` <= 2)),
  CONSTRAINT `check_max_renewal_count` CHECK ((`RenewalCount` <= 2))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookLoan`
--

LOCK TABLES `BookLoan` WRITE;
/*!40000 ALTER TABLE `BookLoan` DISABLE KEYS */;
INSERT INTO `BookLoan` VALUES (1,'01/03/2024','15/03/2024',NULL,11,1,4,1,2,0,0.00),(2,'16/03/2024','22/03/2024',NULL,7,9,15,1,4,0,0.00),(3,'05/03/2024','19/03/2024',NULL,1,5,17,1,4,0,0.00),(4,'16/03/2024','05/04/2024',NULL,7,2,15,2,1,1,0.00),(5,'10/03/2024','24/03/2024',NULL,14,8,14,1,3,0,0.00),(6,'10/03/2024','24/03/2024',NULL,14,8,2,1,3,0,0.00),(7,'01/03/2024','15/03/2024','15/03/2024',11,4,4,3,2,0,0.00),(8,'05/03/2024','19/03/2024','20/03/2024',1,8,17,3,4,0,0.00),(9,'10/03/2024','07/04/2024',NULL,14,7,14,2,1,1,0.00),(10,'22/03/2024','05/04/2024',NULL,20,2,19,1,2,0,0.00),(11,'22/03/2024','19/04/2024',NULL,20,4,19,2,1,1,0.00),(12,'16/03/2024','05/04/2024','04/04/2024',7,2,15,3,4,1,0.00),(13,'22/03/2024','03/05/2024',NULL,20,2,19,2,1,2,0.00),(14,'10/03/2024','24/03/2024','07/04/2024',14,3,2,3,3,0,5.60),(15,'10/03/2024','07/04/2024','07/04/2024',14,3,14,3,3,1,0.00),(16,'06/04/2024','20/04/2024',NULL,19,8,13,1,2,0,0.00),(17,'08/04/2024','20/04/2024',NULL,16,6,7,1,4,0,0.00),(18,'08/04/2024','20/04/2024','30/04/2024',16,2,7,3,4,0,1.60),(19,'06/04/2024','20/04/2024','01/05/2024',19,1,13,3,2,0,2.20),(20,'22/03/2024','03/05/2024','02/05/2024',20,1,19,3,2,2,0.00);
/*!40000 ALTER TABLE `BookLoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkoutlocation`
--

DROP TABLE IF EXISTS `checkoutlocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkoutlocation` (
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
-- Dumping data for table `checkoutlocation`
--

LOCK TABLES `checkoutlocation` WRITE;
/*!40000 ALTER TABLE `checkoutlocation` DISABLE KEYS */;
INSERT INTO `checkoutlocation` VALUES (1,'Online','N/A','N/A','N/A','N/A','N/A'),(2,'Main Branch','23','Park Lane','Oakford','Lancanshire','LA12 6YZ'),(3,'Branch B','8','Elm Street','Birchwood','Lancanshire','LA12 7AB'),(4,'Branch C','11','Maple Avenue','Ashford','Kent','TN23 4CD');
/*!40000 ALTER TABLE `checkoutlocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `person_ID` int NOT NULL,
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `DateOfEmployment` date NOT NULL,
  `ShiftID` int NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `person_ID` (`person_ID`),
  KEY `ShiftID` (`ShiftID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`person_ID`) REFERENCES `persons` (`person_id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'2016-01-05',1),(4,2,'2016-08-11',1),(6,3,'2018-06-20',2),(8,4,'2006-09-27',1),(11,5,'2011-12-12',2),(12,6,'2020-04-27',1),(14,7,'2009-01-14',1),(17,8,'2004-07-21',2),(20,9,'2008-07-18',2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `GenreID` int NOT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Fantasy'),(2,'Young Adult'),(3,'Mystery'),(4,'Thriller'),(5,'Historical Fiction'),(6,'Fiction'),(7,'Romance'),(8,'Dystopian');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibraryMember`
--

DROP TABLE IF EXISTS `LibraryMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LibraryMember` (
  `MemberID` int NOT NULL AUTO_INCREMENT,
  `PersonID` int NOT NULL,
  `MembershipID` int NOT NULL,
  `DateJoined` date NOT NULL,
  `MembershipExpiry` date NOT NULL,
  PRIMARY KEY (`MemberID`),
  KEY `PersonID` (`PersonID`),
  KEY `MembershipID` (`MembershipID`),
  CONSTRAINT `librarymember_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `persons` (`person_id`),
  CONSTRAINT `librarymember_ibfk_2` FOREIGN KEY (`MembershipID`) REFERENCES `Membership` (`MembershipID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibraryMember`
--

LOCK TABLES `LibraryMember` WRITE;
/*!40000 ALTER TABLE `LibraryMember` DISABLE KEYS */;
INSERT INTO `LibraryMember` VALUES (1,12,2,'2023-03-18','2026-03-18'),(2,7,2,'2024-01-04','2027-01-04'),(3,14,1,'2023-05-12','2026-05-12'),(4,9,3,'2023-01-22','2026-01-22'),(5,11,2,'2024-02-10','2027-02-10'),(6,19,1,'2023-03-18','2026-03-18'),(7,1,2,'2024-01-04','2027-01-04'),(8,15,1,'2023-07-12','2026-07-12'),(9,10,3,'2023-11-20','2026-11-20'),(10,13,1,'2024-02-15','2027-02-15'),(11,16,1,'2021-09-18','2024-09-18'),(12,3,2,'2024-01-04','2027-01-04'),(13,17,1,'2023-05-12','2026-05-12'),(14,2,3,'2022-01-22','2025-01-22'),(15,8,2,'2024-02-10','2027-02-10'),(16,6,3,'2024-02-10','2027-02-10'),(17,18,2,'2022-02-10','2025-02-10'),(18,5,2,'2023-03-21','2026-03-21'),(19,20,3,'2024-02-10','2027-02-10'),(20,4,2,'2024-02-16','2027-02-16');
/*!40000 ALTER TABLE `LibraryMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Membership`
--

DROP TABLE IF EXISTS `Membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Membership` (
  `MembershipID` int NOT NULL AUTO_INCREMENT,
  `MembershipType` varchar(50) NOT NULL,
  PRIMARY KEY (`MembershipID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Membership`
--

LOCK TABLES `Membership` WRITE;
/*!40000 ALTER TABLE `Membership` DISABLE KEYS */;
INSERT INTO `Membership` VALUES (1,'Adult'),(2,'Student'),(3,'Child');
/*!40000 ALTER TABLE `Membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `persons_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'Mickey','Mouse','Disneyland','12345','555-1234','mickeymouse','password123',3),(2,'Minnie','Mouse','Disneyland','12345','555-5678','minniemouse','password456',1),(3,'Donald','Duck','Disneyland','12345','555-4321','donaldduck','password789',1),(4,'Goofy','Goof','Disneyland','12345','555-8765','goofy','password012',2),(5,'Pluto','Dog','Disneyland','12345','555-2109','pluto','password345',1),(6,'Cinderella','Princess','Disney Castle','54321','555-6789','cinderella','password678',3),(7,'Snow','White','Dwarf Cottage','54321','555-9012','snowwhite','password901',1),(8,'Ariel','Mermaid','Under the Sea','54321','555-3456','ariel','password234',3),(9,'Belle','Beauty','Beast Castle','54321','555-7890','belle','password567',1),(10,'Simba','Lion','Pride Rock','54321','555-1234','simba','password890',1),(11,'Mufasa','Lion','Pride Rock','54321','555-5678','mufasa','password123',3),(12,'Timon','Meerkat','Pride Rock','54321','555-4321','timon','password456',2),(13,'Pumbaa','Warthog','Pride Rock','54321','555-8765','pumbaa','password789',1),(14,'Aladdin','Prince','Agrabah','67890','555-9876','aladdin','password012',3),(15,'Jasmine','Princess','Agrabah','67890','555-6543','jasmine','password345',1),(16,'Genie','Genie','Lamp','67890','555-3210','genie','password678',1),(17,'Hercules','Hero','Mount Olympus','67890','555-8765','hercules','password901',3),(18,'Megara','Heroine','Mount Olympus','67890','555-5432','megara','password234',1),(19,'Pocahontas','Princess','Powhatan Village','67890','555-2109','pocahontas','password567',1),(20,'Tarzan','Tarzan','Jungle','67890','555-7890','tarzan','password890',3);
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'member'),(2,'librarian'),(3,'admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `ShiftID` int NOT NULL AUTO_INCREMENT,
  `ShiftName` varchar(50) NOT NULL,
  PRIMARY KEY (`ShiftID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'Week Day'),(2,'Weekend');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiontype`
--

DROP TABLE IF EXISTS `transactiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactiontype` (
  `TransactionTypeID` int NOT NULL AUTO_INCREMENT,
  `TransactionAction` varchar(10) NOT NULL,
  PRIMARY KEY (`TransactionTypeID`),
  UNIQUE KEY `TransactionAction` (`TransactionAction`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiontype`
--

LOCK TABLES `transactiontype` WRITE;
/*!40000 ALTER TABLE `transactiontype` DISABLE KEYS */;
INSERT INTO `transactiontype` VALUES (1,'Borrow'),(2,'Renew'),(3,'Return');
/*!40000 ALTER TABLE `transactiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vemployee_info_shift`
--

DROP TABLE IF EXISTS `vemployee_info_shift`;
/*!50001 DROP VIEW IF EXISTS `vemployee_info_shift`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vemployee_info_shift` AS SELECT 
 1 AS `FullName`,
 1 AS `Full Address`,
 1 AS `EmployeeID`,
 1 AS `role_id`,
 1 AS `ShiftID`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vemployee_info_shift`
--

/*!50001 DROP VIEW IF EXISTS `vemployee_info_shift`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vemployee_info_shift` AS select concat(`persons`.`firstname`,' ',`persons`.`surname`) AS `FullName`,concat(`persons`.`address`,' ',`persons`.`postcode`) AS `Full Address`,`employee`.`EmployeeID` AS `EmployeeID`,`persons`.`role_id` AS `role_id`,`employee`.`ShiftID` AS `ShiftID` from (`persons` left join `employee` on((`persons`.`person_id` = `employee`.`person_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-19 15:15:51
