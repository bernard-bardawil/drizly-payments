-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `entry_id` varchar(455) NOT NULL,
  `payment_id` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `amount` varchar(55) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `purpose` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES ('2024c54e-6c28-4f28-a23e-71a8aafa6a49','04eef56f-8c6b-47ea-88c8-393e63a8d444','2021-09-21 00:00:00','20','USD','debit','fee','merhant'),('39047dba-8346-4ae3-b463-578143f7d27e','ff616ba3-3f35-462d-8e7e-39ff7d9d09c0','2021-09-21 00:00:00','10','USD','debit','merchandise','merhant'),('49a62e16-486c-4d07-ad89-4aa64371aa91','2ecb4c9c-acad-4f37-ac1f-054cae1ee761','2021-09-21 00:00:00','10','USD','debit','merchandise','merhant'),('51dea461-2ca4-4f20-bc74-f0fc9c50fb77','14b17554-bccc-45ad-a95c-1e5020a889a0','2021-09-21 00:00:00','10','USD','debit','merchandise','merhant'),('a5c7d7a8-ace2-41b8-838e-b03b052b4f60','5de37645-bc56-4773-ad71-4fd6214fc3a6','2021-09-21 00:00:00','20','USD','debit','fee','merhant'),('feaa7b87-8378-4c05-8c2e-82ebabba3813','712e8311-fcc3-4cc1-ad6f-9de646ed857a','2021-09-21 00:00:00','10','USD','debit','merchandise','merhant');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` varchar(255) NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES ('2024c54e-6c28-4f28-a23e-71a8aafa6a49','04eef56f-8c6b-47ea-88c8-393e63a8d444','2021-09-21 00:00:00','no details','authorized'),('39047dba-8346-4ae3-b463-578143f7d27e','ff616ba3-3f35-462d-8e7e-39ff7d9d09c0','2021-09-21 00:00:00','no details','authorized'),('49a62e16-486c-4d07-ad89-4aa64371aa91','2ecb4c9c-acad-4f37-ac1f-054cae1ee761','2021-09-21 00:00:00','no details','authorized'),('51dea461-2ca4-4f20-bc74-f0fc9c50fb77','14b17554-bccc-45ad-a95c-1e5020a889a0','2021-09-21 00:00:00','no details','authorized'),('a5c7d7a8-ace2-41b8-838e-b03b052b4f60','5de37645-bc56-4773-ad71-4fd6214fc3a6','2021-09-21 00:00:00','no details','authorized'),('feaa7b87-8378-4c05-8c2e-82ebabba3813','712e8311-fcc3-4cc1-ad6f-9de646ed857a','2021-09-21 00:00:00','no details','authorized');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method_selection`
--

DROP TABLE IF EXISTS `payment_method_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method_selection` (
  `payment_method_selection` varchar(255) NOT NULL,
  `payment_id` varchar(45) DEFAULT NULL,
  `payment_method_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`payment_method_selection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method_selection`
--

LOCK TABLES `payment_method_selection` WRITE;
/*!40000 ALTER TABLE `payment_method_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_method_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `payment_method_id` varchar(255) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `vault` varchar(45) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `last4` varchar(45) DEFAULT NULL,
  `amount` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` varchar(255) NOT NULL,
  `created_date` date NOT NULL,
  `updated_date` date DEFAULT NULL,
  `authorized_date` date DEFAULT NULL,
  `order_id` varchar(255) NOT NULL,
  `store_order_id` varchar(255) DEFAULT NULL,
  `store_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `processor` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
INSERT INTO `Payments` VALUES ('04eef56f-8c6b-47ea-88c8-393e63a8d444','2021-09-21',NULL,NULL,'AQEBwJnKyrHigUMZj6rYigCgxlaS3SLy0a','store_order_id_2',NULL,'user_id_1','braintree','authorized'),('14b17554-bccc-45ad-a95c-1e5020a889a0','2021-09-21',NULL,NULL,'AQEBwJnKyrHigUMZj6rYigCgxlaS3SLy0a','store_order_id_1',NULL,'user_id_1','stripe','authorized'),('2ecb4c9c-acad-4f37-ac1f-054cae1ee761','2021-09-21',NULL,NULL,'AQEBwJnKyrHigUMZj6rYigCgxlaS3SLy0a','store_order_id_1',NULL,'user_id_1','stripe','authorized'),('5de37645-bc56-4773-ad71-4fd6214fc3a6','2021-09-21',NULL,NULL,'AQEBwJnKyrHigUMZj6rYigCgxlaS3SLy0a','store_order_id_2',NULL,'user_id_1','braintree','authorized'),('712e8311-fcc3-4cc1-ad6f-9de646ed857a','2021-09-21',NULL,NULL,'AQEBwJnKyrHigUMZj6rYigCgxlaS3SLy0a','null',NULL,'user_id_1','stripe','authorized'),('ff616ba3-3f35-462d-8e7e-39ff7d9d09c0','2021-09-21',NULL,NULL,'AQEBwJnKyrHigUMZj6rYigCgxlaS3SLy0a','null',NULL,'user_id_1','stripe','authorized');
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-22 15:08:52
