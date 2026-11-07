-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: msfurniture
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.4

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
-- Table structure for table `abandoned_carts`
--

DROP TABLE IF EXISTS `abandoned_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abandoned_carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminded_at` timestamp NULL DEFAULT NULL,
  `recovered` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abandoned_carts_cart_id_foreign` (`cart_id`),
  KEY `abandoned_carts_user_id_foreign` (`user_id`),
  CONSTRAINT `abandoned_carts_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abandoned_carts`
--

LOCK TABLES `abandoned_carts` WRITE;
/*!40000 ALTER TABLE `abandoned_carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `abandoned_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_logs_user_id_foreign` (`user_id`),
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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Home',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AU',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hero',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'DEFINE YOUR NOIR','Premium Australian Streetwear',NULL,NULL,'/shop','Shop Collection','hero',1,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(2,'NEW DROP — SS26','Limited Edition',NULL,NULL,'/shop?sort=newest','Explore','hero',1,2,'2026-10-29 09:15:32','2026-10-29 09:15:32');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
INSERT INTO `blog_categories` VALUES (1,'Culture','culture','2026-10-29 09:15:33','2026-10-29 09:15:33');
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `blog_category_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` json DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` timestamp NULL DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogs_slug_unique` (`slug`),
  KEY `blogs_blog_category_id_foreign` (`blog_category_id`),
  KEY `blogs_user_id_foreign` (`user_id`),
  CONSTRAINT `blogs_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,1,NULL,'The Rise of Australian Streetwear','australian-streetwear-rise',NULL,'How local brands are redefining luxury street culture down under.','<p>Australian streetwear is having a moment. From Melbourne laneways to Sydney beaches, a new generation of brands is blending premium materials with underground aesthetics.</p>',NULL,1,'2026-10-24 09:15:33','Australian Streetwear Rise | NOIR Collective',NULL,'2026-10-29 09:15:33','2026-10-29 09:15:33');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'NOIR','noir',NULL,1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(2,'Street Labs','street-labs',NULL,1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(3,'Urban Drift','urban-drift',NULL,1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(4,'Collective Co','collective-co',NULL,1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(5,'Arden & Co.','arden-and-co',NULL,1,0,'2026-10-29 09:15:33','2026-10-29 09:15:33');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
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
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab','i:2;',1793867187),('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer','i:1793867187;',1793867187),('laravel-cache-d5358856ac06cc81be91465a93cee75cc9974596','i:1;',1793870597),('laravel-cache-d5358856ac06cc81be91465a93cee75cc9974596:timer','i:1793870597;',1793870597),('laravel-cache-livewire-rate-limiter:78fdefa94b035affbd1bc9e8a4b40b53d5fa25a7','i:1;',1793603929),('laravel-cache-livewire-rate-limiter:78fdefa94b035affbd1bc9e8a4b40b53d5fa25a7:timer','i:1793603929;',1793603929),('laravel-cache-livewire-rate-limiter:b5c5537025475af63f34671228a92ecfee4eb1a3','i:1;',1793591678),('laravel-cache-livewire-rate-limiter:b5c5537025475af63f34671228a92ecfee4eb1a3:timer','i:1793591678;',1793591678),('laravel-cache-livewire-rate-limiter:cedc4d79a8c5f636235d4214d9e173c28b064315','i:1;',1793862419),('laravel-cache-livewire-rate-limiter:cedc4d79a8c5f636235d4214d9e173c28b064315:timer','i:1793862419;',1793862419),('laravel-cache-livewire-rate-limiter:dc5a3d74d8d04b934469fceea4f7576a31b774c4','i:1;',1793592545),('laravel-cache-livewire-rate-limiter:dc5a3d74d8d04b934469fceea4f7576a31b774c4:timer','i:1793592545;',1793592545),('laravel-cache-spatie.permission.cache','a:3:{s:5:\"alias\";a:0:{}s:11:\"permissions\";a:0:{}s:5:\"roles\";a:0:{}}',1793939090);
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
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned DEFAULT NULL,
  `quantity` int unsigned NOT NULL DEFAULT '1',
  `unit_price` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_product_variant_id_foreign` (`product_variant_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_session_id_index` (`session_id`),
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=517 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,NULL,'i5Y9d6usN2xsIMARaJpZ6ba2z5wQvBiXsr5SDRZV',NULL,'2026-10-29 09:18:28','2026-10-29 09:18:28'),(2,NULL,'4wtogSVypY0cT89mj1wxvwDxtad09k1MnrEfSWfJ',NULL,'2026-10-29 09:30:23','2026-10-29 09:30:23'),(3,NULL,'UKGtTQm8gP0JF2N0RzCuoDfRVeUHJGVNZUKn3HjT',NULL,'2026-10-29 09:30:26','2026-10-29 09:30:26'),(4,NULL,'Za4my7yPUp4BUAxGOmqZnjPBo8uc5wgPALkCRj7c',NULL,'2026-10-29 09:30:27','2026-10-29 09:30:27'),(5,NULL,'OceR9OupjX2f9951opaQX6QTjGF02w1gcuEkBC04',NULL,'2026-10-29 09:30:51','2026-10-29 09:30:51'),(6,NULL,'TI9Co5VQG90HmganhTRkd10eEO7zJK0bhSPxWHrb',NULL,'2026-10-29 09:32:30','2026-10-29 09:32:30'),(7,NULL,'k3PlfJmK7y2qsuESPoGzqtjBFDiSpOXXwh2IKnym',NULL,'2026-10-29 09:32:43','2026-10-29 09:32:43'),(8,NULL,'TT9aZMVVdYbCqoPwp3QCsIzrAfa6Zy4sXsZEh33R',NULL,'2026-10-29 09:32:45','2026-10-29 09:32:45'),(9,NULL,'o600vhBFmtcOzBUsAS2f1rVJnmWSKsQMRZg9SbEq',NULL,'2026-10-29 09:33:40','2026-10-29 09:33:40'),(10,NULL,'X4CxVpfW6zWkCiINrBcp1A9qpZTmSGMxQOspm4zx',NULL,'2026-10-29 09:34:32','2026-10-29 09:34:32'),(11,NULL,'ymNpajWGZ015D6MaOEgNxlqnnoJyJ9hTXHaLUFSS',NULL,'2026-10-29 09:34:57','2026-10-29 09:34:57'),(12,NULL,'lpqKDj3eWXfvpGV2jsoU5mfsqQrTYDKJd7AHeWOb',NULL,'2026-10-29 09:43:37','2026-10-29 09:43:37'),(13,NULL,'3TZHKH1FzqavISmBoLneOdXsr0jszTVDNMS7KvTa',NULL,'2026-10-29 09:45:11','2026-10-29 09:45:11'),(14,NULL,'T9qo2c10OYDzaAEd9JQQko1Nu4IU4cdZL53OTuTo',NULL,'2026-10-29 09:46:13','2026-10-29 09:46:13'),(15,NULL,'QKUpHvkOTgSCv8LM1r2lTUhoVjg8x2vBHvwTZl7x',NULL,'2026-10-29 09:46:30','2026-10-29 09:46:30'),(16,NULL,'IDQYFqQUVTzZ8WGZhrMd2oL1RBLHkWUOEPakENc3',NULL,'2026-10-29 09:47:19','2026-10-29 09:47:19'),(17,NULL,'r251zWsGyNshCGnutRdSH53WWvlRPSdcZOEEP078',NULL,'2026-10-29 09:51:30','2026-10-29 09:51:30'),(18,NULL,'dP36Y1eKOA8OdBFD8I34WVCg3T4r19PKCQDeqy4T',NULL,'2026-10-29 09:57:22','2026-10-29 09:57:22'),(19,NULL,'5xnEPUHEFztStitWotJEGA4OElYt6QvXhy148kx1',NULL,'2026-10-29 09:59:53','2026-10-29 09:59:53'),(20,NULL,'dFHOfeEbLfW2HAaDwH14PmcSvH1WDpAAIvwWwMog',NULL,'2026-10-29 09:59:58','2026-10-29 09:59:58'),(21,NULL,'UjFluwAeEVYeaC8Yy2kR2bkcrR0DHJuU9qIwAR3b',NULL,'2026-10-29 10:00:01','2026-10-29 10:00:01'),(22,NULL,'QEoNLZWZzdLYAY61wVNMUyoSrdePRtrnP6UB1Tcx',NULL,'2026-10-29 10:00:34','2026-10-29 10:00:34'),(23,NULL,'dE2e5HSdbbKBKM1Za4rt5hiSmo0mSo4rA116QvRI',NULL,'2026-10-29 10:00:52','2026-10-29 10:00:52'),(24,NULL,'TPpfL6v8slNLG0CPyeo2grDKa3b0xWiymwSrfb5E',NULL,'2026-10-29 10:01:17','2026-10-29 10:01:17'),(25,NULL,'lbLOyKWLlOp7zGM8Ua08bCOIo3IPvKHodGRvFRrv',NULL,'2026-10-29 10:01:30','2026-10-29 10:01:30'),(26,NULL,'mZV2sWsADESCC2dl0y0ZHH5uGorIeBkxsNeWLFEr',NULL,'2026-10-29 10:02:03','2026-10-29 10:02:03'),(27,NULL,'hpCUqDuYIVLaPbwQNs4gNkpbFj7VXs5HL6LZGjFb',NULL,'2026-10-29 10:02:10','2026-10-29 10:02:10'),(28,NULL,'Dp9bbtRJJY4KkBLQo8t6j4lu8T7emmgybcjz7lYg',NULL,'2026-10-29 10:02:30','2026-10-29 10:02:30'),(29,NULL,'0fxlhiaMlrhIktgJX6FOvPZTKqQ5Pm1kTqaE8mlE',NULL,'2026-10-29 10:03:24','2026-10-29 10:03:24'),(30,NULL,'xVjF89RSQWWxwc48zvoEazLVPiHvYdxDbgNHMwsj',NULL,'2026-10-29 10:13:02','2026-10-29 10:13:02'),(31,NULL,'Np0lThTcNCcCxw3Aw28XJRhpLYmyVtkkz7by0Vfs',NULL,'2026-10-29 10:30:32','2026-10-29 10:30:32'),(32,NULL,'ZFaY6alCiox2RrAvGPbIWxUpEFKvhfAF5xGaw6tK',NULL,'2026-10-29 10:40:00','2026-10-29 10:40:00'),(33,NULL,'7NBOronTRm0o4RRevUd5XrxSPjlLTLkdzGPAPhT9',NULL,'2026-10-29 10:40:04','2026-10-29 10:40:04'),(34,NULL,'OID3nxbbQnM8aSEnno2VozmzsD8zzOfdX1ZPFl0c',NULL,'2026-10-29 10:40:17','2026-10-29 10:40:17'),(35,NULL,'3GNonAxKS3TiTrRp5QYKV89fwtqX65JKKmJiNwUp',NULL,'2026-10-29 11:42:41','2026-10-29 11:42:41'),(36,NULL,'IpxU87OwtY4BBgk8PUO7rGReyuXN16PkoZQj2K8v',NULL,'2026-10-29 11:52:35','2026-10-29 11:52:35'),(37,NULL,'VspkTTfiy6hWkYVkBlm208XPUQ8qNQrAgpjZSogY',NULL,'2026-10-29 12:13:14','2026-10-29 12:13:14'),(38,NULL,'bd7WFbwPrYk9jT2QtQyKwAoMs0nGzDQH65bzHRgY',NULL,'2026-10-29 12:21:36','2026-10-29 12:21:36'),(39,NULL,'khF3v8BLEnXKiy7Ilqm9Dhn2G18k7UheRvD1ebvr',NULL,'2026-10-29 12:26:28','2026-10-29 12:26:28'),(40,NULL,'3lCCEbK4y2N8Yra6d5dHiLcCmEtFHwY1NLXeL6YA',NULL,'2026-10-29 12:27:31','2026-10-29 12:27:31'),(41,NULL,'6oGMVR3QphlgqmWoRhL1te0e4VGiBCcwObLTDO3X',NULL,'2026-10-29 13:19:42','2026-10-29 13:19:42'),(42,NULL,'fiR8Dh9zOxudPFIxP62OCyLRi17gJI7x4HuA171R',NULL,'2026-10-29 13:25:17','2026-10-29 13:25:17'),(43,NULL,'wvP2yXgumedOlGoFhYLib8WLYwSsoOEsbRdgs2id',NULL,'2026-10-29 13:32:30','2026-10-29 13:32:30'),(44,NULL,'7EcwcHceujLHwYj2oI3lryNCv6ETYQuw7XSoxGcE',NULL,'2026-10-29 13:36:22','2026-10-29 13:36:22'),(45,NULL,'gprIChoCRAlDqMaAe83waFtK80noG0Bb6kQzW5Zg',NULL,'2026-10-29 13:36:26','2026-10-29 13:36:26'),(46,NULL,'Oe1mmrQvxhQ8Rt2YuEJa8BP5lS37cF1le6oVng6S',NULL,'2026-10-29 13:36:27','2026-10-29 13:36:27'),(47,NULL,'vIftBaytiUVEzNndAT8fQoxIpNqZPK4lERM7sVSQ',NULL,'2026-10-29 13:36:27','2026-10-29 13:36:27'),(48,NULL,'Z9uXikVBWIYD0CU9VgMvW51zAEAcKWmpXW5lQJ76',NULL,'2026-10-29 13:36:31','2026-10-29 13:36:31'),(49,NULL,'IoILJV95ldraT0HLrqOwkFpd22jPSESG7JRNdEdx',NULL,'2026-10-29 13:36:34','2026-10-29 13:36:34'),(50,NULL,'W9u1zFhY1WBFgonGHxwXJ7jMzhucreky7qNDhwfC',NULL,'2026-10-29 13:39:13','2026-10-29 13:39:13'),(51,NULL,'iMuHKTgkiqFFD5chL5ejKWu6BB5LrpZ6p6cvZrXC',NULL,'2026-10-29 13:42:48','2026-10-29 13:42:48'),(52,NULL,'ny6cYNMVLP2L90gvBSFdUERBE1FqAAs24hfHNxD1',NULL,'2026-10-29 14:17:31','2026-10-29 14:17:31'),(53,NULL,'0q0UW4su9mPmAxp2g50qQcKtxRPyqlZDsbHCTPRj',NULL,'2026-10-29 14:24:36','2026-10-29 14:24:36'),(54,NULL,'qyC7UJ849bzH7GtxodOqKYXj2pIaIDl9UKGRpYyD',NULL,'2026-10-29 14:24:36','2026-10-29 14:24:36'),(55,NULL,'AF3GS4qFED7xRLtnMMGdIU4yNRoGpOK59gk7dF12',NULL,'2026-10-29 14:54:18','2026-10-29 14:54:18'),(56,NULL,'jhIQE6pkvxNmi02LdanGuvy0L0t0YP8GtZCVWO22',NULL,'2026-10-29 15:07:14','2026-10-29 15:07:14'),(57,NULL,'hU8hvKQiKBLZDLD9XSrNqJ8Cxnd5ElEb4xX1AwU0',NULL,'2026-10-29 15:20:23','2026-10-29 15:20:23'),(58,NULL,'ARFL3Gdl1mP0ExUODc1wc1p5K3qVXYq4UlGWHVFb',NULL,'2026-10-29 15:20:27','2026-10-29 15:20:27'),(59,NULL,'AYj3NgwJmb1Nz5Kqx8Pe2Co0Z5mAKTuL04B1LdM9',NULL,'2026-10-29 15:27:38','2026-10-29 15:27:38'),(60,NULL,'2bCw5AieSnRbS14Y5s4Hz4uBUIotLtyuc5FO4KZm',NULL,'2026-10-29 17:03:33','2026-10-29 17:03:33'),(61,NULL,'to1oN7cRW19YkXLqr1SkHVW5qqEWXBHOi9iJNZMJ',NULL,'2026-10-29 17:03:34','2026-10-29 17:03:34'),(62,NULL,'s8T5jEVqj3dmobpwC4GtlKwKIzxM8PBlII1Vw2Uc',NULL,'2026-10-29 17:36:32','2026-10-29 17:36:32'),(63,NULL,'JxgGRPbmpoFkCsmczAH5CqY9LxX2NqsBIKTCoO4U',NULL,'2026-10-29 17:57:54','2026-10-29 17:57:54'),(64,NULL,'rV9x0pdLcHkDiFxXpVdTGLF2xZaeq4P3rIgggTY8',NULL,'2026-10-29 18:54:51','2026-10-29 18:54:51'),(65,NULL,'R8CUCDTp1aibs59gOHEgm8acdeMRZLgnS0kPTtH0',NULL,'2026-10-29 21:24:10','2026-10-29 21:24:10'),(66,NULL,'xJMErtUwCZWEGKdOvzWPglDxZHvTh3sWbzz6T8Ct',NULL,'2026-10-29 22:06:40','2026-10-29 22:06:40'),(67,NULL,'w0ea9caeZwqL0XPxc3tayipippnloAwkVtLKEuSv',NULL,'2026-10-29 22:16:01','2026-10-29 22:16:01'),(68,NULL,'sBpzO9UqbiHZoAUIHfUeFVCynYVnhPWQZLPeGM1h',NULL,'2026-10-29 23:20:27','2026-10-29 23:20:27'),(69,NULL,'biJE6rTdwkHEdFgWKTMlXDWxxa6PmOPEAD9lPyQ9',NULL,'2026-10-29 23:40:29','2026-10-29 23:40:29'),(70,NULL,'ZmxoEtaFYaLcqwWWSW14RFrBGWuucT0YhCDAD79z',NULL,'2026-10-30 00:08:53','2026-10-30 00:08:53'),(71,NULL,'0KsCxTzksQXDo0CsRtKFRmHLcoCWSgHHK1Xq3F6B',NULL,'2026-10-30 00:39:19','2026-10-30 00:39:19'),(72,NULL,'wODiiCk4moUfGawrtdWJl0k3s3KdYbCon53xbBj4',NULL,'2026-10-30 00:39:19','2026-10-30 00:39:19'),(73,NULL,'buIjTnOn6kL4jVKDO2mWKkw81FSKqPg9j2iRGuFl',NULL,'2026-10-30 00:39:19','2026-10-30 00:39:19'),(74,NULL,'e3zvbUVULtCeDuFUwoH1i8BUA5dytbsqMgJcrYHQ',NULL,'2026-10-30 00:39:19','2026-10-30 00:39:19'),(75,NULL,'sXFIbFMbp6oQugtKK4LreiS8Ftde0OYQgAhb1twY',NULL,'2026-10-30 00:39:19','2026-10-30 00:39:19'),(76,NULL,'kBcLoUKpebzkUJJUI18JSrUK898yERlW1sHVdgNk',NULL,'2026-10-30 00:39:20','2026-10-30 00:39:20'),(77,NULL,'33rE5WyRhPmkmXF4WyvZFRiekBeqD7M3zX4T6d8f',NULL,'2026-10-30 00:39:21','2026-10-30 00:39:21'),(78,NULL,'iduDRh2D6VYRxYIi3DGvpTk6a4qHqTH88MtBOcJ9',NULL,'2026-10-30 01:00:15','2026-10-30 01:00:15'),(79,NULL,'tSpAlwsLMhVz7IiuNzMNjMFZPpT6b2IB1VnGB7WW',NULL,'2026-10-30 01:34:17','2026-10-30 01:34:17'),(80,NULL,'kDXcvsInd2QUj71zZKHuMYktDUZ8SLKZoZDeq1bu',NULL,'2026-10-30 03:44:33','2026-10-30 03:44:33'),(81,NULL,'7BTAO7h4737Z7XbNUoxmfng5uotPbn2fUUgkFZFn',NULL,'2026-10-30 04:11:34','2026-10-30 04:11:34'),(82,NULL,'nDmUDwnPH6rHQVjrk81VN4apdAXO02SfFKayk4j2',NULL,'2026-10-30 05:55:44','2026-10-30 05:55:44'),(83,NULL,'pJj9OxBmhWKBM6L9qEPqbWWEmL7XTF7a4gUOmonA',NULL,'2026-10-30 06:19:01','2026-10-30 06:19:01'),(84,NULL,'6qeN5sgezTt3Irdc9OOi6UiNwKLyqPRPDVkTWKGX',NULL,'2026-10-30 07:00:29','2026-10-30 07:00:29'),(85,NULL,'VWRQNFjMYh0V9sN5FXks7gnz1FJu14RiipG4H8oZ',NULL,'2026-10-30 07:05:50','2026-10-30 07:05:50'),(86,NULL,'58Jowgo5QMTHcnTNfPcrT7JfD2qEv8UrbTOcD0iy',NULL,'2026-10-30 07:05:59','2026-10-30 07:05:59'),(87,NULL,'K6Oe1lgTiyRronMcr6hxSOZxPmZWxeV4tR19xznE',NULL,'2026-10-30 07:06:01','2026-10-30 07:06:01'),(88,NULL,'ta62Z9FfYAclRDJ2SwsNLrP9B0MwtXU0uO0jWkKt',NULL,'2026-10-30 07:14:45','2026-10-30 07:14:45'),(89,NULL,'TGl4rMxIHfPvK3USdF81kvylNHSzX8QhSUOzo4fn',NULL,'2026-10-30 07:18:49','2026-10-30 07:18:49'),(90,NULL,'tAQofDtU0iGFqrbjJPFLymBdWFV8xFPLj4fm8UGu',NULL,'2026-10-30 07:33:53','2026-10-30 07:33:53'),(91,NULL,'eXx2OBuYcC7VY4D2pyztU6nMbnmDrzU1UQs57y8K',NULL,'2026-10-30 08:02:52','2026-10-30 08:02:52'),(92,NULL,'0tQcY4lHXXYL9Gi4wgmTB4aTDsUyTXjXt03MceWE',NULL,'2026-10-30 08:08:04','2026-10-30 08:08:04'),(93,NULL,'l0e64wIfMubWBKB2K9CBgNEsKfAnkLIyexuz1w3W',NULL,'2026-10-30 08:22:18','2026-10-30 08:22:18'),(94,NULL,'vUnJFrctRu0g1jwz0ImKMIybNe8Be2Jw68pT2fl2',NULL,'2026-10-30 08:53:08','2026-10-30 08:53:08'),(95,NULL,'eo6ja3nORDPInhr2QGCjbXgOnFvWKCcYQ5ggkw4c',NULL,'2026-10-30 09:00:02','2026-10-30 09:00:02'),(96,NULL,'zHGU1gn4H0vA6h1cwwQQ8kaUUggwXUqf6En5snyt',NULL,'2026-10-30 10:14:42','2026-10-30 10:14:42'),(97,NULL,'8NeIvkwreBzryGjxSbMOJ5x5TSJFR30qbLQqCaz6',NULL,'2026-10-30 10:37:37','2026-10-30 10:37:37'),(98,NULL,'V5dMVgt0WrIn53tFmVhbJgFf2k2vFC46gYrBnXuZ',NULL,'2026-10-30 11:05:50','2026-10-30 11:05:50'),(99,NULL,'FcFDCL0JWQ3LBWro0Cq0S8HwSX5mKjYoSo6S1uhD',NULL,'2026-10-30 11:50:52','2026-10-30 11:50:52'),(100,NULL,'Iu4ehyLEza7Fd2o0QTgF1eVTXpuEovB4O7Haj91W',NULL,'2026-10-30 11:55:11','2026-10-30 11:55:11'),(101,NULL,'RVknXRtUU3hmkgaADnD1NDzePAVtaH3fCeQStu6v',NULL,'2026-10-30 13:20:13','2026-10-30 13:20:13'),(102,NULL,'ABBhL6ZVeEHN9CryGSWoR7E0XWscIRx5z5d4qkyr',NULL,'2026-10-30 13:25:54','2026-10-30 13:25:54'),(103,NULL,'txaZDkNhPx5fbI625Q2GAG5v7OyRgi0wMiSTlQWv',NULL,'2026-10-30 13:27:11','2026-10-30 13:27:11'),(104,NULL,'FLVZq6KH1kzLuU87gtNLlLurGqikS83WInYO5txh',NULL,'2026-10-30 14:01:02','2026-10-30 14:01:02'),(105,NULL,'ROKHwrTKMXgutzUmeRDfGKorkXW5zodZzltouh8F',NULL,'2026-10-30 14:01:36','2026-10-30 14:01:36'),(106,NULL,'NNW67ULx5GvdTcmf6jsx1aeTC0Jq9wZ9nkc7HwHN',NULL,'2026-10-30 14:01:37','2026-10-30 14:01:37'),(107,NULL,'74UmYfEtNMgkYtpbp9BsQVgVyszXL10XXOqLSsRr',NULL,'2026-10-30 14:13:58','2026-10-30 14:13:58'),(108,NULL,'AeeAQDoWvwnJVD4xTMSY3NB20WXAoHGyhKDByi0n',NULL,'2026-10-30 14:23:37','2026-10-30 14:23:37'),(109,NULL,'LgShc3VBhjbuLd1U3e3iRFwX2axFH2iO87P22S0S',NULL,'2026-10-30 14:46:10','2026-10-30 14:46:10'),(110,NULL,'vtq5sJsw3PrBKm9xDneNoBYLiFOghDfKYKdt1QLp',NULL,'2026-10-30 14:46:11','2026-10-30 14:46:11'),(111,NULL,'nRrwcpbUlbFMc8xvo818t4anqaWqYbDUHhWeWFgY',NULL,'2026-10-30 14:46:13','2026-10-30 14:46:13'),(112,NULL,'SygERGYOxCxzCjFmSimnD8BdAleh5K4BVgpj37Ju',NULL,'2026-10-30 14:50:17','2026-10-30 14:50:17'),(113,NULL,'HwUgvv1s6G33CULYLcY0gClZrBgXDXk6jcj6vrWn',NULL,'2026-10-30 15:28:37','2026-10-30 15:28:37'),(114,NULL,'G9Ox6oQceD3quWMN1NvrjoUTSOY92GekwUm6ypBl',NULL,'2026-10-30 15:33:50','2026-10-30 15:33:50'),(115,NULL,'YMg06HrrPMbSt299UZmIgNRe4j5mxBIVKlU5aZXD',NULL,'2026-10-30 15:45:02','2026-10-30 15:45:02'),(116,NULL,'CCpylpFxAmDGH4A8i5XjBUBqcjMZh114mckrez5i',NULL,'2026-10-30 16:19:21','2026-10-30 16:19:21'),(117,NULL,'OkBRoS9RgEocRqiNLsu0mnC2ho2JHK4XVre19rIH',NULL,'2026-10-30 17:29:13','2026-10-30 17:29:13'),(118,NULL,'WJ2oPpg9did29FLxnhAudeB73RKvNko4yj4rp7Jv',NULL,'2026-10-30 17:36:03','2026-10-30 17:36:03'),(119,NULL,'HjMSAJ344YP4KHlTYwYCL2ykNSkUPCFh5NQrsO3N',NULL,'2026-10-30 17:42:08','2026-10-30 17:42:08'),(120,NULL,'poQ8wQUYJQ19e5ONW8KNTBcqHyfjZJGi7LbzZM9E',NULL,'2026-10-30 17:43:18','2026-10-30 17:43:18'),(121,NULL,'uqWu1BIf7lmE1VIbDnCF7Hvk2mQvU84iHT60TX1M',NULL,'2026-10-30 17:50:18','2026-10-30 17:50:18'),(122,NULL,'KHVqzbpiEFZH3bbYxEaVKKlGbyhYCYiAPTwuRo3l',NULL,'2026-10-30 18:22:09','2026-10-30 18:22:09'),(123,NULL,'FvHSs7jyDgPPqXLLpWnOlHdHT0sKa2kojWJYH2jk',NULL,'2026-10-30 18:47:44','2026-10-30 18:47:44'),(124,NULL,'yAXMToFIv6xL8wlw9TzYnAm4xnlQyBR1nPtzSrl0',NULL,'2026-10-30 19:06:03','2026-10-30 19:06:03'),(125,NULL,'01ngjlXek94n6Zhl1SVIYeoTFfJAFz6VS9aU6YvZ',NULL,'2026-10-30 19:32:58','2026-10-30 19:32:58'),(126,NULL,'rcDNDRUk2IMrePwwr1QKjIrQ3JlrgkBklBECohx9',NULL,'2026-10-30 19:49:27','2026-10-30 19:49:27'),(127,NULL,'qH072N0T5GHgYy8xtTGH1kF6SVoCKBrv59X23hyg',NULL,'2026-10-30 21:00:32','2026-10-30 21:00:32'),(128,NULL,'1TXLbbFFOaFrkChvAfhbUNOIcaElJXy4IGxoIRUE',NULL,'2026-10-30 21:34:32','2026-10-30 21:34:32'),(129,NULL,'dyKZonTROd098Mhxm1gzuh8gj3jBacSA5KvQMRn3',NULL,'2026-10-30 21:50:11','2026-10-30 21:50:11'),(130,NULL,'XBlbmYwpTqTO2UGpS0eiZp4ERopdDNdF38tf8uqO',NULL,'2026-10-30 22:12:27','2026-10-30 22:12:27'),(131,NULL,'ZAEyElJldEzbJa8mhziISBtyrGzKpvvluiZDVhJZ',NULL,'2026-10-30 23:03:44','2026-10-30 23:03:44'),(132,NULL,'GXCNTVb3ES4y8VDNkP944pSRrZuzkPikJICCzVw8',NULL,'2026-10-31 01:02:31','2026-10-31 01:02:31'),(133,NULL,'lDaVg4RC7bL5x690TC6E3Gsyg3nWN96l3F2kcI6m',NULL,'2026-10-31 01:02:33','2026-10-31 01:02:33'),(134,NULL,'N9GG3mZiIGCWssRogXeOqHC2Urxi7lsqN8Mgmjv5',NULL,'2026-10-31 01:02:35','2026-10-31 01:02:35'),(135,NULL,'VpRdWHSeroAwwLxz54PhpdSJyzwpA9nII47XgYjM',NULL,'2026-10-31 01:02:39','2026-10-31 01:02:39'),(136,NULL,'Syjpo4ZAJSRV5lAEJ83VyEjHNtprweXoF6OenWbG',NULL,'2026-10-31 01:16:26','2026-10-31 01:16:26'),(137,NULL,'6Bb9DWpOjSXNiRzUZkil9HkaBT1Ny0i7OCGfXHJ6',NULL,'2026-10-31 01:24:16','2026-10-31 01:24:16'),(138,NULL,'nWcNB0hJbEfZNlDIaPqoodNCnqXVxbPsDML0uJ4D',NULL,'2026-10-31 01:27:49','2026-10-31 01:27:49'),(139,NULL,'1zrWYve6I9g0OpLlzO31E6j3fB7Zm8LaGtZJ3uPI',NULL,'2026-10-31 03:16:56','2026-10-31 03:16:56'),(140,NULL,'JiVYKzhVl4YEIxvFmdfOiQ9qsccohXjkPKVnje77',NULL,'2026-10-31 04:12:00','2026-10-31 04:12:00'),(141,NULL,'KHwpk18Z86G2Me2L3I7E8sZHYUp7XdXggFBD8Ypq',NULL,'2026-10-31 04:43:03','2026-10-31 04:43:03'),(142,NULL,'7mSHVsQLnxpwXntCzJ00QGuNAdE3eDdQJG4Bcx50',NULL,'2026-10-31 05:12:44','2026-10-31 05:12:44'),(143,NULL,'4raZ16zWeZKrud0y1q9AjReYJ34PAFELL8xi93Vj',NULL,'2026-10-31 05:13:01','2026-10-31 05:13:01'),(144,NULL,'aucTaGTUziROvPWFGSMH5NNFrcnaugwgtEKMHywL',NULL,'2026-10-31 05:29:50','2026-10-31 05:29:50'),(145,NULL,'lyVzK72MpQoWfWouua8lVH0xYwtjzq98H7V3I8X5',NULL,'2026-10-31 06:10:24','2026-10-31 06:10:24'),(146,NULL,'ylI7fYpughpKVLUKaqZtVWmHhPeX5CfBCeCEa8dz',NULL,'2026-10-31 07:14:16','2026-10-31 07:14:16'),(147,NULL,'moVQ19j6saq2Y8zfNy4ndZVqaJwfl8p6Rnhb721w',NULL,'2026-10-31 07:15:07','2026-10-31 07:15:07'),(148,NULL,'yz8zdUA8tyLfuWhNHhrPkh1RHN1zqPsmcLc8Fdmd',NULL,'2026-10-31 07:48:37','2026-10-31 07:48:37'),(149,NULL,'XYyW6SuHku951lK4M5Jn57WlsJo0KTNnHqAPc8ZW',NULL,'2026-10-31 08:19:18','2026-10-31 08:19:18'),(150,NULL,'Ndu0GBF4n2VEciIUEZy9EDo3E300ve019Mrde3Zq',NULL,'2026-10-31 08:32:27','2026-10-31 08:32:27'),(151,NULL,'1RBxItCEFDwZ6SHt9MXTSKFfkUdA0eguDzPFFbdn',NULL,'2026-10-31 10:10:30','2026-10-31 10:10:30'),(152,NULL,'cL1kXDODoNM3RvTag7E4ZLPNPjnUjP3ydqrEnMxh',NULL,'2026-10-31 10:11:13','2026-10-31 10:11:13'),(153,NULL,'vyPwSVvbrP7haQ5T185fQMGhRuuuHdLyanb0jBNk',NULL,'2026-10-31 10:13:56','2026-10-31 10:13:56'),(154,NULL,'w4pNDAoKzRk6wWxzCLdgqQH5R2wkXiFQ2nwGwxMj',NULL,'2026-10-31 10:18:34','2026-10-31 10:18:34'),(155,NULL,'SkE8H8XBLmdJCXZ5qgHn5Hh1CSTCROzysglwpnKG',NULL,'2026-10-31 11:16:55','2026-10-31 11:16:55'),(156,NULL,'bYXuHyyrgGAfS2FUGyFdZaVWSdz505YH8ilZG2JY',NULL,'2026-10-31 11:26:43','2026-10-31 11:26:43'),(157,NULL,'cXzN1BY4hfj0oYkV92sNilSGyupLyw97EIiI4ANl',NULL,'2026-10-31 11:26:51','2026-10-31 11:26:51'),(158,NULL,'L1ZQ2f2cn0wNHmsIQ6AjRtuvQ19cn2ksBnkKZRtw',NULL,'2026-10-31 11:29:04','2026-10-31 11:29:04'),(159,NULL,'yVE6KjYPIyxV5Rpn8bnui2E2Q0am9eVb0BpsFoss',NULL,'2026-10-31 11:45:47','2026-10-31 11:45:47'),(160,NULL,'J8j7ln2JeHXXFOUXCZjU3k724ox5wHNwLq4uCVP5',NULL,'2026-10-31 11:53:15','2026-10-31 11:53:15'),(161,NULL,'YOTAzh2XVCsvTkDCfymMmF73p9VYMHNeQqLfQG4G',NULL,'2026-10-31 11:53:18','2026-10-31 11:53:18'),(162,NULL,'8noodqw1Jrr8n3PkStVV7tzKDgK68lyCFLgeb2qF',NULL,'2026-10-31 11:53:20','2026-10-31 11:53:20'),(163,NULL,'7iirQKhEXdH3Q3qcgKY15lFXQbKMH1vbg4NAjSd1',NULL,'2026-10-31 11:53:22','2026-10-31 11:53:22'),(164,NULL,'B9h46xW981iGSBkDC3VroUmzJn5b3Yrc4K7yANCw',NULL,'2026-10-31 12:26:30','2026-10-31 12:26:30'),(165,NULL,'i9XkUesUM1cvmCWpUKXXAtyYoLDN0z2Jsoj4bnt3',NULL,'2026-10-31 13:05:31','2026-10-31 13:05:31'),(166,NULL,'f1LtqdQkj2wlEmiPiLa7G15tuNpbf5IKYHo4U2AI',NULL,'2026-10-31 13:06:38','2026-10-31 13:06:38'),(167,NULL,'pUfZuOeR8BngGNeDRrj4UgARfS8t5tLk10ktCHi0',NULL,'2026-10-31 13:49:12','2026-10-31 13:49:12'),(168,NULL,'vqykhqGEasCXW87nI5AIMRcSlynWtUTsnCSIP0mA',NULL,'2026-10-31 14:20:05','2026-10-31 14:20:05'),(169,NULL,'0bj2Fz0tohoCaDHLoKcRbJwg7tShf184qHCFnW1o',NULL,'2026-10-31 14:39:32','2026-10-31 14:39:32'),(170,NULL,'I63PkDliTpBDvrbWNVslaKb8IRxE2t9UYCVpSDiE',NULL,'2026-10-31 15:36:19','2026-10-31 15:36:19'),(171,NULL,'rKWxJnjMIhX9ripclJKx3Kp5wBoj0NrZqkjWftBg',NULL,'2026-10-31 15:58:45','2026-10-31 15:58:45'),(172,NULL,'xrEWqK8gogZbEMcWiMA7JjHRlLjw075JACYzlHpb',NULL,'2026-10-31 16:56:50','2026-10-31 16:56:50'),(173,NULL,'ZdK2ClRFFJY4QoEZjRUkhfDKDMDnDP3BZjGsJ7wO',NULL,'2026-10-31 17:52:48','2026-10-31 17:52:48'),(174,NULL,'nYOrd0qguy4iLDhyznwybxQzMcXma6RyQO8GQMSC',NULL,'2026-10-31 18:09:48','2026-10-31 18:09:48'),(175,NULL,'IZ8238fYw3M6dct8Q5nztvuX5YeyLgj5u09viONM',NULL,'2026-10-31 18:10:04','2026-10-31 18:10:04'),(176,NULL,'DyeJ1BYM8MXIi64ax1mHYjBCWIhF7pICYyQV11UH',NULL,'2026-10-31 18:12:45','2026-10-31 18:12:45'),(177,NULL,'hOTt3U5T3AJxlxHEmuzgIkqI1TIXn6eTbcUQ5Dnj',NULL,'2026-10-31 18:28:47','2026-10-31 18:28:47'),(178,NULL,'rkRBRQS7T6rLItTURFwl4RgADWQbsH9CAiQ3onCh',NULL,'2026-10-31 18:31:38','2026-10-31 18:31:38'),(179,NULL,'KrQbBFupB1wsvQzHvBaPE1fBV8MeTLL5dHwovYlg',NULL,'2026-10-31 19:19:05','2026-10-31 19:19:05'),(180,NULL,'vAVfnbxKrXNPGADIfF2PG5cq6H9pC0zwtsMJtxsg',NULL,'2026-10-31 19:33:51','2026-10-31 19:33:51'),(181,NULL,'xI9258ujeGfR6oGgHueB7PHGcCIub10QwqByhBno',NULL,'2026-10-31 20:21:50','2026-10-31 20:21:50'),(182,NULL,'rOH0LKg7T0q2gzud3Pk3YGmNvyZizPg7HbMFcpnN',NULL,'2026-10-31 21:05:10','2026-10-31 21:05:10'),(183,NULL,'bXLB6tTbSzaBjoTklOKCakMelu9EDoF4FoAsCpCn',NULL,'2026-10-31 21:12:36','2026-10-31 21:12:36'),(184,NULL,'xY1q12M2G0wWGJgmnNJULE0UbPQQA9fDZxvtcdu1',NULL,'2026-10-31 21:12:51','2026-10-31 21:12:51'),(185,NULL,'XsX2aHGuTirIWRpuUWfRIgdxNVrRWYrt05bQm0mR',NULL,'2026-10-31 21:46:35','2026-10-31 21:46:35'),(186,NULL,'BftvdlIMCHXb9w9RrS8S7kiy3QITqaXKyUAOGiej',NULL,'2026-10-31 21:47:39','2026-10-31 21:47:39'),(187,NULL,'TZ1nRwOeSXwMxx81mCvASPyJ1a3ojIz30AgTB0LO',NULL,'2026-11-01 00:12:43','2026-11-01 00:12:43'),(188,NULL,'odBLRGu1eBsbbccEJD2IbBLUlOZSzNKqJ1b7GJLa',NULL,'2026-11-01 00:27:49','2026-11-01 00:27:49'),(189,NULL,'UeONp8otqwr1TgjLPrxE0ESyu37o5r2ogKaJPi51',NULL,'2026-11-01 01:44:16','2026-11-01 01:44:16'),(190,NULL,'1KEIDrWnbf5nwlr7X1CMFMYv1T0has6T5DRl5dxv',NULL,'2026-11-01 01:47:14','2026-11-01 01:47:14'),(191,NULL,'vhrb5oZbVBogcVwqRTKFXMzMInPbPaIGFF3oxbaJ',NULL,'2026-11-01 02:39:00','2026-11-01 02:39:00'),(192,NULL,'7shYPaGjgh6NPArHoVT9FXtXg2eF8ZAhG9GbWt3N',NULL,'2026-11-01 02:47:41','2026-11-01 02:47:41'),(193,NULL,'kw7eiPqUGmUEQKbkOSlc4Y6HTN74z2FrhDVwauCX',NULL,'2026-11-01 03:23:08','2026-11-01 03:23:08'),(194,NULL,'xZROosUnnPUwFRGW7U2mbpXLhh855BOC863wev05',NULL,'2026-11-01 03:32:10','2026-11-01 03:32:10'),(195,NULL,'UdnaYfmxxD11J0s240smWHBcpRKePZIsReULZafJ',NULL,'2026-11-01 04:09:43','2026-11-01 04:09:43'),(196,NULL,'LORY4YPcDWtnnwhTGu3aV024cin9gwhQtgwZi1kb',NULL,'2026-11-01 04:17:53','2026-11-01 04:17:53'),(197,NULL,'YxAu8Hncxpd9EsmXXvLxfSRES9cbwtQxVUt8L4kO',NULL,'2026-11-01 04:45:33','2026-11-01 04:45:33'),(198,NULL,'XuIs0n1EmMnd2RXznDhgDFDo3PbgqaMcxSPGvwb7',NULL,'2026-11-01 04:47:53','2026-11-01 04:47:53'),(199,NULL,'UiBICK701sOG0O8fMJl6J0njuB5KmSp2bllUws8I',NULL,'2026-11-01 04:48:24','2026-11-01 04:48:24'),(200,NULL,'DdTmA5tSU1Rfn4NV6FfiuhtgZKsqKQKj0Wl8S5YN',NULL,'2026-11-01 04:52:02','2026-11-01 04:52:02'),(201,NULL,'hrUXb5a25cCcJPQZ5CKMyIRTziSFkADUEMubXmAi',NULL,'2026-11-01 04:56:30','2026-11-01 04:56:30'),(202,NULL,'2HRdhkrz1drSIgtfQqLWgUoW3T0v3j54cITt6E3a',NULL,'2026-11-01 04:59:09','2026-11-01 04:59:09'),(203,NULL,'lyKYQcUV8pRAAuY3H5kFtSNQWV6xMSCvjFS0LSWq',NULL,'2026-11-01 05:01:09','2026-11-01 05:01:09'),(204,NULL,'LodqtzDHg7vxP3GvxGgWuShEdEcvEooMLmrRKkPL',NULL,'2026-11-01 05:17:53','2026-11-01 05:17:53'),(205,NULL,'JWZhnWnSlKyKmhhlHfeahOWeBVZ5ZZ79KF5ehfkJ',NULL,'2026-11-01 06:17:53','2026-11-01 06:17:53'),(206,NULL,'qmADJtqYBSpuk9AHJbu792vC14rijr4TjYCI5g5Z',NULL,'2026-11-01 06:42:58','2026-11-01 06:42:58'),(207,NULL,'gMOvPzM9Ih6isiCCwom2h2QcMuQDBEp5brL6n14q',NULL,'2026-11-01 06:47:54','2026-11-01 06:47:54'),(208,NULL,'JzeVzClNTEj7qU39kPyVaoJbncy5EUK7USMhdsbo',NULL,'2026-11-01 06:59:19','2026-11-01 06:59:19'),(209,NULL,'sbfAhuBGwnIHqys78gihtgD4IMCU5AdhlIU2GnNz',NULL,'2026-11-01 07:07:43','2026-11-01 07:07:43'),(210,NULL,'P3HcDPdHSBmtS1rA22oMs2vDLX3yQrR2l9G6qWjG',NULL,'2026-11-01 07:07:43','2026-11-01 07:07:43'),(211,NULL,'3w6d3KphUZvzN216h8GVSalflVKUtC981Jx8fhkz',NULL,'2026-11-01 07:07:44','2026-11-01 07:07:44'),(212,NULL,'QgQOkp1T0XWldxLogZpIZx0HUxiIS7BvUnScGyMf',NULL,'2026-11-01 07:07:44','2026-11-01 07:07:44'),(213,NULL,'encGGI6sJfyv6y76gDYlMAD1aA1pDEZz5T01rRjy',NULL,'2026-11-01 07:17:53','2026-11-01 07:17:53'),(214,NULL,'GBcqZaMXSemFMnqH5aRC8oGV2tDqweAlKFM5fckm',NULL,'2026-11-01 07:19:26','2026-11-01 07:19:26'),(215,NULL,'iViCs0fyCYvGnozEEv57cx0UH2d0OZkMI6u4OSbF',NULL,'2026-11-01 07:36:54','2026-11-01 07:36:54'),(216,NULL,'aooT9YOgKF4AwnNlKheyw1dU9B6cNPmibwIMiQYb',NULL,'2026-11-01 07:47:53','2026-11-01 07:47:53'),(217,NULL,'hO0O1eUiqZuhrVuU2SuaQrOKZjcNnqYbJvfs1iFZ',NULL,'2026-11-01 08:17:55','2026-11-01 08:17:55'),(218,NULL,'a1iuUt1cKmglqNGLr4hGrkkF24pZ2iOAV6B9V4JC',NULL,'2026-11-01 08:47:53','2026-11-01 08:47:53'),(219,NULL,'adeZkbWWHhqaO0FE24sNsMNcApyf6nfkU9M3rsiA',NULL,'2026-11-01 09:17:53','2026-11-01 09:17:53'),(220,NULL,'5wStyRIU1X4mqkZwel273m60McP3ivZIMUhfWJOG',NULL,'2026-11-01 11:09:41','2026-11-01 11:09:41'),(221,NULL,'rf2GSdMMUb6o8sWkSo7CaZzoMsJM104UltJhMovW',NULL,'2026-11-01 11:12:02','2026-11-01 11:12:02'),(222,NULL,'UE1gDWKX7e5zfluW7yY94q13seOejj35WV9TW2v3',NULL,'2026-11-01 11:21:41','2026-11-01 11:21:41'),(223,NULL,'1HRFiuqdQQJzG53eTPvEYiNVeyoVoRNfeu4Kuy56',NULL,'2026-11-01 11:21:48','2026-11-01 11:21:48'),(224,NULL,'6qQsfC2syzKXXO5v0h4rvXMGSzoUxMPXneBzGFWn',NULL,'2026-11-01 11:28:39','2026-11-01 11:28:39'),(225,NULL,'djyMNBrByeCX6T5yVTH6k1Yjnbyyr7Luk2dcjBwn',NULL,'2026-11-01 11:28:43','2026-11-01 11:28:43'),(226,NULL,'k1lZRPO3TLmTxpNyTHZOFyoyuuajesDsKww6OXRM',NULL,'2026-11-01 11:28:45','2026-11-01 11:28:45'),(227,NULL,'fhEg2Zp2HznhJkScEFzxWiYcPgRRgCAhnwKc5rxA',NULL,'2026-11-01 12:03:14','2026-11-01 12:03:14'),(228,NULL,'9Dj0F5RBLejHqbv7RLvRZcunvhT8isBLyDdIai9z',NULL,'2026-11-01 12:32:46','2026-11-01 12:32:46'),(229,NULL,'8AN4Hzb0XxEGEDPg4rZihcuuAWLW7oikPFbFwqKC',NULL,'2026-11-01 12:35:42','2026-11-01 12:35:42'),(230,NULL,'4Is8qH22lkmJqDLIF67iTobnaaCsxupA7mhPmm6W',NULL,'2026-11-01 12:57:54','2026-11-01 12:57:54'),(231,NULL,'EGrMgsuEhREBLAVeCeWxy8N1X9rzR9ZgRF6Lslpf',NULL,'2026-11-01 12:58:10','2026-11-01 12:58:10'),(232,NULL,'tdx7coG2S1xGMMxBMxpgp52u1JybzvEWcIIrsczg',NULL,'2026-11-01 13:12:35','2026-11-01 13:12:35'),(233,NULL,'FffTKPWg37OHameaz8tnMeIeqG5Lti8nL642kiQe',NULL,'2026-11-01 13:15:42','2026-11-01 13:15:42'),(234,NULL,'6GBLFRIShkdKMu4kpBYuybj1Vjb4PpLkkWoq50F2',NULL,'2026-11-01 13:39:02','2026-11-01 13:39:02'),(235,NULL,'8YoXpTlRTVtw7Ja72TqcEAQ1uwuMjQQMrUvVgE8y',NULL,'2026-11-01 13:46:11','2026-11-01 13:46:11'),(236,NULL,'tS3nlU2iX0quyUC1APWIYkubFt3MUm4e7hs2Sgpc',NULL,'2026-11-01 13:47:03','2026-11-01 13:47:03'),(237,NULL,'0MT6qi3HoWQLE4fFypipD5gVmXxGQbyA5BJ0gYOA',NULL,'2026-11-01 14:44:14','2026-11-01 14:44:14'),(238,NULL,'SQjgBOWK5vls4wXfgIVbXHVhjX8109yNSzX3sSz4',NULL,'2026-11-01 14:44:21','2026-11-01 14:44:21'),(239,NULL,'Qdoji2qeWmK1Mp7Xr18paIJzC2Ugz2nxOC8J3n0K',NULL,'2026-11-01 14:45:51','2026-11-01 14:45:51'),(240,NULL,'zslyIGAwuvknZ0yzSiffjLmn9dhoW8wB0V0Ve5Vh',NULL,'2026-11-01 14:45:52','2026-11-01 14:45:52'),(241,NULL,'UlYSaWUzpYIdciCQTfULJ6dJIAcjmtjVrDEbvCW2',NULL,'2026-11-01 14:46:16','2026-11-01 14:46:16'),(242,NULL,'DB4CDeUlkusU9E6otT1z42IgZTNFgM6RWutmFRW2',NULL,'2026-11-01 14:46:51','2026-11-01 14:46:51'),(243,NULL,'6p2cVTkkIiEFY8LfAXnofaMkCZUk4ruxEBE6aQRe',NULL,'2026-11-01 14:46:52','2026-11-01 14:46:52'),(244,NULL,'9oPEoF2F1Sjkf2nYnCFiQkB7imgxtxdouA1RKWDS',NULL,'2026-11-01 14:49:32','2026-11-01 14:49:32'),(245,NULL,'6HXsT5VcnRSl1pDBz5Kx3XrVpd5oFAq4o37RJZC4',NULL,'2026-11-01 14:49:33','2026-11-01 14:49:33'),(246,NULL,'9i7zjrbdtUzCLewqttlZZA7xq2pnH0d5c81v6PjC',NULL,'2026-11-01 15:08:01','2026-11-01 15:08:01'),(247,NULL,'SeDpk1VeAKO4KqyPZVm1ducCt4iQnz3hy560umBc',NULL,'2026-11-01 15:35:25','2026-11-01 15:35:25'),(248,NULL,'g1SEp0I64QeSJ9qCAtsbOZdshZmTBoywT2Pczfhv',NULL,'2026-11-01 15:44:53','2026-11-01 15:44:53'),(249,NULL,'mX5Hro2sYk7DjCYfGuZdmqn6VywKl2jCgLAJ5l2A',NULL,'2026-11-01 18:09:12','2026-11-01 18:09:12'),(250,NULL,'FOH22TqLUOtFD3bwVE0RwGuuwTpiDBM0BcXLac1m',NULL,'2026-11-01 18:12:58','2026-11-01 18:12:58'),(251,NULL,'jTEXg50i9pdLEONa7kyFzOk7TgLAVXXiyoyjhoag',NULL,'2026-11-01 18:15:51','2026-11-01 18:15:51'),(252,NULL,'Zi05QcX7tMyEVZLIe3tK68lcC13dP1ucFyjxOMal',NULL,'2026-11-01 18:15:51','2026-11-01 18:15:51'),(253,NULL,'3u0vAiSdBEuT8aLWoJccDJ2OIognNaTeGhjYEZH5',NULL,'2026-11-01 18:15:52','2026-11-01 18:15:52'),(254,NULL,'CxdwpHsqor340v3wJtx8zuBJ4YIXeV9Kj2VCm6mU',NULL,'2026-11-01 18:15:52','2026-11-01 18:15:52'),(255,NULL,'vC4GvLPtO3Uw2nNJgYCtE704MrvMJJxCgDXeXpgD',NULL,'2026-11-01 19:01:39','2026-11-01 19:01:39'),(256,NULL,'q4DbXrx7VrHL9sRTqBjHAWDUm1uOj8MOAELiwGpR',NULL,'2026-11-01 19:10:59','2026-11-01 19:10:59'),(257,NULL,'OzPE1bVB0pzeGXSQ0cq9vBoRQrmEoDFUSVXCZGhA',NULL,'2026-11-01 19:23:19','2026-11-01 19:23:19'),(258,NULL,'RtnJUfOzuqFN1IqYTt1ONj84dSVhqFm5jhO05nNZ',NULL,'2026-11-01 19:48:24','2026-11-01 19:48:24'),(259,NULL,'J5cbWFkkH6diib2pfY65WYvdDZwXA5BHst5ji5vL',NULL,'2026-11-01 20:10:23','2026-11-01 20:10:23'),(260,NULL,'6OzajlIkQUzIcdXyZDkzbIwAiZxa1MVP5ecmUuFT',NULL,'2026-11-01 20:50:31','2026-11-01 20:50:31'),(261,NULL,'7uZhBeY3wZ2WUjxAg7TnSZ2G6LsLeXrODDIndwBd',NULL,'2026-11-01 20:50:31','2026-11-01 20:50:31'),(262,NULL,'RQpZABS5WD8c3fYRFy0BN8P60cj0JfKVk6Z7L0kU',NULL,'2026-11-01 20:50:43','2026-11-01 20:50:43'),(263,NULL,'9p0jK8XxXxWHYlBDX5Iy7jaHiSzmV7zxM4lJE5n4',NULL,'2026-11-01 20:50:43','2026-11-01 20:50:43'),(264,NULL,'87iwkXOVD4X6KT9MUHAdlTSWUYJgyCruDsTD1u5a',NULL,'2026-11-01 20:50:51','2026-11-01 20:50:51'),(265,NULL,'eH18MWYOb9PlUeEV4oNwGJGJgL7QbEzMQ3LZc76K',NULL,'2026-11-01 20:50:55','2026-11-01 20:50:55'),(266,NULL,'Jncm6vywwYU7s40pKeGoQ5rKlVYuQuVlBUgbI6u1',NULL,'2026-11-01 20:50:59','2026-11-01 20:50:59'),(267,NULL,'77xwt2KVnm0yx0sYXj58tfaYKzjK8odF4VSI09QI',NULL,'2026-11-01 20:51:03','2026-11-01 20:51:03'),(268,NULL,'UC3anKHwjDEvHm405dJAoiaCkScbFJdDex9WXCve',NULL,'2026-11-01 20:51:07','2026-11-01 20:51:07'),(269,NULL,'kWV4HuJf6Nr934ZrXkXC26V5gW81HQAKbrpv7uAj',NULL,'2026-11-01 21:01:24','2026-11-01 21:01:24'),(270,NULL,'knGzWtIO3ZdkHoevppsxcn5V977whBMvQKqzbL4g',NULL,'2026-11-01 21:11:51','2026-11-01 21:11:51'),(271,NULL,'koSiGWC5p6gMHkOd85MhtpIku3GKP2FSph8f02KL',NULL,'2026-11-01 22:12:24','2026-11-01 22:12:24'),(272,NULL,'VtGTlCFgtobwxOStp5DBG7rBcb4aJ4V1zlCzcSdU',NULL,'2026-11-02 00:26:24','2026-11-02 00:26:24'),(273,NULL,'qUGKOyhm0qTjbWHvsUUv2oLIswOMBDxSBjBWJ3Hh',NULL,'2026-11-02 00:40:54','2026-11-02 00:40:54'),(274,NULL,'JOUBCjNN8sGnDCIQkGvWjshyL5EoHmXWHTvOZTkT',NULL,'2026-11-02 01:59:04','2026-11-02 01:59:04'),(275,NULL,'JTYolOfMaGHzTC7JBXIh9r61GUxzKGr9IDEinxiX',NULL,'2026-11-02 01:59:32','2026-11-02 01:59:32'),(276,NULL,'XIfLHbJMq3niax6Hs60OqauLKHfBaCSodG8DosIN',NULL,'2026-11-02 01:59:33','2026-11-02 01:59:33'),(277,NULL,'Bl8fcSyycLSRDnCVTYD8c0dp7KlITJSHuiPBQWsw',NULL,'2026-11-02 02:00:44','2026-11-02 02:00:44'),(278,NULL,'HuascBPXLb1YwnG4AImItE1hSHL6PLSSKCB3Ir9C',NULL,'2026-11-02 02:00:45','2026-11-02 02:00:45'),(279,NULL,'2vGtH4Gwu6Mwin3klaqcUabjgs5RNOyRgsTFPYwr',NULL,'2026-11-02 02:00:49','2026-11-02 02:00:49'),(280,NULL,'1GxNmVqpBiT2RK97QCTTNuxesPHe6TMFMHD5Ffvj',NULL,'2026-11-02 02:00:59','2026-11-02 02:00:59'),(281,NULL,'j4bU7amhPz007HZhNyq50sw7yACmQtLvCyZo9kjr',NULL,'2026-11-02 02:09:04','2026-11-02 02:09:04'),(282,NULL,'PNzgxJKyQxxgApVzJha1eZF862P2zy7Av7FuIL86',NULL,'2026-11-02 02:09:04','2026-11-02 02:09:04'),(283,NULL,'a41ydOjhf7ss8MxpOYl15H2hST06GKaiO2NBRWhZ',NULL,'2026-11-02 03:52:51','2026-11-02 03:52:51'),(284,NULL,'N7BzhdVnzy5MVY5LigxZNOjKCztw8gv9p4nXndBv',NULL,'2026-11-02 04:08:22','2026-11-02 04:08:22'),(285,NULL,'ztIhNuu3EEvOAa5lzYHtfwCojaB5oVeVlA3wsIGL',NULL,'2026-11-02 04:11:49','2026-11-02 04:11:49'),(286,NULL,'TJjIvbDEbj6evoEq3BQMAHIcjEtKkyeDqgBiPiRS',NULL,'2026-11-02 04:48:54','2026-11-02 04:48:54'),(287,NULL,'na3lx0eFZeH1DIflR1ldXt8kQxhhU13pW8vz39up',NULL,'2026-11-02 05:35:06','2026-11-02 05:35:06'),(288,NULL,'8mKxBvA4LCXLdKLfZGV3EjRj7CoYZQAxuuAXsrbq',NULL,'2026-11-02 06:45:34','2026-11-02 06:45:34'),(289,NULL,'K9Aw0arqxlwLhNxAEF3IGGvoOKTsJ6wNWzQyByb6',NULL,'2026-11-02 07:59:19','2026-11-02 07:59:19'),(290,NULL,'7oTB02EruMxkLfAhxDkxh5bA4NUtxDAlG6BfgHBl',NULL,'2026-11-02 08:27:05','2026-11-02 08:27:05'),(291,NULL,'kglpfP8nxcyf6EbT2Sjo1UB9GCyyzBJ5CgNPgnLu',NULL,'2026-11-02 09:01:14','2026-11-02 09:01:14'),(292,NULL,'qMLjWh423YtSVOils19zMILUfsFpxPwX1e1sZQaO',NULL,'2026-11-02 09:21:45','2026-11-02 09:21:45'),(293,NULL,'zEGlG7th2la1DTQeXPlhLJXdyJSN34xB00WJ1xGo',NULL,'2026-11-02 09:34:53','2026-11-02 09:34:53'),(294,NULL,'jlRs0TncYQANU6RFkcSob24W8s8QqJF77KsUfgpW',NULL,'2026-11-02 09:37:09','2026-11-02 09:37:09'),(295,NULL,'48sdqVSntH3Wy10CJsKr3ovzT0biOvvyshj8y8Pv',NULL,'2026-11-02 09:37:27','2026-11-02 09:37:27'),(296,NULL,'gLhVkzFidVvlDHMbc3wMhxNcBsWjdarvaeKRieQh',NULL,'2026-11-02 09:41:15','2026-11-02 09:41:15'),(297,NULL,'eego3bXnsaDKYvyQ4zl5ywilwgfpnoYRELW6Yqav',NULL,'2026-11-02 10:14:55','2026-11-02 10:14:55'),(298,NULL,'jSWLFuZeKuCnqpf39LvJqMfzDVbmCu9cQfqcOacR',NULL,'2026-11-02 11:07:27','2026-11-02 11:07:27'),(299,NULL,'9KzrfX9ltFtVvz9tpBqbQtBkRUlfIZ19sZIr8BpD',NULL,'2026-11-02 11:28:49','2026-11-02 11:28:49'),(300,NULL,'C6BADpadj9eJ7d10HK4q0Y7BgvdqxXU483M0Qdum',NULL,'2026-11-02 11:58:12','2026-11-02 11:58:12'),(301,NULL,'3VNQj6U5vU1k2iJqiXJO28gEKfTvGyTfv3K7ueKY',NULL,'2026-11-02 12:12:31','2026-11-02 12:12:31'),(302,NULL,'F7QVNdospz6V5tuwlsR8dFEwhU2SX3s221DVYNKv',NULL,'2026-11-02 12:42:32','2026-11-02 12:42:32'),(303,NULL,'hUvARIJpmpcsEqWmwMccfiRwjdFPKjuwH5pJM5yH',NULL,'2026-11-02 12:43:06','2026-11-02 12:43:06'),(304,NULL,'vCWG5jNwseNnwuiXDVIhSpBPyz1lNuaEQQowykEp',NULL,'2026-11-02 13:13:42','2026-11-02 13:13:42'),(305,NULL,'hSOyepgSrIX9vndOCDs4sq5TCuSuYzIzBpHuc5aq',NULL,'2026-11-02 14:06:42','2026-11-02 14:06:42'),(306,NULL,'ZjJ9cBQ6hdsnrnH6cZS0a9kH641t1UiyFy0WJZhJ',NULL,'2026-11-02 14:11:31','2026-11-02 14:11:31'),(307,NULL,'dQTkMAtzqFuxwRTDq38luzxoN7WSVGIE7SlXWaqn',NULL,'2026-11-02 15:36:50','2026-11-02 15:36:50'),(308,NULL,'uMz0YF0gkZ1CRFfPxO0U2PN4vO0XrPtjXHBQb4xh',NULL,'2026-11-02 16:58:46','2026-11-02 16:58:46'),(309,NULL,'0gPvgWWLw6gY7h0Qj4DkhSvswZwbG98UanE63t3g',NULL,'2026-11-02 17:16:51','2026-11-02 17:16:51'),(310,NULL,'OAzYgRlh4fPkV90SGCvH65wh6gMeP13Zb7KNzfFP',NULL,'2026-11-02 17:20:18','2026-11-02 17:20:18'),(311,NULL,'pacoh5Rl323dEM3KaW9GajwUWZ5vHJbAZBt7y1Pm',NULL,'2026-11-02 17:35:53','2026-11-02 17:35:53'),(312,NULL,'U7VKcxoFwtFpGYmj5AHi7fE11LWtIUvKDJfnCRV3',NULL,'2026-11-02 17:55:23','2026-11-02 17:55:23'),(313,NULL,'0RE98omLRxdgkbO0solJzmgSXBmJchxUyBsT0tUX',NULL,'2026-11-02 18:04:11','2026-11-02 18:04:11'),(314,NULL,'1dOGAggZc70lCaf6pHt3f4UMvG4PLvPJpiqWRCQS',NULL,'2026-11-02 19:13:58','2026-11-02 19:13:58'),(315,NULL,'VNkv3tNRweLuGDqdzLTu97rBEDp0r4h5R505bltu',NULL,'2026-11-02 19:45:41','2026-11-02 19:45:41'),(316,NULL,'KzECxqQ3BTTWzUC3Mvmm8ijIordvl3g49fQG6vNt',NULL,'2026-11-02 20:14:19','2026-11-02 20:14:19'),(317,NULL,'Njs5ZAIB012Ekc9jlxHw7E17JAVp8JAl3q0wpiO7',NULL,'2026-11-02 23:28:17','2026-11-02 23:28:17'),(318,NULL,'jcB6CVmXXUUonySD0cIVLzIZI7UZHv0d6kZw16Ym',NULL,'2026-11-03 00:10:36','2026-11-03 00:10:36'),(319,NULL,'XDOgDOSiQIQ8vrN8GIPaYe8AjCQ8U9Cccv5PGOJr',NULL,'2026-11-03 00:10:51','2026-11-03 00:10:51'),(320,NULL,'15JSdh2pXLDydBcKrzaqwY206LQxEhficj7wO4JQ',NULL,'2026-11-03 00:13:38','2026-11-03 00:13:38'),(321,NULL,'2T6vfDn82ZVZYskaAGQWl4rD8bJP7F1uKTY8wQNS',NULL,'2026-11-03 01:15:11','2026-11-03 01:15:11'),(322,NULL,'rFt4gISyTcZ6cXKK69KuwPRagJNDqYMsXR2F9i7Z',NULL,'2026-11-03 01:16:13','2026-11-03 01:16:13'),(323,NULL,'CKxrDIW6MbWvPE0pPrai9T3PYJZrjcse3v8uhamd',NULL,'2026-11-03 01:17:14','2026-11-03 01:17:14'),(324,NULL,'rsxdZlInRb7KvC1vV31mtq2wTPxLpKpqjiApUw3D',NULL,'2026-11-03 01:18:22','2026-11-03 01:18:22'),(325,NULL,'MWqeg710QWJRVXEDvYDv3bKAfMkqFzZqFsudJgY8',NULL,'2026-11-03 01:18:51','2026-11-03 01:18:51'),(326,NULL,'9OmCxUx05P9b9YeGJYuwve0PMhMPFYkRAJhGM6WU',NULL,'2026-11-03 02:43:16','2026-11-03 02:43:16'),(327,NULL,'wWshkuhO3qUVKgNgV1iZtJFTIvJllVAlRvmam0Iq',NULL,'2026-11-03 02:58:47','2026-11-03 02:58:47'),(328,NULL,'BL72IySazAzOc04mkRrSgsyOgRLBUShw2p9grTEN',NULL,'2026-11-03 03:19:45','2026-11-03 03:19:45'),(329,NULL,'KeB51tlN1f0t0I5gwaWMKMmyPGH4SiCD7goof0Pk',NULL,'2026-11-03 06:23:57','2026-11-03 06:23:57'),(330,NULL,'fA8hFHZAdcu0KPZrKtEbtaF6HPLMEjvzxLY72zhv',NULL,'2026-11-03 06:24:46','2026-11-03 06:24:46'),(331,NULL,'MAUs8EKc7hX85DFcx2b8YwytZXLN2ckk3idpA56y',NULL,'2026-11-03 06:24:46','2026-11-03 06:24:46'),(332,NULL,'rmJdTL73c6nCL6ScvdKEljncnvBlVHuaJj5W9gFL',NULL,'2026-11-03 06:24:47','2026-11-03 06:24:47'),(333,NULL,'aX2ZO6KAkinNLslxbbzibMYFhoH07blK50brzTEM',NULL,'2026-11-03 06:24:47','2026-11-03 06:24:47'),(334,NULL,'XEizSmrPKxqheqxDettavxTCYLSvRYLDqtQ33Wbn',NULL,'2026-11-03 07:49:13','2026-11-03 07:49:13'),(335,NULL,'Z2DifgbQKMduXNt76vDB0wBzQmXeSzYWA1xGIw3F',NULL,'2026-11-03 07:58:26','2026-11-03 07:58:26'),(336,NULL,'uSKEbeYpq2eWZZLaPbfuNTRvAS3SIa9YgwpwUSb9',NULL,'2026-11-03 07:59:17','2026-11-03 07:59:17'),(337,NULL,'5aOsPFgKayfoL5BfnfOJODcFrdSXQu5rmzfhwqqj',NULL,'2026-11-03 08:02:42','2026-11-03 08:02:42'),(338,NULL,'kzgO2QlgWXazxtEEJj6eu2zzChhEebBCpzVoW9BS',NULL,'2026-11-03 08:09:18','2026-11-03 08:09:18'),(339,NULL,'7ntm1FJ3UTlRlwscWEO92Z5SScCLLjwRmrHm4Wx1',NULL,'2026-11-03 08:10:09','2026-11-03 08:10:09'),(340,NULL,'XVhuccvfceB2lq1xHcJBEomFwljruRHb40J8v6W4',NULL,'2026-11-03 08:16:33','2026-11-03 08:16:33'),(341,NULL,'vCrEyUV87oB5VgLxSZldcN5ByZoDtjP4r0UBr2q5',NULL,'2026-11-03 08:19:45','2026-11-03 08:19:45'),(342,NULL,'X696vyvDdkpLbSd2sC49Xb19Z9g6tHbz7N7z2Wz3',NULL,'2026-11-03 08:34:24','2026-11-03 08:34:24'),(343,NULL,'DSPrqTyBiaDBiIMkZCikb2Epw5PuMVeyDTxPcU01',NULL,'2026-11-03 08:38:16','2026-11-03 08:38:16'),(344,NULL,'1oHh1aZ8imaWU96tAUI19hwndNkg1LjblAqMyJ2t',NULL,'2026-11-03 08:50:14','2026-11-03 08:50:14'),(345,NULL,'IOjodoCu11FPaZGb5UFISTCzbXYXCqjrCWTvyVOD',NULL,'2026-11-03 09:23:43','2026-11-03 09:23:43'),(346,NULL,'VomWnPwdQRTq8bqRfUUnS1zUKoEVkNDGp3vupQHb',NULL,'2026-11-03 10:01:46','2026-11-03 10:01:46'),(347,NULL,'smVlUYx1Fp4Jz5wjnXbipydhe7EUNT8094K0kMLK',NULL,'2026-11-03 10:08:20','2026-11-03 10:08:20'),(348,NULL,'3z8kHFfIptu38MOyRyh3c2X4uxmafilATwKYoHrE',NULL,'2026-11-03 10:31:09','2026-11-03 10:31:09'),(349,NULL,'HvQWRMIC8Fo69pDl91bY16TFHDDgSvbNoZIkgGTb',NULL,'2026-11-03 12:11:46','2026-11-03 12:11:46'),(350,NULL,'u7Vrij6gOheasBIMhyaQ8pc95S0GsZCeulPayHCS',NULL,'2026-11-03 12:17:18','2026-11-03 12:17:18'),(351,NULL,'bO45HfohRuAK21uexXJu9hUMzWUJoQGxWsT4RUU0',NULL,'2026-11-03 12:25:38','2026-11-03 12:25:38'),(352,NULL,'qiwFSQoBC1jFoAsefIlZhgbZfdOf1yMlcAvAUJi7',NULL,'2026-11-03 12:36:11','2026-11-03 12:36:11'),(353,NULL,'dT4ARilyXoY2vUdYoTHXqJ2itQttOsloUGCTWVO5',NULL,'2026-11-03 12:46:55','2026-11-03 12:46:55'),(354,NULL,'WFturEwa5XnLXfqHqWZQUe9LVVkkh9Cv0tT7vLwO',NULL,'2026-11-03 12:52:49','2026-11-03 12:52:49'),(355,NULL,'U9hJRSYcRCLJwH428mtTP4qGqd014t1VW2bGe91R',NULL,'2026-11-03 12:56:10','2026-11-03 12:56:10'),(356,NULL,'pVV2hfigwggDLBiVH3t4uNV0kxiREOer1BO6etv2',NULL,'2026-11-03 13:07:25','2026-11-03 13:07:25'),(357,NULL,'suHdmGK5jk43JSZQt7eRWXDg0NN3NuVO1r7lGTT4',NULL,'2026-11-03 13:25:14','2026-11-03 13:25:14'),(358,NULL,'FgCR8yfZhnku6ydMCwlqTf9Difxt67yZzn4Yep25',NULL,'2026-11-03 13:31:58','2026-11-03 13:31:58'),(359,NULL,'WQrkUEv5MEoMBHBAtDskQiwxavByZKMFU7qYrSao',NULL,'2026-11-03 13:34:16','2026-11-03 13:34:16'),(360,NULL,'VOOlH0vuZYOLH6c5djxeuwlx9cp0GLv1sR8nNTkU',NULL,'2026-11-03 13:34:20','2026-11-03 13:34:20'),(361,NULL,'XfUWPmg6jejd7fyBUlVx014xAubuSBO6KnIV18Ky',NULL,'2026-11-03 13:46:11','2026-11-03 13:46:11'),(362,NULL,'cgHsGgWAyn1tSdPZoe5HgU0ztJttxCdPV7C9X3ba',NULL,'2026-11-03 14:31:53','2026-11-03 14:31:53'),(363,NULL,'yAwjxH0NZlqNkiByo9f3Ijw4FJDVOJBMiSW3qSqi',NULL,'2026-11-03 14:42:12','2026-11-03 14:42:12'),(364,NULL,'Qemx2nriHDg1lz2jLmk0fGkcaoHDXduerDunyA3u',NULL,'2026-11-03 14:47:44','2026-11-03 14:47:44'),(365,NULL,'RFfYKS5fM7nORMW2Hji7CaDOjERplqD0MfvHb3LO',NULL,'2026-11-03 15:07:10','2026-11-03 15:07:10'),(366,NULL,'6BvO4MGRZxcVWaOhiWQAy8jbrzY2KQcD1t5fAiMx',NULL,'2026-11-03 15:36:22','2026-11-03 15:36:22'),(367,NULL,'gBegOsoddtN8lc2VfvjCmo6CL9f2bBB1e0FKcDIB',NULL,'2026-11-03 15:59:14','2026-11-03 15:59:14'),(368,NULL,'Ndc3qM74NXfjT8fTvhX1Gv4OxwgNnl9ddetW1Xnj',NULL,'2026-11-03 15:59:15','2026-11-03 15:59:15'),(369,NULL,'snzF4iyUhgmzhKApSsMDgLlBQTXLBcYJV05DMoRa',NULL,'2026-11-03 16:37:28','2026-11-03 16:37:28'),(370,NULL,'6HWyCqqPky6iapVBTiUqAiiy7EH1RqYryTb2kqWG',NULL,'2026-11-03 16:54:08','2026-11-03 16:54:08'),(371,NULL,'w3UFn21SXtalls8hyEuPyWmI19JU3YfSZ8lv3OBa',NULL,'2026-11-03 16:56:28','2026-11-03 16:56:28'),(372,NULL,'RBaoqnkKwaQjoGB0AHAWx01bkA0TE42hspk9mkZ2',NULL,'2026-11-03 16:56:28','2026-11-03 16:56:28'),(373,NULL,'4vPSbn4X3YpiCgg7pU9ihsm3oVZjZGJsrM3C5nJt',NULL,'2026-11-03 17:16:18','2026-11-03 17:16:18'),(374,NULL,'3Bq23Rpg9Cbnz1XWqmXDO5ZgbonnnqZi0QrfBCHX',NULL,'2026-11-03 18:14:26','2026-11-03 18:14:26'),(375,NULL,'ATqhobqtsXsReFluAFND1r69m8PJ2M5WycLMAUzE',NULL,'2026-11-03 18:16:27','2026-11-03 18:16:27'),(376,NULL,'IedEIWXUzXzc5ydJ3INt2Q01nPBBJDvNJHWZHZIF',NULL,'2026-11-03 18:30:29','2026-11-03 18:30:29'),(377,NULL,'XuDaHGEoOLNa7Qpsp6EGxG0S4fuyFizOi2Eds2uT',NULL,'2026-11-03 19:01:39','2026-11-03 19:01:39'),(378,NULL,'0B6PXpMRgs5312Cghd2LQLP3KxOoIYx20V8RtI88',NULL,'2026-11-03 19:19:05','2026-11-03 19:19:05'),(379,NULL,'HBNls9vfNb3XogG3pxGSK5000VVvMch1Lh1oMzH9',NULL,'2026-11-03 20:09:31','2026-11-03 20:09:31'),(380,NULL,'IZyBPIaYY6fEdDzLdcTBrWfHGTsCIWyliqUFMWsE',NULL,'2026-11-03 20:32:32','2026-11-03 20:32:32'),(381,NULL,'gSzXxrv6ADIBYllYyZTNNS0HTEdbB0WQGIqJV6f7',NULL,'2026-11-03 20:40:13','2026-11-03 20:40:13'),(382,NULL,'T8kTJmdfLq9SZKhfrpaqW9zfMRfi4tDrNRiwfEf5',NULL,'2026-11-03 20:52:25','2026-11-03 20:52:25'),(383,NULL,'hwGXp6reefx1bsFLduIiOFQQOvyzfXKh1vh79g70',NULL,'2026-11-03 21:01:02','2026-11-03 21:01:02'),(384,NULL,'Y5bBNPALeRaauk7eWstPhbMijVG4nBOvPTgdl1Ap',NULL,'2026-11-03 21:03:25','2026-11-03 21:03:25'),(385,NULL,'hv0t3xfH41ebFhlgJrhWs6lIBTwCUPGQODfH0mp8',NULL,'2026-11-03 21:11:56','2026-11-03 21:11:56'),(386,NULL,'DsSmGN0yI2avuJ9KvQSyoziBId3tB5wekzakjLQ3',NULL,'2026-11-03 21:18:04','2026-11-03 21:18:04'),(387,NULL,'s8SjrJrxjolliYpUKyrX55u1ilgDbunAH13IGG9u',NULL,'2026-11-03 21:23:42','2026-11-03 21:23:42'),(388,NULL,'m8m7RqtPW239zSYqcQ91GWPBONqfm0DYyuY0AFOt',NULL,'2026-11-03 21:23:49','2026-11-03 21:23:49'),(389,NULL,'avEqqoh6jeDOeUT7gPzUcNDFPX0rZrOrozHTG5rX',NULL,'2026-11-03 21:23:59','2026-11-03 21:23:59'),(390,NULL,'zlH2NSP1D5oGWrYWIVsnY4FEvDvbpL9oV1SSIpEX',NULL,'2026-11-03 21:58:31','2026-11-03 21:58:31'),(391,NULL,'Y155ZY0Sh6BaOKrLHhZKAEKJMccB7o9bmtUmlAe8',NULL,'2026-11-03 21:58:38','2026-11-03 21:58:38'),(392,NULL,'c7BcV9OtTnDXZ3uZCitgMnRUk0agnG2n0sLeGUCj',NULL,'2026-11-03 21:58:49','2026-11-03 21:58:49'),(393,NULL,'NFkhHkZYUZ8FvRAsc8B48SFcqsJxB9w2s94ilQ5A',NULL,'2026-11-03 22:16:21','2026-11-03 22:16:21'),(394,NULL,'gz3lbgjEliEWXewILBwjda7OsZ1oTq6vUVyO9flR',NULL,'2026-11-03 22:20:34','2026-11-03 22:20:34'),(395,NULL,'oPm8tVbFjOC2c8PDRLpsHbtIhEJsCc81Olc6fbpK',NULL,'2026-11-03 23:06:20','2026-11-03 23:06:20'),(396,NULL,'9t5RkemZPDd2J8weAl7AFvf6j9HA8SeR6eUvgW78',NULL,'2026-11-04 00:39:56','2026-11-04 00:39:56'),(397,NULL,'5V7BhUSPfYycWpQ3ohBYzoMIIWNWr1eeuMZ6QWkN',NULL,'2026-11-04 02:07:40','2026-11-04 02:07:40'),(398,NULL,'uf2Sfe9o7VGGdcWH6rKbsvRCggJ17Flpv9iVqVzr',NULL,'2026-11-04 02:08:54','2026-11-04 02:08:54'),(399,NULL,'xBvJcOZwNvEaB6ocYB0JmmcnKfDlsfULgavjW0Xt',NULL,'2026-11-04 02:08:56','2026-11-04 02:08:56'),(400,NULL,'ECdYn63nAy2auk52TsPo9CRfmuSdCHdFsc4rcplF',NULL,'2026-11-04 02:08:59','2026-11-04 02:08:59'),(401,NULL,'rjUlPNgTvqjLBQLkR861G8pAUejPtg2faYtUNbKj',NULL,'2026-11-04 02:09:08','2026-11-04 02:09:08'),(402,NULL,'U6MuBTPOF7eprEknwiZFEbTMfdODcUsGpE0swmwC',NULL,'2026-11-04 02:09:26','2026-11-04 02:09:26'),(403,NULL,'T6xm7hiNZZCDRISXb19vusPk9bSTWMHQ3W1pb32J',NULL,'2026-11-04 03:02:57','2026-11-04 03:02:57'),(404,NULL,'TBORNaLuOSoYU71KInEzs9U1Wht77UOMNRzNhqFy',NULL,'2026-11-04 03:03:44','2026-11-04 03:03:44'),(405,NULL,'Z7EeqqxIiGaeQrGtaewlhnaHWzHr4yD0vYfOm3Uf',NULL,'2026-11-04 03:32:57','2026-11-04 03:32:57'),(406,NULL,'T5ufpJ85buKQZch5mlHcJJV4mEmI5C2DbORVOf3h',NULL,'2026-11-04 04:08:51','2026-11-04 04:08:51'),(407,NULL,'2fiLQZMGT6olWp4197UQDRq2LZLFRe0PZUGCfvil',NULL,'2026-11-04 04:49:35','2026-11-04 04:49:35'),(408,NULL,'lCrZKR9PpXlj2GxqHe33e7pU0Qi7QNUycv4gBlXV',NULL,'2026-11-04 05:19:38','2026-11-04 05:19:38'),(409,NULL,'1s2Hb08cgiYXIT81H14cF7C3VOfjmlYL40Ajtk4V',NULL,'2026-11-04 05:33:24','2026-11-04 05:33:24'),(410,NULL,'f5fXsSgJKtcuTQQGxskUPmTtfghPSNowY6NPSYPw',NULL,'2026-11-04 05:33:29','2026-11-04 05:33:29'),(411,NULL,'4GpcLUVSRsnE4mCaOP2ydlfkr1KGXe2HjtbeZSUh',NULL,'2026-11-04 05:33:33','2026-11-04 05:33:33'),(412,NULL,'HzP6DVhXkMGeDI03Z1ydjiVQcDvq4R3L2Pnc0ioY',NULL,'2026-11-04 06:15:06','2026-11-04 06:15:06'),(413,NULL,'XQmN2UC8nNIwlufzfH1RH1mbDOQ9Q53YEBir1CDH',NULL,'2026-11-04 06:29:05','2026-11-04 06:29:05'),(414,NULL,'PvuhyPLPwqkZNrYu9D6RvnpnRzrdwHgjW4el9TQS',NULL,'2026-11-04 07:59:19','2026-11-04 07:59:19'),(415,NULL,'Pqs5cV2fK6k0e2LZraTNkpQceGWU2W0FNNRqGF3N',NULL,'2026-11-04 08:12:04','2026-11-04 08:12:04'),(416,NULL,'gU4oO1e93SvGxRDiUl9eTwfXkIOVdTBRBzL2j5fP',NULL,'2026-11-04 08:13:13','2026-11-04 08:13:13'),(417,NULL,'kbOLCAumW5pSgV0e424gitTPTZ2XT3LOW4cWMzau',NULL,'2026-11-04 08:30:19','2026-11-04 08:30:19'),(418,NULL,'LMil10PLaHdsG8sJV3591HPyH2Pv9XQnpDCFiEev',NULL,'2026-11-04 08:30:24','2026-11-04 08:30:24'),(419,NULL,'OFYwLCnfYdQMZMUWvRyfOZxoeSRbeTy9ZVqVIMBR',NULL,'2026-11-04 08:42:26','2026-11-04 08:42:26'),(420,NULL,'P5XlDjF9IQnm6Mm8Nh5P66cqSN2TfCZK7KI9pdjs',NULL,'2026-11-04 08:56:27','2026-11-04 08:56:27'),(421,NULL,'hiBE6uoYe56WevOyYyQN1S93suTOMxzkE8Ey61UO',NULL,'2026-11-04 09:13:25','2026-11-04 09:13:25'),(422,NULL,'ChXu57IPyfA0FsYvNCXI6yZTRAX9LiVCFfJSlaqW',NULL,'2026-11-04 10:28:56','2026-11-04 10:28:56'),(423,NULL,'e7CO0dmkCTnYLr6brum52bb2mJ78zW5R1mXKP8zf',NULL,'2026-11-04 11:16:23','2026-11-04 11:16:23'),(424,NULL,'JdhtaRSRLFphCkqhM4PmTGo18Y0zwxGXvzGM7VhX',NULL,'2026-11-04 11:17:57','2026-11-04 11:17:57'),(425,NULL,'nBQXYSYuuZrVTMAIwoPUZ79BEtj3Q2bgd6JPYlZG',NULL,'2026-11-04 11:51:24','2026-11-04 11:51:24'),(426,NULL,'gBp1rk10gZTjKULXj9XDqBkwv8U6S7OwVgNeJRWB',NULL,'2026-11-04 11:59:57','2026-11-04 11:59:57'),(427,NULL,'ZL7USSmKTgKEjoz9FH9DlXUq5gMQ319iFeGXkjei',NULL,'2026-11-04 12:00:25','2026-11-04 12:00:25'),(428,NULL,'jNJ4q1zrapA4qHZFjJAf3GTpCOYHA95kYV6gsnbx',NULL,'2026-11-04 12:17:28','2026-11-04 12:17:28'),(429,NULL,'gms20OSmLHMq6uOhQL5PCA7pDvnWFBmvIwD0G1o0',NULL,'2026-11-04 14:13:13','2026-11-04 14:13:13'),(430,NULL,'0Pma43854ZD4Zpp4zzIByAMgT6469l7b2GkDHy9s',NULL,'2026-11-04 14:47:28','2026-11-04 14:47:28'),(431,NULL,'l09DBRfo7zEsbXRle48bqblgq9jIVlgdJrSZ1HOA',NULL,'2026-11-04 14:54:32','2026-11-04 14:54:32'),(432,NULL,'wLYtCGAgizRiNFFnmShh0ijhKVy1HOXAOu9LAJbp',NULL,'2026-11-04 14:54:36','2026-11-04 14:54:36'),(433,NULL,'rghH49wyMA4hkXO6KduMcWaBqLgc4QMIt5K2RSgE',NULL,'2026-11-04 14:54:59','2026-11-04 14:54:59'),(434,NULL,'kTbFMbYGTwxT2pSGKzRsyC2taKlKW8yYaIGm5djQ',NULL,'2026-11-04 15:28:21','2026-11-04 15:28:21'),(435,NULL,'I7BNKmGSh7QFjTuOo4cmHXbjZZB6RAGfXyIPNGo6',NULL,'2026-11-04 16:17:59','2026-11-04 16:17:59'),(436,NULL,'3yyHrpQziE71s3guzNcQlt1KhcXzGRpbJax47aOp',NULL,'2026-11-04 16:27:58','2026-11-04 16:27:58'),(437,NULL,'7sxqRbLJIJ4eqUQumpHERK4pfkljVRoRLtWd7GYe',NULL,'2026-11-04 18:14:50','2026-11-04 18:14:50'),(438,NULL,'dxMjEOaenlUMLCmgnPbxhGPAqL64eNtgWDFLEwkQ',NULL,'2026-11-04 18:16:22','2026-11-04 18:16:22'),(439,NULL,'sGu4GyzFLxJqFYjeDlIvdXl0IPk56jjrdTcJWSYk',NULL,'2026-11-04 18:24:03','2026-11-04 18:24:03'),(440,NULL,'O460FrpDdH6VOMv1wO7MeoqV9Ez71U59b9ezUooC',NULL,'2026-11-04 19:57:57','2026-11-04 19:57:57'),(441,NULL,'aimk6hfzVFhAnHgub8YHQ3bC1eVMU0K7SOPkQpkV',NULL,'2026-11-04 20:12:25','2026-11-04 20:12:25'),(442,NULL,'AohQ4gdvSTFD5FIqWaDMVyo2OvnWKnoODV1KSEHQ',NULL,'2026-11-04 20:12:25','2026-11-04 20:12:25'),(443,NULL,'be9Zh8unHygkJ3bJVh6XieAcsWKTMoggNIjkuW62',NULL,'2026-11-04 20:54:33','2026-11-04 20:54:33'),(444,NULL,'h6V1kFjAP0ffLwxiTkAqaMu6LAgQ7WeHmFupUN8q',NULL,'2026-11-04 21:20:49','2026-11-04 21:20:49'),(445,NULL,'JnMo2B0kJrRwBMptLSGerXJbUITXXdKSRR8ePVYH',NULL,'2026-11-04 21:58:30','2026-11-04 21:58:30'),(446,NULL,'ypdNJGvrNwtG8ayIWYo1TLyCItt1c5MLr9LgZzmA',NULL,'2026-11-04 22:24:46','2026-11-04 22:24:46'),(447,NULL,'hVzjRjlheo2LgGNwiE1yj2PKdmvcuiYUVX5V7med',NULL,'2026-11-04 22:24:56','2026-11-04 22:24:56'),(448,NULL,'7T6IxsD2Gy5YY26UZAQiuoqBCE9NMyyXGouSMpZv',NULL,'2026-11-04 22:25:05','2026-11-04 22:25:05'),(449,NULL,'EcVi3BvLZsDaC8M2wtjYCa5uq5ChtqutpRdvl131',NULL,'2026-11-04 22:25:13','2026-11-04 22:25:13'),(450,NULL,'JvHodzydhF4aHUzN7DWDfjNNuOFIuM4GGD0olkNs',NULL,'2026-11-04 22:25:21','2026-11-04 22:25:21'),(451,NULL,'HMVP1S9yMSruIIIrVaCsw8gy7XUIuWYX66aSEJR7',NULL,'2026-11-04 22:25:42','2026-11-04 22:25:42'),(452,NULL,'yrDeQrsxI26CKz56TBpnWzZJTKyfsEhRek1SCfNW',NULL,'2026-11-04 22:25:52','2026-11-04 22:25:52'),(453,NULL,'B4KXjwx7vpoIUswidyofwSXSQ7Xfx457NgMp5TyN',NULL,'2026-11-04 22:26:03','2026-11-04 22:26:03'),(454,NULL,'1y5dwTcNuXS45zQqlm8pInIGGbYvpcUyAznioylO',NULL,'2026-11-04 22:26:15','2026-11-04 22:26:15'),(455,NULL,'GUOkACwovXEYD0p3IqYNBnuJQeIKimrPs5jEtmrZ',NULL,'2026-11-04 22:26:24','2026-11-04 22:26:24'),(456,NULL,'IG3X6FpwqQFQtey0ugF0aNGlU02dJdcQFAjR23z0',NULL,'2026-11-04 22:26:34','2026-11-04 22:26:34'),(457,NULL,'PzBu69Qedp22gFRumxMZohc29qaDOs3pDG7Sze1O',NULL,'2026-11-04 22:26:44','2026-11-04 22:26:44'),(458,NULL,'GWgN6huKQQhqxnTOqIcVJKkMWrlLUcJDS0PXQPjK',NULL,'2026-11-04 22:26:54','2026-11-04 22:26:54'),(459,NULL,'RfhdKDpjBDKsVn5OsSAeZmhrVZFuBIxOqFPa6RbH',NULL,'2026-11-04 22:27:03','2026-11-04 22:27:03'),(460,NULL,'dVBNkNigb9IX4AT6m4uF2Rm6oToYBxCYaPWslvDg',NULL,'2026-11-04 22:27:12','2026-11-04 22:27:12'),(461,NULL,'juxhnszULAYZRei05YZPG9uhUbZwq2Ght8U3NbtD',NULL,'2026-11-04 22:27:20','2026-11-04 22:27:20'),(462,NULL,'6nVpR0vqOWhiqh0oodHmE5zVgESKmYM4cvGYP9Sn',NULL,'2026-11-04 22:27:28','2026-11-04 22:27:28'),(463,NULL,'Uv4Unx2ZjMCHjAlhESxVPsmrKNGtEZ44Nry3U9Vz',NULL,'2026-11-04 22:27:34','2026-11-04 22:27:34'),(464,NULL,'qANfN8Chd9d4PE75UCMObfXXu5HdABuyMTKqnj7u',NULL,'2026-11-04 22:27:40','2026-11-04 22:27:40'),(465,NULL,'nLTwPgVorYzxjiihfVAuwsUpDzXk565hRHYOhAYc',NULL,'2026-11-04 22:27:46','2026-11-04 22:27:46'),(466,NULL,'1C5D8XPVScu50hVQdysVd1FcqAp7PqIEa8js4JjO',NULL,'2026-11-04 22:34:16','2026-11-04 22:34:16'),(467,NULL,'LWjJwITDOrnKpdL8P0iIuc3ovYWJNqFGfPJb42fB',NULL,'2026-11-04 22:35:49','2026-11-04 22:35:49'),(468,NULL,'fJiN8cfGoke7vD8bCNCNCjDJCtP1NGNyfCN0lmYe',NULL,'2026-11-04 22:46:22','2026-11-04 22:46:22'),(469,NULL,'4l8zWuOXxaiwDAxgKXmHKM7mnXhSvh1J0odT678u',NULL,'2026-11-04 22:52:45','2026-11-04 22:52:45'),(470,NULL,'rmurarNYk6nOYXFS5CB7ml5gEn7Xlfp7YmLOJiOG',NULL,'2026-11-04 22:56:21','2026-11-04 22:56:21'),(471,NULL,'jFOBhRjn61T2lGzB1nm5UwlWVCnSI1CHcxgIrP2S',NULL,'2026-11-04 22:59:11','2026-11-04 22:59:11'),(472,NULL,'EZ38P9tZyyDMq0rBlv2321b1ltkFYqUWxlRcAefX',NULL,'2026-11-04 23:24:03','2026-11-04 23:24:03'),(473,NULL,'VfMjpm3rB80PrWOY8m0oxmByABJZXKcCswFy548Z',NULL,'2026-11-04 23:49:13','2026-11-04 23:49:13'),(474,NULL,'KsdzkgDElA3uzf1OHUS2XuDMthShtfh61UklIVNV',NULL,'2026-11-04 23:49:13','2026-11-04 23:49:13'),(475,NULL,'bi3kGT8KQ6S5y3Da6Zb03GYmcK6kXXjV5oXCNOnh',NULL,'2026-11-04 23:49:13','2026-11-04 23:49:13'),(476,NULL,'cBke3LzFdMvS0Vix2PmlYi1C51TzFdUtndwdQDj7',NULL,'2026-11-04 23:49:13','2026-11-04 23:49:13'),(477,NULL,'iMmeQ9DkK2L86zu0mNlOCEGueeg92TBlySniHlzo',NULL,'2026-11-04 23:49:13','2026-11-04 23:49:13'),(478,NULL,'shiTjMBmX0lFv1rY9kXaBZfdLHaZQcOQWCyCfP5O',NULL,'2026-11-04 23:49:13','2026-11-04 23:49:13'),(479,NULL,'kLz0pNufM4I5YpAWGghkxcWfFc3XFdQO3muUu6x5',NULL,'2026-11-04 23:49:14','2026-11-04 23:49:14'),(480,NULL,'V8Psd2vUaaJkzeFqnQXoYDoogq22ji1ZWPXzHheK',NULL,'2026-11-04 23:52:36','2026-11-04 23:52:36'),(481,NULL,'tyrh2IP6AZeko16zkotGTnottp8QKhEApTrzPTYh',NULL,'2026-11-04 23:55:56','2026-11-04 23:55:56'),(482,NULL,'lrqm8cu4dxg8rZYYy3u303dKIYMnwhpJ3lWZLEdV',NULL,'2026-11-04 23:55:57','2026-11-04 23:55:57'),(483,NULL,'WIWxezfX4E41C8QrbiHkoTR5YYm4RI3625kJ4WoY',NULL,'2026-11-04 23:55:57','2026-11-04 23:55:57'),(484,NULL,'dsS0kaM03y8cgbMu169CJXytYMwwv4TkrqIe7Zkn',NULL,'2026-11-04 23:55:58','2026-11-04 23:55:58'),(485,NULL,'79dNCMtFGuct6wvB6vnsWL6Fz0fyDedK4LsCuNhd',NULL,'2026-11-04 23:55:58','2026-11-04 23:55:58'),(486,NULL,'sngZX1tvZiethNuA1zHr1Vzi0XHD5DMUCMsENtwY',NULL,'2026-11-04 23:55:58','2026-11-04 23:55:58'),(487,NULL,'jXFFVJDMYWutUfa5tY2t92OXv4TIkGKoE69i8HXO',NULL,'2026-11-04 23:55:58','2026-11-04 23:55:58'),(488,NULL,'csRoavkMr3p6CWHwaJek4uzzNCNtmz1iEs4ksWxc',NULL,'2026-11-04 23:55:58','2026-11-04 23:55:58'),(489,NULL,'W6BNmQwjFZ7o9v3p1OH1hQyF98UWbV6Zmv0hhWKk',NULL,'2026-11-05 00:02:26','2026-11-05 00:02:26'),(490,NULL,'fWpM7slJ47rhGcMUS6nLq7It83LOcLmctalyDCJo',NULL,'2026-11-05 00:02:28','2026-11-05 00:02:28'),(491,NULL,'dSIyNax7CksB90ouvKFiu1LCHNc2kYrCZdQDDn3q',NULL,'2026-11-05 00:15:21','2026-11-05 00:15:21'),(492,NULL,'vxIB830wZXlIxGOYeNBpfbZIIdEZiKjLWj9Ewo0A',NULL,'2026-11-05 00:29:45','2026-11-05 00:29:45'),(493,NULL,'1QwVz48Q3LsNCP34AvqrJqiKXJhGJd1tmRi0OwRA',NULL,'2026-11-05 00:38:10','2026-11-05 00:38:10'),(494,NULL,'6HWj6ERrEihTjHSfr7xii7Zxzb8IqioZ0BSksdmo',NULL,'2026-11-05 00:53:50','2026-11-05 00:53:50'),(495,NULL,'zFsyub5u0defzIq1IctZ2lDzrKDLJLmrnmIbToPO',NULL,'2026-11-05 00:53:51','2026-11-05 00:53:51'),(496,NULL,'hnENbvaK1m0qlazSYhoQ3b5o4A7AkLdPg5PatTZp',NULL,'2026-11-05 00:53:52','2026-11-05 00:53:52'),(497,NULL,'QawazZT0kTm86AoamCg9iaJasMfBQGu1YJTElJh9',NULL,'2026-11-05 00:53:59','2026-11-05 00:53:59'),(498,NULL,'8GA1XLOD5Kwcp03AdHRvRZeRxY7GomIQciYmzE45',NULL,'2026-11-05 01:12:27','2026-11-05 01:12:27'),(499,NULL,'Ss7IwRnDWKDfGKZKTPGKR9a2JC1Vs9R37KDYqvcw',NULL,'2026-11-05 01:21:51','2026-11-05 01:21:51'),(500,NULL,'cfvBJgwi6tIKqwBg9HwTXldZytgCiATE1MNb6Mvj',NULL,'2026-11-05 02:00:09','2026-11-05 02:00:09'),(501,NULL,'kZo5vg0KNCxb18XmohBMXXupCiUucXjwzxqBFUce',NULL,'2026-11-05 02:12:06','2026-11-05 02:12:06'),(502,NULL,'9xB8jBQLIF760tyATWbmjowurH8k5HxgDJwyx79k',NULL,'2026-11-05 02:12:06','2026-11-05 02:12:06'),(503,NULL,'YREiY9ME5EXjvCs8qWfh2jPtHMaMECTOZo3cWlrv',NULL,'2026-11-05 02:39:25','2026-11-05 02:39:25'),(504,NULL,'LNNTijtnDsRrSNx808AULc2S0RPkIeCbR60XI6N0',NULL,'2026-11-05 02:41:41','2026-11-05 02:41:41'),(505,NULL,'gX2UGVUAOBUw79eWmuhPD2rUbksfdZUtxY7uTQY9',NULL,'2026-11-05 03:09:54','2026-11-05 03:09:54'),(506,NULL,'dXnxMgdcIqCWyc5she5ofn1fTTbCSH3ZFUQsG7Ri',NULL,'2026-11-05 03:47:28','2026-11-05 03:47:28'),(507,NULL,'rgmzHR63v63ErAd3VSBCHFbjnYLyGQ2zazvoUE1c',NULL,'2026-11-05 04:22:41','2026-11-05 04:22:41'),(508,NULL,'YIEMx3cEWYZcSCKsVgufhpqIodeu9VeLJ1q36Doa',NULL,'2026-11-05 04:24:43','2026-11-05 04:24:43'),(509,NULL,'fn47QNxbpsnPjolIPmj9eSpFZJlhLMj3kJUlIdNB',NULL,'2026-11-05 04:26:25','2026-11-05 04:26:25'),(510,NULL,'95IWTxg1fhxWnEhBKEm3aY5OesgEAsVyplAimgSx',NULL,'2026-11-05 04:27:54','2026-11-05 04:27:54'),(511,NULL,'304rboQcWqSRMqO4TtatySsU5ljPfHJ3xdirQAAw',NULL,'2026-11-05 05:30:05','2026-11-05 05:30:05'),(512,NULL,'QdggpseWUGWDd884TEFuwUaHL0Ms1I0QO2elvg1P',NULL,'2026-11-05 05:42:19','2026-11-05 05:42:19'),(513,NULL,'XUzSLznh1WIAhKQRJzm0ITIKwCVcKuH895hRiAyY',NULL,'2026-11-05 05:53:44','2026-11-05 05:53:44'),(514,NULL,'Y801CjL7prhXWgk92oZW1LJ53rzaBK3KL7xeTRqx',NULL,'2026-11-05 06:09:30','2026-11-05 06:09:30'),(515,NULL,'aShIxngmWZlSS2bXJYou77w4bhXIopVHwFFic2vh',NULL,'2026-11-06 10:33:40','2026-11-06 10:33:40'),(516,NULL,'sdB5RpCkE4ib79G7NAEFr2JXJyxdbVevhdzHI2fX',NULL,'2026-11-06 22:23:08','2026-11-06 22:23:08');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (8,'Dining','dining',NULL,'categories/01M6N8GXRDWEGDS8GQC90JEGRW.jpeg',1,1,0,NULL,NULL,'2026-11-05 07:07:12','2026-11-05 07:09:23'),(9,'Living Room','living-room','Heloo ','categories/01M6N8QV8CW9KEVPR35NM7CANQ.jpeg',1,1,0,'Living Room','Living Room','2026-11-05 07:10:59','2026-11-05 07:11:28'),(10,'Bedroom','bedroom','Bedroom','categories/01M6NA2E6G0A18P66HEACP615J.png',1,1,0,NULL,NULL,'2026-11-05 07:34:15','2026-11-05 07:34:15');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_product`
--

DROP TABLE IF EXISTS `collection_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_product_collection_id_product_id_unique` (`collection_id`,`product_id`),
  KEY `collection_product_product_id_foreign` (`product_id`),
  CONSTRAINT `collection_product_collection_id_foreign` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `collection_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_product`
--

LOCK TABLES `collection_product` WRITE;
/*!40000 ALTER TABLE `collection_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collections_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,2) NOT NULL,
  `min_order_amount` decimal(12,2) DEFAULT NULL,
  `usage_limit` int unsigned DEFAULT NULL,
  `used_count` int unsigned NOT NULL DEFAULT '0',
  `starts_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'NOIR10','percentage',10.00,50.00,NULL,0,NULL,'2027-04-29 09:15:32',1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(2,'WELCOME20','fixed',20.00,100.00,NULL,0,NULL,NULL,1,'2026-10-29 09:15:32','2026-10-29 09:15:32');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_campaigns`
