-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tims_db
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `application_admin`
--

DROP TABLE IF EXISTS `application_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `application_admin_user_id_98b13c29_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_admin`
--

LOCK TABLES `application_admin` WRITE;
/*!40000 ALTER TABLE `application_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_admininfo`
--

DROP TABLE IF EXISTS `application_admininfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_admininfo` (
  `idAdminInfo` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`idAdminInfo`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `application_admininfo_user_id_83d8c033_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2014212026 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_admininfo`
--

LOCK TABLES `application_admininfo` WRITE;
/*!40000 ALTER TABLE `application_admininfo` DISABLE KEYS */;
INSERT INTO `application_admininfo` VALUES (2014212021,'蔡文强',45),(2014212022,'张万里',46),(2014212023,'代亚暄',47),(2014212024,'李悦滢',48),(2014212025,'杨莹',49);
/*!40000 ALTER TABLE `application_admininfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_class`
--

DROP TABLE IF EXISTS `application_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `create_by_id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_class_create_by_id_61501192_fk_application_admin_id` (`create_by_id`),
  KEY `application_class_major_id_1d22e755_fk_application_major_id` (`major_id`),
  CONSTRAINT `application_class_create_by_id_61501192_fk_application_admin_id` FOREIGN KEY (`create_by_id`) REFERENCES `application_admin` (`id`),
  CONSTRAINT `application_class_major_id_1d22e755_fk_application_major_id` FOREIGN KEY (`major_id`) REFERENCES `application_major` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_class`
--

LOCK TABLES `application_class` WRITE;
/*!40000 ALTER TABLE `application_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_course`
--

DROP TABLE IF EXISTS `application_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  `the_class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_course_teacher_id_d7504b3f_fk_application_teacher_id` (`teacher_id`),
  KEY `application_course_the_class_id_43af4c3b_fk_application_class_id` (`the_class_id`),
  CONSTRAINT `application_course_teacher_id_d7504b3f_fk_application_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `application_teacher` (`id`),
  CONSTRAINT `application_course_the_class_id_43af4c3b_fk_application_class_id` FOREIGN KEY (`the_class_id`) REFERENCES `application_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_course`
--

LOCK TABLES `application_course` WRITE;
/*!40000 ALTER TABLE `application_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_courseinfo`
--

DROP TABLE IF EXISTS `application_courseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_courseinfo` (
  `idCourseInfo` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(15) NOT NULL,
  `lhour` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `semester` varchar(15) NOT NULL,
  PRIMARY KEY (`idCourseInfo`)
) ENGINE=InnoDB AUTO_INCREMENT=2016002003 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_courseinfo`
--

