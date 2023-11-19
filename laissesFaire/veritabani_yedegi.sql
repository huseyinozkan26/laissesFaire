-- MariaDB dump 10.19-11.1.2-MariaDB, for osx10.19 (x86_64)
--
-- Host: localhost    Database: lf_web
-- ------------------------------------------------------
-- Server version	11.1.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add contact_form',7,'add_contact_form'),
(26,'Can change contact_form',7,'change_contact_form'),
(27,'Can delete contact_form',7,'delete_contact_form'),
(28,'Can view contact_form',7,'view_contact_form'),
(29,'Can add main_nav',8,'add_main_nav'),
(30,'Can change main_nav',8,'change_main_nav'),
(31,'Can delete main_nav',8,'delete_main_nav'),
(32,'Can view main_nav',8,'view_main_nav'),
(33,'Can add team_roles',9,'add_team_roles'),
(34,'Can change team_roles',9,'change_team_roles'),
(35,'Can delete team_roles',9,'delete_team_roles'),
(36,'Can view team_roles',9,'view_team_roles'),
(37,'Can add team_member',10,'add_team_member'),
(38,'Can change team_member',10,'change_team_member'),
(39,'Can delete team_member',10,'delete_team_member'),
(40,'Can view team_member',10,'view_team_member'),
(41,'Can add page',11,'add_page'),
(42,'Can change page',11,'change_page'),
(43,'Can delete page',11,'delete_page'),
(44,'Can view page',11,'view_page'),
(45,'Can add projects',12,'add_projects'),
(46,'Can change projects',12,'change_projects'),
(47,'Can delete projects',12,'delete_projects'),
(48,'Can view projects',12,'view_projects'),
(49,'Can add sponsors',13,'add_sponsors'),
(50,'Can change sponsors',13,'change_sponsors'),
(51,'Can delete sponsors',13,'delete_sponsors'),
(52,'Can view sponsors',13,'view_sponsors'),
(53,'Can add news',14,'add_news'),
(54,'Can change news',14,'change_news'),
(55,'Can delete news',14,'delete_news'),
(56,'Can view news',14,'view_news');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$600000$VwvOBEmC43CCgj45HFiifx$T/c8COOvbDjD4kInJkYqmgjfXi5qIZYc3VssPfbCCIs=','2023-11-13 20:59:27.638417',1,'admin','','','ozkanhuseyin@yandex.com.tr',1,1,'2023-11-13 20:58:56.346682');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2023-11-13 20:59:58.484999','1','hakkimizda | Ana Sayfa',1,'[{\"added\": {}}]',8,1),
(2,'2023-11-13 21:00:47.774698','2','frcnedir | First',1,'[{\"added\": {}}]',8,1),
(3,'2023-11-13 21:01:12.719695','3','frcnedir | FRC Nedir?',1,'[{\"added\": {}}]',8,1),
(4,'2023-11-13 21:01:28.009442','4','sponsorlarimiz | Sponsorlarımız',1,'[{\"added\": {}}]',8,1),
(5,'2023-11-13 21:01:41.354992','5','projelerimiz | Projelerimiz',1,'[{\"added\": {}}]',8,1),
(6,'2023-11-13 21:01:51.458466','6','takim | Takım',1,'[{\"added\": {}}]',8,1),
(7,'2023-11-13 21:02:04.223964','7','iletisim | İletişim',1,'[{\"added\": {}}]',8,1),
(8,'2023-11-13 21:02:48.152400','8','https://academy.lf8056.com.tr | Akademi',1,'[{\"added\": {}}]',8,1),
(9,'2023-11-13 21:04:14.016442','1','First',1,'[{\"added\": {}}]',11,1),
(10,'2023-11-13 21:13:41.019262','1','First',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',11,1),
(11,'2023-11-13 21:14:32.074830','1','First',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',11,1),
(12,'2023-11-13 21:14:57.680284','1','First',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',11,1),
(13,'2023-11-13 21:15:11.678211','1','First',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',11,1),
(14,'2023-11-13 21:15:50.002261','1','First',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',11,1),
(15,'2023-11-13 21:16:56.182195','2','first | First',2,'[{\"changed\": {\"fields\": [\"Href\"]}}]',8,1),
(16,'2023-11-13 21:22:01.687333','2','FRC Nedir?',1,'[{\"added\": {}}]',11,1),
(17,'2023-11-14 09:28:37.513186','1','Devlet Okulu FLL Takımına Destek',1,'[{\"added\": {}}]',12,1),
(18,'2023-11-17 18:31:32.322166','2','FIRST Programları Gönüllüğü',1,'[{\"added\": {}}]',12,1),
(19,'2023-11-17 18:40:21.309466','1','Devlet Okulu FLL Takımına Destek',2,'[]',12,1),
(20,'2023-11-17 18:41:20.303172','1','Devlet Okulu FLL Takımına Destek',3,'',12,1),
(21,'2023-11-17 18:41:33.960241','3','Devlet Okulu FLL Takımına Destek',1,'[{\"added\": {}}]',12,1),
(22,'2023-11-17 19:32:35.531688','1','AERO RÜZGAR ENERJİ',1,'[{\"added\": {}}]',13,1),
(23,'2023-11-17 19:34:00.959485','2','BOEING',1,'[{\"added\": {}}]',13,1),
(24,'2023-11-17 19:35:21.528746','3','Hugo BOSS',1,'[{\"added\": {}}]',13,1),
(25,'2023-11-17 20:37:00.667646','1','Deprem Sonrası Destek',1,'[{\"added\": {}}]',14,1),
(26,'2023-11-17 20:39:46.514740','2','Menstrüasyon Sunumları Gerçekleştirdik',1,'[{\"added\": {}}]',14,1),
(27,'2023-11-17 20:42:03.940684','3','Fuarlarda FIRST Sunumu ve Küçük Yaş Gruplarına Eğitim',1,'[{\"added\": {}}]',14,1),
(28,'2023-11-17 20:44:45.986872','4','Depremzedelere Powerbank Projesi',1,'[{\"added\": {}}]',14,1),
(29,'2023-11-17 20:54:29.625225','3','Hakkımızda',1,'[{\"added\": {}}]',11,1),
(30,'2023-11-17 20:58:33.634734','3','Hakkımızda',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',11,1),
(31,'2023-11-19 12:09:49.384513','6','takim | Takım',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',8,1),
(32,'2023-11-19 14:21:19.404818','1','hakkimizda | Ana Sayfa',2,'[{\"changed\": {\"fields\": [\"Level\"]}}]',8,1),
(33,'2023-11-19 14:21:24.940200','2','first | First',2,'[{\"changed\": {\"fields\": [\"Level\"]}}]',8,1),
(34,'2023-11-19 14:21:29.883937','3','frcnedir | FRC Nedir?',2,'[{\"changed\": {\"fields\": [\"Level\"]}}]',8,1),
(35,'2023-11-19 14:21:33.500203','3','frcnedir | FRC Nedir?',2,'[{\"changed\": {\"fields\": [\"Level\"]}}]',8,1),
(36,'2023-11-19 14:21:41.867952','4','sponsorlarimiz | Sponsorlarımız',2,'[{\"changed\": {\"fields\": [\"Level\"]}}]',8,1),
(37,'2023-11-19 14:21:48.949158','5','projelerimiz | Projelerimiz',2,'[{\"changed\": {\"fields\": [\"Level\"]}}]',8,1),
(38,'2023-11-19 14:21:54.594051','6','takim | Takım',2,'[{\"changed\": {\"fields\": [\"Level\"]}}]',8,1),
(39,'2023-11-19 14:22:01.439162','8','https://academy.lf8056.com.tr | Akademi',2,'[{\"changed\": {\"fields\": [\"Level\"]}}]',8,1),
(40,'2023-11-19 14:22:30.817305','9','/haberler | Haberler',1,'[{\"added\": {}}]',8,1),
(41,'2023-11-19 14:22:54.018925','9','haberler | Haberler',2,'[{\"changed\": {\"fields\": [\"Href\"]}}]',8,1),
(42,'2023-11-19 14:38:25.107093','7','iletisim | İletişim',2,'[{\"changed\": {\"fields\": [\"Level\"]}}]',8,1),
(43,'2023-11-19 18:36:44.037348','4','FMI Gıda & Kimya',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'lf_web','contact_form'),
(8,'lf_web','main_nav'),
(14,'lf_web','news'),
(11,'lf_web','page'),
(12,'lf_web','projects'),
(13,'lf_web','sponsors'),
(10,'lf_web','team_member'),
(9,'lf_web','team_roles'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2023-11-13 20:54:01.702777'),
(2,'auth','0001_initial','2023-11-13 20:54:04.736602'),
(3,'admin','0001_initial','2023-11-13 20:54:05.320803'),
(4,'admin','0002_logentry_remove_auto_add','2023-11-13 20:54:05.335355'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-11-13 20:54:05.348571'),
(6,'contenttypes','0002_remove_content_type_name','2023-11-13 20:54:05.810477'),
(7,'auth','0002_alter_permission_name_max_length','2023-11-13 20:54:06.040662'),
(8,'auth','0003_alter_user_email_max_length','2023-11-13 20:54:06.279663'),
(9,'auth','0004_alter_user_username_opts','2023-11-13 20:54:06.293946'),
(10,'auth','0005_alter_user_last_login_null','2023-11-13 20:54:06.564677'),
(11,'auth','0006_require_contenttypes_0002','2023-11-13 20:54:06.567709'),
(12,'auth','0007_alter_validators_add_error_messages','2023-11-13 20:54:06.577241'),
(13,'auth','0008_alter_user_username_max_length','2023-11-13 20:54:06.804862'),
(14,'auth','0009_alter_user_last_name_max_length','2023-11-13 20:54:07.055707'),
(15,'auth','0010_alter_group_name_max_length','2023-11-13 20:54:07.259155'),
(16,'auth','0011_update_proxy_permissions','2023-11-13 20:54:07.270040'),
(17,'auth','0012_alter_user_first_name_max_length','2023-11-13 20:54:07.504901'),
(18,'lf_web','0001_initial','2023-11-13 20:54:09.306226'),
(19,'sessions','0001_initial','2023-11-13 20:54:09.646575'),
(20,'lf_web','0002_projects','2023-11-14 09:26:11.861177'),
(21,'lf_web','0003_sponsors_alter_projects_image_1_and_more','2023-11-17 18:49:18.921272'),
(22,'lf_web','0004_sponsors_queue_sponsors_year','2023-11-17 19:19:20.478549'),
(23,'lf_web','0005_alter_sponsors_image_alter_sponsors_year','2023-11-17 19:23:58.011285'),
(24,'lf_web','0006_alter_sponsors_queue','2023-11-17 19:24:20.043935'),
(25,'lf_web','0007_remove_sponsors_queue','2023-11-17 19:24:39.768375'),
(26,'lf_web','0008_sponsors_queue_alter_sponsors_image','2023-11-17 19:24:51.664856'),
(27,'lf_web','0009_alter_sponsors_queue','2023-11-17 19:26:02.358602'),
(28,'lf_web','0010_news','2023-11-17 20:22:22.533651'),
(29,'lf_web','0011_alter_news_image_1_alter_news_image_2_and_more','2023-11-19 11:57:30.864832'),
(30,'lf_web','0012_main_nav_level','2023-11-19 14:21:06.584252');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('svltj3q20a2er5tjobusoo8qeaipaaxu','.eJxVjEEOwiAQRe_C2hCgpQMu3XsGMsNMpWpoUtqV8e7apAvd_vfef6mE21rS1mRJE6uzsur0uxHmh9Qd8B3rbdZ5rusykd4VfdCmrzPL83K4fwcFW_nWPQfjyQhZdEyBebQAjOAI2aBQcJAjxjFDIMPRgh2idIP1sevRM6r3BwnVOIw:1r2e1n:rzXQwgRpJlmpiJwaRtc3o97CDbicMU2qjTxvUor29xc','2023-11-27 20:59:27.640873');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lf_web_contact_form`
--

DROP TABLE IF EXISTS `lf_web_contact_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lf_web_contact_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(120) NOT NULL,
  `eposta` varchar(254) NOT NULL,
  `message` longtext NOT NULL,
  `isRead` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lf_web_contact_form`
--

LOCK TABLES `lf_web_contact_form` WRITE;
/*!40000 ALTER TABLE `lf_web_contact_form` DISABLE KEYS */;
INSERT INTO `lf_web_contact_form` VALUES
(1,'Hüseyin ÖZKAN','caglanlee@gmail.com','Denemeler bu bir deneme e-postasıdır.',0);
/*!40000 ALTER TABLE `lf_web_contact_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lf_web_main_nav`
--

DROP TABLE IF EXISTS `lf_web_main_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lf_web_main_nav` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `href` varchar(100) NOT NULL,
  `target` varchar(10) NOT NULL,
  `btnType` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lf_web_main_nav`
--

LOCK TABLES `lf_web_main_nav` WRITE;
/*!40000 ALTER TABLE `lf_web_main_nav` DISABLE KEYS */;
INSERT INTO `lf_web_main_nav` VALUES
(1,'Ana Sayfa','hakkimizda','','',1,1),
(2,'First','first','','',1,2),
(3,'FRC Nedir?','frcnedir','','',1,3),
(4,'Sponsorlarımız','sponsorlarimiz','','',1,4),
(5,'Projelerimiz','projelerimiz','','',1,6),
(6,'Takım','takim','','',0,7),
(7,'İletişim','iletisim','','',1,9),
(8,'Akademi','https://academy.lf8056.com.tr','_blank','button',1,12),
(9,'Haberler','haberler','','',1,5);
/*!40000 ALTER TABLE `lf_web_main_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lf_web_news`
--

DROP TABLE IF EXISTS `lf_web_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lf_web_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `header` varchar(255) NOT NULL,
  `desc` longtext NOT NULL,
  `head_image` varchar(100) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `image_1` varchar(100) NOT NULL,
  `image_2` varchar(100) NOT NULL,
  `image_3` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lf_web_news`
--

LOCK TABLES `lf_web_news` WRITE;
/*!40000 ALTER TABLE `lf_web_news` DISABLE KEYS */;
INSERT INTO `lf_web_news` VALUES
(1,'Deprem Sonrası Destek','Geçtiğimiz günlerde meydana gelen depremin ardından, olayın etkilediği bölgelerdeki yardım faaliyetlerine katılmak amacıyla İzmir Mimarlar Odası bünyesinde AFAD (Afet ve Acil Durum Yönetimi Başkanlığı) için veri girişi çalışmalarına katıldık. Bu süreçte, afetzedelerin ihtiyaçlarını karşılamak ve onlara destek olmak amacıyla Tepekule Kongre Merkezi\'nde aktif rol aldık.\r\n\r\nTepekule Kongre Merkezi\'nde, depremzedeler için gerekli eşyaların paketlenmesi, taşınması ve dağıtılması gibi önemli görevlerde ekiplere destek verdik. Bu kapsamda, acil yardım malzemelerinin düzenli bir şekilde paketlenmesi ve depremzedelere ulaştırılması için gönüllü desteği sağladık. Ayrıca, ihtiyaç duyulan eşyaların toplanması ve bu sürecin düzenli bir şekilde yönetilmesi için çeşitli iletişim kanallarına duyurularda bulunduk.\r\n\r\nDayanışma ve yardımlaşma duygusuyla bir araya gelerek, depremzedelerin ihtiyaçlarına cevap vermek ve onlara destek olmak, toplumsal bir sorumluluk bilinciyle hareket etmemizin bir yansımasıdır. Gelecekte de benzer durumlarda toplumun birlik ve beraberlik içinde olması adına çaba harcamaya devam edeceğiz.','static/assets/upload/news/deprem_sonrasi.jpeg','2023-02-07 20:24:00.000000','deprem_sonrasi_alt1.jpeg','deprem_sonrasi_alt2.jpeg','',1),
(2,'Menstrüasyon Sunumları Gerçekleştirdik','Son zamanlarda, toplumsal tabuları yıkmak ve gençler arasında bilinçli bir anlayış oluşturmak amacıyla bir adım attık. Toplamda 220 9. sınıf öğrencisine, kız ve erkek öğrencilerin bir arada bulunduğu bir ortamda, menstrüasyon hakkında bilgilendirici sunumlar gerçekleştirdik. Bu etkinlik, cinsiyet ayrımcılığına karşı mücadelede ve toplumda menstrüasyon konusunda oluşan yanlış bilgileri düzeltmede önemli bir rol oynamaktadır.\r\n\r\nSunumlarımızın temel amacı, öğrencilere biyolojik bir süreç olan menstrüasyonu anlamaları ve bu konuda toplumda var olan tabuları yıkmaları için gerekli bilgi ve farkındalığı kazandırmaktı. Hem kız hem de erkek öğrencilerin bu konuda eşit bilgi sahibi olmalarını sağlamak, toplumda cinsiyet eşitsizliği ve stigmatizasyonla mücadelede bir adım atmaktı.\r\n\r\nSunumlarımızda, menstrüasyonun biyolojik sürecini ayrıntılı bir şekilde ele aldık ve bu sürecin normal bir fizyolojik olay olduğunu vurguladık. Aynı zamanda, menstrüasyonun tabularla örtülmemesi gerektiğini ve bu konuda açık iletişim kurmanın, toplumsal bilinç ve anlayışı artırmanın önemini vurguladık.\r\n\r\nBu etkinlik sadece bilgi aktarımı değil, aynı zamanda öğrenciler arasında iletişimi güçlendirmek ve empati oluşturmak amacıyla tasarlanmıştır. Öğrencilere, menstrüasyonun sadece bir cinsiyetle sınırlı olmadığını ve toplumsal bir konu olduğunu anlatarak, birbirlerine destek olmalarını teşvik ettik.\r\n\r\nBu tür etkinlikler, genç nesiller arasında cinsiyet eşitliği, bilinçli toplum ve toplumsal cinsiyetle ilgili tabuların yıkılması için önemli adımlar atılmasına olanak tanır. Bu tür bilgilendirici sunumlar, öğrencilere sadece biyolojik süreçleri değil, aynı zamanda toplumsal normları ve beklentileri sorgulama ve değiştirme yeteneği kazandırarak onları ilham kaynağı yapar.','static/assets/upload/news/menstruasyon.jpeg','2022-11-11 20:37:36.000000','menstruasyon_alt1.jpeg','menstruasyon_alt2.jpeg','',1),
(3,'Fuarlarda FIRST Sunumu ve Küçük Yaş Gruplarına Eğitim','Son dönemde, İzmir Enternasyonel Fuarı (IEF) başta olmak üzere çeşitli önemli fuar ve etkinliklerde, özellikle FIRST (For Inspiration and Recognition of Science and Technology) ve mühendislik alanındaki bilgi ve deneyimleri geniş kitlelere ulaştırmak amacıyla aktif bir rol oynadık. Bu etkinlikler kapsamında gerçekleştirdiğimiz sunumlar ve eğitimler ile özellikle gençler arasında bilinç oluşturmayı ve mühendislik alanına ilgiyi artırmayı hedefledik.\r\n\r\nIEF gibi prestijli etkinliklerde, İzmir\'in dinamik genç nüfusuna ve ziyaretçilere, FIRST ve mühendislik alanındaki projelerimizi tanıttık. Bu sunumlar, geleceğin liderleri olan gençlerin bilim, teknoloji ve mühendislik konularındaki potansiyellerini keşfetmelerine ve geliştirmelerine yardımcı olmayı amaçladı. Aynı zamanda, bu etkinliklerde mühendislik projelerimizi interaktif bir şekilde sergileyerek, ziyaretçilere projelerimizin nasıl çalıştığını gösterdik.\r\n\r\nFuarlarda özellikle küçük yaş gruplarına yönelik olarak WeDo 2.0 eğitimleri düzenledik. Bu eğitimler, çocuklara STEM (Science, Technology, Engineering, and Mathematics) alanlarında erken yaşta deneyim kazanma fırsatı sunarak, yaratıcılıklarını ve problem çözme yeteneklerini geliştirmelerine katkı sağladı. Aynı zamanda, bu eğitimler aracılığıyla çocuklara teknoloji ve mühendislik konularında ilgi uyandırmayı ve onları bu alanlara teşvik etmeyi amaçladık.\r\n\r\nIEF, WeCycle, ExpoTech gibi fuarlar, toplumun geniş kesimlerine ulaşma ve STEM alanlarına ilgiyi artırma açısından önemli birer platform oluşturdu. Bu etkinlikler aracılığıyla, bilimin ve mühendisliğin günlük hayatımızdaki rolünü vurgulayarak, gençleri geleceğin teknolojik liderleri olmaya teşvik etmeye devam ediyoruz.','static/assets/upload/news/fuar.jpeg','2022-09-12 20:40:10.000000','fuar_alt1.jpeg','fuar_alt2.jpeg','',1),
(4,'Depremzedelere Powerbank Projesi','Ülkemizde yaşanan son depremin ardından, hemen harekete geçerek sosyal sorumluluk anlayışımız doğrultusunda bir girişimde bulunduk. Depremzedelerin ihtiyaçlarını hafifletmek ve iletişimlerini sürdürebilmelerini sağlamak amacıyla, kendi üretimimiz olan powerbankleri geliştirdik. Bu acil durumda ihtiyaç duyulan enerji kaynaklarının eksikliğini giderebilmek ve iletişim altyapısının sürdürülebilirliğini sağlamak amacıyla bu projeyi başlattık.\r\n\r\nBu çerçevede, Hatay\'da depremin etkilediği bölgelere hızlı bir şekilde yardım ulaştırmak için 200 adet powerbanki ürettik. Bu cihazlar, depremzedelerin mobil cihazlarını şarj etmelerine yardımcı olarak, iletişim kurmalarını ve acil durumlarla ilgili bilgileri alabilmelerini sağladı. Aynı zamanda, bu powerbanklerin tasarımında dayanıklılık ve taşınabilirlik gibi önemli faktörlere odaklandık, böylece kullanım kolaylığı sağlandı.\r\n\r\nBu özel durum karşısında, yardıma ihtiyaç duyan diğer topluluklara da destek olabilmek amacıyla powerbank tasarım dosyalarını herkese açık bir şekilde paylaştık. Bu sayede, bu teknolojiye sahip olan diğer ekipler veya girişimciler, kendi bölgelerinde benzer acil durumlar için powerbank üretebilecekleri tasarım kaynaklarına erişim sağlayabildiler. Bu yaklaşım, toplumda dayanışma ve yardımlaşma kültürünü desteklemeyi amaçladık.\r\n\r\nBu girişim, sadece maddi yardım değil, aynı zamanda teknoloji ve tasarım açısından da bir katkı sağlama hedefini taşıdı. Amacımız, ülkenin her köşesinde, benzer afet durumlarına karşı hazır olabilecek ve dayanışma içinde hareket edebilecek bir toplumsal bilinç oluşturmaktı. Bu tip acil durumlarda hızlı ve etkili müdahaleler, toplumun bir arada daha güçlü ve dayanıklı olmasını sağlar.','static/assets/upload/news/powerbank.jpeg','2023-02-16 20:42:18.000000','powerbank_alt1.jpeg','powerbank_alt2.jpeg','',1);
/*!40000 ALTER TABLE `lf_web_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lf_web_page`
--

DROP TABLE IF EXISTS `lf_web_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lf_web_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `publish_date` date NOT NULL,
  `caller_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `caller_id` (`caller_id`),
  CONSTRAINT `lf_web_page_caller_id_caf9ef15_fk_lf_web_main_nav_id` FOREIGN KEY (`caller_id`) REFERENCES `lf_web_main_nav` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lf_web_page`
--

LOCK TABLES `lf_web_page` WRITE;
/*!40000 ALTER TABLE `lf_web_page` DISABLE KEYS */;
INSERT INTO `lf_web_page` VALUES
(1,'First','<div class=\"row gx-5 align-items-center\">\r\n                    <div class=\"col-lg-6 order-lg-2\">\r\n                        <div class=\"p-5\"><img class=\"img-fluid\" src=\"static/assets/images/first.png\" alt=\"...\"></div>\r\n                    </div>\r\n                    <div class=\"col-lg-6 order-lg-1\">\r\n                        <div class=\"p-5\">\r\n                            <p>FIRST, 1989 yılında gençlerin bilime ve teknolojiye olan ilgilerini canlandırmak amacıyla kurulmuştur. Öğrencilere ulaşılabilir ve inovatif programlar sunarak bilim, mühendislik, teknoloji ve matematik alanlarında bir eğitim ve kariyer hedeflemelerine ilham verirken, özgüven ve hayat becerilerini de geliştirmeyi hedeflemektedir.</p>\r\n                            <p>Misyonu, gençleri heyecanlandıran, mentorların rehberliğinde bilim sınırlarını ve teknoloji becerilerini geliştiren, yenilikçilik ruhunu teşvik eden ve liderlik ile iletişim gibi hayata dahil olan programların bir parçası haline getirerek, teknoloji ve alanında liderler olmaları için ilham vermektir.</p>\r\n                            <p>FIRST, Robot yapmaktan çok daha fazlasını sunar. FIRST Tech Challenge ekipleri, ittifak formatında bir mücadelede rekabet etmek üzere tasarım, inşa, programlama ve çalıştırma becerilerini kullanarak robotlar geliştirir. Öğrenciler, yetişkin koçlar ve akıl hocaları eşliğinde STEM becerilerini geliştirirken aynı zamanda sıkı çalışmanın, yeniliğin ve takım çalışmasının değerini keşfederler. Mühendislik ilkelerini uygulayarak gerçek dünyadaki zorluklarla başa çıkmayı öğrenirler.</p>\r\n                            <p>FIRST, geleceğin bilim insanları, mühendisleri ve teknoloji liderleri için bir platformdur. Gençleri cesaretlendirir, yaratıcılıklarını ortaya çıkarmalarına yardımcı olur ve onları karşılaşacakları sorunları çözebilen, işbirliği yapabilen ve inovasyonu teşvik eden bireyler olarak yetiştirir.</p>\r\n                        </div>\r\n                    </div>\r\n                </div>',1,'2023-11-14',2),
(2,'FRC Nedir?','<div class=\"row gx-5 align-items-center\">\r\n            <div class=\"col-lg-6 order-lg-2\">\r\n                <div class=\"p-5\"><img class=\"img-fluid rounded-circle\" src=\"static/assets/images/frclogo.jpeg\" alt=\"...\"></div>\r\n            </div>\r\n            <div class=\"col-lg-6 order-lg-1\">\r\n                <div class=\"p-5\">\r\n                    <p>Her yıl düzenlenen uluslararası bir robot turnuvası olan FIRST Robotics Competition, 15-18 yaş arası lise öğrencilerine yöneliktir. Takımlar, Ocak ayında duyurulan bir tema çerçevesinde belirlenen görevleri yerine getirebilen robotlar inşa etme hedefiyle yola çıkarlar.</p>\r\n                    <p>Bu program, öğrencilere gerçek mühendislik deneyimini yaşatmayı amaçlarken, aynı zamanda öğretmenler, aileler ve mühendislerle işbirliği yapabilecekleri bir platform sunar.</p>\r\n                    <p>\"More than Robot\" (Robot\'dan daha fazlası) sloganıyla ortaya çıkan FIRST Robotics Competition, takımlarda farklı alanlarda çalışabilecek öğrencilerin bir arada olmasını gerektirir. Takımlar, sponsorluk, tasarım, sosyal medya yönetimi, elektronik, programlama ve mekanik gibi ekipleri oluşturarak profesyonel bir işletme gibi faaliyet gösterebilme imkânı bulurlar. Bu program, çeşitli alanlarda uzmanlaşmak isteyen gençlerin bir araya gelmesini ve belirlenen süre içinde ortak bir çalışma yürütmelerini sağlar.</p>\r\n                    <p>FIRST Robotics Competition, sadece bir robot yarışması değildir. Katılımcılar, yaratıcılıklarını sergilemenin yanı sıra takım ruhunu ve işbirliğini geliştirirler. Bu deneyim, gençleri sadece teknik becerilerini değil, aynı zamanda liderlik, iletişim ve problem çözme gibi hayati yetenekleri geliştirme fırsatı sunar.</p>\r\n                    <p>FIRST Robotics Competition, geleceğin mühendisleri ve teknoloji liderlerini yetiştiren bir platformdur. Gençler, ekip çalışmasının gücünü keşfederken aynı zamanda STEM (Bilim, Teknoloji, Mühendislik ve Matematik) becerilerini geliştirirler. Bu program, gençlerin bilim ve teknoloji alanındaki ilgilerini arttırırken aynı zamanda kendi potansiyellerini keşfetmelerine ve gelecekteki kariyerlerine yön vermelerine yardımcı olur.</p>\r\n                </div>\r\n            </div>\r\n        </div>',1,'2023-11-14',3),
(3,'Hakkımızda','<div class=\"container px-5\">\r\n        <div class=\"row gx-5 align-items-center\">\r\n            <div class=\"col-lg-6 order-lg-2\">\r\n                <div class=\"p-5\"><img class=\"img-fluid\" src=\"static/assets/images/main/01.jpg\" alt=\"...\"></div>\r\n            </div>\r\n            <div class=\"col-lg-6 order-lg-1\">\r\n                <div class=\"p-5\">\r\n                    <h2 class=\"display-4\">8056 Laissez Faire</h2>\r\n                    <p>Biz, 8056 Laissez Faire, herhangi bir kuruma bağlı olmaksızın farklı okullardan gelen\r\n                        öğrencilerden oluşan bir takımız. Oluşturduğumuz şirket sistemiyle FRC turnuvalarında 2019\r\n                        yılından beri yer almaktayız. Takımımız, hazırlık sürecinde sponsorluk, tasarım, sosyal medya\r\n                        yönetimi, elektronik, programlama ve mekanik gibi ekiplere ayrılarak profesyonel bir işletme\r\n                        gibi hareket etmektedir.</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n\r\n\r\n<div class=\"container px-5\">\r\n        <div class=\"row gx-5 align-items-center\">\r\n            <div class=\"col-lg-6\">\r\n                <div class=\"p-5\"><img class=\"img-fluid\" src=\"static/assets/images/main/02.jpg\" alt=\"...\"></div>\r\n            </div>\r\n            <div class=\"col-lg-6\">\r\n                <div class=\"p-5\">\r\n                    <h2 class=\"display-4\">Özgürlük ve bağımsızlık</h2>\r\n                    <p>FRC ve takım ruhumuz, \"Bırakınız yapsınlar\" mottosuyla özgürlük ve anlayışa dayanmaktadır. Bu\r\n                        motto, sadece bir spor etkinliği değil, aynı zamanda bir tutku ve özveri kaynağıdır. Ekip olarak\r\n                        inancımız, her bireyin yeteneklerini ortaya çıkarabileceği ve kendi vizyonlarını\r\n                        gerçekleştirebileceği bir ortam yaratmaktır.</p>\r\n                    <p>Takımımızın mottosu ulu önderimiz Gazi Mustafa Kemal Atatürk\'ün \"Özgürlük ve bağımsızlık benim\r\n                        karakterimdir.\" sözünden ilham alınarak oluşturulmuştur.</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n\r\n\r\n<div class=\"container px-5\">\r\n        <div class=\"row gx-5 align-items-center\">\r\n            <div class=\"col-lg-6 order-lg-2\">\r\n                <div class=\"p-5\"><img class=\"img-fluid\" src=\"static/assets/images/main/03.jpg\" alt=\"...\"></div>\r\n            </div>\r\n            <div class=\"col-lg-6 order-lg-1\">\r\n                <div class=\"p-5\">\r\n                    <h2 class=\"display-4\">Bırakınız Yapsınlar!</h2>\r\n                    <p>Biz, 8056 Laissez Faire olarak, sınırları zorlayan bir takımız. Yaratıcılık, yenilikçilik ve\r\n                        takım çalışmasını birleştirerek geleceğin liderleri olarak dikkat çekmekteyiz. Amacımız, STEM\r\n                        alanındaki potansiyeli açığa çıkarmak ve geleceğin teknolojilerini şekillendiren bireyler olarak\r\n                        topluma katkı sağlamaktır.</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>',1,'2023-11-17',1);
/*!40000 ALTER TABLE `lf_web_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lf_web_projects`
--

DROP TABLE IF EXISTS `lf_web_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lf_web_projects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `header` varchar(144) NOT NULL,
  `body` longtext NOT NULL,
  `t_image` varchar(100) NOT NULL,
  `image_1` varchar(100) NOT NULL,
  `image_2` varchar(100) NOT NULL,
  `btn` varchar(244) NOT NULL,
  `href` varchar(1144) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lf_web_projects`
--

LOCK TABLES `lf_web_projects` WRITE;
/*!40000 ALTER TABLE `lf_web_projects` DISABLE KEYS */;
INSERT INTO `lf_web_projects` VALUES
(2,'FIRST Programları Gönüllüğü','Bu sene düzenlenen FLL (FIRST Lego League) turnuvalarında ve WRO turnuvasında gönüllü olduk.','static/assets/uploads/first.jpeg','static/assets/uploads/first_alt1.jpeg','','',''),
(3,'Devlet Okulu FLL Takımına Destek','Teknik ve proje açısından eksikleri olan devlet okulu olan 30 Ağustos Ortaokulu FLL (FIRST Lego League) takımı Robokod Kozmos\'a destek verdik.','static/assets/uploads/fll_alt1_W8QmNNB.jpeg','static/assets/uploads/fll_alt2_4nejVM9.jpeg','','','');
/*!40000 ALTER TABLE `lf_web_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lf_web_sponsors`
--

DROP TABLE IF EXISTS `lf_web_sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lf_web_sponsors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(244) NOT NULL,
  `image` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  `queue` int(11) NOT NULL,
  `year` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lf_web_sponsors`
--

LOCK TABLES `lf_web_sponsors` WRITE;
/*!40000 ALTER TABLE `lf_web_sponsors` DISABLE KEYS */;
INSERT INTO `lf_web_sponsors` VALUES
(1,'AERO RÜZGAR ENERJİ','static/assets/uploads/sponsors/AERO-Ruzgar-Logo-Vektor-jpg-1024x399.jpg','Almanya’nın en büyük rüzgâr türbini üreticisi olan ENERCON şirketinin bir alt şirketidir. 2013 yılı sonu itibari ile ENERCON olarak %27,26 pazar payı ile Türkiye’de lider konumdadır.  ENERCON ise 2013 yılı sonu itibari ile 33.211 MW kurulu güç ile dünyada %10,5’lik bir pazar payına sahiptir.',1,'2023-01-01'),
(2,'BOEING','static/assets/uploads/sponsors/Boeing_full_logo_variant.svg.png','The Boeing Company, dünya çapında başta uçak, helikopter, roket, uydu, telekomünikasyon ekipmanları ve füzeler tasarlayan ve üreten çok uluslu bir Amerikan havacılık şirketidir. William Boeing tarafından 1916 yılında ABD\'nin Washington eyaletinde kurulmuştur. Uluslararası Merkezi Chicago\'dadır.',2,'2023-01-01'),
(3,'Hugo BOSS','static/assets/uploads/sponsors/hugoboss.png','Hugo Boss AG, erkek ve kadın giyim konusunda uzmanlaşmış, Almanya\'nın Baden-Württemberg eyaletinde yer alan Metzingen kasabası merkezli halka açık hazır giyim üreticisidir. İsmini, kurucusu olduğu moda tasarımcısı Hugo Boss\'dan almıştır. Hugo Boss\'un şu anda 110 ülkede en az 6100 satış noktası vardır.',3,'2023-01-01'),
(4,'FMI Gıda & Kimya','static/assets/uploads/sponsors/fmiLogoKare_gb.png','Firmamız, güçlü teknik alt yapısı sayesinde standart ve yüksek kalitedeki fonksiyonel gıda katkı maddelerini sektöre sunarak hizmet vermektedir.\r\n\r\n15 yıl üzerindeki bilgi birikim, uzmanlık ve tecrübesini verdiği hizmetlerine yansıtan firmamız, paydaşlarına çözüm ortağı olmaktadır.\r\n\r\nFirmamız; eşsiz formülasyon ve uygulama desteği, portföyüne eklediği yenilikçi ürünleri , hızlı lojistik ve konularında uzman Teknik&Satış kadrosu ile sektörün öncülerindendir.\r\n\r\nGeçmişin tecrübesini arkamıza alarak geleceğe sağlam adımlarla ilerliyoruz.',10,'2023-01-01');
/*!40000 ALTER TABLE `lf_web_sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lf_web_team_member`
--

DROP TABLE IF EXISTS `lf_web_team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lf_web_team_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `lf_web_team_member_user_id_ca8b2792_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lf_web_team_member`
--

LOCK TABLES `lf_web_team_member` WRITE;
/*!40000 ALTER TABLE `lf_web_team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `lf_web_team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lf_web_team_member_role`
--

DROP TABLE IF EXISTS `lf_web_team_member_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lf_web_team_member_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `team_member_id` bigint(20) NOT NULL,
  `team_roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lf_web_team_member_role_team_member_id_team_role_2b54ce10_uniq` (`team_member_id`,`team_roles_id`),
  KEY `lf_web_team_member_r_team_roles_id_80cf0067_fk_lf_web_te` (`team_roles_id`),
  CONSTRAINT `lf_web_team_member_r_team_member_id_78420e16_fk_lf_web_te` FOREIGN KEY (`team_member_id`) REFERENCES `lf_web_team_member` (`id`),
  CONSTRAINT `lf_web_team_member_r_team_roles_id_80cf0067_fk_lf_web_te` FOREIGN KEY (`team_roles_id`) REFERENCES `lf_web_team_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lf_web_team_member_role`
--

LOCK TABLES `lf_web_team_member_role` WRITE;
/*!40000 ALTER TABLE `lf_web_team_member_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `lf_web_team_member_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lf_web_team_roles`
--

DROP TABLE IF EXISTS `lf_web_team_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lf_web_team_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `role_level` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lf_web_team_roles`
--

LOCK TABLES `lf_web_team_roles` WRITE;
/*!40000 ALTER TABLE `lf_web_team_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `lf_web_team_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19 22:05:44
