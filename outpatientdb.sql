-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: outpatient2
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` varchar(255) NOT NULL,
  `date_hired` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user_profile` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('U0001',NULL,'Hired');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` varchar(255) NOT NULL,
  `bill_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `patient_id` varchar(255) NOT NULL,
  `doctor_id` varchar(255) NOT NULL,
  `consultfee` int NOT NULL,
  `discount` tinyint(1) NOT NULL,
  `medical_prescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `bill_ibfk_3` (`doctor_id`),
  KEY `bill_ibfk_4` (`patient_id`),
  CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `bill_ibfk_4` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES ('2021101000001','2021-12-11 02:25:59','P0001','U0002',9000,80,'Lorem Ipsum Kill'),('2021101000002','2021-12-01 03:27:19','P0001','U0002',100,0,' qwe 2\n qwe 1\n'),('20211028000010','2021-10-28 02:19:39','P0001','U0002',1000,0,' Foo bar\n'),('20211029000011','2021-10-29 02:41:28','P0002','U0002',1000,0,' Test x2\n'),('20211029000012','2021-10-29 02:45:39','P0002','U0002',1000,0,' aaa\n'),('20211029000013','2021-10-29 02:48:38','P0002','U0002',10000,0,' qq\n'),('20211029000014','2021-10-29 03:43:29','P0002','U0002',1000,0,' sdsa asdad\n'),('20211029000015','2021-10-29 03:45:48','P0002','U0002',1000,0,' asdasd asdasd\n'),('20211029000016','2021-10-29 04:05:59','P0002','U0002',2000,0,' dasd asdasd\n asd\n asdas\n'),('20211029000017','2021-10-29 04:11:40','P0002','U0002',1000,0,''),('20211029000018','2021-10-29 04:16:21','P0002','U0002',1000,0,' qwe qwe\n'),('20211029000019','2021-10-29 04:20:06','P0002','U0002',1000,0,''),('20211029000020','2021-10-29 04:21:38','P0001','U0002',1000,0,''),('20211029000021','2021-10-29 04:23:50','P0002','U0002',1000,0,''),('20211029000022','2021-10-29 04:25:59','P0002','U0002',0,0,''),('20211029000023','2021-10-29 04:27:30','P0002','U0002',1000,0,' asdasd\n'),('20211029000024','2021-10-29 04:28:55','P0002','U0002',0,0,' asdasd\n asda\n'),('2021103000003','2021-10-03 03:19:06','P0001','U0002',900,0,' Test 1\n Foo 23\n Bar 2\n  \n'),('2021104000004','2021-10-04 03:29:32','P0002','U0002',2000,10,' Test x3\n Foo x3\n'),('2021104000005','2021-10-04 04:01:56','P0002','U0002',2000,10,' Test x3\n Foo x3\n'),('2021104000006','2021-10-04 04:33:11','P0001','U0002',9000,10,' Biogesic x3 a day\n \n'),('2021106000007','2021-10-06 00:59:47','P0002','U0006',9000,10,' foo x2\n bar x4\n'),('2021106000008','2021-10-06 01:06:57','P0002','U0002',1000,0,' foo x2\n bar x4\n  \n'),('2021106000009','2021-10-06 01:07:47','P0005','U0006',1000,0,' Foo Bar\n \n'),('2021112000025','2021-11-02 03:07:57','P0005','U0006',1000,20,' Biogesic x3 a day\n'),('2021112000026','2021-11-02 12:00:41','P0002','U0002',1000,0,' foo bar\n'),('2021118000027','2021-11-08 01:23:25','P0002','U0002',1000,0,'foo bar \n');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` varchar(255) NOT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `date_hired` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `user_profile` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('U0002','Resident',NULL,'Hired'),('U0006','Dermatologists','2021-01-01','Hired');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `doctorlistview`
--