--

DROP TABLE IF EXISTS `discount_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_campaigns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,2) NOT NULL,
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_campaigns`
--

LOCK TABLES `discount_campaigns` WRITE;
/*!40000 ALTER TABLE `discount_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_campaigns` ENABLE KEYS */;
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
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What is your return policy?','We offer 30-day returns on unworn items with tags attached.','shipping',1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_sales`
--

DROP TABLE IF EXISTS `flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starts_at` timestamp NOT NULL,
  `ends_at` timestamp NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_sales`
--

LOCK TABLES `flash_sales` WRITE;
/*!40000 ALTER TABLE `flash_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiries`
--

DROP TABLE IF EXISTS `inquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `furniture_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dimensions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `reference_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inquiries_product_id_foreign` (`product_id`),
  CONSTRAINT `inquiries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiries`
--

LOCK TABLES `inquiries` WRITE;
/*!40000 ALTER TABLE `inquiries` DISABLE KEYS */;
INSERT INTO `inquiries` VALUES (1,25,'product','Mehra','7988532993',NULL,'Ambala cantt',NULL,NULL,NULL,'testing',NULL,'new','2026-11-05 09:22:17','2026-11-05 09:22:17');
/*!40000 ALTER TABLE `inquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instagram_posts`
--

DROP TABLE IF EXISTS `instagram_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instagram_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instagram_posts`
--

LOCK TABLES `instagram_posts` WRITE;
/*!40000 ALTER TABLE `instagram_posts` DISABLE KEYS */;
INSERT INTO `instagram_posts` VALUES (1,'https://images.unsplash.com/photo-1523381210434-271fa8a854e4?w=400&q=80','https://instagram.com',1,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(2,'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400&q=80','https://instagram.com',2,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(3,'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=400&q=80','https://instagram.com',3,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(4,'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=400&q=80','https://instagram.com',4,1,'2026-10-29 09:15:33','2026-10-29 09:15:33');
/*!40000 ALTER TABLE `instagram_posts` ENABLE KEYS */;
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
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_06_01_141244_create_permission_tables',1),(5,'2026_06_01_141245_create_media_table',1),(6,'2026_06_01_141724_create_personal_access_tokens_table',1),(7,'2026_06_01_150000_create_ecommerce_tables',1),(8,'2026_11_05_000000_create_inquiries_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_subscribers`
--

