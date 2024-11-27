CREATE DATABASE IF NOT EXISTS `kea_cars_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kea_cars_dev`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: kea-cars.mysql.database.azure.com    Database: kea_cars_dev
-- ------------------------------------------------------
-- Server version	8.0.37-azure

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
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessories` (
  `id` char(36) NOT NULL,
  `name` varchar(60) NOT NULL,
  `price` double unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accessory_name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
INSERT INTO `accessories` VALUES ('0d61b4ee-2c27-400c-9ff5-38123284626c','Air Conditioning',99.95),('0f5a86c2-1db5-4486-b5e4-33b92fa3e741','Alloy Wheels',99.95),('31a9c926-cd49-4714-9be4-e145b982417e','Bluetooth Connectivity',99.95),('5b55aa29-8eb8-4f83-8110-f2bb50e7d08c','Sport Package',99.95),('5f94dd2c-6d3b-4f51-82e2-c3009b42250a','Keyless Entry',99.95),('6b00d785-bdb8-4441-9590-04938eefa481','Tow Hitch',99.95),('713d1b90-93e4-411e-8a63-6c6de9729641','Roof Rack',99.95),('7425be25-07cc-4167-b00d-6d1804026c17','GPS Navigation',99.95),('78ba9e9a-d693-4d71-b330-092928fe7123','Parking Sensors',99.95),('8466ac46-1926-4969-875c-825f58d8ef64','Premium Sound System',99.95),('8ac0c1eb-d36f-4a0c-9520-c9ec954f6948','Rear Spoiler',99.95),('8e637319-526c-4597-ad23-71eae78bde94','Cruise Control',99.95),('a0f75999-89b1-4120-9423-f6951d13334b','Fog Lights',99.95),('a191672a-5efa-4ac5-85c2-679c1708a176','Sunroof',99.95),('b09c572c-25b6-4f70-99f8-9d2817e5c1e5','Leather Seats',99.95),('c7114d43-1a56-482f-b46b-80878586462a','Electric Seats',99.95),('dab9106c-cf97-498b-8ed6-f5c02488f584','Backup Camera',99.95),('e620ec3c-625d-4bde-9b77-f7449b6352d5','Adaptive Headlights',99.95),('e7858d25-49e7-4ad5-821c-100de2b18918','Tinted Windows',99.95),('fc8f689e-9615-4cf6-9664-31400db7ebea','Heated Seats',99.95);
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` char(36) NOT NULL,
  `name` varchar(60) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brand_name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES ('83e36635-548d-491a-9e5f-3fafaab02ba0','Mercedes','https://keacar.ams3.cdn.digitaloceanspaces.com/Mercedes-logo.png'),('8bb880b8-e336-4039-ad86-2f758539e454','Ford','https://keacar.ams3.cdn.digitaloceanspaces.com/Ford-logo.png'),('fadeb491-9cde-4534-b855-b1ada31e2b47','Skoda','https://keacar.ams3.cdn.digitaloceanspaces.com/Skoda-logo.png'),('feb2efdb-93ee-4f45-88b1-5e4086c00334','BMW','https://keacar.ams3.cdn.digitaloceanspaces.com/bmw-logo.png'),('fff14a06-dc2a-447d-a707-9c03fe00c7a0','Audi','https://keacar.ams3.cdn.digitaloceanspaces.com/Audi-logo.png');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `car_purchase_view`
--