DROP TABLE IF EXISTS `doctorlistview`;
/*!50001 DROP VIEW IF EXISTS `doctorlistview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `doctorlistview` AS SELECT 
 1 AS `doctor_id`,
 1 AS `photo`,
 1 AS `fname`,
 1 AS `lname`,
 1 AS `specialization`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `medical_history`
--

DROP TABLE IF EXISTS `medical_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_history` (
  `patient_id` varchar(255) NOT NULL,
  `findings_name` varchar(45) NOT NULL,
  `result` varchar(45) NOT NULL,
  `medical_historydate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `patient_idfk1_idx` (`patient_id`),
  CONSTRAINT `patient_idfk1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_history`
--

LOCK TABLES `medical_history` WRITE;
/*!40000 ALTER TABLE `medical_history` DISABLE KEYS */;
INSERT INTO `medical_history` VALUES ('P0001','Tuber','Positive','2021-11-02 03:03:31'),('P0001','UTI','Positive','2021-11-02 03:03:52'),('P0001','Sars-COV','Positive','2021-11-02 03:04:24'),('P0002','fo','bar','2021-11-02 11:56:11');
/*!40000 ALTER TABLE `medical_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `nurse_id` varchar(255) NOT NULL,
  `date_hired` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nurse_id`),
  CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`nurse_id`) REFERENCES `user_profile` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES ('U0003',NULL,'Hired'),('U0004','2021-09-03','Hired'),('U0005','2021-01-01','Hired'),('U0007','2021-09-22','Hired'),('U0008','2021-09-23','Hired');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` varchar(255) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `age` smallint DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `dateBirth` date DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('P0001','Keith','Limbo',21,'Male','2021-09-22','09386508693','Lipa'),('P0002','Trisha','Gunio',23,'Male','2021-09-22','09466485696','Lipa'),('P0003','Foo','Bar',21,'Male','2021-09-22','09879006754','Foo'),('P0004','Onii','Chan',24,'Male','1999-03-03','09286540987','Lipa'),('P0005','Lorem','Ipsum',25,'Female','1998-09-09','09654789655','Lipa');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `records_today`
--

DROP TABLE IF EXISTS `records_today`;
/*!50001 DROP VIEW IF EXISTS `records_today`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `records_today` AS SELECT 
 1 AS `bill_id`,
 1 AS `bill_datetime`,
 1 AS `patient_id`,
 1 AS `doctor_id`,
 1 AS `consultfee`,
 1 AS `discount`,
 1 AS `medical_prescription`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `id` varchar(255) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password_hashed` binary(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES ('U0001','admin',_binary '$2b$12$95Ws96WC0ETKTzn.hzRP3u/JuFyo/.KajZks7tByGuNX8wsNwtoXW'),('U0002','doctor1',_binary '$2b$12$95Ws96WC0ETKTzn.hzRP3u/JuFyo/.KajZks7tByGuNX8wsNwtoXW'),('U0003','nurse1',_binary '$2b$12$95Ws96WC0ETKTzn.hzRP3u/JuFyo/.KajZks7tByGuNX8wsNwtoXW'),('U0004','asoka_90',_binary '$2b$12$ypa7E92.N9eVwsV3PYwvse63AAetWw8gt0/m6Tx4Ul4AjTf24Jjte'),('U0005','limbokeith71',_binary '$2b$12$WTRZddaoEbfgF5Vo5A/phuHpp0vPN/BLl8KcoR81iAd8w1CEs0Rhy'),('U0006','doctor2',_binary '$2b$12$fgPS9tymKd76vmbvUhCeUOegHO4NT1AMZNdhPJBVOON2dep93Ygk6'),('U0007','admin2',_binary '$2b$12$yau0VgE4vT8aInYuwPxXUOrmuJPEzPpNd4crrF8VnieEtpom5XKEW'),('U0008','irondummy',_binary '$2b$12$kAHfUaC9UKlESHV.HC.lhe16tf828V8eh5NgQE2g/W2pihc4ai4iS');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `uid` varchar(255) NOT NULL,
  `userphoto` blob,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `age` smallint DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES ('U0001',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0			\n\n\n\n\n\n	\n\n\n�\�\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0?\0\0\0\0!1A\"Qaq����2�	#B�3\�\��$bRCDr��\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\08\0\0\0\0\0\0\0!1A�\"2Q��Bq\�R���#3a\��CS��\�\0\0\0?\0�%�l8�mu8�Z2\�[\�\02O6&�Y\�3� ��G�������@1:�\��C\�\�vM4�*]�}\�@v!�N\��v-\"��@nt�;�h61g{�Ř�=G:9�J\�\�X�\�I\��&�R�/M�j4�!cu�M-\�)�>�s��\�$b\�nȟ�Q�\�m\�eI\���\\PFH�\�EU\�N���;}\�Q�j�|\'���\\?Ӹ\��<��vލ%\�f\"�~�e�E=\��&�j\�#U�\��\�@��\�7c~|����BA��Չ�8�M*�]|2$7���$:��G=��n\�]� ~�T�������	�m5�\�()˓F�\�����<\�\�|\0\�-<��\�\n-�� �i�/2i\��ӴT�\�vb2a�H\n���G���Է�nI\Z�2v�3]\�+{�@ yS��%è	�	���6wPS�\�-��\�2�[I�ܵr\�+6 7Z\�\�`�\0��@\�֟7l�\�\�D�_5;3�\�[;��\�U�y��mr\n\��ySY�Q& 6���\�UBY&&\�>5O�h\n)��oj!��)\"\"k�\�-p�m���{Z�A\�\��1\�M\�ş�G�x�\�zT6\�\�\�;�R\�^\�*D��`W����t1\0}\�\�?{�p\�H\�����kX�uVF���Pv��\'�	�p\�I:�\�e�	���@8�\�@�\r�1\�7�JuKI̧��#\�W�Y\�\�hTPW\�$\�?���\\\�f\�wr\�\�ӯ\�Y�C0E\�\�]\�0�&\�1�\0��Q���Ռ\Z/���{Ŝ�s\�;7wq�Y\�nG��Q�}���]O�\��82�F $���#o�\�8�mYI\��\�{m�@\�\Z{�-\�v%��1D�\�6����\�\�ѱGc$\�4rKL4L�5��\Z\�T�nB9\���\n\�y?�\�@�\�B�N#�<�IX �m>�e\���Ar|$�;\�*�\�6\�C��\�b�[\�{�n\�`ڷP�}\�S�?[��\�]��\�\���\�Ƴ\�8\�;��\�?�����-\�?\�T�	fZw&c�;}jB��`X\�H\�U	���0�7�ިoP�mgXV\�Q\�6 �޸\����ձ�.��jM�p	\�\��\�\��~+Y\r}O�\r�\�w\�2�\�{4\�K��o�7\�*SU�\�	��\�\\��L\�\�_`F�\0Jz�u�}B�\�R&��-�lCj#�\�=j�M{�Op�\��\�@#\�~\�\��M���\�}+�<�X���\'\�ҥ�ٷp%�\�c�;\�\�jN��:��2G\�\�\�U\�ĝ�G�P���x˾�?��X\�\�\�$\�I�%v\�y���\00vB&`�j\�dXql6���\�΋o�2�#S\�\�b$@�?�f$\�h\�q-��H\�}\0�U�\�G�l\�빖!��³\"�*O�\�Z+Y6Υ\�4���\0X�Z�a\�(\��\�z\��+��;hvU��L\�\�\�s��&ۤn<���M�&g�Ԗ�M>\�c��Iǹv��1\"`t���m�h������ijN��$�k��\�\��w\�,\�\��\��6��L���}~5\"\�W�\\�\�d����\�¯�-\�a�d !y	\�F�fܪ0!���������;m�\�\�\�F߭\�\�Q\�\����Bz�ҫ�\�����\�ϧ�Ң}77�n�\�\�\��\��\�9FZO�JA%h�2�5��\�L9TKY�3P\0\�A�=h��ē݆!�\� S\�\��ϊ�\��R�\�Vfp\�d�Lm\�Rl&\�U�\�>�U�\�\�vmd�sO�I�}\�\�:fg\�����qZ\r��\�5�\��\�\�w_\��J\�X#\�h\�@Cݨ#������.W5�\�4t\�)�H\ZF��^T\\F�\�\�\�\�~��Y-J�\�#\�\�\�±*�nrvޢa����`�\�O��*Kif\'�U\�`\��\�k)\�P� OO}9-�+p&\�X*0\�\'~T��\�^:%�H\�\�8����\0&V�v3|JH�l�D w?\ZrX,\�\���L(\��\0�ȏJ{bu6�\�bI\�?��\�%���\�U@ciܒyWm=�YA6\�}7��wf�%:D\�\�Ş\��P7��\�4v� �\�/4��\�@�%�[wi\Zw�zv�\�΢yAތ�J���A2\'�_��%͂rB�K�\�\�nC�\�\�p=O�J\�)\Z�\�M�֛k�EV�w�\�s���\�S[�J\�\Zz#\"\��䝹�t|�\�\�\�E�B\�+2\���\n\�4>���R\�\�}\�9��\��\�}>�\��\�\�\�\"�\�dk6B��\�H\�\�5\�7S��\�lB\�5ӈe߾@A���r��!�	����?4\��9\�\�$ؗk$��@\�9\�\�M\�\n$y??�\rl��ۖcɀ>UŰ\n\�\�A�\�3�v�\�t��6\�_�#X\�Zo\r�o�B)P\�\�\�\�S:��\0|\�RE|�\��df�\��\�j±Ӱ���\����M\�2!LDH\�*\�\�����!\�֏k#\�4$��\�g����_��\�U6n\�]0i\�\�\�\�ۻ|\"��6�@�k��w\07��q\�(\�2;,���7ݘI#�\r�o\'�om�?�Uxg(廳x#��T��;��\�\�\�\�o\�V6�De6\�\��\0\�<\�$TQ���=f��	�������U�\�U�\�\�S�\�\�\�F����$���\�\�U�#y��\�\��\�\�`KH��?�	\��j߄`�\0bU}�\")\�H\�EL#\\ ܸIH�ڧY\�\�b�\�X��tTʬ\�.���\�\�{\��\0�\�\�p�\�\��T4˙�-�\�F��|�떻��0v\�\'ά+%�!\�\0\�\�G����4$�yz�ևu\�f�\�\�,\�?E]o	rg��.�\�\�\�Atp�e���f�BWU��۝\�Цވ\�n`}���-<ʯ�\�\�\��\�*�\�q\�1~[<�r�׭�s\�b��Ո�\�I\�\�j\���۱\���ܹ�*�+5$�;i\�h�N�5�mb\�|R$��Vo\n��b<��ql�(��\�#:H�\�VxR�\�z�M\"\�ښ�h\0�U�rX@��L�۝dOq��\'`×�X\�T�\"\�Z\"�r��\0�r\�֬S�}=\�gm.*\�@��B.� o��tT\�\�\'h\0�\�\�K0�P�M\�R\�\��\�\�z����$�h��q=���=���A;\r#�Oޜ2�Jڙ\�F�\�S�%�\�\�\�\�*xL�bys�0C�\�\�gv��8;[W&�Sa\�����zR�݅���\�3!^Giv\����C��\�ex~��7Gx���n\�u\�Z%�\�\�LY\�\�z|ꃈE��\�Y(1�ĝ���nẐ\�$	eV\�UCCbd쾻ѭ\�\�\�v\�I>�E\�E\�ʵAbי,!DX�h]\�LO\�UM� cihb\��}\�]����B\��u\n��B���hE\n5ϗ�_�?E�\�-$�K\'e\�U����rA���\�V\�)j\� \�=~�4\�\�P�>J\�\�Y=\�\"cQ\�H]m$\�<\'�R*�gxmz.b�\�U��fyR��`.����9\�q�%�q\�+\�+�VĒI\���Ql i,\0�\'\�Tv3\�+?�\�l[��T�G�]\�-\�\�w�=�\\N��h\n�VE\�T�\��Uж�ۀ\0��O:�C�W\�wl�\�\��xL\�\r�V8f xt����\�hB\�YZ.A\�!��&�A�kGKPĵ\��a�\�U��\�\r��-\�	�Ѻ�A\�F\�\�|C�k��\�GX~��2�Q\�;0\�\�Z�\�1�Aff�;�%�\�\�fL~\�\�Ug��d(\�ۉ\����1ɭ�e\�\�\�\�9m\�Bf�jS[�V�\�\�Ы\�;8\��\�ǟ\�_�>ݫ�\�3�U\0㬒\�b\�đ���\�\�H�\�QuI8�1	$R�\\#W�\���G\����X�\� \�\�]TD\ZU[�\0a\�\��\�TC��{�Èp\'\�\�6�?\�]��H��_J3/Cvk&\�tZ�\�hR6��|\�\�\�#7pvڳG�pZ�\�e�Gh\�=ԇ\�\����T�x���b���\�\�\�\��OE�7A\Z���1�VZ\�Yr!$���~/I�����\��\0��\�\�^0¸�\�i\�~~�/��pK��\�j\��\0\�lF+Ń0:�c\�R�\�ڊ��}�\�!��\�eӋ\0��]z#q�	�H�X�PޟJ��\�\�z�a\�^^v�u�\�ŠH�|Jv\�T�&�=\�\��uG��\�X朂\�S\�\�E\�sZ\�\�X��C\�\Z�0�I2b��m�,Ve\�@\�T�Lsp\0II\�S,\�8Ԇ\n\��b+3\�&\Z�\��p�\�T\�\�\�\��Vk\�(�2*��\�\\\�\�\�ϥ�\0���:6T\0\�X6�G?:�g.P\�\'��Yd\�f�\�\�m7\�%T�w�2�����\�]9�=J\�r�\�\�\�\�m�3�~2\��a��1��\�d. `�\�\�\�\�\�a�\��⾆\�C؃�\�ָ��<�,Lػ>]�ćL�\�f[z�\�<\�`\�\��L\�1@`��\\�,f�f6r�\�Mg<h�F�<�\�<\��ׇ�a�I�\�\����p�%\�\�T�vcn\�\�\�\'�X��z\�=+\���_e=�\�\�\�?\�S\�X�W\Z\�8\�Չ\�,5�.�I\��א�\�v�셕��l\�\�\�\�1ɃÆ6pY>^��\�в�i5&ϲ��Y\�\�W\�h\��v#*\�3�\�I{5\�ĸ*\�n2��A��6+\�A�ALܛ�\�7N]\�\�v����\�pc\'Hۘ\�M�:|�g\�|k��\0\�\"\�,\��kٗ٫�xCU�9v77\�1\�]\�n��2d\��J�v\�\�Ŗ�\�\�}�s�2\�#VW\�Y�O�Ka��\�#\�k\��=�>�[\�xg2�\�r�\�p\�}�8,\�3k�,\�$N��\rH$\�m\Z�\�\�\�÷�	\�f8�2\��k�WZ΋�[�[�\���Y����\��Pk.&\�D4�9\��.��l\�$|��we�@�\�\���s^��ù\�o�\�3؛�\�u�\�\�\\@�)r�\"\�b)+\�\0\��0\�ˉ��q�W�ko�\��;d�HV$\�\�y�ny�ۃ�r\�]\�]\�]�r\�p�,Om<D�־���^\rgg\�\�	\�w��4��\�89\�7瞾ߪ�;G�a�*xcܽ� �_P3Ӟ���_hbx���\��{J�z\��\0��\�߼ǧD�\����ϲ;\��lÈm\�\��v\�\�ȝ-�̳�yt��3�\�\�s�2\�\��\'1\�_\�qbb�\�W���L-��\�1�\���,\"C\0�杤佹vwęfY\�F?(\�ey\�\�L���Me�}\� 2�\�J4\�,�\��e\Z �c0H]��}HLs�q�D���7�\�]~�e�	�\�\�-b\�`M���\�Nĩ\Z�\�{��\��*\�|kr����\�9\��\�x`7\nq��\��a����\�\�k6/��*�#K	�H��\�Y\��M۷Y�\���y��\�%ton\��_O�k�\�\��L�u�7c�0\���i��{\�\�%�����V�\�G�\0Ca�}�nO\�z�k��1�U6\�6�қI\'2:��mU0=\�\�\�\�\�\����ù\�<����cz\�I��c���f\�I@!�>�\�n�Qc�\�\��DN\�\�chXnY_���h\�\�V]83��	+�c��Z\�\�@��H���*sh\�\�\�c~\�\�7\0�\�+˯?.�2\�`���\r\�?}Qàn;w�l��\�M�\"\�V\�X	�K1��\�8s+\�E�4]\�\Z\�n��\��$\�ߝXa\rv\\*I���A��̚Q�b�\���,\Zb�\�R��3�\��\�g\�\�.-y�͌5���\��I�\0����\�c޻��cΫ0�̄� �Ȉ���\�S\�\��;oY����]��@����C\���g�xo�\�9�*͡~\�\�\�N\�\�1��e�\�|ȯ{\��d\��(\�d׽�2\��\\\�\Z,e\�3\��^\��2%�\�\0EQ�*�\�^1\�\�p�uȳ��\\\�\�X[x��\�\�bt^��\�=\�5V��X�:z\�\�\�Cۻٿ?\�(\���[���l�Ӊ\�3l#>`�\Z��j���Eƕ]\�k\�l�GWI\�Kw\�\r�Ot�mJ��\�m&\�ᘩ\�bw\n2�2�Y�2\0\��\�/\�w�틆{A\�*\\�\�[�br�\�,\�.>�,.�^��\�Qa�c�+\�_m?\�CŞʽ�\�\�\�+\��$\�o\�\���vqsM�\�\�-��Pui@\�[����(̿�_�\��3\�\�_⬻w�~3�m\�\��nk�\�+]e\�\�F\�|\�W�\�j=�go\�<QŘlF%\�w6,Z!P0�\�\�g�zʃ -��p��2��/�\�a5sT�j�po{�\�\����;@�1>\�9\��\�üS\�|<��ǁ\�K�iC^7%�á�\�_o_jn6[;��\�I)ⵖ1\�ۏ(�\�Gʼ\'\�v\�[\�h2�\�x\�᭜;-�l{���%a���<\�\�\'�\'e�\�\�\�/ȱc�x+�l��ώ%����^Ք\�\�\��]{m+!���oe���Β\�\�\�8u\�!\�m�׃c�\�.\�o�8\���`�ob1w��Pq��v������/*�qw�\�\�x\�$\�!�:ר��\���~\�2.\'ͳ�{��3\�G�\�Z%�%m\�\��\���U�\�\�K�Y\�\�̳˜=e������=��&M\�\�b6ߩ��i�\�#\�\�K�\�际\�/ql4\�\�\0\�~�\�\�~W�\�ju\�\�	aY�-b\�~1����\�2�ٞI�L\�9\�\��/ݭ진\��w�:\��\�<�\�}\�S\�_ǽ�v{k�;\�l��\�3\��Tb,\��\�h�\�\���6<�<\�\�K��\0i�k.\�rL��\�\�\�s�Y�|3<��\�7u$YP\�5��Qщ;S\�S��S;p/\�\�r\���N�\�X\�$n\�\�\�K��\�^\���v\�\�9\���\�<3s��0\�\�#�_d�\��[�n�\�z\\�ҍqI:P�}W�\�>\��z9\�\\]\�9.u�f\\M{���)\��ne�\\=��iŬ%Ƴb\�{֭�\r\�bA\nc\��\�83�8[���7*\�\�ʉle8��\�\"��l��\n9DG�?�{:\�\���\�y2�\�e�$���\�z��U$�o�Gbr\��Wple$X�u<~\�lH��z\�\�\�X�\�I�p�Uc \�|��`0\��\�Y~lڴ=@\0|*]� �n	�;y�Qm\�+n&y��)\��?x\0$�\��W�&c��^�~�=-\�\0�K@ߧ*z\�V*�d���\��p\�X*#rG֊�kF-����\�hm>�J\�4#�\0.��\�l\�gx���\��\0\��x��I[\�6\�\�D\�\�N\�h��U@\�K�\n0\�>g$��brm\�[Ku�wj�%�][z\�*�\�6�\�`�3֕\�\�\�3O��\�|?\r���m�\�\ZA_*�\�pށ�0Ł\�\�V\�\�G��\n�W�\�jE��%��V���q\��Q]NјY\\\r\�b��\�\nL\��\�Y.F�`\�\rC\�c\��hFN��6\"w�y\�RS*x���`�/�\�R\�#\�eIo�\�)\�����&\�I�,-s�i��\�Ō�\�,뤁\�T\�yM�^\� ?2iD�������Q\�\�\�X̯�8\��^\�Z.\�YRY�� ��ݶ\�\'H�P\Z6I�.��9}�skg<SÙ\�}�f&\�+8\�LM׸\�\�&F䓰v�s��Zf�B�\Zy��6�jt`̦v�<B�D1\�\�\�l\r�����aU�F�V5\��h&\�A�\�/�=�?�Gf��\��\0�}��1��\��\�w�ˮ\\-�\�\�!�U�\�uٶ\��򯄲ȸ����\�p�\�\�f��@�k	�F\���+\�cy&\0\��eo\�\�n\�\�9\Z\�+\�p�������XE\�\�eC�\'}L7?]�����1��\�\'�\'�\�Օ\\X��9�ܽ-ke�\�ٛ�\�\��\��1\��It�Sb\�ys����ŵ\�.3D�/$}\�V��6�\�fo�\����ap��R���\�\\�vҷ\�\�\�1@Fб\�[E��\������\�I\�E�mH	�\�GO?J\�B��\�\�\�3b��:��f\�\r�ǪH�\�\�\�j\�9ҍl/�BI\'�đ\�k�\�\�0Pf\�\�oJ\�\n�<��\�I3�f\�\�\�U<v���\�\�Q\�\���\�\�2��\�\��҂\0�z\�|\�\�r\�/\�y:G҉���Y䉠x��i��\�9�\�oJ~��\�ܾ愯iB��e|�\�E5q�mZr\�2A�\��͖wR�\�S\�N�AhӸ\���\�\�,\�\��f�\�ahCi�&AL�P�\�\�\�vH\�aZFʚ	\�\�A\���\�r[�bٕ�v#�\��\0.�P\�\0�\r\�\'��\��\�\�؁Ь�\�Q�2\�0LE\�\�\���(\�\�\��\�\\\�\nܦ-�\�\0�k��\�T%��\0\�\�+\�\�k\�6�l#j\�\�J\�\�S(�o�lHb�\�Uƺ{py\�ͤ/G\�˩7fw�ү7�\�\'bn3>km@܂\��|y�ɩ\��ٸ�*�Ր\�\r�\'i\�#\�T�V�\0\� \��/���q�LD�D�\�\�U�u\�@:�\0�\�h@j\'VU:\�)=\�,nF\�\�j%�FP�\��騉�YBKV�X�\�f\�\�vQ\��\�\�$j\�h�P\�\�<bs��J(F �\�w�\�UU�\�\�(\"`��-�~{Y��ެ�(\�\�%�\�	5��>\�\Z\�ѹ\�14T\�\�p��L#���x�@c{H�\�c\�֜�\�V=\�\�v�\�P-@d�բ���\�D�\�\�\Z-�Ф;�\�F�-fWR̆m�1��\�\�\�\�7C� \0`�~\�\�nA��U�����`�iV<�+��W@;\�m-�\�P?�u\�䤏5�*zbs\�;�ى�4�ޔ����\�a`�\�`\�4�t:&t����\�U�����3r�\�X�d�$\rG����*˚\�8\�n�\�oĊ@�I\�E<b#R�\�\�F-�\0m詌\r,Ln\���\�X+\�\�:+Eċ��\0_\r@{\�=\�v\�\"\n\�j�\��\�6屒v�N7�\�	\�T�\Z鍥\'5cgA\r���lH\�\�\\�l�F�\"tm3Q\0����:\���)R��8��@e\�ɬ�̕)\�˓\�\'��.��\�\��\� it\�d \�rgh#\�]G���� �\���V�\�Xn&e\�\�[�1\�\�[d��\�Ҫq]�\�nR\���Ml\�[\�\�5��z�\�g�\Z��\�\�H�\�e\�\�\�3 }��\��[mWƐga\�\�\ZU\��\0�˂\�\�E+\�D�����\�\�M��X1�/0{\�\�\�ӷ\��\�Ҥۻd�\�\�A\�ְv�G\�q��\���\0\�RGex�0o\�D/�\���\�E\��$\�\�\�ؿeSM\�#P$�3#\���۹l�I%\�α�8\��\�PDG_�\�J�\\�\0ti�u��\�}\�%�H3����\�oE�lM�:\�,7\0\n�6]� 1A\�3\0{���A�\�qF)\�&\"i.I�b\�U\�vr�\�\�q\��\�`��\�B����{�W\���$\�ʎ�E�b/.�S=\"�ߑ���\�\�N\�\�G��/�[��0ZGօӑ�{p�<��F���h�\�S@ه\�\0\��\�r\�\�u$o���\��w�^\Zsf�>���f׋��A\�\�_*I��?�\�\�����|\�ޢ�\�%��:zq�U�`�Bb9}���al�(��\�-?:zٱe\�~Q0\�{\�fi-k�^m?%v8�\��\0�@�\��\0j_�\�C6\�v�}�So��1i���1��\�\�=\�C�xU\�{���rQ|.�\��\�謓?\�sU�$�\�>�i\�5ř{X�`��\0>uV�M��\�3��\0����\'YAR�n4);G��\�\�\�WØ\�݃ܩ��L\�\�\�/�9x�\�D��\�\\�,(;�W)\�\�c	u�3:dLz\��1\��6	��#\�\�Bd%0Q<�\�+��\n�eG)�E+�����X;\�7�{y\�r7�`�#¤1�\�ӥ�\�\�^\�o�.��Jܬ��F6f\�4�&w\�ʉ�N$iG\�I$\�\�B&op�w\�+�1\�\�WĹ�\�K\� \�J>v�V��[\�m!�	\�EvL5\�\�w���T\�{\�Y�ĳ�4�\�Â\�q�\�U񏚮�x��\��e��\0�\0QY��)U#\�\�U4��\�L�\�J�\�\�AK)\�+��\�L\0\�\�)#A&}�cf\�\�wˀ\�	1\�q9(!F4�;\�q�\n����[VW\�27?V\��]�=�fGv\��*U��tC�l\�2\���E�����`����br\"��Kh��\�m�\�\�[�;�zyR�H�)G\��S,\�h	{xPcrTT�υ��f<�*v\���\�g�]H��\�P���_\�0\�\�*s�Y�:&R\�\�q꤮uq\����T\0�~uӚ\�\�e\'��\'���o4�8\0\0<$�H3Ҝs�(p��+3\�\�M\�%\�\�ܧ�D2 c��B��yxF�9\��\��\�U.\\ҫ\'գ\�Q�;��l+�l\n�9�&j]uY\�\\R�t�\�@/{�i�H�q9�\�M��H*\0�zӖ\�uu9)\n`�\�=�I�\�K�\�°e�\�F��Ũ$[\��-��~i�w5�ִ}l��\\x}^�w\n\��\0U2լȮ�\n@\�\��I�\���*�5fX�Ql73B\�\�%�3��XK�Gx�\��8{M�Y\�b\�i��t̮�P\�$�҈��rʷ���Pq�ǥ,�$�ԼfB���ZC@�9M�\�	��*�\�q��׶T\�(i�\���\�\�M��\0��Uv \�\�:��1L���\�Ls��]���\��\0��x�71\��@�\��	�R\�9�\�PL�W�Ds)oB�\���\�\�i��\�-��^N�\�~2\�[\�/�Ai&h\�|nQrm �\�ψ\�8[0�ib\�\�\�=\�\�Pm��\r�s?�+x����ᙗI�\Z\"�\�\��uX��ɉ\�{��� �)P�?A��(�m`-�W�jۂ\�\�)ً\�A=)U#fXdpq8\�y���w�W��3\�X��\�}�\�\�u��AQ��q�\0ޟ��X��B\���r�B\�k\�Z��Dj��\�aY�;�M{SH\�j�\�14]\�-��.\\�\r��0�#\�\�lq^\0,6\�\�i����SX`c�� Z�\�\'�s\0�\�ӕ(\�FFj(\�FBz�SqU�<��4\r��\�\�\�*�m��	�\�e\�\��#j�mH\0�;ѭⰊ���\��vv\�e\�m\�O\�\�M\�\�\�nJ����/^�AL�*7�\�z\�h��\"r;�\�z�Q�\03�s\�q\�\�JtK&\n�^M=U\��v:\�6ŗb7&6���Sq.nȢՓ��o1\��g(�\r\����\0��3\�uu-�B�?h��y\�t�\0���\�Y�tu3X;�\�~�Qp�\�\����\�$K1���\\�!Y\�7=x�\�B[�\0\0ϡ\�\�It\�X�;�B\�q�p�\�B4\�$�\r.\��\�UX\�.^\�z\�B�\�\�V~T�;K^d*�<��4\�#$B�_ �m\�\�\��@$�sG�v�`�\�A\�l\'�eG�E\��i�,)���\�sIīL\����\�vYF\�\�\�\�-��l��\�F\�:\'\�\�\ZG\�\�S�}+o�0wR]�m�\�\�\�\�\�\��t\�\�4\�\rf$}�Jm�!S��-�́�\�A\Z�;�}��q\"\�M�f�)�f7RB���?q֞3,k��\�Qg`�0(\�\��M\0۽\�z���\�8��q\0�6F~\\�\0z#9Ŭ۷�\n\�w\�Y�~꾶\�7Y�\�D����\��\�OZDmu�1D\�\�\�U�\�\�8�\�\�\�$A�4�7�\�\�c]!�\�\��w1\��\�~0\�\0g�\��y�*w\�--�\�����}�P�9\�0\�@̘\�i�\�\�\�11�Įŏ\�Ԫ��g	\�p<Q�WSJ�A\'\"��=xM�\"D�Ct3��\0e\�;�*n�m�s\�)R���e�f8��c=�IO�x�H��\��cҕ*I�)韍�n\�\\��4O\�\�!\��\r�g���*�wV\�\�\�\�3�v�(q��\0t$�k����/\'}\�\�*T�4�9\�\�\�˟)R�\���\�Mux�[�Hp�\�\�O?JT�<&KdM\�9��jN�v;xA\�҆8�\�ݴb\�w\�֕*�O\�\�\�\�qx��UQ��\�ǡ�>�E\�q\�nc\0,�\0�\0\�*U1��D�N�qh\�\��\\�� �QD��\�[��\�n�L��\0{R�I1���]T췺d��\�Kv�\�`�\"74U\�.l��A�d��\0t�P�y+\�\�\�c�YYm\�o\��\�ds�+!L\�i�\�*T\�$bG\�\\R\�$\�r6�\��\0tD\�p\�Y�vt�U:�!\�[$r\��k�.����\\\�ˈt��R2\�r�R�@\�#�F%u\��o����@X`?jT�Q\"��\�\�_�\�','Keith Richard','Limbo',21,NULL,'09386508693','Cuenca','Hello'),('U0002',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0			\n\n\n\n\n\n	\n\n\n�\�\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0G\0	\0\0\0\0!1AQa\"q�	#2B���\nRb��$\�3r\�\��&Tcs���\���\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\03\0\0\0\0\0\0\0!1AQ\"a2q����\����#3R�\��\�\0\0\0?\0�S\�B\0\��5��\'s\�z`�F�be|\�x\��`\0�;QHܞ��\�\��\�xb\�\�$\�q�N	����ry\�?�&\�\�u%�t=w�%\���\�2�U��IO��\�\0o8ac~Xj�gȅ�N\0=\�)��	qJ�\� �J^\����ڗ��!\�^7\�$\� N\�7W\�\�*`\�?q��h��\���-j�3��q¦���MI\�\"ϤL\'\�\�WYSۜ�A*\�<�J.s\�\�M�\�\"ё��+\�8\��:i��+->�qM�Z@�Nu�D5��:U�V\�¦G\�\"�Vi� y��\�t0d$\�R&�\�Jpp~�&;~P��\�c\�	�2%\"�rL`\�QiW_X*\�z�D\�\� FT\�|��\�LD\�!��\��	\�Dm��\�\"\"8FO/q\n�\�\'9�C|�w0�eY���=m�U\'%�|\� AY*(\��P\"J[\�\�N<��{\�c\'\�����k�?�Ej#ώ�\�+pc�a\��\�,�H�t\�*	W\\­ �s���\�\�1�K�\��w.\�WS�K4V��>�N9l���\�J��\�*�T��Eq�\�\�.K�τ\��\�|�:�B���J�T���+t�{\r\��\0\\�\�ZL�P}�O�.nu�\� �8���\�H\���_��\\�\��{F�f\��K\�k-�z��\�\�9�Z>�^<\�ώ x�Ԯ!\�\��S\�[�n�V�p��\�ġ	\�Ͷ��;�<���\�g&%\���\'�\�>����\�\�d���\������&5�i�u_n*\�(\�Z��k\r��%����b�r�T\�\�`UV�պ\�6?�B\�\�\�\�\�! w\�+$\�\�Ք(gr����\�nS��a�\�*�\�86Cnry\'\��MW�,:\�.\"�O4r��\\ʙX����:DMɢZ|�v��3qO�\�~pC\0J�kò���q���T\�F���\�d�\'_h&p7��Hy�\�\�h�{�����8$٥\�7H�]*eK~ѭ:�M�_�[?e\��\��\�|\�\�O�.p�p���ޏ߳��\�N��5��}RBeS\'��-=,���c�*�H\�\���Xi�\0LǧO��}\�:��X\��\�3���\��>\���F夛�I%���)<ږ\�\�	B\�[\n\�JVRT\\\�N�J����\��\�\�E$\�DQr	�� �\0$���� \�P\'�m)\�\"C�v\�\�@\0@�6�LYj	gϺA�s\�9${2���H\�<\�s�H�g9����b\0�-`\�f\nU\�\�\"�d�\�\�\�X=�Ԯ\n\�OH��)j�f�mP�\�\Z���I	G&f�	$��\�T����h�\��R�\�q\�ĽCQ\�IZ�v\�4իv$ҲK�\��ח��\�\07	\�\'\�\�W~�p~VlI�jU\Zx��$\�I��}A�����\�e[c\">mn�\�S�*ۙnMd�tR���\r��b����\�_M��5�):\�]*w\�#J�����\0��:��\�\�sp}b3R�ݜ�S���R~\�!\�U*\�\"ZE�$,{�\�$\�l��A5��\"SÕ�2���\���te�;\�8$툺�f\��m�\�\��#&\���B��\�\0ʿH\�+\�/�\�e���\�w\�\�P�D��zs�Ʋ���bg\��\���\�\�C\'�F>\����nSj�Q�E�6ʔ�6��6��\�Kr\���q�x�\�\��\r�\�Vh*�W�8�\�\�)\�J�I\�\�]��3p�Fy��ݡ\��6y�)��\�\�@@\�g�\�?e�\0y��\�	��\�S�9�ҎzcxVV~jBa/!8Z\�c\�c�.��o9)G\�y:d\�ʙ���\�R6b\n|�\�\�\\)S�x���ο(\�\�\�S�$��GD�Ut\'���\�j�zi�{\�:\�\�\�\�\�Ӓ\"\�Çn\'�G�MF�\��4�����R�+RNA\�\��I�(k�\��n\�2$����Nm\�$pV�\\)����3�!8\�|�R��\�\�<�\�\�\�պ\�\�\�ۧ�˕\�\�[\"BQ�Գ),�$�����/=s\�7\\�`R�A	q$�U�\� +s�:��(\��,\�c\0�،\�}���\�DJ.6\�#)���H\�g&\"�Bt\��O\�0\� �����_V\�>Q�u]D<y^\�߷�k\�V	\�\�X�Y\0o\'\'�d�0P�\"(2� �m\�J\�+>�ų\�\�a\�}�\�\'*Zb�\�Um�)%L=7`\�\�\'ZĺԜg\�#���\�\�I\�YYⴟǂBH\�w�}��*\�\�\�6\�\\eԔ8���$�A\�|��qc\�[H\�\�Mm\�\�\�\�6%ˌ!��R��l\0\�\ZN���\�_D�\��UGoʽR�_6\�	%y�\�\��f�8�\\��\�\��\�K/�Ri\�NL\�w; v��G+趕Tn\��*\�2�B\�Uv�\�\�P\n���@�\����4-:�\�$\�d\�\�r��\�ʀ����\��\�|@�(\�;\��]g��[Z\�uTm\�\���ʻ�OG�\�&�Ĭ�5�6R\0H\0c\�G�2��\���\"}!�Pw\�cA<\��p��~�\�)\�m!\�F\�pb\0P)\�\�7i\����\�x\�V����.���d\�\�\��\�O\��\"���\�J�\���Z:_bN\�7eY�9Yv�ヘ�7	��8\�\��\�N�LN[\�\�ݖ��ܣM��K\�\�\��>C�{�ٺ�늺�\�fe���\�\�A\�R\�\0R�~$�v\�Cl��\�}&���C�X\\\�\�/�\�8O��>繃ku\����d��p����ui\�\��>�\�`��Ծ�G4����)�~��\��%M�c�霞\�Q\�켩�ej�\0\�(�*4��6	�汿Ǵ9�@�JOQ�n�L��@zE�H\��\�O�R>[D��i\�%[z!�U�� =3xJ\�)�w@bX��{򎣅\�>\�\�C\�츯�\�E��!�G|�\���g�\�U}�ʶ\��E\�F\�r\�#\�Ga\'?��u��\�aA\0��p���\�|�;\'\�;k<�\�Ϭ#y\�\'\�`@�\�FaD$�ƽՒO�!�\�O�#^\�HQ�\�+:$V��Gh9\�0\�\�?��\��\�%�Q w\�e\�\�\�x`\�!@r\�Oh},p��\�BL�\�9{$��;Gϯ&I\��ը��q?[|\�V\�V\�\�x\�\�G��|���#\�R�3s�\�\�%\�Q\�N�}Smg&i\�iy9\�T&L��],�]L��RR\\%����1�\�q#U�f���y\���\��#��.<�\�8\�Ņ��|�\�]�\�\�V��+!J����})Z%\��U�9�U�ĪG\�	jj\��8\�*֭��\0�g\���q�b\�\�1\�,�}$\�L���_c�.2\\l$\'�Ǘ�a!;�b�\�\�΅^���bУ\�OOL�95yN�9\�R�V�YuY\�9!D?(\�Yn[PT�$\�\����\�\�zˋr\�R�\�0{}6�S�~\�}�H�\�\�+\�e!�f	���\�O`BTO\�\0f:W�o�\�B8��������gOI��\\n���N2��#�gm�H9�_��\�?	u�kJ�~\�rbQ��\r\�&o\�I\�O#� \��YZspj~�P�vi\r3I�jXif�\�\�9堒O9Z7v\�c&��i�I�;��B\�ЩE\�w\�\�\�\�\0ؕ\�e.�o\�e9#:ۍ:B����k/]B�lZk�k��Ի\r6��nBR2H\�4s��.\�\�\�_F�:B\�*sL\�>�J\�Ժ\�Y,%*q��	J��\�(�v�����8��\�\���Y\�\�rJyro.�<\�R>\�hZ\�\�l����\�`\0��޹`!��\�\�j*�\�n ��\�h5\�\�\�\�K&�1n\�f�\�W7���饦I�yAQN{�>qP\��:ȫ��2�\��ֹ\�Gq��A�۬o�wX\��U��\���\��\�/�t��LTJ��y�E(�\�w8\�bki\������\�C\�\�\n�D�4��f��KĂR���\�A �X\�v9�jd�\�\�SR\�֝F\�\�\0�մy��\�n�\�<T\��\�\�d�y�Jg��X�e�S�S���7J\�\���k}�{v��_o�aSw�X�ĳ@�<�\�Q�I��0��\�%V��D�n�3I{\r�\�\�PB\�.T���9\���\�@��D�\�\�=\�3.\�\�vWSj2s�\\\�\nm�\0)=��\�2x]Ӯ\�t��\�+�/�\�̸\����\�G��\�\�\'|b�P* \r�\0���1�����c\�9�;~q��\'��c�����\n���� �J�\�$ A\�@\�\"B$�L)A�w�\�\�r}!\�ʈl�8\�\�\"tB�\��\��\�\n�\�\� s��Jv�\'\0ǜ?�\�AQ�A\�\�5��AJw\\�\�F�\��P�i\�R2H��3S��JIRy��(!X\�\�;�0\�H΢\�(we\�\\�\�M\�\�\�%Iz�����\���\���\�d�\�\��\�;��\�5Mjۑ\�i62\�1^\�:q�e\�;���G$k=*�}\�\'���ܭ\"MՉT�\�u@�@�܎L�帧9�\�d�|�xv��nN$j\�H3�!P\�J�{m\�oW�f�J�\�f�Y�\�j3�x�2o(�|�\�d��\�\'S�%W/�\'(\�Uvil�r�����\�\�H1l֬\��i\�\�q-\�%Y��]y��*H)q�Р�\�\rm�\�zr\�rƌ�Ɇ���Ъ0ۓ@\r�\�қ�\�z�����\�5\�\�p\�\�v[�[kz�\�\�h`�0\�\�o#\�\�T_�FN�ꍗH�.i�̔������ϴ\�y�ڞ#�H\�\0\�\��\�\�:N�◣v5�F��*]�E�D�@#���\�9�$��TNTI�\���}��\��۪\r}�n0��\nf�n���\�U5���t�9T�����ede\�*N\nԆ\�q\�% �@H\�\��\�Ɵ,��cT�F�\�Ђw�G\�\�e]�\��\\g\�]ӯ:�h\�OJӦ��\�\�\�!i`>�d%9S.\�$���|��Rd��[�D��d)�U5�\�1R\���Ȥ;��\�Đ�\r˩1lpMü�\�C%��mɠU1T�i�D�4�\�XO\�H\�)���\�׋��/ٚ.�ieI�}\�hL.f�<�el�\��K\�o�TӉ B��7a�9�\�\r���9`\�\�\�\�s߯�d�\��\\Mpm�|L\�\�t�a�NU���\�ɖ\�9&Y�B\�]�h<��TH\�\�6�\ZE\�\�\�;Jd�y�\r*]�yr�\�c	BR9@\�\�1��q/Om�Ӄ�\�\��y�^呙�w\�a\�\\O��\�gXu~�\�j���\�\�r��Z\\�\�O��\�\�\��*��uc\�P�\Z&�\�}ο\�\�Tڕ�6%�A�Ԛʧ&ݷ)\�3�\�.uA�\�Yq	RѺ\\#���\r��0pbs���spݢ�\��3�jR\�5�\�\�F�,�Җ\�6���*r\0\�q�k\�\�7ֽOm�MW��\�v\�u�g\�T��\�\�TB�^�\r�\�P\�@QP\�\0��i�e�-ɪ|\�JC\��\�(M�����G)�+k�M��+\�B�y�R�\'��uغ{UuK\�5q?\�B��V1̤�mu:DsE-�-=/�R�IK�c\�q?\�\\%X��#�(\�\�j\�7V���\�9b�\�\�QU�v�`�\�\� \�+Gh��eg����\��yw�s����� F�˰�Y�lH=����\'�<�?VF3^\�\�\"\'Iso\�1\�c�\�0����\'q3vN�X\�\��\�:�PJ�OS\�#�,�H�\�n\�rZ�*6\�\�An~Il�=�I\0��\�8B�eM���&bjfJi/)��#\nK��%IWL\���v��\0�ZJyI�EY�|(\"�\0���7St\�N��\���V\n\�B�\��{\�\�5�F\��\r�J\�?\�)\�=\�a�\�\�~�\0�\�:MS���1#Q�\0k\'\�,\�F0�\�!�\"봪��-G#n��\�#��\�-\�+9#Yv~N��<fa-�L#h\0gb9T>&5�]h\�2�\�\�\�դ�w�;p�J�\�\n�̴�T\�$�.@$\'m�Cko\�\�\\I��ӭ��HK g=c�	\�\�Rk�d\�9;DB{Y-	9椦\�?4T�\Zz�[��fD�sZ醉R�6\�\�Rnu骾�	6�Y3)8q�|��~���\�Z��\�=�\�bf��y\\[s\�YWcɎR��Y�\�V\�3�\�uNH(sM\�o�\��\�B�=i�h\�2�~�\�(|��38ښij\'�R�:�\��FR:�Mz�~jeMS�� \�5ᕨ�\'?g;���\r\\\�#�`��K޲5��eI��gS�-��|�\"R�%V\�;����P�un���Sm2��\�\�\�\�4#Jy]\�j\n�ܛ�CJ�t��\0\���\�}c[nZ\�:��\��\ZZp�\'f9\\�\r��hJJ��dg\0�K��#�\�MU&*����O\'��<46�\�)$�\�9\�#7�Z>�AP�*\��^+N�\�#㉟E4PJ\�\0\0�@!���\�\�\n���\�:�uܑ�u+\�`��\�aפc �\��\\�I\��\��T\n\�W�\� dt��;\�rH\�:c�Y���� �\�70 HT��G�|>c\�\��;�y3�#�\��;*\��R\��c�)8\�@\'\��T3�;\�PJ ��3\�ÆTz\�F\�g\�DE=�Q߼l��P#=#[.\"\�\���\"B!B�������U�\�K�BQ\�\\���J��I\�?H\�%AR��<�O\�;\�W\�\�\�;�<���\���\0d��2�wL\�U	�����\�\'�U\�\�c�\�z[Y��]����۽�����T���\r��x��/=(zú\�}it��q>\�\�K\�/\��RT���%K)I$�r2���{34\�T��=��\�:~N�\�+ �c�eU\�1Ɠ�$v;$l\�!��T#,�A[Iu�6\�\�!�`%%;+�9#�\�\�j}\�~j�-4\�\�z�\�O�켁�	o\�e�\�jD� \�u�\�L$�^u<\�ȥK\���\�Э�:���[<�\�x\�5��쬩����~�i�\\:X:N�뒏m�%T���g�e\�-EEg9$�w$׍k\�\�V��\�\�6Z\�%��9w��(���M�dg9�T��/%<ſa<�w�9Ǥ`j�4wR�R\�jT>��\�wO����j�\�_T\��5D}��V>�?5GCL��p����[B�`Z�v��-\�\�ӘKL�\�U��Q\�rI�0w@\�z\�gm@[\����}v\�\���\�@;�0�\����\�J�Nz\�!#\�\0pFً\� )2���\�U\�+n�A�r1�PFN~Pҙ�\�\���g#\�&\��\�Y	�� F �h%W�\">p��m��6X\�\�z�p\�J�;B\\�s�u`\�$P�\�\�0�d\�*J	\�?L�$X�F\�\'ra\�H\�\��5.psӼ.\�\0\�\'󈆤fZVr	���래�\�b��Z�q�� Ӂ��3��\�\�:�gn\�$\�\�\�^�\�:m.\�N\�&z}y)w���� zn}#�u?L�\�\�Xl�Fՙ��gYԩ�\�k6Qd1T�}\�\ZveD\�HKM�\�\0\�>	\�Af\0\�ge�zwS���)}j\�\�ԊE��\�T\�4\�d\�\�\�[��u�0TR���)č�\�#;G3T)\�U�T\�\�\�\�F\�:���\�>\Z�-�e\�\�gf)i]�\��\�ܻ���@	�JK�!>@\���\�\r��\�7|�2崙l���6�\�IP)#�9>>\�-1�\�\�|-\�m�\�NC��\���\Z�å5\�i\�1O[��	Sd�\0�|�\0�t\�_(��!/M�@q�6)>�����rܠ��H\�ꎕ[7(K��\Z}*<�4JT�\�GH\�ۭ�\�\�h���A\�\Z\�\�ja7<��\0\����\��E�i���6�\�\�\�#��\�\�C�i:�?,\�;6��\�\�`\��t\�3��\�k\�F~2yΈ!c��C�\�\�V�OW&�\�m�\��\�\�On��\�ʝ;+�V�ښT\�\�k->\�B�Pl�<�\�jh�FeS2�%)d�u���=;z�}\�ߏ\�(Kѥ\�l��F9A�K|\��s�\�2,):�\�\0\�?L�.%]��{��]I�Z��:�Cz��W\nfU*��\"\�y�w%%$�!IP\�\�\�N�D�i�\��\�˶�_\�\���\��+#8\�\�f\'� ��9R\�S�#���Js�\�Z\��zQ���\�S�\�I��{�$���\��\�wd/.u\'��Դ��\�\���`w����zqy1M�\�\�\��\�Ԭ�!Ͳ�DđI\�9Ϯ|\�FR�ܤ㯤c��?UI;\�\���d�J$\�\�nN�\�m����\0\�c`�\�8�8Ym�su� `�@���!\'=�����\"�\0�x~��2\�ӉTL\\�	Ng��m<\�9�!\�z��\���m��\�Ɔ�\�m>�\�R�k�Y���d+�\��Brb�\�>(.\�\�)��\�R�N\�P��t2\�\��\'�\�i�}S)Ek9Z�IR��&�%6�𯻳�yF]2\�U�\\\0a357�A�\�F�\0�W\�:�x��9��e%\�pX��\�zd��1f��}\�r0aCD��S�2��M@5�7�Q7V�TZe.*Q\�\�e���h���g٥\�<%\�\�K#m��\� 6\�9��f�!��\r�=���\�\��\��2A�}\�GO���\�CaX]\�]+O�\�JT\�9I\���8�\�\�\�~\��\�k�UM�9\�]�\�S���\�:�>\���\0\�������T\�=���p�.\�lai\Z�C�m\�\�N\�ZT2��\�A�#��}\�;\�%��\�e\�_ְ�*3=\�p�\Z�$&���Z@\�\�_\�4��U;5��ls�\'�<)\�S}��њzߑW3�\��{�*z�K����>�푰\�)j�ru#2\�H!d˂\�Gb#����k[MA��^�iB���F#Э�r�\��t�v\�sa���C\r6I\�OhYw���90I\��P��3\\��I[7N�*��O/���\�@���\�=���[��%d9\�\�\���\�j\�\�t\�\�6\\�f\�J9�\�ʴ1\���\�\�\�N71\�6�д\�Г�\�\�ʙ�I.��\�\�<�\�u^�V�����\0�?Qt&\�u�4��\�RJU[��.�i�\�i\'�\�\�\�\�\��%�[Ξ�\��\�p\�iOS�\�����>\�\\W۪\�\��\��\\�\�\�M\�U\�\�6O+\�ѕʱ\�\�+\0��\�b?M��/A�J#�\�3\�1��\�F\�_\�*�ܩ�.eUZ�RL|\�[ӓʜ�\\�C)ٽ�3\�\�6�\�\0(MY���K\�+\����t\�I�\�_�\�e�M���O�\'>J�G����\�zB3��\n�2Ӓ\�(l�A\�G�\�5j�&[��U�q\� ieVt�\�^��\�m�1^����F	y>#Y�\0y;����Y�\�eS=F��6ʺ;.\�R(\�e�J�\�gl\��1��n[�ӟ�\�nU�t\0HF\�~�OE�!d%\��+�\�z��M}3��\\X|HZ�y$J\�.	\�%ņʚp��2S\�H�iuj]~�\�b�PfnRe<��2\��\���\r��H#t�J�$@��>\��P�=R\�)j�\"[Mk\�2D\�M=p�\\�\�\�!��S�Fyʉ\�\09Ʃ7Y�ԓS�\�f&�Nq��,v\'�u**/]�y���>��\�\���8�\�j2��2,����\��\�b�@(�&#*-+\"�aKN6\�L:T�*yP�\�\�!\�dT�\�>b�h�\�$���F@I\Zo�\�x\�n�:M\���:rPv���_\�\�	�0\�L�](��\��D00�Ki����KNJ�XR\�a\�j�\�YIn���O�\�3�ITm\��r$$D�{w\�!t\�Z\�s)F�\�m^�>�\"��ʒI]���g�\�a􀙖C�\�#xw?OJ^.�w+�!��NƑ�e�&)\�,�9��G\�DOD�f�f\ZW2\\@�\0h�\�\n�Di\r�mjJ\�v \�}��,\��ȵ\�\�(��\�\����\�<\�\��{\��c\�\�(�jf�\�\�7K�\�8*�\"&�Z {�)$bV�\�G�9��b�\�)ܳCą}���)?\�\�\�\�6�\��q\Z1B�\Z�\�&\\D\�\�sm�.\�H -\�)*\�JFv\nHQ;�\�\�8q��{��2��k�̤~��<\��=yG^D\�#\�rb��ZW�y\�ܢa\�6\�uLө\�K���E�g$�$�j*W6�\"\�u��^����-b�#t�]O�H\\�a��R2�[k<\���\�\�ۦ5md\�Q�\'��}����)T 7�\��Jr߻���*�R�6\��2\�Z��I��>GH\�!ڭ8$\�9�\n�F�(g�B�9��cu@եMJ\�I�%��f\�O�SD\'����L2\n1��\�\�bz���R�\'Ki��\�qթG�[O\�gZ	R�;\�Uq9Z	\�T\�׆yVr�{F�\�}T9tϔ��\�+\�bk\�\�e�\�9�yDCV咻q\�6=\�`��\��S�j\�u)�\n8#l\�i\�n8\�ˡ8	�I�B����#/$�\�񳒖\r\�:�:\�\" �m\n����S>�O\�%I\�A �bc���ٵ��Ҧ\�U�M4�D�e\�2�\"�\�\�\�Y*\'s�91HY\��?p\�Є\�\�8�\�&yJ�\"��B�N���˰\�5���TI\��RN>\�\�`F:\\���Nˬ�H?�V��5-]U�\�\�\�E�Al�5.1\�@�Z�!��\�Y���x��#&���2\�nY*�t�T\�:� c���l�\�`7������\��Ų��%u�Ӗ��m\�4�\�\��-�MtI�\�-i\�H�ڲ�T\�/&ra�K����\�x/�\0h_�\�&Yļ\0\�p�\�*����e����\�dY�R�����!c\�$`�Q^�2�Q��eѫu:CS�\�H\�\�7�3��4\\a\�z�T�7\��\0?\�([tMS=������\�\�ܔ+��^�vW.\�Sͬ\�bHi\'��ʬ��\\��\�/\�3\�^�ekJz��H�\'>e�\�\�\'�	�7�\�\�\rd�-��Z�3$�;~�1+-%(�\0\�2\�B��^ZP=W��I��+\�Bb\�i\�j�)�)!)=I?x�\0a�q\�G\�!p�Ɯ\�}�\�սN(f\�]\�R���HS>�`�?�u�kj�\�\�\�2\0Tx�\�\�\�ӳu}t�\�|��\�Sj+\�L\�\���~\�We��\�|zjL\�M�F[�\�&rnmkq��J&&9�IR�\�$�T\��ǜ�<h�g�=j��Bޙn^r\�%)l;yPǌ\�P\\$�HQ>��}O\�/��]A\�0��#D�)mIHˡ8\��9\�\��G��Leݖ�\0\�(Ӧ܀\�S5\�̭!/#ݘm=�ǡ\�\"�׊���\�-\�Cr\�2�Gu�\�G\�9\�\�D�\�nu��\�\�ʴvX�1^j�z^v\�U%\�T̜�\"�~�	P�t��\Z\� �\�J\�i좝��Vy0&\�NuCA-��R�\�7��!EI>���Jr�d\�\�A�\"\�z�\�W�(\��ʃd�o�yD��k���~��J��\�Cum\�ۢ�\����G�Nf�t��;��\�!rP���v%\�ݖΠF\�\�1\�Ot\�ސz�o2��2h\�S�ô��RHRO\�\�̮Q�%\��y���m$�,R\���IN�\�L9zR�	\�6�<�\�����%\��nNb�Ҋz�{\�(#fZ\�\�Ow\�-�P[��dl#�P9j��l,��p`C��O�l�\'b\�*��\n?a�u���\\v\�kōT�N>��$d�m��uG	J�$�\�e\�4�«̙���&���Z\�9ǖ\�˦u��t��\�э\'.�Ŕ\���,��JiV�;\�\�P�\\ ��6�zvT\�D��\�cC4�zX�\�=�$�>\�\����?�M�wŖ�\�W\�&\��\0�\"D�\�ӷ�KLT0-\�\��\0\�oE�\�X�����\0\�X\"�6P9\�\�%�٦O\�9Ԫa��@�8\�\0�G�H%�\�۔�C\r�`%����1$K�\��_ۧ%)���G�G<q\��Rh\�C�\��`�n\�D��>�\�V\�ܻaלl6T\�\��ʐBq���簁4\0Akwu\�g\��pc�\�u.����\0T�jy\�$^���KAȖ�c\�\'l\�)���a\�\�(��\��\�Ք���ݝ9��*�f*/�+>�	\�\�ʧ�\�J�\�-˦q	y$8�.�NNU߾�\0��Z�1\�\�?�t�P\�u���r\0�Nߜ$����\�\��\�?\�R֢�wH/@\�1������(E;SÅ\�r)*?h� \���@�\�\�9�\�W8W��>\���\�o�2 \��\�Ҹkk\��\0��G.�_\�!ka\':�u��4Z^ҩ=Q5�0�[ٹyFs�F$i�e\�l��Ԭ��\�TZ%c�����f\�*a�q��:\Z��S��\�','Derek','Limbo',19,NULL,'09463276543','Cuenca',NULL),('U0003',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0			\n\n\n\n\n\n	\n\n\n�\�\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n��\0\0\�\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0S\0\r\n\0\0\0!1AQ	\"2aq���\�\n#B��$%3RSbt���\�\�CTUr����\�&4Fs�\��\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\04\0	\0\0\0\0\0\0!AQ1q�\"a�����#R2Bb\�\��\�\0\0\0?\0\�\�&Q�Ż�`��W�X%\�G�I\���\�q?\�\�\�\�v���\�v��H\0�J	wF��VӒ\�GHይ\��)���\�\Z\�\�v\�$�/�}\Z�\Z�o#e[����\��\0և\�=`�\'%��\0GA\�\r?�Uiɟ�3�!\�0\�\�p�Ū\�8\�Ro�x!�^�\r��\�h\��\0[4?K� /G���FK9�\0GJ�O\�3hH���0�@6]�~\�ѐp�v�\��p\���f����6\�o\n\�W\�\�_O���\�-?:D��\�w���\�ͣ#�X}\�`��\'q�\�\�vܫhi�v��0�k\��\�\�*\�{x\�׭,י\��\0�\�\�-����\�0W\�Gb��%��0����Rdy7)�\�ۋq.�Ӭ�J?�;m��<b\�PH˖�d��u����:OdfӒ����$\�5�N?d��\0��\��Rq6Q\�\�n:���b�z~\�4\��N�Z��\�8޾\�\�\��\01\�Oc�`\�R\�S�G�\�K$`�ғ\��T�\�\�wz`5��\��ط+|��5Ə\�~�\�\�#L���\�a#\Z\�J�/\�\��)��0�NLc\�X}\�C\�Ygr\�ڒ�\�\�\�^�`}�Mz�J\')�\�<��2���,\��?3׳全��3�Yi�kJ�w\�\�#\�4�\�@\�R\�m�.>\�n�NC�MY�T��r�U��}���qLi��\�9m�_�\�\�n\��X���#�\�\�0\�\\��i���\�L�\�>�2@\�\�+�Y�`�R\���\�#,F\�6.�\\%�ȃN�#�\�Ҥ\�ս�\�f7B.�+P\�$T1Ӻ�g1��	���S�6~��Q���\�1��	\\�o�d��c\�J�V\�k�l@�Ћ��V��ӕ�k\�m\�T?y�\�o`��)=\�D\�\�s�b�M�N#d+�v�9}Pq\n\�c�x�O\Z�U��7��rϲG\�\�r=PL�\�\�]B{�`@�Z\�)\� %9\�2\'\"]d�<��9NqG�*#�`��\��\�%�&:�\0nL\�\��X�̜o�\�\�S\\-�\�\��\�<\�P\�l���0rx�|�v\�,\�6`�AA�m�6{\�4�1ȞS���\�;\�\�6r�e�\\hm���\�v\�Q\�4|e)D�dT3\��\�\\��\� x\�;\�+W(�:Ǩ9Vôg|���\�.z�1\�Q\�%G�;FAy\�\�!0*vլ��\�\�\�ʐT\�+|�J\�\��w#\�W��`�̒\�$b~l����ch����|Ak�@{�	\�.T읻o\Z3�$�c~���Wz}N\��wj�\0�\'\������K\�=S*\�p\n���W�(g.:�$\�\�\n�~g\�\�%���^\��\0��톞�ju����\��~\��\�T�~$\�\�\�𔁜$�Q8#$���>zF}7:���\�\�2\�rbܠ����[\�\�\�\�\�!�GD�\�\�\�<q��($��\�u��\�N\���\�3̻\�iV؜m��}\�\�\�=�NѥM\�\�\�j�,\�^jY̸K�+J�	8\n\�\�2z��\�\�\��CNQ�\�Rn��\�\�(�z��Q\' ���\�\�a��Z\��\�ͦ�Z\�d)�Rߜ0���@\�#�V\�^�q\�\\�`�k꾳�)�\�}#\�8�\�\�\�~�{5֝O\��G��\�^Z۔Ջ5-O�f]��i�i�[i)YC��\\�D	\'�x\�&�kޛk��)}\�\��2s\�je��\�:�\�Q*B�\��\�54�,�c��\ndMD=bǬnK\��u�CJZq\�\��ʶ=	=!jJeI\�¾0�Q-��bv\�d�\�H\�B�C\�f��=�\"0\�7V\rQ\�s�%��<�k6�˜��{\��S�\�Su+�^q% f�W �\��p!ɺ}W�:\�;F�Fei��4��6q*	\�;��\Z�\�$�nϝ�� ��\�&H\�!6bp��\�1�2�9p3�\�s\�x��a\�\r׊�Y\�N�\�V�Z��I�?Q�C,�Ҝy՜ ���\�K�\�VOHgr�kf�\nBd%\�uM\�T�Ytn�\��Z�ϸ{\�&!Z\�\n7L\��N�h��}mSbn��\�r�W��\�\�f���i3)�b����p�6��0�O.TG�*Ug��\�\���\��� ^�W&\�\nY���8\�\��uZ�\�`P�ʉ�So7\�S7sՁp\�f���I[\0���(G�8O�I\�6p�\�m��N��K�	��R�\�\�c$% �\�%_O�\0�\0S���!��\��\nL!���?<\�O\�G%Z���t\�\��\���\�g>B,�����nP�/7@G3r��e\0`��|����bRi���B@N����W�IJR�%\n\�\�PA\�+dvbt]с\�Fܡ��Sk��\�\�s7V�V\�\Z*)��\�\�\'8\�=��x�=��;߃_��ߜ��ط!Cw5\�M����}����?���IzW+u\�f^2i*�BJs������L[�N��<��x\�S�mx���\�{\�a���f�V�~-��\��%}Mi�\�@\�KB�{ڕvjʤ�Sr�\�\�na��|�#\�:i\�R}\�\�g\���5?t\�=c�;��]��\njV��9����\�m\��c�c�Զ	H\��hfeDA\�\�\����았ʚ��lA\�N\� 3.�6�7\�x=�rT.�♁:&�%!\0u�\��g�FA�o��f\Z$d�J��-\�yA\��@��\�)\0��,w	\�H�ܯ�\�\��L�����\�Q\�\�\��3T��U�\��f\\8\�\���U\�Dr�\�m	@\�!\�|Nh\�\�K*��VaC5�y\�\�j?;,�\�\r�Oz�q�0;�\�}�� �\�V�AR����(\�\�\�\�r띚�h6\�\n\�&�\�\�$\��#�\�9�7�Q��5��a 9\�K ����l_.)5E�W�_(\�Y�S-o�:��?����V.\�Pzz�4�58\�9\��\�\�\���T\�#���\�\"G�kZ�N���\�5�\Z�o\�\�=��$R*u@�\�B+\r�yVN<���b\�j����e��	la��-�\�_Ӵr~�~\�p\�p\�o\�\�\�\�T\�AC-�=V[lr�@@�\�%G&:�\�h�Zq�\rä�=\nl\�\�\�\�$K \�~\�8.\�+dhpn�\��H֓\�\�ha}�������6HR>�l�\Z�j���[�R��S��\�3��:\�y\�\�\�ɟo\�	q<�����U\�\�)s6���si��QN=�\�\0I@u�\�E4�\�\�\�[O38見\�\�|ȼ\�̘ $�\�9\�ǭ���\�\�\�N��[m�\�]p\'�\�݃��\�G�7T�vU��\Zd�T0�`�%Y?oxC\��[�Yt��gjE��U]�5:\�\�IT��\�l��=�ce-,�\�p-\�\�\�[S!LXk�\��Sq#�\Z�e\�2u�ʱVnB��8BO����DvmJJ�\0��\�k\Z�e�nb�\�	3Nǔ|�p!��\�y�Rjea\�V����{*NT�ۥL}�թ\�j��\�w���\�T҇�\�O�\��Ш-��Zc\�j>?�\0b-k\�`5\�~\�uj?fI\�p��\0g��\��Pp\�\n�ܵz!ϒ]��\�c|�\�\�ܼ�I¶�GmrT\�5��\�u�8\��.�}�j5jyIڷK\'�2\�\��DD����ǘ\�mJ�\��۴F�L\0�uj��\0(P�\�\�{	g\���u-\�\���\"n���\'Y/gPu	\��\'��T֨j���^��A�~\�\�:%�˜�\�;�K{�=������\0S]�Mꤏ!(\��\0��\�羽?�\�\�7�F�(\����p�ř�T-\�\�\�R\�e)D�\�O\�	\���4�\0\�A۴s��[�cN\�S2��ZT\��	ʏ3�\�p\�{�\�zD�U\�W(v�.\�2�q\�\�~�W�Q/���C��bFHξ���V���R�#\��Y�\�A\�;[\��\0Q\�LM,l\�\�t\�\�~+\�2�M�BӉ�UO��\�pjT�\�φ��\�䁀IQ\�!\����\\�/Uҷd[ja���S��d�@Kcd\�\�8\�:ѩ�.JU�\�>�E�\��\n\���\��*�Y�d�*nΔ�,\�l����~\"bt��!\��\\ܮ��i�8I\�qa�L]\�\�湥\�5)0\�\����\�ø�\��/^�MqS2��ߘ��R$\�XZ�a�\�\�\�*s�3\��t\�L\�\Z<��Q���Im\�elF�OV.��\�$\�K0�Z}�aI\�\�0\�V\�k�\\.�FL9Xly\\\�\�~/x׽*\�Ҩ�\rT\\��g	m�PW//:\�\�\�N\�b\�\�7S56\�3z��\�\�y���LΡ\�pF	\�O�{�\�E�7wM\�K�YKjP�\08�k�A%C�C�\�I\�J�\�4U\�G>�\�\�u��\n���\�!w�e»N\�^�zA/}>�G+(���S�a.\0�С�GS}Z�\\�h\Zh\�\�\r\nEZb]�>\��(��u*9ۭԤ\�zXu|�nMRh\�9��*�qs�\Z��5J�\�d\�\"}��\�\�I�=Q\�\�\�\'v6�\0����-�=\�[+y�\�p��.j�\�I\���\�W\�%D�\�\�}�����7\�A��\��(%7C)`\�w\�\\\���|x��\�F�g���:1\�T~��\�6�0ڤ�v\�\�NrO�\�3J�\�BB�\�GH\'\�?\�	ʈF+}$\���B��9\��\\ \�d\�\�2�r�\�aS 3��О�\r�K\�\�#0��mB��\�5\�s�L�L\�8\�9Z0�.F����@Ѻ�<d]�U�zae�Z��x���A\�\�\"z</�G��I\ZÉ圵\�l)G�ʃ���O\�z�4�\�z՟p�<�\�\�(�,��?TCT\�U�iO���\08���b啖�^p�}�YR��Iy9�G�\�Mdοsr�F\0\�8\�w�\�\rsQ�ʗ\r�r\�;\�&�\�܍\�u1N���\�\ZY�*�\�\n���\�#�\�>���j�\�V\�\�\�\�M�RЄ�\�H\�Ю\"�z�/1o\�YTj\�\�K\��م�L�8�\0R�� r;���_V���<��y�\�X�\\\�CtI\�KZe�&����\n)\�6$\�+��Ʒ��oy��\�&�U1\\����T�|4�\�$��r�\�t�0Ư�E�\�\�\�\�/�G\�\�\�s\�9lO\�>��]�|\�+|��`)c\�\�I?C��_e��D�J\�\�}�yV\�J��Br�ӓ�\�\�\�\r�xڽ5\ZQ\�3�/T�E*�(�VF�\�7\��\�Ƙ[�\�\�s�G�ʹ.f[\�\�4ڰ�����w��R�B��zeT\�\�K��\�4\ns�s%k�W\"s\�u)XH\�46\�d��(?�:Zۮy\�uk��\�S����+l�j\�wC,�P������\\�\�\����\0{��\�\r\�\��\�\�sjmprN\�5E\�f����[��G0K\�\�<ܴ\�a\�l�n\�Ԏug\�?dv��q��\�a�^{ZD�s�?��\�n��s�\'\�V7�ca�\�tBS��\����&�\0>�0 ��f��NcΒG)\�{�N3\0y��h�M��m\�v�\�$�\�\�:(@��&�H \�+����HO��ۯH)\�\�s>b\"�.��\�:��\0�j\'!߯\�1e�V)뛜9\�Ϥ25��-Z\�ɇIS��\�F>�Kz\�)N���#\�k��ŵ2�\0�TJKm�\�\�\�g\�P:\�Ξk��\��\� Ѱ\�Bw%u2򕋙*�amK��(9V}\�1V8�K\"Ũ�\�0�):�N�!Z���R\�)tY+m`�\�G<�p\�<\�+���+/ԞKIT�&䄤\�\��Կ�p8ɪa\��\�#La�h\�=\�\��48ߗ\�\����(L�%Sni[̲0�\��0\'�@���\Z����ج�\�r3\�Ȍ\�F�\�27G@B�C2\�Z\�\�W*o�J�\�\�eHu>ʓ�\�\�\�E$\�p���z=� V^�Q孝C\r\�\�o�\�^\�c(Q��cv1@�J��9�o\�\��O\��,f��O�C��\07M\�\�\'\�knE���\\t\�%\�(\�;����XZ��r�d��6�\�%�{\�EN���K\�vbz���\�P\0e���\��\�1�\"\�NZ�	sL��e\Z[\����8�n<\�w� ��Q��K�\�\�*�iP\�	YB�\�\�=c#�\n�2\��EMLљ�1��\��	���Oa\�e\�i2�$\�r�o����\�P\�:\�g@�¢�\�*d�\0\�\�+�js(=�\�\�g��\�&~9���5�Q�ZS/JSJ\�ze*)S�\�\�I\�sߠ\�(%�CS\�:��3\���ޯ0\�V#��Ѳ;\�˩�y@�\�|�Oc\����ᶔ�Un���\'\�\�տ\�G\���{��eyT�U�L�9>\�\�\�\�\�W\r5�4{e�\\�\�(gɶ�\�a���\\ţ[�\�\�P����\n�#\�\�\�=|��_zRA���8]��-m\�Ngf���y��$\�ǹ�\�t�\'�\�C��T��\�\�ѼH�\�{ǖ��򂤃��\0\�)�����6@\�`\�3\�\�\�P[O<@�x�13�23\�\�mRP\���$%g\� \�VT�\�v�̌ï-,���\\�BS��N\0���\���X5V�+y\�\���!2ڣ�OƩ-�Ң/�\�+�C�GH����T��p�-���s\r���3X�������\�Twf;S\��\�mZy�4�J�Xq�O��_\�\�l*\�s�I>\\�\0E��ڒV�\��\�D�>�IihĢZAw\nI	H\0U!=;�ϥLsi�m��H�\�X��.v\�O5ϫ\�Q5k�` �6���B׿�A�& �l��օni*)yAiQ��@�\"ųK\nS\�x\�΋Is\�[t�WŲ���\���\\\�B\�\�\�\\8\�\���� r�~�[x\"z�:̷\�BZ{�2\�\r\"�G�HC\�\�\r-h\�7ly�>9\�\nZ=n\�ٗ+֭Y*J�P2\�t<�A\�PX1\'YT\�y\n\�e$!��K��j�\�q�\0kT�\�S�U�J\�bw�\�ad>\�@ϲ�I\�L���\�\�e\�\�jȮ;i\�	k�u,ZW��\�0ܼ�\�8Y�\��V@��\�;\��](�V��\'~W\��\�5-9�D�L�ʚW(\nJ�~�]���m\�ʁO^�39\�\�kK���\�EIK�J�\�))R��\��\�!\�{5M�\'S��?$bx\�6q�J[;�\����\�PN\\2%\���\�v\�lo�\�`}6����\�D��S�\�d\�a\��\�Y�g8=\�\�O\�#�LǶ��!��Ve)\"� �]bU\�\�\�\�-\r��˘F~�6�4�E�+:��%�(��yJ�\�\"��4\�kiG\�t\�[[\�\'\�C\�x*>�ҟ�+�\�1oO\�ΐ\�fid�Kessc�\�Y8��\�\�o!V��y�\��\��@(�\�\��\0y\�-2m��\���\�\�\���[�\�m�T�\�[��Eڋ�N\�\���;y\�H4KѝĔ��J^6�V�^�S\�4�5��˩\�8B�\�T�7\�AOnaЏ��7�KInǄ3�S����l\�\�?�F~ \�m�cԼyH\�8u3G�KF癦ju�P��2e�X\�\�x\'�\"\�JU��\'�4��\�\'Gk9dt\�\�\n{��ɺ�F`CIJ�X��\r�\�\�\�3U8��N[i}2vĘ	�:B�^Yȗ�\�W���:k;4��\��0\�\'O�}�|	�O\�F\�x�%Ĕ) �\�Z\�\�e\�\�+c�N�,��\"{c�I���zy�΍I\�\�\�f[H�\�W�\�1\�\�\0-��{���	�˶\�pB¾�\0\\ss��58}\�wR\�\�	�\�\�D\�SO�~\rXM��U�\�&�q2%\�!���н�\�\�\�Ѳ���eӠ��Y�\�\�\\��4\�\�vaɄ���\�-\�({�Ă|\�\��D6\�lOV�v\\��m�����R\��\�\��\��\���� \�\�]Ъ\�\�\�5�5Kb�Ji��\Z�d�ڕ�HR��0|�#�K�_�na֟9J�q�\�P\�\�Q\�U8=l\�\�\�b�a\�)\'�9\�\�T]U�\�v�\�o3,\�\\*L�L�@!K��\�W@�7\�\\��E~\����-]�T�3<��7+2�n��HO7^\��秫+��v�8��k\�杔h�Oʸ�e�c(\�f+���\Z�%��f�\�\�z�5L�W<�2�8X��\�蔻\�R\�F\�\'�@c9\�`\�\�\�HD\�k\0v�\0��L^yT$�:2�\�5\�f�\�ez]\�\'d\�,MJ\� �l��ʤ��yX\ZQ�+\�v�K\�3�\�2̞�J�\�{$�{\0L\\\'4���\Zl땽Pnb\�\��\�MN�m%.�\�.\�NN`�\�\0盛A\nI\'hup�\�\�\�\�\�f��m�\�\�*�PJX�H˯A�����\�4\r��T�S՜t\��\�\�\�-N0\�X^\��\0.>�\�\���[��k��Ɲ���r]�\���:\�B�\���\����c�z�\�\�V�N\�\�\�^�ܕJ��}\nh\�J:YlW\�\�^[VPV\�cG��kի�ۛU\�ڷ(\�yn\�ɰ�1;0��yG\'�\�;bI�c��裳l�\�Y��\�������bdM\�r�\�z+\�\�~�NLTSRE	������i\�7U㟚\�|����4\�WVm9,�%%7�\�\�`~�\�m�q\\�������\�^4�V\�2S\�<��FA�1a���t>\�\�y�\"�_��U%gNɻ&�\�6\�\0/��+	\�%@�FA��m]\r��N�a\�|K[��*/�\�Q�fC�N��\�Kiu	Q%)\n����=��?MtuE��)=\��E\��}8qp\�6]=\�;ѵd鞌[\�{R\�e2��yi���D�����\�s�=\"\�\�u��4�D�\�T7�������;���<�\�T�j��>�f$��Nc�\�\�\�-\��\0�\�y֖�\�\�YR}\�g탺JH\�k\\\�UUT��\�r�\�u\���\�n�OX�Ժ%\�I��N#\nU:d\ZP#\�\0z�\n�q�\�{f\�\�[ꩧW�1RUZL\�bm�g���rRUЅ��i\�\�_�Eҁ\�E�L\n�\�\�\�P\�=i\�fr�q\�L�\�?�\\��F\\]bse�\�\�K�����\�k��ϘGe5�A\0FA��71ꖨOZ�ߟe\'T\�256�\���\��\�>\�&/�A\0\���\�.\�u�k��\�\ZΦ\"۩\�S�u\�j,�<㫕.(\�\�u80�r�����	�n�\�WF�X\�:��\\\'\���J����^�v�N�77\�3]��nY/7$\'�|�\�3�8�\� �Y\�_H\�\�\�R�U�\�\�nz\�\�+iԷT�\�CM�8Ҕ[j\�B\�W��;\��\0:q�\�T�\Z\�\��cp���\\\�m\�b����m(�y�e)��.���\�a��\��\�R�\�\�s���\�\�\�}�u?H\�t����2��\�l�W�S\�<��s�\�5d��d\�˩������\�%V\�\0\�\\�!�J\����\�\Z2��or\0\�\���\�\�7��\�\'\r>�k\�Z���r�U\��>��䕟kS\��\'>[P	\�y����)_!eIL�x�\�\��\�+ұ��Y!u\�fa�%-�,\�s�m$J6g[��\�\r-n�ie�ԗ\n��\�F	hq���\�V\�85?�	9e5=Ke�\rFS�N�\�8\��?D>�o��*�\�D��\�\�IlL�\�IB�����c\�*\�_\�ؕ��(��m:V�W��}�٧IN�D�\�)(q\�,��EH�\�R�~ѥ3Ff~ј*Dêa\'�\�6\�\\P\�\\\�\0r�\�����1\�-�o>*��EN��\Z����ni�����6 ��A؃\�{����\�Ji㫥X�5��]&Q\��\0)uӎ��)\�9I\�s��7\'�\"Ԙ�M�\�!yg\�qg\�v�\�\��ַ[,�N�]��z\�\�\�L\�kzJĳ-�%\�+J\�_	\�u���YGs���Zk/%pT\�N���j]��\�\�G�s��\�mɶVm$6���\�r \�3�!�T�A�ݝ\�O�2E�\�uq$3U\�o\�	\�ڍ�ĥj\�+�R^=A\�;�I��O-	\�G�GO�\��mzA\�tmf�\�<9ʂ\�蟌(R�6jUYT�\\��\�����\�\�\�\��\��\�\'��y�St�ا\�\�K\�N\�2��VQmɻIzEn��Ғ�y�:9HO]\�A\��9\�m5\�ѹu_[\�\�\'(Z�+1Q�\�\�SU\'���J�e-�ǂӊu\n*\��*;\'�ҁq|�\�\Z����h\�\�ZS\�h�;u����\�Wlt�җ�i\�ZM$2\�Q\�\�p~�a\�H\�z�6\�\\S�@\n_�Gx@vn~��\�\�J�*D�rq`�o������\�|\�Qe\�D\�q%8 ��:F�N��\�\�P��\�fa�R\�jIJ�G��::�\��\'ܜ\Zk�Ն�]~�P\n��jk�L�W\�j?\�4O\"��*\�/�\�GM\�\�\�˜��U\�B�r\� 8YT�\�\�?�̖3\�\�9�\�\�]\nf�Y\�z��iJ\�(�i\�#�yA%Dd����B�\�\�m!�ӛ�}F\�fe2�uC.�\\����\0\�Iq�\\\�9��p��\�G��>�TX�!@�*���B�Rn\�L>�2�@!.4�|��)\�}�\�\Zv\�\�dj�r�\�ğ�-\�F�O�;\'K��.��\�)��L�c\�v�i���73W6w;�TӢ��\�vʪim\��\�ͦ\�Z�����jߐrM\�IB\�̚\�st�C�#�gl�\ZG\�w���6\�\�]\�vأ���vِv�\��I�\��T\�me\�s,,��\�:����\"Fzrf\nqH\�\�+G�ZU`X�I\�Zo	���4\�\�z\�}\�ޝ�<[K� ���	\0�		H\0b�\Z����G%\�ŘiyQ\�\n�\�p\�+CI\0� ̦`��k\�\n\'�\��\"!\����4\��E\�\�Ƥ�m\�k�J��LȾ�nM)�Pe���\�y�	\�\�@�#`�\�u��+�	��\\yp���*VO�i>\�O>yJ6�\�s6\�ZNB\�֏K��7�#4\��\0\���\�&�)�\��̫\n\'� \�	\�\�\"\�\��\�2�\�]���C\�}�]\�\�\\����U&W�Z�^�(\�3(-�bfeJJ<<�lN\�&7W\�bZ�Ș\�\�Ge2U֐S/9[�[C�I#8L���6��\�\�\�6��\�7\�\�]1n_¶\�\�\�2�uÖ�H�A�\�Tg\��\�aG�1ׯF�jo<ٚ˭\�P^���nv��\�U�_qj-�\�J\nY�I\�}\�����(h��2\\\�J�\�@�T�\�_\�%кkNS��U\�\�\�i\�)Ii\�-�<�T��\�!�ܯ�\�','Trisha','Gunio',23,NULL,'09466485696','Pulo, Lipa',NULL),('U0004',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0			\n\n\n\n\n\n	\n\n\n�\�\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n��\0\0q\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0K\0\n	\0\0\0\0!1AQa\"2q�	#R�Bb�$35rt����%468v\�7CSs�\�\����\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\02\0\0\0\0\0\0\0!1\"2AQ�aq3���RB�\��\�\0\0\0?\0��α��zߋ�vbj5ۆ��Ɠ\"\�JG����8HPmjHRBy疉\�P�m[��\�\�n\�˨K\�K�Є:@ 9\�<�\�\�\�2�\�>����ժK�]=\����8eA`\�+H#�C�\�\����\��\�\�\�&\�c�ʳlU�wp:\�HS3T0\�\�\'�G��i�f���UR8M�\��\�߫~��-c1o>�	�*3EiV=z\�tɃ9S\�\"9QFJ�\�?�\��w\�g\�Rf�@���NNSF�XK\�ag \'��\�4\�ƏrDbJ�1\�Q\�\�R� \��Ә\�;	��+~�Z�V[�\�\�A,�)e��\'�%tϧ]x̠Ѭ�m)�\�R��7\�nԒz�I@�1NA-:\�\0|%Y\ZҸ�3��u\�u6[\����r9\�\�t�)0v@\�ܮ]N�s�q�)\� �|��QG�\�.8ߺZQˉo��sѯ�V\�c��O6\�J�	���ϐ�\�\����	NӬi\�R�\r��\�\�rY�Ǒ\�g4\�\�J�B��Ӫ��&BPl�@ d~\��ԍ�L�ъ\�J�\�Z>�\���X\�z{U�0N�$-���\�B�\�/x-#\�>#��;��\�KcK]�׷U=\�e%!\�$\���<(��M!v\�)JE\�Y�H�\n\"ZmԤ\�JGx�\�\�\�:0�U*�&2\�s�d#�\'\Z�17��\0�\��C�\�\�Zp��\�����߭�\���]�p%5�}\�v[B.�t��B�Gpn�y[̽Z�󋒜>�=\�\�D\��\0��u\�&3t\�/�ixIm\�ġ��\'����o��\�>���R#�@����w�*C�jT\nt���HS*�c#�i#;3�Q�4�����%\�U[O���\�\�\�\�뭚��\�\n�\�}Jо�+\�I��\0�C�;M\�mי7lwi\r!<-�\�z{�I�y�˶[��@Uz�\�u�1E\�$\�u%��\')\�:+�\����^Q�K�}U�N�)H\�XL\�$\"����aR]j�Fuo�L��#�� �-|�sm\�k\�Z;\�j�\�Ju\�i\'\�R0�\�\�\�\�Q��2ْ��JGЁ�\�	\� ,-\�BR��\�!\���#0\�\�RcG\'��<���kC�9�Y�	O� ��RS�����4z�|\�\\��қ\n+a)\�_�4<\�Z�S��Ho�RP�}<IRO�_��kI��p�*iu\�Ku\'�A}d�ƻեh!@�]i\�.+�h�	iT���\��^_MCJf�\�iK��\�J8R\�jJ�5�\�G�\�\�Z.`�\�F�	p(�U�Ч;Q�\�ߑ݀ё\�!$g]y�x\�*�؏r\���i+� )*\�G\��jf�����S�����\\R�\�3���7J�\�P\�[\�A�*��hÀ\�$Ze\�_�@�$\�)sd����\n�x�Y�K\�\�r�tC�\�ԄP�%�<r\�\�O�\Z\�ax\'dm\�\�NѼWk�P+�ZnV�Yy\�\�H\�O�\�\�\�\�-\�͗e\�lI�\�5V\�CT\�j��xq:j7s�r~��/j�\nT�\�j��ۏЅ�^#\� x��\�o�K�͂\�5�\�{\�Q� 0~�B�����an\�� \�dp9\�\�\�4�l�\�ָ��	\��\Z�\0%+���=�/[�U��\��l�o�-\�]��H-��aag\��i\�m.\�Y�\�X�ZL:�t.�\ZS�6|p]YSe_<|��z]e\�d�R(��;*\�%ʃ\�\�r��*���*R\�+�(\�\�\\�\�q\�5+t��u�	t.=1��\�J�\02\�i\�N#\'*�<�/�\noy\�\�uK\'JU�U3ij(�dc|�\���?�\���E{3n��˅\�;\�  \�\�[\n\'�l��xӾ<�5Jrjj�Gu9nDwBұ\�G]qJV\�\�K\�\ZœP�nM\�\�v��	���P�\�[}����\�N���˗N�RDZ���\0\��(-M|8$c�\�]<�\�D5\�?\n#�{\n���\�R8B�vښ�>r��xU\�QXS��e\'�s\�B�/i+m�IW�\�YDP0\nJr䅟��\�\�K\'�J]�\���;\�ɢ܅�z��ԵƔ\�ܼ2Kk>=}\�ϗ��\�޵-��ި0M��\�\�°p���J��\Z�m\�b\�¸-˥.�*�M[k�\�~\��\�#x�I\�UF��m�uN\�\�y�G2O\�N=u;cY\�!����灠\��\�\�iu�Ȏ�����f\�C(�(A�\ZR\Z�\�2⑒���nZ�\�h9�\�\'(��� �r�֤kfteq!�s\�M�mԥ��q��gJ�jw\r\�M�M�a\�!.0(FN}5	*\���~�o\�ۇ\�9S\\����\����j&�h\�삞\�M#\���\��%HK9\�F�)4\�\�njO\�6ִi�|�J��\�\ZA���g\�`�\�\�\�ۆW\�I\�\�Pu���)JQZd+\�v\�:6��\�����$��:\�J�\�%*��\�M�D�£\���8iVEr�@��Tb0B�Ko2@��O�:����)PSG \�*I���:0;=\�Z���u��\��L�9\�\�l~��m>~#\�RPU	8;�ʚC\�\���ܴ{���R��\�X-�K-�\�\�\�FO���j��\�2K��8���xy�\�\�F\�\�*��D�&:���=�y\��\�jm{�ۓLD��G��yx�\�@K���#ŷ\nćtE�2\�%�\�q�?\�/+B��H\�=9\rQ U�S�eT\�u�9�\�\nU\�˞?=H\�\�u]�\�{-�\�\�48��^^gM��.�@�ܹ7:\�G�\�8�C(\�\\\�:g�Ӟ�M��@�@U���\�]J��c�y�\�6\�V�{\�O|��΢�p\�`�uF�\nh�\n�J\�r��8<�<�i�wM�o\�m�Z-Vs(\�Ҥ6x\�F\n�c8\�\�z�ve�§V\�x\�)qe*\�\r9�5\�t\�l�\�%\��\�f�hH�Τ�.\�^[J\�0\�\�u�dݵJt{=\�\�,U�Z\�^،�d��\�h�@8B\�\�\\�~�v^ي�\�.��|��b�\�\n_*A\n���}�i{\�E�x���D�\�_�*�\�\�׉\���}VN�[�\��\r\"���\�\������#T\nP\����אƥ��3�SP*{%cZ\�S\�\'�MB�ÝJV�9}3�}$n�\�>���\�^��R\�\�c飌\Z�ϊ2\�9\�\�\�24c\�=v\��\r7\Z�\Z\�ޭ\�\�;\"� �\�\�\�u���\�q\n�;�\�\�?��N\�}�\�\�m\�\����Tѷ*֫+\�i˚\�l�\'�r[�9\�����q_s�\�V�kr\�y<<\��\�^=8�\�N\�_h~��#�ު\��\�T�Q&I+�ٓX?�&����>\�K\�\�h\�W�G-)�k\"-p�A?\�I���ҷv\�\�j�C\�#t4��O���\��\0�l[뾶��md��-�f��HGg>��cs&v�ٚ\�\�\��\�\�J]n�����\�$��宮vV�P����\�\�h�h\�Y\�pʣՒ���G>,�\��u�\�F\�}��&M��[�\��\'3\�.%1\��1\\\�R�Wo��\�\���&\�F��*\�S\�%⦡�\�pbk�i\�\�\�\�\�\�\�U\�o�.\�o�\�5gW-�s\�\�S\�]i��P!! �\�_���\�D�\�(�\�\�s:G\�ObY����\�>+HUam�\�px���x�\�Q9�\����j-�\��\0�^մ�\�n,q\�\�\�t�\�\�T�ɴm\�\����]EY�ڞ������L�v\�Z��M!i����`s\�\�>\�\�[k#\�\�Tb���ǩ�\�\��\0f\�ƴ�\�.G�xH�\�j\�v|\���\�Lt\\�C]��X\�UFq��$)���?\�A�x0~@�Y\r�-��cR���EF\�1\�j\r\�C�DK\�d��\�[�\�`\'!cY��l�	\�-7\�R���yyj.cN(�<��^��IO1{\�?UX\�\�E\�|o,�6]�KrB�%ͪ��r�J	Ж	\�oQ\�$�.z����\�\\\�\�\�\�\��*Z\�i\�6\�1�JP$�G�ʁ\�\�%\��\�\�7p�\��F�i	Q���\�e?��G>\\���\�\Z2J2��\�!Y+��䰡܏\�:U\�T	�\�\r\�)/)�q]�\�9p�m\���St��Ȫ\�5�\�Ԋ\�6���c\�Nܖdj�Eq6=\�\�\�L\��)�\Z�)bmDd/�#q�(\�U\�x����\�q�\�\�\�\��\�n��v\�\�\n�(`(w�T�_O3�f\�Y\�Uq�\�m䰸u*�l\�\� �\�<��\\\�}usj��jm\r��=\Z�\�S[o�6\�@B9eG���etE�r��j�I���&�\�\�v\�[�|fZXAS�)#�\\���-V\��ݺ�\�\�\�\�5\0)��2\��c\�\�m\�ޗ�4\"�C�����L��\\k\����G\�\�9\�Ҫ��J_\nG0�\�gR�;\�\�]3�{�!�𹞍h�Rh\��\�\�N)�q-8|A\Zа�{��\�k\r�XT�e!Ť�))HH\�@+\�\�Q��a:(1 �[�2\�\�{\�$�\�<1\�k>�,\�\ZEfRR\�<H\� �>\�\n#\r�LY0\�uE!\�`,6�c���F�@�-�\rq|IA<��\�o\�}Q\��iةT�Z}\�:Rүu���s���\�\�6-6�*�N�\�I\�e��_\�ω�:{\�f�\�\\�G�\�!��H\nm3u\�<\�\�R=Nt!\���\'b�g\�.�2f-|/\�a$�L�ĥ���]w�\�J�<�\�\Z&M�CI8�\��:\�\�ݡ�\�G~*��\�8s�Z_�\����\�K�\�\�L�\�o\�\�W�:�d$y\�D�\�C?f\��\�r+q*(� �\�s\r�$uNyƛ=�{D\��{s&�\���\ZI��)C�ƹ|#\0�\�[�ʭ���\�\�\�\���� R�\�\��Ō��@\�|5B�t%�������8\�<��t�~6\�\��7\�_�㤂\�%t����i\�N\��\�9�\��\�{�b7�m\�c��R�\�F�Rf�<=8�ڎ\�O��ݿ�pY7-��zį\�\�î-5X\�u\�B��A\�\�j\�V-]���9�aK�\�d,9\�p�\��ҶF\�\�\�^*�详9e�\"C�+C,=\��ʲ	$c��5}!Cq�\�:�\�\�ÎF~Ǖw�\�z�U\\�=G_ f�X4�N6.a\�v\��\�ܵ\r����SUJ��D�%<Y\rs\')�ε\�.\�]��\�ro�\�jB�\�\�.�$,o\���5�u[V\�*�T\�\��ӎ��\�\�ȳ\�ɍ�ȶa~����\'\�q�4\�T\�Lcs�F\�D��U�K��)CR�B�\�]��ըߴ�O�\�t�d\0}T\�JBG\�\�\�\�c\�C|)\�\'\�B�1T\�\�[\�!Dr�(\��\�4Щ\�\�s\�䴴�$ͫ˚u�\Z�U%�&��\'\�J	�\ZM\�w���0���]FS0�nȭ�dB�mM�8� �s�ѵ�P��(|d�\n�>=Aכ�Ą\�q\�Ĭ�N�lz{0i=\�\�Fs�\�ۇ̚[\�����l��F\�c\'�\�\�W{v��m�\�JlJ\�A\�}\�\���\�z�Չ���=\�\�\"0y\�b���\�{/=q��\�\0-9D\��\�\n��\�<\�\ZUʋba\�ѫ!]jQi\��8?0�+�i�av�\�[ّ*_a۾�ʝB\�5�{eI\�\�·R@�<�5��\�R�\��0��\�.�z��\�81d�\":�O?y\�G\�\�\�yI\Zzc�\�Fi���\�,�`H)ʓ ���\�ą(\r\\tW\"�m��yi��\�`�\�	\0hR\�h\�j\�s��\�\�ܠ����_m7*\�ř\�)�	p�I\��jIW�b�S�ȫ\�\�\n:\�w\�C\\$�2=5X}\�U�=ƴ�(�\��8#��7��\�Z֧+��;\�L\�iJq\��	\�=|I�\�\�S�$<%jn-��,\r܅�p\�p\�x ԏ2p�\rޗ2\�3/��2[\�)<y\��lW*t\�W\\d�ӯ�Ҙ!\�\�I=5\r_�\�\�*�]����H$���բ7i�K��\�k_5f.H1�]BK��*�I�P=59Lދn�\�0ڊ\�\�B[u\�	\�W�:�[�2\�5Z�]�8\�\r�Sl����#ӗ�:%E�I�Q\�\�\0�J���1�tS�V�-%JV��\�e2`\�.�J�Q#�\�\Z\�/\�f��\�}v��)ԺB�Ja���|i$+�+�\�<�u�\�x\�nz#�ߦ\�-�ԩ���*�j���\�fWt��\�8�\�<�1\�@Wf-��2!Y3�\�m|\�\�Jl�70\0�Ɓn-��\\5a\"�q\�dH-�\0$\�\���`���t\�\�\�:�������ee�\�<�U�Z{�\'Դ\�C�N5k�]�\��s\\\�\�}Z\�\�\�t���z��]��D��G\��1ǅ��(\���\�óM\�\�\Z=:}_!�hZ�hc��8S��S\���U�wj\�]\�$ӷ\�_m\�8���\r���H�8�壪���t�;\�(\�U�U�2��E\�[~A#�\�\�\�|�\�5z��T���\�\�\�eS�P<N�\"�Bs\�)�>���7K^z*�\�\�qvĽ\�q�\��/<�\�Ov�p�mulR66x�!hlM�N6�\������!�;��-�\�JK���l\�\�S�\�\r �%,�\�t�ݎ\��\�\�P,�.\�zL\�=Ry�*�\��\0~\�y`\�KK\�m\�ђ*6\�\�T�?\�kRLw9�p�\�V=q˦��Ga\���Y�\�Ȍ�����c>�Z�QYm5��tGĆ���\�as;�Zu-�d�s\�.\Z\�vc��\�\�\�n��\�O\�o�T80$�\�Mi��\Zs#\����y�<�\��Nzo$!$�xV�n\�F\�F*�\�\"2\�\�\�I\'*��3�	�\�\�ZE\n=V\�Ϗ\r\�I�\�� \�#\�!\�/g�Q\�ۍ�,ŏ\�}�\0u>\�{Qm\�7P\��l�I<�l��|$oE:;$�\�@t\n\�}{�ې��7ݶ�+\�24���˩�7\�kBS3\�(\��\ZR\��r�B\�\�����.��;1��\�fL\�<�赻���\"UR톣�侑\�ˮ��N�YsDAZ�yp���F�6^�����h/��s�`Z�\�\�c\�m�\�\�\����\r���\�Ai\��\�iS����\�2\��^Hl<\�v:\�05\"��\�\�n�s��\�G6ؔ�+�\Z�\�\�%F]UۥR����KnH@�9#F�ۆ���[j8\�إ��O�R�hF�P�4o�\�s.[jZ\\H\�\�gP��A�\�c�\�\�|��\�\�\�f\�\�\�+��*���r�\�rJ\�p\�a<N(�\� �G\�ޚ�\�L�Y�oMf��2j1˅>�W4�t��xDH�n��wn�Y�\nG0p|u�qWS!*9u\�fڨ-ҙ�\�|�\'EƼ�)D�\�<�\�\�$\�&�I!\r\�=}�I5��\":\n\�OS\�\�\�ڭ\�R\�\Z����h�2�����\�ѻ\�\�N\�\�\�6\�K�dn\�5�b\�\��\�a$�[\�\�xFH\�<j\�\�\��aF��\�B�oT�m\08��\Z;�p\�\�D\�\�j�f0\�O�\�\�e\�v\\П\��KMv��\�<YH��a�3���k\Z%Q.B�ST���{9m.����\�v^\�wIr��}���.\�3Z�\���\�c_\�\�^�}�3kP\�\��:o\Z^�\�%\�iU\�R�֑ж�\0B����=H\�F\�p8��\�W\�;Ǹ��\�*dj]9(�ZfTg\�Q\�H�I�\�NuGp]�#]\�meT�7M\n�ZA�^�eN\�\�\�\�\��\�r\�15��NG�\�\�i\�$��RJ��\��k\�b\��?[\�\�\����\�4G�[g\��gQ\���\�N�����iԨSn\�&ƫ\�W\�~�U�>�g>�9���\�u�y\�n�bta.\�q�iΌ�\�Wr\��\���\�^\�Q��Am��	�~E*�kU��b���ő�\�[�S����!\�ɥ2\� �qH��>Y\�\�A���hܵ��:\�{�dH\�m$}\�d\0NO3מ�#��ոH3�POh��=����iM�\�\��\�\�PA?BT�qxr�\�\�u{L\�\�\�7f\�Y�bHIG\�ﴥ�1�K�\�i\�Z��ۭ�*nw\�6�1�6�mA�\�k�\'�4��7)\�;���>�-�K	�$� \�R��`�L[��\��h���SQ�Yh�\��xK\�\�\�=��\�\�m�ER|�Əp\�hP\�A.B�\�<��/\�\�G�un���?S�7\r�N\�M�EDT���y� �snjӿ�\�V�jCI���+��\�u�j��|�=fm\�;��;�\�\�*p\�\�\��6�`���k\�}+v���P*$�a\�\r�\�\�\��7^\�R�6�\�Gi>My�k��K\�\�\�n��\�:$G�Kq\r�R�-+i<D\0T@�O�\�\0{\rv��-h7m�C�\�\�[�\n\�.+,�\�\r�\�\�8<���������\�\�ښ��A�H�O�4��{\��[W\�\�\�\'��:y\\�\�=�\�ѥƴmjI�O�-\�9�t��PR�\�ːԟQu=\�\�ō;��V����J@\�9wj{*^\��D\�^\�G�\��ƺ#wR�2��M��\�:�\���Q�Uzܽ�\�\�M}�	��I#!I>`�]J�\�\n�\0��\�N\�4k\n���{����\�\Z�즥#���)$�\�\�`�:�\�\�\�D���\�mwY)4\�\�5�[���x�uR!ţ\�% !\�\�ۨs �IJ��\�: \�-�\�\�֭\� \�{C��K�d��5�+��Gq*Qǁ�GC�^\�\�7�	���6\�9i%\n8<��#���E>�(O�\�ʎBP\��\�^V5�\�\�\��\Zz���7*�Wj�;/af\\z|�\�Aض\�IZh���%*)+)�>\':\�\Z?o\�j\�JV���\��)0_r�Ě�vOT�\��|��#\�[��\"��ّ|=���Jy\�\�1myq\��V�yC%X΃\\zv	]tyNT���\�58׆\�\\���&=^\�\��#\n\�R@C\0�\�Ҝ\�g:2�9��3��\Z�5\�m.(\�\�R�\�J^��\�rߴ��\�6:\�<\�8	PJI�\�M�I;&ST�\��O\�����߂\�bD��/�8�\Zk\�U��\'�nh��I �I���\�R�>G�뚿gf�\�����J�\�=k�\�h\�4\�\�\�t�łpNq���\�]��\�R\�N�\�r\�\�A�%�\�	\Z\�7U�\�F0\�Em���\�l\"\�\�X2\�QS�d�޿%\�r\\qg��I$�O.T�j\�3ڎ\�A\�9�O��2i�\�mَ;)\�\�1\�}O��#ViH��#9P�O7\�ϧ��\�cZ0ZIe�\�Ȟ\�nߺ �:c���E夁��ԍ�m[�mS�\�y\�y����D\�\�->⯸�\�\�\�@\�]9:�j\�$f}j;y\�\�\Z\�Ǫ\�}�\��\�5��6�7S{-(S��ч���0T��(<�Cwio}�r�g\�-�#!��\�\\j�>\n�3\�\�k�\�\�\�B�OSÍ	n��an����~S���x�����RpR~Za=0~\�Nb���\�\�\nn\�Re*�k\�fQj �M��\�_��VA:\�:7�\0캸�.=r�q����*�YXK\�ѷ����>�\�EIO+]�$٘FP�e��Q���V\�\Zo\�Ϡ�\Z��}�쯱\�\�-��Κ��\�d�%\�{*W�\'�>\Zbnu^\�ګBu\�RJ\�`��e��2�]P\�HTI�\�9�T]��\�6\�;\�\�zU\���)�\\%\�\�j!�~�\�\�J++�RS\��\�y\n\Z��t\�\�mn�s�1j�O%n)X\�n��Ϣ��\�\�rGm@n���\�0�Dg\�TV@ |�\�^�Bj�K�\�BзX��ʲIQ¾�Ί7G���v\�v��z;O��X�Pi\�fB\Z\��JU˨<��\�28r�,��\�찺(\�\�\��[\��\�ٲ\�U����\�Y^\�´�	rr�\� �$�9\�N�\�h-�\rőG�F��ƶ�\\ac\�>_�@4>\�[ݷ\��\�rL�\�F��\�A�^.cS�\'k�\�\�8\�[\�]Ʀ[�%�O���\�9���5l�]\�\�1ŻO�T���^�����5�1�\����a\���\�S�y�|.�6T��m63�\�\'\�]8\�ْ\�ي{ۑ�.�5�\�9��\��A4։\�PR��U\�:��\�+�\Z�#�P݊�h�\�lkd��b\�jSO\�q<K�Tڈ�@O�TO�\�Q��\�秗N�u{1t\�\ro�GK&��)\�\����gڱ�.\�\�c��(+y3.*�ZK\n��ë��|�\�t�d�ݪ�\��\�noh��\�寊�A�*�Slg\�_�l�:~#��\�\�\�U��0\�FR�g6\��c\�\�r�ӊ��\�zJ����eX�\�4Cf2�\0\��\'RQ~�\�]X)ƒ��\�)\�M\rL���tg�\�\Z�\�fI\n�@�1����u*R_p��$c:��o\�F*\ra\'�48\�G\�<x�h�n.k�WuH�+��y\��gH2��C���\�jr��w�5=P���RNV\��>���7��ܷ\�w(;3mT�\�ӧ�i4�.HC|�\�JG>��6\�bR�\�\�\�R*��8\��ME\�H9s�G�m݃h\�T���Fߍ\Z,t\��c��\�@\rNRYXF�yP5w�?-f�S߲ﳿn͊\�g�\rᶨ�C�Ҝ�\\\rժ��@ad-.6\�ĕ�{��宨][�\Z�\0pJv\"qﺐ2>��4�b���S��\��𶮟3\�PR\�ݏ�i\�@a\��!\�y\�\�ad#@\�1�䦕um\�o\�Ԋ\r^pJIz�Bc\�\�W�}�f\��\�d��R-�\��+�\�����I�\�-.�\�:�\�\��:\ry\"��\�\�ו��:q��b/u\�WjpS�\� p��<|�JS��Fܗ��U�\�4ۉ�XP\����⇨\n$h)\���_�\Zx\�w�\�o��^�T�R�&B��ˉJ>��k\�0�\"~\�Sd�/7&eYZ^h�x\�\�D\'rn\�k_�&�ﴁ���u_\�N�`\�d��\"b\�m�8#�}�C^\�V#%�\�	\n2H\�8E�a0\�;�G���S$!\�{;�$c\�\��\�4��\�>���򐃀�h\�s\�k4 ,T;}�\�\�\��\0����R�\��5q�\0Xo�$\�5���G�*�?�W�I��^v�\��\0�e�\0q\�k4Сo)Kp�=�}\�A��\�\�i��d\�>J\�\�\�\r�\07g�\�\��-\�����\Z\�f�?*]��\�:�5X7\��2�\0���\0�\�Y��^E+A��\��\0��娙?���Y�\�\�\���\�3�տ\�7m\��\Z\�f�h?EFW���=O\�\�\�\�\�k5,\�yQ5��jG�B��Z�y�\�\���?�Y�֏(\�.=~������\�\Z%�D�\0gw�jּ?\�g>�\�f�\�ʛ���}\��G\�Y�\�B���\0�/Y�\�hE�\�','BIGGUS DICKUS','ChadBig',21,NULL,'09386508693','Lipa Batangas','Hello Kim jong Un'),('U0005',NULL,'Keith Richard','MEMER',21,NULL,'09386508693','Ibabao',NULL),('U0006',NULL,'Chad Big','Montefalco',21,NULL,'09876543222','Cuenca',NULL),('U0007',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0			\n\n\n\n\n\n	\n\n\n�\�\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n��\0\0q\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0L\0\0\0\0\0!1A\"Q2aq#��46���	358Bst�$%7bruv���\�CDR�\�\���\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\04\0\0\0\0\0\0\0\0\0!1Aq\"2Q���3a���\�#4R\�C\���\�\0\0\0?\0�95\�I\�v\�\�xm�8���v��\�g\�\�(�m�_\�o>\r��\�4��\�8�wp�G\�	���8r\�8\\\�e_:&\�|c\�߻>�\�l��Cy#s\�!\�\�M���<�\�\�A�4�\�b�\�\�Ӧ��J�\�\n\��\�+ަ����LX\�^%_2M8\�eAz,<`&*vǩ5Lm\rj^bA%Fh^V\�Y(\�) �V�\r�Fn3\�6�\��=\�DH\�R\��y\Z\��*_H\�M�\r!܀��#4�@\�l�\���ʼ\�\�yFP��)��:F\�m\��-�Ľ$��P\�Za���U�i���������)2�5\�BF��%@j\�୥\�o%\�wBZ\�(O\�:\���BI ��\�*P\'bz����9\��\0�MY��\�mlF���\�1\�D�\�\�W|\�L\�4tT�3��\�N�SZ�D.F�p\�G2V�Ӧh?R\�6k�L�r/u6���k�/N{p\�dd�z\�Wi���\�ES,�c|�m\�7�?u�\�]4��К\0�q�ڙ�\�q\�s�h\�\�)�l�@���\��jW\�e\�\�.�v8���;\� `�\�V����ⷳ\�\�_\�!\�O�\�R|��q	\�\�\�(\�S\�\�Z�J�ʏ�\�	Z�w��ugF\�\�i�\�1-��\r��X(�\�7Le��36\��U�o�:졸?Cޛ��)\�z\�\�a�ׂ�:�c��\�\�c\�_&:\�f#+�Uݖ̄���\�\�\���N\�i1\�OSֹ�)j\�\�5\�\\��\0t\�\�^팪D�4\�q[Ie\�)M1ou�\�/���].eWP\�Ǖc4i&V�\�)銯\�-�r����#z�\�\�\0,\�n�M�G���ԩ\�ZKֆ*-�U1h\'T�X\n��\�>\ZGARz:\��\��h*+tg�\�*X.��j�\�m�7�rq�C*ɨ�r��t\rU\'\�eKb\�OD�LVG>z����9\�܃�e+�\�(q\�=���\�\�1[\�	Ϡ4Q\�r-�3bC�X\�tSB[B8�3\��I\�VP���\�TH�@�Q�{oG|O��{\�\�\"\�FK\�\���4;\�=F��ב\�p\�AY)Qz#OS��$���c\�zw�\Z��MǱ^�\�\"#n$�\n\�\�B�;0�\�ᓷ��y\�;\�I\�AUGԛU����	�p?�i\�\�K*6�b\�yФ�;\�T��i\�M7{Cz\�D]-�)Ju2a��\����B	�/��N��\�FzR�7Q�Bz���\�=���y���/\�4#%)	t��z�q`\�\�l�\�\�J�yԵ<\�\�W/(P\'�\�\'�X֭\�\�\\,\�Y\�h�\�sv\0o����*\�\�O\0u#q�]�AS�\nLF�\�:P	\�!XH�~���\�-\�x�\Z\�ծ<\�.�\�\�\�\�E�W\rŗ���\\��\�J9	OL��گ=�81��\�J[Q\Z*\n\�,��\'m�)mӽg�Q{��u�\�w\�b[-���)@HBP\�	<�\�$dTv\�O���\��l\�7F4���&��8D�M�K\\�\�L��\�9;o��\�\���\"��\�s凤m�O�h���\����GM\�\\�\�XmnAC\�%l<1\�2V�\�\�،dW[\'�7\rԥi�Qdf=\�p�\�\�KjY\�\�\0Fz`�\�W\�|TМA�˽p�LK��\�\�7,\�o!*\�.(%E$\�>d��\�U��N\�=Aiz����qy\�Ԗ\�=-\0!%Ĩ$������5\�G.&33\�\��W����\�\�~\�q��\�\�\r�tvS*So ���+$N�+-�\�\�\�Y\�&���:A�\�[�\�7�RU9\�4�Mf�\�9���\���:oW=�\�i�nf\�\�\�\\\0>\�;�\�y\�\�\0�;�Fr�Y��\�Z��./��\�n�~#�V\n�\�T��$o\�\�qؚ&\�\\m\�\�ꈰq\�z�#\��+;\�\�\�\�jq�5��0$��\��}.ē�\�[N�(Z�(�����\�a�i���R��0냏\�+K\�K>���G	�)[��\�\�\�9�6*Zy�\�R{c�ʪ�s�.M+��\�)m\�8ӋA\�k;`�\'�=\�\�Q��5R�f��*�	{�\�Ҽ��x�\�;zԕ\�\��U).4\0N\�\n~5\�n�XR~�:\Z��myueK\����Y�\�\�\�T�B�$�ɫc�V[lh�\�@+Vk\�vV谦<BRc0\" \��WAo(�l\�Ѿ��\�2�)KNq�9\�\�>x�\�\Z�h�am�6�l6\�ʕ1\�\�\�o\'̍�P��\�u\�\�\�Y!i�GHߩ�7A04�\r\�\�lIJ	�Uwf��\�\���9\�\�Y�GlZ��6\�ǔ�~Y�d�b\�w��]=�+�\�h��\�:W�\�\\Y�tˉ��\�ޤ���N1\�Op\�\r\��r�89T\�J\Z9�;Uey�\�ˊ���\�\�E\�b�\�\�R��d:�)�[\'��rֳ\�dt\�K\\>\��Q�~B<[%\�G\�\�lYQ\�\�\�Oe��\�6��K�C�Q%�|�-\��Q;�J��w\�\��Hi�\�l\0�l�ֽ���#��ҞF\�t�Z]�B\�5�zv\��g�	e.Ejb\�i \�\�Q)#\�\�Rw>,C�\�W_p�Oj)�\�fs\�C2q\'#\nk�ew5j\�ƛ\�DP��`���V�\�w\�k\�L�2�Ĭr�@\�+)8ؓD�A\�THZZN�Қ��)B�{�6�V��R\�2|5���	�;D�wr���\�h}q^���\r-�<ƥ\�Ͷ��Ƀ!\�-;�r��3�n\�n\�\�t��z>$fˠYܲ�\�A\'\�\�\���k�H�\r-\�q\�+\�YB\�!D��\�ߘ\�\��QT\�(ޢi�Zl6\�\�K�i-�\���Ӧp\�\�\�\\mҝ���T��\�,%�\�eA�!`��$�d���vz�*饯?�\�\�ͥƊq\�ִ-~�I\�\\l1]\�\��g9��n��\�	\�\r\�G\'\��h�OkM[��Ntʛ\�V\�gl_�Dq3E�\����A;\�^\�}�BL↪�\�_b\�㶻]��s!$�\�\�l�eYY\�\�_�9}��\�\�|\�Ҧٚe`ƌm܈O(��	^{\�w\�W�8�e\�ʟ\�&�aw�YB��\�V�е\0\�\�\�\�\��{Gxv�根Ƿ���)\"�IHQأ��a\�{f/\r�\�O��7��fa�U6��k_k�s�jM�\��fP���K���m\�\�\��\�06s\0\�m�-\\\�\�m�7�\�o\�ܛ\\Y�\�\�Hu�H\r�\�2�;��\�\��o�mr4lmW\r\�/��V���H*�t�J��r�G��Zv��d\�\�\�\�j|��\��\\�\��-n-��rQ���UA�ts�}�\0.>�L�;�k�@\���]=�xw:\�\�\�\ZRZf�nm�2�{�TH��\�\�\'-��I\'U��ڋ8�\�E�n�$\�4�k<\�\�NTHP)I\�H$d���\�OhNKf�\�=�b�\�X\�\�R����%D�yI#$\�M��ړ�7�\�\�W�EZ�P\�Jǂ�nUC��� ��\�PY$\�h=\�\��O���9e�:��\n�*\�i\�/!\�\�\r=k������\�n�K�D\�ŕ�T�\�$�N\�\�\� �\�ۢ[�\�ׯ�\�j�#X���\��\\(Ž\�oˍǕ}+��A\�\�#_\r\�Sjr�\�L�]�8�il����ޕ/\�N�@ކQ��r���Ϝfa�\��%\�C_�\�F�O���\�\'\��*Th���B��r\�\�\�\��KOˌ�!l-Y	K�/l�d{M�\\C\�p\�#E��2\�\�\0&}�J�HP\�Cy٤|��\0:�\�.Ei��\�S�$9%j\�=r	�\�Y#�Ɵ���\�\0\�uxmT�2�?:|�m\�5\'}��S99�J6��2{U\�q�U��R\ZVzbN\�Y�/��L\�m��\�\�߽*ܡ\�\�\�Tg-˸\��r<�<\�4c��.��-�r9�h�4,q�\��J	\���_t\��\�0��Pտ�q���\��!^\�X\�W^$LoOXa\����[Ň&\�uLH�*[�a �5%\�\�J�\�UIG�r�\�*\��~\�v\�P\�\������q�e]\�ڛ�-�\�\���a\�A<�[X\��lJ��\\�\�u\0��]-s.�\�\�y\�\n\�\�\�g\'^\��\�.�\�|8\�\�*G�0ە�1��\�U60\�`.h\�}{�\\��\�\�5ۈ3a\�ASP\��H\�Q�\�s�*[��x\��\�2��2����\0S\�bpv\�҇t|�œ��*�٩\�\��\�χrЦn����\��\�o\�Q��]ƃG��D\�Ez��o���\�\�\�򥈰eū�TI�\�Cw\���*Z��\��@�\�\����md��\�򂡒w\�`+���8\�m%n��\�\�Fz�\�\�^� \�Ce3Yъ\nN��Z\�LkK)/)ymd�#\�E�AwvO<�.��\�̧<\�\"q�,o\��\�Z��\�6ҦB�\�H\�\�|�F�xq�\�J��yՅn�K�K,ʍЍ9��?�ccS9\�<Q�\�R�V\�?+N6�\�\�z\���@a��]\n\�T�\�\�\�h�I>\n\�JBT�@\�\�½J�C�\���[ʖ2]Ny{�\0J�q�6\�ח\�䀖\�J�\�\r��\�7\�\���q9\�\�>k�J���5\�,\\ڱ[졐��\"\�\�\�6�\� �������D�}m�e\�[�j��&\�JJ�\\)֓�T��\�hkZ\�\�vv\�oO]��\�nul�gl��������fҷ	\�\�\�Z�g\��O_F2\nE65	ک�Gku\��!\�\�@\�\�v�E\�X\\<\�+�\�\�T\�Dّw->P!I ���ʳԓ\�Y+E�%Vg�\�eG\�_F\�\�\�	Q$�mS�\�&Ky��\���)i\��kA߭W\0��\�\�DR\�U\�k�U¯g~Ov.�׶��(>YR�	\�ق\0P�g�j_j\�\�W�\r\�-N\�.\�%\�?\�t�֫\�J\�Pۍ\�\�;\�\�#�\�^.%�:����\�{\�+. \�����Jl�c:f7H��\��Ҝ_ĢN�\�KS:�\�ܙ\�yP��P�������8�+�\�\�\�\��6+A��\�\�\�E*#m�\n�\�\�\�\�\�\�\���!#s_�-Ӿۚ�\�p�\�N	\0\�n��\�un!��\�3�U5z�����\���}3P\�j\��n��\��!���O֠4�\�,zf^�_�V�]����u�Y⌂ט�\�y֌3\n\�\�\�\0b7�\�z\�X�?��\�+\�\�\�\�6\�Z�R7\0�ȑ�\�j\�\�\�+�!�\�֠�\�A\�JI\�}(C�\�ضg�.HLq����e�/�\�\rL�\�\��	$~ʤ��\��\��	{7���e\\\�r��\�h�\0��Kp\�NI�\r��j����9~\�8u-�!ö<y}\�\����E��-�g���\�\�+ъ���T�U�s]xwni��EAjy\�z\�k��D\\}9�HO(\�h�O\�W\�\�\�\nBV\��S2\�/���[�\�x���[��\�P\np�N(3W\��#q\�\n[D�ʶ*|f�. h+\��;rю.Q\�\�\�e\�\�\�\�\�G\�j��qvf��\"\�|��Im�˃��T\�C��)C�\�o�����E	\�p\�\�M\�\�3\�\0\�l��)I��\�VA!*�7Nrq���\�+O\�x�탸�T�p;$4\\ue\�KJ*d�0@;�ք�^o�i\�\�h�s�ӌQ�\� )��\�R|�n:t\�\�CN4\�ϐ�H8#)�r�\�DƵۄ\�Υ�]Z�\0�f��۲yG!#8W\��a^\Z̌r\�y�t��+\�\�e\�2�6 o��zԪ�AVW	�;\�Gs�	S�%�������\0}\�{]�璘�\r\�S\�Թ\�\�<�#lg卪ڲ˵?f��G�BY�>%$y�y\��5UqKR\��e�d�\r\�ޒ¤���\���1�N\�Ϡ\�o[u. ��!;\�\�;\�\�\�D��>�93\�.`��jFJ�\�B=i����\�6\�\�8�M:�s��ҟ\�%�Pd�\�\�E>$��5��4\�Y\�[��\�\�pJ\�\�I+*Pڋ�,\�0�r=(9\�V�m	�!	\�F\�4s;,ej춊\�=Ъ�yԒ\�\�T�\�T���RD\�#m�E}\Z�]Ft\'��\np�\0�i�\�\�O�n,�r�|0A��ڼi;�\��^~�Qˎe����\'L\�uޤ�G\�]\�HH\�@y�Q��ڒ�\�(m\�;$��w|&qI� u�S1-R�Iy\�w\�&�\\\�K��>�EY@4��\r�%NCC\'�@`Uͤ4t�\�=\�� �a^���YUx\�Q�\�\�X\n\��5rK�\Zh\���\�S̆\�\�dd��\�Y;\�p\�\�PX\�JF�\�\�C\�\�-/�-��5���\�s-G�Fw5�\��f�\0��őm���Ss\��p�H(AP��\�NOS�Z\\\Z\�\��kn5�/�_�\�\�S\�#\�BRB6\�Z:\�&�%\�\�8ݾ䅪2�)�lt���u\���r\��֞���#�`\�PW.�o�\0(\�^,��S8\�j���\�5�Qp~*.�\�f���.(9�\�x\�@\�����\0�k�,^a�\��D\�\�%\�5!<�y�`p}~UN�*\�+T�q���\�\�\�\�\n��\��Ԓ:��E��l\�*mi-\�s$akec?���t\�0Z�uAФ�\�t�(C�\�Jv�\��P�\��_;k\� ��\�*r׹=~T�eU\�4�\�Z\�g\�qbS)W)<�\�\�\0:\�2e59ե�$�\�̢~��U���#o�J�\�\Z��R��+A؜n?��1e�6 6Eq.1X����JS\�^\'�;\�,Z\�\�o��\�*\�\�\�֙8	ll��l�ڂu��ʼ�d9|\�,�\��4���i�\"Ƥ˕-�\�}L\0<\�\�\'8뿥kc.�V�\�5\�l�֖\�e\���,3�\�灊���C�Rr\nH\�yH\�U���\�$��W��=\�V\�\�\\G~\�\�\Z�\n-\�\�y��%�紗vi\�P�\0\����\�/�n�\�}�N��}�Ƶ\�f\�^z\�\�%�\�\0�a�\���	\�65F\Z\�;$��\�\�\�F\�\�òРHRrEq�\�1��\�R��,\�d��τ\�y8�\�0�9V\�\�pR�zF1L|��\�;\�+��$\�򤴽�)���1�ɡ�w<˻�󔢊��[\� ��\�K�\�2\�yA%J\�S4\�\�\Z)��X\�uaa;�ѽ�j��c�=.m�Za\�,���EےP�FA>F��\�oj&\�+\�\�\�\�2\�I^}iT;<I\�8�t;\nT\r��\�^�#P7�?L����y֟_�B]��X\�E_��\0\�]놰\�_��f���[}I�\�񎭻}�*\�ҟx�Ɂ\��\�jp�<Y\�\'�]i��m�H+V\0\�\�ó�-�\�%N��>����v{9\���\�\�Փ�<8͒\�#��\�mo����w\�|\�A\�r��\n\�IZ\�2�N1�@\��5�=�M�N�Кn;�O���3KqJ\�$\�\�\�\���w�Z\n�\\)Q�F���/�Jp:�1Q܀Iϔd$K��)���X�\�7W\�\�\�璢���-\'�A*N22A\�N*�\�7I�MnL8�����9����HP\0$\�|�Aֈ\�Z\�؍����hW��S\�\�\�\�Rw�\�\�c~�\�k�\�3tT`\�\�ܪy\��m��dm\�o�\Z<C�e>��_5�V�I+J\�_S��9K|Ô��O���B\�%�\�(�ny^\�\�\'t�y\�H\�\�=j��\\S:.�vCi.\�\n,\�#�ژB�˗dC�Q\nm\�\�+\�J�#i^Z\Z�c\�^\�u��u\�\�J��\'`J���Ȍ\�J\�z�O\�\�wG��X\n\�d\�c�9\��+Y\�52\�`�\�e�\'��*Q)��\0���\�Ö���N�ӱrt�ϥ9�S�\�þ����F\�ӕɡ¬,\�\�d���@���\�=�԰����&\��\0\�Q��Gj\�Zg�D�\�A\��iC�-�|\�i\�r7�+r:\Z�\�Km�*\�1nŒڊ̂���RU�{mNs{ӣ}�	\�;g�8�\�\�h\0Ϝ�C��k�+�\�1㾼��ū\���\�IJ$�\��R�-\\�;$�����[\�IG�\\�\�V0R����n�\�:_ڢ,���\��\0��5Bp�X�\�g\� �8\�C�\�3\Z\��Z\\Ύi�-\n`\�m<�l���.</Ԇ\�-����G�\�]B@ :\�듌�1V�\r��ۓ\��\�L%���J���\�#o�|ڄm��Ƌ�\�\�7�\�V޵k\�	r��P��\�^7J�s���\\`���\���\�rӮG1�\�.^\0)p!Ih�\�\�G@p3�\�f*\�&�\�s��\�\�\�\�^)\���{#�\�w\�+@Yy=\�ҍM4�_�)@�N3�|\�XbYS���\��sG�F�_\�\�ܮx2��b ��$�\�9\�m�`�mOe=O�>\"̟a�ȓ�\��\0�Y.���\r����:)\n\��`��\"u�)\�c�j*��\�J�\�\0��֠\�PZ2\�#��k\�\�\�X�\��\�\r7v\��F\0�˄\��9�VPAV� �]\���Z��\�3^ۜ�q+�j-��\�VHQ\���P�\�/;۞~\��[�6�\�s\0}|����MiMGS�;����e\�\�e(5�\��\��)R��\�\�7\�>�A�?Ia�\0\\)R��\�S\�\�\�E�\�\��\�V��~���\�W*\�7�o%\�\�{_��\�?�.�\0k��3����\0\�)R�M\��L�q\�q��ޣ���\0xTf��������J����{�!B\��\���h�\�\'�D\����ԩU3���6U���W���eE{C8]C�to��t�U��y� �\�\�\��Ol��\����\�Z��4�%f�\�v�*,\'�<�?\�?l|>�\�\��ѿ\�E\���\�7�?�bc��J�%�\0�g�+�\�\�\�K\��\0Й\�#�\n��=�����\0(R�O�\�]\�N\�s�/ϽQ��~�\�M�\0$\��\0ZT�\�ت\�\����\��\\\���?AJ�#�A7M.�����R�M/�\�','Foo','Bar',43,'Male','09876785554','Cuenca',NULL),('U0008',NULL,'Keith','Foo',21,'Male','09386508693','Ibabao',NULL);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `userdata`
--

DROP TABLE IF EXISTS `userdata`;
/*!50001 DROP VIEW IF EXISTS `userdata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `userdata` AS SELECT 
 1 AS `id`,
 1 AS `user_name`,
 1 AS `password_hashed`,
 1 AS `fname`,
 1 AS `lname`,
 1 AS `bio`,
 1 AS `age`,
 1 AS `contact`,
 1 AS `address`,
 1 AS `photo`,
 1 AS `date_hired`,
 1 AS `specialization`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'outpatient2'
--
/*!50003 DROP PROCEDURE IF EXISTS `getRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRole`(IN UID varchar(255), OUT Role varchar(15))
BEGIN
	Declare dummyRole varchar(15);
    Declare test varchar(15);
	IF (SELECT count(*) from admin where admin_id = UID) > 0 then
    Begin
		Set dummyRole = "Admin";
    END;
    ELSEIF (SELECT count(*) from nurse where nurse_id = UID) > 0 then
    BEGIN
		Set dummyRole = "Nurse";
    END;
    ELSEIF (SELECT count(*) from doctor where doctor_id = UID) > 0 then
    BEGIN
		Set dummyRole = "Doctor";
    END;
    END IF;
    set Role = dummyRole;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `doctorlistview`
--

/*!50001 DROP VIEW IF EXISTS `doctorlistview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `doctorlistview` AS select `doctor`.`doctor_id` AS `doctor_id`,`user_profile`.`userphoto` AS `photo`,`user_profile`.`fname` AS `fname`,`user_profile`.`lname` AS `lname`,`doctor`.`specialization` AS `specialization` from (`doctor` left join `user_profile` on((`doctor`.`doctor_id` = `user_profile`.`uid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `records_today`
--

/*!50001 DROP VIEW IF EXISTS `records_today`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `records_today` AS select `bill`.`bill_id` AS `bill_id`,`bill`.`bill_datetime` AS `bill_datetime`,`bill`.`patient_id` AS `patient_id`,`bill`.`doctor_id` AS `doctor_id`,`bill`.`consultfee` AS `consultfee`,`bill`.`discount` AS `discount`,`bill`.`medical_prescription` AS `medical_prescription` from `bill` where (cast(`bill`.`bill_datetime` as date) = curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userdata`
--

/*!50001 DROP VIEW IF EXISTS `userdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userdata` AS select `user_account`.`id` AS `id`,`user_account`.`user_name` AS `user_name`,`user_account`.`password_hashed` AS `password_hashed`,`up`.`fname` AS `fname`,`up`.`lname` AS `lname`,`up`.`bio` AS `bio`,`up`.`age` AS `age`,`up`.`contact` AS `contact`,`up`.`address` AS `address`,`up`.`userphoto` AS `photo`,coalesce(`admin`.`date_hired`,`doctor`.`date_hired`,`nurse`.`date_hired`) AS `date_hired`,`doctor`.`specialization` AS `specialization`,coalesce(`admin`.`status`,`doctor`.`status`,`nurse`.`status`) AS `status` from ((((`user_profile` `up` left join `user_account` on((`user_account`.`id` = `up`.`uid`))) left join `admin` on((`up`.`uid` = `admin`.`admin_id`))) left join `doctor` on((`up`.`uid` = `doctor`.`doctor_id`))) left join `nurse` on((`up`.`uid` = `nurse`.`nurse_id`))) */;
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

-- Dump completed on 2021-11-08  9:51:27
