-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: bookify_db
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `activity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_logs_booking_id_foreign` (`booking_id`),
  KEY `activity_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `activity_logs_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_logs`
--

DROP TABLE IF EXISTS `approval_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `approver_id` bigint unsigned NOT NULL,
  `status` enum('pending','approved','declined') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `approval_logs_booking_id_foreign` (`booking_id`),
  KEY `approval_logs_approver_id_foreign` (`approver_id`),
  CONSTRAINT `approval_logs_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `approvers` (`id`),
  CONSTRAINT `approval_logs_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_logs`
--

LOCK TABLES `approval_logs` WRITE;
/*!40000 ALTER TABLE `approval_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approvers`
--

DROP TABLE IF EXISTS `approvers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approvers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_type_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `approver_level` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `approvers_asset_type_id_foreign` (`asset_type_id`),
  KEY `approvers_user_id_foreign` (`user_id`),
  KEY `approvers_department_id_foreign` (`department_id`),
  CONSTRAINT `approvers_asset_type_id_foreign` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types` (`id`),
  CONSTRAINT `approvers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `approvers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvers`
--

LOCK TABLES `approvers` WRITE;
/*!40000 ALTER TABLE `approvers` DISABLE KEYS */;
INSERT INTO `approvers` VALUES (4,1,2,1,'2025-09-05 03:16:12','2025-09-05 03:16:12',1),(5,1,3,2,'2025-09-05 03:16:20','2025-09-05 03:16:20',1),(6,2,2,1,'2025-09-05 03:17:31','2025-09-05 03:17:31',1),(7,2,3,2,'2025-09-05 03:17:35','2025-09-05 03:17:35',1);
/*!40000 ALTER TABLE `approvers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_details`
--

DROP TABLE IF EXISTS `asset_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_type_id` bigint unsigned NOT NULL,
  `asset_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plate_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_seats` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_details_asset_type_id_foreign` (`asset_type_id`),
  CONSTRAINT `asset_details_asset_type_id_foreign` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_details`
--

LOCK TABLES `asset_details` WRITE;
/*!40000 ALTER TABLE `asset_details` DISABLE KEYS */;
INSERT INTO `asset_details` VALUES (3,1,'HR Conference Room','UG, Gaisano Mall of Davao',NULL,NULL,NULL,NULL,50,'2025-09-05 01:57:06','2025-09-05 01:57:06'),(4,1,'DPS Conference Room','3rd Floor, Gaisano Mall of Davao',NULL,NULL,NULL,NULL,15,'2025-09-05 01:57:29','2025-09-05 01:57:29'),(5,1,'Mall Admin Conference Room','4th Floor, Gaisano Mall of Davao',NULL,NULL,NULL,NULL,25,'2025-09-05 01:57:52','2025-09-05 01:57:52'),(6,1,'Leasing Conference Room','4th Floor, Gaisano Mall of Davao',NULL,NULL,NULL,NULL,20,'2025-09-05 01:58:14','2025-09-05 01:58:14'),(7,2,'Toyota Hiace','Garage A','Toyota','Hiace GL Grandia','White','ABC-1234',12,'2025-09-05 01:59:55','2025-09-05 01:59:55'),(8,2,'Mitsubishi Montero','Garage B','Mitsubishi','Montero Sport GLS','Black','XYZ-5678',7,'2025-09-05 01:59:55','2025-09-05 01:59:55'),(9,2,'Honda Civic','Garage C','Honda','Civic RS Turbo','Red','DEF-9012',5,'2025-09-05 01:59:55','2025-09-05 01:59:55');
/*!40000 ALTER TABLE `asset_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_files`
--

DROP TABLE IF EXISTS `asset_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_detail_id` bigint unsigned NOT NULL,
  `file_attachments` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_files_asset_detail_id_foreign` (`asset_detail_id`),
  CONSTRAINT `asset_files_asset_detail_id_foreign` FOREIGN KEY (`asset_detail_id`) REFERENCES `asset_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_files`
--

LOCK TABLES `asset_files` WRITE;
/*!40000 ALTER TABLE `asset_files` DISABLE KEYS */;
INSERT INTO `asset_files` VALUES (1,3,'asset_images/1757040083_R_(1).jpg','2025-09-05 02:41:23','2025-09-05 02:41:23'),(2,4,'asset_images/1757041438_R_(1).jpg','2025-09-05 03:03:58','2025-09-05 03:03:58'),(3,5,'asset_images/1757041449_R_(1).jpg','2025-09-05 03:04:09','2025-09-05 03:04:09'),(4,6,'asset_images/1757041458_R_(1).jpg','2025-09-05 03:04:18','2025-09-05 03:04:18'),(5,7,'asset_images/1757041488_images.jpg','2025-09-05 03:04:48','2025-09-05 03:04:48'),(6,8,'asset_images/1757041511_images_(1).jpg','2025-09-05 03:05:11','2025-09-05 03:05:11'),(7,9,'asset_images/1757041579_m_r.jpg','2025-09-05 03:06:19','2025-09-05 03:06:19');
/*!40000 ALTER TABLE `asset_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_types`
--

DROP TABLE IF EXISTS `asset_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_types`
--

LOCK TABLES `asset_types` WRITE;
/*!40000 ALTER TABLE `asset_types` DISABLE KEYS */;
INSERT INTO `asset_types` VALUES (1,'Conference Room','2025-09-05 01:38:03','2025-09-05 01:38:03'),(2,'Vehicle','2025-09-05 01:38:09','2025-09-05 01:38:09');
/*!40000 ALTER TABLE `asset_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booked_guests`
--

DROP TABLE IF EXISTS `booked_guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booked_guests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booked_guests_booking_id_foreign` (`booking_id`),
  CONSTRAINT `booked_guests_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booked_guests`
--

LOCK TABLES `booked_guests` WRITE;
/*!40000 ALTER TABLE `booked_guests` DISABLE KEYS */;
INSERT INTO `booked_guests` VALUES (20,23,'christian.delapos6@gmail.com','2025-09-05 08:58:45','2025-09-05 08:58:45'),(21,24,'christian.delapos6@gmail.com','2025-09-05 09:00:58','2025-09-05 09:00:58');
/*!40000 ALTER TABLE `booked_guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_type_id` bigint unsigned NOT NULL,
  `asset_detail_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `asset_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_seats` int NOT NULL,
  `destination` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduled_date` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `allocated_by_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allocated_at` timestamp NULL DEFAULT NULL,
  `departed_at` timestamp NULL DEFAULT NULL,
  `returned_at` timestamp NULL DEFAULT NULL,
  `first_approver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_approved_at` timestamp NULL DEFAULT NULL,
  `second_approver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `disapprove_reason` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `bookings_asset_type_id_foreign` (`asset_type_id`),
  KEY `bookings_user_id_foreign` (`user_id`),
  KEY `bookings_asset_detail_id_foreign` (`asset_detail_id`),
  CONSTRAINT `bookings_asset_detail_id_foreign` FOREIGN KEY (`asset_detail_id`) REFERENCES `asset_details` (`id`),
  CONSTRAINT `bookings_asset_type_id_foreign` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types` (`id`),
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (23,1,3,5,'HR Conference Room','test',2,'UG, Gaisano Mall of Davao','2025-09-06','08:00:00','10:58:00','test','cancelled',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-05 08:58:45','2025-09-05 09:00:33','sorry awdaw '),(24,1,3,5,'HR Conference Room','test',2,'UG, Gaisano Mall of Davao','2025-09-06','08:00:00','10:03:00','test','pending',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-05 09:00:58','2025-09-05 09:00:58',NULL);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'BAJADA','2025-09-05 01:31:12','2025-09-05 01:57:37'),(2,'TORIL','2025-09-05 01:54:17','2025-09-05 01:57:43'),(3,'DIGOS','2025-09-05 01:54:24','2025-09-05 01:57:48'),(4,'TAGUM','2025-09-05 01:54:29','2025-09-05 01:57:53'),(5,'GENSAN','2025-09-05 01:54:34','2025-09-05 01:57:59'),(6,'CEBU','2025-09-05 01:54:38','2025-09-05 01:58:03');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_units`
--

DROP TABLE IF EXISTS `business_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_units`
--

LOCK TABLES `business_units` WRITE;
/*!40000 ALTER TABLE `business_units` DISABLE KEYS */;
INSERT INTO `business_units` VALUES (1,'DEPARTMENT STORE','2025-09-05 01:31:12','2025-09-05 01:56:12'),(2,'SUPERMARKET','2025-09-05 01:56:19','2025-09-05 01:56:19'),(3,'SPECIALTY STORE','2025-09-05 01:56:26','2025-09-05 01:56:26'),(4,'FOOD & BEVERAGES','2025-09-05 01:56:41','2025-09-05 01:56:41');
/*!40000 ALTER TABLE `business_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab','i:1;',1757041638),('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer','i:1757041638;',1757041638),('laravel-cache-christian.delapos2@gmail.com|10.10.99.81','i:1;',1757050809),('laravel-cache-christian.delapos2@gmail.com|10.10.99.81:timer','i:1757050809;',1757050809);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_codes`
--

DROP TABLE IF EXISTS `company_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_codes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_codes`
--

LOCK TABLES `company_codes` WRITE;
/*!40000 ALTER TABLE `company_codes` DISABLE KEYS */;
INSERT INTO `company_codes` VALUES (1,'DSG','DSG SONS GROUP, INC.','2025-09-05 01:31:12','2025-09-05 01:56:56'),(2,'TCRC','TAGUM COMMERCIAL & REALTY CORP.','2025-09-05 01:56:51','2025-09-05 01:57:23'),(3,'GDI','GAISANO DADIANGAS INC.','2025-09-05 01:57:04','2025-09-05 01:57:04'),(4,'OGAGI','ONE GRATE ASIA GROUP INC.','2025-09-05 01:57:15','2025-09-05 01:57:15');
/*!40000 ALTER TABLE `company_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'ICT','2025-09-05 01:31:12','2025-09-05 01:41:12'),(2,'HR','2025-09-05 01:54:50','2025-09-05 01:54:50'),(3,'DPS','2025-09-05 01:54:57','2025-09-05 01:54:57'),(4,'SPM','2025-09-05 01:55:00','2025-09-05 01:55:00'),(5,'LEASING','2025-09-05 01:55:04','2025-09-05 01:55:04'),(6,'ACCOUNTING','2025-09-05 01:55:07','2025-09-05 01:55:07'),(7,'FPM','2025-09-05 01:55:14','2025-09-05 01:55:14');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Driver 1',1,'2025-09-05 01:46:59','2025-09-05 01:46:59'),(2,'Driver 2',1,'2025-09-05 01:47:04','2025-09-05 01:47:04'),(3,'Driver 3',1,'2025-09-05 01:47:09','2025-09-05 01:47:09'),(4,'Driver 4',1,'2025-09-05 01:47:15','2025-09-05 01:47:15'),(5,'Driver 5',1,'2025-09-05 01:47:23','2025-09-05 01:47:23');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'0001_01_01_000002_create_jobs_table',1),(3,'2025_07_24_052628_create_business_units_table',1),(4,'2025_07_24_052631_create_company_codes_table',1),(5,'2025_07_24_052633_create_branches_table',1),(6,'2025_07_24_052636_create_departments_table',1),(7,'2025_07_24_052639_create_roles_table',1),(8,'2025_07_24_052642_create_asset_types_table',1),(9,'2025_07_24_052645_create_asset_details_table',1),(10,'2025_07_24_052649_create_asset_files_table',1),(11,'2025_07_24_052651_create_drivers_table',1),(12,'2025_07_24_052654_create_users_table',1),(13,'2025_07_24_052656_create_bookings_table',1),(14,'2025_07_24_052658_create_booked_guests_table',1),(15,'2025_07_24_052701_create_vehicle_driver_assignments_table',1),(16,'2025_07_24_052706_create_approvers_table',1),(17,'2025_07_24_052709_create_approval_logs_table',1),(18,'2025_07_28_043657_create_sessions_table',1),(19,'2025_07_29_000703_make_asset_detail_id_nullable_in_bookings_table',1),(20,'2025_07_31_101710_add_approver_fields_to_bookings_table',1),(21,'2025_07_31_133539_add_disapprove_reason_to_bookings_table',1),(22,'2025_08_05_183334_rename_file_attatchments_column_in_asset_files_table',2),(23,'2025_09_02_084350_alter_bookings_status_enum',2),(24,'2025_09_03_151408_create_permissions_table',2),(25,'2025_09_03_151417_create_role_permissions_table',2),(26,'2025_09_03_151426_create_user_permissions_table',2),(27,'2025_09_04_103202_add_allocation_fields_to_bookings_table',2),(28,'2025_09_04_131536_add_department_id_to_approvers_table',2),(29,'2025_09_04_154049_create_activity_logs_table',2),(30,'2025_09_05_085731_add_nullable_fields_to_asset_details_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `role_id` bigint unsigned NOT NULL,
  `permission_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `role_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` enum('Admin','Approver','User','Driver','Admin Staff') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (13,'User','2025-09-05 01:35:42','2025-09-05 01:35:42'),(14,'Admin','2025-09-05 01:35:42','2025-09-05 01:35:42'),(15,'Admin Staff','2025-09-05 01:35:42','2025-09-05 01:35:42'),(16,'Approver','2025-09-05 01:35:42','2025-09-05 01:35:42');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('oaEcJg6QnbpwdTuxVZ15d3QDnJBofWKeAHD8A0e2',NULL,'10.10.99.81','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoidjBVaWdzTEVEbzBCUkhsazA1ZXZQaUlyVDBnSWdTNjVIM0FGMktzWSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozODoiaHR0cDovLzEwLjEwLjk5LjgxL3JlcXVlc3Rlci9kYXNoYm9hcmQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozODoiaHR0cDovLzEwLjEwLjk5LjgxL3JlcXVlc3Rlci9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1757055732),('VMzt8QQpLDwK1ntY8BsDk17ZaXgya3Zp6SxoTGtD',4,'10.10.99.81','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQzNLdkdEamdhTjRydHpVc0Ztc1pvbU5uTjZMdENqYm01U3lqQ3JLVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMC4xMC45OS44MS9hZG1pbi1zdGFmZi9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=',1757064923),('YkU4lnRsdYfKFTOCGnV8bS6GGTRUs4ExzeDG8Ru5',NULL,'10.10.174.61','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibXRDbmp2b0o3MU5hRUtQcFVrZGxvU1BlaHBTbTNGc09Wc0NJVWlQYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMC4xMC45OS44MS9yZWdpc3RlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1757055402);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `permission_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `business_unit_id` bigint unsigned DEFAULT NULL,
  `company_code_id` bigint unsigned DEFAULT NULL,
  `can_approve` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_permissions_user_id_foreign` (`user_id`),
  KEY `user_permissions_permission_id_foreign` (`permission_id`),
  KEY `user_permissions_department_id_foreign` (`department_id`),
  KEY `user_permissions_branch_id_foreign` (`branch_id`),
  KEY `user_permissions_business_unit_id_foreign` (`business_unit_id`),
  KEY `user_permissions_company_code_id_foreign` (`company_code_id`),
  CONSTRAINT `user_permissions_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_permissions_business_unit_id_foreign` FOREIGN KEY (`business_unit_id`) REFERENCES `business_units` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_permissions_company_code_id_foreign` FOREIGN KEY (`company_code_id`) REFERENCES `company_codes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_permissions_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `business_unit_id` bigint unsigned NOT NULL,
  `company_code_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_branch_id_foreign` (`branch_id`),
  KEY `users_department_id_foreign` (`department_id`),
  KEY `users_business_unit_id_foreign` (`business_unit_id`),
  KEY `users_company_code_id_foreign` (`company_code_id`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `users_business_unit_id_foreign` FOREIGN KEY (`business_unit_id`) REFERENCES `business_units` (`id`),
  CONSTRAINT `users_company_code_id_foreign` FOREIGN KEY (`company_code_id`) REFERENCES `company_codes` (`id`),
  CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,1,1,1,14,'System','Admin','','admin@example.com','$2y$12$MBt6y/zBXLnPnQT/jBYLIejSE.9jXrHmIsI1B2UgRocPOUMSEMQfm',1,'2025-09-05 01:36:57','2025-09-05 02:07:24'),(2,1,1,1,1,16,'Christian','Delapos','313123332','delaposapprover@gmail.com','$2y$12$zSKK5GWRgcJzQwAkjrCDyeLTda427grCkPWf/Id1vnND8UAGRIwM.',1,'2025-09-05 01:47:50','2025-09-05 06:57:29'),(3,1,1,1,1,16,'Christian','Delapos2','2313113311','delaposapprover2@gmail.com','$2y$12$Mi7u7gQxOyLp7Vm4JEBO0e7n/jStnTL2vTK5kKNrxgqiZRhlBPbXm',1,'2025-09-05 02:20:45','2025-09-05 03:15:57'),(4,1,1,1,1,15,'Christian','Delapos','123441233','adminstaff@gmail.com','$2y$12$zaNrBF3BzK5r4Xx6Qc9.EuaDToj1khML.HI6ITvQAObFEpemdw2tG',1,'2025-09-05 02:33:44','2025-09-05 02:33:44'),(5,1,1,1,1,13,'CHristia','Delapos','','christian.delapos6@gmail.com','$2y$12$9Mp5ct5dI/g64F4xBnwTt.Z9UvMhFniYin6uSK0tiSMwp4htxwv0u',1,'2025-09-05 03:07:10','2025-09-05 03:07:10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_driver_assignments`
--

DROP TABLE IF EXISTS `vehicle_driver_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_driver_assignments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `driver_id` bigint unsigned NOT NULL,
  `asset_detail_id` bigint unsigned NOT NULL,
  `assigned_date` date NOT NULL,
  `assigned_by` bigint unsigned NOT NULL,
  `odometer_start` decimal(10,2) DEFAULT NULL,
  `odometer_end` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_driver_assignments_booking_id_foreign` (`booking_id`),
  KEY `vehicle_driver_assignments_driver_id_foreign` (`driver_id`),
  KEY `vehicle_driver_assignments_asset_detail_id_foreign` (`asset_detail_id`),
  KEY `vehicle_driver_assignments_assigned_by_foreign` (`assigned_by`),
  CONSTRAINT `vehicle_driver_assignments_asset_detail_id_foreign` FOREIGN KEY (`asset_detail_id`) REFERENCES `asset_details` (`id`),
  CONSTRAINT `vehicle_driver_assignments_assigned_by_foreign` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`),
  CONSTRAINT `vehicle_driver_assignments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  CONSTRAINT `vehicle_driver_assignments_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_driver_assignments`
--

LOCK TABLES `vehicle_driver_assignments` WRITE;
/*!40000 ALTER TABLE `vehicle_driver_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_driver_assignments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-05 17:53:58
