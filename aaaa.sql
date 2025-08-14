-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ordering_system
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `isActive` enum('Yes','No') DEFAULT 'Yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Burgers','Yes','2025-08-11 04:04:55'),(2,'Fish','Yes','2025-08-11 04:04:55'),(3,'Desserts','Yes','2025-08-11 04:04:55'),(4,'Beef','Yes','2025-08-13 14:29:59'),(5,'Pork','Yes','2025-08-13 14:29:59');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo`
--

DROP TABLE IF EXISTS `combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo` (
  `combo_id` bigint NOT NULL AUTO_INCREMENT,
  `combo_name` varchar(255) NOT NULL,
  `combo_description` varchar(255) NOT NULL,
  `image` longblob,
  `isAvailable` enum('Yes','No') DEFAULT 'Yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`combo_id`),
  UNIQUE KEY `combo_name_UNIQUE` (`combo_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo`
--

LOCK TABLES `combo` WRITE;
/*!40000 ALTER TABLE `combo` DISABLE KEYS */;
INSERT INTO `combo` VALUES (1,'Burger & Water Combo','Classic burger with 500ml water',NULL,'Yes','2025-08-13 14:37:00','2025-08-13 14:37:00',10.99),(2,'Spicy Chicken & Coke','Spicy chicken burger with Coke zero 500ml',NULL,'Yes','2025-08-13 14:37:00','2025-08-13 14:37:00',11.49),(3,'Salmon & Sprite','Grilled salmon with Sprite 500ml',NULL,'Yes','2025-08-13 14:37:01','2025-08-13 14:37:01',16.99),(4,'Fish Tacos & Water','Fish tacos with 1000ml water',NULL,'Yes','2025-08-13 14:37:01','2025-08-13 14:37:01',14.99),(5,'Dessert & Water','Chocolate cake with 500ml water',NULL,'Yes','2025-08-13 14:37:01','2025-08-13 14:37:01',8.99);
/*!40000 ALTER TABLE `combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo_detail`
--

DROP TABLE IF EXISTS `combo_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_detail` (
  `combo_detail_id` bigint NOT NULL AUTO_INCREMENT,
  `combo_id` bigint NOT NULL,
  `quantity` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`combo_detail_id`),
  KEY `asd_idx` (`combo_id`),
  CONSTRAINT `asddfgdfg` FOREIGN KEY (`combo_id`) REFERENCES `combo` (`combo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo_detail`
--

LOCK TABLES `combo_detail` WRITE;
/*!40000 ALTER TABLE `combo_detail` DISABLE KEYS */;
INSERT INTO `combo_detail` VALUES (1,1,1),(2,2,2),(3,3,1),(4,4,1),(5,5,1);
/*!40000 ALTER TABLE `combo_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo_menu`
--

DROP TABLE IF EXISTS `combo_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_menu` (
  `combo_detail_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  KEY `gdfg_idx` (`menu_id`),
  KEY `sdgfsdfsdf_idx` (`combo_detail_id`),
  CONSTRAINT `fdbgdfg1` FOREIGN KEY (`combo_detail_id`) REFERENCES `combo_detail` (`combo_detail_id`),
  CONSTRAINT `sdxasdavsdab` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo_menu`
--

LOCK TABLES `combo_menu` WRITE;
/*!40000 ALTER TABLE `combo_menu` DISABLE KEYS */;
INSERT INTO `combo_menu` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `combo_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo_order`
--

DROP TABLE IF EXISTS `combo_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_order` (
  `order_id` varchar(255) NOT NULL,
  `combo_id` bigint NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  KEY `gdfgbdfgb_idx` (`combo_id`),
  KEY `2v3123v1_idx` (`order_id`),
  CONSTRAINT `2v3123v1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `gdfgbdfgb` FOREIGN KEY (`combo_id`) REFERENCES `combo` (`combo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo_order`
--

LOCK TABLES `combo_order` WRITE;
/*!40000 ALTER TABLE `combo_order` DISABLE KEYS */;
INSERT INTO `combo_order` VALUES ('ORD-001',1,5),('ORD-002',1,5),('ORD-003',3,5),('ORD-004',1,5);
/*!40000 ALTER TABLE `combo_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo_product`
--

DROP TABLE IF EXISTS `combo_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_product` (
  `combo_detail_id` bigint NOT NULL,
  `product_variant_id` bigint NOT NULL,
  KEY `fghfgh_idx` (`combo_detail_id`),
  KEY `bdfgndfg_idx` (`product_variant_id`),
  CONSTRAINT `bdfgndfg` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variant` (`product_variant_id`),
  CONSTRAINT `fghfgh` FOREIGN KEY (`combo_detail_id`) REFERENCES `combo_detail` (`combo_detail_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo_product`
--

LOCK TABLES `combo_product` WRITE;
/*!40000 ALTER TABLE `combo_product` DISABLE KEYS */;
INSERT INTO `combo_product` VALUES (1,1),(2,2),(3,3),(4,4),(5,1);
/*!40000 ALTER TABLE `combo_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `coupon_code` varchar(255) NOT NULL,
  `expiry_date` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rate` decimal(5,3) NOT NULL,
  `used` enum('Not used','Used') NOT NULL DEFAULT 'Not used',
  PRIMARY KEY (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES ('07BED8E967892A0180BE','2025-12-30 16:00:00','2025-08-13 15:45:27',0.300,'Not used'),('0960F6763FD00119C8B6','2025-12-30 16:00:00','2025-08-13 15:45:27',0.300,'Not used'),('0B574467F17B9920C759','2025-12-30 16:00:00','2025-08-14 05:57:08',0.200,'Not used'),('4F41E6909ED458E2285F','2025-12-30 16:00:00','2025-08-13 15:45:27',0.300,'Not used'),('563599DDC484BC65618B','2025-09-11 16:00:00','2025-08-12 13:03:47',0.300,'Used'),('58A105F89BCFFB68F324','2025-12-30 16:00:00','2025-08-13 15:45:27',0.300,'Not used'),('5C4309FFD890F93FDDA2','2025-12-30 16:00:00','2025-08-13 15:45:27',0.300,'Not used'),('8591615F07CF0BD5773F','2025-12-30 16:00:00','2025-08-13 15:45:27',0.300,'Not used'),('919B66AD1E87CE06AF2C','2025-12-30 16:00:00','2025-08-13 15:45:27',0.300,'Not used'),('921B2568FB04687C560D','2025-12-30 16:00:00','2025-08-13 15:45:27',0.300,'Not used'),('A17D35C630B0DF7572C2','2025-09-11 16:00:00','2025-08-12 12:57:04',0.300,'Used'),('C1DEA42E495774848857','2025-09-11 16:00:00','2025-08-12 13:11:00',0.300,'Used'),('C41A0A703F694235F4AF','2025-12-30 16:00:00','2025-08-14 05:57:08',0.200,'Not used'),('C5544AC5785733060CFB','2025-12-30 16:00:00','2025-08-14 05:57:08',0.200,'Not used'),('C650260948AE7EC485CF','2025-12-30 16:00:00','2025-08-14 05:57:08',0.200,'Not used'),('C78AA19496988E017CBA','2025-12-30 16:00:00','2025-08-14 05:57:08',0.200,'Not used'),('D4C2047D0B25DC41363C','2025-12-30 16:00:00','2025-08-13 15:45:27',0.300,'Not used'),('F3B6EB1E9351097004C4','2025-12-30 16:00:00','2025-08-13 15:45:27',0.300,'Not used');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `discount_id` bigint NOT NULL,
  `discount_type` varchar(255) NOT NULL,
  `discount_description` varchar(255) NOT NULL,
  `discount_rate` decimal(10,5) DEFAULT NULL COMMENT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`discount_id`),
  UNIQUE KEY `discount_type_UNIQUE` (`discount_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,'No Discount','yawa',0.00000,'2025-08-12 07:13:06','2025-08-12 07:13:06'),(2,'Discounted','asdasd',0.30000,'2025-08-12 07:13:18','2025-08-12 07:13:18');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingredient_id` bigint NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(255) NOT NULL,
  `current_stock` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ingredient_id`),
  UNIQUE KEY `ingredient_name_UNIQUE` (`ingredient_name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Salt',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(2,'Sugar',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(3,'Flour',985,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(4,'Butter',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(5,'Milk',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(6,'Eggs',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(7,'Yeast',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(8,'Baking Soda',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(9,'Vanilla Extract',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(10,'Olive Oil',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(11,'Vegetable Oil',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(12,'Garlic',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(13,'Onion',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(14,'Tomato',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(15,'Pepper',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(16,'Orange',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(17,'Turmeric',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(18,'Cumin',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(19,'Coriander',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(20,'Paprika',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(21,'Cinnamon',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(22,'Nutmeg',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(23,'Mustard Seeds',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(24,'Bay Leaf',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(25,'Oregano',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(26,'Basil',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(27,'Parsley',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(28,'Ginger',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(29,'Honey',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(30,'Lemon Juice',1000,'2025-08-13 14:20:27','2025-08-13 14:20:27'),(31,'Buns',4985,'2025-08-13 14:46:05','2025-08-13 14:46:05'),(32,'Patty',4985,'2025-08-13 14:46:10','2025-08-13 14:46:10'),(33,'Chili Pepper',3000,'2025-08-13 14:47:59','2025-08-13 14:47:59'),(34,'Fish',200,'2025-08-13 14:50:11','2025-08-13 14:50:11'),(35,'Salmon Fillet',-4,'2025-08-13 14:53:08','2025-08-13 14:53:08'),(36,'Black Pepper',0,'2025-08-13 14:53:19','2025-08-13 14:53:19'),(37,'Beef',100,'2025-08-13 15:00:24','2025-08-13 15:00:24'),(38,'Pork Belly',200,'2025-08-13 15:03:38','2025-08-13 15:03:38');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoice_id` varchar(255) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `payment_id` bigint NOT NULL,
  `staff_id` bigint NOT NULL,
  `discount_id` bigint NOT NULL,
  `total_ammount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoice_id`),
  KEY `staff_id` (`staff_id`),
  KEY `discount_id` (`discount_id`),
  KEY `vxcv c` (`order_id`),
  KEY `hfghfgh_idx` (`payment_id`),
  CONSTRAINT `hfghfgh` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`),
  CONSTRAINT `xzczxczxcxzcqw1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES ('INV-001','ORD-001',1,1,1,54.95,'2025-08-13 15:19:19'),('INV-002','ORD-002',2,1,1,54.95,'2025-08-13 15:26:52'),('INV-003','ORD-003',3,1,1,84.95,'2025-08-14 04:18:02'),('INV-004','ORD-004',12,1,1,0.00,'2025-08-14 07:39:13');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_description` varchar(255) NOT NULL,
  `image` longblob,
  `isAvailable` enum('Yes','No') DEFAULT 'Yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name_UNIQUE` (`menu_name`),
  KEY `vxcvxcvxcvcxb2_idx` (`category_id`),
  CONSTRAINT `vxcvxcvxcvcxb2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Classic Burger','Juicy beef burger with lettuce and tomato',NULL,'Yes','2025-08-13 14:34:15','2025-08-13 14:34:15',8.99),(2,1,'Spicy Chicken Burger','Grilled chicken with spicy sauce',NULL,'Yes','2025-08-13 14:34:15','2025-08-13 14:34:15',9.49),(3,2,'Grilled Salmon','Fresh salmon grilled to perfection',NULL,'Yes','2025-08-13 14:34:15','2025-08-13 14:34:15',14.99),(4,2,'Fish Tacos','Tacos filled with fried fish and slaw',NULL,'Yes','2025-08-13 14:34:15','2025-08-13 14:34:15',10.99),(5,3,'Chocolate Cake','Rich chocolate layered cake',NULL,'Yes','2025-08-13 14:34:15','2025-08-13 14:34:15',6.99),(6,3,'Vanilla Ice Cream','Creamy vanilla ice cream scoop',NULL,'Yes','2025-08-13 14:34:16','2025-08-13 14:34:16',4.99),(7,4,'Beef Steak','Tender beef steak with herbs',NULL,'Yes','2025-08-13 14:34:16','2025-08-13 14:34:16',18.99),(8,4,'Beef Stew','Hearty beef stew with vegetables',NULL,'Yes','2025-08-13 14:34:16','2025-08-13 14:34:16',12.99),(9,5,'Pork Chops','Grilled pork chops with seasoning',NULL,'Yes','2025-08-13 14:34:16','2025-08-13 14:34:16',13.49),(10,5,'Pulled Pork Sandwich','Slow cooked pulled pork in bun',NULL,'Yes','2025-08-13 14:34:16','2025-08-13 14:34:16',11.99);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_ingredient`
--

DROP TABLE IF EXISTS `menu_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_ingredient` (
  `Menu_Ingredient_id` bigint NOT NULL AUTO_INCREMENT,
  `ingredient_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  `Quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`Menu_Ingredient_id`),
  UNIQUE KEY `uniqPairMenuIngredients` (`ingredient_id`,`menu_id`),
  KEY `dhfghfcasd_idx` (`menu_id`),
  KEY `adasbdasdbasdx1_idx` (`ingredient_id`),
  CONSTRAINT `adasbdasdbasdx1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dhfghfcasd` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_ingredient`
--

LOCK TABLES `menu_ingredient` WRITE;
/*!40000 ALTER TABLE `menu_ingredient` DISABLE KEYS */;
INSERT INTO `menu_ingredient` VALUES (1,31,1,1),(2,2,2,2),(3,3,3,3),(4,4,4,2),(5,5,5,1),(6,6,6,1),(7,1,7,3),(8,8,8,3),(9,38,9,2),(10,10,10,2),(11,32,1,1),(12,33,2,2),(13,31,2,1),(14,32,2,1),(15,34,4,2),(16,35,3,1),(17,36,3,1),(18,3,5,1),(19,2,5,1),(20,6,2,1),(21,10,9,1),(22,10,7,1),(23,37,7,2),(24,36,7,1),(25,10,8,1),(26,37,8,2),(27,13,8,1),(28,28,8,1),(29,38,10,1),(30,31,10,1);
/*!40000 ALTER TABLE `menu_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_order`
--

DROP TABLE IF EXISTS `menu_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_order` (
  `order_id` varchar(255) NOT NULL,
  `menu_id` bigint NOT NULL,
  `quantity` int GENERATED ALWAYS AS (1) VIRTUAL,
  KEY `asd_idx` (`menu_id`),
  KEY `asdgfdh` (`menu_id`),
  KEY `zxczxczxc_idx` (`order_id`),
  CONSTRAINT `asdhfghfgj` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  CONSTRAINT `zxczxczxc` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_order`
--

LOCK TABLES `menu_order` WRITE;
/*!40000 ALTER TABLE `menu_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_ingredients`
--

DROP TABLE IF EXISTS `monitor_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_ingredients` (
  `inventory_id` bigint NOT NULL,
  `ingredient_id` bigint NOT NULL,
  KEY `bdfgbdfg_idx` (`inventory_id`),
  KEY `fdsvfscds_idx` (`ingredient_id`),
  CONSTRAINT `bdfgbdfg` FOREIGN KEY (`inventory_id`) REFERENCES `monitor_inventory` (`inventory_id`),
  CONSTRAINT `fdsvfscds` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_ingredients`
--

LOCK TABLES `monitor_ingredients` WRITE;
/*!40000 ALTER TABLE `monitor_ingredients` DISABLE KEYS */;
INSERT INTO `monitor_ingredients` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(35,31),(36,32),(37,33),(38,34),(39,35),(40,36),(41,37);
/*!40000 ALTER TABLE `monitor_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_inventory`
--

DROP TABLE IF EXISTS `monitor_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_inventory` (
  `inventory_id` bigint NOT NULL AUTO_INCREMENT,
  `staff_id` bigint NOT NULL,
  `type` enum('add','deduct') NOT NULL DEFAULT 'add',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `quantity` bigint NOT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `monitor_inventory_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_inventory`
--

LOCK TABLES `monitor_inventory` WRITE;
/*!40000 ALTER TABLE `monitor_inventory` DISABLE KEYS */;
INSERT INTO `monitor_inventory` VALUES (1,1,'add','2025-08-13 14:20:27',1000),(2,1,'add','2025-08-13 14:20:27',1000),(3,1,'add','2025-08-13 14:20:27',1000),(4,1,'add','2025-08-13 14:20:27',1000),(5,1,'add','2025-08-13 14:20:27',1000),(6,1,'add','2025-08-13 14:20:27',1000),(7,1,'add','2025-08-13 14:20:27',1000),(8,1,'add','2025-08-13 14:20:27',1000),(9,1,'add','2025-08-13 14:20:27',1000),(10,1,'add','2025-08-13 14:20:27',1000),(11,1,'add','2025-08-13 14:20:27',1000),(12,1,'add','2025-08-13 14:20:27',1000),(13,1,'add','2025-08-13 14:20:27',1000),(14,1,'add','2025-08-13 14:20:27',1000),(15,1,'add','2025-08-13 14:20:27',1000),(16,1,'add','2025-08-13 14:20:27',1000),(17,1,'add','2025-08-13 14:20:27',1000),(18,1,'add','2025-08-13 14:20:27',1000),(19,1,'add','2025-08-13 14:20:27',1000),(20,1,'add','2025-08-13 14:20:27',1000),(21,1,'add','2025-08-13 14:20:27',1000),(22,1,'add','2025-08-13 14:20:27',1000),(23,1,'add','2025-08-13 14:20:27',1000),(24,1,'add','2025-08-13 14:20:27',1000),(25,1,'add','2025-08-13 14:20:27',1000),(26,1,'add','2025-08-13 14:20:27',1000),(27,1,'add','2025-08-13 14:20:27',1000),(28,1,'add','2025-08-13 14:20:27',1000),(29,1,'add','2025-08-13 14:20:27',1000),(30,1,'add','2025-08-13 14:20:27',1000),(31,1,'add','2025-08-13 14:21:14',1000),(32,1,'add','2025-08-13 14:21:31',1000),(33,1,'add','2025-08-13 14:21:41',1000),(34,1,'add','2025-08-13 14:28:25',2000),(35,1,'add','2025-08-13 14:46:05',5000),(36,1,'add','2025-08-13 14:46:10',5000),(37,1,'add','2025-08-13 14:47:59',3000),(38,1,'add','2025-08-13 14:51:00',200),(39,1,'add','2025-08-13 14:53:08',1),(40,1,'add','2025-08-13 14:53:19',5),(41,2,'add','2025-08-13 15:00:24',100);
/*!40000 ALTER TABLE `monitor_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_products`
--

DROP TABLE IF EXISTS `monitor_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_products` (
  `inventory_id` bigint NOT NULL,
  `product_variant_id` bigint NOT NULL,
  KEY `asdasasvdasb_idx` (`inventory_id`),
  KEY `bfbgn_idx` (`product_variant_id`),
  CONSTRAINT `1231v312z` FOREIGN KEY (`inventory_id`) REFERENCES `monitor_inventory` (`inventory_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bfbgn` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variant` (`product_variant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_products`
--

LOCK TABLES `monitor_products` WRITE;
/*!40000 ALTER TABLE `monitor_products` DISABLE KEYS */;
INSERT INTO `monitor_products` VALUES (31,1),(32,2),(33,3),(34,4);
/*!40000 ALTER TABLE `monitor_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(255) NOT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `reward_card_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `asvdasdv_idx` (`coupon_code`),
  KEY `dfgbdfgnd_idx` (`reward_card_id`),
  CONSTRAINT `asvdasdv` FOREIGN KEY (`coupon_code`) REFERENCES `coupon` (`coupon_code`),
  CONSTRAINT `dfgbdfgnd` FOREIGN KEY (`reward_card_id`) REFERENCES `reward_card` (`Reward_Card_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('ORD-001',NULL,NULL),('ORD-002',NULL,NULL),('ORD-003',NULL,NULL),('ORD-004',NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` bigint NOT NULL AUTO_INCREMENT,
  `payment_method` enum('cash','creditcard') NOT NULL DEFAULT 'cash',
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'cash','2025-08-13 15:19:19'),(2,'cash','2025-08-13 15:26:52'),(3,'cash','2025-08-14 04:18:02'),(12,'cash','2025-08-14 07:39:13');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `image` longblob,
  `isAvailable` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_name_UNIQUE` (`product_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Water','Natures Spring',NULL,'Yes','2025-08-13 14:21:14','2025-08-13 14:21:14'),(2,'Coke','Coke zero',NULL,'Yes','2025-08-13 14:21:31','2025-08-13 14:21:31'),(3,'Sprite','sprite ',NULL,'Yes','2025-08-13 14:21:41','2025-08-13 14:21:41');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_order` (
  `order_id` varchar(255) NOT NULL,
  `product_variant_id` bigint NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  KEY `dfgdfgdfb34_idx` (`product_variant_id`),
  KEY `bdfgbdfg_idx` (`order_id`),
  KEY `bdfgbdfg_idx111` (`order_id`),
  CONSTRAINT `bdfgbdfgx123123` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `dfgdfgdfb34` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variant` (`product_variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant`
--

DROP TABLE IF EXISTS `product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variant` (
  `product_variant_id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `variant_id` bigint NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_variant_id`),
  UNIQUE KEY `uniqPairProductVariant` (`product_id`,`variant_id`),
  KEY `asdasd_idx` (`product_id`),
  KEY `dfgdfg_idx` (`variant_id`),
  KEY `asdcasdavsaz1_idx` (`variant_id`),
  CONSTRAINT `asdasd` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `dfgdcvbcvbcfg` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`variant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant`
--

LOCK TABLES `product_variant` WRITE;
/*!40000 ALTER TABLE `product_variant` DISABLE KEYS */;
INSERT INTO `product_variant` VALUES (1,1,1,1000,20.00),(2,2,1,1000,20.00),(3,3,1,1000,20.00),(4,1,2,2000,50.00);
/*!40000 ALTER TABLE `product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward_card`
--

DROP TABLE IF EXISTS `reward_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reward_card` (
  `Reward_Card_ID` bigint NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `accumulate_points` bigint NOT NULL DEFAULT '0',
  `membership_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Reward_Card_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward_card`
--

LOCK TABLES `reward_card` WRITE;
/*!40000 ALTER TABLE `reward_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` bigint NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `role` enum('cashier','manager','supervisor') DEFAULT 'cashier',
  `status` enum('active','inactive','suspended') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'cashier1','pass123','John','Doe','09123456789','2024-01-01','cashier','active','2025-08-11 04:04:55','2025-08-11 04:04:55'),(2,'manager1','pass123','Jane','Smith','09234567890','2023-12-15','manager','active','2025-08-11 04:04:55','2025-08-11 04:04:55');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant`
--

DROP TABLE IF EXISTS `variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant` (
  `variant_id` bigint NOT NULL AUTO_INCREMENT,
  `variant_name` varchar(255) NOT NULL,
  PRIMARY KEY (`variant_id`),
  UNIQUE KEY `variant_name_UNIQUE` (`variant_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant`
--

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;
INSERT INTO `variant` VALUES (2,'1000ml'),(1,'500ml');
/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ordering_system'
--

--
-- Dumping routines for database 'ordering_system'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddNewVariantToProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewVariantToProduct`(
	IN p_product_id BIGINT,
	IN p_variant_id BIGINT,
    IN p_stock INT,
    IN p_price DECIMAL(10,2),
    IN p_staff_id BIGINT
)
BEGIN
	DECLARE v_last_monitor_product_id BIGINT;
    DECLARE v_last_product_variant_id BIGINT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Failed to insert';
    END;

    START TRANSACTION;	
	INSERT INTO product_variant (product_id, variant_id, price, stock)
        VALUES (p_product_id, p_variant_id, p_price, p_stock);
	SET v_last_product_variant_id = LAST_INSERT_ID();
         
    INSERT INTO monitor_inventory (staff_id,quantity)VALUES (p_staff_id,p_stock);
	SET v_last_monitor_product_id = LAST_INSERT_ID();
    
    INSERT INTO monitor_products  (inventory_id, product_variant_id) VALUES (v_last_monitor_product_id,v_last_product_variant_id);
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConfirmOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConfirmOrder`(
	IN p_order_id VARCHAR(255),
    IN p_invoice_id VARCHAR(255),
    IN p_discount_id BIGINT,
    IN p_staff_id BIGINT,
    IN p_payment_method ENUM('Cash','Credit-Card')
)
BEGIN
	DECLARE v_payment_id BIGINT;
    DECLARE v_coupon_rate DECIMAL(5,3);
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_quantity INT;
    DECLARe v_discount_rate DECIMAL(5,3);
	DECLARE done INT DEFAULT FALSE;
    DECLARE v_coupon_code VARCHAR(255);
    DECLARE v_totalAmount DECIMAL(10,2);
    

	DECLARE cur CURSOR FOR 
		SELECT p.price, co.quantity,o.coupon_code FROM orders o
			INNER JOIN combo_order co ON co.order_id = o.order_id
			INNER JOIN combo p ON co.combo_id = p.combo_id 
		WHERE o.order_id = p_order_id
		UNION ALL 
		SELECT m.price, mo.quantity,o.coupon_code  FROM orders o
			INNER JOIN menu_order mo ON mo.order_id = o.order_id
			INNER JOIN menu m ON mo.menu_id = m.menu_id
		WHERE o.order_id = p_order_id
		UNION ALL 
		SELECT pv.price, mo.quantity ,o.coupon_code FROM orders o
			INNER JOIN product_order mo ON mo.order_id = o.order_id
			INNER JOIN product_variant pv ON pv.product_variant_id = mo.product_variant_id
		WHERE o.order_id = p_order_id;

   	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
         RESIGNAL;
     --   SIGNAL SQLSTATE '45000'
       --     SET MESSAGE_TEXT = 'Server Error';
    END;
	START TRANSACTION; 
	IF p_discount_id IS NOT NULL THEN
		SELECT discount_rate INTO v_discount_rate FROM discount WHERE discount_id = p_discount_id; 
	END IF;
    SET v_totalAmount = 0.00;
	OPEN cur;
	o_loop : LOOP
		FETCH cur INTO v_price,v_quantity,v_coupon_code;
        IF done THEN
			LEAVE o_loop;
        END IF;
		SET v_totalAmount = v_totalAmount + ((v_quantity * v_price) - ((v_quantity * v_price) ));
    END LOOP;
	CLOSE cur;
    SELECT rate INTO v_coupon_rate FROM coupon WHERE v_coupon_code = coupon_code;
    SET v_totalAmount = v_totalAmount + (v_totalAmount * COALESCE(v_coupon_rate,0));
	INSERT INTO payment (payment_method) VALUES (p_payment_method);
    SET v_payment_id = LAST_INSERT_ID();
    
	-- SET v_total_amount = (p_quantity * v_price) - ((p_quantity * v_price) * COALESCE(v_coupon_rate,0));
    INSERT INTO invoice(invoice_id,order_id,staff_id,payment_id,discount_id,total_ammount)
    VALUES (p_invoice_id,p_order_id,p_staff_id,v_payment_id,p_discount_id,v_totalAmount);
    
    IF v_coupon_code IS NOT NULL THEN
		UPDATE coupon SET used = 'Used' WHERE coupon_code = v_coupon_code;
	END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewCombo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNewCombo`(
	IN p_combo_name VARCHAR(255),
    IN p_combo_description VARCHAR(255),
    IN p_combo_price DECIMAL(10,2),
    IN p_quantity INT,
    IN p_menu_id BIGINT,
    IN p_product_variant_id BIGINT
)
BEGIN
	DECLARE lastID BIGINT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Failed to insert';
    END;
    START TRANSACTION;
	INSERT INTO combo (combo_name,combo_description,price) VALUES (p_combo_name,p_combo_description,p_combo_price);
    SET lastID = LAST_INSERT_ID();
    
    INSERT INTO combo_detail (quantity,combo_id) VALUES (p_quantity,lastID);
	SET lastID = LAST_INSERT_ID();
    
    IF p_menu_id IS NOT NULL THEN
		INSERT INTO combo_menu (combo_detail_id,menu_id) VALUES (lastID,p_menu_id);
    END IF;
    
    IF p_product_variant_id IS NOT NULL THEN
		INSERT INTO combo_product (combo_detail_id,product_variant_id) VALUES (lastID,p_product_variant_id);
    END IF;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewIngredients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNewIngredients`(
	IN p_ingredient_name VARCHAR(255),
    IN p_quantity BIGINT,
    
    IN p_staff_id BIGINT
)
BEGIN
	DECLARE v_last_monitor_inventory_id BIGINT;
    DECLARE v_last_ingredient_id BIGINT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Failed to insert';
    END;
    
    START TRANSACTION;
    
    INSERT INTO ingredients (ingredient_name,current_stock) VALUES (p_ingredient_name,p_quantity);
    SET v_last_ingredient_id = LAST_INSERT_ID();
    
    INSERT INTO monitor_inventory (staff_id,quantity) VALUES (p_staff_id,p_quantity);
    SET v_last_monitor_inventory_id = LAST_INSERT_ID();
    
	INSERT INTO monitor_ingredients (inventory_id,ingredient_id) VALUES (v_last_monitor_inventory_id,v_last_ingredient_id);
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewMenu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNewMenu`(
	IN p_category_id BIGINT,
    IN p_menu_name VARCHAR(255),
	IN p_menu_description VARCHAR(255),
    IN p_price DECIMAl(10,2),
    
    IN p_ingredients_id BIGINT,
    IN p_quantity INT
)
BEGIN
	DECLARE lastMenu BIGINT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Failed to insert';
    END;
    START TRANSACTION;
	INSERT INTO menu   (category_id,menu_name,menu_description,price) VALUES (p_category_id,p_menu_name,p_menu_description,p_price);
    SET lastMenu = LAST_INSERT_ID();
    
     INSERT INTO menu_ingredient (menu_id, ingredient_id, quantity)
    VALUES (lastMenu, p_ingredients_id, p_quantity);
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNewOrder`( 
	IN p_quantity INT,
    IN p_combo_id BIGINT,
    IN p_menu_id BIGINT,
    IN p_product_variant_id BIGINT,
    
    IN p_order_id VARCHAR(255),
    IN p_coupon_code VARCHAR(255),
    IN p_reward_card_id BIGINT
)
BEGIN
	DECLARE v_order_id VARCHAR(255);
    DECLARE v_payment_id BIGINT;
    DECLARE v_discount_id BIGINT;
    DECLARe v_total_amount DECIMAL(10,2);
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_menu_id BIGINT;
    DECLARe v_quantity_ingredients BIGINT;
    DECLARE v_ingredient_id BIGINT;
    DECLARE v_ingredient_qty BIGINT;
	DECLARE done INT DEFAULT FALSE;
    DECLARE v_coupon_rate DECIMAL(5,3);
    DECLARe v_already_used VARCHAR(255);
    DECLARE v_expiry_date TIMESTAMP;
    DECLARE v_max_order BIGINT;
    

    DECLARE ingredienr_cursor_combo CURSOR FOR 
		SELECT mi.ingredient_id, mi.quantity FROM combo c 
		INNER JOIN combo_detail cd ON c.combo_id = cd.combo_id
		INNER JOIN combo_menu cm ON cm.combo_detail_id = cd.combo_detail_id 
		INNER JOIN menu m ON m.menu_id = cm.menu_id
		INNER JOIN menu_ingredient mi ON mi.menu_id = m.menu_id
		WHERE c.combo_id = p_combo_id;
		
    DECLARE ingredient_cursor_menu CURSOR FOR
			SELECT mi.ingredient_id, mi.quantity
			FROM menu_ingredient mi
			WHERE mi.menu_id = p_menu_id;
    
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
         RESIGNAL;
     --   SIGNAL SQLSTATE '45000'
       --     SET MESSAGE_TEXT = 'Server Error';
    END;
	START TRANSACTION;
    
	IF p_coupon_code IS NOT NULL AND LOWER(p_coupon_code) <> 'null' THEN
		INSERT INTO orders (order_id,coupon_code) VALUES (p_order_id,p_coupon_code);
		SET v_order_id = p_order_id;
        SELECT rate,used,expiry_date INTO v_coupon_rate,v_already_used,v_expiry_date FROM coupon WHERE coupon_code = p_coupon_code;
        
        IF LOWER(v_already_used) = 'used' THEN
			ROLLBACK;
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "Coupon Already Used";
        END IF;
        
        IF v_expiry_date < NOW() THEN
			ROLLBACK;
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "Coupon Expired";
        END IF;
    ELSE
        INSERT INTO orders (order_id) VALUES (p_order_id);
		SET v_order_id = p_order_id;
    END IF;
    
    IF p_combo_id IS NOT NULL OR p_menu_id IS NOT NULL THEN
		IF p_combo_id IS NOT NULL THEN
			INSERT INTO combo_order (order_id,combo_id) VALUES (v_order_id,p_combo_id);
			SELECT 
				c.price, m.menu_id 
                INTO 
                v_price, v_menu_id
			FROM combo c
			INNER JOIN combo_detail cd ON cd.combo_id = c.combo_id
			INNER JOIN combo_menu cm ON cd.combo_detail_id = cm.combo_detail_id
			INNER JOIN menu m ON m.menu_id = cm.menu_id
			WHERE c.combo_id = p_combo_id LIMIT 1;
            
			OPEN ingredienr_cursor_combo;
			read_loop: LOOP
				FETCH ingredienr_cursor_combo INTO v_ingredient_id, v_ingredient_qty;
				IF done THEN
					LEAVE read_loop;
				END IF;

				UPDATE ingredients
				SET current_stock = current_stock - (v_ingredient_qty * p_quantity)
				WHERE ingredient_id = v_ingredient_id;
			END LOOP;
			CLOSE ingredienr_cursor_combo;
		END IF;
		
		IF p_menu_id IS NOT NULL THEN
			INSERT INTO menu_order (order_id,menu_id,quantity) VALUES (v_order_id,p_menu_id,p_quantity);
			SELECT price INTO v_price FROM menu WHERE menu_id = p_menu_id;
            SET v_menu_id = p_menu_id;
            
            OPEN ingredient_cursor_menu;
			read_loop: LOOP
				FETCH ingredient_cursor_menu INTO v_ingredient_id, v_ingredient_qty;
				IF done THEN
					LEAVE read_loop;
				END IF;

				UPDATE ingredients
				SET current_stock = current_stock - (v_ingredient_qty * p_quantity)
				WHERE ingredient_id = v_ingredient_id;
			END LOOP;
			CLOSE ingredient_cursor_menu;
		END IF;
    
        
        
    END IF;
    

    IF p_product_variant_id IS NOT NULL THEN
		 INSERT INTO product_order (order_id,product_variant_id,quantity) VALUES (v_order_id,p_product_variant_id,p_quantity);
         SELECT price INTO v_price FROM product_variant WHERE product_variant_id = p_product_variant_id;
         UPDATE product_variant SET stock = stock - p_quantity WHERE product_variant_id = p_product_variant_id;
    END IF;
    

	
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNewProduct`(
    IN p_product_name VARCHAR(255),
    IN p_product_description VARCHAR(255),
    IN p_variant_id BIGINT,
    IN p_variant_name VARCHAR(255),
	IN p_stock BIGINT,
    IN p_price DECIMAL(10,2),
    IN p_staff_id BIGINT

)
BEGIN
    DECLARE v_last_product_id BIGINT;
    DECLARE v_last_variant_id BIGINT;
    DECLARE v_last_product_variant_id BIGINT;
    DECLARE v_last_inventory_id BIGINT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Failed to insert';
    END;

    START TRANSACTION;

    INSERT INTO product (product_name, product_description)
    VALUES (p_product_name, p_product_description);
    SET v_last_product_id = LAST_INSERT_ID();

    IF p_variant_id IS NULL THEN
    
        INSERT INTO variant (variant_name) VALUES (p_variant_name);
        SET v_last_variant_id = LAST_INSERT_ID();

        INSERT INTO product_variant (product_id, variant_id, price, stock)
        VALUES (v_last_product_id, v_last_variant_id, p_price, p_stock);
		SET v_last_product_variant_id = LAST_INSERT_ID();
        
    ELSE
    
        INSERT INTO product_variant (product_id, variant_id, price, stock)
        VALUES (v_last_product_id, p_variant_id, p_price, p_stock);
        SET v_last_product_variant_id = LAST_INSERT_ID();
        
    END IF;
    
    INSERT INTO monitor_inventory (staff_id,quantity)VALUES (p_staff_id,p_stock);
	SET v_last_inventory_id = LAST_INSERT_ID();
    
    INSERT INTO monitor_products  (inventory_id, product_variant_id) VALUES (v_last_inventory_id,v_last_product_variant_id);
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateProductMenuToCombo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateProductMenuToCombo`(
	IN p_combo_id BIGINT,
    IN p_quantity INT,
    IN p_menu_id BIGINT,
    IN p_product_variant_id BIGINT
)
BEGIN
	DECLARE lastID BIGINT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Failed to insert';
    END;
	START TRANSACTION;
    
    IF p_menu_id IS NOT NULL OR p_product_variant_id IS NOT NULL THEN
		INSERT INTO combo_detail (quantity,combo_id) VALUES (p_quantity,p_combo_id);
		SET lastID = LAST_INSERT_ID();
    END IF;
    
    IF p_menu_id IS NOT NULL THEN
		INSERT INTO combo_menu (combo_detail_id,menu_id) VALUES (lastID,p_menu_id);
    END IF;
    
    IF p_product_variant_id IS NOT NULL THEN
		INSERT INTO combo_product (combo_detail_id,product_variant_id) VALUES (lastID,p_product_variant_id);
    END IF;
    
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerateCoupon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateCoupon`(
	IN p_times INT,
    IN p_rate DECIMAL(5,3),
    IN p_expiry_date DATE
)
BEGIN
	DECLARe counter INT DEFAULT 0;
    DECLARE v_coupon_code VARCHAR(255);

	WHILE counter < p_times DO
		SET v_coupon_code =  UPPER(SUBSTRING(MD5(RAND()), 1, 20));
        INSERT INTO coupon (coupon_code,rate,expiry_date) VALUES (v_coupon_code,p_rate,p_expiry_date);
        SET v_coupon_code = '';
        SET counter = counter + 1;
	END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerateIngredientHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateIngredientHistory`(
	IN p_ingredient_id BIGINT,
    IN p_date VARCHAR(20)
)
BEGIN
	DECLARE v_ingredient_name VARCHAR(255);
    DECLARe v_quantity BIGINT;
	DECLARE v_transdate DATETIME;
    DECLARE v_type VARCHAR(255);
    DECLARE v_staff_id BIGINT;
    DECLARE done INT DEFAULT FALSE;
    
    DECLARE cur CURSOR FOR 
		SELECT 
			mmi.staff_id,
			i.ingredient_name,
			mmi.quantity,
			mmi.type,
			mmi.created_at
		FROM monitor_inventory mmi
		INNER JOIN monitor_ingredients mi ON mi.inventory_id = mmi.inventory_id
		INNER JOIN ingredients i ON i.ingredient_id = mi.ingredient_id
		WHERE 
			i.ingredient_id = p_ingredient_id
			AND (
				LOWER(p_date) = 'null'
				OR LOWER(p_date) = 'all'
				OR (
					(
						mmi.created_at >= DATE_FORMAT(STR_TO_DATE(p_date, '%m-%d-%Y'), '%Y-%m-01 00:00:00')
						AND mmi.created_at < DATE_ADD(LAST_DAY(STR_TO_DATE(p_date, '%m-%d-%Y')), INTERVAL 1 DAY)
					)
					OR
					(
						mmi.created_at >= DATE_FORMAT(STR_TO_DATE(p_date, '%Y-%m-%d'), '%Y-%m-01 00:00:00')
						AND mmi.created_at < DATE_ADD(LAST_DAY(STR_TO_DATE(p_date, '%Y-%m-%d')), INTERVAL 1 DAY)
					)
				)
			);
    
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	DROP TEMPORARY TABLE IF EXISTS tmp_result;
	CREATE TEMPORARY TABLE tmp_result 
    (
		Staff_ID BIGINT,
        Ingredient_Name VARCHAR(255),
        Deduct BIGINT,
        Addition BIGINT,
        Time TIMESTAMP
    );
    
    OPEN cur;
	
    l_loop : LOOP
		FETCH cur INTO v_staff_id, v_ingredient_name, v_quantity, v_type, v_transdate;
		IF done THEN
			LEAVE l_loop;
        END IF;
        IF v_type = 'Deduct' THEN
            INSERT INTO tmp_result (Staff_ID, Ingredient_Name, Deduct, Addition, Time)
            VALUES (v_staff_id, v_ingredient_name, v_quantity, 0, v_transdate);
        ELSEIF v_type = 'Add' THEN
            INSERT INTO tmp_result (Staff_ID, Ingredient_Name, Deduct, Addition, Time)
            VALUES (v_staff_id, v_ingredient_name, 0, v_quantity, v_transdate);
        ELSE
            INSERT INTO tmp_result (Staff_ID, Ingredient_Name, Deduct, Addition, Time)
            VALUES (v_staff_id, v_ingredient_name, 0, 0, v_transdate);
        END IF;
	END LOOP;
    CLOSE cur;
    
    SELECT * FROM tmp_result ORDER BY Time;
    DROP TEMPORARY TABLE IF EXISTS tmp_result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerateProductHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateProductHistory`(
	IN p_product_variant_id BIGINT,
    IN p_date VARCHAR(20)
)
BEGIN
	DECLARE v_product_name VARCHAR(255);
    DECLARe v_quantity BIGINT;
	DECLARE v_transdate DATETIME;
    DECLARE v_type VARCHAR(255);
    DECLARE v_staff_id BIGINT;
	DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR 
		SELECT 
			mmi.staff_id,
			p.product_name,
			mmi.quantity,
			mmi.type,
			mmi.created_at
		FROM monitor_inventory mmi
		INNER JOIN monitor_products mp ON mp.inventory_id = mmi.inventory_id
		INNER JOIN product_variant pv ON pv.product_variant_id = mp.product_variant_id
        INNER JOIN product p ON pv.product_id = p.product_id
		WHERE 
			pv.product_variant_id = p_product_variant_id
        	AND (
				LOWER(p_date) = 'null'
				OR LOWER(p_date) = 'all'
				OR (
					(
						mmi.created_at >= DATE_FORMAT(STR_TO_DATE(p_date, '%m-%d-%Y'), '%Y-%m-01 00:00:00')
						AND mmi.created_at < DATE_ADD(LAST_DAY(STR_TO_DATE(p_date, '%m-%d-%Y')), INTERVAL 1 DAY)
					)
					OR
					(
						mmi.created_at >= DATE_FORMAT(STR_TO_DATE(p_date, '%Y-%m-%d'), '%Y-%m-01 00:00:00')
						AND mmi.created_at < DATE_ADD(LAST_DAY(STR_TO_DATE(p_date, '%Y-%m-%d')), INTERVAL 1 DAY)
					)
				)
			);
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
	DROP TEMPORARY TABLE IF EXISTS tmp_result;
	CREATE TEMPORARY TABLE tmp_result 
    (
		Staff_ID BIGINT,
        Product_name VARCHAR(255),
        Deduct BIGINT,
        Addition BIGINT,
        Time TIMESTAMP
    );
     OPEN cur;
	
    l_loop : LOOP
		FETCH cur INTO v_staff_id, v_product_name, v_quantity, v_type, v_transdate;
		IF done THEN
			LEAVE l_loop;
        END IF;
        IF v_type = 'Deduct' THEN
            INSERT INTO tmp_result (Staff_ID, Product_name, Deduct, Addition, Time)
            VALUES (v_staff_id, v_product_name, v_quantity, 0, v_transdate);
        ELSEIF v_type = 'Add' THEN
            INSERT INTO tmp_result (Staff_ID, Product_name, Deduct, Addition, Time)
            VALUES (v_staff_id, v_product_name, 0, v_quantity, v_transdate);
        ELSE
            INSERT INTO tmp_result (Staff_ID, Product_name, Deduct, Addition, Time)
            VALUES (v_staff_id, v_product_name, 0, 0, v_transdate);
        END IF;
	END LOOP;
    CLOSE cur;
    
    SELECT * FROM tmp_result ORDER BY Time;
    DROP TEMPORARY TABLE IF EXISTS tmp_result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerateSales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateSales`(
	IN p_date_range VARCHAR(20)
)
BEGIN
	SELECT 
	i.invoice_id,
	i.order_id,
	d.discount_type,
	p.payment_method,
	i.total_ammount as SubTotal,
	CAST(
			(i.total_ammount * CASE WHEN d.discount_rate = 0.00 THEN 1 ELSE d.discount_rate END) 
			AS DECIMAL(10,2)
		) AS Total
	FROM invoice i 
	INNER JOIN discount d ON d.discount_id = i.discount_id
	INNER JOIN payment p ON p.payment_id = i.payment_id WHERE
		LOWER(p_date_range) = 'null'
				OR LOWER(p_date_range) = 'all'
				OR (
					(
						i.created_at >= DATE_FORMAT(STR_TO_DATE(p_date_range, '%m-%d-%Y'), '%Y-%m-01 00:00:00')
						AND i.created_at < DATE_ADD(LAST_DAY(STR_TO_DATE(p_date_range, '%m-%d-%Y')), INTERVAL 1 DAY)
					)
					OR
					(
						i.created_at >= DATE_FORMAT(STR_TO_DATE(p_date_range, '%Y-%m-%d'), '%Y-%m-01 00:00:00')
						AND i.created_at < DATE_ADD(LAST_DAY(STR_TO_DATE(p_date_range, '%Y-%m-%d')), INTERVAL 1 DAY)
					)
				);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RetrieveComboV2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveComboV2`(
	IN p_combo_id BIGINT,
	IN p_isAvailable ENUM('Yes','No','All') 
)
BEGIN
	IF p_combo_id IS NOT NULL THEN
		SELECT 
			c.combo_id,
			c.combo_name,
            c.combo_description,
            c.image,
			c.price,
			CONCAT_WS(', ',
				ing.Ingredients_Quantity,
				prod.Products_Quantity
			) AS All_Items,
			LEAST(
				COALESCE(ing.Max_Order, 0),
				COALESCE(prod.Max_Order, 0)
			) AS Max_Order
		FROM Combo c
		LEFT JOIN (
			SELECT 
				c.combo_id,
				GROUP_CONCAT(DISTINCT i.ingredient_name , CONCAT('(' , mi.quantity * cd.quantity , ')') 
							 ORDER BY i.ingredient_name ASC SEPARATOR ', ') AS Ingredients_Quantity,
                CASE WHEN COALESCE(MIN(i.current_stock DIV NULLIF((mi.quantity* cd.quantity), 0)),0) <= 0 THEN 0 ELSE COALESCE(MIN(i.current_stock DIV NULLIF((mi.quantity* cd.quantity), 0)),0) END AS Max_Order
			FROM Combo c
			INNER JOIN combo_detail cd ON c.combo_id = cd.combo_id
			INNER JOIN combo_menu cm ON cm.combo_detail_id = cd.combo_detail_id
			INNER JOIN Menu m ON m.menu_id = cm.menu_id
			INNER JOIN Menu_Ingredient mi ON m.menu_id = mi.menu_id
			INNER JOIN Ingredients i ON mi.ingredient_id = i.ingredient_id
			GROUP BY c.combo_id
		) ing ON c.combo_id = ing.combo_id

		LEFT JOIN (
			SELECT 
				c.combo_id,
				GROUP_CONCAT(DISTINCT v.variant_name , CONCAT('(' , p.product_name, '-', cd.quantity,')') 
							 ORDER BY v.variant_name ASC SEPARATOR ', ') AS Products_Quantity,
				MIN(pv.stock) AS Max_Order
			FROM Combo c
			INNER JOIN combo_detail cd ON c.combo_id = cd.combo_id
			INNER JOIN combo_product cp ON cp.combo_detail_id = cd.combo_detail_id
			INNER JOIN product_variant pv ON pv.product_variant_id = cp.product_variant_id
			INNER JOIN variant v ON pv.variant_id = v.variant_id
			INNER JOIN product p ON p.product_id = pv.product_id
			GROUP BY c.combo_id
		) prod ON c.combo_id = prod.combo_id

		WHERE c.combo_id = p_combo_id AND (p_isAvailable = 'All' OR p_isAvailable = c.isAvailable);
	ELSE 
		SELECT 
			c.combo_id,
			c.combo_name,
            c.combo_description,
            c.image,
			c.price,
			CONCAT_WS(', ',
				ing.Ingredients_Quantity,
				prod.Products_Quantity
			) AS All_Items,
			LEAST(
				COALESCE(ing.Max_Order, 0),
				COALESCE(prod.Max_Order, 0)
			) AS Max_Order
		FROM Combo c
		LEFT JOIN (
			SELECT 
				c.combo_id,
				GROUP_CONCAT(DISTINCT i.ingredient_name , CONCAT('(' , mi.quantity * cd.quantity , ')') 
							 ORDER BY i.ingredient_name ASC SEPARATOR ', ') AS Ingredients_Quantity,
				CASE WHEN COALESCE(MIN(i.current_stock DIV NULLIF((mi.quantity* cd.quantity), 0)),0) <= 0 THEN 0 ELSE COALESCE(MIN(i.current_stock DIV NULLIF((mi.quantity* cd.quantity), 0)),0) END AS Max_Order
			FROM Combo c
			INNER JOIN combo_detail cd ON c.combo_id = cd.combo_id
			INNER JOIN combo_menu cm ON cm.combo_detail_id = cd.combo_detail_id
			INNER JOIN Menu m ON m.menu_id = cm.menu_id
			INNER JOIN Menu_Ingredient mi ON m.menu_id = mi.menu_id
			INNER JOIN Ingredients i ON mi.ingredient_id = i.ingredient_id
			GROUP BY c.combo_id
		) ing ON c.combo_id = ing.combo_id

		LEFT JOIN (
			SELECT 
				c.combo_id,
				GROUP_CONCAT(DISTINCT v.variant_name , CONCAT('(' , p.product_name,'-', cd.quantity, ')') 
							 ORDER BY v.variant_name ASC SEPARATOR ', ') AS Products_Quantity,
				MIN(pv.stock) AS Max_Order
			FROM Combo c
			INNER JOIN combo_detail cd ON c.combo_id = cd.combo_id
			INNER JOIN combo_product cp ON cp.combo_detail_id = cd.combo_detail_id
			INNER JOIN product_variant pv ON pv.product_variant_id = cp.product_variant_id
			INNER JOIN variant v ON pv.variant_id = v.variant_id
			INNER JOIN product p ON p.product_id = pv.product_id
			GROUP BY c.combo_id
		) prod ON c.combo_id = prod.combo_id 
        WHERE (p_isAvailable = 'All' OR p_isAvailable = c.isAvailable);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RetrieveInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveInvoice`(
	IN p_invoice_id VARCHAR(255)
)
BEGIN
	IF LOWER(p_invoice_id) <> 'null' OR LOWER(p_invoice_id) <> 'all'  	THEN
		SELECT i.invoice_id,i.order_id,o.quantity, m.menu_name item_name, m.menu_description alt FROM invoice i
		INNER JOIN orders o ON i.order_id = o.order_id
		INNER JOIN menu_order mo ON mo.order_id = o.order_id
		INNER JOIN menu m ON mo.menu_id = m.menu_id
		WHERE i.invoice_id = p_invoice_id
		UNION ALL
		SELECT i.invoice_id,i.order_id, o.quantity, p.product_name item_name, v.variant_name alt FROM invoice i
		INNER JOIN orders o ON i.order_id = o.order_id
		INNER JOIN product_order po ON po.order_id = o.order_id
		INNER JOIN product_variant pv ON pv.product_variant_id = po.product_variant_id
		INNER JOIN product p ON pv.product_id = p.product_id
		INNER JOIN variant v ON v.variant_id = pv.variant_iD
		WHERE i.invoice_id =p_invoice_id
		UNION ALL
		SELECT i.invoice_id,i.order_id, o.quantity, c.combo_name item_name, c.combo_description alt FROM invoice i
		INNER JOIN orders o ON i.order_id = o.order_id
		INNER JOIN combo_order co ON co.order_id = o.order_id
		INNER JOIN combo c ON c.combo_id = co.combo_id
		WHERE i.invoice_id = p_invoice_id;
    ELSE 
		SELECT i.invoice_id,i.order_id,o.quantity, m.menu_name item_name, m.menu_description alt FROM invoice i
		INNER JOIN orders o ON i.order_id = o.order_id
		INNER JOIN menu_order mo ON mo.order_id = o.order_id
		INNER JOIN menu m ON mo.menu_id = m.menu_id
		UNION ALL
		SELECT i.invoice_id,i.order_id, o.quantity, p.product_name item_name, v.variant_name alt FROM invoice i
		INNER JOIN orders o ON i.order_id = o.order_id
		INNER JOIN product_order po ON po.order_id = o.order_id
		INNER JOIN product_variant pv ON pv.product_variant_id = po.product_variant_id
		INNER JOIN product p ON pv.product_id = p.product_id
		INNER JOIN variant v ON v.variant_id = pv.variant_iD
		UNION ALL
		SELECT i.invoice_id,i.order_id, o.quantity, c.combo_name item_name, c.combo_description alt FROM invoice i
		INNER JOIN orders o ON i.order_id = o.order_id
		INNER JOIN combo_order co ON co.order_id = o.order_id
		INNER JOIN combo c ON c.combo_id = co.combo_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RetrieveMenuV2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveMenuV2`(
	IN p_menu_id BIGINT,
    IN p_isAvailable ENUM('Yes','No','All') 
)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS menu_result;
    CREATE TEMPORARY TABLE menu_result (
        menu_id BIGINT,
        menu_name VARCHAR(255),
        price DECIMAL(10,2),
        image VARCHAR(255),
        Ingredients_Quantity TEXT,
        Max_Order BIGINT
    );
	IF p_menu_id IS NULL THEN 
		SELECT 
			m.menu_id,
			m.menu_name,
			m.price,
            m.isAvailable,
            m.image,
			GROUP_CONCAT(DISTINCT i.ingredient_name , CONCAT('(' , mi.quantity , ')') ORDER BY i.ingredient_name  ASC SEPARATOR ', ') AS Ingredients_Quantity,
			CASE WHEN COALESCE(MIN(i.current_stock DIV NULLIF((mi.quantity), 0)),0) <= 0 THEN 0 ELSE COALESCE(MIN(i.current_stock DIV NULLIF((mi.quantity), 0)),0) END AS Max_Order
		FROM Menu m
		LEFT JOIN Menu_Ingredient mi
			ON m.menu_id = mi.menu_id
		LEFT JOIN Ingredients i 
			ON mi.ingredient_id = i.ingredient_id
		WHERE (p_isAvailable = 'All' OR p_isAvailable = m.isAvailable)
		GROUP BY m.menu_id,m.menu_name,m.price,m.image;
	ELSE 
		SELECT 
			m.menu_id,
			m.menu_name,
			m.price,
			m.isAvailable,
            m.image,
			GROUP_CONCAT(DISTINCT i.ingredient_name , CONCAT('(' , mi.quantity , ')') ORDER BY i.ingredient_name  ASC SEPARATOR ', ') AS Ingredients_Quantity,
			CASE WHEN COALESCE(MIN(i.current_stock DIV NULLIF((mi.quantity), 0)),0) <= 0 THEN 0 ELSE COALESCE(MIN(i.current_stock DIV NULLIF((mi.quantity), 0)),0) END AS Max_Order
		FROM Menu m
		LEFT JOIN Menu_Ingredient mi 
			ON m.menu_id = mi.menu_id
		LEFT JOIN Ingredients i 
			ON mi.ingredient_id = i.ingredient_id
        WHERE m.menu_id = p_menu_id AND (p_isAvailable = 'All' OR p_isAvailable = m.isAvailable)
		GROUP BY m.menu_id,m.menu_name,m.price,m.image;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RetrieveProductV2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RetrieveProductV2`(
	IN p_product_id BIGINT,
    IN p_variant_id BIGINT,
    IN p_isAvailable ENUM('Yes','No','All')
)
BEGIN
	IF p_product_id IS NULL AND p_variant_id IS NULL THEN
        SELECT 
			p.product_id,
            p.product_name,
            p.product_description,
            p.image,
			GROUP_CONCAT(DISTINCT v.variant_name , CONCAT (' | ' , pv.price) ORDER BY v.variant_name  ASC SEPARATOR ' , ') AS Variant_Price,
			CASE WHEN pv.stock <= 0 THEN 0 ELSE pv.stock END as STOCK
        FROM product p 
        INNER JOIN product_variant pv 
			ON p.product_id = pv.product_id 
        INNER JOIN variant v 
			ON pv.variant_id = v.variant_id
		WHERE (p_isAvailable = 'All' OR p_isAvailable = p.isAvailable)
		GROUP BY p.product_id,
            p.product_name,
            p.product_description,
            p.image,
            p.isAvailable,
            pv.stock;
    ELSEIF p_variant_id IS NOT NULL THEN
		SELECT 
			p.product_id,
            p.product_name,
            p.product_description,
            p.image,
			GROUP_CONCAT(DISTINCT v.variant_name , CONCAT (' | ' , pv.price) ORDER BY v.variant_name  ASC SEPARATOR ' , ') AS Variant_Price,
            CASE WHEN pv.stock <= 0 THEN 0 ELSE pv.stock END as STOCK
        FROM product p 
        INNER JOIN product_variant pv 
			ON p.product_id = pv.product_id 
        INNER JOIN variant v 
			ON pv.variant_id = v.variant_id
		WHERE pv.variant_id = p_variant_id AND (p_isAvailable = 'All' OR p_isAvailable = p.isAvailable)
		GROUP BY p.product_id,
            p.product_name,
            p.product_description,
            p.image,
			p.isAvailable,
            pv.stock;  
	ELSEIF p_product_id IS NOT NULL THEN
		SELECT 
			p.product_id,
            p.product_name,
            p.product_description,
            p.isAvailable,
            p.image,
			GROUP_CONCAT(DISTINCT v.variant_name , CONCAT (' | ' , pv.price) ORDER BY v.variant_name  ASC SEPARATOR ' , ') AS Variant_Price,
            CASE WHEN pv.stock <= 0 THEN 0 ELSE pv.stock END as STOCK
        FROM product p 
        INNER JOIN product_variant pv 
			ON p.product_id = pv.product_id 
        INNER JOIN variant v 
			ON pv.variant_id = v.variant_id
		WHERE p.product_id = p_product_id AND (p_isAvailable = 'All' OR p_isAvailable = p.isAvailable)
		GROUP BY p.product_id,
				p.product_name,
				p.product_description,
				p.image,
				p.isAvailable,
                pv.stock;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateIngredients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateIngredients`(
	IN p_ingredient_id BIGINT,
    IN p_quantity BIGINT,
    
	IN p_staff_id BIGINT

)
BEGIN
	DECLARE v_last_monitor_inventory_id BIGINT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Failed to insert';
    END;
    
    START TRANSACTION;
    
    UPDATE ingredients SET current_stock = current_stock + p_quantity WHERE ingredient_id = p_ingredient_id;
		
	INSERT INTO monitor_inventory (staff_id,quantity) VALUES (p_staff_id,p_quantity);
    SET v_last_monitor_inventory_id = LAST_INSERT_ID();
    
	INSERT INTO monitor_ingredients (inventory_id,ingredient_id) VALUES (v_last_monitor_inventory_id,p_ingredient_id);
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateProduct`(
    IN p_product_variant_id BIGINT,
    IN p_staff_id BIGINT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_last_monitor_inventory_id BIGINT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Failed to insert';
    END;

    START TRANSACTION;

    UPDATE product_variant 
    SET stock = stock + p_quantity 
    WHERE product_variant_id = p_product_variant_id;

    INSERT INTO monitor_inventory (staff_id, quantity) 
    VALUES (p_staff_id, p_quantity);

    SET v_last_monitor_inventory_id = LAST_INSERT_ID();

    INSERT INTO monitor_products (inventory_id, product_variant_id) 
    VALUES (v_last_monitor_inventory_id, p_product_variant_id);

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-14 15:43:46