DROP TABLE IF EXISTS `newsletter_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_subscribers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `newsletter_subscribers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscribers`
--

LOCK TABLES `newsletter_subscribers` WRITE;
/*!40000 ALTER TABLE `newsletter_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `product_variant_id` bigint unsigned DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int unsigned NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_product_variant_id_foreign` (`product_variant_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `order_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_histories`
--

DROP TABLE IF EXISTS `order_status_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_status_histories_order_id_foreign` (`order_id`),
  KEY `order_status_histories_created_by_foreign` (`created_by`),
  CONSTRAINT `order_status_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `order_status_histories_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_histories`
--

LOCK TABLES `order_status_histories` WRITE;
/*!40000 ALTER TABLE `order_status_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `guest_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AUD',
  `subtotal` decimal(12,2) NOT NULL,
  `discount_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `wallet_used` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total` decimal(12,2) NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` json DEFAULT NULL,
  `billing_address` json DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `tracking_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `shipped_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_verifications`
--

DROP TABLE IF EXISTS `otp_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_verifications`
--

LOCK TABLES `otp_verifications` WRITE;
/*!40000 ALTER TABLE `otp_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AUD',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_order_id_foreign` (`order_id`),
  CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
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
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,1,'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=800&q=80',NULL,1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(2,2,'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=800&q=80',NULL,1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(3,3,'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800&q=80',NULL,1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(4,4,'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=800&q=80',NULL,1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(5,5,'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=800&q=80',NULL,1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(6,6,'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=800&q=80',NULL,1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(7,7,'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800&q=80',NULL,1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(8,8,'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=800&q=80',NULL,1,0,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(9,9,'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=1200&q=88','Haven Modular Sofa',1,0,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(10,10,'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?w=1200&q=88','Elara Lounge Chair',1,0,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(11,11,'https://images.unsplash.com/photo-1532372320572-cda25653a694?w=1200&q=88','Sora Oak Coffee Table',1,0,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(12,12,'https://images.unsplash.com/photo-1549497538-303791108f95?w=1200&q=88','Milo Bouclé Armchair',1,0,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(13,13,'https://images.unsplash.com/photo-1617806118233-18e1de247200?w=1200&q=88','Tide Solid Oak Dining Table',1,0,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(14,14,'https://images.unsplash.com/photo-1503602642458-232111445657?w=1200&q=88','Cove Dining Chair',1,0,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(15,15,'https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=1200&q=88','Forma Bed Frame',1,0,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(16,16,'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=1200&q=88','Aster Travertine Lamp',1,0,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(17,17,'products/01M6NAD274BW9F7TB5H4BSQ2E4.jpeg','Royal Victorian Green Leather Wingback Armchair',1,0,'2026-11-05 07:40:03','2026-11-05 07:40:37'),(18,17,'products/01M6NADH4D1D7C4MXF7JSPT3A5.jpeg',' Armchair',0,0,'2026-11-05 07:40:18','2026-11-05 07:40:18'),(19,17,'products/01M6NADWD3EBANT7Y039XR6PXW.jpeg',' Green Leather Wingback Armchair',0,0,'2026-11-05 07:40:29','2026-11-05 07:40:29'),(20,18,'products/01M6NAP1BFF1667GQBPAMCJKXY.jpeg','Shop the Royal Chesterfield Luxury Brown',0,0,'2026-11-05 07:44:57','2026-11-05 07:44:57'),(21,18,'products/01M6NAPB5JK484DAEZTRRYZ9ZK.jpeg','Shop the Royal Chesterfield Luxury Brown Sofa Set featuring elegant diamond button tufting, rolled arms, premium brown upholstery and timeless classic styling. Perfect for luxury living rooms and lounges.',1,0,'2026-11-05 07:45:07','2026-11-05 07:45:07'),(22,19,'products/01M6NATG58GY2XAYQ9NZZM95C9.jpeg','Royal Maharaja Gold Carved Sofa Set | Luxury Wooden Furniture',1,0,'2026-11-05 07:47:23','2026-11-05 07:47:23'),(23,20,'products/01M6NAZNSC54VQP61THDJH3AGW.jpeg','Royal Imperial L-Shaped Sofa Set',1,0,'2026-11-05 07:50:13','2026-11-05 07:50:18'),(24,21,'products/01M6NB2KNN6E2XYB2XNF7EY3CP.jpeg','Royal Azure Blue & Gold Sofa Set',1,1,'2026-11-05 07:51:49','2026-11-05 07:52:24'),(25,21,'products/01M6NB3GQA74KSE7SFWNZPF6S6.jpeg','Royal Azure Blue & Gold Sofa Set | Luxury Carved Wooden Furniture',1,0,'2026-11-05 07:52:18','2026-11-05 07:52:18'),(26,22,'products/01M6NBAQNYF86EMAFPSS172J7M.jpeg','Royal Noir Black & Gold Loveseat Sofa ',1,0,'2026-11-05 07:56:15','2026-11-05 07:56:15'),(27,22,'products/01M6NBB8DA119MNP89V7XCD9Y5.jpeg','Luxury Carved Furniture',0,1,'2026-11-05 07:56:32','2026-11-05 07:56:32'),(28,22,'products/01M6NBC94WX5TYG1XM933B097K.jpeg','Royal Noir Black & Gold Loveseat Sofa | Luxury Carved Furniture',0,2,'2026-11-05 07:57:06','2026-11-05 07:57:06'),(29,23,'products/01M6NBGKR40SZYW9YC4MH2M0X2.jpeg','Royal Blush Pink Gold L-Shaped Sofa Set | Luxury Carved Furniture',1,0,'2026-11-05 07:59:28','2026-11-05 07:59:28'),(30,24,'products/01M6NBN7233N6MCV3A626NBTG1.jpeg','Royal Imperial Gold Dining Table Set | Luxury 6 Seater Dining Furniture',0,1,'2026-11-05 08:01:58','2026-11-05 08:01:58'),(31,24,'products/01M6NBNJ4WT0Q1Z5RCZHJ7SX3H.jpeg','Royal Imperial Gold Dining Table Set | Luxury 6 Seater Dining Furniture',1,0,'2026-11-05 08:02:10','2026-11-05 08:02:10'),(32,25,'products/01M6NBS0JGWTVV57A77Z1FT9V3.jpeg','Royal Heritage Gold & Black 6 Seater Dining Table Set',1,0,'2026-11-05 08:04:03','2026-11-05 08:04:03'),(33,26,'products/01M6ND0B79DME6T8NXP7N6NXJJ.jpeg','Royal Maharaja Champagne Gold Sofa Set | Luxury Classic Furniture',0,1,'2026-11-05 08:25:32','2026-11-05 08:25:32'),(34,26,'products/01M6ND0N33A191J0SCYFD6HE5A.jpeg','Royal Maharaja Champagne Gold Sofa Set | Luxury Classic Furniture',1,0,'2026-11-05 08:25:42','2026-11-05 08:25:42');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_hex` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `stock` int unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_variants_sku_unique` (`sku`),
  KEY `product_variants_product_id_foreign` (`product_id`),
  CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
INSERT INTO `product_variants` VALUES (1,1,'NC-IR5RQ7-S','S','Black','#000000',NULL,13,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(2,1,'NC-IR5RQ7-M','M','Black','#000000',NULL,6,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(3,1,'NC-IR5RQ7-L','L','Black','#000000',NULL,18,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(4,1,'NC-IR5RQ7-XL','XL','Black','#000000',NULL,10,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(5,2,'NC-BWDXAM-S','S','Black','#000000',NULL,5,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(6,2,'NC-BWDXAM-M','M','Black','#000000',NULL,6,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(7,2,'NC-BWDXAM-L','L','Black','#000000',NULL,5,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(8,2,'NC-BWDXAM-XL','XL','Black','#000000',NULL,5,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(9,3,'NC-QKSAZL-S','S','Black','#000000',NULL,13,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(10,3,'NC-QKSAZL-M','M','Black','#000000',NULL,12,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(11,3,'NC-QKSAZL-L','L','Black','#000000',NULL,12,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(12,3,'NC-QKSAZL-XL','XL','Black','#000000',NULL,6,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(13,4,'NC-X95PWV-S','S','Black','#000000',NULL,20,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(14,4,'NC-X95PWV-M','M','Black','#000000',NULL,11,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(15,4,'NC-X95PWV-L','L','Black','#000000',NULL,19,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(16,4,'NC-X95PWV-XL','XL','Black','#000000',NULL,20,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(17,5,'NC-RX1ACY-S','S','Black','#000000',NULL,7,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(18,5,'NC-RX1ACY-M','M','Black','#000000',NULL,10,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(19,5,'NC-RX1ACY-L','L','Black','#000000',NULL,20,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(20,5,'NC-RX1ACY-XL','XL','Black','#000000',NULL,8,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(21,6,'NC-VVJDXJ-S','S','Black','#000000',NULL,6,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(22,6,'NC-VVJDXJ-M','M','Black','#000000',NULL,11,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(23,6,'NC-VVJDXJ-L','L','Black','#000000',NULL,5,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(24,6,'NC-VVJDXJ-XL','XL','Black','#000000',NULL,11,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(25,7,'NC-XULLBP-S','S','Black','#000000',NULL,9,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(26,7,'NC-XULLBP-M','M','Black','#000000',NULL,16,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(27,7,'NC-XULLBP-L','L','Black','#000000',NULL,5,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(28,7,'NC-XULLBP-XL','XL','Black','#000000',NULL,12,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(29,8,'NC-0DGFIA-S','S','Black','#000000',NULL,10,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(30,8,'NC-0DGFIA-M','M','Black','#000000',NULL,7,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(31,8,'NC-0DGFIA-L','L','Black','#000000',NULL,10,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(32,8,'NC-0DGFIA-XL','XL','Black','#000000',NULL,17,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(33,9,'ARD-001-NAT',NULL,'Natural','#d6c5aa',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(34,9,'ARD-001-OAT',NULL,'Oat','#e6dfd1',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(35,9,'ARD-001-WAL',NULL,'Walnut','#6d4c36',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(36,10,'ARD-002-NAT',NULL,'Natural','#d6c5aa',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(37,10,'ARD-002-OAT',NULL,'Oat','#e6dfd1',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(38,10,'ARD-002-WAL',NULL,'Walnut','#6d4c36',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(39,11,'ARD-003-NAT',NULL,'Natural','#d6c5aa',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(40,11,'ARD-003-OAT',NULL,'Oat','#e6dfd1',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(41,11,'ARD-003-WAL',NULL,'Walnut','#6d4c36',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(42,12,'ARD-004-NAT',NULL,'Natural','#d6c5aa',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(43,12,'ARD-004-OAT',NULL,'Oat','#e6dfd1',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(44,12,'ARD-004-WAL',NULL,'Walnut','#6d4c36',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(45,13,'ARD-005-NAT',NULL,'Natural','#d6c5aa',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(46,13,'ARD-005-OAT',NULL,'Oat','#e6dfd1',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(47,13,'ARD-005-WAL',NULL,'Walnut','#6d4c36',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(48,14,'ARD-006-NAT',NULL,'Natural','#d6c5aa',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(49,14,'ARD-006-OAT',NULL,'Oat','#e6dfd1',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(50,14,'ARD-006-WAL',NULL,'Walnut','#6d4c36',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(51,15,'ARD-007-NAT',NULL,'Natural','#d6c5aa',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(52,15,'ARD-007-OAT',NULL,'Oat','#e6dfd1',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(53,15,'ARD-007-WAL',NULL,'Walnut','#6d4c36',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(54,16,'ARD-008-NAT',NULL,'Natural','#d6c5aa',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(55,16,'ARD-008-OAT',NULL,'Oat','#e6dfd1',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33'),(56,16,'ARD-008-WAL',NULL,'Walnut','#6d4c36',NULL,12,1,'2026-10-29 09:15:33','2026-10-29 09:15:33');
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_videos`
--

DROP TABLE IF EXISTS `product_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_videos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_videos_product_id_foreign` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_videos`
--

LOCK TABLES `product_videos` WRITE;
/*!40000 ALTER TABLE `product_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned DEFAULT NULL,
  `brand_id` bigint unsigned DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `subcategory_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `specifications` longtext COLLATE utf8mb4_unicode_ci,
  `shipping_info` longtext COLLATE utf8mb4_unicode_ci,
  `size_guide` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,2) NOT NULL,
  `compare_at_price` decimal(12,2) DEFAULT NULL,
  `cost_price` decimal(12,2) DEFAULT NULL,
  `stock` int unsigned NOT NULL DEFAULT '0',
  `low_stock_threshold` int unsigned NOT NULL DEFAULT '5',
  `available_sizes` json DEFAULT NULL,
  `available_colors` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_trending` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_arrival` tinyint(1) NOT NULL DEFAULT '0',
  `is_best_seller` tinyint(1) NOT NULL DEFAULT '0',
  `is_flash_sale` tinyint(1) NOT NULL DEFAULT '0',
  `flash_sale_ends_at` timestamp NULL DEFAULT NULL,
  `flash_sale_price` decimal(12,2) DEFAULT NULL,
  `rating_avg` decimal(3,2) NOT NULL DEFAULT '0.00',
  `rating_count` int unsigned NOT NULL DEFAULT '0',
  `views_count` int unsigned NOT NULL DEFAULT '0',
  `sales_count` int unsigned NOT NULL DEFAULT '0',
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_vendor_id_foreign` (`vendor_id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_subcategory_id_foreign` (`subcategory_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,NULL,2,NULL,NULL,'Shadow Essential Hoodie','shadow-essential-hoodie','NC-IR5RQ7','Premium heavyweight streetwear crafted for the Australian climate.','Built with premium materials and a relaxed luxury fit. Part of the NOIR Collective core range.',NULL,'Free shipping on orders over $150. Standard delivery 3-7 business days across Australia.','S: Chest 96cm\nM: Chest 104cm\nL: Chest 112cm\nXL: Chest 120cm',129.00,154.80,NULL,12,5,'[\"S\", \"M\", \"L\", \"XL\", \"XXL\"]','[\"Black\", \"Charcoal\", \"Stone\"]',0,0,1,0,1,0,NULL,NULL,0.00,0,0,0,NULL,NULL,'2026-10-29 09:15:32','2026-11-05 07:36:08','2026-11-05 07:36:08'),(2,NULL,3,NULL,NULL,'Midnight Cargo Pant','midnight-cargo-pant','NC-BWDXAM','Premium heavyweight streetwear crafted for the Australian climate.','Built with premium materials and a relaxed luxury fit. Part of the NOIR Collective core range.',NULL,'Free shipping on orders over $150. Standard delivery 3-7 business days across Australia.','S: Chest 96cm\nM: Chest 104cm\nL: Chest 112cm\nXL: Chest 120cm',149.00,178.80,NULL,49,5,'[\"S\", \"M\", \"L\", \"XL\", \"XXL\"]','[\"Black\", \"Charcoal\", \"Stone\"]',0,0,0,1,0,0,NULL,NULL,0.00,0,0,0,NULL,NULL,'2026-10-29 09:15:32','2026-11-05 07:36:08','2026-11-05 07:36:08'),(3,NULL,2,NULL,NULL,'Void Graphic Tee','void-graphic-tee','NC-QKSAZL','Premium heavyweight streetwear crafted for the Australian climate.','Built with premium materials and a relaxed luxury fit. Part of the NOIR Collective core range.',NULL,'Free shipping on orders over $150. Standard delivery 3-7 business days across Australia.','S: Chest 96cm\nM: Chest 104cm\nL: Chest 112cm\nXL: Chest 120cm',79.00,94.80,NULL,58,5,'[\"S\", \"M\", \"L\", \"XL\", \"XXL\"]','[\"Black\", \"Charcoal\", \"Stone\"]',0,0,1,0,0,0,NULL,NULL,0.00,0,0,0,NULL,NULL,'2026-10-29 09:15:32','2026-11-05 07:36:08','2026-11-05 07:36:08'),(4,NULL,2,NULL,NULL,'Concrete Zip Hoodie','concrete-zip-hoodie','NC-X95PWV','Premium heavyweight streetwear crafted for the Australian climate.','Built with premium materials and a relaxed luxury fit. Part of the NOIR Collective core range.',NULL,'Free shipping on orders over $150. Standard delivery 3-7 business days across Australia.','S: Chest 96cm\nM: Chest 104cm\nL: Chest 112cm\nXL: Chest 120cm',139.00,166.80,NULL,87,5,'[\"S\", \"M\", \"L\", \"XL\", \"XXL\"]','[\"Black\", \"Charcoal\", \"Stone\"]',0,0,0,0,0,1,'2026-11-01 09:15:32',99.00,0.00,0,0,0,NULL,NULL,'2026-10-29 09:15:32','2026-11-05 07:36:14','2026-11-05 07:36:14'),(5,NULL,4,NULL,NULL,'Noir Oversized Tee','noir-oversized-tee','NC-RX1ACY','Premium heavyweight streetwear crafted for the Australian climate.','Built with premium materials and a relaxed luxury fit. Part of the NOIR Collective core range.',NULL,'Free shipping on orders over $150. Standard delivery 3-7 business days across Australia.','S: Chest 96cm\nM: Chest 104cm\nL: Chest 112cm\nXL: Chest 120cm',69.00,82.80,NULL,38,5,'[\"S\", \"M\", \"L\", \"XL\", \"XXL\"]','[\"Black\", \"Charcoal\", \"Stone\"]',0,0,0,0,1,0,NULL,NULL,0.00,0,0,0,NULL,NULL,'2026-10-29 09:15:32','2026-11-05 07:36:14','2026-11-05 07:36:14'),(6,NULL,2,NULL,NULL,'Urban Shell Jacket','urban-shell-jacket','NC-VVJDXJ','Premium heavyweight streetwear crafted for the Australian climate.','Built with premium materials and a relaxed luxury fit. Part of the NOIR Collective core range.',NULL,'Free shipping on orders over $150. Standard delivery 3-7 business days across Australia.','S: Chest 96cm\nM: Chest 104cm\nL: Chest 112cm\nXL: Chest 120cm',199.00,238.80,NULL,47,5,'[\"S\", \"M\", \"L\", \"XL\", \"XXL\"]','[\"Black\", \"Charcoal\", \"Stone\"]',0,1,0,1,0,0,NULL,NULL,0.00,0,0,0,NULL,NULL,'2026-10-29 09:15:32','2026-11-05 07:36:14','2026-11-05 07:36:14'),(7,NULL,2,NULL,NULL,'Stealth Jogger','stealth-jogger','NC-XULLBP','Premium heavyweight streetwear crafted for the Australian climate.','Built with premium materials and a relaxed luxury fit. Part of the NOIR Collective core range.',NULL,'Free shipping on orders over $150. Standard delivery 3-7 business days across Australia.','S: Chest 96cm\nM: Chest 104cm\nL: Chest 112cm\nXL: Chest 120cm',119.00,142.80,NULL,94,5,'[\"S\", \"M\", \"L\", \"XL\", \"XXL\"]','[\"Black\", \"Charcoal\", \"Stone\"]',0,0,0,0,0,0,NULL,NULL,0.00,0,0,0,NULL,NULL,'2026-10-29 09:15:32','2026-11-05 07:36:14','2026-11-05 07:36:14'),(8,NULL,1,NULL,NULL,'Archive Logo Hoodie','archive-logo-hoodie','NC-0DGFIA','Premium heavyweight streetwear crafted for the Australian climate.','Built with premium materials and a relaxed luxury fit. Part of the NOIR Collective core range.',NULL,'Free shipping on orders over $150. Standard delivery 3-7 business days across Australia.','S: Chest 96cm\nM: Chest 104cm\nL: Chest 112cm\nXL: Chest 120cm',159.00,190.80,NULL,91,5,'[\"S\", \"M\", \"L\", \"XL\", \"XXL\"]','[\"Black\", \"Charcoal\", \"Stone\"]',0,0,1,1,0,0,NULL,NULL,0.00,0,0,0,NULL,NULL,'2026-10-29 09:15:32','2026-11-05 07:36:14','2026-11-05 07:36:14'),(9,NULL,5,NULL,NULL,'Haven Modular Sofa','haven-modular-sofa','ARD-001','A refined, enduring piece designed for relaxed Australian living.','Made with honest materials and considered proportions, this piece brings warmth, comfort and quiet character to everyday spaces.','Responsibly sourced materials. Five-year structural warranty. Assembly service available.','White-glove delivery available. Dispatches in 3–7 business days with Australia-wide tracking.',NULL,2490.00,NULL,NULL,20,5,NULL,'[\"Natural\", \"Oat\", \"Walnut\"]',1,0,1,0,1,0,NULL,NULL,0.00,0,19,0,NULL,NULL,'2026-10-29 09:15:33','2026-11-05 07:36:08','2026-11-05 07:36:08'),(10,NULL,5,NULL,NULL,'Elara Lounge Chair','elara-lounge-chair','ARD-002','A refined, enduring piece designed for relaxed Australian living.','Made with honest materials and considered proportions, this piece brings warmth, comfort and quiet character to everyday spaces.','Responsibly sourced materials. Five-year structural warranty. Assembly service available.','White-glove delivery available. Dispatches in 3–7 business days with Australia-wide tracking.',NULL,890.00,NULL,NULL,21,5,NULL,'[\"Natural\", \"Oat\", \"Walnut\"]',1,0,0,1,0,0,NULL,NULL,0.00,0,16,0,NULL,NULL,'2026-10-29 09:15:33','2026-11-05 07:36:08','2026-11-05 07:36:08'),(11,NULL,5,NULL,NULL,'Sora Oak Coffee Table','sora-oak-coffee-table','ARD-003','A refined, enduring piece designed for relaxed Australian living.','Made with honest materials and considered proportions, this piece brings warmth, comfort and quiet character to everyday spaces.','Responsibly sourced materials. Five-year structural warranty. Assembly service available.','White-glove delivery available. Dispatches in 3–7 business days with Australia-wide tracking.',NULL,720.00,NULL,NULL,22,5,NULL,'[\"Natural\", \"Oat\", \"Walnut\"]',1,0,0,0,1,0,NULL,NULL,0.00,0,11,0,NULL,NULL,'2026-10-29 09:15:33','2026-11-02 03:54:09','2026-11-02 03:54:09'),(12,NULL,5,NULL,NULL,'Milo Bouclé Armchair','milo-boucle-armchair','ARD-004','A refined, enduring piece designed for relaxed Australian living.','Made with honest materials and considered proportions, this piece brings warmth, comfort and quiet character to everyday spaces.','Responsibly sourced materials. Five-year structural warranty. Assembly service available.','White-glove delivery available. Dispatches in 3–7 business days with Australia-wide tracking.',NULL,980.00,NULL,NULL,23,5,NULL,'[\"Natural\", \"Oat\", \"Walnut\"]',1,0,1,0,0,0,NULL,NULL,0.00,0,9,0,NULL,NULL,'2026-10-29 09:15:33','2026-11-05 07:36:08','2026-11-05 07:36:08'),(13,NULL,5,NULL,NULL,'Tide Solid Oak Dining Table','tide-solid-oak-dining-table','ARD-005','A refined, enduring piece designed for relaxed Australian living.','Made with honest materials and considered proportions, this piece brings warmth, comfort and quiet character to everyday spaces.','Responsibly sourced materials. Five-year structural warranty. Assembly service available.','White-glove delivery available. Dispatches in 3–7 business days with Australia-wide tracking.',NULL,1890.00,NULL,NULL,24,5,NULL,'[\"Natural\", \"Oat\", \"Walnut\"]',1,1,0,1,0,0,NULL,NULL,0.00,0,18,0,NULL,NULL,'2026-10-29 09:15:33','2026-11-05 07:36:08','2026-11-05 07:36:08'),(14,NULL,5,NULL,NULL,'Cove Dining Chair','cove-dining-chair','ARD-006','A refined, enduring piece designed for relaxed Australian living.','Made with honest materials and considered proportions, this piece brings warmth, comfort and quiet character to everyday spaces.','Responsibly sourced materials. Five-year structural warranty. Assembly service available.','White-glove delivery available. Dispatches in 3–7 business days with Australia-wide tracking.',NULL,340.00,NULL,NULL,25,5,NULL,'[\"Natural\", \"Oat\", \"Walnut\"]',1,0,0,0,1,0,NULL,NULL,0.00,0,15,0,NULL,NULL,'2026-10-29 09:15:33','2026-11-05 07:36:08','2026-11-05 07:36:08'),(15,NULL,5,NULL,NULL,'Forma Bed Frame','forma-bed-frame','ARD-007','A refined, enduring piece designed for relaxed Australian living.','Made with honest materials and considered proportions, this piece brings warmth, comfort and quiet character to everyday spaces.','Responsibly sourced materials. Five-year structural warranty. Assembly service available.','White-glove delivery available. Dispatches in 3–7 business days with Australia-wide tracking.',NULL,1650.00,NULL,NULL,26,5,NULL,'[\"Natural\", \"Oat\", \"Walnut\"]',1,0,0,1,0,0,NULL,NULL,0.00,0,15,0,NULL,NULL,'2026-10-29 09:15:33','2026-11-05 07:36:08','2026-11-05 07:36:08'),(16,NULL,5,NULL,NULL,'Aster Travertine Lamp','aster-travertine-lamp','ARD-008','A refined, enduring piece designed for relaxed Australian living.','Made with honest materials and considered proportions, this piece brings warmth, comfort and quiet character to everyday spaces.','Responsibly sourced materials. Five-year structural warranty. Assembly service available.','White-glove delivery available. Dispatches in 3–7 business days with Australia-wide tracking.',NULL,420.00,420.00,NULL,27,5,NULL,'[\"Natural\", \"Oat\", \"Walnut\"]',1,0,0,0,0,1,NULL,350.00,0.00,0,4,0,NULL,NULL,'2026-10-29 09:15:33','2026-11-05 07:36:08','2026-11-05 07:36:08'),(17,NULL,5,9,NULL,'Royal Victorian Chesterfield Wingback Leather Armchair','royal-victorian-chesterfield-wingback-leather-armchair','122','Experience timeless elegance with this Royal Victorian Wingback Armchair, featuring luxurious dark green leather upholstery, an intricately carved wooden frame, and a beautifully tufted high backrest. A perfect statement piece for luxury homes, offices, hotels, and classic interiors.','<p>Bring royal sophistication to your interior with this beautifully handcrafted Victorian-style Wingback Armchair. Designed with a rich wooden frame, this chair showcases intricate decorative carvings, elegant curved armrests, and beautifully sculpted cabriole legs.</p><p>The deep green leather upholstery adds a luxurious touch, while the diamond-button tufted backrest provides classic elegance and comfortable support. Its antique-inspired design makes it an ideal addition to living rooms, luxury lounges, executive offices, hotels, and heritage-style interiors.</p><p>Combining traditional craftsmanship with timeless design, this armchair is more than just seating – it is a statement of luxury and refinement.</p>','Specification	Details\nProduct Type	Wingback Armchair\nStyle	Victorian / Royal Antique\nPrimary Material	Solid Wood Frame (confirm material)\nUpholstery	Green Leather / Leatherette (confirm)\nFrame Finish	Polished Natural Wood\nUpholstery Colour	Dark Forest Green\nBackrest	High Back with Diamond Button Tufting\nArmrest	Curved Upholstered Armrests\nLeg Style	Carved Cabriole Legs',NULL,'	110 cm\nOverall Width	75 cm\nOverall Depth	75 cm\nSeat Height	45 cm\nSeat Width	55 cm\nSeat Depth	55 cm\nArmrest Height	65 cm',0.00,NULL,NULL,0,0,'[]','[]',1,1,0,0,0,0,NULL,NULL,0.00,0,8,0,'Royal Victorian Green Leather Wingback Armchair | Luxury Wooden Chair',NULL,'2026-11-05 07:39:31','2026-11-07 06:15:14',NULL),(18,NULL,4,9,NULL,'Royal Chesterfield Luxury Leather Sofa Set','royal-chesterfield-luxury-leather-sofa-set','11','Add timeless elegance to your living space with this Royal Chesterfield Leather Sofa Set. Featuring rich dark chocolate-brown upholstery, deep diamond button tufting, rolled armrests, and elegant detailing, this luxurious sofa set offers a perfect blend of classic style, comfort, and sophistication.','<p>Transform your living room into a luxurious retreat with this Royal Chesterfield Sofa Set, beautifully designed to bring timeless elegance and premium comfort to your home.</p><p>Inspired by traditional Chesterfield furniture, this exquisite sofa set features deep diamond button-tufted backrests, elegantly rolled arms, decorative nailhead trim, and rich dark chocolate-brown upholstery. Its sophisticated appearance and carefully crafted detailing make it an ideal centrepiece for modern luxury homes, executive offices, hotels, and premium lounges.</p><p>The generously cushioned seats provide a comfortable seating experience, while the classic design adds a refined and prestigious character to any interior.</p><p>The collection includes a matching Chesterfield sofa and complementary armchairs, creating a coordinated and elegant seating arrangement.</p>','Specification	Details\nProduct Type	Luxury Sofa Set\nDesign Style	Classic Chesterfield\nUpholstery Colour	Dark Chocolate Brown\nUpholstery Material	Leather / Leatherette (confirm)\nFrame Material	Solid Wood (confirm)\nBackrest Design	Diamond Button Tufted\nArmrest Style	Rolled Arms\nDecorative Detailing	Nailhead Trim\nSeat Type	Cushioned Seating\nLeg Design	Traditional Wooden Legs\nFinish	Dark Brown\nSeating Arrangement	Sofa + Armchairs\nSuitable For	Living Room, Lounge, Hotel, Office',NULL,NULL,0.00,NULL,NULL,0,0,'[]','[]',1,1,0,1,0,0,NULL,NULL,0.00,0,6,0,'Royal Chesterfield Luxury Brown Leather Sofa Set | Classic Furniture','Shop the Royal Chesterfield Luxury Brown Sofa Set featuring elegant diamond button tufting, rolled arms, premium brown upholstery and timeless ','2026-11-05 07:44:13','2026-11-07 03:35:43',NULL),(19,NULL,5,9,NULL,'Royal Maharaja Luxury Gold Carved Sofa Set','royal-maharaja-luxury-gold-carved-sofa-set','110','Bring royal elegance to your home with this magnificent Maharaja Luxury Sofa Set. Featuring an intricately hand-carved golden wooden frame, elegant grey upholstery, luxurious floral fabric, and beautifully tufted backrests, this sofa set creates a sophisticated and regal living space.','<p>Experience the grandeur of traditional royal furniture with the Royal Maharaja Luxury Gold Carved Sofa Set. Designed to make a statement, this exquisite furniture collection showcases detailed ornamental wood carvings, an elegant gold finish, and beautifully upholstered seating.</p><p>The sofa set features a stunning combination of soft grey tufted backrests and premium champagne-gold floral upholstery. Its beautifully sculpted armrests, decorative crown detailing, and intricately carved legs reflect traditional craftsmanship and timeless royal aesthetics.</p><p>The coordinated collection includes matching sofas, a centre table, and decorative side tables, creating a complete and harmonious living room arrangement.</p><p>Perfect for luxury residences, villas, premium hotels, reception areas, and traditional interiors, this sofa set combines royal beauty with comfortable seating.</p>','Specification	Details\nProduct Type	Luxury Wooden Sofa Set\nCollection	Maharaja Royal Collection\nDesign Style	Royal / Traditional\nFrame Material	Solid Wood (confirm)\nFrame Finish	Antique Gold\nUpholstery Colour	Champagne Gold & Grey\nUpholstery Material	Premium Fabric (confirm)\nBackrest Design	Diamond Button Tufted\nArmrest Design	Ornamental Carved Armrests\nCushion Type	Upholstered Cushions\nLeg Design	Intricately Carved Wooden Legs\nDecorative Detailing	Floral Wood Carving\nSeating Arrangement	Multi-piece Sofa Set\nIncluded Furniture	Sofas, Centre Table & Side Tables\nSuitable For	Living Room, Villa, Hotel, Loung',NULL,NULL,0.00,NULL,NULL,0,0,'[]','[]',1,1,1,1,0,0,NULL,NULL,0.00,0,8,0,'Royal Maharaja Gold Carved Sofa Set | Luxury Wooden Furniture',NULL,'2026-11-05 07:47:07','2026-11-07 03:29:43',NULL),(20,NULL,5,9,NULL,'Royal Imperial Luxury Gold Carved L-Shaped Sofa Set','royal-imperial-luxury-gold-carved-l-shaped-sofa-set','112','Elevate your living space with this Royal Imperial L-Shaped Sofa Set, featuring an exquisite gold-carved wooden frame, luxurious floral upholstery, elegant beige cushioning, and beautifully handcrafted detailing. Its grand design and spacious corner seating bring timeless royal elegance and exceptional comfort to your home.','<p>Experience the beauty of royal craftsmanship with the Royal Imperial Luxury L-Shaped Sofa Set. Designed for elegant interiors, this magnificent sofa combines traditional artistic detailing with luxurious comfort.</p><p>The sofa showcases an intricately carved ornamental wooden frame with a rich antique gold finish. Its beautifully curved silhouette, decorative carved armrests, and premium beige upholstery create a sophisticated royal appearance.</p><p>The seating features elegant floral-patterned fabric complemented by plush brown and beige cushions, adding depth, warmth, and character to the overall design. The spacious L-shaped configuration provides generous seating, making it ideal for family gatherings and entertaining guests.</p><p>The matching oval coffee table features a dark polished tabletop with decorative gold detailing, completing the luxurious furniture arrangement.</p><p>Perfect for luxury villas, spacious living rooms, premium residences, hotels, and royal-style interiors.</p>','Specification	Details\nProduct Type	L-Shaped Sofa Set\nCollection	Royal Imperial Collection\nDesign Style	Classic Royal / Traditional\nConfiguration	L-Shaped Corner Sofa\nFrame Material	Wood (confirm exact type)\nFrame Finish	Antique Gold\nUpholstery Material	Premium Fabric (confirm)\nMain Upholstery Colour	Beige / Champagne',NULL,NULL,0.00,NULL,NULL,0,0,'[]','[]',1,1,0,0,0,0,NULL,NULL,0.00,0,4,0,'Royal Imperial L-Shaped Sofa Set | Luxury Gold Carved Furniture',NULL,'2026-11-05 07:49:59','2026-11-07 06:21:14',NULL),(21,NULL,5,9,NULL,'Royal Azure Blue & Gold Carved Luxury Sofa Set','royal-azure-blue-gold-carved-luxury-sofa-set','118','Transform your living room with this Royal Azure Blue & Gold Luxury Sofa Set, featuring an intricately carved golden wooden frame, elegant turquoise-blue upholstery, premium patterned cushions, and beautifully sculpted detailing. Its regal design and luxurious finish create a stunning centrepiece for sophisticated interiors.','<p>Bring timeless royal elegance into your home with the Royal Azure Blue &amp; Gold Carved Sofa Set. Inspired by traditional palace-style furniture, this magnificent collection combines intricate craftsmanship with luxurious upholstery and elegant detailing.</p><p>The sofa set features a beautifully carved wooden frame with an antique gold finish, complemented by rich turquoise-blue upholstery. Its decorative crown-style backrests, gracefully curved armrests, and ornamental carved legs showcase exquisite traditional craftsmanship.</p><p>The premium patterned cushions add texture and visual richness, while the generously cushioned seating provides a comfortable and welcoming experience.</p><p>The coordinated furniture arrangement includes matching sofas, decorative cushions, and a beautifully designed centre table, making it an ideal choice for luxury living rooms, villas, premium hotels, and grand reception spaces.</p>','roduct Type	Luxury Wooden Sofa Set\nCollection	Royal Azure Collection\nDesign Style	Royal / Traditional\nFrame Material	Wood (confirm exact type)\nFrame Finish	Antique Gold\nUpholstery Colour	Turquoise / Sky Blue\nUpholstery Material	Premium Fabric (confirm)\nCushion Fabric	Decorative Patterned Fabric\nBackrest Design	Royal Carved Backrest\nArmrest Design	Curved Ornamental Armrests',NULL,NULL,0.00,NULL,NULL,0,0,'[]','[]',1,0,0,0,0,0,NULL,NULL,0.00,0,6,0,'Royal Azure Blue & Gold Sofa Set | Luxury Carved Wooden Furniture',NULL,'2026-11-05 07:51:22','2026-11-07 06:33:14',NULL),(22,NULL,1,9,NULL,'Royal Noir Gold Carved Luxury Loveseat Sofa','royal-noir-gold-carved-luxury-loveseat-sofa','1','Add a touch of royal sophistication to your home with this Royal Noir Gold Carved Loveseat Sofa. Featuring an elegant black tufted backrest, luxurious floral-patterned seating, an intricately carved antique gold frame, and beautifully curved armrests, this sofa is a perfect combination of traditional craftsmanship and timeless luxury.','<p>Introduce timeless elegance and royal charm into your living space with the Royal Noir Gold Carved Luxury Loveseat Sofa. Inspired by classic palace-style furniture, this exquisite two-seater sofa showcases an artistic combination of black upholstery, decorative floral fabric, and detailed golden woodwork.</p><p>The beautifully designed high backrest features diamond-pattern button tufting, creating a luxurious and comfortable seating experience. Its ornate antique gold frame is enhanced with intricate floral carvings, decorative crown detailing, and elegantly curved armrests.</p><p>The contrasting floral-patterned seat cushions and matching decorative pillows add warmth and sophistication to the overall design. The gracefully sculpted legs and ornamental front detailing further enhance its royal appearance.</p><p>Perfect for luxury living rooms, bedrooms, premium lounges, boutique hotels, and elegant reception areas, this loveseat makes a stunning statement piece.</p>','Specification	Details\nProduct Type	Luxury Loveseat Sofa\nSeating Capacity	2 Seater\nCollection	Royal Noir Collection\nDesign Style	Royal / Baroque / Traditional\nFrame Material	Wood (confirm exact type)\nFrame Finish	Antique Gold\nMain Upholstery Colour	Black\nSeat Upholstery	Floral Pattern\nUpholstery Material	Premium Fabric (confirm)\nBackrest Design	Diamond Button Tufted',NULL,NULL,0.00,NULL,NULL,0,0,'[]','[]',1,1,1,1,0,0,NULL,NULL,0.00,0,12,0,'Royal Noir Black & Gold Loveseat Sofa | Luxury Carved Furniture',NULL,'2026-11-05 07:55:45','2026-11-07 03:17:43',NULL),(23,NULL,1,9,NULL,'Royal Blush Pink Luxury Gold Carved L-Shaped Sofa Set','royal-blush-pink-luxury-gold-carved-l-shaped-sofa-set','12','Add elegance and royal charm to your home with this Royal Blush Pink L-Shaped Sofa Set. Featuring luxurious blush pink upholstery, an intricately carved champagne-gold wooden frame, diamond-button tufted backrests, and beautifully designed decorative cushions, this sofa set brings timeless sophistication and premium comfort to your living space.','<p>Experience the beauty of royal craftsmanship with the Royal Blush Pink Luxury L-Shaped Sofa Set. Designed to create a luxurious atmosphere, this stunning corner sofa combines elegant traditional detailing with soft, sophisticated colours.</p><p>The sofa features a beautifully sculpted wooden frame with an exquisite champagne-gold finish, complemented by premium blush pink upholstery. Its high diamond-button tufted backrest, ornate floral carvings, and gracefully curved armrests showcase exceptional royal-inspired craftsmanship.</p><p>The seating is finished with delicate floral-patterned fabric and a collection of matching pink, ivory, and decorative cushions, creating a beautiful balance of elegance and comfort.</p><p>The spacious L-shaped configuration offers generous seating for family gatherings and entertaining guests. The matching coffee table features an elegant ivory tabletop and decorative gold-finished legs, completing the luxurious arrangement.</p><p>Perfect for luxury villas, premium residences, elegant living rooms, hotels, and sophisticated lounge spaces.</p>','Specification	Details\nProduct Type	Luxury L-Shaped Sofa\nCollection	Royal Blush Collection\nDesign Style	Royal / Classic / Traditional\nConfiguration	L-Shaped Corner Sofa\nFrame Material	Wood (confirm exact type)\nFrame Finish	Champagne Gold\nMain Upholstery Colour	Blush Pink\nSecondary Colour	Ivory / Cream\nUpholstery Material	Premium Fabric (confirm)\nBackrest Design	Diamond Button Tufted\nSeat Design	Floral Pattern Upholstery\nArmrest Design	Curved Ornamental Armrests\nCushion Type	Decorative Plush Cushions\nCushion Colours	Pink, Ivory & Floral\nDecorative Detailing	Intricate Floral Wood Carvings',NULL,NULL,0.00,NULL,NULL,0,0,'[]','[]',1,0,0,0,0,0,NULL,NULL,0.00,0,1,0,'Royal Blush Pink Gold L-Shaped Sofa Set | Luxury Carved Furniture',NULL,'2026-11-05 07:59:16','2026-11-05 21:06:47',NULL),(24,NULL,NULL,8,NULL,'Royal Imperial Gold Carved Luxury Dining Table Set','royal-imperial-gold-carved-luxury-dining-table-set','120','Bring royal elegance to your dining space with this Royal Imperial Gold Carved Dining Table Set. Featuring an intricately carved golden wooden frame, luxurious cream upholstery, beautifully detailed high-back chairs, and an elegant marble-look tabletop, this dining set combines timeless craftsmanship with sophisticated style.','<p>Experience luxurious dining with the Royal Imperial Gold Carved Dining Table Set, designed to add grandeur and sophistication to your home.</p><p>This exquisite dining collection features a beautifully crafted rectangular dining table supported by intricately carved golden-finish legs and decorative apron detailing. The elegant cream-coloured tabletop is enhanced with subtle decorative patterns, creating a refined and luxurious appearance.</p><p>The matching dining chairs showcase magnificent ornamental carved backrests, premium cream upholstery, decorative detailing, and gracefully curved wooden legs. Their high-back design provides an elegant appearance while offering comfortable seating.</p><p>The combination of antique gold finishing and soft champagne upholstery makes this dining set a stunning centrepiece for luxury dining rooms, villas, premium residences, and grand interiors.</p><p>Perfect for family dining, special occasions, and entertaining guests in style.</p>','Product Type	Luxury Dining Table Set\nCollection	Royal Imperial Collection\nDesign Style	Royal / Classic / Traditional\nSeating Capacity	6 Seater (confirm)\nTable Shape	Rectangular\nTabletop Material	Marble / Marble-Look Finish (confirm)\nTable Frame	Wood (confirm exact type)\nFrame Finish	Antique Gold\nChair Upholstery	Cream / Champagne\n',NULL,NULL,0.00,NULL,NULL,0,0,'[]','[]',1,0,0,0,0,0,NULL,NULL,0.00,0,8,0,'Royal Imperial Gold Dining Table Set ',NULL,'2026-11-05 08:01:38','2026-11-07 06:27:14',NULL),(25,NULL,4,8,NULL,'Royal Heritage Gold & Black Luxury Dining Table Set','royal-heritage-gold-black-luxury-dining-table-set','134','Elevate your dining space with this Royal Heritage Gold & Black Dining Table Set. Featuring an elegant glass-top dining table, beautifully carved golden wooden frames, luxurious black upholstered chair backs, and decorative high-back detailing, this dining set brings timeless royal elegance and sophistication to your home','<p>Introduce grandeur and sophistication to your dining room with the Royal Heritage Gold &amp; Black Luxury Dining Table Set. Inspired by traditional royal furniture craftsmanship, this exquisite collection combines intricate wooden carvings with elegant upholstery and a contemporary glass tabletop.</p><p>The dining table features a beautifully polished golden wooden frame with a transparent glass top, creating a luxurious yet refined appearance. Its matching dining chairs showcase ornate crown-inspired backrests, intricate decorative carvings, and premium upholstery.</p><p>The front-facing chair backs feature rich black upholstery with elegant nailhead detailing, while the opposite side features beautiful floral-patterned fabric in soft champagne and beige tones. This contrasting design adds character and uniqueness to the collection.</p><p>The sculpted golden legs and decorative chair frames further enhance its royal appearance, making it an impressive centrepiece for luxury dining rooms, villas, premium residences, and hotels.</p>','Specification	Details\nProduct Type	Luxury Dining Table Set\nCollection	Royal Heritage Collection\nDesign Style	Royal / Traditional\nSeating Capacity	6 Seater (confirm)\nTable Shape	Rectangular\nTabletop Material	Transparent Glass\nTable Frame Material	Wood (confirm exact type)\nFrame Finish	Golden Polish\nChair Design	Ornamental High-Back\nChair Upholstery	Black & Champagne Flo',NULL,NULL,0.00,NULL,NULL,0,0,'[]','[]',1,1,1,1,0,0,NULL,NULL,0.00,0,10,0,'Royal Heritage Gold & Black 6 Seater Dining Table Set',NULL,'2026-11-05 08:03:46','2026-11-07 03:11:43',NULL),(26,NULL,NULL,9,NULL,'Royal Maharaja Champagne Gold Luxury Sofa Set','royal-maharaja-champagne-gold-luxury-sofa-set','14','Bring timeless royal elegance to your home with this Royal Maharaja Champagne Gold Sofa Set. Featuring luxurious mustard-gold tufted upholstery, intricate ornamental wooden carvings, elegant cream floral fabric, and beautifully designed matching armchairs, this sofa set offers a perfect blend of traditional craftsmanship, comfort, and sophistication.','<p>Experience luxury and royal craftsmanship with the Royal Maharaja Champagne Gold Sofa Set, designed to transform your living room into an elegant and welcoming space.</p><p>This stunning furniture collection features beautifully carved wooden frames with a rich champagne-gold finish, complemented by luxurious mustard-gold button-tufted backrests. The elegant rolled armrests, decorative crown-style backrests, and intricate floral carvings create a distinctive royal appearance.</p><p>The seating is upholstered in premium-looking cream and gold floral fabric, while the matching decorative cushions add an extra layer of elegance and comfort.</p><p>The coordinated collection includes matching sofas, single-seater armchairs, and a beautifully designed centre table, creating a complete luxury living room arrangement.</p><p>Ideal for luxury homes, villas, premium hotels, reception areas, and traditional interiors.</p>','Specification	Details\nProduct Type	Luxury Sofa Set\nCollection	Royal Maharaja Collection\nDesign Style	Royal / Traditional / Classic\nSofa Configuration	Multi-piece Sofa Set\nFrame Material	Wood (confirm exact type)\nFrame Finish	Champagne Gold\nMain Upholstery Colour	Mustard Gold\nSecondary Colour	Cream / Beige\nUpholstery Material	Premium Fabric (confirm)\nBackrest Design	Diamond Button Tufted',NULL,NULL,0.00,NULL,NULL,0,0,'[]','[]',1,1,0,0,0,0,NULL,NULL,0.00,0,2,0,'Royal Maharaja Champagne Gold Sofa Set | Luxury Classic Furniture',NULL,'2026-11-05 08:24:24','2026-11-06 03:16:23',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recently_viewed_products`
--

DROP TABLE IF EXISTS `recently_viewed_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recently_viewed_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint unsigned NOT NULL,
  `viewed_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recently_viewed_products_product_id_foreign` (`product_id`),
  KEY `recently_viewed_products_user_id_product_id_index` (`user_id`,`product_id`),
  KEY `recently_viewed_products_session_id_product_id_index` (`session_id`,`product_id`),
  CONSTRAINT `recently_viewed_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recently_viewed_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recently_viewed_products`
--

LOCK TABLES `recently_viewed_products` WRITE;
/*!40000 ALTER TABLE `recently_viewed_products` DISABLE KEYS */;
INSERT INTO `recently_viewed_products` VALUES (1,NULL,'i5Y9d6usN2xsIMARaJpZ6ba2z5wQvBiXsr5SDRZV',14,'2026-10-29 09:18:38'),(2,NULL,'i5Y9d6usN2xsIMARaJpZ6ba2z5wQvBiXsr5SDRZV',13,'2026-10-29 09:18:42'),(3,NULL,'TT9aZMVVdYbCqoPwp3QCsIzrAfa6Zy4sXsZEh33R',9,'2026-10-29 09:32:47'),(4,NULL,'TT9aZMVVdYbCqoPwp3QCsIzrAfa6Zy4sXsZEh33R',13,'2026-10-29 09:32:47'),(5,NULL,'TT9aZMVVdYbCqoPwp3QCsIzrAfa6Zy4sXsZEh33R',14,'2026-10-29 09:32:48'),(6,NULL,'TT9aZMVVdYbCqoPwp3QCsIzrAfa6Zy4sXsZEh33R',15,'2026-10-29 09:32:49'),(7,NULL,'TT9aZMVVdYbCqoPwp3QCsIzrAfa6Zy4sXsZEh33R',10,'2026-10-29 09:32:52'),(8,NULL,'TT9aZMVVdYbCqoPwp3QCsIzrAfa6Zy4sXsZEh33R',11,'2026-10-29 09:32:52'),(9,NULL,'k3PlfJmK7y2qsuESPoGzqtjBFDiSpOXXwh2IKnym',15,'2026-10-29 09:32:52'),(10,NULL,'k3PlfJmK7y2qsuESPoGzqtjBFDiSpOXXwh2IKnym',14,'2026-10-29 09:32:52'),(11,NULL,'k3PlfJmK7y2qsuESPoGzqtjBFDiSpOXXwh2IKnym',9,'2026-10-29 09:32:52'),(12,NULL,'k3PlfJmK7y2qsuESPoGzqtjBFDiSpOXXwh2IKnym',11,'2026-10-29 09:32:53'),(13,NULL,'k3PlfJmK7y2qsuESPoGzqtjBFDiSpOXXwh2IKnym',13,'2026-10-29 09:32:53'),(14,NULL,'TT9aZMVVdYbCqoPwp3QCsIzrAfa6Zy4sXsZEh33R',12,'2026-10-29 09:32:53'),(15,NULL,'k3PlfJmK7y2qsuESPoGzqtjBFDiSpOXXwh2IKnym',10,'2026-10-29 09:32:53'),(16,NULL,'k3PlfJmK7y2qsuESPoGzqtjBFDiSpOXXwh2IKnym',12,'2026-10-29 09:32:53'),(17,NULL,'dFHOfeEbLfW2HAaDwH14PmcSvH1WDpAAIvwWwMog',15,'2026-10-29 09:59:58'),(18,NULL,'UjFluwAeEVYeaC8Yy2kR2bkcrR0DHJuU9qIwAR3b',13,'2026-10-29 10:00:01'),(19,NULL,'QEoNLZWZzdLYAY61wVNMUyoSrdePRtrnP6UB1Tcx',10,'2026-10-29 10:00:34'),(20,NULL,'dE2e5HSdbbKBKM1Za4rt5hiSmo0mSo4rA116QvRI',14,'2026-10-29 10:00:52'),(21,NULL,'hpCUqDuYIVLaPbwQNs4gNkpbFj7VXs5HL6LZGjFb',11,'2026-10-29 10:02:10'),(22,NULL,'Dp9bbtRJJY4KkBLQo8t6j4lu8T7emmgybcjz7lYg',9,'2026-10-29 10:02:30'),(23,NULL,'0fxlhiaMlrhIktgJX6FOvPZTKqQ5Pm1kTqaE8mlE',12,'2026-10-29 10:03:24'),(24,NULL,'OID3nxbbQnM8aSEnno2VozmzsD8zzOfdX1ZPFl0c',10,'2026-10-29 10:40:21'),(25,NULL,'OID3nxbbQnM8aSEnno2VozmzsD8zzOfdX1ZPFl0c',13,'2026-10-29 10:40:22'),(26,NULL,'OID3nxbbQnM8aSEnno2VozmzsD8zzOfdX1ZPFl0c',9,'2026-10-29 10:40:23'),(27,NULL,'OID3nxbbQnM8aSEnno2VozmzsD8zzOfdX1ZPFl0c',15,'2026-10-29 10:40:23'),(28,NULL,'OID3nxbbQnM8aSEnno2VozmzsD8zzOfdX1ZPFl0c',11,'2026-10-29 10:40:24'),(29,NULL,'OID3nxbbQnM8aSEnno2VozmzsD8zzOfdX1ZPFl0c',14,'2026-10-29 10:40:25'),(30,NULL,'OID3nxbbQnM8aSEnno2VozmzsD8zzOfdX1ZPFl0c',12,'2026-10-29 10:40:26'),(31,NULL,'3lCCEbK4y2N8Yra6d5dHiLcCmEtFHwY1NLXeL6YA',15,'2026-10-29 12:27:31'),(32,NULL,'7EcwcHceujLHwYj2oI3lryNCv6ETYQuw7XSoxGcE',15,'2026-10-29 13:36:22'),(33,NULL,'gprIChoCRAlDqMaAe83waFtK80noG0Bb6kQzW5Zg',11,'2026-10-29 13:36:26'),(34,NULL,'Oe1mmrQvxhQ8Rt2YuEJa8BP5lS37cF1le6oVng6S',14,'2026-10-29 13:36:27'),(35,NULL,'vIftBaytiUVEzNndAT8fQoxIpNqZPK4lERM7sVSQ',13,'2026-10-29 13:36:27'),(36,NULL,'Z9uXikVBWIYD0CU9VgMvW51zAEAcKWmpXW5lQJ76',10,'2026-10-29 13:36:31'),(37,NULL,'IoILJV95ldraT0HLrqOwkFpd22jPSESG7JRNdEdx',9,'2026-10-29 13:36:34'),(38,NULL,'ny6cYNMVLP2L90gvBSFdUERBE1FqAAs24hfHNxD1',15,'2026-10-29 14:17:31'),(39,NULL,'rV9x0pdLcHkDiFxXpVdTGLF2xZaeq4P3rIgggTY8',9,'2026-10-29 18:56:01'),(40,NULL,'iduDRh2D6VYRxYIi3DGvpTk6a4qHqTH88MtBOcJ9',10,'2026-10-30 01:00:15'),(41,NULL,'K6Oe1lgTiyRronMcr6hxSOZxPmZWxeV4tR19xznE',9,'2026-10-30 07:06:01'),(42,NULL,'FcFDCL0JWQ3LBWro0Cq0S8HwSX5mKjYoSo6S1uhD',11,'2026-10-30 11:50:53'),(43,NULL,'FcFDCL0JWQ3LBWro0Cq0S8HwSX5mKjYoSo6S1uhD',15,'2026-10-30 11:50:54'),(44,NULL,'FcFDCL0JWQ3LBWro0Cq0S8HwSX5mKjYoSo6S1uhD',10,'2026-10-30 11:50:54'),(45,NULL,'FcFDCL0JWQ3LBWro0Cq0S8HwSX5mKjYoSo6S1uhD',13,'2026-10-30 11:50:55'),(46,NULL,'FcFDCL0JWQ3LBWro0Cq0S8HwSX5mKjYoSo6S1uhD',9,'2026-10-30 11:50:55'),(47,NULL,'FcFDCL0JWQ3LBWro0Cq0S8HwSX5mKjYoSo6S1uhD',14,'2026-10-30 11:50:55'),(48,NULL,'WJ2oPpg9did29FLxnhAudeB73RKvNko4yj4rp7Jv',14,'2026-10-30 17:36:03'),(49,NULL,'qH072N0T5GHgYy8xtTGH1kF6SVoCKBrv59X23hyg',11,'2026-10-30 21:00:32'),(50,NULL,'xZROosUnnPUwFRGW7U2mbpXLhh855BOC863wev05',15,'2026-11-01 03:32:10'),(51,NULL,'LORY4YPcDWtnnwhTGu3aV024cin9gwhQtgwZi1kb',11,'2026-11-01 04:17:53'),(52,NULL,'XuIs0n1EmMnd2RXznDhgDFDo3PbgqaMcxSPGvwb7',13,'2026-11-01 04:47:53'),(53,NULL,'2HRdhkrz1drSIgtfQqLWgUoW3T0v3j54cITt6E3a',9,'2026-11-01 05:00:17'),(54,NULL,'LodqtzDHg7vxP3GvxGgWuShEdEcvEooMLmrRKkPL',9,'2026-11-01 05:17:53'),(55,NULL,'JWZhnWnSlKyKmhhlHfeahOWeBVZ5ZZ79KF5ehfkJ',10,'2026-11-01 06:17:53'),(56,NULL,'P3HcDPdHSBmtS1rA22oMs2vDLX3yQrR2l9G6qWjG',13,'2026-11-01 07:07:43'),(57,NULL,'QgQOkp1T0XWldxLogZpIZx0HUxiIS7BvUnScGyMf',11,'2026-11-01 07:07:44'),(58,NULL,'encGGI6sJfyv6y76gDYlMAD1aA1pDEZz5T01rRjy',13,'2026-11-01 07:17:53'),(59,NULL,'aooT9YOgKF4AwnNlKheyw1dU9B6cNPmibwIMiQYb',14,'2026-11-01 07:47:53'),(60,NULL,'a1iuUt1cKmglqNGLr4hGrkkF24pZ2iOAV6B9V4JC',12,'2026-11-01 08:47:53'),(61,NULL,'adeZkbWWHhqaO0FE24sNsMNcApyf6nfkU9M3rsiA',14,'2026-11-01 09:17:53'),(62,NULL,'rf2GSdMMUb6o8sWkSo7CaZzoMsJM104UltJhMovW',16,'2026-11-01 11:12:02'),(63,NULL,'FffTKPWg37OHameaz8tnMeIeqG5Lti8nL642kiQe',15,'2026-11-01 13:20:58'),(64,NULL,'FffTKPWg37OHameaz8tnMeIeqG5Lti8nL642kiQe',10,'2026-11-01 13:34:36'),(65,NULL,'Qdoji2qeWmK1Mp7Xr18paIJzC2Ugz2nxOC8J3n0K',10,'2026-11-01 14:45:51'),(66,NULL,'DB4CDeUlkusU9E6otT1z42IgZTNFgM6RWutmFRW2',15,'2026-11-01 14:46:51'),(67,NULL,'Zi05QcX7tMyEVZLIe3tK68lcC13dP1ucFyjxOMal',13,'2026-11-01 18:15:51'),(68,NULL,'CxdwpHsqor340v3wJtx8zuBJ4YIXeV9Kj2VCm6mU',11,'2026-11-01 18:15:52'),(69,NULL,'87iwkXOVD4X6KT9MUHAdlTSWUYJgyCruDsTD1u5a',9,'2026-11-01 20:50:51'),(70,NULL,'eH18MWYOb9PlUeEV4oNwGJGJgL7QbEzMQ3LZc76K',11,'2026-11-01 20:50:55'),(71,NULL,'Jncm6vywwYU7s40pKeGoQ5rKlVYuQuVlBUgbI6u1',14,'2026-11-01 20:50:59'),(72,NULL,'77xwt2KVnm0yx0sYXj58tfaYKzjK8odF4VSI09QI',10,'2026-11-01 20:51:03'),(73,NULL,'UC3anKHwjDEvHm405dJAoiaCkScbFJdDex9WXCve',13,'2026-11-01 20:51:07'),(74,NULL,'jSWLFuZeKuCnqpf39LvJqMfzDVbmCu9cQfqcOacR',15,'2026-11-02 11:07:27'),(75,NULL,'hUvARIJpmpcsEqWmwMccfiRwjdFPKjuwH5pJM5yH',12,'2026-11-02 12:43:35'),(76,NULL,'hUvARIJpmpcsEqWmwMccfiRwjdFPKjuwH5pJM5yH',13,'2026-11-02 12:43:44'),(77,NULL,'rFt4gISyTcZ6cXKK69KuwPRagJNDqYMsXR2F9i7Z',9,'2026-11-03 01:16:13'),(78,NULL,'CKxrDIW6MbWvPE0pPrai9T3PYJZrjcse3v8uhamd',14,'2026-11-03 01:17:14'),(79,NULL,'MAUs8EKc7hX85DFcx2b8YwytZXLN2ckk3idpA56y',9,'2026-11-03 06:24:46'),(80,NULL,'DSPrqTyBiaDBiIMkZCikb2Epw5PuMVeyDTxPcU01',9,'2026-11-03 08:38:16'),(81,NULL,'VomWnPwdQRTq8bqRfUUnS1zUKoEVkNDGp3vupQHb',16,'2026-11-03 10:01:46'),(82,NULL,'WFturEwa5XnLXfqHqWZQUe9LVVkkh9Cv0tT7vLwO',10,'2026-11-03 12:52:49'),(83,NULL,'XfUWPmg6jejd7fyBUlVx014xAubuSBO6KnIV18Ky',13,'2026-11-03 13:46:11'),(84,NULL,'w3UFn21SXtalls8hyEuPyWmI19JU3YfSZ8lv3OBa',12,'2026-11-03 16:56:28'),(85,NULL,'RBaoqnkKwaQjoGB0AHAWx01bkA0TE42hspk9mkZ2',16,'2026-11-03 16:56:28'),(86,NULL,'XuDaHGEoOLNa7Qpsp6EGxG0S4fuyFizOi2Eds2uT',9,'2026-11-03 19:01:39'),(87,NULL,'hwGXp6reefx1bsFLduIiOFQQOvyzfXKh1vh79g70',14,'2026-11-03 21:01:02'),(88,NULL,'Y5bBNPALeRaauk7eWstPhbMijVG4nBOvPTgdl1Ap',10,'2026-11-03 21:03:24'),(89,NULL,'hv0t3xfH41ebFhlgJrhWs6lIBTwCUPGQODfH0mp8',13,'2026-11-03 21:11:56'),(90,NULL,'c7BcV9OtTnDXZ3uZCitgMnRUk0agnG2n0sLeGUCj',9,'2026-11-03 21:58:49'),(91,NULL,'T5ufpJ85buKQZch5mlHcJJV4mEmI5C2DbORVOf3h',13,'2026-11-04 04:08:51'),(92,NULL,'1s2Hb08cgiYXIT81H14cF7C3VOfjmlYL40Ajtk4V',15,'2026-11-04 05:33:24'),(93,NULL,'gBp1rk10gZTjKULXj9XDqBkwv8U6S7OwVgNeJRWB',10,'2026-11-04 11:59:57'),(94,NULL,'l09DBRfo7zEsbXRle48bqblgq9jIVlgdJrSZ1HOA',9,'2026-11-04 14:54:32'),(95,NULL,'ypdNJGvrNwtG8ayIWYo1TLyCItt1c5MLr9LgZzmA',12,'2026-11-04 22:24:46'),(96,NULL,'hVzjRjlheo2LgGNwiE1yj2PKdmvcuiYUVX5V7med',9,'2026-11-04 22:24:56'),(97,NULL,'7T6IxsD2Gy5YY26UZAQiuoqBCE9NMyyXGouSMpZv',15,'2026-11-04 22:25:05'),(98,NULL,'EcVi3BvLZsDaC8M2wtjYCa5uq5ChtqutpRdvl131',10,'2026-11-04 22:25:13'),(99,NULL,'JvHodzydhF4aHUzN7DWDfjNNuOFIuM4GGD0olkNs',14,'2026-11-04 22:25:21'),(100,NULL,'yrDeQrsxI26CKz56TBpnWzZJTKyfsEhRek1SCfNW',13,'2026-11-04 22:25:52'),(101,NULL,'EZ38P9tZyyDMq0rBlv2321b1ltkFYqUWxlRcAefX',16,'2026-11-04 23:24:03'),(102,NULL,'VfMjpm3rB80PrWOY8m0oxmByABJZXKcCswFy548Z',14,'2026-11-04 23:49:13'),(103,NULL,'KsdzkgDElA3uzf1OHUS2XuDMthShtfh61UklIVNV',9,'2026-11-04 23:49:13'),(104,NULL,'bi3kGT8KQ6S5y3Da6Zb03GYmcK6kXXjV5oXCNOnh',15,'2026-11-04 23:49:13'),(105,NULL,'iMmeQ9DkK2L86zu0mNlOCEGueeg92TBlySniHlzo',12,'2026-11-04 23:49:13'),(106,NULL,'kLz0pNufM4I5YpAWGghkxcWfFc3XFdQO3muUu6x5',10,'2026-11-04 23:49:14'),(107,NULL,'kLz0pNufM4I5YpAWGghkxcWfFc3XFdQO3muUu6x5',13,'2026-11-04 23:49:23'),(108,1,NULL,17,'2026-11-05 07:45:16'),(109,1,NULL,18,'2026-11-05 07:45:19'),(110,1,NULL,21,'2026-11-05 07:52:41'),(111,1,NULL,19,'2026-11-05 08:46:40'),(112,1,NULL,22,'2026-11-05 08:46:35'),(113,1,NULL,25,'2026-11-05 08:04:28'),(114,1,NULL,24,'2026-11-05 08:04:32'),(115,NULL,'14k5zMqDM1KC9xc4tfuddMV3qtLQOd52yo8tMcF1',21,'2026-11-05 08:57:52'),(116,NULL,'jUXN5rHienoi6gwUROU2FKXH8lGpPUXQlRf82PKS',25,'2026-11-05 09:22:17'),(117,NULL,'jUXN5rHienoi6gwUROU2FKXH8lGpPUXQlRf82PKS',17,'2026-11-05 09:22:45'),(118,NULL,'RbxwtJYw74HAQ9ysH01S03U5B9NF2xkV8d5d9los',24,'2026-11-05 09:27:56'),(119,NULL,'Pig2yeJddnL9no1PnT3uzh3IQcMWpOUnC5IvdRq8',25,'2026-11-05 09:27:56'),(120,NULL,'3yDRjnA6Wy67gZpjtMENJf0At7uSD5PXOtHdPR2w',22,'2026-11-05 10:41:56'),(121,NULL,'NUXHageX57npEQb8APEAj0s6TM0U8AEzBr0yeffb',19,'2026-11-05 11:04:34'),(122,NULL,'NUXHageX57npEQb8APEAj0s6TM0U8AEzBr0yeffb',18,'2026-11-05 11:04:25'),(123,NULL,'NUXHageX57npEQb8APEAj0s6TM0U8AEzBr0yeffb',17,'2026-11-05 11:04:36'),(124,NULL,'NGdWjvxyGPOhW97vIc8nkGqnvkjNfMkBnfBGxWdt',25,'2026-11-05 11:27:07'),(125,NULL,'pEaVePhdpmCZFRgnp59JN3cpgz9FhFweRIEKAnQg',24,'2026-11-05 11:27:08'),(126,NULL,'HrFnd6ph78aCvOmxPOOKKwhM0Enix356QCS9bpxf',22,'2026-11-05 11:27:08'),(127,NULL,'xti68gCx1McZLU5Fjnl5Gh5YLR6ii9u6OKL3opyF',22,'2026-11-05 12:44:12'),(128,NULL,'WfdRFjR8ACmL9jO29P0CBFaGIhFHi7RLJsYSuVo7',18,'2026-11-05 15:27:52'),(129,NULL,'g1s2Uc602gyer7QLoN1t0St878g6t1ReQuj2BMKv',19,'2026-11-05 15:27:52'),(130,NULL,'9Wb49326Z3wmjtyrYjvzZGyi2FzcFgm0AxumYDpS',25,'2026-11-05 15:27:59'),(131,NULL,'qm8p1SH9eK2NaSRmXaVHrOJI0tKrsgOkeOQPp6X1',22,'2026-11-05 15:28:00'),(132,NULL,'CT2Qm6PLMts3IzhRh00Rj0wlMI2eIDxrvkla9790',25,'2026-11-05 21:00:08'),(133,NULL,'4Z5FNaPwNpLVUybutvF4cr0zJbrAr6WfhIVp0pol',24,'2026-11-05 21:00:08'),(134,NULL,'o6mxtPRUAbPOKt8XfcJkB6cfAtJBEvIV6XcICHxI',22,'2026-11-05 21:00:09'),(135,NULL,'6rAUwk4YVhDcoBI6VuOZ2crGFdZRoGfBoEE6z8Kf',23,'2026-11-05 21:06:47'),(136,NULL,'MtW6wi9cBnJHtQ005R2Vpt5QqhPrBJACrwnfZYFt',21,'2026-11-05 21:22:56'),(137,NULL,'YfWEZx5EX0PdvROCpnF9pTJxghUED5sXLOLbrKpx',26,'2026-11-05 22:02:43'),(138,NULL,'dW5FhLbSPMz2QQTqeegaUxhFERXzmcjlOkO5I1Cy',20,'2026-11-06 03:10:51'),(139,NULL,'WlAjRAnyllT7U5lVRKb5pB4c0L1pCfbb3WCZ45T3',26,'2026-11-06 03:16:23'),(140,NULL,'qOoXhy0Qr5gxvUZADMVGM98pIECj56KNUxAUHQ3F',17,'2026-11-06 03:21:50'),(141,NULL,'Vw3j6WzrgjY4yS4Q52w2mlHVq4ayPSl1skDuEPRd',24,'2026-11-06 03:27:12'),(142,NULL,'W4dOTnJKoupyCps7gYqoufejDa7hA2uDQ6fqHuYR',21,'2026-11-06 03:34:03'),(143,NULL,'im29VN8mlceLYSpVU3hpPd1WR0DG5GNML9yzqo0s',18,'2026-11-06 03:44:47'),(144,NULL,'ic1VqquoQbHSfltKiPsFAdC5MoNvDRXMki7vQZJW',22,'2026-11-06 03:55:31'),(145,NULL,'JKiP3DA2199QVcSL3tRMOeopFWo5Rr84l4z1kVME',19,'2026-11-06 04:17:00'),(146,NULL,'riBeqv2319UyyX9f3a8eBjY7VXoWINAco5qrSV9r',25,'2026-11-06 04:38:33'),(147,NULL,'HhYEupB8HrcEHYFc34HluNzJgTiM5RNwUJuYu8J7',22,'2026-11-06 13:40:35'),(148,NULL,'HhYEupB8HrcEHYFc34HluNzJgTiM5RNwUJuYu8J7',20,'2026-11-06 13:40:48'),(149,NULL,'HhYEupB8HrcEHYFc34HluNzJgTiM5RNwUJuYu8J7',24,'2026-11-06 13:40:58'),(150,NULL,'2Otnhqw2vhsUUtWmZhJHF5bK6AjflmwqYXu7R9lH',24,'2026-11-06 14:46:54'),(151,NULL,'DvNGUsFQlfETU8Cq6TBHPxqguVz6jtp0dmJv9WHp',22,'2026-11-06 21:12:46'),(152,NULL,'l5p24iMcgtoVhe1210UIaYIhNq74T6cS6EHcAyzU',18,'2026-11-06 21:13:09'),(153,NULL,'pkCOvdBYHJo0o2CqZgusGy2Q6SXkSoa1E3gNhDkM',19,'2026-11-06 21:13:32'),(154,NULL,'8o726NmjV5rewMqpS4E7TAvQ0ogccq8DAU3IE7Vx',25,'2026-11-06 21:13:55'),(155,NULL,'1Cl3MNgbD5zr4GGyUWOr5oKGZ82fW8pV3JSGibZA',20,'2026-11-07 01:02:40'),(156,NULL,'uAnhRLEzgmVyqiLhVGaQopV7lTAWfQ04UqFRFWKZ',17,'2026-11-07 01:03:18'),(157,NULL,'fm5hMVMUZCwcb8oSkKNcyqCkNmmTa61KyI7et6bm',21,'2026-11-07 01:03:56'),(158,NULL,'zHU2tPqSw9xQODTLpEGc0R6sijxmYr6TmY0tKNM2',25,'2026-11-07 03:11:43'),(159,NULL,'sItJanJVGRcygLmRHzyFsIbvd9xZkAgWyWB6Kjmm',22,'2026-11-07 03:17:43'),(160,NULL,'A0K3iLzTP4NBEm5vTCz8somuKgENA4gDdyQl4DIx',19,'2026-11-07 03:29:43'),(161,NULL,'BClsjGfAK8TbEcplUcBrqhMwNuVQzuSBv7Z9z0fS',18,'2026-11-07 03:35:43'),(162,NULL,'1EkGQAuDDLLkLFuSITjpO7hgJrvzfXZlgeHYAI8k',17,'2026-11-07 06:15:14'),(163,NULL,'yN7LPn0F3bE6iC2a7k5Z7EgVOhwwqdkG37CTEDzB',20,'2026-11-07 06:21:14'),(164,NULL,'DkY9xQyZ8Pk6Mw0WPWnIJrQY4Aj6IGdiiiusQrj0',24,'2026-11-07 06:27:14'),(165,NULL,'Ea25uqDX4t5HsNl9o57Rwskki5LWbicR3cy339ZM',21,'2026-11-07 06:33:14');
/*!40000 ALTER TABLE `recently_viewed_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_requests`
--

DROP TABLE IF EXISTS `return_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `return_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `refund_amount` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `return_requests_order_id_foreign` (`order_id`),
  KEY `return_requests_user_id_foreign` (`user_id`),
  CONSTRAINT `return_requests_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `return_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_requests`
--

LOCK TABLES `return_requests` WRITE;
/*!40000 ALTER TABLE `return_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `return_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `rating` tinyint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_product_id_foreign` (`product_id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  KEY `reviews_order_id_foreign` (`order_id`),
  CONSTRAINT `reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward_point_transactions`
--

DROP TABLE IF EXISTS `reward_point_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reward_point_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `points` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reward_point_transactions_user_id_foreign` (`user_id`),
  KEY `reward_point_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `reward_point_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `reward_point_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward_point_transactions`
--

LOCK TABLES `reward_point_transactions` WRITE;
/*!40000 ALTER TABLE `reward_point_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward_point_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'super_admin','web','2026-10-29 09:15:32','2026-10-29 09:15:32'),(2,'admin','web','2026-10-29 09:15:32','2026-10-29 09:15:32'),(3,'staff','web','2026-10-29 09:15:32','2026-10-29 09:15:32'),(4,'customer','web','2026-10-29 09:15:32','2026-10-29 09:15:32');
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
INSERT INTO `sessions` VALUES ('0xmeAidYM2tz5hDSvoF0WU3R7fleuG1al8yWsxPr',NULL,'173.252.70.17','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUdmeXZPNnppblJLV21Vb0JZN2Z5MnBpOTFCbkhxNkFPNHhBQ3c5TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794035397),('1Cl3MNgbD5zr4GGyUWOr5oKGZ82fW8pV3JSGibZA',NULL,'176.20.219.145','Mozilla/5.0 (compatible; ExaSearchBot/1.0; +https://crawler.exa.ai/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUJJWXM4clp4eG85OFpCdW5raThqa2RrTTV6cVQydkloMENxdnhvNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTM6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLWltcGVyaWFsLWx1eHVyeS1nb2xkLWNhcnZlZC1sLXNoYXBlZC1zb2ZhLXNldCI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794013360),('1eGuVU1IOM7Zz3j44U1l4UWyxTrrblnyYPmyg2QI',NULL,'66.249.65.198','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.52 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlA4cG5SRkdvN2lGRG5WSGxMVVZid2UzSmJuMGl0NFlGQVhQQVN6OSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL2Jlc3Bva2UtZGVzaWduZXItaW5zcGlyZWQtZmFicmljLWNoZXN0ZXJmaWVsZC1zb2ZhIjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794027584),('1EkGQAuDDLLkLFuSITjpO7hgJrvzfXZlgeHYAI8k',NULL,'51.89.39.49','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTldiZEFZbFRqRXZnZkdYaEdVWnR5NVRLVExWQThsVHJHajNNVm5adiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTY6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLXZpY3Rvcmlhbi1jaGVzdGVyZmllbGQtd2luZ2JhY2stbGVhdGhlci1hcm1jaGFpciI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794032114),('22sbWY44Z4daQLOzxTClaDbW7yfnMKOMMyrH4aDU',NULL,'176.20.219.154','Mozilla/5.0 (compatible; ExaSearchBot/1.0; +https://crawler.exa.ai/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTRQZzBmRjRFVDUyRGdSMUgyN0ZjeFdyYU5nemNxVUtubG1xM0tjVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794022295),('3xC0mhvfN3KO2Tre7cVn0Vl7l83hpiMiFl7HsgoQ',NULL,'72.1.134.9','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.3','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjM4MlNST1lxTjdkUG5uQk44VUNIMzFBM0owbnRYckdHTEhPcWVZVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20vc2hvcD9zb3J0PW5ld2VzdCI7czo1OiJyb3V0ZSI7czo0OiJzaG9wIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794013004),('4VrI6LeXxHdjZgQUddXdvJ2LOow7LYOIZ5xNHle2',NULL,'69.33.112.73','Mozilla/5.0 (iPhone; CPU iPhone OS 18_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 Mobile/15E148 Safari/604.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1ZmaFFLVk1hV0dBQndnQTJ1RzBoa1RkdzQwczZad0RKZzFWMXJQbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794036205),('6Gx2rfj3GRWYfzXSMaQdXBct0z4o55FESSD6nbF6',NULL,'216.73.217.93','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGQzNHlicWtDRVlVWUtTb2FnRFZPTGF2ZU9CUkdNaGtvbG96enBCTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794047098),('80AzOViLv4blDLrXix4R5WyT2tZf9ahc67dinow8',NULL,'216.73.216.164','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoicGt6b1Y0SUNHS3IxbmVjZmxCdUFrZXNrWGN1dExKVzF0S2ZDQTd2RyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794036144),('8o726NmjV5rewMqpS4E7TAvQ0ogccq8DAU3IE7Vx',NULL,'176.20.219.152','Mozilla/5.0 (compatible; ExaSearchBot/1.0; +https://crawler.exa.ai/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzZyR2I0dDI4cG1JVnVPVXRFSFdBTXRHbk5HTEVCdU1ZczNHYXRPbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTE6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLWhlcml0YWdlLWdvbGQtYmxhY2stbHV4dXJ5LWRpbmluZy10YWJsZS1zZXQiO3M6NToicm91dGUiO3M6MTM6InByb2R1Y3RzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1793999635),('9gYuaC7UFsftYewMaUsWFG8jXINrupLQHcxAv2rP',NULL,'216.73.217.93','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXhqWHFnR1VjNVp1WDQ4OGZmMDhVUFBpeEI0ZWdCemUySFNrSkE2NCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794039763),('9SBVoMBbfAxRmrYn0II4PwWVa4ps4tkclaTOABpB',NULL,'216.73.217.93','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWxRYndyRm54aDRTcENROGZZOUZmOVZEck1iUFBoTktTdWpUa2xYQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794050577),('9zf4x5dpkDPAt7OrxP3tJ9qnIgWsvRecriQfBLnx',NULL,'216.73.217.93','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUhNN2d4M2htMXBpRHVlODhhWnhGQ3diNnB2SDBmSVNJY05td0tzVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794051428),('A0K3iLzTP4NBEm5vTCz8somuKgENA4gDdyQl4DIx',NULL,'51.89.71.156','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoic3pJd0dCelY0bklITFpUeUZnalZHYXBMbTFYQ0lBUHBEUjEyRjJGTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLW1haGFyYWphLWx1eHVyeS1nb2xkLWNhcnZlZC1zb2ZhLXNldCI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794022183),('ATyRPwBT4tMzThZMHLFnffsCbOYY1H9Of8hXsOxx',NULL,'57.141.20.25','Instagram 453.0.0.57.79 Android (36/16; 440dpi; 1080x2392; vivo; V2511; V2511; qcom; en_US; 1100805543)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTdvNnpOb2lKVklzWnFqbHdyR1kyU09sQkZ6QjNtVDlOYU9nN3FhTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTg4OiJodHRwczovL3d3dy5tc2Z1cm5pdHVyZXdvcmxkLmNvbS8/ZmJjbGlkPUl3WlhoMGJnTmhaVzBDTVRFQWNHUnZaZ1J6Y25SakJtRndjRjlwWkF3eU5UWXlPREV3TkRBMU5UZ0FBUjhXTDJGcU51ZzJfaVpkeUZSNEsxbXBrbGpfR0pfUTZDNFdsSE80Z21MRy1aMjA5b3ZEMDJyam96dTY2QV9hZW1faUN1NkpRODdMNWY2clBoRUY5TnZiZyI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794035400),('BClsjGfAK8TbEcplUcBrqhMwNuVQzuSBv7Z9z0fS',NULL,'51.89.83.57','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWNMc2dFMW5NdzBDYkNwbFo1eHNlamRzc3FLVkxNaVJTdnpXWDJLeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLWNoZXN0ZXJmaWVsZC1sdXh1cnktbGVhdGhlci1zb2ZhLXNldCI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794022543),('BiVzigHUQoQCleBOCtkzK82lY3fuVjri1TvK5gL5',NULL,'173.252.87.5','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVpDT2FkTDVMZERkaVJ5YmQxVFNWR2xaSFBqZlhDcGd2SjJ1a3hFViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTg4OiJodHRwczovL3d3dy5tc2Z1cm5pdHVyZXdvcmxkLmNvbS8/ZmJjbGlkPUl3WlhoMGJnTmhaVzBDTVRFQWNHUnZaZ1J6Y25SakJtRndjRjlwWkF3eU5UWXlPREV3TkRBMU5UZ0FBUjlTRDh2UnRWd1FmZWdLek04T3NSU0VmbWUxYXBMSEpIbE5KUXZEZmFKejZTVV9LRWszOWxHdEUySE5mUV9hZW1fajZWWFlfaWVLdF94ejduT0N1d1o4QSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794035436),('cUB0hNn9Oqt8ixDV8I0e9oMYesTqBnUmn7XuHrZV',NULL,'66.249.65.199','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.52 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiamlNZnRJbk9YaDc3T2hrR0l2U0E4VlZEc1JrdEpIRDU1U0VNSlBLUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794009622),('D0abFTGKBBEkRaUc54qf5jVP73iTYXvC5BBa8Zwo',NULL,'80.193.19.84','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkVncFJwdEMwaklDaXlMUnBSUzNSWWE1MlhLN3FqOGFNdFpyTFNUWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDk6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Nob3A/c29ydD1uZXdlc3QiO3M6NToicm91dGUiO3M6NDoic2hvcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794003777),('DkY9xQyZ8Pk6Mw0WPWnIJrQY4Aj6IGdiiiusQrj0',NULL,'51.89.69.102','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkFmN0tHbHR5alpadVlua1dHWmxTSndBSWo4TTExdHdwOUg1TkxiSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLWltcGVyaWFsLWdvbGQtY2FydmVkLWx1eHVyeS1kaW5pbmctdGFibGUtc2V0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794032834),('DMDfNxX9Z3PtSbHaMHGPYz5Acqo9yLgLLY2XGtjh',NULL,'51.89.83.57','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoieGt4V2lOQ0hzVGU3R1o0eFFKaGVNZW80RXNBemtvVEM1NFdpdHVMViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794020266),('dqP5Q7FDci0Fkctogab6oiax4tDwcaneVVVLy8Up',NULL,'20.191.45.212','DuckDuckBot/1.1; (+http://duckduckgo.com/duckduckbot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoidGh1UkNWa0pEUlFXOXBXbGkwM2VsYUoxM1ZrWUExWmpFRDJyOUtCViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794055886),('DvNGUsFQlfETU8Cq6TBHPxqguVz6jtp0dmJv9WHp',NULL,'176.20.219.144','Mozilla/5.0 (compatible; ExaSearchBot/1.0; +https://crawler.exa.ai/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZml3TURZeE9tWERlOVdReFV5Q1NhVG1mR2VqQVExckVBdkJMT24wcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODU6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLW5vaXItZ29sZC1jYXJ2ZWQtbHV4dXJ5LWxvdmVzZWF0LXNvZmEiO3M6NToicm91dGUiO3M6MTM6InByb2R1Y3RzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1793999566),('Ea25uqDX4t5HsNl9o57Rwskki5LWbicR3cy339ZM',NULL,'51.89.39.62','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGJuelltVFluVUIzU1hLY2N4VXZMOWRZMUVpcmVLa1loWjU3Y3ZGSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODY6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLWF6dXJlLWJsdWUtZ29sZC1jYXJ2ZWQtbHV4dXJ5LXNvZmEtc2V0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794033194),('fcJFOMZb6g3YHYFR2EK1e54yEtiWy0pfU2IFb1Ei',NULL,'74.7.227.161','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.4; +https://openai.com/gptbot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoibW1hNk9tN1R3Z0JBN1dSMXFPNlQ2bFFqemFLTGRwYmpXRjMxN29wcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794052224),('fm5hMVMUZCwcb8oSkKNcyqCkNmmTa61KyI7et6bm',NULL,'176.20.219.147','Mozilla/5.0 (compatible; ExaSearchBot/1.0; +https://crawler.exa.ai/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiem94cjJRSVZlRFVRaUFia1VDVDVYYmNyaHppT2RMb0MxczNUSVU1diI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODY6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLWF6dXJlLWJsdWUtZ29sZC1jYXJ2ZWQtbHV4dXJ5LXNvZmEtc2V0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794013436),('FQavstqDVZ5TMxG1p9KEvYzW2O5XqAZ2Tw510V2v',NULL,'52.73.170.249','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVdjY0NmRUJuR1JINm1yR2FjR1hvaFJMallnZURWWUtNc0tRNHNaVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794018097),('fv2ZJhr0K2BkVDy0IYbm9sQf5FkAyvtLvaKegFZt',NULL,'147.235.219.148','TrendtrackProducts/2.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoianNIR1VFSEVUODllZmJEaVlJM3JHdmF6cFpBVTdTZjRROU94bEozMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794001804),('fxAplKCSnnj4Bk9TVxQdPzbXD5ZAuDkrBB5zeXzw',NULL,'86.97.82.86','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXRkQ0poaHRqSnpoa2xZVEx4RUtCNXZsTzc4VG9GRERVWmQ0YkowUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794003777),('GN6MQg4ZiwmNq1o89DbTHzqwVxcYhVu5sBivSgse',NULL,'216.73.217.93','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYk94bzh3QmNTcksybWZzajVPN2VWWVVadERlb3Zxa0hEc003RFIzbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794044335),('GWMP8rud2FV9daIWGzrX2yVIpT8Tmva45ePHU3s8',NULL,'216.73.217.93','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1ROTnFzYkR2M2JmTDZvZ0pkRWUxdHptQWUwYlRpTXFPem84dzlvMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794047937),('I50HSxlgYK3j2xCvqEx15uVt2eDCB1OWEmKzpaxn',NULL,'69.63.184.23','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiREFhdXpzVjA1dkQ1VFNnUTVSSjByaVZvSktOMzlWeHV5Y1BMUTJreiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794035397),('iVY19d9bX9dFkF61mcdks97LIw3Wn3GaJznRAiq7',NULL,'66.249.65.198','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.52 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGlVZnY2MlMySDUzcnE4NHB6NG1VSVI1UHFzM2liYzREUnFDMG53cyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODc6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3RoZS1rYXJhbi1hdWpsYS1zaWduYXR1cmUtbWFyYmxlLWNlbnRlci10YWJsZSI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794006349),('j4UgX1yHU87YYhfpca7lnx3Vq4nt28o5aP4dHLQI',NULL,'34.22.245.55','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicXF6Z2hPeHoyZklqQjVobkk3bnR5YUpaOXFBTWY5NzZKenZKYXUxcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794040636),('Jb4SR7Nt3qBq5j38KyxUfeD3dgtBG1i6RJYyzxU0',NULL,'173.252.82.12','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)','YTozOntzOjY6Il90b2tlbiI7czo0MDoieEQxV1VJUmltOWJWWVBWMzk4Qmc0TE8wT0JrcWxocjhXd2JnSm1ZQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794053391),('JdEN56IPk942Gd3OwcXGBS8C3Bnisyql0Xr4WyE6',NULL,'52.167.144.205','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieEFxanhFZWNid2ZHdnJwNGRhWU5JaFBEWmNNb3dYcjgweUN2WFhBZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794038429),('JXvNTD9V9Cx0QYD1gjLnb1sYGdUsQCuREBTeCO16',NULL,'180.153.236.134','User-Agent:Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0; 360Spider','YTozOntzOjY6Il90b2tlbiI7czo0MDoidGtxaVlqVkx5aFhtZ2FsWW96N2tNbG5HeVNUTms1c3p5bFYySERZMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794028348),('K5Y2uGf7pUWbKaIT5q0EJa8s0PDxWfVzwQ5hREBE',NULL,'40.77.167.36','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1dYU0VwNXpFU1hzZWJnSGMzTDVtTG1pekVZYm5ydHVzQkdaRzR2UiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL2ZhcSI7czo1OiJyb3V0ZSI7czozOiJmYXEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794041445),('kggeljUi9a3hlC7hPV2fdREalUWXooAHJlVNLo1z',NULL,'216.73.217.93','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUlkRVhrcVJrQXBVZFhZZ2FNMklMYTBxcDF3SmZIclZSQ2traXRDRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794040726),('Kre3UgUAzcP2Tptdq2fAK8R5n9dsaMy29Isws5mq',NULL,'34.66.226.125','Faraday v2.14.3','YToyOntzOjY6Il90b2tlbiI7czo0MDoiVlQ2R3E1ZmlsdmdXbFp5QmZNUzhMakVtYXQ0bWZwblE0VWlMRlZTeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794017236),('l1MtBv5tBA2WRpSZL4m0sYLBHYRKqsUFIcHynwQN',NULL,'191.250.189.128','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoibjlnT2FwOEw0d2hXb3JNZUNCQ0ZpbGpVWXI3bDZpbTFZbW5uYXVNUyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MToiaHR0cHM6Ly93d3cubXNmdXJuaXR1cmV3b3JsZC5jb20vd2lzaGxpc3QiO31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo0MToiaHR0cHM6Ly93d3cubXNmdXJuaXR1cmV3b3JsZC5jb20vd2lzaGxpc3QiO3M6NToicm91dGUiO3M6ODoid2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794003781),('l5p24iMcgtoVhe1210UIaYIhNq74T6cS6EHcAyzU',NULL,'176.20.219.150','Mozilla/5.0 (compatible; ExaSearchBot/1.0; +https://crawler.exa.ai/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoibFBjdkZTWmFMQkhnWmVJTm5rRGhhTk9kUVJkMldFZno4VDVCeFphMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLWNoZXN0ZXJmaWVsZC1sdXh1cnktbGVhdGhlci1zb2ZhLXNldCI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1793999589),('lh7sfmpA9F4AfGRSrK9DNrfiidCS3SR7UHHxjG8W',NULL,'42.1.70.100','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzlSTExPUkFWWmhIMnFUN1haQmoydnZlSXNFQkhHcDM1cmxqbVlNMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Nob3AiO3M6NToicm91dGUiO3M6NDoic2hvcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794003778),('lJewCLubV2mzN8U1mnwARmOP0kDSDk5PwdNGPAHU',NULL,'66.249.73.128','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoibVh3b0dzU0luMzQyMGtLT1dBWWZJMFhLZzBNV0hpNWN2Sm11QndweiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794036846),('lsXOOXyyrLbzgPMYQWnHW8F5PCPUWtACcrN1WXEY',NULL,'66.249.65.198','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.52 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzFJWXRoOHBLWUF0cldQSERyTkxhN2dWTTRZbjBGTzRMR3JSODk1UCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL2xvZ2luIjtzOjU6InJvdXRlIjtzOjU6ImxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1793995252),('M8LMgS7iGCJRZJUmYLFevwKMSJiFlvLY6uuTV7b5',NULL,'48.46.134.15','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVlPQllTdkFRdnd3Vkg2UnFvbzlTamlyOVNLV1hmUGFwWDZsbVFhaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1793999122),('mhAZOAMxnA0aB5SRddpMkzdBVUVmiSFkwZVsvAQB',NULL,'34.22.245.55','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0J5MEhUeDBidHNiRFU0T2R1a0s1Y2Y5YjRIc2JWOTM5aThyWVhnUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794028781),('MLSUoTWLpU53uj1AATAb784rwQtNPkUQnAn63Gy3',NULL,'34.22.245.55','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUs1cENHMmRlNlhqdEs4UTF0OHpqMXY0bDA1TnZVOTJybjZ3NjNuaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794055111),('msv0NdZUV7C0FRzDcD6pBl9rYmrZIlJCfJVYDeUA',NULL,'34.22.245.55','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidWxjdGNyckU4dVFaZWs5ZUZvcjhCREVncnJXbE9yZjF6Yk9Sd0lVaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1793994356),('mULvQUjBY4DkIkN0ld1DfTUyUAkXwe6407xlxU7Z',NULL,'173.252.82.113','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVZGUzBxSHJzQTZUaEJCcWQ0UVAyOUlQdjlrM2J3Smg1VEVpdDBiUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794035411),('MvolZNF8pNaaHZ3yttbAJ2Wmb4P5TyjtYoQ6DKoT',NULL,'51.89.74.205','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWVMNmVuYlBCWWlIQ0ZseW9VZTkydUFBblVoUlFvYXlhREIxRmNXciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794025324),('NM6lTmRSRIcRaNuvPsTK7kSJdJOtOLbNk7Ds8aiU',NULL,'18.209.83.254','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibmxreW5rRWhmc1NHaDdTRjVuVTV5NkdTYTV3dkNWS3BucDlKZ2FSZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794003905),('nOdxkMXVs5q8q5uDSh4GVzuK08JH7YyreCZjmQe8',NULL,'66.249.65.198','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.52 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTNUaFpjZGxGdFh6UmliZW84VjYweHhFNWdwdlFLTldIWG9iV3g3RiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODc6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3RoZS1rYXJhbi1hdWpsYS1zaWduYXR1cmUtbWFyYmxlLWNlbnRlci10YWJsZSI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794032023),('Ny4UiVLZcbpViMxyiA0PS6YRwuKFD0Xqa2kaOAL9',NULL,'216.73.217.93','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiREtteWJHbDZoQzRuTUZtZW9VVlBkbjNwUUY1ZlUzSWs3dWJOeVBmRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794054306),('oCGfaf4hI27lp8BLhzthYHEYGrmxPSTQSuhkFTzL',NULL,'91.99.91.169','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiamk4UE9SN0RMeWlXSnJFb3N4TlIwbTJPQk1RQXBYaEV5VFE2TmRxWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fX0=',1794024139),('oM9VMVez201FT74G7gdoOfQ1nSabFcX7SqsEr81h',NULL,'34.66.226.115','Faraday v2.14.3','YToyOntzOjY6Il90b2tlbiI7czo0MDoiODJXaW5ubFFMQVBmQWI1OHNydnpXbExuWWZESTQ1TWFsZWM2QzUzdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794038359),('oRRcnw1GN8HPPn5KTttH21ufso10vEaIwRIlCA6i',NULL,'18.209.83.254','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiblF0TUJhNjBwbnF2U2NUMVdRRkZFWVFmaHVzczVPS293aDU0dlZlTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794040091),('OxZ610YAN6yi1pSX4ecVT5SK2YnsD9LZks4Bip3J',NULL,'185.50.35.176','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVBSYk9xRlhzZUlGV1pIemQzZVJ0c1dIQk8zQ2xvdDJ0Z3RQR2N4cSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794003782),('P5ru5YsPDHKlKw1OYRTip2CKv2iaoz2JaTIlu4mo',NULL,'3.221.185.234','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0xRTmVpZ0NTOHRkWFFXcHVEOFFPcjhzRlc0b3hPaVFpdTJUMG5BMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL2NhbmUtbXMwMSI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794024207),('pkCOvdBYHJo0o2CqZgusGy2Q6SXkSoa1E3gNhDkM',NULL,'176.20.219.151','Mozilla/5.0 (compatible; ExaSearchBot/1.0; +https://crawler.exa.ai/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVV2d05OVENWZjdvMDg2amZyanlobmtLUk9zU1FpaldyZ2RIbXJrcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLW1haGFyYWphLWx1eHVyeS1nb2xkLWNhcnZlZC1zb2ZhLXNldCI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1793999612),('PKQkFg1aynLzRnEkEASPoojqP8MEmax7cW2y29YO',NULL,'123.192.238.166','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoid3l2UG5hR2oyVmVKdlAzRlNtbVpYTXp2dFIyRUtlRktIU0RxeWNWNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Nob3A/Y2F0ZWdvcnk9YmVkcm9vbSI7czo1OiJyb3V0ZSI7czo0OiJzaG9wIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794003777),('Pq91PEGvrmHUdmVHimIBcJRy3EhYKcGSZo3o4KMu',NULL,'173.252.87.16','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1pFZXN6c0V4c21SdUdra0pETzJxdmRoWnZxTXQyeU9rQ1RPS3pVcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTg4OiJodHRwczovL3d3dy5tc2Z1cm5pdHVyZXdvcmxkLmNvbS8/ZmJjbGlkPUl3WlhoMGJnTmhaVzBDTVRFQWNHUnZaZ1J6Y25SakJtRndjRjlwWkF3eU5UWXlPREV3TkRBMU5UZ0FBUjhXTDJGcU51ZzJfaVpkeUZSNEsxbXBrbGpfR0pfUTZDNFdsSE80Z21MRy1aMjA5b3ZEMDJyam96dTY2QV9hZW1faUN1NkpRODdMNWY2clBoRUY5TnZiZyI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794035435),('PTLU6HC7W9fUnnBjZZMBIRuHOaecAsfXlj7AYW3z',NULL,'66.249.65.198','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDMxa0NoeU9JTnVUd200Nmw3cHRBbWN0WnNQMGszdlZzaHUxMDdvNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTE6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL2Jlc3Bva2UtY2xhc3NpYy1jaGVzdGVyZmllbGQtZ2VudWluZS1sZWF0aGVyLXNvZmEiO3M6NToicm91dGUiO3M6MTM6InByb2R1Y3RzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794039876),('pXVDgBc1UrI3CcdX3yuKPUkLinBbpyt5hrTOWgJE',NULL,'66.249.65.198','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHE0VFh3QkxxMEdIR0o3UENVMDJaVDhkV2hKZ0pDaXdMeFhEbk01MSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL2Jlc3Bva2UtZGVzaWduZXItaW5zcGlyZWQtZmFicmljLWNoZXN0ZXJmaWVsZC1zb2ZhIjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794000690),('Q66clV6Z8FvgioN96BiG2fU6eqfmu5WvXCEmXA3N',NULL,'69.157.187.217','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoid2lFMEI1bHlHUjlsVk5oRDdudk9HYjNRS2NkTWc4aEM3TklWdmRHbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Nob3A/Y2F0ZWdvcnk9bGlnaHRpbmciO3M6NToicm91dGUiO3M6NDoic2hvcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794003778),('q6wQKldDr60LnjJ7MtpGEGiJwHhcw66I6JK08r5J',NULL,'38.132.233.126','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVdpaWhUTEI2UjMyVUtMZWQ0WTN0ZzZQTjR1S2RJcXRJdFJtcUMyVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1793999227),('qcqMFr8ADwIdsrtSRDl0x7eotcmeeWFHiJouDHUm',NULL,'35.170.47.41','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicWVuMXdHVnlSUGo2RHlTMG51TU51MUZFVTJvVVJJazYzQmlva3pZMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794022993),('qD8px9Ciy7m9eEqSlW6Ah2WWOFmT0TzQQNAbDyVb',NULL,'66.249.73.128','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSW54MlJscnN1aUpmQnc1Y1p2QUY0OTBPdWZ6N0ZycXZUUFVCQ2J1byI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794036832),('qWR7uL4oDvyI8vxe33l6ndjLBCNTFq1KMIkJig9Y',NULL,'178.40.152.67','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHo4cWV3VVdMYXVGMm1lQWh6YjRqdHBuWWtKeU5hOW5sYXNCV0NUSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL2xvZ2luIjtzOjU6InJvdXRlIjtzOjU6ImxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794003782),('Ro4H0hGVW1x0QPe9UNlSqhWAZO4ozgLYvxU8PGNF',NULL,'40.77.167.79','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnZXcGFUNHJ4cVpmTjM0d0Y3U1RYVXM2WXJCSFpRQkNMYTFQT1hBRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL2NvdmUtZGluaW5nLWNoYWlyIjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794017103),('roPV63eJz7xa1yF6q95fjf2xROuV2MENdYE2ayZP',NULL,'66.249.65.199','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.52 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGlwTThZOFNSOHA3dTJoNVBjb0RmRlFrYlBWaHZNTXdWVkE0RzdWNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL2Jlc3Bva2UtY2FydmVkLXRlYWstdHVmdGVkLWFjY2VudC1hcm1jaGFpciI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794031073),('RvmTPPftowx3NJXpuvjDTIEsBcKAjllN8SCrka7Q',NULL,'66.249.65.199','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.52 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUtrTWJTTThKNktqRUxLV2NSQnNxSVNvN1ZrYTczUmdwRGMyYkpxNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTEwOiJodHRwczovL3d3dy5tc2Z1cm5pdHVyZXdvcmxkLmNvbS9wcm9kdWN0cy90aGUta2FyYW4tYXVqbGEtc2lnbmF0dXJlLW1hcmJsZS1jZW50ZXItdGFibGU/dmFyaWFudD02MjU3MDQ3MTgxNzU4NyI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794016844),('ryCSy4hQ9W0FDq0uK225JJiLAzhj5vLlU4FisBsh',NULL,'177.226.74.226','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoibG43Rlo4blhyMHpmS2U1SG1wd2J1U1lCeHhaU2E3MVV4UjlpRkVmdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL2Jsb2ciO3M6NToicm91dGUiO3M6MTA6ImJsb2cuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794003778),('sdB5RpCkE4ib79G7NAEFr2JXJyxdbVevhdzHI2fX',NULL,'147.161.68.195','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzdEWXlTUHlqRklTMHB6cXIyd3hROXhqYnFlbEFGMGg1Unp0Z1R6YiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL2NhcnQiO3M6NToicm91dGUiO3M6NDoiY2FydCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794003788),('SgRueFpFbGV21A6jAPizSCOkIen94bD3jff8ROAK',NULL,'44.217.52.63','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWEydWhDZWRqa254UjlOR0liRmJMUjhWZTBzRThwemhlTFE5bHRhciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3R1Yi1jaGFpciI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794049635),('sItJanJVGRcygLmRHzyFsIbvd9xZkAgWyWB6Kjmm',NULL,'51.89.69.109','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUh5azZSY3RjSEI2M2RrWlhBYWp0alJ5b0tHTE44bGFqajJNbXdWTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODU6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLW5vaXItZ29sZC1jYXJ2ZWQtbHV4dXJ5LWxvdmVzZWF0LXNvZmEiO3M6NToicm91dGUiO3M6MTM6InByb2R1Y3RzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794021463),('svBX4HX1qxz81UJtFifGDX1nXSQPysNrRX0T3VV9',NULL,'66.249.65.197','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.52 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWw0N3RBMXFlZjFBV3RuS2JPY3p6cUt5UUlxallhYlVGdUpjRHFoWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTU6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3RoZS1rYXJhbi1hdWpsYS1zaWduYXR1cmUtY2FydmVkLWxlYXRoZXItYWNjZW50LWNoYWlyIjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794024214),('U0hP7DHHCSHIqU8a7UkoPvs8oOxXsmI4VqdjDcUv',NULL,'74.7.227.161','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.4; +https://openai.com/gptbot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHBVcktxeE45ZUl3RUpiSDJQZmROSnUxdExvY1RGekRXbGFDWVljTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794022205),('uAnhRLEzgmVyqiLhVGaQopV7lTAWfQ04UqFRFWKZ',NULL,'176.20.219.146','Mozilla/5.0 (compatible; ExaSearchBot/1.0; +https://crawler.exa.ai/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTVNVWowcEc4VW81RDBaMmtsYnRJdXRRZlM4d21wQnFFZDFUYWpJMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTY6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLXZpY3Rvcmlhbi1jaGVzdGVyZmllbGQtd2luZ2JhY2stbGVhdGhlci1hcm1jaGFpciI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794013398),('Ucbflx5y5goQFDLV6lQKtenoeSc8LYwg6k5z8AQE',NULL,'34.78.49.210','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzRpMnJZc3FBaW9uT0NyVHVHY3d3cWJRMTlKVzkyaVBKbU5tcTFsSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794007200),('VdS3s0I1oyaHvrBAksuMuSha0RrlGX4uERrwPbxu',NULL,'179.15.112.17','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDlRdU40QWh2bGlwdGRISFpTcndBWEhTcWFOanc3UFVnVnlaUHdaWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Nob3A/Y2F0ZWdvcnk9bGl2aW5nLXJvb20iO3M6NToicm91dGUiO3M6NDoic2hvcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794003785),('vEIurVTZ7APeUQLjL3xKZJBdHxaCtDSPBRZ3sRUR',NULL,'189.230.164.75','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:128.0) Gecko/20100101 Firefox/128.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjZhMG1nT0lFRjVUWE9DcE5RcUxWa1JIUTNzVHNUWU15YWpZbWZtOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794050285),('VINllQyBowKZ396T7oM60jS6821ZVQvsFySUAl49',NULL,'66.249.65.199','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.52 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoick9ndG5XUm1uR2ZVUUxzdGdZM29TcE1OUWlwTXFZRDlkSmxnRWp1UyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTE1OiJodHRwczovL3d3dy5tc2Z1cm5pdHVyZXdvcmxkLmNvbS9wcm9kdWN0cy9iZXNwb2tlLWRlc2lnbmVyLWluc3BpcmVkLWZhYnJpYy1jaGVzdGVyZmllbGQtc29mYT92YXJpYW50PTYyNTYwMjgwOTA0MDUxIjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794030956),('vZaPOIRgpgfL54DdMxSkieg1UylzL7S0B9zYuD37',NULL,'40.77.167.235','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2VKSFBvb1Nma3JkZGRXMXBXVnQwb3NLaFhaQ0p2Unpmb0tOYW1UNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794001464),('wPSabj1DhHGdxQDnHgPH3KhyznTSTJXYrZAbRRFl',NULL,'51.89.71.93','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0E1Unp6NExuZmkwTDB5MmhKd2tOYmVIU3hSNkRLN1hWUU5NRUh3ZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDk6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL2N1c3RvbS1mdXJuaXR1cmUiO3M6NToicm91dGUiO3M6MTY6ImN1c3RvbS1mdXJuaXR1cmUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794021823),('Xatv1FK8Qew6v46Kz3Wcnas37F0pXHA8EF6aoqaR',NULL,'181.67.109.112','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYk5vMnVSNUVvdzlPZHkzY3R6QTlmemQ0akJuZDJIU1FKZUFSMmlacCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTA6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Nob3A/c29ydD1wb3B1bGFyIjtzOjU6InJvdXRlIjtzOjQ6InNob3AiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794003785),('XKhsSMRccGq2ocDWU1HsrpuaJ2yXXSDUj4n6GLUd',NULL,'216.73.217.93','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoidHlNUjltbGdPMWZxUjRmR1JVSFNrQVdsRm5oakp4R3pCNEliQ2JDQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794058647),('xp0pk4e8dMr2rBHehyBU3yWzpLA5752JyZMcTXfD',NULL,'66.249.65.199','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.52 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoid1hRZTA3dGw2UUtFRWhiNjY5aGdVeW1EQmZpN005ejNFb1pUbm5iaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL2Zvcm1hLWJlZC1mcmFtZSI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794019303),('YlSCGBZpIHN6dEDYIy1Kt9JANSnXxUkEfell5nTm',NULL,'104.199.40.115','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1FwMUhITEVOVXM5M2VnVHZiak90OW5jOUxMb0VJZEZmbnJvb3VOSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794017662),('yN7LPn0F3bE6iC2a7k5Z7EgVOhwwqdkG37CTEDzB',NULL,'51.89.38.132','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWgxWlhNNjBxRHBka3FWVVlvS1dVWnQ4bUtkcVhQYmIxR3RFMDgzaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTM6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLWltcGVyaWFsLWx1eHVyeS1nb2xkLWNhcnZlZC1sLXNoYXBlZC1zb2ZhLXNldCI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794032474),('ysE2oar1k6PvqH9SuheZVxyQLqlb2dZj9eICQTnm',NULL,'216.73.217.93','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSm5XWnZoSHozQ0VjTHM0Y3l1YnE5OHl0RzBNbEdVSjFZajFjUExRcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3NpdGVtYXAueG1sIjtzOjU6InJvdXRlIjtzOjc6InNpdGVtYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794043249),('yUw6datfoJdAwhGJCbNYeJv3zQ8Xyz1B2cX1llOT',NULL,'176.20.219.143','Mozilla/5.0 (compatible; ExaSearchBot/1.0; +https://crawler.exa.ai/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoibHF6dnBQWlFjYkJQT1ZKeFFwSEdzTHlBMzJ0cGdCMUJWM2l0Z2Q1WSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDk6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL2N1c3RvbS1mdXJuaXR1cmUiO3M6NToicm91dGUiO3M6MTY6ImN1c3RvbS1mdXJuaXR1cmUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1793999543),('z1eFhgwvvDZIzrYplJWP2z6F4FuwXxvbpGYxfJh6',NULL,'91.242.149.205','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoic0tXbEZJOEJGSE10YmJvZXNuNVFWYlRrNE5ldnplS2N4cndNc2RiMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Nob3A/Y2F0ZWdvcnk9ZGluaW5nIjtzOjU6InJvdXRlIjtzOjQ6InNob3AiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794003779),('zEQgLYilJUbFk8IUREHCCNFtx2pmrcLq5oj1dvU9',NULL,'18.209.83.254','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzdFaWdsWTZtZEZ0UG16emRacWpnZWtyYWpaNkdoSXR5MVZLRXNabSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbXNmdXJuaXR1cmV3b3JsZC5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794035423),('ZgcNUflMl1jnQ8KHJx58QV9eF2Uufr4eoRKm08OB',NULL,'13.233.167.147','Instagram 453.0.0.57.79 Android (36/16; 440dpi; 1080x2392; vivo; V2511; V2511; qcom; en_US; 1100805543)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzl4dGNOQ1VWSzdOY2FUdXluNlJqT3NKcTlhZXJvaFJUcEVxSXJrQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTg4OiJodHRwczovL3d3dy5tc2Z1cm5pdHVyZXdvcmxkLmNvbS8/ZmJjbGlkPUl3WlhoMGJnTmhaVzBDTVRFQWNHUnZaZ1J6Y25SakJtRndjRjlwWkF3eU5UWXlPREV3TkRBMU5UZ0FBUjlTRDh2UnRWd1FmZWdLek04T3NSU0VmbWUxYXBMSEpIbE5KUXZEZmFKejZTVV9LRWszOWxHdEUySE5mUV9hZW1fajZWWFlfaWVLdF94ejduT0N1d1o4QSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1794035401),('zGSUI2ytoQ7IkNO9P6iTegv7AR5SGrzQ8gAa3BvH',NULL,'192.178.15.9','Mozilla/5.0 (X11; Linux x86_64; Storebot-Google/1.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTBtbWtPNXBmaHdPR1AycW05SklSMjJqb2xWRkVGdHJUNWNDQXR3bSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794041671),('zHU2tPqSw9xQODTLpEGc0R6sijxmYr6TmY0tKNM2',NULL,'51.89.38.130','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUhGMTk4ZDJtWG5FS2xidElLSk5seWR0Q3NFQXp3NWpXVm55TFZwcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTE6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL3JveWFsLWhlcml0YWdlLWdvbGQtYmxhY2stbHV4dXJ5LWRpbmluZy10YWJsZS1zZXQiO3M6NToicm91dGUiO3M6MTM6InByb2R1Y3RzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1794021103),('zNMnb8W0A50gNSjOTbXReYsq45oIEV1pkeIWc8Rt',NULL,'66.249.65.199','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVRscGpOVFFzTzV3ZnROUzBOUHBsdXZjMzFiSDF0OUlwYlBBb2JqSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODQ6Imh0dHBzOi8vd3d3Lm1zZnVybml0dXJld29ybGQuY29tL3Byb2R1Y3RzL2Jlc3Bva2UtY2FydmVkLXRlYWstdHVmdGVkLWFjY2VudC1hcm1jaGFpciI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1794031073);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'pages','about_content','NOIR Collective is a premium Australian streetwear brand born from underground culture and refined luxury.','text','2026-10-29 09:15:33','2026-10-29 09:15:33');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subcategories_slug_unique` (`slug`),
  KEY `subcategories_category_id_foreign` (`category_id`),
  CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` tinyint unsigned NOT NULL DEFAULT '5',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Alex M.','Verified Buyer','The quality is insane. Best streetwear brand in Australia hands down.',5,NULL,1,1,'2026-10-29 09:15:32','2026-10-29 09:15:32'),(2,'Jordan K.','Melbourne','Premium feel, fast shipping. The hoodie is my daily uniform now.',5,NULL,1,2,'2026-10-29 09:15:32','2026-10-29 09:15:32');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  `reward_points` int unsigned NOT NULL DEFAULT '0',
  `preferred_currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AUD',
  `preferred_locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dark',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `vendor_id` bigint unsigned DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_google_id_unique` (`google_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super Admin','admin@noircollective.com',NULL,'2026-10-29 09:15:32','$2y$12$E1R/7c7gzvaRmBCbFUrwTOOsyKAFr6e330KYykU.rCVSsqgcPIgW2','qhEU1Y5ZO6bkklPgxXrmF90mReha3PY9BFLTKyEs492VGmy9hqbNGFGCAJcO','2026-10-29 09:15:32','2026-10-29 09:15:32',NULL,NULL,0.00,0,'AUD','en','dark',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_transactions_user_id_foreign` (`user_id`),
  KEY `wallet_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `wallet_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `wallet_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wishlists_user_id_product_id_unique` (`user_id`,`product_id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'msfurniture'
--

--
-- Dumping routines for database 'msfurniture'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-07 13:56:48