LOCK TABLES `application_courseinfo` WRITE;
/*!40000 ALTER TABLE `application_courseinfo` DISABLE KEYS */;
INSERT INTO `application_courseinfo` VALUES (2016001001,'高等数学',72,5,'秋'),(2016001002,'线性代数',48,3,'春'),(2016001003,'计算机导论',60,4,'秋'),(2016002001,'人文导论',60,4,'秋'),(2016002002,'低等数学',32,2,'春');
/*!40000 ALTER TABLE `application_courseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_exam`
--

DROP TABLE IF EXISTS `application_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) DEFAULT NULL,
  `title` varchar(1024) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_exam_course_id_6cfc1e57_fk_application_course_id` (`course_id`),
  KEY `application_exam_create_by_id_a110ef6c_fk_application_admin_id` (`create_by_id`),
  KEY `application_exam_student_id_09230bc4_fk_application_student_id` (`student_id`),
  CONSTRAINT `application_exam_course_id_6cfc1e57_fk_application_course_id` FOREIGN KEY (`course_id`) REFERENCES `application_course` (`id`),
  CONSTRAINT `application_exam_create_by_id_a110ef6c_fk_application_admin_id` FOREIGN KEY (`create_by_id`) REFERENCES `application_admin` (`id`),
  CONSTRAINT `application_exam_student_id_09230bc4_fk_application_student_id` FOREIGN KEY (`student_id`) REFERENCES `application_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_exam`
--

LOCK TABLES `application_exam` WRITE;
/*!40000 ALTER TABLE `application_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_institute`
--

DROP TABLE IF EXISTS `application_institute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_institute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `create_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_institut_create_by_id_61cfdfce_fk_applicati` (`create_by_id`),
  CONSTRAINT `application_institut_create_by_id_61cfdfce_fk_applicati` FOREIGN KEY (`create_by_id`) REFERENCES `application_admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_institute`
--

LOCK TABLES `application_institute` WRITE;
/*!40000 ALTER TABLE `application_institute` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_institute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_major`
--

DROP TABLE IF EXISTS `application_major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `create_by_id` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_major_create_by_id_ba4af410_fk_application_admin_id` (`create_by_id`),
  KEY `application_major_institute_id_807dcb2c_fk_applicati` (`institute_id`),
  CONSTRAINT `application_major_create_by_id_ba4af410_fk_application_admin_id` FOREIGN KEY (`create_by_id`) REFERENCES `application_admin` (`id`),
  CONSTRAINT `application_major_institute_id_807dcb2c_fk_applicati` FOREIGN KEY (`institute_id`) REFERENCES `application_institute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_major`
--

LOCK TABLES `application_major` WRITE;
/*!40000 ALTER TABLE `application_major` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_student`
--

DROP TABLE IF EXISTS `application_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `create_by_id` int(11) NOT NULL,
  `the_class_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `application_student_create_by_id_7503cb11_fk_applicati` (`create_by_id`),
  KEY `application_student_the_class_id_c84685c3_fk_applicati` (`the_class_id`),
  CONSTRAINT `application_student_create_by_id_7503cb11_fk_applicati` FOREIGN KEY (`create_by_id`) REFERENCES `application_admin` (`id`),
  CONSTRAINT `application_student_the_class_id_c84685c3_fk_applicati` FOREIGN KEY (`the_class_id`) REFERENCES `application_class` (`id`),
  CONSTRAINT `application_student_user_id_133af3d7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_student`
--

LOCK TABLES `application_student` WRITE;
/*!40000 ALTER TABLE `application_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_studentcourse`
--

DROP TABLE IF EXISTS `application_studentcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_studentcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_studentc_course_id_955ed3d8_fk_applicati` (`course_id`),
  KEY `application_studentc_student_id_389ae407_fk_applicati` (`student_id`),
  CONSTRAINT `application_studentc_course_id_955ed3d8_fk_applicati` FOREIGN KEY (`course_id`) REFERENCES `application_courseinfo` (`idCourseInfo`),
  CONSTRAINT `application_studentc_student_id_389ae407_fk_applicati` FOREIGN KEY (`student_id`) REFERENCES `application_studentinfo` (`idStudentInfo`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_studentcourse`
--

LOCK TABLES `application_studentcourse` WRITE;
/*!40000 ALTER TABLE `application_studentcourse` DISABLE KEYS */;
INSERT INTO `application_studentcourse` VALUES (1,89,2016001001,2014211001),(2,83,2016001002,2014211001),(3,94,2016001003,2014211001),(4,69,2016001001,2014211002),(5,80,2016001002,2014211002),(6,84,2016001003,2014211002),(7,86,2016001001,2014211003),(8,88,2016001002,2014211003),(9,85,2016001003,2014211003),(10,72,2016001001,2014211004),(11,76,2016001002,2014211004),(12,84,2016001003,2014211004),(13,83,2016001001,2014211005),(14,91,2016001002,2014211005),(15,76,2016001003,2014211005),(16,88,2016001001,2014211006),(17,72,2016001002,2014211006),(18,71,2016001003,2014211006),(19,58,2016001001,2014211007),(20,65,2016001002,2014211007),(21,63,2016001003,2014211007),(22,76,2016001001,2014211008),(23,85,2016001002,2014211008),(24,89,2016001003,2014211008),(25,90,2016001001,2014211009),(26,81,2016001002,2014211009),(27,93,2016001003,2014211009),(28,96,2016001001,2014211010),(29,94,2016001002,2014211010),(30,75,2016001003,2014211010),(31,73,2016001001,2014211011),(32,77,2016001002,2014211011),(33,79,2016001003,2014211011),(34,78,2016001001,2014211012),(35,88,2016001002,2014211012),(36,74,2016001003,2014211012),(37,81,2016001001,2014211013),(38,84,2016001002,2014211013),(39,68,2016001003,2014211013),(40,86,2016001001,2014211014),(41,80,2016001002,2014211014),(42,84,2016001003,2014211014),(43,75,2016001001,2014211015),(44,93,2016001002,2014211015),(45,86,2016001003,2014211015),(46,85,2016001001,2014211016),(47,68,2016001002,2014211016),(48,90,2016001003,2014211016),(49,78,2016001001,2014211017),(50,74,2016001002,2014211017),(51,58,2016001003,2014211017),(52,67,2016001001,2014211018),(53,89,2016001002,2014211018),(54,50,2016001003,2014211018),(55,51,2016001001,2014211019),(56,83,2016001002,2014211019),(57,65,2016001003,2014211019),(58,90,2016001001,2014211020),(59,69,2016001002,2014211020),(60,78,2016001003,2014211020),(61,81,2016002001,2014212001),(62,62,2016002002,2014212001),(63,87,2016002001,2014212002),(64,74,2016002002,2014212002),(65,85,2016002001,2014212003),(66,78,2016002002,2014212003),(67,77,2016002001,2014212004),(68,70,2016002002,2014212004),(69,77,2016002001,2014212005),(70,86,2016002002,2014212005),(71,74,2016002001,2014212006),(72,88,2016002002,2014212006),(73,68,2016002001,2014212007),(74,90,2016002002,2014212007),(75,51,2016002001,2014212008),(76,81,2016002002,2014212008),(77,65,2016002001,2014212009),(78,69,2016002002,2014212009),(79,72,2016002001,2014212010),(80,74,2016002002,2014212010),(81,87,2016002001,2014212011),(82,73,2016002002,2014212011),(83,84,2016002001,2014212012),(84,83,2016002002,2014212012),(85,92,2016002001,2014212013),(86,87,2016002002,2014212013),(87,95,2016002001,2014212014),(88,78,2016002002,2014212014),(89,80,2016002001,2014212015),(90,79,2016002002,2014212015),(91,70,2016002001,2014212016),(92,63,2016002002,2014212016),(93,75,2016002001,2014212017),(94,55,2016002002,2014212017),(95,79,2016002001,2014212018),(96,41,2016002002,2014212018),(97,68,2016002001,2014212019),(98,72,2016002002,2014212019),(99,85,2016002001,2014212020),(100,84,2016002002,2014212020);
/*!40000 ALTER TABLE `application_studentcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_studentinfo`
--

DROP TABLE IF EXISTS `application_studentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_studentinfo` (
  `idStudentInfo` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(6) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `bdate` datetime NOT NULL,
  `dept` varchar(8) NOT NULL,
  `classno` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`idStudentInfo`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `application_studentinfo_user_id_f6832252_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2014212021 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_studentinfo`
--

LOCK TABLES `application_studentinfo` WRITE;
/*!40000 ALTER TABLE `application_studentinfo` DISABLE KEYS */;
INSERT INTO `application_studentinfo` VALUES (2014211001,'郭子敬','男','1980-01-02 00:00:00','计算机','2014211301',5),(2014211002,'林欣','女','1980-01-02 00:00:00','计算机','2014211301',6),(2014211003,'张伟','男','1980-01-02 00:00:00','计算机','2014211301',7),(2014211004,'王芳','女','1980-01-02 00:00:00','计算机','2014211301',8),(2014211005,'李静','女','1980-01-02 00:00:00','计算机','2014211301',9),(2014211006,'王伟','男','1980-01-02 00:00:00','计算机','2014211301',10),(2014211007,'李伟','男','1980-01-02 00:00:00','计算机','2014211301',11),(2014211008,'李华','男','1980-01-02 00:00:00','计算机','2014211301',12),(2014211009,'王秀英','女','1980-01-02 00:00:00','计算机','2014211301',13),(2014211010,'王静','女','1980-01-02 00:00:00','计算机','2014211301',14),(2014211011,'吴宁','男','1980-01-02 00:00:00','计算机','2014211302',15),(2014211012,'张敏','女','1980-01-02 00:00:00','计算机','2014211302',16),(2014211013,'李强','男','1980-01-02 00:00:00','计算机','2014211302',17),(2014211014,'王磊','男','1980-01-02 00:00:00','计算机','2014211302',18),(2014211015,'李军','男','1980-01-02 00:00:00','计算机','2014211302',19),(2014211016,'张涛','男','1980-01-02 00:00:00','计算机','2014211302',20),(2014211017,'李娟','女','1980-01-02 00:00:00','计算机','2014211302',21),(2014211018,'王超','男','1980-01-02 00:00:00','计算机','2014211302',22),(2014211019,'李霞','女','1980-01-02 00:00:00','计算机','2014211302',23),(2014211020,'刘杰','男','1980-01-02 00:00:00','计算机','2014211302',24),(2014212001,'莉娜','女','1980-01-02 00:00:00','计算机','2014211401',25),(2014212002,'戴泽','男','1980-01-02 00:00:00','计算机','2014211401',26),(2014212003,'米波','男','1980-01-02 00:00:00','计算机','2014211401',27),(2014212004,'玛吉纳','男','1980-01-02 00:00:00','计算机','2014211401',28),(2014212005,'宙斯','男','1980-01-02 00:00:00','计算机','2014211401',29),(2014212006,'斯温','男','1980-01-02 00:00:00','电信','2014211401',30),(2014212007,'莱恩','男','1980-01-02 00:00:00','电信','2014211401',31),(2014212008,'露娜','女','1980-01-02 00:00:00','电信','2014211401',32),(2014212009,'斯拉达','男','1980-01-02 00:00:00','电信','2014211401',33),(2014212010,'雷克萨','男','1980-01-02 00:00:00','电信','2014211401',34),(2014212011,'哈斯卡','男','1980-01-02 00:00:00','电信','2014211402',35),(2014212012,'帕克','女','1980-01-02 00:00:00','电信','2014211402',36),(2014212013,'美杜莎','女','1980-01-02 00:00:00','电信','2014211402',37),(2014212014,'马格纳斯','男','1980-01-02 00:00:00','电信','2014211402',38),(2014212015,'亚巴顿','男','1980-01-02 00:00:00','电信','2014211402',39),(2014212016,'卡尔','男','1980-01-02 00:00:00','电信','2014211402',40),(2014212017,'帕格纳','男','1980-01-02 00:00:00','电信','2014211402',41),(2014212018,'路西法','男','1980-01-02 00:00:00','电信','2014211402',42),(2014212019,'崔希丝','女','1980-01-02 00:00:00','电信','2014211402',43),(2014212020,'昆卡','男','1980-01-02 00:00:00','电信','2014211402',44);
/*!40000 ALTER TABLE `application_studentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_teacher`
--

DROP TABLE IF EXISTS `application_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `create_by_id` int(11) NOT NULL,
  `major_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `application_teacher_create_by_id_de186a1e_fk_applicati` (`create_by_id`),
  KEY `application_teacher_major_id_1cc80409_fk_application_major_id` (`major_id`),
  CONSTRAINT `application_teacher_create_by_id_de186a1e_fk_applicati` FOREIGN KEY (`create_by_id`) REFERENCES `application_admin` (`id`),
  CONSTRAINT `application_teacher_major_id_1cc80409_fk_application_major_id` FOREIGN KEY (`major_id`) REFERENCES `application_major` (`id`),
  CONSTRAINT `application_teacher_user_id_4cc25d0e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_teacher`
--

LOCK TABLES `application_teacher` WRITE;
/*!40000 ALTER TABLE `application_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_teacherclassship`
--

DROP TABLE IF EXISTS `application_teacherclassship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_teacherclassship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `create_by_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `the_class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_teacherc_create_by_id_80384dce_fk_applicati` (`create_by_id`),
  KEY `application_teacherc_teacher_id_5c676a5b_fk_applicati` (`teacher_id`),
  KEY `application_teacherc_the_class_id_d014b352_fk_applicati` (`the_class_id`),
  CONSTRAINT `application_teacherc_create_by_id_80384dce_fk_applicati` FOREIGN KEY (`create_by_id`) REFERENCES `application_admin` (`id`),
  CONSTRAINT `application_teacherc_teacher_id_5c676a5b_fk_applicati` FOREIGN KEY (`teacher_id`) REFERENCES `application_teacher` (`id`),
  CONSTRAINT `application_teacherc_the_class_id_d014b352_fk_applicati` FOREIGN KEY (`the_class_id`) REFERENCES `application_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_teacherclassship`
--

LOCK TABLES `application_teacherclassship` WRITE;
/*!40000 ALTER TABLE `application_teacherclassship` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_teacherclassship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_teachercourse`
--

DROP TABLE IF EXISTS `application_teachercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_teachercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_teacherc_course_id_f4214bed_fk_applicati` (`course_id`),
  KEY `application_teacherc_teacher_id_0aea7fef_fk_applicati` (`teacher_id`),
  CONSTRAINT `application_teacherc_course_id_f4214bed_fk_applicati` FOREIGN KEY (`course_id`) REFERENCES `application_courseinfo` (`idCourseInfo`),
  CONSTRAINT `application_teacherc_teacher_id_0aea7fef_fk_applicati` FOREIGN KEY (`teacher_id`) REFERENCES `application_teacherinfo` (`idTeacherInfo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_teachercourse`
--

LOCK TABLES `application_teachercourse` WRITE;
/*!40000 ALTER TABLE `application_teachercourse` DISABLE KEYS */;
INSERT INTO `application_teachercourse` VALUES (1,2016001001,2010100100),(2,2016001001,2010100101),(3,2016001002,2010100100),(4,2016002001,2010100103);
/*!40000 ALTER TABLE `application_teachercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_teacherinfo`
--

DROP TABLE IF EXISTS `application_teacherinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_teacherinfo` (
  `idTeacherInfo` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(6) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `dept` varchar(8) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`idTeacherInfo`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `application_teacherinfo_user_id_50db01ba_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2010100104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_teacherinfo`
--

LOCK TABLES `application_teacherinfo` WRITE;
/*!40000 ALTER TABLE `application_teacherinfo` DISABLE KEYS */;
INSERT INTO `application_teacherinfo` VALUES (2010100100,'张老师','女','计算机学院',1),(2010100101,'王老师','男','计算机学院',2),(2010100102,'李老师','男','人文学院',3),(2010100103,'刘老师','女','人文学院',4);
/*!40000 ALTER TABLE `application_teacherinfo` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add CourseInfo',7,'add_courseinfo'),(20,'Can change CourseInfo',7,'change_courseinfo'),(21,'Can delete CourseInfo',7,'delete_courseinfo'),(22,'Can add admin_info',8,'add_admininfo'),(23,'Can change admin_info',8,'change_admininfo'),(24,'Can delete admin_info',8,'delete_admininfo'),(25,'Is an Admin',8,'admin_role'),(26,'Can add student_info',9,'add_studentinfo'),(27,'Can change student_info',9,'change_studentinfo'),(28,'Can delete student_info',9,'delete_studentinfo'),(29,'Is a Student',9,'student_role'),(30,'Can add teacher_info',10,'add_teacherinfo'),(31,'Can change teacher_info',10,'change_teacherinfo'),(32,'Can delete teacher_info',10,'delete_teacherinfo'),(33,'Is a Teacher',10,'teacher_role'),(34,'Can add teacher_course',11,'add_teachercourse'),(35,'Can change teacher_course',11,'change_teachercourse'),(36,'Can delete teacher_course',11,'delete_teachercourse'),(37,'Can add student_course',12,'add_studentcourse'),(38,'Can change student_course',12,'change_studentcourse'),(39,'Can delete student_course',12,'delete_studentcourse'),(40,'Can add 管理员',13,'add_admin'),(41,'Can change 管理员',13,'change_admin'),(42,'Can delete 管理员',13,'delete_admin'),(43,'Can add 学院',14,'add_institute'),(44,'Can change 学院',14,'change_institute'),(45,'Can delete 学院',14,'delete_institute'),(46,'Can add 专业',15,'add_major'),(47,'Can change 专业',15,'change_major'),(48,'Can delete 专业',15,'delete_major'),(49,'Can add 班级',16,'add_class'),(50,'Can change 班级',16,'change_class'),(51,'Can delete 班级',16,'delete_class'),(52,'Can add 学生',17,'add_student'),(53,'Can change 学生',17,'change_student'),(54,'Can delete 学生',17,'delete_student'),(55,'Can add 教师',18,'add_teacher'),(56,'Can change 教师',18,'change_teacher'),(57,'Can delete 教师',18,'delete_teacher'),(58,'Can add 教师班级关系',19,'add_teacherclassship'),(59,'Can change 教师班级关系',19,'change_teacherclassship'),(60,'Can delete 教师班级关系',19,'delete_teacherclassship'),(61,'Can add 课程',20,'add_course'),(62,'Can change 课程',20,'change_course'),(63,'Can delete 课程',20,'delete_course'),(64,'Can add 考试',21,'add_exam'),(65,'Can change 考试',21,'change_exam'),(66,'Can delete 考试',21,'delete_exam');
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
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$6noD48FKrKks$8GdS7xGwbQrhDTaSP5sGarGXHqrAATtywGkNV7WCa+c=',NULL,0,'2010100100','','','',0,1,'2017-07-11 07:47:39'),(2,'pbkdf2_sha256$36000$hFJvE7G8IDLv$ZIlB8+Cc++enfSmk9LBUhLQgKdTmufI3vzHtmt5WBns=',NULL,0,'2010100101','','','',0,1,'2017-07-11 07:47:39'),(3,'pbkdf2_sha256$36000$nKpX2YxQZ5VX$1K0ln+BjpMZn0QfxCk4G+yLoX+mxTEJwlP9BC1dbKcc=',NULL,0,'2010100102','','','',0,1,'2017-07-11 07:47:39'),(4,'pbkdf2_sha256$36000$4sfu6A2jmb1A$vaWqw0rv/IuKh3ugej+59lVD50s757oxvRaJwrj3+UE=',NULL,0,'2010100103','','','',0,1,'2017-07-11 07:47:40'),(5,'pbkdf2_sha256$36000$NaDMsy9VJA10$APLhwwilpZYshnXZFn9YZPoSJn9yeM1zavLzsti/YI8=',NULL,0,'2014211001','','','',0,1,'2017-07-11 07:47:40'),(6,'pbkdf2_sha256$36000$Rc7fMRF6TXIZ$4HEgisrvXuD4db+NTfzMCnbs4I9OvWgy3jBk4+EoNIs=',NULL,0,'2014211002','','','',0,1,'2017-07-11 07:47:40'),(7,'pbkdf2_sha256$36000$EeLzO6Q026Rp$pf1I0FVz/csC/H7lKuh7VO5VdXUwBg1DpjRd4Wksfn4=',NULL,0,'2014211003','','','',0,1,'2017-07-11 07:47:40'),(8,'pbkdf2_sha256$36000$Q2DqAUL8tloO$7xIiMIfXqlRqFJjNYRWq/AT+fbRkJmih2ludOEdZfP0=',NULL,0,'2014211004','','','',0,1,'2017-07-11 07:47:40'),(9,'pbkdf2_sha256$36000$EQgQM2pmN2Mu$9VSN1eWJogFiXArHWiHlPj7Nw3OQiZ3Ak3LKQrbzrW4=',NULL,0,'2014211005','','','',0,1,'2017-07-11 07:47:40'),(10,'pbkdf2_sha256$36000$WmF3eciCSLPV$yfDdRkjaj9BXNu2KbEBsApjqVt/k5u312XDevGx+9Hs=',NULL,0,'2014211006','','','',0,1,'2017-07-11 07:47:41'),(11,'pbkdf2_sha256$36000$FRE4AuvPCitF$gEaTXe6Yf0B2rrCwMzs3hspTbbm52X4FejkJ+PhAymo=',NULL,0,'2014211007','','','',0,1,'2017-07-11 07:47:41'),(12,'pbkdf2_sha256$36000$y4jSEQuLayO2$LA0D8qxgleNrjGmqDsCepCFZEWY5wu/37GeHhG1Ol+A=',NULL,0,'2014211008','','','',0,1,'2017-07-11 07:47:41'),(13,'pbkdf2_sha256$36000$pTz9dqfCNoUA$/P22QOtrZcTfcoYX7LO0zrgQWPtkIYRqompw3gw5uio=',NULL,0,'2014211009','','','',0,1,'2017-07-11 07:47:41'),(14,'pbkdf2_sha256$36000$6MRRKl2Y26pX$WxrjmuJaNtbSzSev8iG2KTXz5b7ISl/dXga8hl/LJsU=',NULL,0,'2014211010','','','',0,1,'2017-07-11 07:47:41'),(15,'pbkdf2_sha256$36000$0AsY98COYvhp$avpJm5RhpGW31SBIe9NsKuxU2kzOzsHSAIH1Lm9iJ8g=',NULL,0,'2014211011','','','',0,1,'2017-07-11 07:47:42'),(16,'pbkdf2_sha256$36000$QgPF5L6KG9cR$JeEl4RpotXyRNrloskQrYpccXPG51wGJP7nD88J40W0=',NULL,0,'2014211012','','','',0,1,'2017-07-11 07:47:42'),(17,'pbkdf2_sha256$36000$Kvs4gUZXvFD5$NrdEzqbB+bB3OkKgut4XWHmbllg5LAM0YP0kXmiYLWA=',NULL,0,'2014211013','','','',0,1,'2017-07-11 07:47:42'),(18,'pbkdf2_sha256$36000$mm5qa0G6IrWX$3uOfytWla1tMTvAyZ54su5OIgTs3C0HKxyB3+Son4V4=',NULL,0,'2014211014','','','',0,1,'2017-07-11 07:47:42'),(19,'pbkdf2_sha256$36000$xUcBeMHcVFeu$ILzbU55lXYv0bYhPI1ZXp4C/4vPkza8meWIy/SCR8RA=',NULL,0,'2014211015','','','',0,1,'2017-07-11 07:47:42'),(20,'pbkdf2_sha256$36000$sGEvoUznkfVq$QWiCp2gF91i1XANeJVK7oo3+mxTyTNSuprDXAVzEapg=',NULL,0,'2014211016','','','',0,1,'2017-07-11 07:47:42'),(21,'pbkdf2_sha256$36000$k0hMoMgMAYRE$BiQOyjoUcPk3jclpa9THozCFi2RFGmnhD75nT0/KGj0=',NULL,0,'2014211017','','','',0,1,'2017-07-11 07:47:43'),(22,'pbkdf2_sha256$36000$ykkqR7QOb0VD$e66oRtpCkxw4hIBAVe9DC7iKjIXDAECfUNedcT5ntPw=',NULL,0,'2014211018','','','',0,1,'2017-07-11 07:47:43'),(23,'pbkdf2_sha256$36000$TWGT7z7e7srK$RoZ5D8K6jdH2q+aGEqRfPuJK230H0Vsw/zxm94kn6QU=',NULL,0,'2014211019','','','',0,1,'2017-07-11 07:47:43'),(24,'pbkdf2_sha256$36000$0YGdeyrBRfUY$4P+z58xjoQSeHgY4gRq87pxBU8vLjNh1tsYH7J4py7Y=',NULL,0,'2014211020','','','',0,1,'2017-07-11 07:47:43'),(25,'pbkdf2_sha256$36000$APVQR0d0g2rg$8bQ6NTmZzT1d6w0M3iGsZCPShAU53fvexNNEHA3QgMw=',NULL,0,'2014212001','','','',0,1,'2017-07-11 07:47:43'),(26,'pbkdf2_sha256$36000$JJKDsQb3kcz2$m4Qlx/oThiRXt5uytK0XFl5w95EliUk4pZ4VyddN1h8=',NULL,0,'2014212002','','','',0,1,'2017-07-11 07:47:43'),(27,'pbkdf2_sha256$36000$AlP2hSus5aYE$SwcQYSZARR96XwLLG2dN8TW4EWrtNXK1T20iXeF1TRA=',NULL,0,'2014212003','','','',0,1,'2017-07-11 07:47:44'),(28,'pbkdf2_sha256$36000$IeQE4pSer9mW$9/c5MjiRZ2b9H1BfSs0xeCI5UkqdYLy6Nrr9Pw8U87w=',NULL,0,'2014212004','','','',0,1,'2017-07-11 07:47:44'),(29,'pbkdf2_sha256$36000$DHba3d9tjsVx$vJt0SuGn2SM+Ua3AwiqZj2CGcILr8MNz93skGvOHIGc=',NULL,0,'2014212005','','','',0,1,'2017-07-11 07:47:44'),(30,'pbkdf2_sha256$36000$EX6an6GL6A7F$CCfz8fk80YjXBKfhhuMveHEaW6lnzkEGeFIaOsmWm5Y=',NULL,0,'2014212006','','','',0,1,'2017-07-11 07:47:44'),(31,'pbkdf2_sha256$36000$cL01jqynChTn$QF9C613Pn4+EW560ewpJw/CIpGsaZDddKX86p1HSMwg=',NULL,0,'2014212007','','','',0,1,'2017-07-11 07:47:44'),(32,'pbkdf2_sha256$36000$MpQVlvGFEU8N$wcwK9UtP4cjBYkh59NEX8c4qPffIecf21CJHzCztsjg=',NULL,0,'2014212008','','','',0,1,'2017-07-11 07:47:45'),(33,'pbkdf2_sha256$36000$qwTK14DGT21i$RpY2McmxGDfiwlDXEJrLxy+ZoukwPH+R9sv1X/fxRwI=',NULL,0,'2014212009','','','',0,1,'2017-07-11 07:47:45'),(34,'pbkdf2_sha256$36000$y3JUa8TJitV2$Unj8ielrEZKK9+r8pybE2GWXJxmh023MrE/u4zS/U3U=',NULL,0,'2014212010','','','',0,1,'2017-07-11 07:47:45'),(35,'pbkdf2_sha256$36000$j6z6ARPNLVVw$+Ugy48UumQB1fdOT6ADns72Jvl8UrztX0/w10+wR7cA=',NULL,0,'2014212011','','','',0,1,'2017-07-11 07:47:45'),(36,'pbkdf2_sha256$36000$awLmLMRoNJUW$/AusLt0fZvF0ZRzcUmllkfX/AwJdCZcsIpU1bkxDqvw=',NULL,0,'2014212012','','','',0,1,'2017-07-11 07:47:45'),(37,'pbkdf2_sha256$36000$sG9yad2Zz1Ky$bFVcvGuQZM4ppx4U6Ey2gkIRg64dZCGtiBj0NEbXJOA=',NULL,0,'2014212013','','','',0,1,'2017-07-11 07:47:45'),(38,'pbkdf2_sha256$36000$ehChG5EdUfXu$eVv/h291A1vJ1DAp7gYTVgdtjtAGOcKg+mG+oL6LlyU=',NULL,0,'2014212014','','','',0,1,'2017-07-11 07:47:46'),(39,'pbkdf2_sha256$36000$xoHD4AKcLMjv$nE9eSIlqehV+kJf2VJ1dxEEXwaVH3C26eM6x35cEMDU=',NULL,0,'2014212015','','','',0,1,'2017-07-11 07:47:46'),(40,'pbkdf2_sha256$36000$9eDXWZ9jl1S4$kzxRFYbSW+ARNI1qzdI1iZwHuxs84j651q/IEKILzvk=',NULL,0,'2014212016','','','',0,1,'2017-07-11 07:47:46'),(41,'pbkdf2_sha256$36000$cZeZznZRjbmG$9xLyDak+q5ahUsSyZN2IdqphARMwO2VAGmbWSA2+mxs=',NULL,0,'2014212017','','','',0,1,'2017-07-11 07:47:46'),(42,'pbkdf2_sha256$36000$Ixc3dB7niYaQ$Wf3HOPrkPovjvQbTjrdeR5KX3WFcRBjNIwJxG5W47xs=',NULL,0,'2014212018','','','',0,1,'2017-07-11 07:47:46'),(43,'pbkdf2_sha256$36000$MHRXuL84y5Rs$E3tn0ckt8wV1v2Wgy2EMCheYwnDgARULKx/kmQxize0=',NULL,0,'2014212019','','','',0,1,'2017-07-11 07:47:46'),(44,'pbkdf2_sha256$36000$AQKTrrmtLpsU$rXj/4KIsgz3ADsRAdVfjG2TtuAyNIQ6aecWQBHtz+zM=',NULL,0,'2014212020','','','',0,1,'2017-07-11 07:47:47'),(45,'pbkdf2_sha256$36000$QRgrP5OQvYr2$nYpJzxDhmdk7gkpL7iQo2hsZRVtrKsaml8ZudIuYJIU=',NULL,1,'2014212021','','','',0,1,'2017-07-11 07:47:47'),(46,'pbkdf2_sha256$36000$opx59RRPsd4m$SQdyKkIkQPxSf0mFytBc14B/txtoJ/x6+nvxaqCGIAY=',NULL,1,'2014212022','','','',0,1,'2017-07-11 07:47:47'),(47,'pbkdf2_sha256$36000$yD5FckWAuvcZ$kZ2yTqm0uHBIUjSpDkBGYZhd1ZjgDuL6+kOx3ByZ9GE=',NULL,1,'2014212023','','','',0,1,'2017-07-11 07:47:47'),(48,'pbkdf2_sha256$36000$rWjAgAkB2xDa$XDTeMAHwq3MWcr9+ajlqWjGR5OFRKhnX0r/zoxisxMI=',NULL,1,'2014212024','','','',0,1,'2017-07-11 07:47:47'),(49,'pbkdf2_sha256$36000$ww5okqF4GQHs$UJ5GzpaHURgdin2shOHOYHP+qQcn7VaKqBQ+SKRBr1g=',NULL,1,'2014212025','','','',0,1,'2017-07-11 07:47:47');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(13,'application','admin'),(8,'application','admininfo'),(16,'application','class'),(20,'application','course'),(7,'application','courseinfo'),(21,'application','exam'),(14,'application','institute'),(15,'application','major'),(17,'application','student'),(12,'application','studentcourse'),(9,'application','studentinfo'),(18,'application','teacher'),(19,'application','teacherclassship'),(11,'application','teachercourse'),(10,'application','teacherinfo'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-07-10 16:56:16'),(2,'auth','0001_initial','2017-07-10 16:56:17'),(3,'admin','0001_initial','2017-07-10 16:56:17'),(4,'admin','0002_logentry_remove_auto_add','2017-07-10 16:56:17'),(5,'application','0001_initial','2017-07-10 16:56:21'),(6,'contenttypes','0002_remove_content_type_name','2017-07-10 16:56:22'),(7,'auth','0002_alter_permission_name_max_length','2017-07-10 16:56:22'),(8,'auth','0003_alter_user_email_max_length','2017-07-10 16:56:22'),(9,'auth','0004_alter_user_username_opts','2017-07-10 16:56:22'),(10,'auth','0005_alter_user_last_login_null','2017-07-10 16:56:22'),(11,'auth','0006_require_contenttypes_0002','2017-07-10 16:56:22'),(12,'auth','0007_alter_validators_add_error_messages','2017-07-10 16:56:22'),(13,'auth','0008_alter_user_username_max_length','2017-07-10 16:56:22'),(14,'sessions','0001_initial','2017-07-10 16:56:22');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-11 15:55:33
