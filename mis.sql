-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: mis
-- ------------------------------------------------------
-- Server version	5.7.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (8,'代购点'),(7,'批发中心'),(9,'操作员'),(6,'生产基地');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (2,6,1),(4,6,4),(42,6,50),(43,6,54),(21,6,86),(44,6,91),(22,6,92),(23,6,96),(24,6,97),(25,6,98),(119,6,99),(120,6,100),(29,6,102),(30,6,103),(31,6,104),(32,6,105),(33,6,106),(34,6,107),(35,6,108),(36,6,110),(37,6,111),(38,6,112),(39,6,116),(40,6,117),(41,6,118),(1,6,128),(3,6,131),(5,6,133),(6,6,134),(8,6,136),(9,6,137),(10,6,138),(11,6,139),(12,6,140),(13,6,141),(14,6,142),(15,6,143),(16,6,144),(17,6,148),(18,6,149),(19,6,150),(20,6,151),(45,7,1),(46,7,4),(63,7,50),(64,7,54),(65,7,74),(66,7,75),(67,7,76),(68,7,86),(69,7,88),(70,7,91),(47,7,133),(48,7,134),(50,7,136),(51,7,137),(52,7,138),(53,7,139),(54,7,140),(55,7,141),(56,7,145),(57,7,146),(58,7,147),(59,7,149),(60,7,150),(61,7,151),(62,7,152),(72,8,1),(74,8,4),(91,8,50),(92,8,54),(93,8,65),(94,8,66),(95,8,67),(96,8,86),(97,8,90),(98,8,91),(99,8,92),(100,8,93),(101,8,94),(102,8,95),(103,8,99),(104,8,100),(106,8,102),(107,8,103),(108,8,104),(109,8,105),(110,8,106),(111,8,107),(112,8,109),(113,8,110),(114,8,111),(115,8,112),(116,8,113),(117,8,114),(118,8,115),(71,8,128),(73,8,130),(75,8,133),(76,8,134),(78,8,136),(79,8,137),(80,8,138),(81,8,139),(82,8,140),(83,8,141),(84,8,142),(85,8,143),(86,8,144),(87,8,148),(88,8,149),(89,8,150),(90,8,151),(134,9,71),(135,9,72),(136,9,73),(137,9,86),(138,9,92),(139,9,96),(140,9,97),(141,9,98),(142,9,99),(143,9,100),(144,9,101),(145,9,105),(146,9,106),(147,9,107),(148,9,108),(149,9,110),(150,9,112),(122,9,133),(123,9,134),(124,9,135),(125,9,139),(126,9,140),(127,9,141),(128,9,142),(129,9,143),(130,9,144),(131,9,148),(132,9,149),(133,9,151);
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
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can add user',3,'add_user'),(9,'Can change user',3,'change_user'),(10,'Can delete user',3,'delete_user'),(11,'Can add group',4,'add_group'),(12,'Can change group',4,'change_group'),(13,'Can delete group',4,'delete_group'),(14,'Can view group',4,'view_group'),(15,'Can view permission',2,'view_permission'),(16,'Can view user',3,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 包装物',7,'add_baozhuangwu'),(26,'Can change 包装物',7,'change_baozhuangwu'),(27,'Can delete 包装物',7,'delete_baozhuangwu'),(28,'Can add 状态',8,'add_status'),(29,'Can change 状态',8,'change_status'),(30,'Can delete 状态',8,'delete_status'),(31,'Can add 计量单位',9,'add_jiliangdanwei'),(32,'Can change 计量单位',9,'change_jiliangdanwei'),(33,'Can delete 计量单位',9,'delete_jiliangdanwei'),(34,'Can add 种植单位',10,'add_zhongzhidanwei'),(35,'Can change 种植单位',10,'change_zhongzhidanwei'),(36,'Can delete 种植单位',10,'delete_zhongzhidanwei'),(37,'Can view 包装物',7,'view_baozhuangwu'),(38,'Can view 计量单位',9,'view_jiliangdanwei'),(39,'Can view 状态',8,'view_status'),(40,'Can view 种植单位',10,'view_zhongzhidanwei'),(41,'Can add Bookmark',11,'add_bookmark'),(42,'Can change Bookmark',11,'change_bookmark'),(43,'Can delete Bookmark',11,'delete_bookmark'),(44,'Can add User Widget',12,'add_userwidget'),(45,'Can change User Widget',12,'change_userwidget'),(46,'Can delete User Widget',12,'delete_userwidget'),(47,'Can add User Setting',13,'add_usersettings'),(48,'Can change User Setting',13,'change_usersettings'),(49,'Can delete User Setting',13,'delete_usersettings'),(50,'Can add log entry',14,'add_log'),(51,'Can change log entry',14,'change_log'),(52,'Can delete log entry',14,'delete_log'),(53,'Can view Bookmark',11,'view_bookmark'),(54,'Can view log entry',14,'view_log'),(55,'Can view User Setting',13,'view_usersettings'),(56,'Can view User Widget',12,'view_userwidget'),(57,'Can add revision',15,'add_revision'),(58,'Can change revision',15,'change_revision'),(59,'Can delete revision',15,'delete_revision'),(60,'Can add version',16,'add_version'),(61,'Can change version',16,'change_version'),(62,'Can delete version',16,'delete_version'),(63,'Can view revision',15,'view_revision'),(64,'Can view version',16,'view_version'),(65,'Can add 农户信息',17,'add_nonghuxinxi'),(66,'Can change 农户信息',17,'change_nonghuxinxi'),(67,'Can delete 农户信息',17,'delete_nonghuxinxi'),(68,'Can add 品种信息',18,'add_pingzhongxinxi'),(69,'Can change 品种信息',18,'change_pingzhongxinxi'),(70,'Can delete 品种信息',18,'delete_pingzhongxinxi'),(71,'Can add 物资信息',19,'add_wuzixinxi'),(72,'Can change 物资信息',19,'change_wuzixinxi'),(73,'Can delete 物资信息',19,'delete_wuzixinxi'),(74,'Can add 顾客信息',20,'add_gukexinxi'),(75,'Can change 顾客信息',20,'change_gukexinxi'),(76,'Can delete 顾客信息',20,'delete_gukexinxi'),(77,'Can add 员工账户',21,'add_employee'),(78,'Can change 员工账户',21,'change_employee'),(79,'Can delete 员工账户',21,'delete_employee'),(80,'Can add 产品信息',22,'add_chanpinxinxi'),(81,'Can change 产品信息',22,'change_chanpinxinxi'),(82,'Can delete 产品信息',22,'delete_chanpinxinxi'),(83,'Can add 公司机构',23,'add_jigou'),(84,'Can change 公司机构',23,'change_jigou'),(85,'Can delete 公司机构',23,'delete_jigou'),(86,'Can view 产品信息',22,'view_chanpinxinxi'),(87,'Can view 员工账户',21,'view_employee'),(88,'Can view 顾客信息',20,'view_gukexinxi'),(89,'Can view 公司机构',23,'view_jigou'),(90,'Can view 农户信息',17,'view_nonghuxinxi'),(91,'Can view 品种信息',18,'view_pingzhongxinxi'),(92,'Can view 物资信息',19,'view_wuzixinxi'),(93,'Can add 物资发放',24,'add_wuzifafang'),(94,'Can change 物资发放',24,'change_wuzifafang'),(95,'Can delete 物资发放',24,'delete_wuzifafang'),(96,'Can add 物资出库',25,'add_wuzichuku'),(97,'Can change 物资出库',25,'change_wuzichuku'),(98,'Can delete 物资出库',25,'delete_wuzichuku'),(99,'Can add 物资库存',26,'add_wuzikucun'),(100,'Can change 物资库存',26,'change_wuzikucun'),(101,'Can delete 物资库存',26,'delete_wuzikucun'),(102,'Can add 物资盘存',27,'add_wuzipancun'),(103,'Can change 物资盘存',27,'change_wuzipancun'),(104,'Can delete 物资盘存',27,'delete_wuzipancun'),(105,'Can add 物资入库',28,'add_wuziruku'),(106,'Can change 物资入库',28,'change_wuziruku'),(107,'Can delete 物资入库',28,'delete_wuziruku'),(108,'Can view 物资出库',25,'view_wuzichuku'),(109,'Can view 物资发放',24,'view_wuzifafang'),(110,'Can view 物资库存',26,'view_wuzikucun'),(111,'Can view 物资盘存',27,'view_wuzipancun'),(112,'Can view 物资入库',28,'view_wuziruku'),(113,'Can add 农户生产计划',29,'add_nonghushengchan'),(114,'Can change 农户生产计划',29,'change_nonghushengchan'),(115,'Can delete 农户生产计划',29,'delete_nonghushengchan'),(116,'Can add 代购点生产计划',30,'add_daigoudianshengchan'),(117,'Can change 代购点生产计划',30,'change_daigoudianshengchan'),(118,'Can delete 代购点生产计划',30,'delete_daigoudianshengchan'),(119,'Can add 蔬菜生产计划',31,'add_shucaishengchan'),(120,'Can change 蔬菜生产计划',31,'change_shucaishengchan'),(121,'Can delete 蔬菜生产计划',31,'delete_shucaishengchan'),(122,'Can add 生产基地生产计划',32,'add_shengchanjidishengchan'),(123,'Can change 生产基地生产计划',32,'change_shengchanjidishengchan'),(124,'Can delete 生产基地生产计划',32,'delete_shengchanjidishengchan'),(125,'Can add 公司生产计划',33,'add_gongsishengchan'),(126,'Can change 公司生产计划',33,'change_gongsishengchan'),(127,'Can delete 公司生产计划',33,'delete_gongsishengchan'),(128,'Can view 代购点生产计划',30,'view_daigoudianshengchan'),(129,'Can view 公司生产计划',33,'view_gongsishengchan'),(130,'Can view 农户生产计划',29,'view_nonghushengchan'),(131,'Can view 生产基地生产计划',32,'view_shengchanjidishengchan'),(132,'Can view 蔬菜生产计划',31,'view_shucaishengchan'),(133,'Can add 产品库存',34,'add_chanpinkucun'),(134,'Can change 产品库存',34,'change_chanpinkucun'),(135,'Can delete 产品库存',34,'delete_chanpinkucun'),(136,'Can add 产品盘存',35,'add_chanpinpancun'),(137,'Can change 产品盘存',35,'change_chanpinpancun'),(138,'Can delete 产品盘存',35,'delete_chanpinpancun'),(139,'Can add 产品入库',36,'add_chanpinruku'),(140,'Can change 产品入库',36,'change_chanpinruku'),(141,'Can delete 产品入库',36,'delete_chanpinruku'),(142,'Can add 产品出库',37,'add_chanpinchuku'),(143,'Can change 产品出库',37,'change_chanpinchuku'),(144,'Can delete 产品出库',37,'delete_chanpinchuku'),(145,'Can add 产品销售',38,'add_chanpinxiaoshou'),(146,'Can change 产品销售',38,'change_chanpinxiaoshou'),(147,'Can delete 产品销售',38,'delete_chanpinxiaoshou'),(148,'Can view 产品出库',37,'view_chanpinchuku'),(149,'Can view 产品库存',34,'view_chanpinkucun'),(150,'Can view 产品盘存',35,'view_chanpinpancun'),(151,'Can view 产品入库',36,'view_chanpinruku'),(152,'Can view 产品销售',38,'view_chanpinxiaoshou');
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
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$rWRC5Y06v0Kg$0gCznVdja8LGu057li+FQ56cuseDoFz8z3aQXyZMG9Q=','2019-01-04 09:06:45.416763',1,'admin','','','',1,1,'2019-01-03 07:44:00.000000'),(2,'pbkdf2_sha256$100000$ipvYW5T7TIOT$UyjTW+mHGfDE0k9CY9uWvPOcNwKi2R124UejOL7VOzs=','2019-01-04 01:07:00.000000',0,'林中龙','','','',1,1,'2019-01-03 07:46:00.000000'),(3,'pbkdf2_sha256$100000$v5gP2XsYmWwt$9gasX11VViTMiXhUk74hDvrwEbbPttLKdHnz/4hfQto=','2019-01-04 09:06:53.620066',0,'肖文慧','','','',1,1,'2019-01-03 08:12:00.000000'),(4,'pbkdf2_sha256$100000$fcANonwihiNK$y8vTG+C6qJMMVpzl4qeLObsyqhJBAgOidw5iUz3+Ww0=','2019-01-04 08:02:35.429973',0,'王一帆','','','',1,1,'2019-01-03 08:13:00.000000'),(5,'pbkdf2_sha256$100000$rBB50qtzq2OA$qK6Q3Bco0ZRhQwubKow9TWJ2+hZHK1hyRKe5Lx2sXPY=','2019-01-04 09:06:38.375210',0,'王周阳','','','',1,1,'2019-01-03 08:15:00.000000'),(6,'pbkdf2_sha256$100000$5B2kNHpba3hQ$QIUP65RZiwIwCxCwhw2ZyvJqkoFno75FSsT+vx2zSf4=',NULL,0,'jidi','','','',0,1,'2019-01-04 09:09:00.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,3,8),(3,4,7),(1,5,6),(4,6,9);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_baozhuangwu`
--

DROP TABLE IF EXISTS `basic_baozhuangwu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic_baozhuangwu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mc` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mc` (`mc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_baozhuangwu`
--

LOCK TABLES `basic_baozhuangwu` WRITE;
/*!40000 ALTER TABLE `basic_baozhuangwu` DISABLE KEYS */;
INSERT INTO `basic_baozhuangwu` VALUES (1,'箱');
/*!40000 ALTER TABLE `basic_baozhuangwu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_jiliangdanwei`
--

DROP TABLE IF EXISTS `basic_jiliangdanwei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic_jiliangdanwei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mc` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mc` (`mc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_jiliangdanwei`
--

LOCK TABLES `basic_jiliangdanwei` WRITE;
/*!40000 ALTER TABLE `basic_jiliangdanwei` DISABLE KEYS */;
INSERT INTO `basic_jiliangdanwei` VALUES (1,'个'),(5,'件'),(3,'捆'),(2,'瓶'),(4,'袋');
/*!40000 ALTER TABLE `basic_jiliangdanwei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_status`
--

DROP TABLE IF EXISTS `basic_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_status`
--

LOCK TABLES `basic_status` WRITE;
/*!40000 ALTER TABLE `basic_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `basic_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_zhongzhidanwei`
--

DROP TABLE IF EXISTS `basic_zhongzhidanwei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic_zhongzhidanwei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mc` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mc` (`mc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_zhongzhidanwei`
--

LOCK TABLES `basic_zhongzhidanwei` WRITE;
/*!40000 ALTER TABLE `basic_zhongzhidanwei` DISABLE KEYS */;
INSERT INTO `basic_zhongzhidanwei` VALUES (2,'亩');
/*!40000 ALTER TABLE `basic_zhongzhidanwei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_chanpinxinxi`
--

DROP TABLE IF EXISTS `company_chanpinxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_chanpinxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpbh` varchar(50) DEFAULT NULL,
  `cpmc` varchar(50) NOT NULL,
  `cpdj` varchar(50) NOT NULL,
  `cd` varchar(50) NOT NULL,
  `jj` decimal(10,2) NOT NULL,
  `cj` decimal(10,2) NOT NULL,
  `bzw` varchar(5) DEFAULT NULL,
  `jgbh_id` int(11) DEFAULT NULL,
  `pzbm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_chanpinxinxi_cpmc_cd_cfb2c2d3_uniq` (`cpmc`,`cd`),
  KEY `company_chanpinxinxi_pzbm_id_72eda9e8_fk_company_p` (`pzbm_id`),
  KEY `company_chanpinxinxi_jgbh_id_85700f8d_fk_company_jigou_id` (`jgbh_id`),
  CONSTRAINT `company_chanpinxinxi_jgbh_id_85700f8d_fk_company_jigou_id` FOREIGN KEY (`jgbh_id`) REFERENCES `company_jigou` (`id`),
  CONSTRAINT `company_chanpinxinxi_pzbm_id_72eda9e8_fk_company_p` FOREIGN KEY (`pzbm_id`) REFERENCES `company_pingzhongxinxi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_chanpinxinxi`
--

LOCK TABLES `company_chanpinxinxi` WRITE;
/*!40000 ALTER TABLE `company_chanpinxinxi` DISABLE KEYS */;
INSERT INTO `company_chanpinxinxi` VALUES (1,'JD03PZ00011','花泽香菜','1','hzau',5.00,5.50,'箱',NULL,1),(22,'JD03PZ00281','刺红茄','1','高州',2.00,4.30,'箱',3,28),(23,'JD03PZ00282','条红茄','2','高州',2.00,4.40,'箱',3,28),(24,'JD03PZ00283','包红茄','3','下桥',2.00,4.60,'箱',3,28),(25,'JD03PZ00284','次红茄','4','下桥',2.00,3.30,'箱',3,28),(26,'JD03PZ00281','刺青瓜','1','连州',2.00,3.50,'箱',3,28),(27,'JD03PZ00284','电次青瓜','4','电白',2.00,3.60,'箱',3,28),(28,'JD03PZ00283','包青瓜','3','高州',2.00,2.20,'箱',NULL,28),(29,'JD03PZ00282','条尖椒','2','连州',2.00,3.50,'箱',NULL,28),(30,'JD03PZ00283','包尖椒','3','连州',2.00,2.90,'箱',NULL,28),(31,'JD03PZ00284','次尖椒','4','连州',2.00,2.80,'箱',NULL,28),(32,'JD03PZ00282','电条尖椒','2','电白',2.00,3.50,'箱',NULL,28),(33,'JD03PZ00283','电包尖椒','3','电白',2.00,3.30,'箱',NULL,28),(34,'JD03PZ00284','电次尖椒','4','电白',2.00,3.30,'箱',NULL,28),(35,'JD03PZ00283','包四季豆','3','连州',2.00,2.30,'箱',NULL,28),(36,'JD03PZ00294','次四季豆','4','连州',2.00,2.10,'箱',NULL,29),(37,'JD03PZ00281','电刺四季豆','1','电白',2.00,3.60,'箱',NULL,28),(38,'JD03PZ00282','电条四季豆','2','电白',2.00,3.50,'箱',NULL,28),(39,'JD03PZ00283','电包四季豆','3','电白',2.00,2.60,'箱',NULL,28),(40,'JD03PZ00284','电次四季豆','4','电白',2.00,2.30,'箱',NULL,28),(41,'JD03PZ00291','刺四季豆','1','高州',2.00,2.50,'箱',NULL,29),(42,'JD03PZ00401','胡萝卜','1','山东',1.20,2.47,'箱',3,40);
/*!40000 ALTER TABLE `company_chanpinxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_employee`
--

DROP TABLE IF EXISTS `company_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `lxdh` varchar(12) NOT NULL,
  `ssjg_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `company_employee_ssjg_id_3c641882_fk_company_jigou_id` (`ssjg_id`),
  CONSTRAINT `company_employee_ssjg_id_3c641882_fk_company_jigou_id` FOREIGN KEY (`ssjg_id`) REFERENCES `company_jigou` (`id`),
  CONSTRAINT `company_employee_user_id_ca189731_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_employee`
--

LOCK TABLES `company_employee` WRITE;
/*!40000 ALTER TABLE `company_employee` DISABLE KEYS */;
INSERT INTO `company_employee` VALUES (1,'林中龙','18627864573',1,2),(2,'肖文慧','15688857458',2,3),(3,'王一帆','13122569852',4,4),(4,'周阳','152336985223',3,5),(5,'admin','18627864573',1,1),(6,'huwentao','8256656',3,6);
/*!40000 ALTER TABLE `company_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_gukexinxi`
--

DROP TABLE IF EXISTS `company_gukexinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_gukexinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gkbh` varchar(20) NOT NULL,
  `gkmc` varchar(20) NOT NULL,
  `gkzz` varchar(20) NOT NULL,
  `lxdh` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gkbh` (`gkbh`),
  UNIQUE KEY `gkmc` (`gkmc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_gukexinxi`
--

LOCK TABLES `company_gukexinxi` WRITE;
/*!40000 ALTER TABLE `company_gukexinxi` DISABLE KEYS */;
INSERT INTO `company_gukexinxi` VALUES (2,'GK00002','林中龙','hzau','120'),(3,'GK00003','陈顺杰','洪山区','15866452356'),(4,'GK00004','董东','青山区','15866985214'),(5,'GK00005','张子风','江夏区','15699854125');
/*!40000 ALTER TABLE `company_gukexinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_jigou`
--

DROP TABLE IF EXISTS `company_jigou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_jigou` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jgbh` varchar(50) NOT NULL,
  `jgmc` varchar(50) NOT NULL,
  `jglb` varchar(50) NOT NULL,
  `lxdh` varchar(12) NOT NULL,
  `level` smallint(5) unsigned DEFAULT NULL,
  `fzr_id` varchar(10) DEFAULT NULL,
  `ssjg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jgbh` (`jgbh`),
  UNIQUE KEY `jgmc` (`jgmc`),
  KEY `company_jigou_fzr_id_ba4d4f34_fk_company_employee_name` (`fzr_id`),
  KEY `company_jigou_ssjg_id_25be9ec5_fk_company_jigou_id` (`ssjg_id`),
  CONSTRAINT `company_jigou_fzr_id_ba4d4f34_fk_company_employee_name` FOREIGN KEY (`fzr_id`) REFERENCES `company_employee` (`name`),
  CONSTRAINT `company_jigou_ssjg_id_25be9ec5_fk_company_jigou_id` FOREIGN KEY (`ssjg_id`) REFERENCES `company_jigou` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_jigou`
--

LOCK TABLES `company_jigou` WRITE;
/*!40000 ALTER TABLE `company_jigou` DISABLE KEYS */;
INSERT INTO `company_jigou` VALUES (1,'GS01','公司01','GS','8253365',0,'林中龙',NULL),(2,'DG02','代购点02','DG','8256985',3,'肖文慧',NULL),(3,'JD03','生产基地03','JD','8225698',1,'周阳',1),(4,'PF04','批发中心04','PF','8254125',2,'王一帆',1),(5,'JD05','生产基地05','JD','8203325',1,NULL,1),(6,'JD06','生产基地06','JD','8532569',1,NULL,1),(7,'PF07','批发中心07','PF','8563325',2,NULL,1),(10,'DG10','代购点10','DG','8265589',3,NULL,6);
/*!40000 ALTER TABLE `company_jigou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_nonghuxinxi`
--

DROP TABLE IF EXISTS `company_nonghuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_nonghuxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nhbh` varchar(100) NOT NULL,
  `nhmc` varchar(100) NOT NULL,
  `nhzz` varchar(100) NOT NULL,
  `lxdh` varchar(12) NOT NULL,
  `dgd_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nhbh` (`nhbh`),
  UNIQUE KEY `nhmc` (`nhmc`),
  KEY `company_nonghuxinxi_dgd_id_76210d61_fk_company_jigou_id` (`dgd_id`),
  CONSTRAINT `company_nonghuxinxi_dgd_id_76210d61_fk_company_jigou_id` FOREIGN KEY (`dgd_id`) REFERENCES `company_jigou` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_nonghuxinxi`
--

LOCK TABLES `company_nonghuxinxi` WRITE;
/*!40000 ALTER TABLE `company_nonghuxinxi` DISABLE KEYS */;
INSERT INTO `company_nonghuxinxi` VALUES (6,'NH00006','王庆','武汉','15688523698',2),(7,'NH00007','刘处','武汉','13255698569',2),(8,'NH00008','肖伟','上海','15699852365',10);
/*!40000 ALTER TABLE `company_nonghuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_pingzhongxinxi`
--

DROP TABLE IF EXISTS `company_pingzhongxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_pingzhongxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pzbm` varchar(20) NOT NULL,
  `pzmc` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pzbm` (`pzbm`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_pingzhongxinxi`
--

LOCK TABLES `company_pingzhongxinxi` WRITE;
/*!40000 ALTER TABLE `company_pingzhongxinxi` DISABLE KEYS */;
INSERT INTO `company_pingzhongxinxi` VALUES (1,'PZ0001','香菜'),(21,'PZ0021','红茄'),(22,'PZ0022','青瓜'),(23,'PZ0023','尖椒'),(24,'PZ0024','大红尖椒'),(25,'PZ0025','海花红椒'),(26,'PZ0026','圆椒'),(27,'PZ0027','炮椒'),(28,'PZ0028','四季豆'),(29,'PZ0029','白四季豆'),(30,'PZ0030','长三角'),(31,'PZ0031','荷豆'),(32,'PZ0032','扁豆'),(33,'PZ0033','以色列番茄'),(34,'PZ0034','101番茄'),(35,'PZ0035','西葫芦'),(36,'PZ0036','节瓜'),(37,'PZ0037','苦瓜'),(38,'PZ0038','长南瓜'),(39,'PZ0039','圆瓜'),(40,'PZ0040','胡萝卜');
/*!40000 ALTER TABLE `company_pingzhongxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_wuzixinxi`
--

DROP TABLE IF EXISTS `company_wuzixinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_wuzixinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wzbh` varchar(50) NOT NULL,
  `wzmc` varchar(50) NOT NULL,
  `jldw` varchar(5) NOT NULL,
  `jj` decimal(10,2) NOT NULL,
  `cj` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wzbh` (`wzbh`),
  UNIQUE KEY `wzmc` (`wzmc`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_wuzixinxi`
--

LOCK TABLES `company_wuzixinxi` WRITE;
/*!40000 ALTER TABLE `company_wuzixinxi` DISABLE KEYS */;
INSERT INTO `company_wuzixinxi` VALUES (17,'WZ017','箩筐','个',2.10,2.10),(18,'WZ018','纸盒','个',2.10,2.10),(19,'WZ019','袋子','个',2.10,2.10),(20,'WZ020','绳子','捆',2.10,2.10),(21,'WZ021','胶筐','个',2.10,2.10),(22,'WZ022','氮肥','袋',4.10,4.10),(23,'WZ023','磷肥','袋',3.10,3.10),(24,'WZ024','钾肥','袋',5.10,5.10),(25,'WZ025','杀虫双','瓶',2.10,2.10),(26,'WZ026','敌敌畏','瓶',3.10,3.10),(27,'WZ027','蚜虫净','瓶',4.10,4.10),(28,'WZ028','西红柿种子','袋',9.10,9.10),(29,'WZ029','西葫芦种子','袋',8.10,8.10),(30,'WZ030','大白菜种子','袋',7.10,7.10),(31,'WZ031','四季豆种子','袋',6.10,6.10),(32,'WZ032','夏尖椒','袋',5.10,5.10);
/*!40000 ALTER TABLE `company_wuzixinxi` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-01-03 08:11:14.596016','1','hzau的花泽香菜',2,'update through import_export',17,1),(2,'2019-01-03 08:11:14.598519','22','高州的刺红茄',1,'new through import_export',17,1),(3,'2019-01-03 08:11:14.599270','23','高州的条红茄',1,'new through import_export',17,1),(4,'2019-01-03 08:11:14.599858','24','下桥的包红茄',1,'new through import_export',17,1),(5,'2019-01-03 08:11:14.600383','25','下桥的次红茄',1,'new through import_export',17,1),(6,'2019-01-03 08:11:14.600966','26','连州的刺青瓜',1,'new through import_export',17,1),(7,'2019-01-03 08:11:14.601545','27','电白的电次青瓜',1,'new through import_export',17,1),(8,'2019-01-03 08:11:14.602126','28','高州的包青瓜',1,'new through import_export',17,1),(9,'2019-01-03 08:11:14.602665','29','连州的条尖椒',1,'new through import_export',17,1),(10,'2019-01-03 08:11:14.603255','30','连州的包尖椒',1,'new through import_export',17,1),(11,'2019-01-03 08:11:14.603741','31','连州的次尖椒',1,'new through import_export',17,1),(12,'2019-01-03 08:11:14.604345','32','电白的电条尖椒',1,'new through import_export',17,1),(13,'2019-01-03 08:11:14.606208','33','电白的电包尖椒',1,'new through import_export',17,1),(14,'2019-01-03 08:11:14.607440','34','电白的电次尖椒',1,'new through import_export',17,1),(15,'2019-01-03 08:11:14.608309','35','连州的包四季豆',1,'new through import_export',17,1),(16,'2019-01-03 08:11:14.609108','36','连州的次四季豆',1,'new through import_export',17,1),(17,'2019-01-03 08:11:14.609917','37','电白的电刺四季豆',1,'new through import_export',17,1),(18,'2019-01-03 08:11:14.610754','38','电白的电条四季豆',1,'new through import_export',17,1),(19,'2019-01-03 08:11:14.611553','39','电白的电包四季豆',1,'new through import_export',17,1),(20,'2019-01-03 08:11:14.612315','40','电白的电次四季豆',1,'new through import_export',17,1),(21,'2019-01-03 08:11:14.613106','41','高州的刺四季豆',1,'new through import_export',17,1),(22,'2019-01-03 08:13:35.507584','1','香菜',2,'update through import_export',22,1),(23,'2019-01-03 08:13:35.508515','21','红茄',1,'new through import_export',22,1),(24,'2019-01-03 08:13:35.509255','22','青瓜',1,'new through import_export',22,1),(25,'2019-01-03 08:13:35.509892','23','尖椒',1,'new through import_export',22,1),(26,'2019-01-03 08:13:35.511372','24','大红尖椒',1,'new through import_export',22,1),(27,'2019-01-03 08:13:35.514140','25','海花红椒',1,'new through import_export',22,1),(28,'2019-01-03 08:13:35.515844','26','圆椒',1,'new through import_export',22,1),(29,'2019-01-03 08:13:35.517449','27','炮椒',1,'new through import_export',22,1),(30,'2019-01-03 08:13:35.518967','28','四季豆',1,'new through import_export',22,1),(31,'2019-01-03 08:13:35.519904','29','白四季豆',1,'new through import_export',22,1),(32,'2019-01-03 08:13:35.522126','30','长三角',1,'new through import_export',22,1),(33,'2019-01-03 08:13:35.523114','31','荷豆',1,'new through import_export',22,1),(34,'2019-01-03 08:13:35.523728','32','扁豆',1,'new through import_export',22,1),(35,'2019-01-03 08:13:35.524380','33','以色列番茄',1,'new through import_export',22,1),(36,'2019-01-03 08:13:35.524926','34','101番茄',1,'new through import_export',22,1),(37,'2019-01-03 08:13:35.525474','35','西葫芦',1,'new through import_export',22,1),(38,'2019-01-03 08:13:35.526014','36','节瓜',1,'new through import_export',22,1),(39,'2019-01-03 08:13:35.526599','37','苦瓜',1,'new through import_export',22,1),(40,'2019-01-03 08:13:35.528154','38','长南瓜',1,'new through import_export',22,1),(41,'2019-01-03 08:13:35.530175','39','圆瓜',1,'new through import_export',22,1),(42,'2019-01-03 08:24:14.714607','17','箩筐',1,'new through import_export',23,1),(43,'2019-01-03 08:24:14.715435','18','纸盒',1,'new through import_export',23,1),(44,'2019-01-03 08:24:14.715970','19','袋子',1,'new through import_export',23,1),(45,'2019-01-03 08:24:14.716509','20','绳子',1,'new through import_export',23,1),(46,'2019-01-03 08:24:14.717012','21','胶筐',1,'new through import_export',23,1),(47,'2019-01-03 08:24:14.717643','22','氮肥',1,'new through import_export',23,1),(48,'2019-01-03 08:24:14.718199','23','磷肥',1,'new through import_export',23,1),(49,'2019-01-03 08:24:14.718748','24','钾肥',1,'new through import_export',23,1),(50,'2019-01-03 08:24:14.719241','25','杀虫双',1,'new through import_export',23,1),(51,'2019-01-03 08:24:14.719730','26','敌敌畏',1,'new through import_export',23,1),(52,'2019-01-03 08:24:14.720314','27','蚜虫净',1,'new through import_export',23,1),(53,'2019-01-03 08:24:14.720856','28','西红柿种子',1,'new through import_export',23,1),(54,'2019-01-03 08:24:14.721283','29','西葫芦种子',1,'new through import_export',23,1),(55,'2019-01-03 08:24:14.721744','30','大白菜种子',1,'new through import_export',23,1),(56,'2019-01-03 08:24:14.722179','31','四季豆种子',1,'new through import_export',23,1),(57,'2019-01-03 08:24:14.722703','32','夏尖椒',1,'new through import_export',23,1),(58,'2019-01-03 08:28:29.929008','1','hzau的花泽香菜',2,'update through import_export',17,1),(59,'2019-01-03 08:28:29.930018','22','高州的刺红茄',2,'update through import_export',17,1),(60,'2019-01-03 08:28:29.930826','23','高州的条红茄',2,'update through import_export',17,1),(61,'2019-01-03 08:28:29.931451','24','下桥的包红茄',2,'update through import_export',17,1),(62,'2019-01-03 08:28:29.932044','25','下桥的次红茄',2,'update through import_export',17,1),(63,'2019-01-03 08:28:29.932620','26','连州的刺青瓜',2,'update through import_export',17,1),(64,'2019-01-03 08:28:29.933318','27','电白的电次青瓜',2,'update through import_export',17,1),(65,'2019-01-03 08:28:29.934298','28','高州的包青瓜',2,'update through import_export',17,1),(66,'2019-01-03 08:28:29.935271','29','连州的条尖椒',2,'update through import_export',17,1),(67,'2019-01-03 08:28:29.935991','30','连州的包尖椒',2,'update through import_export',17,1),(68,'2019-01-03 08:28:29.936645','31','连州的次尖椒',2,'update through import_export',17,1),(69,'2019-01-03 08:28:29.937356','32','电白的电条尖椒',2,'update through import_export',17,1),(70,'2019-01-03 08:28:29.938258','33','电白的电包尖椒',2,'update through import_export',17,1),(71,'2019-01-03 08:28:29.939166','34','电白的电次尖椒',2,'update through import_export',17,1),(72,'2019-01-03 08:28:29.940213','35','连州的包四季豆',2,'update through import_export',17,1),(73,'2019-01-03 08:28:29.941052','36','连州的次四季豆',2,'update through import_export',17,1),(74,'2019-01-03 08:28:29.941918','37','电白的电刺四季豆',2,'update through import_export',17,1),(75,'2019-01-03 08:28:29.942690','38','电白的电条四季豆',2,'update through import_export',17,1),(76,'2019-01-03 08:28:29.943503','39','电白的电包四季豆',2,'update through import_export',17,1),(77,'2019-01-03 08:28:29.944384','40','电白的电次四季豆',2,'update through import_export',17,1),(78,'2019-01-03 08:28:29.945433','41','高州的刺四季豆',2,'update through import_export',17,1),(79,'2019-01-04 07:51:46.294278','5','张一',2,'update through import_export',17,1),(80,'2019-01-04 07:51:46.295549','6','王庆',2,'update through import_export',17,1),(81,'2019-01-04 07:51:46.296112','7','刘处',2,'update through import_export',17,1),(82,'2019-01-04 08:00:20.507047','15','代购点02入库电次青瓜 500',2,'update through import_export',36,3),(83,'2019-01-04 08:00:20.507855','16','代购点02入库花泽香菜 100',2,'update through import_export',36,3),(84,'2019-01-04 08:00:20.508432','17','代购点02入库刺红茄 200',2,'update through import_export',36,3),(85,'2019-01-04 08:00:20.508983','18','代购点02入库包青瓜 300',2,'update through import_export',36,3),(86,'2019-01-04 08:00:20.509559','20','代购点02入库包青瓜 300',1,'new through import_export',36,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(7,'basic','baozhuangwu'),(9,'basic','jiliangdanwei'),(8,'basic','status'),(10,'basic','zhongzhidanwei'),(22,'company','chanpinxinxi'),(21,'company','employee'),(20,'company','gukexinxi'),(23,'company','jigou'),(17,'company','nonghuxinxi'),(18,'company','pingzhongxinxi'),(19,'company','wuzixinxi'),(5,'contenttypes','contenttype'),(25,'inventory','wuzichuku'),(24,'inventory','wuzifafang'),(26,'inventory','wuzikucun'),(27,'inventory','wuzipancun'),(28,'inventory','wuziruku'),(30,'product','daigoudianshengchan'),(33,'product','gongsishengchan'),(29,'product','nonghushengchan'),(32,'product','shengchanjidishengchan'),(31,'product','shucaishengchan'),(15,'reversion','revision'),(16,'reversion','version'),(37,'sale','chanpinchuku'),(34,'sale','chanpinkucun'),(35,'sale','chanpinpancun'),(36,'sale','chanpinruku'),(38,'sale','chanpinxiaoshou'),(6,'sessions','session'),(11,'xadmin','bookmark'),(14,'xadmin','log'),(13,'xadmin','usersettings'),(12,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-04 02:11:06.575992'),(2,'auth','0001_initial','2019-01-04 02:11:07.118930'),(3,'admin','0001_initial','2019-01-04 02:11:07.239086'),(4,'admin','0002_logentry_remove_auto_add','2019-01-04 02:11:07.253659'),(5,'contenttypes','0002_remove_content_type_name','2019-01-04 02:11:07.340518'),(6,'auth','0002_alter_permission_name_max_length','2019-01-04 02:11:07.385033'),(7,'auth','0003_alter_user_email_max_length','2019-01-04 02:11:07.409287'),(8,'auth','0004_alter_user_username_opts','2019-01-04 02:11:07.422739'),(9,'auth','0005_alter_user_last_login_null','2019-01-04 02:11:07.468575'),(10,'auth','0006_require_contenttypes_0002','2019-01-04 02:11:07.475529'),(11,'auth','0007_alter_validators_add_error_messages','2019-01-04 02:11:07.490997'),(12,'auth','0008_alter_user_username_max_length','2019-01-04 02:11:07.589836'),(13,'auth','0009_alter_user_last_name_max_length','2019-01-04 02:11:07.637891'),(14,'basic','0001_initial','2019-01-04 02:11:07.752373'),(15,'reversion','0001_squashed_0004_auto_20160611_1202','2019-01-04 02:11:07.992242'),(16,'sessions','0001_initial','2019-01-04 02:11:08.044993'),(17,'xadmin','0001_initial','2019-01-04 02:11:08.438480'),(18,'company','0001_initial','2019-01-04 02:11:22.975979'),(19,'inventory','0001_initial','2019-01-04 02:11:24.044704'),(20,'product','0001_initial','2019-01-04 02:11:25.650167'),(21,'sale','0001_initial','2019-01-04 02:11:27.270134'),(22,'company','0002_auto_20190104_1523','2019-01-04 07:23:34.478112'),(23,'product','0002_auto_20190104_1523','2019-01-04 07:23:34.680316'),(24,'company','0003_auto_20190104_1544','2019-01-04 07:44:37.908898');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('12bm4mdalj4qziwg0xn6fkpml28n50jt','NDY4YjQwNWUyNmNjNWI0NDIyMmE1NDBjZmVhM2Q0MGQ2N2ZhOWRjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjMzOTE2NjQ3NzQ1ZjE5ZmFkMmUwOWUwMjRhN2U4YWFhNzMxN2I3ZWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIkxJU1RfUVVFUlkiOltbInByb2R1Y3QiLCJnb25nc2lzaGVuZ2NoYW4iXSwiIl0sIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-18 09:13:11.609939'),('7i9h6yxbs6g3df6ytq8aj24lzmzxkamj','ZTY5MmU4MmM5Y2RiMzc1YzMwMDdjZjQ3NjA4MzUwYjI0NWIzYmViZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJjb21wYW55IiwiY2hhbnBpbnhpbnhpIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiIzMzkxNjY0Nzc0NWYxOWZhZDJlMDllMDI0YTdlOGFhYTczMTdiN2VhIn0=','2019-01-18 08:43:44.163624'),('89jfjhbas9hlq5rnsmoyhta282ucreuz','ZjMxZmI3NGYwMTc1MmUzYTZmZjdiZDBhZGZjNDBhMTY2MTgzYTE4Zjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwZjY5MDA5MzU5MzRiZDljZmY1MGRhN2NjMGFmZWUyODkwN2M0Y2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2019-01-18 09:06:53.626379'),('8jli0g2mhb6egmj63ignqy1ldbfyg7ze','Njk0YTIxYzVjYjkwMGUwNjZhZWFiOGYzMzNiNDI3NTg2ODNlNGIzYzp7IndpemFyZF94YWRtaW51c2Vyd2lkZ2V0X2FkbWluX3dpemFyZF9mb3JtX3BsdWdpbiI6eyJzdGVwX2RhdGEiOnt9LCJzdGVwX2ZpbGVzIjp7fSwiZXh0cmFfZGF0YSI6e30sInN0ZXAiOm51bGx9LCJfYXV0aF91c2VyX2hhc2giOiIzMzkxNjY0Nzc0NWYxOWZhZDJlMDllMDI0YTdlOGFhYTczMTdiN2VhIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJwcm9kdWN0IiwiZ29uZ3Npc2hlbmdjaGFuIl0sIiJdLCJfYXV0aF91c2VyX2lkIjoiMSJ9','2019-01-18 09:05:27.259398'),('d81jy24z6h0h1pq4j4u2aq9hyvbtfj64','OTNiZWE1NzY5MDZiMjYyZWZmOTRjODEwNmI1Y2E5ZDg2MGRiZGMyNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3ODhjMjE0OGU5ZDk2ZWRkYzRkZjUyMWE0MjdmYTI0NWQwYTFmYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIkxJU1RfUVVFUlkiOltbInNhbGUiLCJjaGFucGlucGFuY3VuIl0sIiJdLCJfYXV0aF91c2VyX2lkIjoiNSJ9','2019-01-18 08:46:51.558476'),('o9xtfcw2io6spzv9y7ccefq0euf2nzoo','MmI5OWY1Njk3YmIzZmUzN2E1MjRmMTMwMmE0NzhmMWFlMDlkOGEzMjp7IndpemFyZF94YWRtaW51c2Vyd2lkZ2V0X2FkbWluX3dpemFyZF9mb3JtX3BsdWdpbiI6eyJzdGVwX2RhdGEiOnt9LCJzdGVwX2ZpbGVzIjp7fSwiZXh0cmFfZGF0YSI6e30sInN0ZXAiOm51bGx9LCJMSVNUX1FVRVJZIjpbWyJiYXNpYyIsInpob25nemhpZGFud2VpIl0sIiJdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzM5MTY2NDc3NDVmMTlmYWQyZTA5ZTAyNGE3ZThhYWE3MzE3YjdlYSJ9','2019-01-18 09:00:36.543636'),('tpknfk06igjxlc3uyzk2ox1s6fnub4ro','NTczNGRiYTZmM2Y5MTFmNDNhMDM4YzEwM2VmY2I1ODY4ZDI3MGYyMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3ODhjMjE0OGU5ZDk2ZWRkYzRkZjUyMWE0MjdmYTI0NWQwYTFmYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIkxJU1RfUVVFUlkiOltbImNvbXBhbnkiLCJjaGFucGlueGlueGkiXSwiIl0sIl9hdXRoX3VzZXJfaWQiOiI1In0=','2019-01-18 09:08:40.416093'),('wgilhu6ysvl1qiah1mpny1npkewf66f3','YzU4YzNhOWIwN2ZlNGRmMzI3YmYzNGIzZDhjMWRjYWRkYTM0OTFlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1siaW52ZW50b3J5Iiwid3V6aWZhZmFuZyJdLCIiXSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMzkxNjY0Nzc0NWYxOWZhZDJlMDllMDI0YTdlOGFhYTczMTdiN2VhIn0=','2019-01-18 08:56:50.435998');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_wuzichuku`
--

DROP TABLE IF EXISTS `inventory_wuzichuku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_wuzichuku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ckdh` varchar(50) NOT NULL,
  `cj` decimal(10,2) DEFAULT NULL,
  `sl` int(11) NOT NULL,
  `je` decimal(20,2) DEFAULT NULL,
  `czsj` datetime(6) NOT NULL,
  `date` date NOT NULL,
  `czz_id` varchar(10) NOT NULL,
  `wzkc_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckdh` (`ckdh`),
  KEY `inventory_wuzichuku_czz_id_4f4cfbf4_fk_company_employee_name` (`czz_id`),
  KEY `inventory_wuzichuku_wzkc_id_1f29cf78_fk_inventory_wuzikucun_id` (`wzkc_id`),
  CONSTRAINT `inventory_wuzichuku_czz_id_4f4cfbf4_fk_company_employee_name` FOREIGN KEY (`czz_id`) REFERENCES `company_employee` (`name`),
  CONSTRAINT `inventory_wuzichuku_wzkc_id_1f29cf78_fk_inventory_wuzikucun_id` FOREIGN KEY (`wzkc_id`) REFERENCES `inventory_wuzikucun` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_wuzichuku`
--

LOCK TABLES `inventory_wuzichuku` WRITE;
/*!40000 ALTER TABLE `inventory_wuzichuku` DISABLE KEYS */;
INSERT INTO `inventory_wuzichuku` VALUES (7,'0000007',0.50,100,50.00,'2019-01-01 07:06:00.000000','2019-01-01','林中龙',22),(8,'0000008',2.10,200,420.00,'2019-01-08 08:49:00.000000','2019-01-08','admin',30),(9,'0000009',2.10,500,1050.00,'2019-01-04 08:49:00.000000','2019-01-04','王一帆',28),(10,'0000010',2.10,100,210.00,'2019-01-15 08:50:00.000000','2019-01-15','王一帆',26),(11,'0000011',2.10,20,42.00,'2018-12-30 08:54:00.000000','2018-12-30','肖文慧',25),(12,'0000012',2.10,20,42.00,'2018-12-30 08:54:00.000000','2018-12-30','肖文慧',25);
/*!40000 ALTER TABLE `inventory_wuzichuku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_wuzifafang`
--

DROP TABLE IF EXISTS `inventory_wuzifafang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_wuzifafang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ffbh` varchar(20) NOT NULL,
  `cj` decimal(10,2) DEFAULT NULL,
  `sl` int(11) NOT NULL,
  `je` decimal(20,2) DEFAULT NULL,
  `czsj` datetime(6) NOT NULL,
  `date` date NOT NULL,
  `czz_id` varchar(10) NOT NULL,
  `nh_id` int(11) NOT NULL,
  `wzkc_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ffbh` (`ffbh`),
  KEY `inventory_wuzifafang_czz_id_18e5f664_fk_company_employee_name` (`czz_id`),
  KEY `inventory_wuzifafang_nh_id_8e13888e_fk_company_nonghuxinxi_id` (`nh_id`),
  KEY `inventory_wuzifafang_wzkc_id_26b6a170_fk_inventory_wuzikucun_id` (`wzkc_id`),
  CONSTRAINT `inventory_wuzifafang_czz_id_18e5f664_fk_company_employee_name` FOREIGN KEY (`czz_id`) REFERENCES `company_employee` (`name`),
  CONSTRAINT `inventory_wuzifafang_nh_id_8e13888e_fk_company_nonghuxinxi_id` FOREIGN KEY (`nh_id`) REFERENCES `company_nonghuxinxi` (`id`),
  CONSTRAINT `inventory_wuzifafang_wzkc_id_26b6a170_fk_inventory_wuzikucun_id` FOREIGN KEY (`wzkc_id`) REFERENCES `inventory_wuzikucun` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_wuzifafang`
--

LOCK TABLES `inventory_wuzifafang` WRITE;
/*!40000 ALTER TABLE `inventory_wuzifafang` DISABLE KEYS */;
INSERT INTO `inventory_wuzifafang` VALUES (6,'0000006',2.10,100,210.00,'2019-01-04 08:10:00.000000','2019-01-04','肖文慧',6,30),(7,'0000007',2.10,150,315.00,'2018-12-30 08:11:00.000000','2018-12-30','肖文慧',6,31),(8,'0000008',2.10,200,420.00,'2019-01-01 08:11:00.000000','2019-01-01','肖文慧',6,32),(9,'0000009',2.10,250,525.00,'2019-01-05 08:11:00.000000','2019-01-05','肖文慧',6,33);
/*!40000 ALTER TABLE `inventory_wuzifafang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_wuzikucun`
--

DROP TABLE IF EXISTS `inventory_wuzikucun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_wuzikucun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wzkcbh` varchar(50) NOT NULL,
  `wzmc` varchar(50) NOT NULL,
  `ssjg_id` int(11) NOT NULL,
  `wzbh_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wzkcbh` (`wzkcbh`),
  KEY `inventory_wuzikucun_ssjg_id_4628f344_fk_company_jigou_id` (`ssjg_id`),
  KEY `inventory_wuzikucun_wzbh_id_9f735388_fk_company_wuzixinxi_id` (`wzbh_id`),
  CONSTRAINT `inventory_wuzikucun_ssjg_id_4628f344_fk_company_jigou_id` FOREIGN KEY (`ssjg_id`) REFERENCES `company_jigou` (`id`),
  CONSTRAINT `inventory_wuzikucun_wzbh_id_9f735388_fk_company_wuzixinxi_id` FOREIGN KEY (`wzbh_id`) REFERENCES `company_wuzixinxi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_wuzikucun`
--

LOCK TABLES `inventory_wuzikucun` WRITE;
/*!40000 ALTER TABLE `inventory_wuzikucun` DISABLE KEYS */;
INSERT INTO `inventory_wuzikucun` VALUES (21,'GS01WZ028','西红柿种子',1,28),(22,'GS01WZ017','箩筐',1,17),(23,'GS01WZ018','纸盒',1,18),(24,'GS01WZ020','绳子',1,20),(25,'GS01WZ021','胶筐',1,21),(26,'GS01WZ025','杀虫双',1,25),(27,'JD03WZ017','箩筐',3,17),(28,'JD03WZ020','绳子',3,20),(29,'JD03WZ018','纸盒',3,18),(30,'DG02WZ017','箩筐',2,17),(31,'DG02WZ018','纸盒',2,18),(32,'DG02WZ019','袋子',2,19),(33,'DG02WZ020','绳子',2,20),(34,'DG02WZ028','西红柿种子',2,28);
/*!40000 ALTER TABLE `inventory_wuzikucun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_wuzipancun`
--

DROP TABLE IF EXISTS `inventory_wuzipancun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_wuzipancun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sl` int(11) NOT NULL,
  `czsj` datetime(6) NOT NULL,
  `date` date NOT NULL,
  `czz_id` varchar(10) NOT NULL,
  `wzkc_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_wuzipancun_czz_id_37b5e95e_fk_company_employee_name` (`czz_id`),
  KEY `inventory_wuzipancun_wzkc_id_5435b9b0_fk_inventory_wuzikucun_id` (`wzkc_id`),
  CONSTRAINT `inventory_wuzipancun_czz_id_37b5e95e_fk_company_employee_name` FOREIGN KEY (`czz_id`) REFERENCES `company_employee` (`name`),
  CONSTRAINT `inventory_wuzipancun_wzkc_id_5435b9b0_fk_inventory_wuzikucun_id` FOREIGN KEY (`wzkc_id`) REFERENCES `inventory_wuzikucun` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_wuzipancun`
--

LOCK TABLES `inventory_wuzipancun` WRITE;
/*!40000 ALTER TABLE `inventory_wuzipancun` DISABLE KEYS */;
INSERT INTO `inventory_wuzipancun` VALUES (5,200,'2019-01-04 08:12:00.000000','2019-01-04','肖文慧',30),(6,-100,'2019-01-04 08:12:00.000000','2019-01-04','肖文慧',31);
/*!40000 ALTER TABLE `inventory_wuzipancun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_wuziruku`
--

DROP TABLE IF EXISTS `inventory_wuziruku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_wuziruku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rkdh` varchar(50) NOT NULL,
  `cj` decimal(10,2) DEFAULT NULL,
  `sl` int(11) NOT NULL,
  `je` decimal(20,2) DEFAULT NULL,
  `czsj` datetime(6) NOT NULL,
  `date` date NOT NULL,
  `czz_id` varchar(10) NOT NULL,
  `wzkc_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rkdh` (`rkdh`),
  KEY `inventory_wuziruku_czz_id_2994b963_fk_company_employee_name` (`czz_id`),
  KEY `inventory_wuziruku_wzkc_id_7e591e00_fk_inventory_wuzikucun_id` (`wzkc_id`),
  CONSTRAINT `inventory_wuziruku_czz_id_2994b963_fk_company_employee_name` FOREIGN KEY (`czz_id`) REFERENCES `company_employee` (`name`),
  CONSTRAINT `inventory_wuziruku_wzkc_id_7e591e00_fk_inventory_wuzikucun_id` FOREIGN KEY (`wzkc_id`) REFERENCES `inventory_wuzikucun` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_wuziruku`
--

LOCK TABLES `inventory_wuziruku` WRITE;
/*!40000 ALTER TABLE `inventory_wuziruku` DISABLE KEYS */;
INSERT INTO `inventory_wuziruku` VALUES (9,'0000009',1.20,800,960.00,'2019-01-04 07:03:00.000000','2019-01-04','林中龙',21),(10,'0000010',0.30,500,150.00,'2019-01-01 07:04:00.000000','2019-01-01','林中龙',22),(11,'0000011',2.00,500,1000.00,'2018-12-25 07:04:00.000000','2018-12-25','周阳',27),(12,'0000012',3.00,50,150.00,'2018-12-27 07:05:00.000000','2018-12-27','周阳',28),(13,'0000013',2.10,200,420.00,'2019-01-04 07:06:00.000000','2019-01-04','肖文慧',30),(14,'0000014',2.10,900,1890.00,'2019-01-02 07:07:00.000000','2019-01-02','肖文慧',31),(15,'0000015',2.00,60,120.00,'2019-01-04 07:07:00.000000','2019-01-04','周阳',29),(16,'0000016',2.10,500,1050.00,'2018-12-01 08:08:00.000000','2018-12-01','肖文慧',30),(17,'0000017',2.10,1500,3150.00,'2018-12-30 08:09:00.000000','2018-12-30','肖文慧',24),(18,'0000018',2.10,2000,4200.00,'2018-12-31 08:09:00.000000','2018-12-31','肖文慧',33),(19,'0000019',2.10,1300,2730.00,'2018-12-26 08:10:00.000000','2018-12-26','肖文慧',32),(20,'0000020',9.10,2000,18200.00,'2019-01-02 08:10:00.000000','2019-01-02','肖文慧',34);
/*!40000 ALTER TABLE `inventory_wuziruku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_daigoudianshengchan`
--

DROP TABLE IF EXISTS `product_daigoudianshengchan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_daigoudianshengchan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zdsj` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `dgd_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `zdr_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_daigoudiansh_parent_id_32db30ba_fk_product_s` (`parent_id`),
  KEY `product_daigoudiansh_zdr_id_e190563f_fk_company_e` (`zdr_id`),
  KEY `product_daigoudianshengchan_dgd_id_b71eb721_fk_company_jigou_id` (`dgd_id`),
  CONSTRAINT `product_daigoudiansh_parent_id_32db30ba_fk_product_s` FOREIGN KEY (`parent_id`) REFERENCES `product_shengchanjidishengchan` (`id`),
  CONSTRAINT `product_daigoudiansh_zdr_id_e190563f_fk_company_e` FOREIGN KEY (`zdr_id`) REFERENCES `company_employee` (`name`),
  CONSTRAINT `product_daigoudianshengchan_dgd_id_b71eb721_fk_company_jigou_id` FOREIGN KEY (`dgd_id`) REFERENCES `company_jigou` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_daigoudianshengchan`
--

LOCK TABLES `product_daigoudianshengchan` WRITE;
/*!40000 ALTER TABLE `product_daigoudianshengchan` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_daigoudianshengchan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_daigoudianshengchan_scscjh`
--

DROP TABLE IF EXISTS `product_daigoudianshengchan_scscjh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_daigoudianshengchan_scscjh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daigoudianshengchan_id` int(11) NOT NULL,
  `shucaishengchan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_daigoudianshengc_daigoudianshengchan_id_s_28331710_uniq` (`daigoudianshengchan_id`,`shucaishengchan_id`),
  KEY `product_daigoudiansh_shucaishengchan_id_3cb0fef2_fk_product_s` (`shucaishengchan_id`),
  CONSTRAINT `product_daigoudiansh_daigoudianshengchan__0ccc2d97_fk_product_d` FOREIGN KEY (`daigoudianshengchan_id`) REFERENCES `product_daigoudianshengchan` (`id`),
  CONSTRAINT `product_daigoudiansh_shucaishengchan_id_3cb0fef2_fk_product_s` FOREIGN KEY (`shucaishengchan_id`) REFERENCES `product_shucaishengchan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_daigoudianshengchan_scscjh`
--

LOCK TABLES `product_daigoudianshengchan_scscjh` WRITE;
/*!40000 ALTER TABLE `product_daigoudianshengchan_scscjh` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_daigoudianshengchan_scscjh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_gongsishengchan`
--

DROP TABLE IF EXISTS `product_gongsishengchan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_gongsishengchan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scjhbh` varchar(50) NOT NULL,
  `zdsj` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `zdr_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scjhbh` (`scjhbh`),
  KEY `product_gongsishengchan_zdr_id_65af879e_fk_company_employee_name` (`zdr_id`),
  CONSTRAINT `product_gongsishengchan_zdr_id_65af879e_fk_company_employee_name` FOREIGN KEY (`zdr_id`) REFERENCES `company_employee` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_gongsishengchan`
--

LOCK TABLES `product_gongsishengchan` WRITE;
/*!40000 ALTER TABLE `product_gongsishengchan` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_gongsishengchan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_gongsishengchan_scscjh`
--

DROP TABLE IF EXISTS `product_gongsishengchan_scscjh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_gongsishengchan_scscjh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gongsishengchan_id` int(11) NOT NULL,
  `shucaishengchan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_gongsishengchan__gongsishengchan_id_shuca_945e55a3_uniq` (`gongsishengchan_id`,`shucaishengchan_id`),
  KEY `product_gongsishengc_shucaishengchan_id_0defef9f_fk_product_s` (`shucaishengchan_id`),
  CONSTRAINT `product_gongsishengc_gongsishengchan_id_552325d6_fk_product_g` FOREIGN KEY (`gongsishengchan_id`) REFERENCES `product_gongsishengchan` (`id`),
  CONSTRAINT `product_gongsishengc_shucaishengchan_id_0defef9f_fk_product_s` FOREIGN KEY (`shucaishengchan_id`) REFERENCES `product_shucaishengchan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_gongsishengchan_scscjh`
--

LOCK TABLES `product_gongsishengchan_scscjh` WRITE;
/*!40000 ALTER TABLE `product_gongsishengchan_scscjh` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_gongsishengchan_scscjh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_nonghushengchan`
--

DROP TABLE IF EXISTS `product_nonghushengchan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_nonghushengchan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zdsj` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `nh_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `zdr_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_nonghushengchan_nh_id_bfaccdff_fk_company_nonghuxinxi_id` (`nh_id`),
  KEY `product_nonghushengc_parent_id_00308db0_fk_product_d` (`parent_id`),
  KEY `product_nonghushengchan_zdr_id_18e96525_fk_company_employee_name` (`zdr_id`),
  CONSTRAINT `product_nonghushengc_parent_id_00308db0_fk_product_d` FOREIGN KEY (`parent_id`) REFERENCES `product_daigoudianshengchan` (`id`),
  CONSTRAINT `product_nonghushengchan_nh_id_bfaccdff_fk_company_nonghuxinxi_id` FOREIGN KEY (`nh_id`) REFERENCES `company_nonghuxinxi` (`id`),
  CONSTRAINT `product_nonghushengchan_zdr_id_18e96525_fk_company_employee_name` FOREIGN KEY (`zdr_id`) REFERENCES `company_employee` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_nonghushengchan`
--

LOCK TABLES `product_nonghushengchan` WRITE;
/*!40000 ALTER TABLE `product_nonghushengchan` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_nonghushengchan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_nonghushengchan_scscjh`
--

DROP TABLE IF EXISTS `product_nonghushengchan_scscjh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_nonghushengchan_scscjh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonghushengchan_id` int(11) NOT NULL,
  `shucaishengchan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_nonghushengchan__nonghushengchan_id_shuca_02b50b88_uniq` (`nonghushengchan_id`,`shucaishengchan_id`),
  KEY `product_nonghushengc_shucaishengchan_id_625fa556_fk_product_s` (`shucaishengchan_id`),
  CONSTRAINT `product_nonghushengc_nonghushengchan_id_aada5ce0_fk_product_n` FOREIGN KEY (`nonghushengchan_id`) REFERENCES `product_nonghushengchan` (`id`),
  CONSTRAINT `product_nonghushengc_shucaishengchan_id_625fa556_fk_product_s` FOREIGN KEY (`shucaishengchan_id`) REFERENCES `product_shucaishengchan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_nonghushengchan_scscjh`
--

LOCK TABLES `product_nonghushengchan_scscjh` WRITE;
/*!40000 ALTER TABLE `product_nonghushengchan_scscjh` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_nonghushengchan_scscjh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_shengchanjidishengchan`
--

DROP TABLE IF EXISTS `product_shengchanjidishengchan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_shengchanjidishengchan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zdsj` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `scjd_id` int(11) NOT NULL,
  `zdr_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_shengchanjid_parent_id_53a301d6_fk_product_g` (`parent_id`),
  KEY `product_shengchanjid_zdr_id_0ef62292_fk_company_e` (`zdr_id`),
  KEY `product_shengchanjid_scjd_id_73a78a36_fk_company_j` (`scjd_id`),
  CONSTRAINT `product_shengchanjid_parent_id_53a301d6_fk_product_g` FOREIGN KEY (`parent_id`) REFERENCES `product_gongsishengchan` (`id`),
  CONSTRAINT `product_shengchanjid_scjd_id_73a78a36_fk_company_j` FOREIGN KEY (`scjd_id`) REFERENCES `company_jigou` (`id`),
  CONSTRAINT `product_shengchanjid_zdr_id_0ef62292_fk_company_e` FOREIGN KEY (`zdr_id`) REFERENCES `company_employee` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_shengchanjidishengchan`
--

LOCK TABLES `product_shengchanjidishengchan` WRITE;
/*!40000 ALTER TABLE `product_shengchanjidishengchan` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_shengchanjidishengchan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_shengchanjidishengchan_scscjh`
--

DROP TABLE IF EXISTS `product_shengchanjidishengchan_scscjh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_shengchanjidishengchan_scscjh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shengchanjidishengchan_id` int(11) NOT NULL,
  `shucaishengchan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_shengchanjidishe_shengchanjidishengchan_i_5cabb3f2_uniq` (`shengchanjidishengchan_id`,`shucaishengchan_id`),
  KEY `product_shengchanjid_shucaishengchan_id_c1655580_fk_product_s` (`shucaishengchan_id`),
  CONSTRAINT `product_shengchanjid_shengchanjidishengch_e3376721_fk_product_s` FOREIGN KEY (`shengchanjidishengchan_id`) REFERENCES `product_shengchanjidishengchan` (`id`),
  CONSTRAINT `product_shengchanjid_shucaishengchan_id_c1655580_fk_product_s` FOREIGN KEY (`shucaishengchan_id`) REFERENCES `product_shucaishengchan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_shengchanjidishengchan_scscjh`
--

LOCK TABLES `product_shengchanjidishengchan_scscjh` WRITE;
/*!40000 ALTER TABLE `product_shengchanjidishengchan_scscjh` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_shengchanjidishengchan_scscjh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_shucaishengchan`
--

DROP TABLE IF EXISTS `product_shucaishengchan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_shucaishengchan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zzmj` int(11) NOT NULL,
  `dw` varchar(5) NOT NULL,
  `bzq` date NOT NULL,
  `scbh_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_shucaishengc_scbh_id_0d8c6643_fk_company_c` (`scbh_id`),
  CONSTRAINT `product_shucaishengc_scbh_id_0d8c6643_fk_company_c` FOREIGN KEY (`scbh_id`) REFERENCES `company_chanpinxinxi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_shucaishengchan`
--

LOCK TABLES `product_shucaishengchan` WRITE;
/*!40000 ALTER TABLE `product_shucaishengchan` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_shucaishengchan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_revision`
--

DROP TABLE IF EXISTS `reversion_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_auth_user_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_revision`
--

LOCK TABLES `reversion_revision` WRITE;
/*!40000 ALTER TABLE `reversion_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_version`
--

DROP TABLE IF EXISTS `reversion_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_content_type_id_objec_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_version_content_type_id_7d0ff25c_fk_django_co` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_version`
--

LOCK TABLES `reversion_version` WRITE;
/*!40000 ALTER TABLE `reversion_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_chanpinchuku`
--

DROP TABLE IF EXISTS `sale_chanpinchuku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_chanpinchuku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ckdh` varchar(50) NOT NULL,
  `dj` decimal(10,2) DEFAULT NULL,
  `sl` int(11) NOT NULL,
  `je` decimal(20,2) DEFAULT NULL,
  `czsj` datetime(6) NOT NULL,
  `pm` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `cpkc_id` int(11) NOT NULL,
  `jsr_id` varchar(10) DEFAULT NULL,
  `jyr_id` varchar(10) DEFAULT NULL,
  `nh_id` int(11) DEFAULT NULL,
  `rkdh_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckdh` (`ckdh`),
  UNIQUE KEY `rkdh_id` (`rkdh_id`),
  KEY `sale_chanpinchuku_cpkc_id_332d2b18_fk_sale_chanpinkucun_id` (`cpkc_id`),
  KEY `sale_chanpinchuku_jsr_id_dcae66e6_fk_company_employee_name` (`jsr_id`),
  KEY `sale_chanpinchuku_jyr_id_de23a348_fk_company_employee_name` (`jyr_id`),
  KEY `sale_chanpinchuku_nh_id_d4ceb0be_fk_company_nonghuxinxi_id` (`nh_id`),
  CONSTRAINT `sale_chanpinchuku_cpkc_id_332d2b18_fk_sale_chanpinkucun_id` FOREIGN KEY (`cpkc_id`) REFERENCES `sale_chanpinkucun` (`id`),
  CONSTRAINT `sale_chanpinchuku_jsr_id_dcae66e6_fk_company_employee_name` FOREIGN KEY (`jsr_id`) REFERENCES `company_employee` (`name`),
  CONSTRAINT `sale_chanpinchuku_jyr_id_de23a348_fk_company_employee_name` FOREIGN KEY (`jyr_id`) REFERENCES `company_employee` (`name`),
  CONSTRAINT `sale_chanpinchuku_nh_id_d4ceb0be_fk_company_nonghuxinxi_id` FOREIGN KEY (`nh_id`) REFERENCES `company_nonghuxinxi` (`id`),
  CONSTRAINT `sale_chanpinchuku_rkdh_id_55bc9ab6_fk_sale_chanpinruku_id` FOREIGN KEY (`rkdh_id`) REFERENCES `sale_chanpinruku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_chanpinchuku`
--

LOCK TABLES `sale_chanpinchuku` WRITE;
/*!40000 ALTER TABLE `sale_chanpinchuku` DISABLE KEYS */;
INSERT INTO `sale_chanpinchuku` VALUES (10,'0000010',0.00,200,0.00,'2018-12-30 08:01:00.000000','代购点02','2018-12-30',1,'肖文慧','肖文慧',6,16),(11,'0000011',0.00,100,0.00,'2019-01-01 08:01:00.000000','代购点02','2019-01-01',5,'肖文慧','肖文慧',6,17),(12,'0000012',0.00,100,0.00,'2019-01-02 08:02:00.000000','代购点02','2019-01-02',33,'肖文慧','肖文慧',6,15),(13,'0000013',0.00,200,0.00,'2019-01-03 08:02:00.000000','代购点02','2019-01-03',35,'肖文慧','肖文慧',NULL,14),(14,'0000014',0.00,50,0.00,'2019-01-04 08:06:00.000000','生产基地03','2019-01-04',16,'周阳','周阳',NULL,29);
/*!40000 ALTER TABLE `sale_chanpinchuku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_chanpinkucun`
--

DROP TABLE IF EXISTS `sale_chanpinkucun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_chanpinkucun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpkcbh` varchar(50) NOT NULL,
  `cpmc` varchar(50) NOT NULL,
  `cpbh_id` int(11) NOT NULL,
  `ssjg_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_chanpinkucun_cpbh_id_b1902d34_fk_company_chanpinxinxi_id` (`cpbh_id`),
  KEY `sale_chanpinkucun_ssjg_id_897535cf_fk_company_jigou_id` (`ssjg_id`),
  CONSTRAINT `sale_chanpinkucun_cpbh_id_b1902d34_fk_company_chanpinxinxi_id` FOREIGN KEY (`cpbh_id`) REFERENCES `company_chanpinxinxi` (`id`),
  CONSTRAINT `sale_chanpinkucun_ssjg_id_897535cf_fk_company_jigou_id` FOREIGN KEY (`ssjg_id`) REFERENCES `company_jigou` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_chanpinkucun`
--

LOCK TABLES `sale_chanpinkucun` WRITE;
/*!40000 ALTER TABLE `sale_chanpinkucun` DISABLE KEYS */;
INSERT INTO `sale_chanpinkucun` VALUES (1,'DG02JD03PZ00011','花泽香菜',1,2),(5,'DG02JD03PZ00281','刺红茄',22,2),(16,'JD03JD03PZ00283','包红茄',24,3),(22,'JD03JD03PZ00281','电刺四季豆',37,3),(24,'PF04JD03PZ00291','刺四季豆',41,4),(25,'PF04JD03PZ00284','电次四季豆',40,4),(26,'PF04JD03PZ00283','电包四季豆',39,4),(28,'PF04JD03PZ00281','刺红茄',22,4),(31,'PF04JD03PZ00011','花泽香菜',1,4),(32,'JD03JD03PZ00011','花泽香菜',1,3),(33,'DG02JD03PZ00284','电次青瓜',27,2),(34,'DG02JD03PZ00283','包青瓜',28,2),(35,'DG02JD03PZ00284','次红茄',25,2),(36,'JD03JD03PZ00284','电次青瓜',27,3);
/*!40000 ALTER TABLE `sale_chanpinkucun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_chanpinpancun`
--

DROP TABLE IF EXISTS `sale_chanpinpancun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_chanpinpancun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sl` int(11) NOT NULL,
  `pcsj` datetime(6) NOT NULL,
  `date` date DEFAULT NULL,
  `cpkc_id` int(11) NOT NULL,
  `jsr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_chanpinpancun_cpkc_id_3f39649d_fk_sale_chanpinkucun_id` (`cpkc_id`),
  KEY `sale_chanpinpancun_jsr_id_8cb0123e_fk_company_employee_id` (`jsr_id`),
  CONSTRAINT `sale_chanpinpancun_cpkc_id_3f39649d_fk_sale_chanpinkucun_id` FOREIGN KEY (`cpkc_id`) REFERENCES `sale_chanpinkucun` (`id`),
  CONSTRAINT `sale_chanpinpancun_jsr_id_8cb0123e_fk_company_employee_id` FOREIGN KEY (`jsr_id`) REFERENCES `company_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_chanpinpancun`
--

LOCK TABLES `sale_chanpinpancun` WRITE;
/*!40000 ALTER TABLE `sale_chanpinpancun` DISABLE KEYS */;
INSERT INTO `sale_chanpinpancun` VALUES (1,820,'2019-01-03 09:07:00.000000',NULL,5,1),(2,-50,'2019-01-03 09:15:00.000000',NULL,28,3),(3,30,'2019-01-03 09:24:00.000000',NULL,22,4),(4,1000,'2019-01-03 09:45:00.000000',NULL,1,2),(7,1000,'2019-01-04 08:08:00.000000',NULL,35,2);
/*!40000 ALTER TABLE `sale_chanpinpancun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_chanpinruku`
--

DROP TABLE IF EXISTS `sale_chanpinruku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_chanpinruku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rkdh` varchar(50) NOT NULL,
  `dj` decimal(10,2) DEFAULT NULL,
  `sl` int(11) NOT NULL,
  `je` decimal(20,2) DEFAULT NULL,
  `czsj` datetime(6) NOT NULL,
  `pm` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ckdh_id` int(11) DEFAULT NULL,
  `cpkc_id` int(11) NOT NULL,
  `jsr_id` varchar(10) DEFAULT NULL,
  `jyr_id` varchar(10) DEFAULT NULL,
  `nh_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rkdh` (`rkdh`),
  UNIQUE KEY `ckdh_id` (`ckdh_id`),
  KEY `sale_chanpinruku_cpkc_id_0266c2e1_fk_sale_chanpinkucun_id` (`cpkc_id`),
  KEY `sale_chanpinruku_jsr_id_8e33698a_fk_company_employee_name` (`jsr_id`),
  KEY `sale_chanpinruku_jyr_id_c87aec8c_fk_company_employee_name` (`jyr_id`),
  KEY `sale_chanpinruku_nh_id_155d7dfd_fk_company_nonghuxinxi_id` (`nh_id`),
  CONSTRAINT `sale_chanpinruku_ckdh_id_c387ad77_fk_sale_chanpinchuku_id` FOREIGN KEY (`ckdh_id`) REFERENCES `sale_chanpinchuku` (`id`),
  CONSTRAINT `sale_chanpinruku_cpkc_id_0266c2e1_fk_sale_chanpinkucun_id` FOREIGN KEY (`cpkc_id`) REFERENCES `sale_chanpinkucun` (`id`),
  CONSTRAINT `sale_chanpinruku_jsr_id_8e33698a_fk_company_employee_name` FOREIGN KEY (`jsr_id`) REFERENCES `company_employee` (`name`),
  CONSTRAINT `sale_chanpinruku_jyr_id_c87aec8c_fk_company_employee_name` FOREIGN KEY (`jyr_id`) REFERENCES `company_employee` (`name`),
  CONSTRAINT `sale_chanpinruku_nh_id_155d7dfd_fk_company_nonghuxinxi_id` FOREIGN KEY (`nh_id`) REFERENCES `company_nonghuxinxi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_chanpinruku`
--

LOCK TABLES `sale_chanpinruku` WRITE;
/*!40000 ALTER TABLE `sale_chanpinruku` DISABLE KEYS */;
INSERT INTO `sale_chanpinruku` VALUES (14,'0000014',2.00,600,1200.00,'2019-01-04 07:18:00.000000','批发中心04','2019-01-04',NULL,28,'王一帆','王一帆',NULL),(15,'0000015',2.00,500,1000.00,'2019-01-02 23:51:00.000000','代购点02','2019-01-03',NULL,33,'肖文慧','肖文慧',6),(16,'0000016',5.00,100,500.00,'2019-01-03 23:51:00.000000','代购点02','2019-01-04',NULL,1,'肖文慧','肖文慧',6),(17,'0000017',2.00,400,800.00,'2018-12-30 23:52:00.000000','代购点02','2018-12-31',NULL,5,'肖文慧','肖文慧',6),(18,'0000018',2.00,300,600.00,'2018-12-31 23:52:00.000000','代购点02','2019-01-01',NULL,34,'肖文慧','肖文慧',6),(20,'0000020',2.00,300,600.00,'2019-01-04 23:52:00.000000','代购点02','2019-01-05',NULL,34,'肖文慧','肖文慧',6),(21,'0000021',5.00,200,1000.00,'2019-01-04 08:02:00.000000','生产基地03','2019-01-04',10,32,'周阳','周阳',6),(22,'0000022',5.00,500,2500.00,'2019-01-04 08:02:00.000000','批发中心04','2019-01-04',NULL,31,'王一帆',NULL,NULL),(23,'0000023',2.00,100,200.00,'2018-12-12 08:04:00.000000','生产基地03','2018-12-12',12,36,'周阳','周阳',6),(29,'0000029',2.00,600,1200.00,'2018-12-20 08:05:00.000000','生产基地03','2018-12-20',NULL,16,'周阳','周阳',NULL),(30,'0000030',2.00,50,100.00,'2018-12-26 08:06:00.000000','生产基地03','2018-12-26',NULL,22,'周阳','周阳',NULL),(31,'0000031',2.00,55,110.00,'2018-12-23 08:07:00.000000','生产基地03','2018-12-23',NULL,16,'周阳','周阳',NULL),(32,'0000032',5.00,230,1150.00,'2018-12-24 08:07:00.000000','生产基地03','2018-12-24',NULL,32,'周阳','周阳',NULL),(34,'0000034',2.00,60,120.00,'2018-11-11 08:10:00.000000','生产基地03','2018-11-11',NULL,36,'周阳','周阳',NULL);
/*!40000 ALTER TABLE `sale_chanpinruku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_chanpinxiaoshou`
--

DROP TABLE IF EXISTS `sale_chanpinxiaoshou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_chanpinxiaoshou` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xsdh` varchar(10) NOT NULL,
  `dj` decimal(10,2) NOT NULL,
  `sl` int(11) NOT NULL,
  `je` decimal(20,2) DEFAULT NULL,
  `xssj` datetime(6) NOT NULL,
  `date` date DEFAULT NULL,
  `cpkc_id` int(11) NOT NULL,
  `gk_id` int(11) NOT NULL,
  `jsr_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `xsdh` (`xsdh`),
  KEY `sale_chanpinxiaoshou_cpkc_id_4d23dbc5_fk_sale_chanpinkucun_id` (`cpkc_id`),
  KEY `sale_chanpinxiaoshou_gk_id_af07ff77_fk_company_gukexinxi_id` (`gk_id`),
  KEY `sale_chanpinxiaoshou_jsr_id_5cbc5a2b_fk_company_employee_name` (`jsr_id`),
  CONSTRAINT `sale_chanpinxiaoshou_cpkc_id_4d23dbc5_fk_sale_chanpinkucun_id` FOREIGN KEY (`cpkc_id`) REFERENCES `sale_chanpinkucun` (`id`),
  CONSTRAINT `sale_chanpinxiaoshou_gk_id_af07ff77_fk_company_gukexinxi_id` FOREIGN KEY (`gk_id`) REFERENCES `company_gukexinxi` (`id`),
  CONSTRAINT `sale_chanpinxiaoshou_jsr_id_5cbc5a2b_fk_company_employee_name` FOREIGN KEY (`jsr_id`) REFERENCES `company_employee` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_chanpinxiaoshou`
--

LOCK TABLES `sale_chanpinxiaoshou` WRITE;
/*!40000 ALTER TABLE `sale_chanpinxiaoshou` DISABLE KEYS */;
INSERT INTO `sale_chanpinxiaoshou` VALUES (2,'0000002',100.00,100,10000.00,'2018-01-03 07:54:00.000000','2018-01-03',1,2,'林中龙'),(3,'0000003',100.00,100,10000.00,'2019-01-03 07:55:00.000000','2019-01-03',1,2,'林中龙'),(4,'0000004',100.00,100,10000.00,'2019-01-02 07:56:00.000000','2019-01-02',1,2,'林中龙'),(5,'0000005',100.00,10,1000.00,'2019-01-01 07:57:00.000000','2019-01-01',1,2,'林中龙'),(6,'0000006',2.50,100,250.00,'2018-11-14 09:15:00.000000','2018-11-14',28,3,'王一帆'),(7,'0000007',3.20,50,160.00,'2018-12-19 09:17:00.000000','2018-12-19',28,4,'王一帆'),(8,'0000008',100.00,200,20000.00,'2019-01-04 07:16:00.000000','2019-01-04',31,5,'王一帆'),(9,'0000009',4.30,100,430.00,'2018-10-17 07:19:00.000000','2018-10-17',28,3,'王一帆'),(10,'0000010',4.30,50,215.00,'2018-09-11 07:19:00.000000','2018-09-11',28,2,'王一帆'),(11,'0000011',4.30,700,3010.00,'2018-08-15 07:20:00.000000','2018-08-15',5,5,'王一帆');
/*!40000 ALTER TABLE `sale_chanpinxiaoshou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2019-01-03 07:45:39.855192','127.0.0.1','1','公司0001','create','已添加。',20,1),(2,'2019-01-03 07:46:04.613379','127.0.0.1','2','林中龙','create','已添加。',4,1),(3,'2019-01-03 07:47:28.503312','127.0.0.1','1','林中龙','create','已添加。',19,1),(4,'2019-01-03 07:47:55.421502','127.0.0.1','2','代购点0002','create','已添加。',20,1),(5,'2019-01-03 07:48:17.112214','127.0.0.1','1','香菜','create','已添加。',22,1),(6,'2019-01-03 07:48:27.116016','127.0.0.1','3','生产基地0003','create','已添加。',20,1),(7,'2019-01-03 07:48:28.693998','127.0.0.1','1','hzau的花泽香菜','create','已添加。',17,1),(8,'2019-01-03 07:48:30.928949','127.0.0.1','1','代购点0002 的 花泽香菜','create','已添加。',35,1),(9,'2019-01-03 07:51:16.709313','127.0.0.1',NULL,'','delete','批量删除 1 个 顾客信息',NULL,1),(10,'2019-01-03 07:52:30.256015','127.0.0.1',NULL,'','delete','批量删除 1 个 顾客信息',NULL,1),(11,'2019-01-03 07:55:16.584282','127.0.0.1','2','林中龙','create','已添加。',19,1),(12,'2019-01-03 08:01:18.100485','192.168.5.61','1','代购点','create','已添加。',3,1),(13,'2019-01-03 08:04:58.574607','192.168.5.61','1','代购点','change','修改 permissions',3,1),(14,'2019-01-03 08:09:03.049421','192.168.5.61','2','生产基地','create','已添加。',3,1),(15,'2019-01-03 08:11:08.750267','192.168.5.61','3','批发中心','create','已添加。',3,1),(16,'2019-01-03 08:11:20.295653','192.168.5.63','38','电白的电条四季豆','change','没有字段被修改。',17,1),(17,'2019-01-03 08:12:49.729565','192.168.5.61','3','肖文慧','create','已添加。',4,1),(18,'2019-01-03 08:13:05.547937','192.168.5.61','3','肖文慧','change','修改 groups',4,1),(19,'2019-01-03 08:13:40.923494','192.168.5.61','4','王一帆','create','已添加。',4,1),(20,'2019-01-03 08:15:05.100677','192.168.5.61','5','王周阳','create','已添加。',4,1),(21,'2019-01-03 08:15:14.848496','192.168.5.61','4','王一帆','change','没有字段被修改。',4,1),(22,'2019-01-03 08:15:56.041805','192.168.5.61','3','生产基地0003','change','修改 fzr 和 lxdh',20,1),(23,'2019-01-03 08:16:24.975715','192.168.5.61','3','肖文慧','change','修改 is_staff',4,1),(24,'2019-01-03 08:16:30.790110','192.168.5.61','5','王周阳','change','修改 is_staff',4,1),(25,'2019-01-03 08:16:35.089728','192.168.5.61','4','王一帆','change','修改 is_staff',4,1),(26,'2019-01-03 08:16:42.101988','192.168.5.61','2','林中龙','change','修改 is_staff',4,1),(27,'2019-01-03 08:16:57.715694','192.168.5.61','2','代购点0002','change','修改 fzr 和 lxdh',20,1),(28,'2019-01-03 08:17:09.197075','192.168.5.61','1','公司0001','change','修改 fzr 和 lxdh',20,1),(29,'2019-01-03 08:17:29.227841','192.168.5.61','4','批发中心0004','create','已添加。',20,1),(30,'2019-01-03 08:17:56.655854','192.168.5.61','2','林中龙','change','修改 is_superuser',4,1),(31,'2019-01-03 08:18:10.993869','192.168.5.61','4','王一帆','change','修改 groups',4,1),(32,'2019-01-03 08:18:18.470957','192.168.5.61','5','王周阳','change','修改 groups',4,1),(33,'2019-01-03 08:20:14.560375','192.168.5.61','1','平方千米','create','已添加。',10,1),(34,'2019-01-03 08:20:22.930607','192.168.5.61','2','亩','create','已添加。',10,1),(35,'2019-01-03 08:20:31.249903','192.168.5.61','1','个','create','已添加。',8,1),(36,'2019-01-03 08:20:35.583779','192.168.5.61','2','瓶','create','已添加。',8,1),(37,'2019-01-03 08:20:39.033590','192.168.5.61','3','捆','create','已添加。',8,1),(38,'2019-01-03 08:20:43.086578','192.168.5.61','4','袋','create','已添加。',8,1),(39,'2019-01-03 08:20:52.877349','192.168.5.61','5','件','create','已添加。',8,1),(40,'2019-01-03 08:21:16.470887','192.168.5.61','1','箱','create','已添加。',7,1),(41,'2019-01-03 08:21:22.207436','192.168.5.63','1','张三','create','已添加。',21,3),(42,'2019-01-03 08:21:58.760029','192.168.5.63','2','李四','create','已添加。',21,3),(43,'2019-01-03 08:23:07.078262','192.168.5.63','2','代购点0002 的 电刺四季豆','create','已添加。',35,3),(44,'2019-01-03 08:24:33.975411','192.168.5.63','2','代购点0002 的 电刺四季豆','change','没有字段被修改。',35,3),(45,'2019-01-03 08:24:46.735722','192.168.5.61','1','生产 花泽香菜 150亩','create','已添加。',33,1),(46,'2019-01-03 08:24:50.208701','192.168.5.63','1','代购点0002 的 花泽香菜','change','没有字段被修改。',35,3),(47,'2019-01-03 08:24:55.444031','192.168.5.61','2','生产 刺红茄 500亩','create','已添加。',33,1),(48,'2019-01-03 08:25:16.575504','192.168.5.61','3','生产 条红茄 600亩','create','已添加。',33,1),(49,'2019-01-03 08:25:25.851064','192.168.5.61','4','生产 包红茄 250亩','create','已添加。',33,1),(50,'2019-01-03 08:25:36.229192','192.168.5.61','5','生产 次红茄 300亩','create','已添加。',33,1),(51,'2019-01-03 08:25:55.524425','192.168.5.61','6','生产 刺青瓜 850亩','create','已添加。',33,1),(52,'2019-01-03 08:26:11.751203','192.168.5.61','7','生产 电次青瓜 420亩','create','已添加。',33,1),(53,'2019-01-03 08:26:24.503923','192.168.5.61','8','生产 包青瓜 200亩','create','已添加。',33,1),(54,'2019-01-03 08:26:44.023080','192.168.5.61','9','生产 条尖椒 500亩','create','已添加。',33,1),(55,'2019-01-03 08:27:21.330937','192.168.5.63','41','高州的刺四季豆','change','修改 pzbm 和 jgbh',17,1),(56,'2019-01-03 08:27:26.271161','192.168.5.63','41','高州的刺四季豆','change','没有字段被修改。',17,1),(57,'2019-01-03 08:27:36.647056','192.168.5.63','40','电白的电次四季豆','change','修改 pzbm 和 jgbh',17,1),(58,'2019-01-03 08:27:46.106747','192.168.5.63','39','电白的电包四季豆','change','修改 pzbm 和 jgbh',17,1),(59,'2019-01-03 08:27:55.747602','192.168.5.63','38','电白的电条四季豆','change','修改 pzbm 和 jgbh',17,1),(60,'2019-01-03 08:28:07.044979','192.168.5.63','37','电白的电刺四季豆','change','修改 pzbm 和 jgbh',17,1),(61,'2019-01-03 08:28:40.308247','192.168.5.61','5','生产基地0005','create','已添加。',20,1),(62,'2019-01-03 08:29:22.971717','192.168.5.61','6','生产基地0006','create','已添加。',20,1),(63,'2019-01-03 08:29:47.350692','192.168.5.61','7','批发中心0007','create','已添加。',20,1),(64,'2019-01-03 08:29:58.894016','192.168.5.63','3','王五','create','已添加。',21,3),(65,'2019-01-03 08:30:36.202575','192.168.5.63','4','赵留','create','已添加。',21,3),(66,'2019-01-03 08:30:50.759233','192.168.5.61','8','代购点0008','create','已添加。',20,1),(67,'2019-01-03 08:30:52.866462','192.168.5.63','2','代购点0002 的 电刺四季豆','delete','',35,3),(68,'2019-01-03 08:31:01.309900','192.168.5.61','9','代购点0009','create','已添加。',20,1),(69,'2019-01-03 08:31:06.100226','192.168.5.63','5','代购点0002 的 刺红茄','create','已添加。',35,3),(70,'2019-01-03 08:31:13.379731','192.168.5.63','6','代购点0002 的 条红茄','create','已添加。',35,3),(71,'2019-01-03 08:31:13.423824','192.168.5.61','10','代购点0010','create','已添加。',20,1),(72,'2019-01-03 08:31:25.710846','192.168.5.63','7','代购点0002 的 包红茄','create','已添加。',35,3),(73,'2019-01-03 08:31:32.772928','192.168.5.63','8','代购点0002 的 电次青瓜','create','已添加。',35,3),(74,'2019-01-03 08:31:50.518368','192.168.5.61','2','生产基地','change','修改 permissions',3,1),(75,'2019-01-03 08:32:30.900881','192.168.5.61','3','批发中心','change','修改 permissions',3,1),(76,'2019-01-03 08:33:07.963705','192.168.5.61','1','代购点','change','修改 permissions',3,1),(77,'2019-01-03 08:36:55.446062','192.168.5.62','15','生产基地0003 的 刺红茄','create','已添加。',35,5),(78,'2019-01-03 08:37:01.165367','192.168.5.62','16','生产基地0003 的 包红茄','create','已添加。',35,5),(79,'2019-01-03 08:42:20.485368','192.168.5.63','41','高州的刺四季豆','change','没有字段被修改。',17,1),(80,'2019-01-03 08:42:25.082141','192.168.5.63','41','高州的刺四季豆','change','没有字段被修改。',17,1),(81,'2019-01-03 08:42:28.320672','192.168.5.63','41','高州的刺四季豆','change','没有字段被修改。',17,1),(82,'2019-01-03 08:42:32.147534','192.168.5.63','41','高州的刺四季豆','change','没有字段被修改。',17,1),(83,'2019-01-03 08:42:35.614691','192.168.5.63','41','高州的刺四季豆','change','没有字段被修改。',17,1),(84,'2019-01-03 08:42:39.768595','192.168.5.63','41','高州的刺四季豆','change','没有字段被修改。',17,1),(85,'2019-01-03 08:43:31.433960','192.168.5.63','41','高州的刺四季豆','change','修改 pzbm',17,1),(86,'2019-01-03 08:43:45.543030','192.168.5.63','36','连州的次四季豆','change','修改 pzbm',17,1),(87,'2019-01-03 08:44:05.845279','192.168.5.63','21','代购点0002 的 电次青瓜','create','已添加。',35,1),(88,'2019-01-03 08:44:17.280383','192.168.5.63','21','代购点0002 的 电次青瓜','change','没有字段被修改。',35,1),(89,'2019-01-03 08:46:23.196799','192.168.5.62','22','生产基地0003 的 电刺四季豆','create','已添加。',35,5),(90,'2019-01-03 08:52:30.120885','192.168.5.61','3','批发中心','change','修改 permissions',3,1),(91,'2019-01-03 08:53:20.618389','192.168.5.61','3','陈顺杰','create','已添加。',19,4),(92,'2019-01-03 08:53:52.598182','192.168.5.61','4','董东','create','已添加。',19,4),(93,'2019-01-03 08:53:56.925219','192.168.5.63','23','代购点0002 的 包四季豆','create','已添加。',35,3),(94,'2019-01-03 08:54:10.280633','192.168.5.61','5','张子风','create','已添加。',19,4),(95,'2019-01-03 09:00:11.817914','192.168.5.61','4','王一帆','change','修改 last_login',4,1),(96,'2019-01-03 09:01:32.994265','192.168.5.61','24','批发中心0004 的 刺四季豆','create','已添加。',35,4),(97,'2019-01-03 09:01:59.893305','192.168.5.61','25','批发中心0004 的 电次四季豆','create','已添加。',35,4),(98,'2019-01-03 09:02:06.505275','192.168.5.61','26','批发中心0004 的 电包四季豆','create','已添加。',35,4),(99,'2019-01-03 09:02:22.108509','192.168.5.62','27','生产基地0003 的 花泽香菜','create','已添加。',35,5),(100,'2019-01-03 09:02:35.284264','192.168.5.63',NULL,'','delete','批量删除 1 个 产品库存',NULL,3),(101,'2019-01-03 09:04:14.996362','192.168.5.62','10','代购点0002出库花泽香菜 0','delete','',37,5),(102,'2019-01-03 09:06:05.485824','192.168.5.63','1','代购点0002 的 箩筐','create','已添加。',26,3),(103,'2019-01-03 09:06:17.349817','192.168.5.63','2','代购点0002 的 纸盒','create','已添加。',26,3),(104,'2019-01-03 09:06:22.669959','192.168.5.63','3','代购点0002 的 袋子','create','已添加。',26,3),(105,'2019-01-03 09:06:29.373418','192.168.5.63','4','代购点0002 的 绳子','create','已添加。',26,3),(106,'2019-01-03 09:06:45.963839','192.168.5.63','5','代购点0002 的 胶筐','create','已添加。',26,3),(107,'2019-01-03 09:08:13.866308','192.168.5.63','6','代购点0002 的 西红柿种子','create','已添加。',26,3),(108,'2019-01-03 09:08:31.516336','192.168.5.63','7','代购点0002 的 大白菜种子','create','已添加。',26,3),(109,'2019-01-03 09:08:44.981094','192.168.5.63','9','代购点0002 的 夏尖椒','create','已添加。',26,3),(110,'2019-01-03 09:08:59.464926','192.168.5.61',NULL,'','delete','批量删除 1 个 种植单位',NULL,1),(111,'2019-01-03 09:09:53.302918','192.168.5.63','12','代购点0002 的 蚜虫净','create','已添加。',26,3),(112,'2019-01-03 09:10:19.659108','192.168.5.63',NULL,'','delete','批量删除 2 个 物资库存',NULL,3),(113,'2019-01-03 09:10:31.424488','192.168.5.63',NULL,'','delete','批量删除 1 个 物资库存',NULL,3),(114,'2019-01-03 09:11:06.671959','192.168.5.63',NULL,'','delete','批量删除 6 个 物资库存',NULL,3),(115,'2019-01-03 09:12:32.812481','192.168.5.63','13','代购点0002 的 箩筐','create','已添加。',26,3),(116,'2019-01-03 09:12:37.900366','192.168.5.63','14','代购点0002 的 纸盒','create','已添加。',26,3),(117,'2019-01-03 09:12:43.274434','192.168.5.63','15','代购点0002 的 袋子','create','已添加。',26,3),(118,'2019-01-03 09:12:50.487610','192.168.5.63','16','代购点0002 的 绳子','create','已添加。',26,3),(119,'2019-01-03 09:12:58.198400','192.168.5.63','17','代购点0002 的 西红柿种子','create','已添加。',26,3),(120,'2019-01-03 09:14:32.439578','192.168.5.61','28','批发中心0004 的 刺红茄','create','已添加。',35,4),(121,'2019-01-03 09:23:17.470527','192.168.5.61','1','公司的001生产计划','create','已添加。',30,1),(122,'2019-01-03 09:23:52.988710','192.168.5.61','1','生产基地0003 的 001 生产计划','create','已添加。',32,1),(123,'2019-01-03 09:24:28.736041','192.168.5.61','1','公司的001生产计划','change','修改 zdr',30,1),(124,'2019-01-03 09:24:49.460422','192.168.5.62','18','生产基地0003 的 箩筐','create','已添加。',26,5),(125,'2019-01-03 09:24:57.911726','192.168.5.62','19','生产基地0003 的 纸盒','create','已添加。',26,5),(126,'2019-01-03 09:25:07.479831','192.168.5.62','20','生产基地0003 的 敌敌畏','create','已添加。',26,5),(128,'2019-01-03 09:25:31.744097','192.168.5.61','2','代购点0002 的 001 生产计划','create','已添加。',29,1),(129,'2019-01-03 09:25:31.959346','192.168.5.62','1','生产基地0003入库箩筐 500','create','已添加。',28,5),(130,'2019-01-03 09:25:38.867497','192.168.5.63','2','代购点0002入库箩筐 500','create','已添加。',28,3),(131,'2019-01-03 09:25:52.237445','192.168.5.62','3','生产基地0003入库纸盒 300','create','已添加。',28,5),(132,'2019-01-03 09:25:52.990629','192.168.5.63','4','代购点0002入库纸盒 700','create','已添加。',28,3),(133,'2019-01-03 09:26:09.189639','192.168.5.63','5','代购点0002入库袋子 1000','create','已添加。',28,3),(134,'2019-01-03 09:26:18.372105','192.168.5.62','1','生产基地0003出库箩筐 300','create','已添加。',24,5),(135,'2019-01-03 09:26:46.431398','192.168.5.63','6','代购点0002入库绳子 200','create','已添加。',28,3),(136,'2019-01-03 09:26:51.364990','192.168.5.61','2','生产基地','change','修改 permissions',3,1),(137,'2019-01-03 09:27:02.326363','192.168.5.63','7','代购点0002入库西红柿种子 800','create','已添加。',28,3),(138,'2019-01-03 09:28:03.297125','192.168.5.63','2','代购点0002出库箩筐 100','create','已添加。',24,3),(139,'2019-01-03 09:28:17.529797','192.168.5.63','3','代购点0002出库纸盒 200','create','已添加。',24,3),(140,'2019-01-03 09:28:38.927812','192.168.5.63','4','代购点0002出库袋子 500','create','已添加。',24,3),(141,'2019-01-03 09:28:56.356104','127.0.0.1','1','代购点0002 的 绳子减少了0','create','已添加。',27,1),(142,'2019-01-03 09:29:15.697761','192.168.5.63','5','代购点0002出库绳子 100','create','已添加。',24,3),(143,'2019-01-03 09:29:26.354144','192.168.5.63','6','代购点0002出库西红柿种子 150','create','已添加。',24,3),(144,'2019-01-03 09:29:43.162441','192.168.5.63','1','代购点0002发放箩筐 20','create','已添加。',25,3),(145,'2019-01-03 09:30:05.177688','192.168.5.63','2','代购点0002发放纸盒 30','create','已添加。',25,3),(146,'2019-01-03 09:30:19.422005','192.168.5.63','3','代购点0002发放袋子 90','create','已添加。',25,3),(147,'2019-01-03 09:30:36.175086','192.168.5.63','4','代购点0002发放绳子 50','create','已添加。',25,3),(148,'2019-01-03 09:30:48.315689','192.168.5.61','1','张三 的 001 生产计划','create','已添加。',31,1),(149,'2019-01-03 09:30:51.384129','192.168.5.63','5','代购点0002发放西红柿种子 10','create','已添加。',25,3),(150,'2019-01-03 09:30:57.270816','192.168.5.61','2','李四 的 001 生产计划','create','已添加。',31,1),(151,'2019-01-03 09:31:22.556414','192.168.5.63','2','代购点0002 的 箩筐减少了10','create','已添加。',27,3),(152,'2019-01-03 09:31:38.833992','192.168.5.63','3','代购点0002 的 纸盒减少了50','create','已添加。',27,3),(153,'2019-01-03 09:32:05.746770','192.168.5.63','3','代购点0002 的 001 生产计划','create','已添加。',29,3),(154,'2019-01-03 09:32:27.112283','192.168.5.63','4','代购点0002 的 001 生产计划','create','已添加。',29,3),(155,'2019-01-03 09:32:56.575285','192.168.5.63','5','代购点0002 的 001 生产计划','create','已添加。',29,3),(156,'2019-01-03 09:34:11.315738','192.168.5.62','4','生产基地0003 的 敌敌畏减少了3','create','已添加。',27,5),(157,'2019-01-03 09:39:32.553919','192.168.5.61','2','生产基地','change','修改 permissions',3,1),(158,'2019-01-03 09:39:49.059534','192.168.5.61','1','代购点','change','修改 permissions',3,1),(159,'2019-01-03 11:20:27.681202','127.0.0.1','3','生产基地0006 的 001 生产计划','change','修改 zdsj',32,1),(160,'2019-01-03 11:43:47.175077','127.0.0.1','1','公司的001生产计划','change','修改 zdr',30,1),(161,'2019-01-03 13:50:33.201474','127.0.0.1','1','代购点0002出库花泽香菜 500','change','没有字段被修改。',34,1),(162,'2019-01-03 13:50:37.813811','127.0.0.1','1','代购点0002出库花泽香菜 500','change','没有字段被修改。',34,1),(163,'2019-01-03 14:07:45.514422','127.0.0.1','10','代购点10','change','没有字段被修改。',20,1),(164,'2019-01-03 14:27:53.453101','127.0.0.1','10','代购点10','change','修改 lxdh',20,1),(165,'2019-01-03 14:28:25.358878','127.0.0.1','10','代购点10','change','修改 lxdh',20,1),(166,'2019-01-03 14:33:14.825719','127.0.0.1','10','代购点10','change','修改 jglb',20,1),(167,'2019-01-03 14:33:56.616006','127.0.0.1','9','生产基地09','change','修改 jglb',20,1),(168,'2019-01-03 14:34:05.866111','127.0.0.1','8','生产基地08','change','修改 jglb',20,1),(169,'2019-01-03 14:34:42.308828','127.0.0.1','7','批发中心07','change','修改 jglb',20,1),(170,'2019-01-03 14:34:52.393254','127.0.0.1','6','生产基地06','change','修改 jglb',20,1),(171,'2019-01-03 14:35:05.869029','127.0.0.1','5','生产基地05','change','修改 jglb',20,1),(172,'2019-01-03 14:35:14.216464','127.0.0.1','4','批发中心04','change','修改 jglb',20,1),(173,'2019-01-03 14:35:23.885054','127.0.0.1','3','生产基地03','change','修改 jglb',20,1),(174,'2019-01-03 14:35:37.104996','127.0.0.1','2','代购点02','change','修改 jglb',20,1),(175,'2019-01-03 14:35:55.888530','127.0.0.1','20','生产基地03 的 敌敌畏','change','没有字段被修改。',26,1),(176,'2019-01-03 14:58:30.878228','127.0.0.1','5','代购点02出库电次青瓜 450','change','修改 dj',34,1),(177,'2019-01-03 14:58:52.256167','127.0.0.1','5','代购点02出库电次青瓜 450','change','修改 dj',34,1),(178,'2019-01-03 15:19:55.456679','127.0.0.1',NULL,'','delete','批量删除 4 个 产品入库',NULL,1),(179,'2019-01-03 16:21:25.793876','127.0.0.1','3','admin qbutton widget','change','修改 page_id',13,1),(180,'2019-01-03 16:26:07.817593','127.0.0.1','2','林中龙','change','修改 last_login 和 is_superuser',4,2),(181,'2019-01-03 18:06:29.322882','218.199.68.124','1','admin','change','修改 last_login',4,1),(182,'2019-01-04 00:28:20.091654','122.205.95.144','3','肖文慧','change','修改 last_login',4,1),(183,'2019-01-04 00:36:45.632688','122.205.95.144',NULL,'','delete','批量删除 1 个 组',NULL,1),(184,'2019-01-04 00:38:29.803106','122.205.95.144','4','代购点','create','已添加。',3,1),(185,'2019-01-04 00:38:39.092506','122.205.95.144','3','肖文慧','change','修改 last_login 和 groups',4,1),(186,'2019-01-04 01:06:47.452623','122.205.95.144','5','产品经理','create','已添加。',3,1),(187,'2019-01-04 01:07:03.940440','122.205.95.144','2','林中龙','change','修改 groups',4,1),(188,'2019-01-04 01:09:06.247608','122.205.95.144','2','林中龙','change','修改 last_login 和 groups',4,1),(189,'2019-01-04 03:29:25.927626','122.205.95.144',NULL,'','delete','批量删除 4 个 组',NULL,1),(190,'2019-01-04 03:30:50.969106','122.205.95.144','6','生产基地','create','已添加。',4,1),(191,'2019-01-04 03:31:03.464975','122.205.95.144','5','王周阳','change','修改 last_login 和 groups',3,1),(192,'2019-01-04 03:31:44.982188','122.205.95.144','6','生产基地','change','修改 permissions',4,1),(193,'2019-01-04 03:31:55.676207','122.205.95.144','6','生产基地','change','修改 permissions',4,1),(194,'2019-01-04 03:33:00.207293','122.205.95.144','7','批发中心','create','已添加。',4,1),(195,'2019-01-04 03:34:08.545288','122.205.95.144','8','代购点','create','已添加。',4,1),(196,'2019-01-04 03:34:41.091362','122.205.95.144',NULL,'','delete','批量删除 9 个 蔬菜生产计划',NULL,1),(197,'2019-01-04 03:34:51.024598','122.205.95.144',NULL,'','delete','批量删除 2 个 农户生产计划',NULL,1),(198,'2019-01-04 03:34:56.260852','122.205.95.144',NULL,'','delete','批量删除 4 个 代购点生产计划',NULL,1),(199,'2019-01-04 03:35:00.702843','122.205.95.144',NULL,'','delete','批量删除 3 个 生产基地生产计划',NULL,1),(200,'2019-01-04 03:35:05.985235','122.205.95.144',NULL,'','delete','批量删除 1 个 公司生产计划',NULL,1),(201,'2019-01-04 03:35:19.693856','122.205.95.144','3','肖文慧','change','修改 last_login 和 groups',3,1),(202,'2019-01-04 03:35:27.166306','122.205.95.144','4','王一帆','change','修改 last_login 和 groups',3,1),(203,'2019-01-04 03:35:49.171275','122.205.95.144','10','生产 花泽香菜 800亩','create','已添加。',31,1),(204,'2019-01-04 03:36:04.014823','122.205.95.144','11','生产 刺红茄 400亩','create','已添加。',31,1),(205,'2019-01-04 03:36:12.353291','122.205.95.144','12','生产 条红茄 400亩','create','已添加。',31,1),(206,'2019-01-04 03:36:23.067087','122.205.95.144','13','生产 包红茄 700亩','create','已添加。',31,1),(207,'2019-01-04 03:36:38.557476','122.205.95.144','2','公司的001生产计划','create','已添加。',33,1),(208,'2019-01-04 03:37:56.448749','122.205.95.144','3','生产基地03','change','没有字段被修改。',23,1),(209,'2019-01-04 03:43:45.349441','122.205.95.144','11','生产基地11','create','已添加。',23,1),(210,'2019-01-04 03:51:16.692682','122.205.95.144','12','生产基地12','create','已添加。',23,1),(211,'2019-01-04 06:56:28.348153','122.205.95.144',NULL,'','delete','批量删除 4 个 公司机构',NULL,1),(212,'2019-01-04 06:57:37.566457','122.205.95.144','2','公司的001生产计划','change','没有字段被修改。',33,1),(213,'2019-01-04 06:57:49.495253','122.205.95.144','29','代购点02 的 条尖椒','create','已添加。',34,3),(214,'2019-01-04 06:57:56.751050','122.205.95.144',NULL,'','delete','批量删除 1 个 产品库存',NULL,3),(215,'2019-01-04 06:58:23.220230','122.205.95.144','1','代购点02 的 001 生产计划','create','已添加。',30,5),(216,'2019-01-04 06:58:58.244649','122.205.95.144','1','张三 的 001 生产计划','create','已添加。',29,3),(217,'2019-01-04 06:58:58.826670','122.205.95.144','2','代购点10 的 001 生产计划','create','已添加。',30,5),(218,'2019-01-04 06:59:36.461880','122.205.95.144','2','王五 的 001 生产计划','create','已添加。',29,3),(219,'2019-01-04 07:00:08.488148','122.205.95.144','21','公司01 的 西红柿种子','create','已添加。',26,1),(220,'2019-01-04 07:00:45.583664','122.205.95.144',NULL,'','delete','批量删除 8 个 物资库存',NULL,1),(221,'2019-01-04 07:00:58.568962','122.205.95.144','22','公司01 的 箩筐','create','已添加。',26,1),(222,'2019-01-04 07:01:11.675062','122.205.95.144','23','公司01 的 纸盒','create','已添加。',26,1),(223,'2019-01-04 07:01:16.196104','122.205.95.144','24','公司01 的 绳子','create','已添加。',26,1),(224,'2019-01-04 07:01:19.626311','122.205.95.144','25','公司01 的 胶筐','create','已添加。',26,1),(225,'2019-01-04 07:01:24.547034','122.205.95.144','26','公司01 的 杀虫双','create','已添加。',26,1),(226,'2019-01-04 07:01:46.663130','122.205.95.144','6','生产基地','change','修改 permissions',4,1),(227,'2019-01-04 07:03:21.192932','122.205.95.144',NULL,'','delete','批量删除 1 个 物资入库',NULL,1),(228,'2019-01-04 07:03:38.458592','122.205.95.144','30','代购点02 的 条尖椒','create','已添加。',34,3),(229,'2019-01-04 07:04:07.603619','122.205.95.144','6','生产基地','change','修改 permissions',4,1),(230,'2019-01-04 07:04:19.296382','122.205.95.144','27','生产基地03 的 箩筐','create','已添加。',26,5),(231,'2019-01-04 07:04:28.130557','122.205.95.144','28','生产基地03 的 绳子','create','已添加。',26,5),(232,'2019-01-04 07:04:32.889251','122.205.95.144','29','生产基地03 的 纸盒','create','已添加。',26,5),(233,'2019-01-04 07:05:37.449819','122.205.95.144',NULL,'','delete','批量删除 1 个 产品库存',NULL,3),(234,'2019-01-04 07:06:09.251393','122.205.95.144','30','代购点02 的 箩筐','create','已添加。',26,3),(235,'2019-01-04 07:06:18.115524','122.205.95.144','31','代购点02 的 纸盒','create','已添加。',26,3),(236,'2019-01-04 07:06:29.479176','122.205.95.144','32','代购点02 的 袋子','create','已添加。',26,3),(237,'2019-01-04 07:06:35.950350','122.205.95.144','33','代购点02 的 绳子','create','已添加。',26,3),(238,'2019-01-04 07:06:43.713743','122.205.95.144','34','代购点02 的 西红柿种子','create','已添加。',26,3),(239,'2019-01-04 07:09:50.898623','122.205.95.144',NULL,'','delete','批量删除 6 个 产品入库',NULL,3),(240,'2019-01-04 07:16:15.992903','122.205.95.144','31','批发中心04 的 花泽香菜','create','已添加。',34,4),(241,'2019-01-04 07:35:20.794383','122.205.95.144',NULL,'','delete','批量删除 4 个 农户信息',NULL,1),(242,'2019-01-04 07:40:00.429190','122.205.95.144','41','高州的刺四季豆','change','修改 cj 和 jgbh',22,1),(243,'2019-01-04 07:40:05.999438','122.205.95.144','40','电白的电次四季豆','change','修改 cj 和 jgbh',22,1),(244,'2019-01-04 07:40:15.311457','122.205.95.144','39','电白的电包四季豆','change','修改 cj 和 jgbh',22,1),(245,'2019-01-04 07:40:21.900578','122.205.95.144','38','电白的电条四季豆','change','修改 cj 和 jgbh',22,1),(246,'2019-01-04 07:40:27.957110','122.205.95.144','37','电白的电刺四季豆','change','修改 cj 和 jgbh',22,1),(247,'2019-01-04 07:40:35.789585','122.205.95.144','36','连州的次四季豆','change','修改 cj 和 jgbh',22,1),(248,'2019-01-04 07:40:41.422136','122.205.95.144','35','连州的包四季豆','change','修改 cj 和 jgbh',22,1),(249,'2019-01-04 07:40:47.774045','122.205.95.144','34','电白的电次尖椒','change','修改 cj 和 jgbh',22,1),(250,'2019-01-04 07:40:56.197836','122.205.95.144',NULL,'','delete','批量删除 1 个 产品库存',NULL,5),(251,'2019-01-04 07:41:04.566064','122.205.95.144','33','电白的电包尖椒','change','修改 cj 和 jgbh',22,1),(252,'2019-01-04 07:41:11.715191','122.205.95.144',NULL,'','delete','批量删除 1 个 产品库存',NULL,3),(253,'2019-01-04 07:41:12.050628','122.205.95.144','32','电白的电条尖椒','change','修改 cj 和 jgbh',22,1),(254,'2019-01-04 07:41:15.836299','122.205.95.144',NULL,'','delete','批量删除 1 个 产品库存',NULL,3),(255,'2019-01-04 07:41:17.827797','122.205.95.144','31','连州的次尖椒','change','修改 cj 和 jgbh',22,1),(256,'2019-01-04 07:41:19.487823','122.205.95.144',NULL,'','delete','批量删除 1 个 产品库存',NULL,3),(257,'2019-01-04 07:41:23.166584','122.205.95.144',NULL,'','delete','批量删除 1 个 产品库存',NULL,3),(258,'2019-01-04 07:41:24.270045','122.205.95.144','30','连州的包尖椒','change','修改 cj 和 jgbh',22,1),(259,'2019-01-04 07:41:31.583535','122.205.95.144','29','连州的条尖椒','change','修改 cj 和 jgbh',22,1),(260,'2019-01-04 07:41:41.239237','122.205.95.144','28','高州的包青瓜','change','修改 cj 和 jgbh',22,1),(261,'2019-01-04 07:41:55.316426','122.205.95.144','1','hzau的花泽香菜','change','修改 cj 和 jgbh',22,1),(262,'2019-01-04 07:42:13.013872','122.205.95.144','1','hzau的花泽香菜','change','没有字段被修改。',22,1),(263,'2019-01-04 07:42:18.929478','122.205.95.144',NULL,'','delete','批量删除 1 个 产品库存',NULL,5),(264,'2019-01-04 07:42:26.211858','122.205.95.144','22','高州的刺红茄','change','修改 cj',22,1),(265,'2019-01-04 07:42:33.794415','122.205.95.144','23','高州的条红茄','change','修改 cj',22,1),(266,'2019-01-04 07:42:39.297488','122.205.95.144','24','下桥的包红茄','change','修改 cj',22,1),(267,'2019-01-04 07:42:45.664412','122.205.95.144','26','连州的刺青瓜','change','修改 cj',22,1),(268,'2019-01-04 07:42:51.543257','122.205.95.144','27','电白的电次青瓜','change','修改 cj',22,1),(269,'2019-01-04 07:42:51.869789','122.205.95.144','32','生产基地03 的 花泽香菜','create','已添加。',34,5),(270,'2019-01-04 07:43:00.179992','122.205.95.144','25','下桥的次红茄','change','修改 cj',22,1),(271,'2019-01-04 07:44:39.012776','122.205.95.144','6','生产基地','change','修改 permissions',4,1),(272,'2019-01-04 07:44:48.752622','122.205.95.144','7','批发中心','change','修改 permissions',4,1),(273,'2019-01-04 07:45:01.524720','122.205.95.144','8','代购点','change','修改 permissions',4,1),(274,'2019-01-04 07:48:39.544461','122.205.95.144','5','张一','create','已添加。',17,1),(275,'2019-01-04 07:49:12.838892','122.205.95.144','6','王庆','create','已添加。',17,1),(276,'2019-01-04 07:49:32.988162','122.205.95.144','7','刘处','create','已添加。',17,1),(277,'2019-01-04 07:51:04.941922','122.205.95.144','33','代购点02 的 电次青瓜','create','已添加。',34,3),(278,'2019-01-04 07:51:15.266689','122.205.95.144','34','代购点02 的 包青瓜','create','已添加。',34,3),(279,'2019-01-04 07:54:53.342791','122.205.95.144','35','代购点02 的 次红茄','create','已添加。',34,3),(280,'2019-01-04 07:56:15.875545','122.205.95.144',NULL,'','delete','批量删除 1 个 农户信息',NULL,1),(281,'2019-01-04 07:57:14.498162','122.205.95.144','8','肖伟','create','已添加。',17,1),(282,'2019-01-04 07:57:35.237894','122.205.95.144','9','王尚','create','已添加。',17,1),(283,'2019-01-04 07:57:53.601814','122.205.95.144','10','马火','create','已添加。',17,1),(284,'2019-01-04 07:58:11.796117','122.205.95.144','11','马震','create','已添加。',17,1),(285,'2019-01-04 07:58:55.040367','122.205.95.144','12','王娇娇','create','已添加。',17,1),(286,'2019-01-04 07:59:21.598868','122.205.95.144','13','林龙','create','已添加。',17,1),(287,'2019-01-04 07:59:48.841951','122.205.95.144','14','董一帆','create','已添加。',17,1),(288,'2019-01-04 08:01:05.472778','122.205.95.144',NULL,'','delete','批量删除 6 个 农户信息',NULL,1),(289,'2019-01-04 08:04:31.059855','122.205.95.144','36','生产基地03 的 电次青瓜','create','已添加。',34,5),(290,'2019-01-04 08:09:00.152141','122.205.95.144',NULL,'','delete','批量删除 4 个 蔬菜生产计划',NULL,1),(291,'2019-01-04 08:09:06.092271','122.205.95.144',NULL,'','delete','批量删除 1 个 公司生产计划',NULL,1),(292,'2019-01-04 08:10:09.101428','122.205.95.144',NULL,'','delete','批量删除 1 个 产品入库',NULL,1),(293,'2019-01-04 08:12:16.590653','122.205.95.144',NULL,'','delete','批量删除 1 个 产品出库',NULL,1),(294,'2019-01-04 08:42:31.977517','122.205.95.144','40','胡萝卜','create','已添加。',18,1),(295,'2019-01-04 08:43:43.938021','122.205.95.144','42','山东的胡萝卜','create','已添加。',22,1),(296,'2019-01-04 09:09:43.859162','122.205.95.144','6','jidi','create','已添加。',3,1),(297,'2019-01-04 09:12:50.144653','122.205.95.144','9','操作员','create','已添加。',4,1),(298,'2019-01-04 09:13:02.384408','122.205.95.144','6','jidi','change','修改 groups',3,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','2,1,3',1),(2,'site-theme','https://bootswatch.com/3/yeti/bootstrap.min.css',1),(3,'dashboard:home:pos','',5),(4,'dashboard:home:pos','',3),(5,'dashboard:home:pos','',4);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
INSERT INTO `xadmin_userwidget` VALUES (1,'home','html','{\"id\": \"1\", \"content\": \"<a href=\'/backup\'>备份</a>\\r\\n<a href=\'/reload\'>还原</a>\", \"title\": \"备份还原\"}',1),(2,'home','list','{\"title\": \"公司生产计划\", \"model\": \"product.gongsishengchan\"}',1),(3,'home','addform','{\"title\": \"添加计划\", \"model\": \"product.gongsishengchan\"}',1);
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-04 17:13:13