DROP TABLE IF EXISTS `car_purchase_view`;
/*!50001 DROP VIEW IF EXISTS `car_purchase_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `car_purchase_view` AS SELECT 
 1 AS `car_id`,
 1 AS `purchase_id`,
 1 AS `sales_person_id`,
 1 AS `customer_id`,
 1 AS `is_past_deadline`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `id` char(36) NOT NULL,
  `models_id` char(36) NOT NULL,
  `colors_id` char(36) NOT NULL,
  `customers_id` char(36) NOT NULL,
  `sales_people_id` char(36) NOT NULL,
  `total_price` double unsigned NOT NULL,
  `purchase_deadline` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cars_models1_idx` (`models_id`),
  KEY `fk_cars_colors1_idx` (`colors_id`),
  KEY `fk_cars_customers1_idx` (`customers_id`),
  KEY `fk_cars_sales_people1_idx` (`sales_people_id`),
  CONSTRAINT `fk_cars_colors1` FOREIGN KEY (`colors_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `fk_cars_customers1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cars_models1` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`),
  CONSTRAINT `fk_cars_sales_people1` FOREIGN KEY (`sales_people_id`) REFERENCES `sales_people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES ('0be86135-c58f-43b6-a369-a3c5445b9948','d4bd413c-00d8-45ce-be0e-1d1333ac5e75','7bb35b1d-37ff-43c2-988a-cf85c5b6d690','f159bdaf-bc83-46c3-8a3f-f6b5c93ebbdc','f9097a97-eca4-49b6-85a0-08423789c320',10530.8,'2024-12-07'),('a1b1e305-1a89-4b06-86d1-21ac1fa3c8a6','d4bd413c-00d8-45ce-be0e-1d1333ac5e75','7bb35b1d-37ff-43c2-988a-cf85c5b6d690','f159bdaf-bc83-46c3-8a3f-f6b5c93ebbdc','d096d2e1-f06a-4555-9cd1-afa9f930f10c',10530.8,'2024-12-04'),('a5503fbb-c388-4789-a10c-d7ae7bdf7408','d4bd413c-00d8-45ce-be0e-1d1333ac5e75','7bb35b1d-37ff-43c2-988a-cf85c5b6d690','f159bdaf-bc83-46c3-8a3f-f6b5c93ebbdc','f9097a97-eca4-49b6-85a0-08423789c320',10530.8,'2024-12-05'),('d4c7f1f8-4451-43bc-a827-63216a2ddece','d4bd413c-00d8-45ce-be0e-1d1333ac5e75','7bb35b1d-37ff-43c2-988a-cf85c5b6d690','0ac1d668-55aa-46a1-898a-8fa61457facb','f9097a97-eca4-49b6-85a0-08423789c320',10530.8,'2024-12-04');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars_has_accessories`
--

DROP TABLE IF EXISTS `cars_has_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_has_accessories` (
  `cars_id` char(36) NOT NULL,
  `accessories_id` char(36) NOT NULL,
  PRIMARY KEY (`cars_id`,`accessories_id`),
  KEY `fk_cars_has_accessories_accessories1_idx` (`accessories_id`),
  KEY `fk_cars_has_accessories_cars1_idx` (`cars_id`),
  CONSTRAINT `fk_cars_has_accessories_accessories1` FOREIGN KEY (`accessories_id`) REFERENCES `accessories` (`id`),
  CONSTRAINT `fk_cars_has_accessories_cars1` FOREIGN KEY (`cars_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_has_accessories`
--

LOCK TABLES `cars_has_accessories` WRITE;
/*!40000 ALTER TABLE `cars_has_accessories` DISABLE KEYS */;
INSERT INTO `cars_has_accessories` VALUES ('0be86135-c58f-43b6-a369-a3c5445b9948','e7858d25-49e7-4ad5-821c-100de2b18918'),('a1b1e305-1a89-4b06-86d1-21ac1fa3c8a6','e7858d25-49e7-4ad5-821c-100de2b18918'),('a5503fbb-c388-4789-a10c-d7ae7bdf7408','e7858d25-49e7-4ad5-821c-100de2b18918'),('d4c7f1f8-4451-43bc-a827-63216a2ddece','e7858d25-49e7-4ad5-821c-100de2b18918');
/*!40000 ALTER TABLE `cars_has_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars_has_insurances`
--

DROP TABLE IF EXISTS `cars_has_insurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_has_insurances` (
  `cars_id` char(36) NOT NULL,
  `insurances_id` char(36) NOT NULL,
  PRIMARY KEY (`cars_id`,`insurances_id`),
  KEY `fk_cars_has_insurances_insurances1_idx` (`insurances_id`),
  KEY `fk_cars_has_insurances_cars1_idx` (`cars_id`),
  CONSTRAINT `fk_cars_has_insurances_cars1` FOREIGN KEY (`cars_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cars_has_insurances_insurances1` FOREIGN KEY (`insurances_id`) REFERENCES `insurances` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_has_insurances`
--

LOCK TABLES `cars_has_insurances` WRITE;
/*!40000 ALTER TABLE `cars_has_insurances` DISABLE KEYS */;
INSERT INTO `cars_has_insurances` VALUES ('0be86135-c58f-43b6-a369-a3c5445b9948','37074fac-26da-4e38-9ae6-acbe755359e5'),('a1b1e305-1a89-4b06-86d1-21ac1fa3c8a6','37074fac-26da-4e38-9ae6-acbe755359e5'),('a5503fbb-c388-4789-a10c-d7ae7bdf7408','37074fac-26da-4e38-9ae6-acbe755359e5'),('d4c7f1f8-4451-43bc-a827-63216a2ddece','37074fac-26da-4e38-9ae6-acbe755359e5');
/*!40000 ALTER TABLE `cars_has_insurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` char(36) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` double unsigned NOT NULL DEFAULT '0',
  `red_value` tinyint unsigned NOT NULL,
  `green_value` tinyint unsigned NOT NULL,
  `blue_value` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `color_name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES ('14382aba-6fe6-405d-a5e2-0b8cfd1f9582','silver',299.95,192,192,192),('5e755eb3-0099-4cdd-b064-d8bd95968109','blue',99.95,0,0,255),('74251648-a7b1-492a-ab2a-f2248c58da00','red',199.95,255,0,0),('7bb35b1d-37ff-43c2-988a-cf85c5b6d690','white',399.95,255,255,255),('e2164054-4cb8-49d5-a0da-eca5b36a0b3b','black',0,0,0,0);
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` char(36) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('0ac1d668-55aa-46a1-898a-8fa61457facb','henrik@gmail.com','10203040','Henrik','Henriksen','Randomgade nr. 10 4. tv.'),('bbbb06bc-268d-4f88-8b8e-3da4df118328','oli@oli.dk','12345678','Oliver','Jorgensen','asdasd123'),('daf830ad-be98-4f95-8fa8-3dc7efa540fe','tom@gmail.com','12345678','Tom','Tomsen','Test 21'),('f159bdaf-bc83-46c3-8a3f-f6b5c93ebbdc','james@gmail.com','12345678','James','Jamesen','Test 21'),('fc40f99e-13f0-460d-b79d-f75206acdd07','test@test.dk','12345678','Test','Teste','Test 21');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;

DROP TRIGGER IF EXISTS customers_BEFORE_DELETE;
DELIMITER //
CREATE TRIGGER customers_BEFORE_DELETE
BEFORE DELETE ON customers
FOR EACH ROW
BEGIN
	DELETE FROM purchases
    WHERE cars_id IN (
        SELECT id FROM cars
        WHERE customers_id = OLD.id
    );
END //
DELIMITER ;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `insurances`
--

DROP TABLE IF EXISTS `insurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurances` (
  `id` char(36) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` double unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `insurance_name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurances`
--

LOCK TABLES `insurances` WRITE;
/*!40000 ALTER TABLE `insurances` DISABLE KEYS */;
INSERT INTO `insurances` VALUES ('37074fac-26da-4e38-9ae6-acbe755359e5','Earthquake',29.95),('3e9a0efb-f1a1-4757-b4c3-985fc856b8d5','Hauntings',39.95),('76b21d38-2103-4464-84f2-c87178e4a30c','Broken Window',19.95),('8456043d-5fb0-49bf-ac2c-51567a32cc87','Flat Tire',9.95),('a80a8bed-e1a2-462f-8a77-9483e757c0f2','Water Damage',49.95);
/*!40000 ALTER TABLE `insurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `models` (
  `id` char(36) NOT NULL,
  `brands_id` char(36) NOT NULL,
  `name` varchar(60) NOT NULL,
  `price` double unsigned NOT NULL,
  `image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_models_brands1_idx` (`brands_id`),
  CONSTRAINT `fk_models_brands1` FOREIGN KEY (`brands_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES ('053b1148-1bb6-4445-85b1-9f71db5b7143','fff14a06-dc2a-447d-a707-9c03fe00c7a0','A4',10000.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/a4.png'),('1de1b6d3-da97-440b-ba3b-1c865e1de47f','8bb880b8-e336-4039-ad86-2f758539e454','Mustang',10990.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/mustang.png'),('37c7b96c-4142-4890-a1c0-cdb4ff95606e','8bb880b8-e336-4039-ad86-2f758539e454','Explorer',10990.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/explorer.png'),('41e96e21-7e57-45aa-8462-35fe83565866','fadeb491-9cde-4534-b855-b1ada31e2b47','Kodiaq',19999.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/kodiaq.png'),('44bb8524-0b5d-4451-9d20-9bdafe6f8808','fadeb491-9cde-4534-b855-b1ada31e2b47','Yeti',19999.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/yeti.png'),('45395bf5-431b-4643-bce0-c8a3bdba3a63','fff14a06-dc2a-447d-a707-9c03fe00c7a0','A6',10000.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/a6.png'),('460200f8-4e2d-47ad-b65e-e5e333c7ed4b','fadeb491-9cde-4534-b855-b1ada31e2b47','Octavia',19999.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/octavia.png'),('48daf651-f67d-465e-8e14-fc02997c8cf9','fadeb491-9cde-4534-b855-b1ada31e2b47','Rapid',19999.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/rapid.png'),('4bcd231c-8d2c-4c9e-a850-12f5e74edef5','feb2efdb-93ee-4f45-88b1-5e4086c00334','Series 3',10090.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/Series_3.png'),('552bac65-bd5e-4dcd-8f50-cb5b1816d8b3','83e36635-548d-491a-9e5f-3fafaab02ba0','S-Class',19990.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/s-class.png'),('65e666f1-ea52-4982-a1e7-0f164891fee2','fadeb491-9cde-4534-b855-b1ada31e2b47','Citigo',19999.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/citigo.png'),('77dc2097-6d49-4fc9-bd1a-b0221af35dc6','8bb880b8-e336-4039-ad86-2f758539e454','Fiesta',10990.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/fiesta.png'),('78b4d92e-fa14-4081-9e77-71cd2bad502c','feb2efdb-93ee-4f45-88b1-5e4086c00334','i8',10090.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/i8.png'),('866a22d1-0ea1-458d-9a12-e5206d6ed8fc','fff14a06-dc2a-447d-a707-9c03fe00c7a0','A1',10000.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/a1.png'),('8ce88a9b-3275-4fea-86ac-2c15b92a6727','8bb880b8-e336-4039-ad86-2f758539e454','Fusion',10990.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/fusion.png'),('8f599259-538f-4b3e-bc3b-50daa8f5fd96','feb2efdb-93ee-4f45-88b1-5e4086c00334','Series 2',10090.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/Series_2.png'),('996f735f-b06d-426e-ac5b-e90827d92707','fff14a06-dc2a-447d-a707-9c03fe00c7a0','A3',10000.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/a3.png'),('ad88f9d8-db4e-4527-b2c7-8abbb475467b','feb2efdb-93ee-4f45-88b1-5e4086c00334','X6',10090.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/X6.png'),('be927e18-6bd4-491c-b031-73a569afa00b','83e36635-548d-491a-9e5f-3fafaab02ba0','A-Class',19990.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/a-class.png'),('d4bd413c-00d8-45ce-be0e-1d1333ac5e75','fff14a06-dc2a-447d-a707-9c03fe00c7a0','R8',10000.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/r8.png'),('d96e68ef-4f6f-4623-9c7b-7c4df75ff032','83e36635-548d-491a-9e5f-3fafaab02ba0','C-Class',19990.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/c-class.png'),('deec07da-2049-484f-adc8-2fea95708964','83e36635-548d-491a-9e5f-3fafaab02ba0','G-Class',19990.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/g-class.png'),('ed996516-a141-4f4e-8991-3edeaba81c14','feb2efdb-93ee-4f45-88b1-5e4086c00334','Series 1',10090.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/Series_1.png'),('fa967f9a-598b-4240-ac49-70ad190795af','8bb880b8-e336-4039-ad86-2f758539e454','Pickup',10990.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/pickup.png'),('fb98b121-6648-4a82-b05c-6793b419c1c9','83e36635-548d-491a-9e5f-3fafaab02ba0','AmgGT',19990.95,'https://keacar.ams3.cdn.digitaloceanspaces.com/amgGT.png');
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models_has_colors`
--

DROP TABLE IF EXISTS `models_has_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `models_has_colors` (
  `models_id` char(36) NOT NULL,
  `colors_id` char(36) NOT NULL,
  PRIMARY KEY (`models_id`,`colors_id`),
  KEY `fk_models_has_colors_colors1_idx` (`colors_id`),
  KEY `fk_models_has_colors_models1_idx` (`models_id`),
  CONSTRAINT `fk_models_has_colors_colors1` FOREIGN KEY (`colors_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `fk_models_has_colors_models1` FOREIGN KEY (`models_id`) REFERENCES `models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models_has_colors`
--

LOCK TABLES `models_has_colors` WRITE;
/*!40000 ALTER TABLE `models_has_colors` DISABLE KEYS */;
INSERT INTO `models_has_colors` VALUES ('65e666f1-ea52-4982-a1e7-0f164891fee2','14382aba-6fe6-405d-a5e2-0b8cfd1f9582'),('77dc2097-6d49-4fc9-bd1a-b0221af35dc6','14382aba-6fe6-405d-a5e2-0b8cfd1f9582'),('866a22d1-0ea1-458d-9a12-e5206d6ed8fc','14382aba-6fe6-405d-a5e2-0b8cfd1f9582'),('be927e18-6bd4-491c-b031-73a569afa00b','14382aba-6fe6-405d-a5e2-0b8cfd1f9582'),('ed996516-a141-4f4e-8991-3edeaba81c14','14382aba-6fe6-405d-a5e2-0b8cfd1f9582'),('44bb8524-0b5d-4451-9d20-9bdafe6f8808','5e755eb3-0099-4cdd-b064-d8bd95968109'),('45395bf5-431b-4643-bce0-c8a3bdba3a63','5e755eb3-0099-4cdd-b064-d8bd95968109'),('460200f8-4e2d-47ad-b65e-e5e333c7ed4b','5e755eb3-0099-4cdd-b064-d8bd95968109'),('65e666f1-ea52-4982-a1e7-0f164891fee2','5e755eb3-0099-4cdd-b064-d8bd95968109'),('77dc2097-6d49-4fc9-bd1a-b0221af35dc6','5e755eb3-0099-4cdd-b064-d8bd95968109'),('866a22d1-0ea1-458d-9a12-e5206d6ed8fc','5e755eb3-0099-4cdd-b064-d8bd95968109'),('8ce88a9b-3275-4fea-86ac-2c15b92a6727','5e755eb3-0099-4cdd-b064-d8bd95968109'),('8f599259-538f-4b3e-bc3b-50daa8f5fd96','5e755eb3-0099-4cdd-b064-d8bd95968109'),('996f735f-b06d-426e-ac5b-e90827d92707','5e755eb3-0099-4cdd-b064-d8bd95968109'),('ad88f9d8-db4e-4527-b2c7-8abbb475467b','5e755eb3-0099-4cdd-b064-d8bd95968109'),('be927e18-6bd4-491c-b031-73a569afa00b','5e755eb3-0099-4cdd-b064-d8bd95968109'),('d96e68ef-4f6f-4623-9c7b-7c4df75ff032','5e755eb3-0099-4cdd-b064-d8bd95968109'),('deec07da-2049-484f-adc8-2fea95708964','5e755eb3-0099-4cdd-b064-d8bd95968109'),('ed996516-a141-4f4e-8991-3edeaba81c14','5e755eb3-0099-4cdd-b064-d8bd95968109'),('fa967f9a-598b-4240-ac49-70ad190795af','5e755eb3-0099-4cdd-b064-d8bd95968109'),('053b1148-1bb6-4445-85b1-9f71db5b7143','74251648-a7b1-492a-ab2a-f2248c58da00'),('37c7b96c-4142-4890-a1c0-cdb4ff95606e','74251648-a7b1-492a-ab2a-f2248c58da00'),('48daf651-f67d-465e-8e14-fc02997c8cf9','74251648-a7b1-492a-ab2a-f2248c58da00'),('4bcd231c-8d2c-4c9e-a850-12f5e74edef5','74251648-a7b1-492a-ab2a-f2248c58da00'),('552bac65-bd5e-4dcd-8f50-cb5b1816d8b3','74251648-a7b1-492a-ab2a-f2248c58da00'),('65e666f1-ea52-4982-a1e7-0f164891fee2','74251648-a7b1-492a-ab2a-f2248c58da00'),('77dc2097-6d49-4fc9-bd1a-b0221af35dc6','74251648-a7b1-492a-ab2a-f2248c58da00'),('866a22d1-0ea1-458d-9a12-e5206d6ed8fc','74251648-a7b1-492a-ab2a-f2248c58da00'),('be927e18-6bd4-491c-b031-73a569afa00b','74251648-a7b1-492a-ab2a-f2248c58da00'),('ed996516-a141-4f4e-8991-3edeaba81c14','74251648-a7b1-492a-ab2a-f2248c58da00'),('053b1148-1bb6-4445-85b1-9f71db5b7143','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('1de1b6d3-da97-440b-ba3b-1c865e1de47f','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('37c7b96c-4142-4890-a1c0-cdb4ff95606e','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('41e96e21-7e57-45aa-8462-35fe83565866','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('44bb8524-0b5d-4451-9d20-9bdafe6f8808','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('45395bf5-431b-4643-bce0-c8a3bdba3a63','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('460200f8-4e2d-47ad-b65e-e5e333c7ed4b','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('48daf651-f67d-465e-8e14-fc02997c8cf9','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('4bcd231c-8d2c-4c9e-a850-12f5e74edef5','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('552bac65-bd5e-4dcd-8f50-cb5b1816d8b3','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('65e666f1-ea52-4982-a1e7-0f164891fee2','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('77dc2097-6d49-4fc9-bd1a-b0221af35dc6','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('78b4d92e-fa14-4081-9e77-71cd2bad502c','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('866a22d1-0ea1-458d-9a12-e5206d6ed8fc','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('8ce88a9b-3275-4fea-86ac-2c15b92a6727','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('8f599259-538f-4b3e-bc3b-50daa8f5fd96','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('996f735f-b06d-426e-ac5b-e90827d92707','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('ad88f9d8-db4e-4527-b2c7-8abbb475467b','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('be927e18-6bd4-491c-b031-73a569afa00b','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('d4bd413c-00d8-45ce-be0e-1d1333ac5e75','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('d96e68ef-4f6f-4623-9c7b-7c4df75ff032','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('deec07da-2049-484f-adc8-2fea95708964','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('ed996516-a141-4f4e-8991-3edeaba81c14','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('fa967f9a-598b-4240-ac49-70ad190795af','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('fb98b121-6648-4a82-b05c-6793b419c1c9','7bb35b1d-37ff-43c2-988a-cf85c5b6d690'),('053b1148-1bb6-4445-85b1-9f71db5b7143','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('1de1b6d3-da97-440b-ba3b-1c865e1de47f','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('37c7b96c-4142-4890-a1c0-cdb4ff95606e','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('41e96e21-7e57-45aa-8462-35fe83565866','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('44bb8524-0b5d-4451-9d20-9bdafe6f8808','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('45395bf5-431b-4643-bce0-c8a3bdba3a63','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('460200f8-4e2d-47ad-b65e-e5e333c7ed4b','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('48daf651-f67d-465e-8e14-fc02997c8cf9','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('4bcd231c-8d2c-4c9e-a850-12f5e74edef5','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('552bac65-bd5e-4dcd-8f50-cb5b1816d8b3','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('65e666f1-ea52-4982-a1e7-0f164891fee2','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('77dc2097-6d49-4fc9-bd1a-b0221af35dc6','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('78b4d92e-fa14-4081-9e77-71cd2bad502c','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('866a22d1-0ea1-458d-9a12-e5206d6ed8fc','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('8ce88a9b-3275-4fea-86ac-2c15b92a6727','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('8f599259-538f-4b3e-bc3b-50daa8f5fd96','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('996f735f-b06d-426e-ac5b-e90827d92707','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('ad88f9d8-db4e-4527-b2c7-8abbb475467b','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('be927e18-6bd4-491c-b031-73a569afa00b','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('d4bd413c-00d8-45ce-be0e-1d1333ac5e75','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('d96e68ef-4f6f-4623-9c7b-7c4df75ff032','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('deec07da-2049-484f-adc8-2fea95708964','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('ed996516-a141-4f4e-8991-3edeaba81c14','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('fa967f9a-598b-4240-ac49-70ad190795af','e2164054-4cb8-49d5-a0da-eca5b36a0b3b'),('fb98b121-6648-4a82-b05c-6793b419c1c9','e2164054-4cb8-49d5-a0da-eca5b36a0b3b');
/*!40000 ALTER TABLE `models_has_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` char(36) NOT NULL,
  `cars_id` char(36) NOT NULL,
  `date_of_purchase` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cars_id_UNIQUE` (`cars_id`),
  KEY `fk_purchases_cars1_idx` (`cars_id`),
  CONSTRAINT `fk_purchases_cars1` FOREIGN KEY (`cars_id`) REFERENCES `cars` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES ('bdfca7c4-e0ad-4618-8766-9bb355371c81','d4c7f1f8-4451-43bc-a827-63216a2ddece','2024-11-04');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_people`
--

DROP TABLE IF EXISTS `sales_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_people` (
  `id` char(36) NOT NULL,
  `email` varchar(100) NOT NULL,
  `hashed_password` varchar(130) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_person_email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_people`
--

LOCK TABLES `sales_people` WRITE;
/*!40000 ALTER TABLE `sales_people` DISABLE KEYS */;
INSERT INTO `sales_people` VALUES ('d096d2e1-f06a-4555-9cd1-afa9f930f10c','james@gmail.com','$2b$10$sB6/ocJJK9HodVv7qEozKO826Ik5gmZH/1GU/xReM1ijIjlA7hvTa','James','Jamesen'),('f9097a97-eca4-49b6-85a0-08423789c320','hans@gmail.com','$2b$12$BKrnHSqhmb8NsKnUhhSGWeOj0Pnyx0so0xeXlUrDrNLplk2VnjDyK','Hans','Hansen');
/*!40000 ALTER TABLE `sales_people` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping routines for database 'kea_cars_dev'
--
/*!50003 DROP FUNCTION IF EXISTS `is_past_deadline` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE FUNCTION `is_past_deadline`(purchase_deadline DATE, purchase_id VARCHAR(36)) 
RETURNS tinyint(1)
DETERMINISTIC
BEGIN
    DECLARE expired BOOLEAN;
    IF purchase_deadline < CURDATE() AND purchase_id IS NULL THEN
        SET expired = TRUE;
    ELSE
        SET expired = FALSE;
    END IF;
    RETURN expired;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `matches_filters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE FUNCTION `matches_filters`(
    p_customer_id CHAR(36),
    p_sales_person_id CHAR(36),
    p_is_purchased BOOLEAN,
    p_is_past_purchase_deadline BOOLEAN,
    p_current_date DATE,
    car_customer_id CHAR(36),
    car_sales_person_id CHAR(36),
    purchase_car_id CHAR(36),
    car_purchase_deadline DATE
) RETURNS tinyint(1)
DETERMINISTIC
BEGIN
    RETURN (
        (p_customer_id IS NULL OR car_customer_id = p_customer_id)
        AND (p_sales_person_id IS NULL OR car_sales_person_id = p_sales_person_id)
        AND (
            p_is_purchased IS NULL OR 
            (p_is_purchased = TRUE AND purchase_car_id IS NOT NULL) OR 
            (p_is_purchased = FALSE AND purchase_car_id IS NULL)
        )
        AND (
            p_is_past_purchase_deadline IS NULL OR 
            (p_is_past_purchase_deadline = TRUE AND car_purchase_deadline < p_current_date) OR 
            (p_is_past_purchase_deadline = FALSE AND car_purchase_deadline >= p_current_date)
        )
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `set_limit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE FUNCTION `set_limit`(input_limit INT) RETURNS int
DETERMINISTIC
BEGIN
    DECLARE result_limit INT;
    SET result_limit = IFNULL(input_limit, 2147483647);  -- returns 2147483647 if input is NULL
    RETURN result_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_cars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `get_all_cars`(
    IN p_customer_id CHAR(36),
    IN p_sales_person_id CHAR(36),
    IN p_is_purchased BOOLEAN,
    IN p_is_past_purchase_deadline BOOLEAN,
    IN p_current_date DATE,
    IN p_limit INT
)
BEGIN
    -- Use set_limit function to handle the limit
    SET p_limit = set_limit(p_limit);

    -- Select cars with the specified filters
    SELECT 
        car.id
    FROM 
        cars AS car
    LEFT JOIN 
        purchases AS purchase ON car.id = purchase.cars_id
    WHERE 
        matches_filters(
            p_customer_id,
            p_sales_person_id,
            p_is_purchased,
            p_is_past_purchase_deadline,
            p_current_date,
            car.customers_id,
            car.sales_people_id,
            purchase.cars_id,
            car.purchase_deadline
        )
    LIMIT p_limit;
END ;;
DELIMITER ;

--
-- View structure for view `car_purchase_view`
--
DROP VIEW IF EXISTS `car_purchase_view`;

CREATE
    ALGORITHM = UNDEFINED
    SQL SECURITY DEFINER
VIEW `car_purchase_view` AS
    SELECT
        car.id AS car_id,
        purchase.id AS purchase_id,
        car.sales_people_id AS sales_person_id,
        car.customers_id AS customer_id,
        IS_PAST_DEADLINE(car.purchase_deadline, purchase.id) AS is_past_deadline
    FROM
        `cars` car
        LEFT JOIN `purchases` purchase ON purchase.cars_id = car.id;

