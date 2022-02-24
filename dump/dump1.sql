-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: db6
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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
-- Table structure for table `accounts_account`
--

DROP TABLE IF EXISTS `accounts_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superadmin` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account`
--

LOCK TABLES `accounts_account` WRITE;
/*!40000 ALTER TABLE `accounts_account` DISABLE KEYS */;
INSERT INTO `accounts_account` VALUES (19,'pbkdf2_sha256$320000$qysAgvOVHKJUC7Gnz1DjXC$8yc7LTlss7XArtoliYbXuWBhpfze4vlZqW0OYrcXWKc=','admin','developer','admin','admin@gmail.com','','2022-01-24 09:18:57.209264','2022-02-23 04:34:03.240559',1,1,1,1,1),(33,'pbkdf2_sha256$320000$TOO5WqJqHlYHG2wmWOkj0G$357pVwiEvVvri+J9pUrDWo01IYP0572g2AjnpubHyGE=','thushad','t','thush','thush@gmail.com','6282575520','2022-02-14 04:47:14.388027','2022-02-22 11:20:02.071088',0,0,1,0,0),(45,'pbkdf2_sha256$320000$YeM17gwPmBjvGSLjkSOB6c$3QFXOdf7lJGxB8toVjCZt17xpY3VstbnE11WXNhdLto=','arjun','v','arjun','arjun@gmail.com','8113849484','2022-02-16 05:55:31.018773','2022-02-21 05:46:20.076836',0,0,1,0,0),(46,'pbkdf2_sha256$320000$tIAHKIBD0JfUnaPWEew9yI$Cd/xFkjWB07icHCal5umtjDaAlJExVCJDHGUWCFeHyk=','lithin','cm','lithin','lithin@gmail.com','8078798842','2022-02-16 06:14:35.396025','2022-02-16 06:15:09.291596',0,0,1,0,0),(47,'pbkdf2_sha256$320000$fq4pbPdUx3iRf8XFWF7Sdl$x5KtJYDyw4cl0x+VvKPAzWxG85bNxk3LSMt3tV+Fy9k=','roshas','johson','roshas','roshas@gmail.com','7012598205','2022-02-16 06:16:02.928608','2022-02-16 17:20:30.781295',0,0,1,0,0),(48,'pbkdf2_sha256$320000$UTNTSJsIGyBAj6UnnXmnCA$i8Iqqj2aYymy2ovQHsR339Z0MoLdpiCBpV2iAfuzKOM=','achu','sunil','achu','achu@gmail.com','7012894462','2022-02-16 06:24:03.567727','2022-02-16 06:27:31.528539',0,0,1,0,0),(49,'pbkdf2_sha256$320000$4gRlPfyqxz3Wnh2oN4qhBa$hyfOnFfFmRYjAUrZR6AdB0A7qA2PRHcFKlZr5I5hCNk=','shiyas','mohammed','shiyas','shiyas@gmail.com','8157010445','2022-02-16 06:25:15.411459','2022-02-16 06:25:51.320232',0,0,1,0,0),(50,'pbkdf2_sha256$320000$Cf8tPiRqmnPmoyiEb1TiCT$RUNwjXiNEgXg7lOLfWiFKhCD0dubUsQ0ag6NiFyCoyk=','aswin','a','aswin','aswin@gmail.com','8129524358','2022-02-24 04:35:46.300454','2022-02-24 04:36:43.003113',0,0,1,0,0);
/*!40000 ALTER TABLE `accounts_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add account',6,'add_account'),(22,'Can change account',6,'change_account'),(23,'Can delete account',6,'delete_account'),(24,'Can view account',6,'view_account'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add product',8,'add_product'),(30,'Can change product',8,'change_product'),(31,'Can delete product',8,'delete_product'),(32,'Can view product',8,'view_product'),(33,'Can add product_image',9,'add_product_image'),(34,'Can change product_image',9,'change_product_image'),(35,'Can delete product_image',9,'delete_product_image'),(36,'Can view product_image',9,'view_product_image'),(37,'Can add cart',10,'add_cart'),(38,'Can change cart',10,'change_cart'),(39,'Can delete cart',10,'delete_cart'),(40,'Can view cart',10,'view_cart'),(41,'Can add cart item',11,'add_cartitem'),(42,'Can change cart item',11,'change_cartitem'),(43,'Can delete cart item',11,'delete_cartitem'),(44,'Can view cart item',11,'view_cartitem'),(45,'Can add variations',12,'add_variations'),(46,'Can change variations',12,'change_variations'),(47,'Can delete variations',12,'delete_variations'),(48,'Can view variations',12,'view_variations'),(49,'Can add Variations',12,'add_variation'),(50,'Can change Variations',12,'change_variation'),(51,'Can delete Variations',12,'delete_variation'),(52,'Can view Variations',12,'view_variation'),(53,'Can add banner',13,'add_banner'),(54,'Can change banner',13,'change_banner'),(55,'Can delete banner',13,'delete_banner'),(56,'Can view banner',13,'view_banner'),(57,'Can add banner',14,'add_banner'),(58,'Can change banner',14,'change_banner'),(59,'Can delete banner',14,'delete_banner'),(60,'Can view banner',14,'view_banner'),(61,'Can add sub category',15,'add_subcategory'),(62,'Can change sub category',15,'change_subcategory'),(63,'Can delete sub category',15,'delete_subcategory'),(64,'Can view sub category',15,'view_subcategory'),(65,'Can add order',16,'add_order'),(66,'Can change order',16,'change_order'),(67,'Can delete order',16,'delete_order'),(68,'Can view order',16,'view_order'),(69,'Can add payment',17,'add_payment'),(70,'Can change payment',17,'change_payment'),(71,'Can delete payment',17,'delete_payment'),(72,'Can view payment',17,'view_payment'),(73,'Can add order product',18,'add_orderproduct'),(74,'Can change order product',18,'change_orderproduct'),(75,'Can delete order product',18,'delete_orderproduct'),(76,'Can view order product',18,'view_orderproduct'),(77,'Can add address table',19,'add_addresstable'),(78,'Can change address table',19,'change_addresstable'),(79,'Can delete address table',19,'delete_addresstable'),(80,'Can view address table',19,'view_addresstable'),(81,'Can add wishlist',20,'add_wishlist'),(82,'Can change wishlist',20,'change_wishlist'),(83,'Can delete wishlist',20,'delete_wishlist'),(84,'Can view wishlist',20,'view_wishlist'),(85,'Can add coupon',21,'add_coupon'),(86,'Can change coupon',21,'change_coupon'),(87,'Can delete coupon',21,'delete_coupon'),(88,'Can view coupon',21,'view_coupon');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts_cart`
--

DROP TABLE IF EXISTS `carts_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_id` varchar(250) NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_cart`
--

LOCK TABLES `carts_cart` WRITE;
/*!40000 ALTER TABLE `carts_cart` DISABLE KEYS */;
INSERT INTO `carts_cart` VALUES (46,'fzomiht7q9je53t9jkcye9n3ey1rfzq0','2022-02-16'),(47,'svbj64outrojktswvxso5jora085o97x','2022-02-17'),(48,'o02wujzdh0vo4tdlmfp8xjqxs782tvxz','2022-02-19'),(49,'fqhdpnu8nl0zalcnmsbqekvnccihh73i','2022-02-21'),(50,'dphbaqd7dgmqujozot1ad8u5xn30i5kq','2022-02-21'),(51,'f4yb6o1knn8it9u8onxlg879qepc65l6','2022-02-21'),(52,'32kfd7uue0ygmyqfhi4cfhefb2ynvk0f','2022-02-21'),(53,'ya08wwoww49cxurz9h3wgopfu2g32qnp','2022-02-21'),(54,'2cejzj5o59ba3kpsla2l0beicg3426hj','2022-02-21'),(55,'fm9nof7qvolvs5ysmzleohp5umzmdg9r','2022-02-22');
/*!40000 ALTER TABLE `carts_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts_cartitem`
--

DROP TABLE IF EXISTS `carts_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_cartitem_cart_id_9cb0a756_fk_carts_cart_id` (`cart_id`),
  KEY `carts_cartitem_product_id_acd010e4_fk_store_product_id` (`product_id`),
  KEY `carts_cartitem_user_id_4d21e0d9_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `carts_cartitem_cart_id_9cb0a756_fk_carts_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `carts_cart` (`id`),
  CONSTRAINT `carts_cartitem_product_id_acd010e4_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  CONSTRAINT `carts_cartitem_user_id_4d21e0d9_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_cartitem`
--

LOCK TABLES `carts_cartitem` WRITE;
/*!40000 ALTER TABLE `carts_cartitem` DISABLE KEYS */;
INSERT INTO `carts_cartitem` VALUES (423,1,1,50,46,NULL),(440,1,1,55,49,NULL);
/*!40000 ALTER TABLE `carts_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts_cartitem_variations`
--

DROP TABLE IF EXISTS `carts_cartitem_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts_cartitem_variations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cartitem_id` bigint NOT NULL,
  `variation_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carts_cartitem_variations_cartitem_id_variation_id_5f8efaf5_uniq` (`cartitem_id`,`variation_id`),
  KEY `carts_cartitem_varia_variation_id_ef9f9ee3_fk_store_var` (`variation_id`),
  CONSTRAINT `carts_cartitem_varia_cartitem_id_8be23372_fk_carts_car` FOREIGN KEY (`cartitem_id`) REFERENCES `carts_cartitem` (`id`),
  CONSTRAINT `carts_cartitem_varia_variation_id_ef9f9ee3_fk_store_var` FOREIGN KEY (`variation_id`) REFERENCES `store_variation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=584 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_cartitem_variations`
--

LOCK TABLES `carts_cartitem_variations` WRITE;
/*!40000 ALTER TABLE `carts_cartitem_variations` DISABLE KEYS */;
INSERT INTO `carts_cartitem_variations` VALUES (481,423,38),(480,423,41),(515,440,47),(514,440,49);
/*!40000 ALTER TABLE `carts_cartitem_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_category`
--

DROP TABLE IF EXISTS `category_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `category_offer` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_category`
--

LOCK TABLES `category_category` WRITE;
/*!40000 ALTER TABLE `category_category` DISABLE KEYS */;
INSERT INTO `category_category` VALUES (28,'T-shirts','t-shirts','Men T-shirts',30),(30,'jeans','jeans','men jeans',0),(31,'Shirts','shirts','Men shirts',0);
/*!40000 ALTER TABLE `category_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_subcategory`
--

DROP TABLE IF EXISTS `category_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_subcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_subcategory_slug_b958053a_uniq` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_subcategory`
--

LOCK TABLES `category_subcategory` WRITE;
/*!40000 ALTER TABLE `category_subcategory` DISABLE KEYS */;
INSERT INTO `category_subcategory` VALUES (2,'Pepe Jeans','2022-02-09 07:06:33.606506','pepe-jeans'),(5,'Wrogan','2022-02-09 07:08:22.864373','wrogan'),(7,'Peter England','2022-02-09 07:08:50.836856','peter-england');
/*!40000 ALTER TABLE `category_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (47,'2022-01-24 09:19:29.577980','13','j@gmail.com',3,'',6,19),(48,'2022-01-24 09:19:45.126775','17','dev@gmail.com',3,'',6,19),(49,'2022-01-24 09:19:55.656768','1','thush@gmail.com',3,'',6,19),(50,'2022-01-24 09:21:29.717894','20','jacob@gmail.com',3,'',6,19),(51,'2022-01-24 09:26:52.025532','21','asus@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,19),(52,'2022-01-24 10:57:01.802950','18','thush@gmail.com',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',6,19),(53,'2022-01-24 18:08:07.085836','18','thush@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,19),(54,'2022-01-25 08:08:26.274780','21','asus@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,19),(55,'2022-01-26 16:05:05.867034','21','asus@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,19),(56,'2022-01-26 16:05:13.446091','18','thush@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,19),(57,'2022-01-26 17:43:21.209352','8','Hoodie',2,'[{\"changed\": {\"fields\": [\"Category name\", \"Slug\"]}}]',7,19),(58,'2022-01-26 17:43:55.151411','8','hoodies',2,'[{\"changed\": {\"fields\": [\"Category name\", \"Slug\"]}}]',7,19),(59,'2022-01-26 17:44:09.396640','7','Jackets',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,19),(60,'2022-01-26 17:44:29.691366','6','Shirts',2,'[{\"changed\": {\"fields\": [\"Category name\", \"Slug\"]}}]',7,19),(61,'2022-01-26 17:44:36.839220','7','Jackets',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,19),(62,'2022-01-26 17:44:51.851963','4','T-shirts',2,'[{\"changed\": {\"fields\": [\"Category name\", \"Slug\"]}}]',7,19),(63,'2022-01-26 17:44:54.964485','3','Jeans',2,'[]',7,19),(64,'2022-01-26 17:45:05.350298','8','Hoodies',2,'[{\"changed\": {\"fields\": [\"Category name\"]}}]',7,19),(65,'2022-01-26 18:25:18.357188','9','Jogger',3,'',7,19),(66,'2022-01-26 18:25:18.361524','8','Hoodies',3,'',7,19),(67,'2022-01-26 18:25:18.365279','7','Jackets',3,'',7,19),(68,'2022-01-26 18:25:18.367904','5','Pants',3,'',7,19),(69,'2022-01-26 20:04:48.201985','10','Lee Cooper Jeans',2,'[{\"changed\": {\"fields\": [\"Stock\"]}}]',8,19),(70,'2022-01-27 17:42:02.738053','18','thush@gmail.com',2,'[{\"changed\": {\"fields\": [\"First name\", \"Username\"]}}]',6,19),(71,'2022-01-27 17:43:24.388872','18','thush@gmail.com',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',6,19),(72,'2022-01-29 16:12:54.039163','16','men suits',1,'[{\"added\": {}}]',7,19),(73,'2022-01-29 16:16:24.584659','17','joggers',3,'',7,19),(74,'2022-01-30 19:38:42.601337','20','men navy t shirt',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',8,19),(75,'2022-02-01 15:33:39.272499','18','thush@gmail.com',3,'',6,19),(76,'2022-02-01 15:39:47.323666','27','thush@gmail.com',3,'',6,19),(77,'2022-02-02 12:16:50.884608','28','thush@gmaill.com',3,'',6,19),(78,'2022-02-04 17:52:12.874749','10','Lee Cooper Jeans',2,'[{\"changed\": {\"fields\": [\"Images\", \"Stock\"]}}]',8,19),(79,'2022-02-04 17:52:35.005054','10','Lee Cooper Jeans',2,'[{\"changed\": {\"fields\": [\"Images\", \"Images two\", \"Images three\"]}}]',8,19),(80,'2022-02-04 17:53:45.579705','10','Lee Cooper Jeans',2,'[{\"changed\": {\"fields\": [\"Stock\"]}}]',8,19),(81,'2022-02-04 17:54:14.499315','11','Slim Fit Blue Jeans',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',8,19),(82,'2022-02-04 17:56:36.786932','11','Slim Fit Blue Jeans',2,'[{\"changed\": {\"fields\": [\"Images\", \"Images two\", \"Images three\"]}}]',8,19),(83,'2022-02-05 05:03:38.380241','1','Variations object (1)',1,'[{\"added\": {}}]',12,19),(84,'2022-02-05 09:46:03.600164','2','Variation object (2)',1,'[{\"added\": {}}]',12,19),(85,'2022-02-05 09:46:19.569127','3','Variation object (3)',1,'[{\"added\": {}}]',12,19),(86,'2022-02-05 09:46:54.229046','4','Variation object (4)',1,'[{\"added\": {}}]',12,19),(87,'2022-02-05 09:47:05.934928','5','Variation object (5)',1,'[{\"added\": {}}]',12,19),(88,'2022-02-05 09:47:17.065890','6','Variation object (6)',1,'[{\"added\": {}}]',12,19),(89,'2022-02-05 09:47:27.889162','7','Variation object (7)',1,'[{\"added\": {}}]',12,19),(90,'2022-02-05 09:47:44.063741','8','Variation object (8)',1,'[{\"added\": {}}]',12,19),(91,'2022-02-05 09:47:52.928829','9','Variation object (9)',1,'[{\"added\": {}}]',12,19),(92,'2022-02-05 09:48:06.563115','10','Variation object (10)',1,'[{\"added\": {}}]',12,19),(93,'2022-02-05 09:50:08.406696','15','Graded Casual Shirt',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',8,19),(94,'2022-02-05 09:50:30.844375','15','Graded Casual Shirt',2,'[{\"changed\": {\"fields\": [\"Images\", \"Images two\", \"Images three\"]}}]',8,19),(95,'2022-02-05 09:51:39.187976','26','striped shirt',2,'[{\"changed\": {\"fields\": [\"Product name\", \"Slug\", \"Description\"]}}]',8,19),(96,'2022-02-05 09:52:04.560615','11','Variation object (11)',1,'[{\"added\": {}}]',12,19),(97,'2022-02-05 09:52:15.917143','12','Variation object (12)',1,'[{\"added\": {}}]',12,19),(98,'2022-02-05 10:05:07.276294','8','Variation object (8)',3,'',12,19),(99,'2022-02-05 11:15:13.372426','13','Variation object (13)',1,'[{\"added\": {}}]',12,19),(100,'2022-02-05 11:15:30.596846','14','Variation object (14)',1,'[{\"added\": {}}]',12,19),(101,'2022-02-05 11:15:39.984536','15','Variation object (15)',1,'[{\"added\": {}}]',12,19),(102,'2022-02-05 11:20:26.084828','16','Variation object (16)',1,'[{\"added\": {}}]',12,19),(103,'2022-02-05 11:20:39.300808','17','Variation object (17)',1,'[{\"added\": {}}]',12,19),(104,'2022-02-05 11:20:58.249060','18','Variation object (18)',1,'[{\"added\": {}}]',12,19),(105,'2022-02-05 11:21:24.458239','18','Variation object (18)',3,'',12,19),(106,'2022-02-05 11:21:24.462593','17','Variation object (17)',3,'',12,19),(107,'2022-02-05 11:21:24.464860','16','Variation object (16)',3,'',12,19),(108,'2022-02-05 11:21:38.498587','19','Variation object (19)',1,'[{\"added\": {}}]',12,19),(109,'2022-02-05 11:21:48.696326','20','Variation object (20)',1,'[{\"added\": {}}]',12,19),(110,'2022-02-05 11:21:57.594075','21','Variation object (21)',1,'[{\"added\": {}}]',12,19),(111,'2022-02-05 11:25:44.301813','22','Variation object (22)',1,'[{\"added\": {}}]',12,19),(112,'2022-02-05 11:25:59.485439','23','Variation object (23)',1,'[{\"added\": {}}]',12,19),(113,'2022-02-07 05:59:20.514336','76','CartItem object (76)',3,'',11,19),(114,'2022-02-07 09:50:48.426908','90','CartItem object (90)',3,'',11,19),(115,'2022-02-07 09:50:48.431128','87','CartItem object (87)',3,'',11,19),(116,'2022-02-07 09:50:48.433664','82','CartItem object (82)',3,'',11,19),(117,'2022-02-07 09:50:48.437245','78','CartItem object (78)',3,'',11,19),(118,'2022-02-07 09:50:48.440024','77','CartItem object (77)',3,'',11,19),(119,'2022-02-07 09:50:48.443398','75','CartItem object (75)',3,'',11,19),(120,'2022-02-07 09:50:48.447082','74','CartItem object (74)',3,'',11,19),(121,'2022-02-07 09:50:48.456976','15','CartItem object (15)',3,'',11,19),(122,'2022-02-07 09:50:48.460282','11','CartItem object (11)',3,'',11,19),(123,'2022-02-07 09:50:48.464786','10','CartItem object (10)',3,'',11,19),(124,'2022-02-07 09:50:48.467687','9','CartItem object (9)',3,'',11,19),(125,'2022-02-07 09:52:07.099394','91','CartItem object (91)',3,'',11,19),(126,'2022-02-07 11:43:43.173629','104','CartItem object (104)',3,'',11,19),(127,'2022-02-07 11:43:43.178038','103','CartItem object (103)',3,'',11,19),(128,'2022-02-07 11:43:43.181971','102','CartItem object (102)',3,'',11,19),(129,'2022-02-07 11:43:43.186254','100','CartItem object (100)',3,'',11,19),(130,'2022-02-07 11:43:43.190448','99','CartItem object (99)',3,'',11,19),(131,'2022-02-07 11:43:43.197699','98','CartItem object (98)',3,'',11,19),(132,'2022-02-07 12:00:11.367687','107','CartItem object (107)',3,'',11,19),(133,'2022-02-07 12:00:11.372754','106','CartItem object (106)',3,'',11,19),(134,'2022-02-07 12:00:11.375938','105','CartItem object (105)',3,'',11,19),(135,'2022-02-08 15:39:42.863785','1','Variation object (1)',1,'[{\"added\": {}}]',12,19),(136,'2022-02-08 17:41:03.757292','2','Variation object (2)',1,'[{\"added\": {}}]',12,19),(137,'2022-02-08 17:41:16.619011','3','Variation object (3)',1,'[{\"added\": {}}]',12,19),(138,'2022-02-09 03:24:12.964253','1','Banner Image1',1,'[{\"added\": {}}]',14,19),(139,'2022-02-09 03:24:19.777356','2','Banner image2',1,'[{\"added\": {}}]',14,19),(140,'2022-02-09 03:37:05.964503','132','CartItem object (132)',3,'',11,19),(141,'2022-02-09 03:37:05.968144','127','CartItem object (127)',3,'',11,19),(142,'2022-02-09 03:37:05.971458','126','CartItem object (126)',3,'',11,19),(143,'2022-02-09 03:37:29.117784','27','lhpgwuflyse60yqnxcw9b1ery669w3gp',3,'',10,19),(144,'2022-02-09 03:37:29.121766','26','gngxz0xynh1o47cxkynmua3no44eo6v9',3,'',10,19),(145,'2022-02-09 03:37:29.125160','25','k9uhgpuslaz7fvfn28xjjnferuwv8tw7',3,'',10,19),(146,'2022-02-09 03:37:29.128891','24','yqxekc1rhb2apuy0zqlso0uv279i50te',3,'',10,19),(147,'2022-02-09 03:37:29.131920','23','j3xjqwd4a2g89yfb8nluwus3y0t5ba7y',3,'',10,19),(148,'2022-02-09 03:37:29.134888','22','m0rjucvmvkymd8rdjesd0dhamvw2mhc9',3,'',10,19),(149,'2022-02-09 03:37:29.138297','21','lbzl01ovd426tdg58oa2atx8z07zmc02',3,'',10,19),(150,'2022-02-09 03:37:29.141831','20','uv9jyf9ki0c1lyvfpp65le67qcgow0wm',3,'',10,19),(151,'2022-02-09 03:37:29.145383','19','rdw3o8gzsacvfubgg418wnpbj2q1991t',3,'',10,19),(152,'2022-02-09 03:37:29.148815','18','63uhx1ughbqijmxxep5ovn5r9pzq9kdg',3,'',10,19),(153,'2022-02-09 03:37:29.151836','17','fxrvwkeuoaifl6bct9okpsd4o98nzroy',3,'',10,19),(154,'2022-02-09 03:37:29.155650','16','9c6a2nsfvqgbjm8d43mashl3a82p0k89',3,'',10,19),(155,'2022-02-09 03:37:29.158972','15','she8ox1vd00mm3daprj6qhh8emby2vpg',3,'',10,19),(156,'2022-02-09 03:37:29.162716','14','xe7zmryzlk9l0xbglfw20hpb4b19jocc',3,'',10,19),(157,'2022-02-09 03:37:29.166336','13','m40hraicns0wa2brzms15yozgc20aqho',3,'',10,19),(158,'2022-02-09 03:37:29.169262','12','36zv884k73iqs610s2p8n7hswyf3u5dw',3,'',10,19),(159,'2022-02-09 03:37:29.172311','11','qslq5kubkpx0e0i92cdyxoizpcy25r3l',3,'',10,19),(160,'2022-02-09 03:37:29.175428','10','mgyimt5jkfj4bw1oaua2p9ba34ibc2o0',3,'',10,19),(161,'2022-02-09 03:37:29.178304','9','h5uhm1mc0b1lg49ql5yp0y7h2oqowd3v',3,'',10,19),(162,'2022-02-09 03:37:29.182228','8','bflfv12phddryh8o9lmtzu6mm79rs9cl',3,'',10,19),(163,'2022-02-09 03:37:29.185290','7','w2tca8run7oo8hfg52heyr95m3ndrnp2',3,'',10,19),(164,'2022-02-09 03:37:29.188158','6','yyavy3ggymmfc499yhgkbc5fzspvm3kx',3,'',10,19),(165,'2022-02-09 03:37:29.191563','5','rhfcwnalob8ndnj364h8r29bl09uejfu',3,'',10,19),(166,'2022-02-09 03:37:29.194337','4','djq6w8lzb1oj26x4uooxocf98cxaxdb2',3,'',10,19),(167,'2022-02-09 03:37:29.197977','3','owzmqyw7trus0cxhuzlb4f856c98k2uu',3,'',10,19),(168,'2022-02-09 03:37:29.203093','2','gmgy4i38z1cz5fplrjsalnzhuhah5682',3,'',10,19),(169,'2022-02-09 03:37:29.210626','1','nc97sgs29z5la34v2lftcko6koiwhfol',3,'',10,19),(170,'2022-02-09 07:03:19.892848','1','SubCategory object (1)',1,'[{\"added\": {}}]',15,19),(171,'2022-02-09 07:06:33.607753','2','SubCategory object (2)',1,'[{\"added\": {}}]',15,19),(172,'2022-02-09 07:07:13.812078','3','SubCategory object (3)',1,'[{\"added\": {}}]',15,19),(173,'2022-02-09 07:08:14.694910','4','SubCategory object (4)',1,'[{\"added\": {}}]',15,19),(174,'2022-02-09 07:08:22.865179','5','SubCategory object (5)',1,'[{\"added\": {}}]',15,19),(175,'2022-02-09 07:08:31.606600','6','SubCategory object (6)',1,'[{\"added\": {}}]',15,19),(176,'2022-02-09 07:08:50.837577','7','SubCategory object (7)',1,'[{\"added\": {}}]',15,19),(177,'2022-02-09 07:09:25.828657','8','SubCategory object (8)',1,'[{\"added\": {}}]',15,19),(178,'2022-02-09 07:09:48.971314','9','SubCategory object (9)',1,'[{\"added\": {}}]',15,19),(179,'2022-02-09 07:10:11.774170','10','SubCategory object (10)',1,'[{\"added\": {}}]',15,19),(180,'2022-02-09 07:11:18.370442','11','SubCategory object (11)',1,'[{\"added\": {}}]',15,19),(181,'2022-02-09 07:15:36.316719','29','Blue Carrot Fit Low Distress Stretchable Jeans',1,'[{\"added\": {}}]',8,19),(182,'2022-02-09 08:40:48.721857','12','Raymond',1,'[{\"added\": {}}]',15,19),(183,'2022-02-09 08:41:02.097018','26','striped shirt',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',8,19),(184,'2022-02-09 08:42:03.663022','13','Blue  Checked Shirt',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',8,19),(185,'2022-02-09 08:42:10.021677','11','Slim Fit Blue Jeans',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',8,19),(186,'2022-02-09 08:42:20.549212','10','Lee Cooper Jeans',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',8,19),(187,'2022-02-09 08:42:50.136172','10','Lee Cooper Jeans',3,'',8,19),(188,'2022-02-09 08:42:59.138209','11','Slim Fit Blue Jeans',3,'',8,19),(189,'2022-02-09 08:43:03.201206','27','Grey jeans men',3,'',8,19),(190,'2022-02-09 08:43:06.133725','13','Blue  Checked Shirt',3,'',8,19),(191,'2022-02-09 08:43:09.447002','25','Full Sleeves Slim Fit Shirt',3,'',8,19),(192,'2022-02-09 08:43:12.239769','15','Graded Casual Shirt',3,'',8,19),(193,'2022-02-09 08:43:15.319132','24','Graphic Print Slim Fit T-shirt',3,'',8,19),(194,'2022-02-09 08:43:18.839220','26','striped shirt',3,'',8,19),(195,'2022-02-09 08:43:22.317784','23','men navy t shirt green',3,'',8,19),(196,'2022-02-09 08:51:27.180864','30','DENNISLINGO PREMIUM ATTIRE shirt',1,'[{\"added\": {}}]',8,19),(197,'2022-02-09 08:53:12.751804','31','Striped Shirt with Patch Pocket',1,'[{\"added\": {}}]',8,19),(198,'2022-02-09 09:04:26.206128','31','Striped Shirt with Patch Pocket',3,'',8,19),(199,'2022-02-09 09:04:26.209750','30','DENNISLINGO PREMIUM ATTIRE shirt',3,'',8,19),(200,'2022-02-09 09:04:26.212975','29','Blue Carrot Fit Low Distress Stretchable Jeans',3,'',8,19),(201,'2022-02-09 09:17:12.370623','32','Men Blue Printed Casual Sustainable Shirt',1,'[{\"added\": {}}]',8,19),(202,'2022-02-09 09:18:49.110391','33','Men Blue plain Casual shirt',1,'[{\"added\": {}}]',8,19),(203,'2022-02-09 09:20:45.151460','34','Men Green Solid Slim Fit Pure Cotton Formal Shirt',1,'[{\"added\": {}}]',8,19),(204,'2022-02-09 09:22:36.364787','35','Men Navy Blue Red Striped Cotton Pure Cotton T-shi',1,'[{\"added\": {}}]',8,19),(205,'2022-02-09 09:24:17.012306','36','men Blue t -shirt',1,'[{\"added\": {}}]',8,19),(206,'2022-02-09 09:24:25.692392','36','Men Blue t -shirt',2,'[{\"changed\": {\"fields\": [\"Product name\"]}}]',8,19),(207,'2022-02-09 09:25:27.767652','37','Men Red t -shirt',1,'[{\"added\": {}}]',8,19),(208,'2022-02-09 09:27:00.260406','38','Men Blue Skinny Fit Mid-Rise Mildly Distressed Str',1,'[{\"added\": {}}]',8,19),(209,'2022-02-09 09:31:04.434553','39','Men grey-blue jeans',1,'[{\"added\": {}}]',8,19),(210,'2022-02-09 09:38:50.955953','38','Blue Skinny Fit Mid-Rise Mildly Distressed',2,'[{\"changed\": {\"fields\": [\"Product name\", \"Slug\"]}}]',8,19),(211,'2022-02-09 09:39:16.323106','38','Blue Skinny Fit Mid-Rise',2,'[{\"changed\": {\"fields\": [\"Product name\", \"Slug\"]}}]',8,19),(212,'2022-02-09 09:39:44.656661','35','Blue Red Striped Cotton Pure Cotton',2,'[{\"changed\": {\"fields\": [\"Product name\"]}}]',8,19),(213,'2022-02-09 09:40:12.850447','35','Blue Red Striped Cotton',2,'[{\"changed\": {\"fields\": [\"Product name\", \"Slug\"]}}]',8,19),(214,'2022-02-09 09:40:59.346360','34','Green Solid Slim Fit Cotton Formal',2,'[{\"changed\": {\"fields\": [\"Product name\", \"Slug\"]}}]',8,19),(215,'2022-02-09 09:41:42.977331','34','Green Solid Slim Fit Cotton',2,'[{\"changed\": {\"fields\": [\"Product name\", \"Slug\"]}}]',8,19),(216,'2022-02-09 09:42:27.614272','32','Blue Printed Casual Sustainable',2,'[{\"changed\": {\"fields\": [\"Product name\", \"Slug\"]}}]',8,19),(217,'2022-02-09 13:24:28.815856','35','Blue Red Striped Cotton',2,'[{\"changed\": {\"fields\": [\"Stock\"]}}]',8,19),(218,'2022-02-09 13:31:05.126449','10','Louis Philippe',3,'',15,19),(219,'2022-02-09 13:31:05.130336','9','Blackberrys',3,'',15,19),(220,'2022-02-09 13:31:05.133782','8','Park Avenue',3,'',15,19),(221,'2022-02-09 13:31:05.136424','6','Adidas',3,'',15,19),(222,'2022-02-09 13:31:05.139288','3','NetPlay',3,'',15,19),(223,'2022-02-09 13:31:29.556380','1','Levis',3,'',15,19),(224,'2022-02-09 13:32:16.327626','11','United Colors of Benetton',3,'',15,19),(225,'2022-02-09 13:32:51.537204','4','Puma',3,'',15,19),(226,'2022-02-09 14:24:19.896396','36','Men Blue t -shirt',2,'[{\"changed\": {\"fields\": [\"Size\"]}}]',8,19),(227,'2022-02-09 14:24:51.626505','39','Men grey-blue jeans',2,'[{\"changed\": {\"fields\": [\"Size\"]}}]',8,19),(228,'2022-02-09 14:43:19.176981','39','Men grey-blue jeans',2,'[{\"changed\": {\"fields\": [\"Size\"]}}]',8,19),(229,'2022-02-09 18:10:38.832841','1','Variation object (1)',1,'[{\"added\": {}}]',12,19),(230,'2022-02-09 18:15:05.068342','1','Variation object (1)',3,'',12,19),(231,'2022-02-09 18:15:54.444571','2','Variation object (2)',1,'[{\"added\": {}}]',12,19),(232,'2022-02-09 18:19:01.692111','3','Variation object (3)',1,'[{\"added\": {}}]',12,19),(233,'2022-02-09 18:58:37.869931','3','Variation object (3)',2,'[{\"changed\": {\"fields\": [\"Variation value\"]}}]',12,19),(234,'2022-02-09 19:03:40.503688','3','Variation object (3)',3,'',12,19),(235,'2022-02-09 19:03:40.507218','2','Variation object (2)',3,'',12,19),(236,'2022-02-09 19:04:11.465502','4','Variation object (4)',1,'[{\"added\": {}}]',12,19),(237,'2022-02-09 19:04:29.260283','5','Variation object (5)',1,'[{\"added\": {}}]',12,19),(238,'2022-02-09 19:11:33.566907','6','Variation object (6)',1,'[{\"added\": {}}]',12,19),(239,'2022-02-10 03:47:10.118401','12','Raymond',2,'[]',15,19),(240,'2022-02-10 04:07:30.890203','7','Red',1,'[{\"added\": {}}]',12,19),(241,'2022-02-10 05:03:11.324390','186','CartItem object (186)',2,'[{\"changed\": {\"fields\": [\"User\", \"Cart\"]}}]',11,19),(242,'2022-02-10 09:38:32.145077','187','CartItem object (187)',3,'',11,19),(243,'2022-02-10 09:42:18.047628','198','CartItem object (198)',3,'',11,19),(244,'2022-02-10 09:45:01.842816','199','CartItem object (199)',3,'',11,19),(245,'2022-02-10 10:20:55.619604','200','CartItem object (200)',3,'',11,19),(246,'2022-02-10 10:21:00.324915','203','CartItem object (203)',3,'',11,19),(247,'2022-02-10 10:21:06.263260','202','CartItem object (202)',3,'',11,19),(248,'2022-02-10 10:21:06.269336','201','CartItem object (201)',3,'',11,19),(249,'2022-02-10 11:04:54.236362','209','CartItem object (209)',3,'',11,19),(250,'2022-02-10 11:04:57.875140','208','CartItem object (208)',3,'',11,19),(251,'2022-02-10 11:05:53.000056','210','CartItem object (210)',3,'',11,19),(252,'2022-02-10 11:06:35.025960','211','CartItem object (211)',3,'',11,19),(253,'2022-02-10 11:46:42.291403','212','CartItem object (212)',3,'',11,19),(254,'2022-02-10 11:46:45.734869','213','CartItem object (213)',3,'',11,19),(255,'2022-02-10 11:46:48.915858','207','CartItem object (207)',3,'',11,19),(256,'2022-02-10 11:50:50.043257','217','CartItem object (217)',3,'',11,19),(257,'2022-02-10 11:50:50.048827','216','CartItem object (216)',3,'',11,19),(258,'2022-02-10 11:50:50.052294','215','CartItem object (215)',3,'',11,19),(259,'2022-02-10 11:50:50.057226','214','CartItem object (214)',3,'',11,19),(260,'2022-02-10 12:57:54.580351','225','CartItem object (225)',3,'',11,19),(261,'2022-02-10 12:57:54.584903','224','CartItem object (224)',3,'',11,19),(262,'2022-02-10 12:57:54.587792','218','CartItem object (218)',3,'',11,19),(263,'2022-02-10 13:10:12.518200','232','CartItem object (232)',3,'',11,19),(264,'2022-02-10 13:10:12.526064','231','CartItem object (231)',3,'',11,19),(265,'2022-02-10 13:10:12.529356','230','CartItem object (230)',3,'',11,19),(266,'2022-02-10 13:10:12.532481','229','CartItem object (229)',3,'',11,19),(267,'2022-02-10 13:10:12.535149','228','CartItem object (228)',3,'',11,19),(268,'2022-02-10 13:10:12.538449','227','CartItem object (227)',3,'',11,19),(269,'2022-02-10 13:10:12.541289','226','CartItem object (226)',3,'',11,19),(270,'2022-02-10 13:10:42.037357','233','CartItem object (233)',3,'',11,19),(271,'2022-02-10 13:12:20.936716','8','Large',1,'[{\"added\": {}}]',12,19),(272,'2022-02-10 13:12:36.441931','8','Large',3,'',12,19),(273,'2022-02-10 13:12:36.445060','7','Red',3,'',12,19),(274,'2022-02-10 13:12:36.448807','6','Medium',3,'',12,19),(275,'2022-02-10 13:12:36.452256','5','small',3,'',12,19),(276,'2022-02-10 13:12:36.455024','4','Blue',3,'',12,19),(277,'2022-02-10 13:15:11.884845','9','small',1,'[{\"added\": {}}]',12,19),(278,'2022-02-10 13:15:19.838931','10','medium',1,'[{\"added\": {}}]',12,19),(279,'2022-02-10 13:15:28.040626','11','large',1,'[{\"added\": {}}]',12,19),(280,'2022-02-10 13:15:35.443329','12','blue',1,'[{\"added\": {}}]',12,19),(281,'2022-02-10 13:15:50.200725','13','red',1,'[{\"added\": {}}]',12,19),(282,'2022-02-10 13:17:41.353827','238','CartItem object (238)',3,'',11,19),(283,'2022-02-10 13:17:41.356847','237','CartItem object (237)',3,'',11,19),(284,'2022-02-10 13:17:41.359323','236','CartItem object (236)',3,'',11,19),(285,'2022-02-10 13:17:41.362212','235','CartItem object (235)',3,'',11,19),(286,'2022-02-10 13:17:41.365390','234','CartItem object (234)',3,'',11,19),(287,'2022-02-10 13:48:57.775016','244','CartItem object (244)',3,'',11,19),(288,'2022-02-10 13:48:57.780114','243','CartItem object (243)',3,'',11,19),(289,'2022-02-10 13:48:57.786470','242','CartItem object (242)',3,'',11,19),(290,'2022-02-10 13:48:57.789783','241','CartItem object (241)',3,'',11,19),(291,'2022-02-10 13:48:57.793830','240','CartItem object (240)',3,'',11,19),(292,'2022-02-10 13:48:57.797344','239','CartItem object (239)',3,'',11,19),(293,'2022-02-10 13:54:32.269136','248','CartItem object (248)',3,'',11,19),(294,'2022-02-10 13:54:32.274417','247','CartItem object (247)',3,'',11,19),(295,'2022-02-10 13:54:32.277521','246','CartItem object (246)',3,'',11,19),(296,'2022-02-10 13:54:32.281364','245','CartItem object (245)',3,'',11,19),(297,'2022-02-10 14:00:22.872024','250','CartItem object (250)',3,'',11,19),(298,'2022-02-10 14:00:22.877271','249','CartItem object (249)',3,'',11,19),(299,'2022-02-10 14:00:53.811872','251','CartItem object (251)',3,'',11,19),(300,'2022-02-10 14:08:14.292964','252','CartItem object (252)',3,'',11,19),(301,'2022-02-10 14:09:37.858783','253','CartItem object (253)',3,'',11,19),(302,'2022-02-10 14:36:00.900310','258','CartItem object (258)',3,'',11,19),(303,'2022-02-10 14:36:00.907586','257','CartItem object (257)',3,'',11,19),(304,'2022-02-10 14:36:00.913027','256','CartItem object (256)',3,'',11,19),(305,'2022-02-10 14:36:00.917683','255','CartItem object (255)',3,'',11,19),(306,'2022-02-10 14:36:00.922764','254','CartItem object (254)',3,'',11,19),(307,'2022-02-10 14:39:32.329300','261','CartItem object (261)',3,'',11,19),(308,'2022-02-10 14:39:32.336196','260','CartItem object (260)',3,'',11,19),(309,'2022-02-10 14:39:32.339588','259','CartItem object (259)',3,'',11,19),(310,'2022-02-10 14:42:38.912963','264','CartItem object (264)',3,'',11,19),(311,'2022-02-10 14:42:38.921447','263','CartItem object (263)',3,'',11,19),(312,'2022-02-10 14:42:38.926514','262','CartItem object (262)',3,'',11,19),(313,'2022-02-10 14:45:50.242821','269','CartItem object (269)',3,'',11,19),(314,'2022-02-10 14:45:50.247581','268','CartItem object (268)',3,'',11,19),(315,'2022-02-10 14:45:50.251122','267','CartItem object (267)',3,'',11,19),(316,'2022-02-10 14:45:50.254977','266','CartItem object (266)',3,'',11,19),(317,'2022-02-10 14:45:50.258169','265','CartItem object (265)',3,'',11,19),(318,'2022-02-10 14:49:52.823676','278','CartItem object (278)',3,'',11,19),(319,'2022-02-10 14:49:52.827030','277','CartItem object (277)',3,'',11,19),(320,'2022-02-10 15:49:41.626368','14','Blue',1,'[{\"added\": {}}]',12,19),(321,'2022-02-10 15:50:00.836682','15','Green',1,'[{\"added\": {}}]',12,19),(322,'2022-02-10 15:50:13.100078','16','small',1,'[{\"added\": {}}]',12,19),(323,'2022-02-10 15:50:21.449540','17','medium',1,'[{\"added\": {}}]',12,19),(324,'2022-02-10 15:50:30.441455','18','large',1,'[{\"added\": {}}]',12,19),(325,'2022-02-10 15:50:43.842895','19','Red',1,'[{\"added\": {}}]',12,19),(326,'2022-02-10 15:50:52.931070','20','Blue',1,'[{\"added\": {}}]',12,19),(327,'2022-02-10 16:01:41.878822','21','Blue',1,'[{\"added\": {}}]',12,19),(328,'2022-02-10 16:01:52.935680','22','Black',1,'[{\"added\": {}}]',12,19),(329,'2022-02-10 16:02:05.979595','23','small',1,'[{\"added\": {}}]',12,19),(330,'2022-02-10 16:02:15.558545','24','medium',1,'[{\"added\": {}}]',12,19),(331,'2022-02-11 10:25:43.833812','2','shahin',3,'',16,19),(332,'2022-02-11 11:40:34.846526','22','rahul',3,'',16,19),(333,'2022-02-11 11:40:34.851054','21','rahul',3,'',16,19),(334,'2022-02-11 11:40:34.853545','20','rahul',3,'',16,19),(335,'2022-02-11 11:40:34.856377','19','rahul',3,'',16,19),(336,'2022-02-11 11:40:34.859096','18','rahul',3,'',16,19),(337,'2022-02-11 11:40:34.861617','17','rahul',3,'',16,19),(338,'2022-02-11 11:40:34.865199','16','rahul',3,'',16,19),(339,'2022-02-11 11:40:34.868390','15','rahul',3,'',16,19),(340,'2022-02-11 11:40:34.871303','14','rahul',3,'',16,19),(341,'2022-02-11 11:40:34.873938','13','rahul',3,'',16,19),(342,'2022-02-11 11:40:34.876824','12','rahul',3,'',16,19),(343,'2022-02-12 04:10:23.871855','4','shahin',3,'',19,19),(344,'2022-02-12 04:10:23.877902','3','shahin',3,'',19,19),(345,'2022-02-12 04:10:23.882115','2','akhil',3,'',19,19),(346,'2022-02-12 04:10:23.886012','1','manohar',3,'',19,19),(347,'2022-02-12 05:19:45.767258','8','Jiso',3,'',19,19),(348,'2022-02-12 05:19:45.770418','7','Jiso',3,'',19,19),(349,'2022-02-12 05:19:45.773458','6','Jiso',3,'',19,19),(350,'2022-02-13 06:07:12.501685','6','Shirts',2,'[{\"changed\": {\"fields\": [\"Category offer\"]}}]',7,19),(351,'2022-02-13 06:54:34.429246','32','Blue Printed Casual Sustainable',2,'[{\"changed\": {\"fields\": [\"Offer\", \"Size\"]}}]',8,19),(352,'2022-02-13 06:57:19.343492','32','Blue Printed Casual Sustainable',2,'[{\"changed\": {\"fields\": [\"Offer\"]}}]',8,19),(353,'2022-02-13 06:59:01.187379','6','Shirts',2,'[{\"changed\": {\"fields\": [\"Category offer\"]}}]',7,19),(354,'2022-02-13 07:07:49.711692','6','Shirts',2,'[{\"changed\": {\"fields\": [\"Category offer\"]}}]',7,19),(355,'2022-02-13 08:54:23.400777','33','Men Blue plain Casual shirt',2,'[{\"changed\": {\"fields\": [\"Offer\", \"Size\"]}}]',8,19),(356,'2022-02-13 17:29:09.296045','129','Thushad',3,'',16,19),(357,'2022-02-13 17:29:18.415915','128','Thushad',3,'',16,19),(358,'2022-02-13 19:36:45.173377','33','Men Blue plain Casual shirt',2,'[{\"changed\": {\"fields\": [\"Stock\"]}}]',8,19),(359,'2022-02-14 04:36:27.906561','41','Hooded T-shirt',2,'[{\"changed\": {\"fields\": [\"Price\", \"Size\"]}}]',8,19),(360,'2022-02-14 04:36:51.893706','41','Hooded T-shirt',2,'[]',8,19),(361,'2022-02-14 04:37:30.029199','25','Brown',1,'[{\"added\": {}}]',12,19),(362,'2022-02-14 04:37:39.102122','26','Small',1,'[{\"added\": {}}]',12,19),(363,'2022-02-14 04:46:45.692810','29','thush@gmail.com',3,'',6,19),(364,'2022-02-14 05:01:42.438608','41','Hooded T-shirt',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',8,19),(365,'2022-02-14 16:00:44.429846','32','Blue Printed Casual Sustainable',2,'[{\"changed\": {\"fields\": [\"Stock\"]}}]',8,19),(366,'2022-02-14 16:03:31.541077','33','Men Blue plain Casual shirt',2,'[{\"changed\": {\"fields\": [\"Stock\"]}}]',8,19),(367,'2022-02-16 05:26:19.070345','32','akhil@gmail.com',3,'',6,19),(368,'2022-02-16 05:26:19.075716','31','k@gmail.com',3,'',6,19),(369,'2022-02-16 05:26:19.079019','30','sha@gmail.com',3,'',6,19),(370,'2022-02-16 05:26:19.083051','21','asus@gmail.com',3,'',6,19),(371,'2022-02-16 05:30:49.521344','40','arjun@gmail.com',3,'',6,19),(372,'2022-02-16 05:35:10.804319','41','arjun@gmail.com',3,'',6,19),(373,'2022-02-16 05:39:45.131721','42','arjun@gmail.com',3,'',6,19),(374,'2022-02-16 05:46:30.721074','43','arjun@gmail.com',3,'',6,19),(375,'2022-02-16 05:54:43.621270','44','arjun@gmail.com',3,'',6,19),(376,'2022-02-16 08:56:44.312590','28','T-shirts',2,'[]',7,19),(377,'2022-02-16 08:56:53.464152','28','T-shirts',2,'[{\"changed\": {\"fields\": [\"Category offer\"]}}]',7,19),(378,'2022-02-16 13:00:28.882310','27','small',1,'[{\"added\": {}}]',12,19),(379,'2022-02-16 13:09:11.919720','44','eht7czlsk63hz5alowl2uwfqbdy0kwl0',3,'',10,19),(380,'2022-02-16 13:09:11.925276','43','p48l1mriiqrjcj1erv94563o0j98hwoq',3,'',10,19),(381,'2022-02-16 13:09:11.929792','42','9pgnrw1dof29k2bo6via1dawnjplxy5b',3,'',10,19),(382,'2022-02-16 13:09:11.935524','41','7xd80k2t8clu5volxgw87qguthwg2st1',3,'',10,19),(383,'2022-02-16 13:09:11.940280','40','mofz5l89je0t24ydu9akjktc8r3scga7',3,'',10,19),(384,'2022-02-16 13:09:11.944162','39','0vkv6omeqmqsr1caqordlun3as685o6f',3,'',10,19),(385,'2022-02-16 13:09:11.947179','38','k5yzmrensg3hltt5clbtmf5f2dnswi5k',3,'',10,19),(386,'2022-02-16 13:09:11.950046','37','kg0el6dyjowd2sl0gjgf2wwmomgn8tcn',3,'',10,19),(387,'2022-02-16 13:09:11.953108','36','iiiqh849xeofr1dhz6mz3dwn0nba6clv',3,'',10,19),(388,'2022-02-16 13:09:11.956743','35','sz01t41q64ka9y099zj3wgljozdyd61l',3,'',10,19),(389,'2022-02-16 13:09:11.959575','34','c6gjns2a05q0de94c0f2kisivnbm6tkc',3,'',10,19),(390,'2022-02-16 13:09:11.963108','33','jm1yrubmp8sziael59zlh1qfpswdjycg',3,'',10,19),(391,'2022-02-16 13:09:11.966836','32','c95cl4w2hpm7qlh04rdmu4kgcppv713g',3,'',10,19),(392,'2022-02-16 13:09:11.969838','31','gq12io3dt4razqlxfp25b8mz6fceggyh',3,'',10,19),(393,'2022-02-16 13:09:11.973280','30','cg7z47svgiw388zyz1dim78yl7xykxmf',3,'',10,19),(394,'2022-02-16 13:09:11.976411','29','6mipbarz8j369sd00yth441kttc90k77',3,'',10,19),(395,'2022-02-16 13:09:11.979225','28','lsja0f1a48nqf2ck3ek3fpxah9kyd12e',3,'',10,19),(396,'2022-02-16 13:09:46.973294','360','CartItem object (360)',3,'',11,19),(397,'2022-02-16 13:09:46.977010','359','CartItem object (359)',3,'',11,19),(398,'2022-02-16 13:09:46.982620','358','CartItem object (358)',3,'',11,19),(399,'2022-02-16 13:09:46.987243','357','CartItem object (357)',3,'',11,19),(400,'2022-02-16 13:09:46.990969','356','CartItem object (356)',3,'',11,19),(401,'2022-02-16 13:09:46.994387','355','CartItem object (355)',3,'',11,19),(402,'2022-02-16 13:09:46.998293','354','CartItem object (354)',3,'',11,19),(403,'2022-02-16 13:15:03.850090','33','Men Blue plain Casual shirt',3,'',8,19),(404,'2022-02-16 13:16:44.888244','45','Men Blue plain Casual shirt',1,'[{\"added\": {}}]',8,19),(405,'2022-02-16 13:17:45.594130','45','Men Blue plain Casual shirt',2,'[]',8,19),(406,'2022-02-16 13:18:04.851761','28','red',1,'[{\"added\": {}}]',12,19),(407,'2022-02-16 13:18:14.788247','29','small',1,'[{\"added\": {}}]',12,19),(408,'2022-02-16 13:31:31.722642','45','Men Blue plain Casual shirt',2,'[{\"changed\": {\"fields\": [\"Offer price\"]}}]',8,19),(409,'2022-02-16 13:32:50.428406','45','Men Blue plain Casual shirt',2,'[{\"changed\": {\"fields\": [\"Offer price\"]}}]',8,19),(410,'2022-02-16 13:36:02.352330','45','fzomiht7q9je53t9jkcye9n3ey1rfzq0',3,'',10,19),(411,'2022-02-16 13:38:25.578686','45','Men Blue plain Casual shirt',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',8,19),(412,'2022-02-16 13:39:16.423900','34','Green Solid Slim Fit Cotton',2,'[{\"changed\": {\"fields\": [\"Stock\"]}}]',8,19),(413,'2022-02-17 03:34:44.572212','1','Banner Image1',2,'[{\"changed\": {\"fields\": [\"Banner img\"]}}]',14,19),(414,'2022-02-17 03:35:03.763319','2','Banner image2',2,'[{\"changed\": {\"fields\": [\"Banner img\"]}}]',14,19),(415,'2022-02-17 04:22:42.001253','1','Banner Image1',3,'',14,19),(416,'2022-02-17 04:22:48.243225','2','Banner image2',3,'',14,19),(417,'2022-02-17 04:24:35.532895','3','banner',1,'[{\"added\": {}}]',14,19),(418,'2022-02-17 05:30:51.315227','45','Men Blue plain Casual shirt',2,'[{\"changed\": {\"fields\": [\"Price\", \"Offer price\", \"Offer\"]}}]',8,19),(419,'2022-02-18 12:20:03.397108','30','small',1,'[{\"added\": {}}]',12,19),(420,'2022-02-18 12:20:13.706654','31','medium',1,'[{\"added\": {}}]',12,19),(421,'2022-02-18 12:20:22.243891','32','Blue',1,'[{\"added\": {}}]',12,19),(422,'2022-02-18 12:20:30.972703','33','Grey',1,'[{\"added\": {}}]',12,19),(423,'2022-02-19 05:22:01.054657','44','men',2,'[{\"changed\": {\"fields\": [\"Offer\"]}}]',8,19),(424,'2022-02-21 03:34:06.649334','44','men Crew- Neck T-shirt',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,19),(425,'2022-02-21 03:34:34.457937','46','Colourblock Slim Fit T-shirt',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,19),(426,'2022-02-21 03:34:39.922694','44','men Crew- Neck T-shirt',2,'[]',8,19),(427,'2022-02-21 03:41:12.578634','34','Red',1,'[{\"added\": {}}]',12,19),(428,'2022-02-21 03:41:39.396779','35','Blue',1,'[{\"added\": {}}]',12,19),(429,'2022-02-21 03:41:48.970607','36','Small',1,'[{\"added\": {}}]',12,19),(430,'2022-02-21 03:42:02.378712','37','Medium',1,'[{\"added\": {}}]',12,19),(431,'2022-02-21 03:42:30.881779','38','Small',1,'[{\"added\": {}}]',12,19),(432,'2022-02-21 03:42:39.269664','39','Medium',1,'[{\"added\": {}}]',12,19),(433,'2022-02-21 03:42:49.465371','40','Large',1,'[{\"added\": {}}]',12,19),(434,'2022-02-21 03:42:59.103850','41','Blue',1,'[{\"added\": {}}]',12,19),(435,'2022-02-21 03:43:39.382676','42','Black',1,'[{\"added\": {}}]',12,19),(436,'2022-02-21 04:08:50.902086','43','Grey',1,'[{\"added\": {}}]',12,19),(437,'2022-02-21 04:08:58.115266','44','Small',1,'[{\"added\": {}}]',12,19),(438,'2022-02-21 04:09:05.143585','45','Medium',1,'[{\"added\": {}}]',12,19),(439,'2022-02-21 04:09:14.168184','46','Large',1,'[{\"added\": {}}]',12,19),(440,'2022-02-21 04:09:31.676836','47','Blue',1,'[{\"added\": {}}]',12,19),(441,'2022-02-21 04:09:43.756474','48','Ligt Grey',1,'[{\"added\": {}}]',12,19),(442,'2022-02-21 04:09:52.359665','49','Small',1,'[{\"added\": {}}]',12,19),(443,'2022-02-21 04:09:59.356270','50','Medium',1,'[{\"added\": {}}]',12,19),(444,'2022-02-21 04:10:07.530775','51','Large',1,'[{\"added\": {}}]',12,19),(445,'2022-02-21 04:10:28.209162','48','Light Grey',2,'[{\"changed\": {\"fields\": [\"Variation value\"]}}]',12,19),(446,'2022-02-21 04:11:11.547551','52','Red',1,'[{\"added\": {}}]',12,19),(447,'2022-02-21 04:11:21.167841','53','Brown',1,'[{\"added\": {}}]',12,19),(448,'2022-02-21 04:11:31.641309','54','Small',1,'[{\"added\": {}}]',12,19),(449,'2022-02-21 04:11:40.583988','55','Medium',1,'[{\"added\": {}}]',12,19),(450,'2022-02-21 04:11:48.657749','56','Large',1,'[{\"added\": {}}]',12,19),(451,'2022-02-22 15:17:13.078294','1','feb123',1,'[{\"added\": {}}]',21,19),(452,'2022-02-22 15:20:13.159117','1','feb123',2,'[{\"changed\": {\"fields\": [\"Coupon offer\"]}}]',21,19),(453,'2022-02-23 04:34:45.208373','2','h',1,'[{\"added\": {}}]',21,19),(454,'2022-02-23 04:36:54.096156','3','t',1,'[{\"added\": {}}]',21,19),(455,'2022-02-23 04:37:02.678129','3','t',2,'[{\"changed\": {\"fields\": [\"Coupon offer\"]}}]',21,19),(456,'2022-02-23 04:48:56.510199','4','y',1,'[{\"added\": {}}]',21,19);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','account'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(10,'carts','cart'),(11,'carts','cartitem'),(7,'category','category'),(15,'category','subcategory'),(4,'contenttypes','contenttype'),(13,'home','banner'),(19,'orders','addresstable'),(21,'orders','coupon'),(16,'orders','order'),(18,'orders','orderproduct'),(17,'orders','payment'),(5,'sessions','session'),(14,'store','banner'),(8,'store','product'),(9,'store','product_image'),(12,'store','variation'),(20,'store','wishlist');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'accounts','0001_initial','2022-01-22 16:07:42.883902'),(2,'contenttypes','0001_initial','2022-01-22 16:07:42.930725'),(3,'admin','0001_initial','2022-01-22 16:07:43.048666'),(4,'admin','0002_logentry_remove_auto_add','2022-01-22 16:07:43.059548'),(5,'admin','0003_logentry_add_action_flag_choices','2022-01-22 16:07:43.070505'),(6,'contenttypes','0002_remove_content_type_name','2022-01-22 16:07:43.156694'),(7,'auth','0001_initial','2022-01-22 16:07:43.408647'),(8,'auth','0002_alter_permission_name_max_length','2022-01-22 16:07:43.469846'),(9,'auth','0003_alter_user_email_max_length','2022-01-22 16:07:43.480986'),(10,'auth','0004_alter_user_username_opts','2022-01-22 16:07:43.493662'),(11,'auth','0005_alter_user_last_login_null','2022-01-22 16:07:43.505460'),(12,'auth','0006_require_contenttypes_0002','2022-01-22 16:07:43.510850'),(13,'auth','0007_alter_validators_add_error_messages','2022-01-22 16:07:43.526077'),(14,'auth','0008_alter_user_username_max_length','2022-01-22 16:07:43.536714'),(15,'auth','0009_alter_user_last_name_max_length','2022-01-22 16:07:43.549253'),(16,'auth','0010_alter_group_name_max_length','2022-01-22 16:07:43.578929'),(17,'auth','0011_update_proxy_permissions','2022-01-22 16:07:43.595743'),(18,'auth','0012_alter_user_first_name_max_length','2022-01-22 16:07:43.604428'),(19,'sessions','0001_initial','2022-01-22 16:07:43.656892'),(20,'accounts','0002_alter_account_phone_number','2022-01-22 16:17:21.907742'),(21,'category','0001_initial','2022-01-22 21:25:26.256279'),(22,'category','0002_alter_category_options','2022-01-22 21:31:00.462531'),(23,'accounts','0003_account_is_superuser','2022-01-23 15:55:31.057432'),(24,'category','0003_alter_category_description','2022-01-23 17:19:15.246374'),(25,'store','0001_initial','2022-01-23 17:58:17.547275'),(26,'category','0004_alter_category_slug','2022-01-23 18:01:06.750585'),(27,'accounts','0004_alter_account_phone_number','2022-01-25 08:02:39.079234'),(28,'store','0002_product_image','2022-01-26 21:51:29.447290'),(29,'store','0003_delete_product_image','2022-01-30 10:18:07.570063'),(30,'store','0004_product_images_three_product_images_two_and_more','2022-01-30 14:58:26.712332'),(31,'store','0005_alter_product_images_three_alter_product_images_two','2022-01-30 20:32:47.440294'),(32,'carts','0001_initial','2022-01-30 20:32:47.814075'),(33,'accounts','0005_alter_account_phone_number','2022-02-01 15:38:11.430633'),(34,'store','0006_variations','2022-02-05 05:01:17.658444'),(35,'store','0007_alter_variations_options_variations_created_date','2022-02-05 09:14:03.121802'),(36,'store','0008_rename_variations_variation','2022-02-05 09:26:14.812570'),(37,'store','0009_alter_variation_options','2022-02-06 17:15:23.159414'),(38,'store','0010_delete_variation','2022-02-07 03:26:24.588148'),(39,'category','0005_remove_category_cat_image','2022-02-07 18:17:13.517513'),(40,'store','0011_variation','2022-02-08 15:37:45.729688'),(41,'store','0012_banner','2022-02-09 03:23:46.278465'),(42,'store','0013_delete_variation','2022-02-09 03:47:55.097883'),(43,'category','0006_subcategory','2022-02-09 04:26:01.445131'),(44,'category','0007_subcategory_category','2022-02-09 07:00:03.587957'),(45,'store','0014_remove_product_category_product_brand','2022-02-09 07:00:03.759826'),(46,'category','0008_subcategory_slug','2022-02-09 07:01:28.057739'),(47,'category','0009_alter_category_options','2022-02-09 07:27:54.486150'),(48,'category','0010_remove_subcategory_category','2022-02-09 08:58:14.801708'),(49,'store','0015_product_category','2022-02-09 08:58:14.889194'),(50,'store','0016_product_size','2022-02-09 14:23:01.865552'),(51,'store','0017_variation','2022-02-09 18:08:53.234558'),(52,'store','0018_variation_brand','2022-02-09 18:14:43.903209'),(53,'store','0019_remove_variation_brand','2022-02-10 04:11:52.067641'),(54,'carts','0002_cartitem_variations','2022-02-10 04:50:24.776911'),(55,'orders','0001_initial','2022-02-11 04:48:22.841340'),(56,'orders','0002_remove_order_ip_alter_order_address_line_1_and_more','2022-02-11 08:52:56.733416'),(57,'orders','0003_remove_order_order_note','2022-02-11 09:09:34.159825'),(58,'orders','0004_remove_order_country','2022-02-11 09:12:39.636560'),(59,'orders','0005_addresstable','2022-02-11 13:31:05.955141'),(60,'store','0020_alter_product_stock','2022-02-12 13:14:36.519005'),(61,'store','0021_product_offer_product_offer_price','2022-02-13 05:19:15.090053'),(62,'category','0011_category_category_offer','2022-02-13 05:21:37.230853'),(63,'category','0012_alter_category_category_offer','2022-02-13 08:37:23.213931'),(64,'store','0022_alter_product_offer','2022-02-13 08:37:23.304158'),(65,'category','0013_alter_subcategory_slug','2022-02-13 12:52:01.614242'),(66,'accounts','0006_alter_account_phone_number','2022-02-14 09:23:03.286710'),(67,'accounts','0007_alter_account_phone_number','2022-02-16 05:30:04.036903'),(68,'category','0014_alter_category_category_offer','2022-02-16 08:55:58.637518'),(69,'store','0023_alter_product_offer','2022-02-16 08:59:30.568383'),(70,'store','0024_alter_product_offer_price','2022-02-16 13:15:57.011214'),(71,'store','0025_remove_product_size','2022-02-16 13:17:24.819487'),(72,'store','0026_alter_product_offer_price','2022-02-16 13:21:56.989377'),(73,'store','0027_wishlist','2022-02-17 03:33:02.002686'),(74,'store','0028_rename_banner_img_banner_banner_img1_and_more','2022-02-17 04:22:11.204641'),(75,'store','0029_alter_banner_banner_title','2022-02-17 04:23:37.633117'),(76,'orders','0006_alter_order_status','2022-02-17 10:31:34.918528'),(77,'orders','0007_alter_payment_payment_id','2022-02-20 09:05:18.482592'),(78,'orders','0008_orderproduct_delivery_status','2022-02-21 05:13:12.261489'),(79,'orders','0009_coupon','2022-02-22 15:15:42.722664'),(80,'orders','0010_coupon_coupon_offer','2022-02-22 15:19:55.878091'),(81,'orders','0011_order_coupon','2022-02-22 16:14:16.645372');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1dsd5gbhzf5p5ep5g7dahbqj92rcry0f','.eJxVjssKwyAQRf_FdRGjAbWr0n2_QcaZMbFNDOSxKv33KmTRLu_rcN8iwLGP4dh4DZnEVXReXH7NCPji0hJ6QhkWiUvZ1xxlq8gz3eRjIZ7uZ_cPMMI21nWvwWgTiQyQch0BUiSrrbXGg3WI1oHnGLknTIYcd8g-VY0qKa1chfIMeaoooDmX29BUfTOLzxeC7kJo:1nMjzN:IwdvnJzLVNCxlZB-k3-EchJ1AU30JRNwZ4it1FSDAHI','2022-03-09 05:14:57.012375'),('1my44qszjjb8oqrh05ig9i7smsjvns4r','eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1nLewp:o8DzskYbisvtfZNpFPyKeobRG0BGeN7Nn8rNAkRzmcw','2022-03-06 05:39:51.554929'),('3hskmeirrcp07j72tt48m75tmc079309','.eJxVjDsOwyAQRO9CHSE-loBUUfqcAS27a0NiY8mfKsrdgyU3Lmfem_kKnqCM4i6AplIfw5EkzpO4iQj7luO-8hILNUOHa5kAP1wPQm-ow9xmdVtKkociT7rK10w8Pk_3cpBhzW3dGbDGJiILpLwmQErkjHPOBnAe0XkInBJ3hL0lzxo59C2j6pVRXvz-jT5CaA:1nLzSI:ejJwC9cdg00IltoCSSRdj7ugOa8Xvy8RVTFr_-beYnY','2022-03-07 03:33:42.041807'),('3khk5wu9vfx2cbuahfokqwzxwiry5bh3','.eJxVjDsOwjAQRO_iGln-RFqbkp4zWOvdNQ6gWIqTKuLuJFIKKGfem9lUwnWpae0yp5HVVdmoLr9lRnrJdBB-4vRomtq0zGPWh6JP2vW9sbxvp_t3ULHXfT049M5nZo9sgmUkzgwOAHxECEQQMErOMjAVz0EsSSx7JlOMM0F9vjkMObI:1nI91B:qrbd5ZgpGkf4idynUoMo-ozBeg6ZLFniJbtEUVUREOM','2022-02-24 12:57:49.846138'),('6p7gl3bc8pn5q5p7kq6pv51m7qojhebh','.eJxVjL0OgzAQg98lcxUFjgDpVHXvM6DL3YXQ8iMRmKq-e4PEwmTZ_uyvkgmHUd3VFvcUH_3hNC2TuqkO9y12e5K1GzgTANfQI31kPhp-49wveTZv6-D1geizTfq1sIzPk70cREwxr0Ndl404Rms8SBZPFOoCKvC24NYa8VUwbRAunSuQwLBDJoslIYTGq98fmQhCIQ:1nKOVa:xIhlODSwX5apTUq2ppcYLQLtlUsrnf-Z2kV3Jkd0AKo','2022-03-02 17:54:30.230528'),('6rqjx6tmpr4wqoelyrhrrhqthe3jwd4i','e30:1nFKwX:xSIIL3AX6xhGGp40nx_5pl9veHjiz8Asf5yGnMqd0NI','2022-02-04 01:05:25.010403'),('7addjx66s5d923o6o6ta4z95ec25laf9','.eJxVjDsOwjAQRO_iGln-RFqbkp4zWOvdNQ6gWIqTKuLuJFIKKGfem9lUwnWpae0yp5HVVdmoLr9lRnrJdBB-4vRomtq0zGPWh6JP2vW9sbxvp_t3ULHXfT049M5nZo9sgmUkzgwOAHxECEQQMErOMjAVz0EsSSx7JlOMM0F9vjkMObI:1nKeDP:Z-sVvsA_h5H2HtVyK4idavJwX2t4ogBwLhgSbAjoKUo','2022-03-03 10:40:47.010813'),('80umagseeha8747c27etpwohjfy5vvq4','.eJxVjDsOwjAQRO_iGln-RFqbkp4zWOvdNQ6gWIqTKuLuJFIKKGfem9lUwnWpae0yp5HVVdmoLr9lRnrJdBB-4vRomtq0zGPWh6JP2vW9sbxvp_t3ULHXfT049M5nZo9sgmUkzgwOAHxECEQQMErOMjAVz0EsSSx7JlOMM0F9vjkMObI:1nI1e9:Mp6Sl7-KH9SZkq5lWkydUMMrbIBs92fd89UaaXzcpmo','2022-02-24 05:05:33.122954'),('85lura5dpe62jrwbmv1gx9e3wwi8sgpy','.eJxVjL0OgzAQg98lcxUFjgDpVHXvM6DL3YXQ8iMRmKq-e4PEwmTZ_uyvkgmHUd3VFvcUH_3hNC2TuqkO9y12e5K1GzgTANfQI31kPhp-49wveTZv6-D1geizTfq1sIzPk70cREwxr0Ndl404Rms8SBZPFOoCKvC24NYa8VUwbRAunSuQwLBDJoslIYTGq98fmQhCIQ:1nKilI:fpwq3ieBuqX57IFYQcuW0mZ9RXaq4MfMXkmPBcqjAwE','2022-03-03 15:32:04.004298'),('8mluegyrema6mgruvmrj68f4p1c4xkci','.eJxVjDsOwjAQRO_iGln-RFqbkp4zWOvdNQ6gWIqTKuLuJFIKKGfem9lUwnWpae0yp5HVVdmoLr9lRnrJdBB-4vRomtq0zGPWh6JP2vW9sbxvp_t3ULHXfT049M5nZo9sgmUkzgwOAHxECEQQMErOMjAVz0EsSSx7JlOMM0F9vjkMObI:1nIZnZ:JOjbHLz0ECvobr6YuxiVUpMJFkG23fq-lXw6nGsg6OI','2022-02-25 17:33:33.798077'),('9cc5r7uk8mufgmoaxr9ulj46aukq1p7o','e30:1nFdZW:r-RCvgnvbDH6Z8D7hmPc1s1Q2tZ-d12rEIS9OC5Rfyc','2022-02-17 14:58:54.680438'),('9glpel3pb6axgu7c3dyw0hkrvb590j9h','.eJxVjDsOwyAQRO9CHSE-loBUUfqcAS27a0NiY8mfKsrdgyU3Lmfem_kKnqCM4i6AplIfw5EkzpO4iQj7luO-8hILNUOHa5kAP1wPQm-ow9xmdVtKkociT7rK10w8Pk_3cpBhzW3dGbDGJiILpLwmQErkjHPOBnAe0XkInBJ3hL0lzxo59C2j6pVRXvz-jT5CaA:1nLIBh:f41VakANjSClpR1a8S6-hcTaB8Odf4DOAdsvh1lxAQU','2022-03-05 05:21:41.744550'),('9x9uaiwt7onqfmkvavqkija2k1zzbwau','.eJxVjssKwyAQRf_FdRGjAbWr0n2_QcaZMbFNDOSxKv33KmTRLu_rcN8iwLGP4dh4DZnEVXReXH7NCPji0hJ6QhkWiUvZ1xxlq8gz3eRjIZ7uZ_cPMMI21nWvwWgTiQyQch0BUiSrrbXGg3WI1oHnGLknTIYcd8g-VY0qKa1chfIMeaoooDmX29BUfTOLzxeC7kJo:1nIs8d:5p3nKt1kbR3TgYkxBETanik1Q63RItsmUWtZs9L0eJA','2022-02-26 13:08:31.773357'),('a6ti1rmusqaf998yyi3nrnmpljsy6otf','.eJxVjDsOwjAQRO_iGln-RFqbkp4zWOvdNQ6gWIqTKuLuJFIKKGfem9lUwnWpae0yp5HVVdmoLr9lRnrJdBB-4vRomtq0zGPWh6JP2vW9sbxvp_t3ULHXfT049M5nZo9sgmUkzgwOAHxECEQQMErOMjAVz0EsSSx7JlOMM0F9vjkMObI:1nIjjf:RxEzge3s-12lkd6RKJRhZcV4GxLRq3Tt4FQkjWbU3Cc','2022-02-26 04:10:11.870164'),('aa8mm8s7l27xpwljrsbm5z4yrwbunkkx','e30:1nFKxm:Js-Tj_H0b5Pj_YbIEPEaaHLw1M6INKuTl-d2wQ4lfsU','2022-02-16 19:06:42.451972'),('bmk2z2wgswqaxwis9y8iizkn8j8m3vkc','eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1nL5tG:JJUvyhpyiCFif-LBszaMswQYuyX_0tPXRy7jAFKjG8w','2022-03-04 16:13:50.570655'),('depj5mtnpntinpezjvg71jcu504r2su3','eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1nLUTn:Lkx-EwkPENku5yOX81pelPIq7s9_6iaxkFxV9Lboqww','2022-03-05 18:29:11.991249'),('ejp9dcujbf4b8jq6klv0lm4z4u0qxqc7','eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1nJtDK:Yj3warO3cJhgrYzGudbdTuwIkQr81dghkM1B8VdmiLk','2022-03-01 08:29:34.429751'),('evggj6ag2sxg4i4s4vz59z4z9j0iuydz','.eJxVjDsOwjAQRO_iGln-RFqbkp4zWOvdNQ6gWIqTKuLuJFIKKGfem9lUwnWpae0yp5HVVdmoLr9lRnrJdBB-4vRomtq0zGPWh6JP2vW9sbxvp_t3ULHXfT049M5nZo9sgmUkzgwOAHxECEQQMErOMjAVz0EsSSx7JlOMM0F9vjkMObI:1nJ7IV:oK7Ea4dg5gyZz1mdcozjfpXe0RRXml_CWiqr9EsRRZQ','2022-02-27 05:19:43.519705'),('fc9o5yz2c1nmkrrymcj3uiwq6zazlt7e','e30:1nFsVw:qyVonQyxZ4pN1E04das4QKBz_IFHJvvvXVUWa0EyFNA','2022-02-18 06:56:12.780183'),('gx77dmv59f6zh18qe1rikavghsp5soi1','.eJxVjDsOwjAQRO_iGln-RFqbkp4zWOvdNQ6gWIqTKuLuJFIKKGfem9lUwnWpae0yp5HVVdmoLr9lRnrJdBB-4vRomtq0zGPWh6JP2vW9sbxvp_t3ULHXfT049M5nZo9sgmUkzgwOAHxECEQQMErOMjAVz0EsSSx7JlOMM0F9vjkMObI:1nI5tZ:rqzpeVpiCtaEdSf48zazBtP195ljQ4YL4HBVRJuUiBE','2022-02-24 09:37:45.094112'),('gxe6rc76ongl0dvulsq7ajuyuz4y2hv2','.eJxVjDsOwyAQRO9CHSE-loBUUfqcAS27a0NiY8mfKsrdgyU3Lmfem_kKnqCM4i6AplIfw5EkzpO4iQj7luO-8hILNUOHa5kAP1wPQm-ow9xmdVtKkociT7rK10w8Pk_3cpBhzW3dGbDGJiILpLwmQErkjHPOBnAe0XkInBJ3hL0lzxo59C2j6pVRXvz-jT5CaA:1nKHcw:R1PKNVoBYE4mTEFpor8clxGrXM8Ya7_4lqbBX31uQpE','2022-03-02 10:33:38.480916'),('h7zxzae7ya9pqnxi20lz66r9qsnqg5ra','eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1nH4i7:InOkVa4hAAgJjmhAEZrcYjqYlXILtRsqh0r_xHhzebs','2022-02-21 14:09:43.028574'),('i62z2mazb3zn8hnwtg3nknazzse3159w','e30:1nFL0x:F2Okbqmo-FAktWVknF_rSPOUR7-5-U4N9rMtuoAvwCM','2022-02-16 19:09:59.311787'),('iqqmorwy3pu205jf7d3phtzj3zdcpevi','.eJxVjDsOwyAQRO9CHSE-loBUUfqcAS27a0NiY8mfKsrdgyU3Lmfem_kKnqCM4i6AplIfw5EkzpO4iQj7luO-8hILNUOHa5kAP1wPQm-ow9xmdVtKkociT7rK10w8Pk_3cpBhzW3dGbDGJiILpLwmQErkjHPOBnAe0XkInBJ3hL0lzxo59C2j6pVRXvz-jT5CaA:1nJdmA:_XH-4QEXijlV9yt66_7L_Z5UiML-hfc7CDGCXZbjLmg','2022-02-28 16:00:30.226929'),('lkepj2gzc6qxrpojtby3l0xhfzab4qw0','eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1nM8Z8:PrR2Sb6HWiltPvoO7Zhf7obpoBoV1jxr1G8bDxWca3A','2022-03-07 13:17:22.511500'),('nc97sgs29z5la34v2lftcko6koiwhfol','.eJxVjDkOwjAQRe_iGln2OOOFkp4zWGNngtlslKVC3J1ESgHtf--_t4i0zCUuE4_x2oujgCAOv2OifOe6kf5G9dJkbnUer0luitzpJM-t58dpd_8ChaayvkmbAbDT1mgdnGXVMXrrMjAYwhSSZ6t81sqrQMkgOUOdVXZwgCYArtFXaZVjXZ6Jx7VowQM6RFDi8wVMpD6B:1nFZbh:pixosQ3QsTxqo-aSGQNFU6ksO_onV91U0EQkQ0QKDgU','2022-02-17 10:44:53.135024'),('nq4uzvfos054fhxwucgb4or79jgjtr6v','eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1nH8W1:bNUN6orPQDLCduRG9snMHDD4_FWuvv_Dw-qtBvvN8wM','2022-02-21 18:13:29.851724'),('o67vze5nvgob4uyco0cwvmbxvmn6wd35','.eJxVjDsOwjAQRO_iGln-RFqbkp4zWOvdNQ6gWIqTKuLuJFIKKGfem9lUwnWpae0yp5HVVdmoLr9lRnrJdBB-4vRomtq0zGPWh6JP2vW9sbxvp_t3ULHXfT049M5nZo9sgmUkzgwOAHxECEQQMErOMjAVz0EsSSx7JlOMM0F9vjkMObI:1nJ8yp:oYv5UskkAiBoiv5IY6fLbloaU2uqU68tVde9hjJOfhs','2022-02-27 07:07:31.158915'),('ohgrlx7e9hr5tmehd052e0s6x37qv1wi','.eJxVjL0OgzAQg98lcxUFjgDpVHXvM6DL3YXQ8iMRmKq-e4PEwmTZ_uyvkgmHUd3VFvcUH_3hNC2TuqkO9y12e5K1GzgTANfQI31kPhp-49wveTZv6-D1geizTfq1sIzPk70cREwxr0Ndl404Rms8SBZPFOoCKvC24NYa8VUwbRAunSuQwLBDJoslIYTGq98fmQhCIQ:1nM73j:9tg3qzxblojnORtuiG6Nfoa449hDqjAJNH0LgXnGOrg','2022-03-07 11:40:51.421161'),('psmm065kudw2do0265str1ads6p7trxq','e30:1nFL3r:0I3aKYCAUB2rSnrPjjpnrChcjRxOy07wVNFZDAEtaWM','2022-02-16 19:12:59.688917'),('qo3cclq4rnb6kw1ydm52mj3uc8ex5y28','.eJxVjDsOwyAQRO9CHSE-loBUUfqcAS27a0NiY8mfKsrdgyU3Lmfem_kKnqCM4i6AplIfw5EkzpO4iQj7luO-8hILNUOHa5kAP1wPQm-ow9xmdVtKkociT7rK10w8Pk_3cpBhzW3dGbDGJiILpLwmQErkjHPOBnAe0XkInBJ3hL0lzxo59C2j6pVRXvz-jT5CaA:1nINqi:mJbfrntVcFqwb1u8BwRBH8c8gfTyo0iltMDSRyYf0d0','2022-02-25 04:48:00.624606'),('rusff3qbky5utzqd6ic7nfudav0chufb','eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1nHRbb:MadKRCRWAMXLudgcSypbC3e8Kd8zNe6YoChr-WVhC3I','2022-02-22 14:36:31.964426'),('u5bdxdgwthxiakd39qrbvv53lww02ahj','eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1nJrxF:MPDr-wAF8E6glF7dbnhKm2cD0_okgOf-EFolJ79gko0','2022-03-01 07:08:53.116131'),('ue97vhlv7qq07ayl8eu3i9lkc1v5buv1','.eJxVjEEOgyAURO_CuiGCINBV033PYD78j9JaTETTRdO7VxI3LmfmvfkyekOa2JVB-aR8G2riYX6zC-thW8d-K7T0CXdCN-fSQ3hRrgs-IQ_zruV1SZ5XhB9r4Y8Zabof7OlghDJWG4U01knlySNqFVC2lprQdiYY6bRuYhdbKzECBK2MUJ0iMhGt8M4JxX5_ds1A6A:1nN62d:O-FxcOrFaJH-X-D2UWYJg_RUQp_5FOwCrJRVQNIe0cQ','2022-03-10 04:47:47.673018'),('w6mrrg9wzgk8ozfsq6mwaghn9q2cjrxh','.eJxVjDsOwyAQRO9CHSE-loBUUfqcAS27a0NiY8mfKsrdgyU3Lmfem_kKnqCM4i6AplIfw5EkzpO4iQj7luO-8hILNUOHa5kAP1wPQm-ow9xmdVtKkociT7rK10w8Pk_3cpBhzW3dGbDGJiILpLwmQErkjHPOBnAe0XkInBJ3hL0lzxo59C2j6pVRXvz-jT5CaA:1nMUru:tFBWqCRluC2Ln1utvbILTZH_OKBfhkukPrxl1cZagtU','2022-03-08 13:06:14.762436'),('wmhhvaf6hyiir3u6rzo3b7kgydm6djkf','.eJxVjDsOwjAQRO_iGln-RFqbkp4zWOvdNQ6gWIqTKuLuJFIKKGfem9lUwnWpae0yp5HVVdmoLr9lRnrJdBB-4vRomtq0zGPWh6JP2vW9sbxvp_t3ULHXfT049M5nZo9sgmUkzgwOAHxECEQQMErOMjAVz0EsSSx7JlOMM0F9vjkMObI:1nHe24:8Rr7FvEuQsvKCs_p8IOoOCK1bNfNQKuqLHfN1gWNxjw','2022-02-23 03:52:40.493779'),('wxugdzkbupa140nx3wdl2s48zx9ap76a','.eJxVjDsOwyAQRO9CHSE-loBUUfqcAS27a0NiY8mfKsrdgyU3Lmfem_kKnqCM4i6AplIfw5EkzpO4iQj7luO-8hILNUOHa5kAP1wPQm-ow9xmdVtKkociT7rK10w8Pk_3cpBhzW3dGbDGJiILpLwmQErkjHPOBnAe0XkInBJ3hL0lzxo59C2j6pVRXvz-jT5CaA:1nL2Eb:CEh5MTPrvMXHo-uIbbiqMvPK5sjkHIgUDC_u1UkpRQs','2022-03-04 12:19:37.348223'),('ysw3ivj4klqb5hd9m5wumejtyskujc2y','e30:1nFL44:hiqZa18kzsS4SK5Ouai0sDeUflUDP0K_bq1pEc050yg','2022-02-16 19:13:12.624038'),('yszk7vcmyqj2iybtfabiqp2ash7t58m6','.eJxVjDsOwjAQRO_iGln-RFqbkp4zWOvdNQ6gWIqTKuLuJFIKKGfem9lUwnWpae0yp5HVVdmoLr9lRnrJdBB-4vRomtq0zGPWh6JP2vW9sbxvp_t3ULHXfT049M5nZo9sgmUkzgwOAHxECEQQMErOMjAVz0EsSSx7JlOMM0F9vjkMObI:1nJIR6:N3aCkr1ysmgbKjD4kTV-ttcNQ64_bLkaBAJZvMwH3UM','2022-02-27 17:13:20.032254'),('yyy8db6h4s2f58e2het1y0df1f4s0lzo','e30:1nH56r:n5O3qTJrPFZVUsH5qf86vmxIBD6iuhrLnA8iuIhcOVs','2022-02-21 14:35:17.788219'),('z7rhq7vkcg48390opx3pl5iu9zpz9jhe','e30:1nFKxf:m84al_8gEo02RbHG8Qn08g-nl3A86jufRge-DBilxT8','2022-02-16 19:06:35.368786'),('zu5v7jp9a8ij6ywbjbcpvooro5gx0n4s','eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9:1nLqck:7J8rYApmand3A7W9237a01Stq-mJGh6NO_TiZwXIlAg','2022-03-06 18:07:54.973535');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_addresstable`
--

DROP TABLE IF EXISTS `orders_addresstable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_addresstable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address_line_1` varchar(100) NOT NULL,
  `address_line_2` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_addresstable_user_id_56370022_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `orders_addresstable_user_id_56370022_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_addresstable`
--

LOCK TABLES `orders_addresstable` WRITE;
/*!40000 ALTER TABLE `orders_addresstable` DISABLE KEYS */;
INSERT INTO `orders_addresstable` VALUES (5,'Thushad','T','6282575520','thush@gmail.com','Thommithazhe House','Mannarakkayam P.O','Kerala','Kanjirappally',NULL),(9,'Jiso','chacko','7025295396','jiso@gmail.com','Kadavanthara, Kochi','Opp Gokul Oottupura','Kerala','Kochi',NULL),(10,'Jiso','chacko','7025295396','jiso@gmail.com','Kadavanthara, Kochi','Opp Gokul Oottupura','Kerala','Kochi',NULL),(11,'Jiso','chacko','7025295396','jiso@gmail.com','Kadavanthara, Kochi','Opp Gokul Oottupura','Kerala','Kochi',NULL),(12,'Jiso','chacko','7025295396','jiso@gmail.com','Kadavanthara, Kochi','Opp Gokul Oottupura','Kerala','Kochi',NULL),(13,'Jiso','chacko','7025295396','jiso@gmail.com','Kadavanthara, Kochi','Opp Gokul Oottupura','Kerala','Kochi',NULL),(14,'Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',33),(15,'Lithin','CM,','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',33),(19,'aswinraj','kp','8129524358','aswinrajk37@gmail.com','kochi','padamugh','kerala','kochi',50);
/*!40000 ALTER TABLE `orders_addresstable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_coupon`
--

DROP TABLE IF EXISTS `orders_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_coupon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(20) NOT NULL,
  `coupon_offer` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_coupon`
--

LOCK TABLES `orders_coupon` WRITE;
/*!40000 ALTER TABLE `orders_coupon` DISABLE KEYS */;
INSERT INTO `orders_coupon` VALUES (1,'feb123',30),(2,'h',40),(3,'t',30),(4,'y',40),(5,'k',30),(6,'e',30),(7,'g',30),(8,'j',30);
/*!40000 ALTER TABLE `orders_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_number` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address_line_1` varchar(100) NOT NULL,
  `address_line_2` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `order_total` double NOT NULL,
  `status` varchar(10) NOT NULL,
  `is_ordered` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `payment_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `coupon_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_payment_id_46928ccc_fk_orders_payment_id` (`payment_id`),
  KEY `orders_order_user_id_e9b59eb1_fk_accounts_account_id` (`user_id`),
  KEY `orders_order_coupon_id_5bddb887_fk_orders_coupon_id` (`coupon_id`),
  CONSTRAINT `orders_order_coupon_id_5bddb887_fk_orders_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `orders_coupon` (`id`),
  CONSTRAINT `orders_order_payment_id_46928ccc_fk_orders_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `orders_payment` (`id`),
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
INSERT INTO `orders_order` VALUES (170,'20220217170','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',490,'New',0,'2022-02-17 09:55:53.170113','2022-02-17 09:55:53.174072',NULL,33,NULL),(171,'20220217171','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',490,'New',0,'2022-02-17 10:49:24.233109','2022-02-17 10:49:24.237402',NULL,33,NULL),(172,'20220217172','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',2450,'New',0,'2022-02-17 15:23:43.671694','2022-02-17 15:23:43.681129',NULL,33,NULL),(173,'20220217173','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',2450,'New',0,'2022-02-17 15:32:12.468376','2022-02-17 15:32:12.474583',NULL,33,NULL),(174,'20220217174','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',2450,'New',0,'2022-02-17 15:38:35.405817','2022-02-17 15:38:35.412358',NULL,33,NULL),(175,'20220217175','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',2450,'New',1,'2022-02-17 15:39:33.704229','2022-02-17 15:43:34.745400',19,33,NULL),(176,'20220217176','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',437,'New',1,'2022-02-17 17:52:23.752131','2022-02-17 17:52:48.899550',20,33,NULL),(177,'20220217177','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',437,'New',1,'2022-02-17 18:06:23.986132','2022-02-17 18:06:41.445954',21,33,NULL),(178,'20220218178','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',437,'New',1,'2022-02-17 18:46:30.849487','2022-02-17 18:47:01.621612',22,33,NULL),(179,'20220218179','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',437,'New',1,'2022-02-17 18:50:09.155591','2022-02-17 18:50:27.466655',23,33,NULL),(180,'20220218180','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',437,'New',1,'2022-02-18 03:14:07.737920','2022-02-18 03:14:26.964127',24,33,NULL),(181,'20220218181','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',490,'New',1,'2022-02-18 03:15:39.224672','2022-02-18 03:15:53.327931',25,33,NULL),(182,'20220218182','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',437,'New',1,'2022-02-18 03:19:36.181129','2022-02-18 03:19:47.922971',26,33,NULL),(183,'20220218183','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',1470,'New',1,'2022-02-18 03:20:41.840775','2022-02-18 03:20:54.822282',27,33,NULL),(184,'20220218184','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',1960,'New',0,'2022-02-18 07:42:56.606023','2022-02-18 07:42:56.614026',NULL,33,NULL),(185,'20220218185','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',1960,'New',0,'2022-02-18 08:03:44.341324','2022-02-18 08:03:44.347081',NULL,33,NULL),(186,'20220218186','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',490,'New',1,'2022-02-18 08:04:25.432772','2022-02-18 08:04:46.283404',28,33,NULL),(187,'20220218187','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',490,'New',1,'2022-02-18 08:06:31.878545','2022-02-18 08:06:44.188523',29,33,NULL),(188,'20220218188','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',437,'New',0,'2022-02-18 09:11:41.246632','2022-02-18 09:11:41.251046',NULL,33,NULL),(189,'20220218189','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',490,'New',0,'2022-02-18 09:23:20.335060','2022-02-18 09:23:20.338394',NULL,33,NULL),(190,'20220218190','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',490,'New',1,'2022-02-18 09:27:11.499530','2022-02-18 09:28:06.675039',30,33,NULL),(191,'20220218191','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',437,'New',1,'2022-02-18 09:28:37.824071','2022-02-18 09:28:52.744451',31,33,NULL),(192,'20220218192','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',490,'New',0,'2022-02-18 09:53:16.928667','2022-02-18 09:53:16.933631',NULL,33,NULL),(193,'20220218193','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',437,'New',0,'2022-02-18 09:54:15.217576','2022-02-18 09:54:15.221089',NULL,33,NULL),(194,'20220218194','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',437,'New',0,'2022-02-18 09:55:06.360039','2022-02-18 09:55:06.368354',NULL,33,NULL),(195,'20220218195','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',437,'New',0,'2022-02-18 09:57:53.775923','2022-02-18 09:57:53.781015',NULL,33,NULL),(196,'20220218196','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',437,'New',0,'2022-02-18 09:58:13.288214','2022-02-18 09:58:13.292931',NULL,33,NULL),(197,'20220218197','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',437,'New',1,'2022-02-18 10:00:41.661216','2022-02-18 10:01:19.009510',32,33,NULL),(198,'20220218198','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',437,'New',0,'2022-02-18 10:01:56.328520','2022-02-18 10:01:56.332284',NULL,33,NULL),(199,'20220218199','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',437,'New',1,'2022-02-18 10:02:07.366108','2022-02-18 10:02:21.779843',33,33,NULL),(200,'20220218200','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',490,'New',1,'2022-02-18 11:50:44.177602','2022-02-18 11:51:19.649561',34,33,NULL),(201,'20220218201','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',80,'New',1,'2022-02-18 12:20:50.188875','2022-02-18 12:21:09.700225',35,33,NULL),(202,'20220218202','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',490,'New',0,'2022-02-18 13:25:49.542631','2022-02-18 13:25:49.547462',NULL,33,NULL),(203,'20220218203','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',490,'New',1,'2022-02-18 13:26:19.754645','2022-02-18 13:26:40.918797',36,33,NULL),(204,'20220218204','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',980,'New',1,'2022-02-18 13:31:06.067581','2022-02-18 13:31:18.926808',37,33,NULL),(205,'20220219205','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',80,'New',0,'2022-02-19 08:51:24.577622','2022-02-19 08:51:24.585651',NULL,33,NULL),(206,'20220219206','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',80,'New',0,'2022-02-19 09:00:52.545135','2022-02-19 09:00:52.548990',NULL,33,NULL),(207,'20220219207','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',80,'New',0,'2022-02-19 09:01:08.198637','2022-02-19 09:01:08.203994',NULL,33,NULL),(208,'20220219208','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',80,'New',0,'2022-02-19 09:01:55.761425','2022-02-19 09:01:55.765300',NULL,33,NULL),(209,'20220219209','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',80,'New',0,'2022-02-19 09:02:12.740705','2022-02-19 09:02:12.746268',NULL,33,NULL),(210,'20220219210','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',80,'New',0,'2022-02-19 09:02:27.994329','2022-02-19 09:02:27.998346',NULL,33,NULL),(211,'20220219211','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',80,'New',0,'2022-02-19 09:02:55.563313','2022-02-19 09:02:55.569135',NULL,33,NULL),(212,'20220219212','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',80,'New',0,'2022-02-19 09:29:10.488117','2022-02-19 09:29:10.492105',NULL,33,NULL),(213,'20220219213','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-19 09:50:22.870048','2022-02-19 09:51:00.763510',38,33,NULL),(214,'20220220214','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:38:30.023732','2022-02-20 06:38:30.044485',NULL,33,NULL),(215,'20220220215','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:43:19.978888','2022-02-20 06:43:19.982726',NULL,33,NULL),(216,'20220220216','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:43:50.827760','2022-02-20 06:43:50.831493',NULL,33,NULL),(217,'20220220217','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:44:51.673066','2022-02-20 06:44:51.677197',NULL,33,NULL),(218,'20220220218','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:45:15.204956','2022-02-20 06:45:15.208357',NULL,33,NULL),(219,'20220220219','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:49:42.003608','2022-02-20 06:49:42.007151',NULL,33,NULL),(220,'20220220220','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:50:02.742592','2022-02-20 06:50:02.747468',NULL,33,NULL),(221,'20220220221','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:51:12.949094','2022-02-20 06:51:12.955670',NULL,33,NULL),(222,'20220220222','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:51:35.688813','2022-02-20 06:51:35.692746',NULL,33,NULL),(223,'20220220223','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:51:45.018574','2022-02-20 06:51:45.024120',NULL,33,NULL),(224,'20220220224','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:52:21.366142','2022-02-20 06:52:21.370592',NULL,33,NULL),(225,'20220220225','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:52:29.639268','2022-02-20 06:52:29.642399',NULL,33,NULL),(226,'20220220226','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:53:10.077308','2022-02-20 06:53:10.082539',NULL,33,NULL),(227,'20220220227','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:54:38.521261','2022-02-20 06:54:38.526192',NULL,33,NULL),(228,'20220220228','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:55:06.758505','2022-02-20 06:55:06.761436',NULL,33,NULL),(229,'20220220229','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:55:15.959160','2022-02-20 06:55:15.965872',NULL,33,NULL),(230,'20220220230','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:55:45.826583','2022-02-20 06:55:45.830073',NULL,33,NULL),(231,'20220220231','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:56:05.969058','2022-02-20 06:56:05.972313',NULL,33,NULL),(232,'20220220232','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:56:20.107100','2022-02-20 06:56:20.111916',NULL,33,NULL),(233,'20220220233','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:56:32.018875','2022-02-20 06:56:32.023299',NULL,33,NULL),(234,'20220220234','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:56:40.068473','2022-02-20 06:56:40.072818',NULL,33,NULL),(235,'20220220235','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:57:19.477186','2022-02-20 06:57:19.485182',NULL,33,NULL),(236,'20220220236','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:58:08.661461','2022-02-20 06:58:08.665083',NULL,33,NULL),(237,'20220220237','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:59:12.808523','2022-02-20 06:59:12.813154',NULL,33,NULL),(238,'20220220238','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 06:59:28.298058','2022-02-20 06:59:28.302583',NULL,33,NULL),(239,'20220220239','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 07:45:36.236940','2022-02-20 07:45:36.242270',NULL,33,NULL),(240,'20220220240','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 07:50:40.649506','2022-02-20 07:50:40.656997',NULL,33,NULL),(241,'20220220241','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 08:44:12.243297','2022-02-20 08:44:12.247599',NULL,33,NULL),(242,'20220220242','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 08:46:44.205122','2022-02-20 08:46:44.210089',NULL,33,NULL),(243,'20220220243','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 08:47:17.282695','2022-02-20 08:47:17.287426',NULL,33,NULL),(244,'20220220244','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',160,'New',0,'2022-02-20 08:47:35.595099','2022-02-20 08:47:35.600471',NULL,33,NULL),(245,'20220220245','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',160,'New',0,'2022-02-20 08:48:28.121885','2022-02-20 08:48:28.125384',NULL,33,NULL),(246,'20220220246','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',160,'New',0,'2022-02-20 08:48:35.646567','2022-02-20 08:48:35.650297',NULL,33,NULL),(247,'20220220247','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',160,'New',0,'2022-02-20 08:49:04.899980','2022-02-20 08:49:04.904328',NULL,33,NULL),(248,'20220220248','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',160,'New',0,'2022-02-20 08:49:46.557492','2022-02-20 08:49:46.564506',NULL,33,NULL),(249,'20220220249','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 08:53:44.389109','2022-02-20 08:53:44.393036',NULL,33,NULL),(250,'20220220250','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-20 08:54:49.160260','2022-02-20 08:55:02.054140',39,33,NULL),(251,'20220220251','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 08:56:18.453041','2022-02-20 08:56:18.456796',NULL,33,NULL),(252,'20220220252','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',240,'New',1,'2022-02-20 09:05:33.205580','2022-02-20 09:05:54.115464',40,33,NULL),(253,'20220220253','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-20 10:11:27.168394','2022-02-20 10:11:27.172013',NULL,33,NULL),(254,'20220220254','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-20 10:11:52.250415','2022-02-20 10:12:21.540283',41,33,NULL),(255,'20220220255','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-20 10:12:36.411353','2022-02-20 10:12:57.635286',42,33,NULL),(256,'20220220256','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',160,'New',1,'2022-02-20 10:15:22.831397','2022-02-20 10:15:30.423479',43,33,NULL),(257,'20220220257','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',80,'New',1,'2022-02-20 10:16:29.447935','2022-02-20 10:16:35.836026',44,33,NULL),(258,'20220220258','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-20 10:18:01.089126','2022-02-20 10:18:05.614132',45,33,NULL),(259,'20220220259','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-20 10:37:48.888527','2022-02-20 10:37:56.011480',46,33,NULL),(260,'20220220260','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-20 10:38:13.964004','2022-02-20 10:38:34.244282',47,33,NULL),(261,'20220221261','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',90,'New',1,'2022-02-21 03:48:17.290589','2022-02-21 03:48:26.704107',48,33,NULL),(262,'20220221262','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',37,'New',0,'2022-02-21 11:35:53.589214','2022-02-21 11:35:53.594711',NULL,33,NULL),(263,'20220221263','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',154,'New',1,'2022-02-21 11:37:10.415945','2022-02-21 11:37:32.115654',49,33,NULL),(264,'20220221264','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',35,'New',1,'2022-02-21 12:22:41.795524','2022-02-21 12:22:46.982152',50,33,NULL),(265,'20220221265','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',37,'New',0,'2022-02-21 14:35:54.116185','2022-02-21 14:35:54.120500',NULL,33,NULL),(266,'20220221266','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',37,'New',0,'2022-02-21 16:07:59.826684','2022-02-21 16:07:59.830892',NULL,33,NULL),(267,'20220221267','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',37,'New',0,'2022-02-21 16:13:26.969083','2022-02-21 16:13:26.972478',NULL,33,NULL),(268,'20220221268','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',37,'New',0,'2022-02-21 16:13:42.837478','2022-02-21 16:13:42.841754',NULL,33,NULL),(269,'20220221269','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',37,'New',0,'2022-02-21 16:18:17.697302','2022-02-21 16:18:17.702172',NULL,33,NULL),(270,'20220221270','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',37,'New',0,'2022-02-21 16:19:46.088128','2022-02-21 16:19:46.093440',NULL,33,NULL),(271,'20220221271','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',37,'New',0,'2022-02-21 16:20:48.824009','2022-02-21 16:20:48.829945',NULL,33,NULL),(272,'20220221272','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',37,'New',0,'2022-02-21 16:27:45.757879','2022-02-21 16:27:45.764597',NULL,33,NULL),(273,'20220221273','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',37,'New',0,'2022-02-21 16:28:56.069806','2022-02-21 16:28:56.075218',NULL,33,NULL),(274,'20220222274','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',74,'New',0,'2022-02-22 02:40:25.329141','2022-02-22 02:40:25.334690',NULL,33,NULL),(275,'20220222275','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',74,'New',0,'2022-02-22 02:44:43.500842','2022-02-22 02:44:43.509378',NULL,33,NULL),(276,'20220222276','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',74,'New',0,'2022-02-22 02:44:56.847679','2022-02-22 02:44:56.855134',NULL,33,NULL),(277,'20220222277','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',74,'New',0,'2022-02-22 02:46:00.017725','2022-02-22 02:46:00.023977',NULL,33,NULL),(278,'20220222278','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',74,'New',0,'2022-02-22 03:03:03.838480','2022-02-22 03:03:03.846686',NULL,33,NULL),(279,'20220222279','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',74,'New',1,'2022-02-22 03:08:19.489577','2022-02-22 03:08:43.390198',51,33,NULL),(280,'20220222280','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',78,'New',1,'2022-02-22 03:10:50.709468','2022-02-22 03:11:09.867492',52,33,NULL),(281,'20220222281','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-22 03:12:54.173568','2022-02-22 03:13:15.012041',53,33,NULL),(282,'20220222282','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-22 03:15:17.234016','2022-02-22 03:15:56.228924',54,33,NULL),(283,'20220222283','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-22 03:16:52.965585','2022-02-22 03:17:09.936775',55,33,NULL),(284,'20220222284','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',35,'New',0,'2022-02-22 03:17:40.121276','2022-02-22 03:17:40.126892',NULL,33,NULL),(285,'20220222285','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',35,'New',0,'2022-02-22 03:18:11.025256','2022-02-22 03:18:11.031809',NULL,33,NULL),(286,'20220222286','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-22 03:18:31.017165','2022-02-22 03:18:31.023187',NULL,33,NULL),(287,'20220222287','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',0,'2022-02-22 03:20:42.747734','2022-02-22 03:20:42.755238',NULL,33,NULL),(288,'20220222288','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-22 03:22:55.728155','2022-02-22 03:23:00.795038',56,33,NULL),(289,'20220222289','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-22 03:24:52.891381','2022-02-22 03:24:55.637934',57,33,NULL),(290,'20220222290','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-22 03:25:16.580851','2022-02-22 03:25:30.795108',58,33,NULL),(291,'20220222291','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',78,'New',1,'2022-02-22 03:27:23.942169','2022-02-22 03:27:46.587484',59,33,NULL),(292,'20220222292','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',78,'New',1,'2022-02-22 03:29:27.147097','2022-02-22 03:29:45.843252',60,33,NULL),(293,'20220222293','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-22 03:30:06.587248','2022-02-22 03:30:18.929026',61,33,NULL),(294,'20220222294','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',734,'New',1,'2022-02-22 03:31:45.481535','2022-02-22 03:32:01.896877',62,33,NULL),(295,'20220222295','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-22 10:08:18.857061','2022-02-22 10:08:38.323232',63,33,NULL),(296,'20220222296','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',80,'New',1,'2022-02-22 10:09:03.086910','2022-02-22 10:09:07.733895',64,33,NULL),(297,'20220222297','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',80,'New',0,'2022-02-22 11:06:28.367345','2022-02-22 11:06:28.373946',NULL,33,NULL),(298,'20220222298','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',553,'New',0,'2022-02-22 12:55:04.251902','2022-02-22 12:55:04.258600',NULL,33,NULL),(299,'20220222299','abhijith','dsfh','7025295396','abhi@gmail.com','kochi,ernakulam','padamughal p.o kerala','kerala','kochi',610,'New',0,'2022-02-22 13:26:29.611453','2022-02-22 13:26:29.620418',NULL,33,NULL),(300,'20220222300','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',610,'New',0,'2022-02-22 13:56:51.086649','2022-02-22 13:56:51.094635',NULL,33,NULL),(301,'20220222301','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',610,'New',0,'2022-02-22 13:57:13.032435','2022-02-22 13:57:13.040321',NULL,33,NULL),(302,'20220222302','Lithin','CM','6282575520','lithin@gmail.com','kannur district, Thalipparambu','Thalipparambu p.o','Kerala','Kannur',125,'New',0,'2022-02-22 14:41:50.494638','2022-02-22 14:41:50.501855',NULL,33,NULL),(303,'20220222303','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',125,'New',0,'2022-02-22 14:53:33.872289','2022-02-22 14:53:33.877429',NULL,33,NULL),(304,'20220222304','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',125,'New',0,'2022-02-22 14:53:45.337514','2022-02-22 14:53:45.343351',NULL,33,NULL),(305,'20220223305','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 02:16:52.043420','2022-02-23 02:16:52.049901',NULL,33,NULL),(306,'20220223306','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 02:21:24.362798','2022-02-23 02:21:24.368143',NULL,33,NULL),(307,'20220223307','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 02:21:32.618778','2022-02-23 02:21:32.622052',NULL,33,NULL),(308,'20220223308','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 02:21:33.082702','2022-02-23 02:21:33.086398',NULL,33,NULL),(309,'20220223309','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 02:21:33.330239','2022-02-23 02:21:33.335398',NULL,33,NULL),(310,'20220223310','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 02:21:33.578561','2022-02-23 02:21:33.583367',NULL,33,NULL),(311,'20220223311','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 02:21:34.022850','2022-02-23 02:21:34.026871',NULL,33,NULL),(312,'20220223312','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 02:21:34.214808','2022-02-23 02:21:34.217876',NULL,33,NULL),(313,'20220223313','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',1,'2022-02-23 02:21:34.496209','2022-02-23 02:21:47.913478',65,33,NULL),(314,'20220223314','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',35,'New',0,'2022-02-23 02:26:48.361691','2022-02-23 02:26:48.367578',NULL,33,NULL),(315,'20220223315','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',35,'New',0,'2022-02-23 02:33:10.791531','2022-02-23 02:33:10.797276',NULL,33,NULL),(316,'20220223316','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',35,'New',0,'2022-02-23 02:33:15.453676','2022-02-23 02:33:15.457053',NULL,33,NULL),(317,'20220223317','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',10.5,'New',0,'2022-02-23 02:41:09.709902','2022-02-23 02:41:09.713520',NULL,33,NULL),(318,'20220223318','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',24.5,'New',1,'2022-02-23 02:41:58.395705','2022-02-23 02:42:30.832352',66,33,NULL),(319,'20220223319','shahin','s','7025295396','s@gmail.com','kochi, pagamughal','main road 34','kerala','kochi',54.6,'New',1,'2022-02-23 02:43:48.361564','2022-02-23 02:44:00.550141',67,33,NULL),(320,'20220223320','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',24.5,'New',1,'2022-02-23 02:44:31.694367','2022-02-23 02:44:36.391578',68,33,NULL),(321,'20220223321','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',62.3,'New',0,'2022-02-23 03:05:18.204248','2022-02-23 03:05:18.210616',NULL,33,NULL),(322,'20220223322','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',62.3,'New',0,'2022-02-23 03:08:14.600506','2022-02-23 03:08:14.604758',NULL,33,NULL),(323,'20220223323','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',89,'New',0,'2022-02-23 03:19:25.125073','2022-02-23 03:19:25.129294',NULL,33,NULL),(324,'20220223324','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',62.3,'New',0,'2022-02-23 03:24:16.605914','2022-02-23 03:24:16.613999',NULL,33,NULL),(325,'20220223325','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',62.3,'New',0,'2022-02-23 03:27:10.851669','2022-02-23 03:27:10.856086',NULL,33,NULL),(326,'20220223326','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',24.5,'New',0,'2022-02-23 03:37:09.051025','2022-02-23 03:37:09.056254',NULL,33,NULL),(327,'20220223327','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',24.5,'New',0,'2022-02-23 03:44:06.985888','2022-02-23 03:44:06.990965',NULL,33,NULL),(328,'20220223328','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',24.5,'New',1,'2022-02-23 03:44:22.431501','2022-02-23 03:45:17.074384',69,33,NULL),(329,'20220223329','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',54.6,'New',1,'2022-02-23 04:20:47.545654','2022-02-23 04:21:34.417169',70,33,NULL),(330,'20220223330','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',63,'New',0,'2022-02-23 04:25:47.793246','2022-02-23 04:25:47.798617',NULL,33,NULL),(331,'20220223331','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',63,'New',1,'2022-02-23 04:27:22.737307','2022-02-23 04:29:08.301902',71,33,1),(332,'20220223332','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',46.8,'New',1,'2022-02-23 04:34:59.290597','2022-02-23 04:35:15.749426',72,33,2),(333,'20220223333','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',71.2,'New',0,'2022-02-23 04:37:15.546655','2022-02-23 04:37:15.553922',NULL,33,NULL),(334,'20220223334','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',71.2,'New',0,'2022-02-23 04:38:00.859314','2022-02-23 04:38:00.863510',NULL,33,NULL),(335,'20220223335','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',71.2,'New',0,'2022-02-23 04:42:36.982846','2022-02-23 04:42:36.990512',NULL,33,NULL),(336,'20220223336','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',71.2,'New',1,'2022-02-23 04:43:13.094417','2022-02-23 04:44:01.106056',73,33,3),(337,'20220223337','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',53.4,'New',1,'2022-02-23 04:49:12.549994','2022-02-23 04:49:50.965344',74,33,4),(338,'20220223338','fdsfdfd','dffd','7025295396','df@gmail.com','fdsfdfdsffd','fsfff','dffdff','dffd',78,'New',0,'2022-02-23 06:21:52.976035','2022-02-23 06:21:52.989108',NULL,33,NULL),(339,'20220223339','Thushad','T','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 07:29:07.176039','2022-02-23 07:29:07.184508',NULL,33,NULL),(340,'20220223340','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 07:33:58.309100','2022-02-23 07:33:58.312723',NULL,33,NULL),(341,'20220223341','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 07:35:44.462045','2022-02-23 07:35:44.465569',NULL,33,NULL),(342,'20220223342','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 07:36:02.047378','2022-02-23 07:36:02.051078',NULL,33,NULL),(343,'20220223343','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 07:36:14.058479','2022-02-23 07:36:14.064361',NULL,33,NULL),(344,'20220223344','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 07:36:41.198407','2022-02-23 07:36:41.203230',NULL,33,NULL),(345,'20220223345','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 07:36:50.678215','2022-02-23 07:36:50.684899',NULL,33,NULL),(346,'20220223346','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 07:37:04.935612','2022-02-23 07:37:04.940832',NULL,33,NULL),(347,'20220223347','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 07:37:22.992431','2022-02-23 07:37:22.995552',NULL,33,NULL),(348,'20220223348','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 07:37:33.488711','2022-02-23 07:37:33.491916',NULL,33,NULL),(349,'20220223349','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',78,'New',0,'2022-02-23 07:37:57.508137','2022-02-23 07:37:57.512927',NULL,33,NULL),(350,'20220223350','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',54.6,'New',0,'2022-02-23 07:38:37.757097','2022-02-23 07:38:37.764229',NULL,33,NULL),(351,'20220223351','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',54.6,'New',1,'2022-02-23 07:38:49.066108','2022-02-23 07:39:08.854195',75,33,5),(352,'20220223352','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 09:39:32.608645','2022-02-23 09:39:32.615938',NULL,33,NULL),(353,'20220223353','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 09:43:48.593373','2022-02-23 09:43:48.598457',NULL,33,NULL),(354,'20220223354','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 09:43:51.818571','2022-02-23 09:43:51.824112',NULL,33,NULL),(355,'20220223355','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 09:44:15.898463','2022-02-23 09:44:15.902449',NULL,33,NULL),(356,'20220223356','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 09:44:38.678476','2022-02-23 09:44:38.683769',NULL,33,NULL),(357,'20220223357','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 09:47:40.129806','2022-02-23 09:47:40.136740',NULL,33,NULL),(358,'20220223358','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 10:02:52.628585','2022-02-23 10:02:52.633899',NULL,33,NULL),(359,'20220223359','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 10:05:52.820548','2022-02-23 10:05:52.825362',NULL,33,NULL),(360,'20220223360','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',63,'New',0,'2022-02-23 10:08:28.900105','2022-02-23 10:08:28.907759',NULL,33,NULL),(361,'20220223361','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',63,'New',0,'2022-02-23 10:08:40.492981','2022-02-23 10:08:40.500128',NULL,33,NULL),(362,'20220223362','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 11:39:20.926317','2022-02-23 11:39:20.930383',NULL,33,NULL),(363,'20220223363','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',63,'New',1,'2022-02-23 11:39:42.820167','2022-02-23 11:40:01.518372',76,33,6),(364,'20220223364','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 12:54:19.089452','2022-02-23 12:54:19.097545',NULL,33,NULL),(365,'20220223365','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 13:07:23.539122','2022-02-23 13:07:23.542924',NULL,33,NULL),(366,'20220223366','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 13:08:01.185187','2022-02-23 13:08:01.189343',NULL,33,NULL),(367,'20220223367','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 13:09:53.985940','2022-02-23 13:09:53.990509',NULL,33,NULL),(368,'20220223368','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 13:10:42.814603','2022-02-23 13:10:42.818454',NULL,33,NULL),(369,'20220223369','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 13:11:15.999605','2022-02-23 13:11:16.003961',NULL,33,NULL),(370,'20220223370','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 13:12:52.756886','2022-02-23 13:12:52.761899',NULL,33,NULL),(371,'20220223371','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 13:13:20.630826','2022-02-23 13:13:20.636770',NULL,33,NULL),(372,'20220223372','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',0,'2022-02-23 13:13:53.237473','2022-02-23 13:13:53.242804',NULL,33,NULL),(373,'20220223373','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',90,'New',1,'2022-02-23 13:15:05.523655','2022-02-23 13:15:08.427299',77,33,NULL),(374,'20220223374','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',25.9,'New',1,'2022-02-23 13:16:16.833453','2022-02-23 13:16:37.093563',78,33,NULL),(375,'20220223375','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',25.9,'New',1,'2022-02-23 13:17:09.339187','2022-02-23 13:17:27.903694',79,33,8),(376,'20220223376','Thushad','T,','6282575520','thushad@gmail.com','kochi,ernakulam','padamughal p.o','kerala','kochi',37,'New',1,'2022-02-23 13:18:41.814991','2022-02-23 13:18:47.990753',80,33,NULL),(377,'20220224377','aswinraj','kp','8129524358','aswinrajk37@gmail.com','kochi','padamugh','kerala','kochi',1260,'New',0,'2022-02-24 04:40:50.945333','2022-02-24 04:40:50.957369',NULL,50,NULL),(378,'20220224378','aswinraj','kp','8129524358','aswinrajk37@gmail.com','kochi','padamugh','kerala','kochi',1260,'New',0,'2022-02-24 04:42:55.476088','2022-02-24 04:42:55.486575',NULL,50,NULL),(379,'20220224379','aswinraj','kp','8129524358','aswinrajk37@gmail.com','kochi','padamugh','kerala','kochi',1260,'New',1,'2022-02-24 04:43:26.888116','2022-02-24 04:45:19.735197',81,50,NULL);
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderproduct`
--

DROP TABLE IF EXISTS `orders_orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderproduct` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_price` double NOT NULL,
  `ordered` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_id` bigint NOT NULL,
  `payment_id` bigint DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `delivery_status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderproduct_order_id_5022a3e2_fk_orders_order_id` (`order_id`),
  KEY `orders_orderproduct_payment_id_492ed997_fk_orders_payment_id` (`payment_id`),
  KEY `orders_orderproduct_product_id_4d6ac024_fk_store_product_id` (`product_id`),
  KEY `orders_orderproduct_user_id_1e7a7ab7_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `orders_orderproduct_order_id_5022a3e2_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_orderproduct_payment_id_492ed997_fk_orders_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `orders_payment` (`id`),
  CONSTRAINT `orders_orderproduct_product_id_4d6ac024_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  CONSTRAINT `orders_orderproduct_user_id_1e7a7ab7_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderproduct`
--

LOCK TABLES `orders_orderproduct` WRITE;
/*!40000 ALTER TABLE `orders_orderproduct` DISABLE KEYS */;
INSERT INTO `orders_orderproduct` VALUES (46,1,90,1,'2022-02-21 03:48:26.724831','2022-02-22 11:46:27.509714',261,48,48,33,'delivered'),(47,2,37,1,'2022-02-21 11:37:32.123843','2022-02-23 08:21:50.035559',263,49,46,33,'shipped'),(49,1,35,1,'2022-02-21 12:22:47.003126','2022-02-21 12:22:47.035100',264,50,44,33,'Pending'),(50,2,37,1,'2022-02-22 03:08:43.405267','2022-02-22 03:08:43.442334',279,51,46,33,'Pending'),(51,1,78,1,'2022-02-22 03:11:09.878135','2022-02-22 03:11:09.899309',280,52,49,33,'Pending'),(58,1,78,1,'2022-02-22 03:27:46.606583','2022-02-22 03:27:46.631208',291,59,49,33,'Pending'),(59,1,78,1,'2022-02-22 03:29:45.853654','2022-02-22 03:29:45.884881',292,60,49,33,'Pending'),(61,3,78,1,'2022-02-22 03:32:01.904502','2022-02-22 03:32:01.918736',294,62,49,33,'Pending'),(62,4,90,1,'2022-02-22 03:32:01.932360','2022-02-22 03:32:01.947784',294,62,48,33,'Pending'),(63,4,35,1,'2022-02-22 03:32:01.960019','2022-02-22 03:32:01.978065',294,62,44,33,'Pending'),(66,1,78,1,'2022-02-23 02:21:47.927655','2022-02-23 08:18:59.018814',313,65,49,33,'pending'),(67,1,35,1,'2022-02-23 02:42:30.840714','2022-02-23 02:42:30.858860',318,66,44,33,'Pending'),(68,1,78,1,'2022-02-23 02:44:00.558562','2022-02-23 02:44:00.575363',319,67,49,33,'Pending'),(69,1,35,1,'2022-02-23 02:44:36.402598','2022-02-23 02:44:36.421017',320,68,44,33,'Pending'),(70,1,35,1,'2022-02-23 03:45:17.085482','2022-02-23 03:45:17.104705',328,69,44,33,'Pending'),(71,1,78,1,'2022-02-23 04:21:34.428933','2022-02-23 08:18:33.059564',329,70,49,33,'pending'),(72,1,90,1,'2022-02-23 04:29:08.315963','2022-02-23 08:17:44.337504',331,71,48,33,'delivered'),(73,1,78,1,'2022-02-23 04:35:15.756313','2022-02-23 08:17:34.939008',332,72,49,33,'delivered'),(74,1,89,1,'2022-02-23 04:44:01.117372','2022-02-23 08:17:28.440547',336,73,50,33,'admin cancelled'),(75,1,89,1,'2022-02-23 04:49:50.986500','2022-02-23 08:17:01.117850',337,74,51,33,'admin cancelled'),(76,1,78,1,'2022-02-23 07:39:08.866766','2022-02-23 08:00:04.628558',351,75,49,33,'admin cancelled'),(77,1,90,1,'2022-02-23 11:40:01.529559','2022-02-23 11:40:01.550394',363,76,48,33,'Pending'),(78,1,90,1,'2022-02-23 13:15:08.439476','2022-02-23 13:15:08.460986',373,77,48,33,'Pending'),(79,1,37,1,'2022-02-23 13:16:37.102281','2022-02-23 13:16:37.121390',374,78,46,33,'Pending'),(80,1,37,1,'2022-02-23 13:17:27.912395','2022-02-23 13:17:27.933600',375,79,46,33,'Pending'),(81,1,37,1,'2022-02-23 13:18:48.006594','2022-02-23 13:18:48.033372',376,80,46,33,'Pending'),(82,36,35,1,'2022-02-24 04:45:19.746116','2022-02-24 04:45:19.771404',379,81,44,50,'Pending');
/*!40000 ALTER TABLE `orders_orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderproduct_variations`
--

DROP TABLE IF EXISTS `orders_orderproduct_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderproduct_variations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderproduct_id` bigint NOT NULL,
  `variation_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_orderproduct_vari_orderproduct_id_variatio_8c028ee7_uniq` (`orderproduct_id`,`variation_id`),
  KEY `orders_orderproduct__variation_id_5dfd0e51_fk_store_var` (`variation_id`),
  CONSTRAINT `orders_orderproduct__orderproduct_id_0f116a3b_fk_orders_or` FOREIGN KEY (`orderproduct_id`) REFERENCES `orders_orderproduct` (`id`),
  CONSTRAINT `orders_orderproduct__variation_id_5dfd0e51_fk_store_var` FOREIGN KEY (`variation_id`) REFERENCES `store_variation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderproduct_variations`
--

LOCK TABLES `orders_orderproduct_variations` WRITE;
/*!40000 ALTER TABLE `orders_orderproduct_variations` DISABLE KEYS */;
INSERT INTO `orders_orderproduct_variations` VALUES (87,46,34),(88,46,36),(90,47,38),(89,47,41),(93,49,52),(94,49,54),(96,50,38),(95,50,41),(98,51,47),(97,51,49),(112,58,47),(111,58,50),(114,59,47),(113,59,49),(118,61,47),(117,61,49),(119,62,34),(120,62,36),(121,63,52),(122,63,54),(128,66,47),(127,66,49),(129,67,53),(130,67,54),(132,68,47),(131,68,49),(133,69,52),(134,69,54),(135,70,52),(136,70,54),(138,71,47),(137,71,49),(139,72,34),(140,72,36),(142,73,47),(141,73,49),(143,74,43),(144,74,44),(145,75,57),(146,75,59),(148,76,47),(147,76,49),(149,77,34),(150,77,36),(151,78,34),(152,78,36),(154,79,38),(153,79,41),(156,80,38),(155,80,41),(158,81,38),(157,81,41),(159,82,52),(160,82,55);
/*!40000 ALTER TABLE `orders_orderproduct_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_payment`
--

DROP TABLE IF EXISTS `orders_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount_paid` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_payment_user_id_cfa9f321_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `orders_payment_user_id_cfa9f321_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_payment`
--

LOCK TABLES `orders_payment` WRITE;
/*!40000 ALTER TABLE `orders_payment` DISABLE KEYS */;
INSERT INTO `orders_payment` VALUES (10,'2WR6427272495074N','PayPal','842.0','COMPLETED','2022-02-14 06:00:18.284671',33),(11,'0KU090905N344135S','PayPal','7702.0','COMPLETED','2022-02-14 16:05:20.341085',33),(12,'9D7525268K970751J','PayPal','704.0','COMPLETED','2022-02-16 04:55:02.906715',33),(13,'9RE74934AU401970P','PayPal','352.0','COMPLETED','2022-02-16 07:42:39.657833',33),(14,'59F201154S152032C','PayPal','2940.0','COMPLETED','2022-02-16 11:42:45.361717',33),(15,'3J950096YL687925H','PayPal','162.0','COMPLETED','2022-02-16 13:46:32.121977',33),(16,'6UB095659W680625P','PayPal','927.0','COMPLETED','2022-02-17 07:56:06.943322',33),(17,'6W1279726P447170V','PayPal','437.0','COMPLETED','2022-02-17 08:11:21.137750',33),(18,'5M736473DU2268945','PayPal','437.0','COMPLETED','2022-02-17 08:18:53.857927',33),(19,'9MN07465LT3306545','PayPal','2450.0','COMPLETED','2022-02-17 15:43:34.741285',33),(20,'7D053819ME922040L','PayPal','437.0','COMPLETED','2022-02-17 17:52:48.892926',33),(21,'0B828043LG494741S','PayPal','437.0','COMPLETED','2022-02-17 18:06:41.440995',33),(22,'053666586G276002M','PayPal','437.0','COMPLETED','2022-02-17 18:47:01.618299',33),(23,'7BW38907Y6045284L','PayPal','437.0','COMPLETED','2022-02-17 18:50:27.462443',33),(24,'24L19125NA1804041','PayPal','437.0','COMPLETED','2022-02-18 03:14:26.956418',33),(25,'8MV04256196079847','PayPal','490.0','COMPLETED','2022-02-18 03:15:53.320930',33),(26,'0HT0549526679382G','PayPal','437.0','COMPLETED','2022-02-18 03:19:47.916515',33),(27,'3SM65773K66797702','PayPal','1470.0','COMPLETED','2022-02-18 03:20:54.814940',33),(28,'12V32737TD603264F','PayPal','490.0','COMPLETED','2022-02-18 08:04:46.277689',33),(29,'0DK80644NP647031U','PayPal','490.0','COMPLETED','2022-02-18 08:06:44.181440',33),(30,'8NM194651Y9000637','PayPal','490.0','COMPLETED','2022-02-18 09:28:06.669706',33),(31,'28682658F39354422','PayPal','437.0','COMPLETED','2022-02-18 09:28:52.740859',33),(32,'66T20745P3021822R','PayPal','437.0','COMPLETED','2022-02-18 10:01:19.004884',33),(33,'1Y6305783E500124G','PayPal','437.0','COMPLETED','2022-02-18 10:02:21.776029',33),(34,'50092768D08992328','PayPal','490.0','COMPLETED','2022-02-18 11:51:19.645126',33),(35,'9XB478319R235791B','PayPal','80.0','COMPLETED','2022-02-18 12:21:09.695136',33),(36,'83A49595EG622780W','PayPal','490.0','COMPLETED','2022-02-18 13:26:40.911115',33),(37,'5X308205YE3600452','PayPal','980.0','COMPLETED','2022-02-18 13:31:18.922248',33),(38,'38U46533VP124921V','PayPal','80.0','COMPLETED','2022-02-19 09:51:00.757363',33),(39,'1UK53577D2141502S','PayPal','80.0','COMPLETED','2022-02-20 08:55:02.047954',33),(40,'8C0407966G838112N','PayPal','240.0','COMPLETED','2022-02-20 09:05:54.106518',33),(41,'5U941644LK2753702','PayPal','80.0','COMPLETED','2022-02-20 10:12:21.535918',33),(42,'','cash on delivery','80.0','pending','2022-02-20 10:12:57.630318',33),(43,'','cash on delivery','160.0','pending','2022-02-20 10:15:30.416518',33),(44,'','cash on delivery','80.0','pending','2022-02-20 10:16:35.829236',33),(45,'','cash on delivery','80.0','pending','2022-02-20 10:18:05.609633',33),(46,'','cash on delivery','80.0','pending','2022-02-20 10:37:56.007841',33),(47,'8LV165506C3631930','PayPal','80.0','COMPLETED','2022-02-20 10:38:34.240703',33),(48,'','cash on delivery','90.0','pending','2022-02-21 03:48:26.689860',33),(49,'82G37319B2810641P','PayPal','154.0','COMPLETED','2022-02-21 11:37:32.110091',33),(50,'','cash on delivery','35.0','pending','2022-02-21 12:22:46.974984',33),(51,NULL,'razorpay','74.0','completed','2022-02-22 03:08:43.382452',33),(52,NULL,'razorpay','78.0','completed','2022-02-22 03:11:09.862885',33),(53,NULL,'razorpay','80.0','completed','2022-02-22 03:13:15.007835',33),(54,NULL,'razorpay','80.0','completed','2022-02-22 03:15:56.222125',33),(55,NULL,'razorpay','80.0','completed','2022-02-22 03:17:09.928665',33),(56,'','cash on delivery','80.0','pending','2022-02-22 03:23:00.788749',33),(57,'','cash on delivery','80.0','pending','2022-02-22 03:24:55.632543',33),(58,NULL,'razorpay','80.0','completed','2022-02-22 03:25:30.789346',33),(59,NULL,'razorpay','78.0','completed','2022-02-22 03:27:46.580824',33),(60,NULL,'razorpay','78.0','completed','2022-02-22 03:29:45.836550',33),(61,'2H468904T8659401L','PayPal','80.0','COMPLETED','2022-02-22 03:30:18.924040',33),(62,NULL,'razorpay','734.0','completed','2022-02-22 03:32:01.893602',33),(63,NULL,'razorpay','80.0','completed','2022-02-22 10:08:38.319691',33),(64,'','cash on delivery','80.0','pending','2022-02-22 10:09:07.728785',33),(65,'','cash on delivery','78.0','pending','2022-02-23 02:21:47.907347',33),(66,NULL,'razorpay','24.5','completed','2022-02-23 02:42:30.828625',33),(67,'','cash on delivery','54.6','pending','2022-02-23 02:44:00.543998',33),(68,'','cash on delivery','24.5','pending','2022-02-23 02:44:36.385780',33),(69,'36B03595T7832734K','PayPal','24.5','COMPLETED','2022-02-23 03:45:17.069128',33),(70,'9YV95372AS060950R','PayPal','54.6','COMPLETED','2022-02-23 04:21:34.412062',33),(71,NULL,'razorpay','63.0','completed','2022-02-23 04:29:08.295431',33),(72,NULL,'razorpay','46.8','completed','2022-02-23 04:35:15.746640',33),(73,NULL,'razorpay','71.2','completed','2022-02-23 04:44:01.102936',33),(74,NULL,'razorpay','53.4','completed','2022-02-23 04:49:50.959434',33),(75,NULL,'razorpay','54.6','completed','2022-02-23 07:39:08.850569',33),(76,NULL,'razorpay','63.0','completed','2022-02-23 11:40:01.515116',33),(77,'','cash on delivery','90.0','pending','2022-02-23 13:15:08.421938',33),(78,'6DR07900GB456835Y','PayPal','25.9','COMPLETED','2022-02-23 13:16:37.090078',33),(79,NULL,'razorpay','25.9','completed','2022-02-23 13:17:27.899812',33),(80,'','cash on delivery','37.0','pending','2022-02-23 13:18:47.984027',33),(81,'6EC79461ST4863921','PayPal','1260.0','COMPLETED','2022-02-24 04:45:19.727749',50);
/*!40000 ALTER TABLE `orders_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_banner`
--

DROP TABLE IF EXISTS `store_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_banner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `banner_title` varchar(50) NOT NULL,
  `banner_img1` varchar(100) NOT NULL,
  `banner_img2` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_banner`
--

LOCK TABLES `store_banner` WRITE;
/*!40000 ALTER TABLE `store_banner` DISABLE KEYS */;
INSERT INTO `store_banner` VALUES (3,'banner','images/banner/3-10-9319_Dv0aBoh.jpeg','images/banner/3-10-9486_kYqPtdp.jpg');
/*!40000 ALTER TABLE `store_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product`
--

DROP TABLE IF EXISTS `store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` int NOT NULL,
  `images` varchar(100) NOT NULL,
  `stock` int unsigned NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `images_three` varchar(100) NOT NULL,
  `images_two` varchar(100) NOT NULL,
  `brand_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `offer` int NOT NULL,
  `offer_price` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_name` (`product_name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `store_product_brand_id_ec9e66ab_fk_category_subcategory_id` (`brand_id`),
  KEY `store_product_category_id_574bae65_fk_category_category_id` (`category_id`),
  CONSTRAINT `store_product_brand_id_ec9e66ab_fk_category_subcategory_id` FOREIGN KEY (`brand_id`) REFERENCES `category_subcategory` (`id`),
  CONSTRAINT `store_product_category_id_574bae65_fk_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `category_category` (`id`),
  CONSTRAINT `store_product_stock_2c47ad26_check` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES (44,'men Crew- Neck T-shirt','men-Crew-Neck-T-shirt','Regular Fit,\r\n100% Cotton,Machine wash,\r\nElcinco Inc - #17,Amarjothi Sathyamoorthy Nagar, 1st Street, Kangeyam Road, Tirupur 641604. Ph- 98949 48947.',40,'images/products/-1117Wx1400H-461690991-maroon-MODEL4_zhWBtxE.jpg',38,1,'2022-02-14 14:31:46.800086','2022-02-14 14:31:46.800300','images/products/-1117Wx1400H-461690991-maroon-MODEL3_cTXbdpj.jpg','images/products/-1117Wx1400H-461690991-maroon-MODEL2_t9HearS.jpg',5,28,0,35),(46,'Colourblock Slim Fit T-shirt','Colourblock-Slim-Fit-T-shirt','men  t shirt\r\nSlim Fit\r\n100% cotton',86,'images/products/-1117Wx1400H-461646468-blue-MODEL4_8tO8Efu.jpg',9,1,'2022-02-18 11:59:10.647154','2022-02-18 11:59:10.647431','images/products/-1117Wx1400H-461646468-blue-MODEL2_9aX5nsn.jpg','images/products/-1117Wx1400H-461646468-blue-MODEL_RxHAl33.jpg',2,28,56,37),(48,'Slim Fit shirt men','slim-fit-shirt-men','solid casual shirt, has a spread collar, long sleeves, curved hem, one patch pocket,Slim Fit',90,'images/products/-1117Wx1400H-463765274-red-MODEL2_jTOU6ps.jpg',37,1,'2022-02-21 03:39:07.655108','2022-02-21 03:39:07.655182','images/products/-1117Wx1400H-463765274-red-MODEL_irobmqJ.jpg','images/products/-1117Wx1400H-463765274-red-MODEL3.jpg',5,31,0,90),(49,'Blue Slim Fit Solid Casual Shirt','blue-slim-fit-solid-casual-shirt','Adjustable single-button rounded cuffs, Curved hemline, Regular Fit, Machine wash',78,'images/products/-1117Wx1400H-463205145-blue-MODEL4.jpg',56,1,'2022-02-21 03:56:16.940004','2022-02-21 03:56:16.940090','images/products/-1117Wx1400H-463205145-blue-MODEL3.jpg','images/products/-1117Wx1400H-463205145-blue-MODEL.jpg',7,31,0,78),(50,'Men Grey jeans','men-grey-jeans','Machine washable; Line dry, 5-pocket styling , Button closure at the waist, Belt loops, Mid Rise, Cotton Blend',89,'images/products/jeasG1_SpjHUST.jpg',66,1,'2022-02-21 04:06:17.354935','2022-02-21 04:06:17.355003','images/products/jeasG2.jpg','images/products/jeasG_ZfAUnuW.jpg',2,30,0,89),(51,'Men Tapered Fit Jeans','men-tapered-fit-jeans','Whiskers,\r\n5-pocket styling,\r\nZip fly with button closure,\r\nBelt loops,\r\nMachine wash,\r\nMid Rise,\r\n85% cotton, 13% polyester, 2% elastane,\r\nProduct Code: 460731684001,',89,'images/products/er3_TL8ai9U.jpg',55,1,'2022-02-22 11:31:08.790944','2022-02-22 11:31:08.790979','images/products/er_rfsv2S0.jpg','images/products/er44_MiTxGpP.jpg',2,30,0,89);
/*!40000 ALTER TABLE `store_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_variation`
--

DROP TABLE IF EXISTS `store_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_variation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `variation_category` varchar(100) NOT NULL,
  `variation_value` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_variation_product_id_e4f08cbc_fk_store_product_id` (`product_id`),
  CONSTRAINT `store_variation_product_id_e4f08cbc_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_variation`
--

LOCK TABLES `store_variation` WRITE;
/*!40000 ALTER TABLE `store_variation` DISABLE KEYS */;
INSERT INTO `store_variation` VALUES (34,'color','Red',1,'2022-02-21 03:41:12.576139',48),(35,'color','Blue',1,'2022-02-21 03:41:39.395387',48),(36,'size','Small',1,'2022-02-21 03:41:48.969038',48),(37,'size','Medium',1,'2022-02-21 03:42:02.376341',48),(38,'size','Small',1,'2022-02-21 03:42:30.880288',46),(39,'size','Medium',1,'2022-02-21 03:42:39.268268',46),(40,'size','Large',1,'2022-02-21 03:42:49.464030',46),(41,'color','Blue',1,'2022-02-21 03:42:59.102674',46),(42,'color','Black',1,'2022-02-21 03:43:39.381103',46),(43,'color','Grey',1,'2022-02-21 04:08:50.900985',50),(44,'size','Small',1,'2022-02-21 04:08:58.111872',50),(45,'size','Medium',1,'2022-02-21 04:09:05.142102',50),(46,'size','Large',1,'2022-02-21 04:09:14.165353',50),(47,'color','Blue',1,'2022-02-21 04:09:31.675566',49),(48,'color','Light Grey',1,'2022-02-21 04:10:28.206699',49),(49,'size','Small',1,'2022-02-21 04:09:52.358084',49),(50,'size','Medium',1,'2022-02-21 04:09:59.352023',49),(51,'size','Large',1,'2022-02-21 04:10:07.528683',49),(52,'color','Red',1,'2022-02-21 04:11:11.546074',44),(53,'color','Brown',1,'2022-02-21 04:11:21.166209',44),(54,'size','Small',1,'2022-02-21 04:11:31.639715',44),(55,'size','Medium',1,'2022-02-21 04:11:40.582256',44),(56,'size','Large',1,'2022-02-21 04:11:48.656307',44),(57,'color','Blue',1,'2022-02-22 11:37:49.491938',51),(58,'color','Grey',1,'2022-02-22 11:38:04.315195',51),(59,'size','small',1,'2022-02-22 11:38:25.523643',51),(60,'size','medium',1,'2022-02-22 11:38:40.233839',51);
/*!40000 ALTER TABLE `store_variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_wishlist`
--

DROP TABLE IF EXISTS `store_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_wishlist_product_id_8af1333d_fk_store_product_id` (`product_id`),
  KEY `store_wishlist_user_id_afcc4e88_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `store_wishlist_product_id_8af1333d_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  CONSTRAINT `store_wishlist_user_id_afcc4e88_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_wishlist`
--

LOCK TABLES `store_wishlist` WRITE;
/*!40000 ALTER TABLE `store_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-24 19:56:34
