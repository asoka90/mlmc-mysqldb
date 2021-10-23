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
INSERT INTO `bill` VALUES ('2021101000001','2021-12-11 02:25:59','P0001','U0002',9000,80,'Lorem Ipsum Kill'),('2021101000002','2021-12-01 03:27:19','P0001','U0002',100,0,' qwe 2\n qwe 1\n'),('2021103000003','2021-10-03 03:19:06','P0001','U0002',900,0,' Test 1\n Foo 23\n Bar 2\n  \n'),('2021104000004','2021-10-04 03:29:32','P0002','U0002',2000,10,' Test x3\n Foo x3\n'),('2021104000005','2021-10-04 04:01:56','P0002','U0002',2000,10,' Test x3\n Foo x3\n'),('2021104000006','2021-10-04 04:33:11','P0001','U0002',9000,10,' Biogesic x3 a day\n \n'),('2021106000007','2021-10-06 00:59:47','P0002','U0006',9000,10,' foo x2\n bar x4\n'),('2021106000008','2021-10-06 01:06:57','P0002','U0002',1000,0,' foo x2\n bar x4\n  \n'),('2021106000009','2021-10-06 01:07:47','P0005','U0006',1000,0,' Foo Bar\n \n');
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
INSERT INTO `medical_history` VALUES ('P0005','foo','bar','2021-10-22 01:44:14'),('P0002','Tubercolosis','Negative','2021-10-22 02:46:42');
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
INSERT INTO `user_profile` VALUES ('U0001',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0\È\0\È\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0?\0\0\0\0!1A\"Qaq‘¡ð2±	#BÁ3\Ñ\áñ$bRCDr’ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\08\0\0\0\0\0\0\0!1A‘\"2Q¡Bq\ÑR±Áð#3a\áñCS‚ÿ\Ú\0\0\0?\0õ%±l8¹mu8™Z2\Ù[\Ê\02O6& Y\Æ3Ÿ ³‘Gø©ú¾„´Œ@1:Ž\ÄùC\Æ\ÍvM4*]»}\Ð@v!ˆN\Ôûv-\"•¶@ntƒ;ýh61g{ˆÅ˜ò=G:9¼J\Ã\ÛX\ÔI\Øõ&§RŒ/M«j4˜!cuM-\â­)ý>€s¨ö\î$b\ÔnÈŸŒQ‘\Ãm\ÛeI\åž”\\PFH½\ÈEU\ÕN©ƒ¸;}\ÍQ›j©|\' ¡£\\?Ó¸\ÄÁ<¼vÞ%\ßf\"‡~Áe²E=\Ò&j\Ø#U±\â‘\ê@•\ì7c~|«š™BAùÕ‰¨8”M*’]|2$7¦­§$:ôG=¢n\ä]¦ ~þTö¾ºŠª†ƒ	¼m5¢\Ù()Ë“Fž\ä„÷ôòŸ<\Ù\Ô|\0\Ë-<öŠ\è\n-–… õi¨/2i\Õ¡Ó´T¶\Êvb2aH\nšŒðG–þµÔ·‡nI\Z¶2vŸ3]\í+{õ@ yS­»%Ã¨	Ÿ	™Š¾6wPSº\É- ‹\Þ2¦[I§Üµr\ã+6 7Z\ã\ß`Œ\0¢@\ëÖŸ7l¨\ä\ÎDò¡_5;3“\Ð[;»±\ÚU™yóð§‹mr\n\ÛóySY€Q& 6©\ßUBY&&\è>5Oœh\n)ˆšoj!©)\"\"k–\í•-p¨m¼©«{Z›A\Ô\Ç÷1\çM\ïÅŸ G÷x·\ïzT6\É\Ñ\á³;‘R\×^\Ø*Dö`W€¸®›t1\0}\Ä\Ð?{±p\ÄH\Ô¼½ôkX‘uVF¯¡øPv†´\'·	¨p\ÑI:ô\î©eŸ	òô¥@8„\Ö@ƒ\r±1\Ò7¥JuKIÌ§·©#\ÂWY\Ì\íhTPW\Ã$\é?ø©¸\\\×f\×wr\ä\ÈÓ¯\ïY«C0E\Ö\é]\Ø0©&\Æ1ÿ\0°ŽQ¶õ‘ÕŒ\Z/ —{Åœ´s\ì;7wqÀY\ÛnGý¹Q†}‚…²]O¸\í«82ŒF $“¨ó#o…\ä8”mYI\èû\Ò{m´@\Ù\Z{¼-\ç¸v%¬ó1D³\Ä6œ”¶ª\Û\îÑ±Gc$\Å4rKL4LŠ5Œƒ\Z\ç¼T„nB9\ßþª\n\×y?„\è@»\åB»N#Á<¡IX úm>´e\ÎðAr|$ò;\Õ*ð\Þ6\é„CÀ\çb¤[\áœ{“n\Ð`Ú·P¤}\íS¶?[£²\Ø]¿¬\Ñ\ê½Œ\ÖÆ³\Þ8\å;‰ý\è£?Á¤…•‰-\Ö?\ÍT§	fZw&c‘;}jBðŽ`X\èH\ÞU	®šù0 7‚Þ¨oP¬mgXV\ÒQ\Ö6 ûÞ¸\Ùý¢¹Õ±ª.„ñjM£p	\æ\Äù\Ñ\íð~+Y\r}O˜\ròª\í•w\Ê2«\à{4\ÂKª›oª7\ç*SU\Ð	÷ý\í\\³žL\Æ\à_`Fÿ\0Jzðu÷}B\áR&Ž¼-‰lCj#®\Ý=j»M{¾Op«\áû\Ï@#\è~\È\Ä¡M³¬\Ì}+§<¶X»ˆƒ\'\ïÒ¥§Ù·p%û\Çc¸;\ï\èjN„ò¤:˜–2G\ê‘\ç\åU\ÄÄ£G©P‡€xË¾?­•X\Î\î\Ü$\ÝIƒ%v\êy™®ÿ\00vB&`‚j\èdXql6˜…\ÏÎ‹o‡2û#S\Ø\Òb$@ó?µf$\á™h\ê’q-‰‹H\Þ}\0ýU¼\ãGˆl\êë¹–!õ°Â³\"õ*O»\ÝZ+Y6Î¥\Ò4†ÿ\0X£ZÀa\í(\ØÀ\Üz\Õð+Ž¯;hvU‡¹L\ã\Ó\î³s÷µ&Û¤n<¾œªM¬&gˆÔ–°M>\âcý«InÍ€vµ·1\"`tõô©m…hŠ½ùûõ¨ijN²û$»k°¦\å\Ñõw\Ø,\Ò\åù\ÕÁ6ðúL‰ž‚}~5\"\ÆW›\\º\Ãdðõ§§\ßÂ¯­-\Ëa•d !y	\åF·fÜª0!¹ô™õ«Žü¤¤;mœ\ß\è\ÒFß­\Ï\ÙQ\Û\áüÀ°Bz¤Ò«ô\êª÷«¾\ÑÏ§ýÒ¢}77©nñ‹\ä\È\Çþ\Êñ\Û9FZOúJA%h¶2¬5µ¦\ÞL9TKY›3P\0\ÄAÁ=h¿Ä“Ý†!Œ\È S\ã\ÐþÏŠŸ\ÈõR¬\á°Vfp\êdøLm\ëRl&\ãU¨\ç>µU‡\Ä\Ývmd¨sO¥I³}\Ã\ê:fg\ÈùýûªqZ\r¬\Ô5\Õþ\ê\Ðw_\é÷J\ÄX#\îh\Ã@CÝ¨#–þú€¸§.W5ð\é“4t\Ç)ñH\ZFÀ¯^T\\F¬\Î\Ã\ç\ç~ªÁY-J²\Ë#\ì\Ó\íÂ±*£nrvÞ¢aóÀøƒ`”\åO·˜*Kif\'“U\Å`\æ•ð\é¯k)\êP¼ OO}9-+p&\ä™X*0\Å\'~T§Ž\Ø^:%œH\Ó\Þ8úòûÿ\0&V v3|JHµl‰D w?\ZrX,\Å\Éð€L(\ëÁ\0ÈJ{bu6€\êbI\ê?ø«\â‹%ö©ö\ÉU@ciÜ’yWm=ÀYA6\Ü}7¡·wf½%:D\Í\îÅž\àP7­µ\Ô4v§ ¶\Ð/4²“\Ì@Š%„[wi\Zw€zvˆ\ÚÎ¢yAÞŒ£J«‹ A2\'­_ª»%Í‚rB©K§\Ç\è£nCü\×\Ûp=O§J\à)\Z»\ÏMÖ›k‡EV²w\Èsô¥ñ\ØS[†J\í\Zz#\"\ìýä¹¹t|©\â\Í\ÜE­B\è+2\Ó÷½\n\Þ4>®õ—R\ì³\È}\Í9®µ\Ï»\î}>ü\êø\ì\äž\Ì\"¤\ådk6B¶¥\ÔH\æ\é5\Ý7Sú¨\älB\ê5Óˆeß¾@A†õšr´¹!·	±óõ¢?4\Øð9\É\Ì$Ø—k$›‚@\è9\Ò\ÖM\Å\n$y??¥\rl¨¸Û–cÉ€>UÅ°\n\Ã\ìA\Ï3þv¬\æ³t®œ6\Ç_ù#X\ÇZo\r˜oýB)P\Û\æ\Ý\ÈS:†ÿ\0|\éRE|„\äñ²´dfõ\ãšð\ÛjÂ±Ó°¤ù\ÑûûM\ë2!LDH\æ*\Ì\å®”ƒ·!\ÏÖk#\Ã4$˜±\ägö­ˆ’_„ü\ÎU6n\â]0i\Ü\í\ë\ï¢Û»|\"‹¨6¹@ókù«w\07ø¶q\Ê(\Ö2;,š»À7Ý˜I#ü\r¨o\'’omÁ?±Uxg(å»³x#ŸûT¢·;±¦\Ì\Ê\ï¬\Ìo\çV6²De6\Õ\Îý\0\æ<\è§$TQ¦ó°™=f„™	µº»¿óU–\íU‚\Ë\â™S±\Û\×\ÝF´„ “$™ô«\È\ìUž#yô£\Ø\Èð\á\ã½`KH–˜?µ	\âójß„`ÿ\0bU}¼\")\ÛH\ÕEL#\\ Ü¸IHÚ§Y\È\íb\âX™žtTÊ¬\é.š”“\Ì\Ì{\êÿ\0›\ä \Äp½\ìŸ\íþT4Ë™ƒ-»\ÚF¨¼|©ë–»¹ð0v\ê\'Î¬+%µ!\é\0\Ì\ïGµ•­°4$ªyzƒÖ‡u\Äf‡\â\Ô,\Ó?E]o	rgˆò.•\Ö\Ë\îAtp°e‚‰“f¸BWU Û\ØÐ¦Þˆ\Ün`}ªŒ-<Ê¯\Æ\Ü\ØÁ\Ð*¥\Ëq\Û1~[<…r›×­‘s\Òbˆ÷Õˆ±\ÞI\Ü\Âj\éõ£Û±\Ïõ Ü¹*…+5$¥;i\åhî±·úN¹5ömb\á’|R$ñ£§˜Vo\nŽ²b<÷«qlª(û·\Ò#:Hº\ÈVxR„\Ûz±M\"\éÚš÷h\0ôU–rX@˜€L‰ÛdOq³ˆ\'`Ã—•X\éT„\"\ÛZ\"©r¡®\0 r\åÖ¬SÁ}=\Ögm.*\ï˜@ ®B.ƒ o¤ŽtT\È\í\'h\0©\è\ÊK0žPñM\ÈR\Ö\Èý\Ã\Ïz‚žžú$»h±‡q=‚Œ¹=µú¬A;\r#ŸOÞœ2›JÚ™\ØFþ\éSÀ%³\å\Ì\Ó\Ü*xLŽbys½0C’\Ì\ìgv²òœ8;[W&¥Sa\Ê§¡úzR£Ý…º£‰\â3!^Giv\Ì€ C§•\Ñex~€òŠ­7Gx˜ó•ñn\Ôu\ÅZ%ž\Ñ\ÛLY\Û\Üz|êƒˆEÁ¹\ÍY(1¥Äùònáº\É$	eV\ÜUCCbdì¾»Ñ­\ã\Ñ\Üv\ÇI>µE\×E\ÙÊµAb×™,!DX¹h]\ÒLO\ïUM™ cihb\Üù}\í]µ™®¦B\äúu\n½òB†˜«hE\n5Ï—§_…?EÀ\Þ-$K\'e\éU–ó•·rA†Ÿ\æV\É)j\è \É=~þ4\ã\ÍP¦>J\Ú\ÄY=\å¡\"cQ\åH]m$\Ö<\'¯R*¬gxmz.b­\èUð‚fyR±ž`.•ž¢9\Õq¹%£q\Ð+\Å+«VÄ’I\çûùQl i,\0\'\ÝTv3\Ü+?‡\Ãl[®ûT‹G‡]\×-\é\Þw¨=„\\N£˜h\n·VE\ÝT¼\ÈýUÐ¶®Û€\0–O:­CW\ÕwlÀ\ê\àó©xL\Ï\rŠV8f xt¦¯€©\ÄhB\êYZ.A\è¥!¸¾&¶AžkGKPÄµ\Ø§a÷\çU¸Œ\ç\r„¾-\â	¶Ñº»A\ÔF\Õ\Û|Cƒk…’\êGX~•­2¨Q\Ô;0\Ó\ÑZƒ\Þ1€Aff¸;µ%\Â\áfL~\Ã\ßUgŠò»d(\ÅÛ‰\Øõ¦Ž1É­°e\Å\Û\Ø\ì9m\éBfŒjS[†V¿\Â\ÃÐ«\Ä;8\Ñú\ÎÇŸ\ß_•>Ý« \í3¨U\0ã¬’\Èb\ØÄ‘¸ƒ¿\Ã\éHñ\îQuI8‚1	$Rû\\#W©\ÍÀ±G\éº¡ñX‰\Ô \È\å]TD\ZU[ÿ\0a\é\ç÷\çTC²{‡Ãˆp\'\Ý\Ö6®?\à]‹’H³_J3/Cvk&\ÜtZô\éhR6½|\é\Ö\Ø#7pvÚ³GŽpZ\ÛeüGh\ä=Ô‡\á\Â÷ŠŒT´x†ô§b”€ø\Â\Ù\Ç\ã²ðOE©7A\Z­¡ð±ƒ1©VZ\çYr!$™‘¨~/Iø–°¸\éÿ\0Œ…\â\Ø^0Â¸ñ\Ìi\Ë~~•/ù»pKû®\äj\ëÿ\0\å˜lF+Åƒ0:ºc\çR¬\â³ÚŠ¾•}¥\Ï!÷¨\ÏeÓ‹\0Œ›]z#q†	¼H¸XÁPÞŸJ…Š\ã\ãzüa\È^^v¬u¤\ÌÅ H€|Jv\ìTœ&óº=\Ð\ÍÀuG¾²\ËXæœ‚\ëS\ì\íE\ÞsZ\Ã\ÆX§´C\Ý\Zö0 I2bš¼m‰,Ve\ä@\çT˜Lsp\0II\çS,\à­8Ô†\n\Îúb+3\ë&\Z­\ÌÀp³\æT\ï\æ\Ü\ÂùVk\ä(—2*‰\â\\\Ë\Î\ÌÏ¥\0 :6T\0\åX6ÀG?:•g.P\Ò\'™Yd\Äf¡\Ï\ám7\Ý%T¶w™2®›·…\È]9¶=J\Ûrð\Û\î\Ä\Ím¸3²~2\íóa¸ƒ1ù¥\Ëd. `ð\Å\Ö\Ü\ï\ãa²\Îüâ¾†\ìCØƒ\åÖ¸³´<»,LØ»>]Ä‡Lƒ\áf[z»\Ç<\â`\ë\ÉôL\Ä1@`°ü\\–,f¿f6r•\ÒMg<hÀFñ<²\ä<\Éü×‡ðaüI\ä\çø÷pœ%\Ã\èTœvcn\å\ë\Ï\'’X´’z\Ñ=+\Ù†‡_e=‹\ß\í\ë?\íS\ÇX÷W\Z\Î8\ÙÕ‰\Ú,5½.®I\Ù“×š\Üv…ì…•ö®l\Ù\ã\Þ\×1ÉƒÃ†6pY>^ª‘\ÎÐ²‡i5&Ï²²þY\Ù\ÖW\Ùh\àŒv#*\Ê3˜\ÛI{5\ÝÄ¸*\×n2¬³AŽ6+\×A†ALÜ›¾\ï7N]\Ç\ëvª§‘»\Òpc\'HÛ˜\êM‰:|Àg\É|kœÿ\0\Þ\"\â,\áøkÙ—Ù«xCU§9v77\É1\Æ]\Än–ü2d\êƒ­JÁv\Å\í™Å–û\Þ\Ð}¦sü2\Ü#VWÂ‚\ÎY‡OýKa­£\é#\Þk\éþ=ö>ö[\Îxg2µ\Ârð\Öp\Ù}û8,\Õ3k…,\Ü$N·«\rH$\Øm\Zü\æ\ã\ÌÃ·ž	\Âf8®2\ÎòkðWZÎ‹œ[[—\Ê¥­Y¶ýõÀ\ÄžPk.&\ÌD4œ9\Ø«.–ˆl\ã$|•ºweº@õ\Í\Äòûs^î˜«ù¾Ã¹\Öo˜\ã3Ø›÷\Æu›\ç\ë\\@«)rö\"\éb)+\Ì\0\Äˆ0\îžË‰¹™qþW‡ko¥\Óó;dHV$\×\ÇyŸny…Ûƒñr\à]\ï]\ï]Œr\çpòª,Om<D˜Ö¾™›^\rgg\Ï\Õ	\êwô®4ô°\Ô89\Î7çž¾ßªõ;GŠañº*xcÜ½À ›_P3Óžšœ²_hbx³³•\Äþ{Jµz\äÿ\0¥\Ãß¼Ç§Dóª\Ü÷´žÏ²;\ãólÃˆm\á\í¡v\Ä\ÝÈ-…Ì³ƒyt¯”3¬\ã\Ús‰2\î\Ëø\'1\Æ_\Åqbb¯\åW±¹™L-Œ‚\â1º\ÕŒ«,\"C\0ˆæ¤ä½¹vwÄ™fY\ÛF?(\Åey\å\ÖL·ˆ°Með}\à 2µ\ÛJ4\è,º\ÑÀe\Z ‰c0H]õœ}HLsqƒD‘·û7—\Ô]~œe¼	Š\Æ\á-b\Æ`M›¶–\âNÄ©\Z†\Þ{Š³\Ãð*\é|krƒ¾õ°\î9\àž\Øx`7\nqœ\Ç–aðö³”\Ë\Ék6/µ±*·#K	—H˜š\ÝY\áŒ°MÛ·Y¶\×Ÿ…y°ú\È%ton\é‰_Ok°\é©\ÚöL¿u‹7c†0\Öü‹iþ{\Ñ\Û%Á©¬°˜V–\ÖG–\0Ca—}ünO\Ãz•k…³1†U6\Ð6øÒ›I\'2:¬òmU0=\Ð\ã\è\È\Ø\Ë±·‡Ã¹\è<ºõ©øcz\áI‰c÷«³f\ÂI@!¶>ó\Ën”Qc½\Ð\ÖùDN\Þ\êchXnY_µ“‘h\â\êV]83÷¹	+±cô¥Z\Þ\ä@¹¿H£¥*sh\éˆ\Î\åc~\Ñ\â¯7\0ñ½¯\Â+Ë¯?.•2\Û`À¤\r\á?}QaÌ€n;w€l¤ó\êM»\"\éV\ïX	K1µ°\Ô8s+\ÕEƒ4]\Î\Z\Ön¯Š\Ü±$\ÈßXa\rv\\*Iˆ–õA†°ÌšQÁb°\î¨«,\Zb¬\éR¥3¸\ëû\Ög\Ì\â·.-yýÍŒ5›ö‹\Ô‚Iÿ\0Š†Á\ØcÞ»‘¸cÎ«0®Ì„… ‘ÈˆŠ²°\ìS\Ä\Ä÷;oYŒ†ù•]„³@µý›öC\Åý¯g—xo³\î9†*Í¡~\åµ\Ä\ÛN\î\Ù1¬—eð\É|È¯{\àŸd\Íû(\Åd×½¡2\Íó\\\ë\Z,e\Ü3\Ãö^\í¥2%±\Ò\0EQñ*€\å^1\ì\ÌpýuÈ³¡\\\Ä\æX[xÀ\ß\Ãbt^´½\Ë=\Ä5V°ºXÁ:z\Ö\ã\ÚCÛ»Ù¿?\ì›(\íŠ»[¹Á–l½Ó‰\Ê3l#>`÷\Z¬¦jºŽ…EÆ•]\âk\ÙlþGWI\ÚKw\Ü\r¬OtõmJøŽ\ßm&\Ñá˜©\Ãbw\n2¾2ó¾Y‚2\0\åª÷\Þ/\ìw€í‹†{A\ì³*\\–\Æ[“brœ\Ë,\Ê.>†,.£^´‹\ÅQaÁc¼+\ç_m?\âCÅžÊ½¢\Ú\ì\Ë+\ìû$\Ìo\Ü\ËøüvqsM¢\Î\ê-µ¤Pui@\Ð[û‡¾¾(Ì¿Ž_ð²\æü3\Ù\Ç_â¬»wù~3´m\Û\Ç—nk¦\Û+]e\Ü\íF\Æ|\ÚW´\Çj=¡go\Ä<QÅ˜lF%\Ãw6,Z!P0«\Ó\Þg•zÊƒ -…öpµ¬2ýú/š\Ña5sTñj›po{œ\Ï\ïû¯¾;@þ1>\Õ9\í»\ëÃ¼S\Ã|<ª£Ç\ÈK˜iC^7%½Ã¡¯\ã_o_jn6[;ö’\âŒI)âµ–1\ÃÛ(µ\ÝGÊ¼\'\Ùv\Þ[\Úh2¾\Ðx\Äá­œ;-¡l{²…%aˆ’<\ë\é¬\'³\'e\ç\Ø\Î/È±cñx+˜l‡¾ÏŽ%±ø»¶^Õ”\Â\Å\Æ‹]{m+!ð‰®oe¬‘»Î’\Ã\êº\Ï8u\Â!\Üm ×ƒc¸\ïµ.\Óoƒ8\âõŸ`·ob1w§÷Pq™v¡•†½˜ð–/*³qw™\Í\Ëx\å$\Î!’:×¨ðð\ïö¤~\Ë2.\'Í³¬{—›3\ËG”\ÂZ%¼%m\Ù\Ô‘\ÄˆžU¸\á\áK—Y\Å\ÛÌ³Ëœ=eˆþ½»‚þ=œ’&M\Î\îb6ß©™®i¨\Â#\Ò\ÔKŸ\Èé™…\ã/ql4\ä\î\0\ä~«\å\ì~W’\åju\Ú\ß	aYˆ-b\Î~1òÁ¥\ï•2¿ÙžI„L\ã9\ã¼\ç„/Ý­ì§„\ï÷w†:\âšÀ\ä<¼\Í}\íS\ì_Ç½„v{kŽ;\ál½«\ê3\Ì‡Tb,\Ú­\ëhŒ\Ì\ê€’6<¦<\Ã\ÙK²ÿ\0ik.\ØrL›´\Þ\Å\És‹Y†|3<“¹\Â7u$YP\ê5»ŸQÑ‰;S\ÛS‚šS;p/\Ê\Úr\Ìþ‰N \ÆX\Ø$n\í\È\æKù©\Í^\Òù—v\éƒ\í9\àû¹\æ<3s‡¸0\â\Ü#¶_d¥\å¿ý[ nò\ïz\\©ÒqI:Pµ}W…\à>\Âûz9\Â\\]\Â9.uf\\M{ˆ¸·)\Ëñneø\\=»iÅ¬%Æ³b\Ù{Ö­¢\r\ÈbA\nc\Ýóž\Í83Š8[ù‰¸7*\Ç\äÊ‰le8¼·\Ã\"¨…l®•\n9DG¥?‚{:\à\Íò±’ð\åy2\Ãe¸$´´\ézó®›U$´oˆGbr\éþWple$Xœu<~\ëlH¶¤z\é\ç\ÍXð\æI’p¾Uc \á|—–`0\Öô\á°Y~lÚ´=@\0|*]µ n	;yùQm\Ù+n&y‘þ)\ã¬?x\0$ó\×üW—&có^¿~†=-\ì™\0øK@ß§*z\ÜV*†dˆ¾ü\èöp\è·X*#rGÖŠ¸kF-¨±þ\ãhm>—J\í4#’\0.‚¤\Ãl\Úgxô§¥\Çÿ\0\í¬x·I[\Ð6\Æ\àD\ë\éN\ÓhÁU@\æKù\n0\Ù>g$šªbrm\Ô[Ku®wj­%·][z\Í*›\Ý6Ÿ\Û`‘3Ö•\Þ\ä\ä³3O…‹\ã|?\r³’«m•\É\ZA_*´\ÂpÞ¡0Å\Ó\ÐV\Ê\ÎG†”\nšW–\âjE¬‰%…µV¬Ž¨q\ÈõQ]NÑ˜Y\\\r\Øb§ð\Í\nL\Èú\ÍY.F©`\Î\rC\ác\×­hFNŠž6\"w‚y\ïRS*x‚¸`¥/ˆ\íR\Î#\ËeIo‡\í)\Ö±°“µ&\ÖI‡,-s¨iûú\ÕÅŒ¤\ê,ë¤\ÐT\ËyM¤^\í ?2iD¸”“‰†üÁQ\â²\Ø\äXÌ¯‡8\×^\ÇZ.\æYRY•³ ²£Ý¶\á\'H–P\Z6I¯.³ü9}—skg<SÃ™\Æ}Žf&\æ+8\âLM×¸\Ä\É&Fä“°v¯s·–Zf†B£\Zy˜©6ðjt`Ì¦v²<B¾D1\È\à\Ýl\r‡²óõ°aU•F¦V5\Òñh&\ÃA˜\Ð/‘=´?‡Gf˜Ž\Éÿ\0™}œû1µƒ\Îò«\Éw€Ë®\\-\Â\é!•U˜\êuÙ¶\ÜÁò¯„²È¸÷Š¸ª\Ïp¯\ß\Æf¸œ@±k	‡F\ï±ˆ+\Ícy&\0\ëûeo\Æ\áºn\Æ\â9\Z\î+\Ëp¸ƒŒ±„²—XE\Ë\ÉeC¸\'}L7?]š£©¥§1½»\ç‘\'ó½î¼–\'³\ÔÕ•\\XŸ¸9€Ü½-ke‚\ìÙ›²\Þ\Íû\Êû1\ÇðItþSb\Æysòûù·Åµ\ï.3D±/$}\ÑVŸû6ö\Ùfoü\ÉÁýŸapù™R¶±÷\ï\\¿vÒ·\ê\Ú\ë1@FÐ±\å[E²†\â÷‰¿ö¨\ÞI\åE·mH	¼\ÌGO?J\äB¨‡\ã\Þ\×3b¶ü:Œ›f\Ý\r…ÇªH¢\Í\ß\éj\Ô9Òl/…BI\'ôÄ‘\æk¶\Ö\Ú0Pf\å\ÏoJ\ê–\n¾<÷ø\íI3”f\É\É\ÈU<vù‰ƒ\ç\ÈQ\Ö\åû„\ë¸\Ä2•‰\Û\á÷Ò‚\0zÂ\Î|\æŠ\Ïr\Ð/\Ëy:GÒ‰³¸òYä‰ x“õi °\Ô9–\ÛoJ~‘œ\ÎÜ¾æ„¯iB›ˆe|‡\ÜE5q·mZr\Þ2Aù\ÑñÍ–wR‡\ç™S\×N°AhÓ¸\Üû©\Æ\é,\Þ\ëÀf«\ÆahCi¼&ALùPñ\Ù\Ý\ËvH\ÂaZFÊš	\é\çA\ÚòÀ\Òr[»bÙ•’v#œ\Óÿ\0.¨P\ä•\0´\r\ë\'ˆó\àÀ\Ù\ËØÐ¬•\åQó2\Ï0LE\Ì\È\Ýôò(\Ì\Ö\æ™ð\Ù\\\áº\nÜ¦-²\ëˆ\0ýk‹™\ÙT%œÿ\0\ë\î+\Í\Ïk\í6œl#j\Ü\ÇJ\è\íS(»o¼lHb‘\ØUÆº{py\ÈÍ¤/G\ÆË©7fw¼Ò¯7·\Ú\'bn3>km@Ü‚\Ñ©|yÁÉ©\ãŽÙ¸ô*žÕ\ì¾\r·\'i\Ú#\ìT›Vÿ\0\Ý \Æû/™¨öq¡LD‚D\Î\ÔU¾u\Ã@:ö\0þ\Ýh@j\'VU:\Ê)=\ä,nF\ã\ïj%µFP¤\ìþé¨‰˜YBKV©Xš\ãf\Ö\ËvQ\çó¡\î\ß$j\Çh­P\Ü\Ò<bs¿J(F ²\ÝwŸ\ÜUUŒ\Ö\Ë(\"`þ¢-ý~{Y’§Þ¬·(\Ü\Ô%¶\É	5š•>\Ù\Z\ÆÑ¹\Õ14T\î\íp¹ŽL#˜ªûx°@c{H\Ãc\×Öœ˜\ÇV=\Ñ\Úv˜\ÅP-@dªÕ¢»º\éD‰\Ø\Ì\Z-·Ð¤;õ\ÜF«-fWRÌ†mŒ1“¿\Ü\Ó\í\æ7C˜ \0`±~\Þ\ênA¨U¥¶µ¯½`„iV<¢+­‰W@;\Îm-÷\ëP?®u\êä¤5÷*zbs\à;Ù‰¡4”Þ”øŠž˜\Òa`•\Â`\È4ñt:&t´¸\çU‰‹¤™3rô\ëX»d…$\rG˜þý*Ëš\á8\æn¬\×oÄŠ@˜I\ÜE<b#RŸ\Ó\æªF-¼\0mè©Œ\r,Ln\Ýô¡\âX+\ì\Î:+EÄ‹–š\0_\r@{\é=\ëv\È\"\n\Äj¸\â™À\Ô6å±’v‘N7®\Ú	\ÓT­\Zé¥\'5cgA\r¤‚ lH\å\ë\\´l‚F¢\"tm3Q\0•ŠÁ:\àô®)Rõ8ž±@e\ÎÉ¬ƒÌ•)\ÒË“\Þ\'.‘—\Ú\Ä”\Ô it\åd \ërgh#\ß]G·¡”» ø\Ò€Vø\ÚXn&e\Ù\Þ[š1\Ä\Ý[dÁ\ÓÒªq]\ànR\â……ùMl\Ë[\Ñ\ï5ð€zü\èg…\Z§±\È\ÃHó\ée\äîº°\Ö\Ö3 }—›\æŽ[mWÆga\Ë\ì\ZU\èÿ\0ˆË‚\Ë\ÞE+\ÖD™ýôªƒ\å\×M¸½X1û/0{\î\ê\ÇÓ·\êó\ëÒ¤Û»dÀ\Õ\ÒA\×Ö°vûG\Êq­û\ÐÀÁ\0\çRGex†0o\êD/®\ß®…\äE\Ïø$\Ü\Ê\ÛØ¿eSM\Í#P$©3#\ïö§Û¹lÂ›ŠI%\ÕÎ±¶8\Çð\éPDG_\ßJ°\\ÿ\0ti»u¤\Ì}\ï½%òH3²±‚¼\ÝoE¢lM¼:\Ð,7\0\nñ6]† 1A\â3\0{£öªA‹\ÊqF)\È&\"i.I’b\ÓU\Óvr\Ì\Ðq\È„\æ`ð\ÏB®“Šò{‡W\ã¨$\íÊŽœE€b/.žS=\"³ß‘ðöž\ì›\ÆN\Ê\ëGüƒ/¶[¾ñ0ZGÖ…Ó‘¢{pœ<ž‹F™½‘h²\âS@Ù‡\ê\0\Òü\ãr\Ð\×u$oª¨­\äøw„^\Zsf‰>ú’™f×‹¼´A\å¨\Ï_*I¨š?…\á\Íù½‚¶|\îÞ¢¦\â%¶Ÿ:zq—UŒ`žBb9}üª”al‡(Àƒ\â-?:zÙ±e\ä~Q0\Ø{\éfi-k£^m?%v8†\Ëÿ\0ù@•\êÿ\0j_Ÿ\ØC6\Âv¶}õSo¶­1iŠ´‘1¸£\Å\Ó=\ÇC¯xU\Ü{ª¸²rQ|.†\Ö¿\ïè¬“?\×sU«$ˆ\Ù>ýi\Ã5Å™{X¬`‘®\0>uVœM´\Ä3ƒÿ\0ªƒ¹£\'YARÀn4);Gº¨\È\ã\ÍWÃ˜\ÓÝƒÜ©öóL\ê\é\î—/9x÷\åD·‹\Ï\\ø,(;½W)\Ô\Ñc	u¼3:dLz\×‰1\åõ6	„·#\×\åBd%0Q<\è´+±ˆ\nÀeG)’E+œ´‹¸”X;\ê7ª{y\ær7·`…#Â¤Âˆ1ù\íÓ¥œ\Â\î^\Õo‚.‡²JÜ¬À®F6f\îŽ4€&w\ßÊ‰ùN$iG\ÌI$\í\ÕB&op“w\Ñ+ª1\Â\àWÄ¹þ\ÑK\â¸ \áJ>vôV«•[\á±m! 	\åEvL5\â\ÐwýõªT\Û{\×Y”Ä³À4–\àÃ‚\ïq˜\ÒUñš®„xý•\èÁeÁÿ\0ª\0QY¹ü)U#\æ\ÖU4\ÔL»\ïJ§\Ã\ÍAK)\Þ+Áð\ØL\0\í‚\Ó)#A&}õcf\æ\ÚwË€\Ô	1\åq9(!F4•;\Èq°\n•‡¿•[VW\Æ27?V\ß÷]·=ÀfGv\Ìô*U›¸tC¯l\ê2\Þ©¸Eƒ‡µ²ø`À¼ªbr\"úó’Khö±\Ùm´\Õ\Þ[ý;‚zyR÷Hƒ)G\â÷S,\çh	{xPcrTTÏ…À¸f<À*v\ëþõ\Îg]HªŒ\ìPõž´_\Ï0\ê\Ý*sŠY¹:&R\å\Üqê¤®uq\í¦À’T\0¿~uÓš\âœ\ée\'û€\'§ºo4Á8\0\0<$™H3Òœs¬(p¥÷+3\Ý\ÏM\Í%\Û\àÜ§´D2 c±÷B„¶yxF¢9\Ñð\×ó\×U.\\Ò«\'Õ£\ßQ—;°³l+´l\n§9§&j]uY\Ã\\R½tô\é@/{¦i¤H÷q9\âM·’H*\0úzÓ–\Æuu9)\n`‚\ß=¨I™\ÞK½\ØÂ°eŽ\ÓFµŽÅ¨$[\îÀ-ùš~iœw5½Ö´}lˆ˜\\x}^¥w\n\Óÿ\0U2Õ¬È®¶\n@\Ü\ëð¨IŒ\Åž* 5fX…Ql73B\á\É%õ3“ò«XK®Gx–\äò©8{M®Y\Õb\ãiõªtÌ®˜P\è$óÒˆù¡rÊ·­£Pq¿Ç¥,‹$¸Ô¼fB»ø¸ZC@’9Mñª©\â¼	˜‚*‚\Þq‰þ×¶T\Ä(iû\åô¤\Ø\ë¬M£\0±Uv \ì\ï:…1L¶õ§\îLs§Œ]°½õ\Üÿ\0òª¹x 71\æ€@¦\Üü	¸R\î9½\ÍPL»WôDs)oB¹\ßƒ·\Ï\îi·ó\Ü-³ ^Nû\Ö~2\Ø[\×/´Ai&h\Ø|nQrm ó\îÏˆ\Ð8[0˜ib\ä\è­\ß=\Ã\ÞPm‚À\r„s?½+x‹˜·ðá™—I\Z\"«\í\æøuX±†É‰\Ô{¹¥ö ¶)P‚?A«¹(›m`-õWƒjÛ‚\Æ\Ò)Ù‹\îA=)U#fXdpq8\ç¸yª†€w¥Wºù3\ÙX§˜\è}¾\ë\Æu•¤AQ·‡qÿ\0ÞŸùöX¡B\é´r¬B\à­k\ïZþ Dj“†\ÃaY‹;²M{SH\Ëj¹\í14]\Ó-Šñ.\\·\rÀˆ0¦#\Ô\Ñlq^\0,6\Ñ\Ïi¬’Œ¸SX`c™‰ ZÀ\Ù\'ús\0–\éÓ•(\ÓFFj(\ÆFBz­SqUœ<²º4\r„ó\å\Î\Ï*’m½²	\Íe\ì\ßÁ#jµmH\0˜;Ñ­â°Š¾‹¼\Ä¥vv\ée\Ôm\æO\ï\ê´M\Å\ì\ànJ´–÷ó§/^¸AL˜*7ù\Öz\Æh±¨\"r;¨\ØzúQÿ\03µs\Âq\Ï\çJtK&\nª^M=U\Óñv:\à6Å—b7&6ùüªSq.nÈ¢Õ“¤£o1\ï¬úg(—\r\Å‡¨ÿ\03\Öuu-¤B’?h¥ðy\î¢tÿ\0õû«\ëYötu3X;“\Ï~›Qpø\ì\Úô¥÷\Ò$K1ûš \\ð!Y\Ú7=x‹\ÖB[¸\0\0Ï¡\ë±\åIt\äXÀ;¬B\×q­p«\ãB4\É$‚\r.\êõ\ëUX\Ï.^\â¨z\ÖB£\Ü\ÐV~T;K^d*Š<ö 4\î#$B²_ ‘m\Ù\Ð\ïñ@$žsGµvÀ`ª\ÆA\æ€l\'•eGøE\Òûiˆ,)ƒŠð\ÉsIÄ«L\ê±ôø\ÕvYF\Ù\ê¤\Ó\Ø-ž«l—¾\æF\ß:\'\ã\ß\ZG\ê\ØSœ}+o‹0wR]ˆm€\é\å\ï¢\Û\â\ÛÁt\Ú\Â4\Ä\rf$}šJm¢!Sµû-‘Ì·\âA\Z¶;ú}ô¤q\"\áM”f²)žf7RB‚¤ˆ?qÖž3,k®§\ÌQg`³0(\Â\æòM\0Û½\àzý–˜\æ8–¶q\06F~\\ÿ\0z#9Å¬Û·Ž\n\ä‚w\éYó~ê¾¶\Ç7Y÷\åDµ²Œ\âÁ\ÙOZDmu¢1D\Ï\ï\èUµ\Ì\Ë8¸\Â\Ú\æ$A4ý7§\Û\Äc]!ñ\Ä\êøw1\Óü\Õ~0\Â\0gõ\ÎòyŸ*w\æˆ--°\Ü÷‰÷}ùPº9\Ñ0\Ô@Ì˜\Õi†\Â\Ü\Ä11¬Ä®Å\ÞÔª¯óg	\àp<Q«WSJ¨A\'\"‡¶=xM¾\"DºCt3±ÿ\0e\Ï;´*n«m˜s\è)R¯¢ð™eóf8’c=î¿©®IOx Hþ¦\ÛÀcÒ•*I—)éŸˆn\í\\òò4O\Ï\í!\×Á\rúgº•*£wV\ë\Ú\é\×3ûv‹(q¥€\0t$ò¥kˆ‚°¶/\'}\ç\ï­*Tž4ö9\Ä\Ú\èËŸ)Rº\É–¡\ÊMux [¶Hp¤\È\ÔO?JT©<&KdM\Þ9”jNñv;xA\çÒ†8²\áÝ´b\îw\ßÖ•*£O\ä»\Ò\Å\ÍqxŸ©UQ†Ÿ\ÒÇ¡ò>”E\Îq\îºnc\0,±\0ÿ\0\Å*U1¢DõN§qh\è’\ç„\\õ‚ ŽQDµ\Ø[¡’\Øn²Lþÿ\0{R¥I1´”£]Tì·ºd†\âKv¦\à` \"74U\â§.l÷žA€d‘ÿ\0t©Pð˜y+\â½\Â\ä¥cŠYYm\Ûo\Õý\Èds¢+!L\Ôi˜\ë½*T\Ï$bG\Û\\R\×$\Ýr6˜\éÿ\0tD\âp\ÃY¾vt©U:š!\É[$r\çók‡.øŸ˜§\\\âËˆt­øR2\ÛrúR¥@\Ø#òF%u\×™o£ŸüÀ@X`?jT©Q\"¶‰\í‘\Ö_ÿ\Ù','Keith Richard','Limbo',21,NULL,'09386508693','Cuenca','Helo'),('U0002',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0\È\0\Ä\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0G\0	\0\0\0\0!1AQa\"q	#2B‘¡±\nRb¢Á$\Ñ3r\Ò\áñ&Tcs‚ƒ²\Âðÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\03\0\0\0\0\0\0\0!1AQ\"a2q‘¡±\ÑÁðñ#3R¢\áÿ\Ú\0\0\0?\0öS\ÚB\0\èœ5™¨\'s\Æz`„Fºbe|\Çx\Â¶`\0;QHÜž¾°\Ý\Ùô\çxb\ë\ç$\æqòN	‚¤…°ry\Û?Œ&\ì\Èu%µt=w†%\í±Ÿ\Æ2—UŒ‰IO½¬\ì\0o8ac~Xj•gÈ…†N\0=\â)¨§	qJû\Ý ÁJ^\à÷‚²Ú—¶ý!\Â^7\Ú$\Â N\é7W\Ø\Â*`\ã¬?q–˜h¾ò\Â‘•-jÀ3ž¦qÂ¦¸©MI\â\"Ï¤L\'\Ê\ÌWYSÛœ³A*\ê<¡J.s\ï\áMœ\à\"Ñ‘‘…+\é8\à¹:iôþ+->¾qMóZ@‹Nu÷D5ˆ­:U«V\íÂ¦G\×\"‘Viõ y”¤\ät0d$\çR&‡\ÕJpp~Ÿ&;~Pº†\Äc\ã	´2%\" rL`\äQiW_X*\ÒzD\ç¹\Þ FT\Ü| ¸\îLD\Ò!¬ö\Îð	\à¥DmùÀ\É\"\"8FO/q\n£\Ã\'9ùC|w0£eYÁˆ‘=m™U\'%„|\Ð AY*(\ØþP\"J[\Þ\ÂN<¶{\Ïc\'\Ò¾²·”k¦?¤Ej#ÏŽÀ\Â+pc¬a\Å\á,žH‰t\å*	W\\Â­ ‚sŒž°\á”\ç1ˆK´\Û˜w.\ÉWSK4V¨¤>‘N9lþøš\ÔJ’¥\æ®*‘T¥EqÀ\Ü\×.KŠÏ„\Ø÷\Ö|°:¨B¹Á¢J€T÷ˆþ+t„{\r\Ûÿ\0\\¯\ÉZL²P}–O˜.nuÀ\Ã ó8¯€À\êH\å¯¿´_­÷\\ü\Õ†{F“f\Ò”K\Ök-¦z¢´\ç\á9ðZ>˜^<\ãÏŽ x“Ô®!\ï\ÙýS\Ö[¶n½V›p‚ü\ËÄ¡	\ÎÍ¶‚;€<¢¡¨\Õg&%\Õó„\'ò€\Ö>§¢»”\Ú\îdöó\ê¢µ—þ&5¦i÷u_n*\É(\äZ¦ªk\ròù%¤” ‚bŸròT\Ó\æ`UV·Õº\Ö6?ŒB\Ö\ä\Ê\Ò\ã! w\Ä+$\î\åÕ”(gr”˜½¶\ìnSŠ€a \è¥*¯\Ï86Cnry\'\ç­MW½,:\Ò.\"ðŸ¡O4r‰ª\\Ê™Xù¤½:DMÉ¢Z|‚v÷¼3qO©\Ü~pC\0J÷kÃ²ð³ôõq©¡“T\ÍF¸¥õ\Üdò½\'_h&p7ü“Hy¹\Â\Çhõ{‚Ÿ¥…®8$Ù¥\Ø7H¤]*eK~Ñ­:”MŽ_´[?e\àþ\îø\ê|\Ó\ÊO½.p‡pœ÷‰Þß³öµ\ëN¹¨5‰Š}RBeS\'¤Ÿ-=,øû¥c§*°H\î\à–ˆXÂ€iÿ\0LÇ§Oüù}\Õ:ð¤X\éú\Å3À¿ö\ïü>\Û÷Få¤› I%›–—)<Ú–\Ä\Ú	B\Ô[\n\æJVRT\\\ëNñJ€‚“À\åÀ\Ì\ãÂE$\ç¬DQr	Œô \0$žñ® \ÈP\'¼m)\Þ\"Cºv\Ê\È@\0@Œ6’LYj	gÏºAs\ê9${2¬¤ŸH\×<\æs¬H­g9õ‚¤Žb\0Œ-`\äf\nU\ë\Ö\"‰d\å®\ß\á«X=¡Ô®\n\ÆOHˆ)jµf›mP¦\î\Z»¥¹I	G&fœ	$¥¶\ÐT£¹Àhù\ÎúR¸\å­q\ËÄ½CQ\ïIZô†v\Ú4Õ«v$Ò²KŠ\ÆÁ×—•«\È\07	\í\'\Ò\ã«W~p~VlI·jU\Zx¦‡$\ÐI–—}A¨²”³\âe[c\">mnš\ÃS¿*Û™nMdœtR»œù\r‡ýb¶‚ú±\Ù_MŒ5À):\Í]*w\à#J¹³Ÿ‡ÿ\0·†:•¹\É\âsp}b3R¸Ýœ˜S…£¢R~\î!\ÝU*\Ó\"ZE…$,{¤\ç$\ÆlŒªA5´©\"SÃ•†2”ý£\Øœ®te´;\á«8$íˆº¸f\àˆmð\æ\éÁ#&\é›žB°¡\è\0Ê¿H\ë»+\è/ª\Ôešš»\ïw\Ö\áPñD´‚zsúÆ²·µ¢bg\à·ö\Þ¿¬\Ð\çC\'þF>\Ûý—›nSj¨QöE—6Ê”6’‘6´ò\ÍKr\í²‚qùxõ\ê\Êú\rô\ÎVh*¯W¨8À\Ç\Õ)\àJ½I\Ç\é]»ô3p·Fyª„Ý¡\í¯6y¼)¥’\Ù\Ç@@\ëgŽ\Ó?e²\0y«·\ä	þð\ÌS§9ÒŽzcxVV~jBa/!8Z\Ûc\Ücú.´¹o9)G\Óy:d\àÊ™Ÿ§§\ÂR6b\n|Á\æ\Ï\\)Søxš•¦Î¿(\ä\ã\éS¾$ª”GDŽUt\'ûö\ÜjzÂ‘i¬{\ß:\Þ\Õ\Õ\é\ÕÓ’\"\äªÃ‡n\'õG‡MF–\Ôý4¸“¨²ðR¶+RNA\È\ÈøI¼(k¬\ïún\ë2$›§¢³Nm\ç$pV¶\\)À¨„‚3¸!8\Ä|´R”À\ç\è<£\Ý\Ù\ÂÕº\Å\ë\ÃÛ§µË•\Ù\Õ[\"BQ÷Ô³),ó$„¤²‚´/=s\Ò7\\™`RôA	q$‡Uò\Æ +sˆ:¶‚(\ï‘òŠ’,\çc\0ŽØŒ\ç} Ÿù\ÄDJ.6\Î#)›¡ŒH\Ëg&\"„Bt\Ñ÷O\ã0\Ù “ùÀˆ†_V\Ø>Q®u]D<y^\éß·œk\ÞV	\É\íX’Y\0o\'\'¤d÷0P¢\"(2 Œm\ÖJ\à+>°Å³\î\ç¾a\ã}¼\â\'*ïŽ«Zbó\à¯Um©)%L=7`\Ô\Ã\'ZÄºÔœg\Õ#ð”\Ê\ÝI\ÙYYâ´ŸÇ‚BH\ï’wü}…³*\Ì\ë\Ç6\Ò\\eÔ”8…Œ…$ŒA\ë´|–ñqc\É[H\ß\ÍMm\É\É\Ý\Õ6%ËŒ!¹—R»l\0\Ä\ZN®°®\Ò_D\ÐþUGoÊ½Rš_6\á	%yô\ï\×ôfð8­\\ž”\Ô\ëò›\ÍK/òRi\êNL\Ñw; vóøG+è¶•Tn\Êõ*\×2‹B\ëUv¤\Ê\ÏP\n²³@“\ëð¥4-:´\ä$\äd\Ð\Ûr’­\ËÊ€’”¤\Ï¦\ã|@¶(\Ó;\ïð]g†ø[Z\ÓuTm\îƒ\ÜõùÊ»´OG­\Û&ˆÄ¬­5¤6R\0H\0c\áG²2„ò\àô\"}! Pw\ÇcA<\ã òp…¿~²\é)\ãm!\ÂF\Þpb\0P)\é\Ä7i\Ç¬œõ\ßx\ÖV¨¿¼Ÿ.Š”ód\í\È\Äú\ÚO\à’\"·’\ìJ\ëþ¦Z:_bN\Ý7eY™9Yv§ãƒ˜€7	©8\Ò\â¹\ÅN®LN[\Ô\×Ý–ö‚Ü£M ©K\ì”\Ô\íó>C¤{¬Ùº´ëŠº§\çfe–’\Ô\ÝA\×R\ê\0RŽ~$œv\ÄCl¯£\ã‡}&ª¢·CµX\\\è\È/º\Ø8Oð¤ò>ç¹ƒku\ìõ¹®d‘¶p¯¸´£ui\Ê\æÀ>ô\Ç`¼‚Ô¾õG4¾Ÿ¨›)—~¦µ\äÁ%M c©éœž\ÞQ\é§ì¼©£ejÿ\0\Ö(º*4Œ‚6	ðæ±¿Ç´9ú@´JOQ´n¡L“–@zEH\í¶\ÊO¦R>[D‹öi\ì%[z!ªUù… =3xJ\É)°w@bX«‰{òŽ£…\ß>\î“\ÅC\æì¸¯ð\ÚE !„G|\Úô¡g®\ÐU}¨Ê¶\ÎðE\äF\År\Ä#\ÌGa\'?Œœuˆ \ÝaA\0¾p™óóŒ¤\ã|À;\'\Ý;k<ƒ\ÝÏ¬#y\å\'\ä`@ª\ÂFaD$¨Æ½Õ’O–!ó\ëO†#^\éHQÁ\Ø+:$V£’Gh9\Þ0\é\ß?Œ¡\ç˜”\à%šQ w\ïe\Õ\ß\×x`\Ñ!@r\ìOh},p Ÿ\ÒBL­\Å9{$„ô;GÏ¯&I\ÊñÕ¨²Šq?[|\ÔV\ÚV\Ö\Åx\é\ÂG£»| ‰#\ÊR€3sñ\á\Ã%\áQ\ãN­}Smg&i\Õiy9\ÔT&L¼²],¦]Lø«RR\\%œòý¢1˜\×q#U´fžþ‹y\áú”\á¢#¯¤.<“\à8\é¬Å…©¶|º\Ý]®\Ë\ÕVºœ+!Jø³¾¯})Z%\ÂýU½9³UúÄªG\ï	jj\Ò”8\Ï*Ö­¹ÿ\0”g\ßž°q±b\é\î±1\Â,µ}$\ÝLª¬¾_c•.2\\l$\'™Ç—Œa!;’b \Ó\ï£Î…^­šbÐ£\ÎOOL•95yN¸9\ÝR²V¦YuY\É9!D?(\çYn[PT»$\Æ\Óû’\í\ßzË‹r\ÛR“\æ0{}6õSõ~\Ð}‰Hð\å\íŽ+\Õe!°f	©¡¶\ÐO`BTO\Ç\0f:W…o¥\ãB8€—š“¹´ú¹gOI²—\\n¨·N2…¥#›gm²H9Ž_žª\è?	u™kJ£~\èrbQ·ƒ\r\Ú&o\ÅI\ÉO#ž \ï¹¤YZspj~«P—vi\r3I¯jXif”\Ì\Õ9å ’O9Z7Â†v\ìc& ¤iƒI;™ýB\×Ð©E\Þw\×\Õ\é\ä\0Ø•\èe.µo\Õe9#:Û:B¬‚”k/]B²lZkµkŽªÔ»\r6§¥nBR2H\ãŠ4sŽ½.\Ò\Ë\Ò_Fµ:B\ãµ*sL\Í>‰J\ÄÔº\åY,%*q ò–€	J‚‘\Ô(ŽvŸúþ·8›»\ê\Öö„Y\Õ\ÂrJyro.«<\ÛR>\ëhZ\Ü\æl¨‡ˆ”\ç˜`\0¦Þ¹`!Ÿ¤\Þ\Ój*–\än ƒ÷\Ùh5\ã\é\Ö\ÒK&«1n\éf†\ÜW7³‰‰é¥¦I„yAQN{>qP\Íý:È«¤¸2®\ä…Ö¹\ÐGq€AòÛ¬oµwX\áª÷U•«\×þ—\Øó\ï•/÷t®žLTJ“y¼E(…\îw8\êbki\éûú¥¦ú\ÇC\Ô\Û\n£D©4¹–f¦¬KÄ‚R¥¤…\ì A ´X\Ûv9žjdú\ç§\ÉSR\îÖF\Å\Ì\0òÕ´yºô\î¥nº\Ù<T\èü\Í\ßd™y–Jg©³Xñe–SžS–’7J\Æ\Ê k}ö{vö€_o aSwó‹XòÄ³@Ÿ<÷\ÌQúI¢µ0‘¯\ê%V†šD£n·3I{\r²\Û\ËPB\×.T…ƒº9\Ê„Œ\Ç@ý·D•\Ñ\Ã=\ç3.\Â\ÚvWSj2s©\\\É\nm¦\0)=Á¸\Ú2x]Ó®\çt…‹\â+š/±\äÌ¸\Óüº\ìG¤\ä\Ö\'|bšP* \r‰\0“¾1¾¸…žc\×9¶;~q…¨\'´œcˆ¥Œ¬“\nÀ‚óŒó ¦J¡\Ì$ A\â@\ë\"B$¢L)A¬wø\Ã\Îr}!\äÊˆl8\Û\Ò\"tB£\Óñ‚•\Øù\Æ\n÷\æ\è sùˆJvœ\'\0Çœ?“\ÝAQ­A\Ã\é5öùAJw\\ó\ÇF³\ê­P§i\í“R2H™•3S¡JIRyˆÁ(!X\è\É;ôŽ0\ãŸHÎ¢\Ò(we\å\\©\ÏM\È\Î\É%Iz®û¬†Š\Ê´¶\âŠ©\Îd«\É\ÉÁ\Þ;£\í5MjÛ‘\Ôi62\í1^\Í:q’e\Ü;’¿ùG$k=*±}\Ó\'—¨¸Ü­\"MÕ‰T«\Üu@¥@‘ÜŽLˆå¸§9•\Üdú|¦xvnN$j\ÔH3þ!P\ÜJð{m\ÒoW‰f®J„\ÍfY¥\Ój3ó¯x‹2o(’|ù\ãd¸Á\Þ\'Sü%W/™\'(\×Uvil¬r¸–¦–‚\à\ïºH1lÖ¬\Ê®i\ä\í‰q-\Ñ%Y¦–]y“‡*H)q²Ð “\æ‘\rmª\×zr\ërÆŒ‹É†’‹‚Ðª0Û“@\r–\ä¤Ò›ð\Öz‡œ“ƒ\Ú5\ï\×p\Æ\êv[ø[kz¾\Ì\çh`‡0\ã\Ðo#\Ð\í•T_¿FN˜ê—H³.iŠÌ”½§‘˜¦¶Ï´\Öy”Úž#H\æ\0\à\äú\à\â:N´â—£v5F’ö*]©EúD³@#•„…\â9œ$’¢TNTI„\åøŠ}†¿\ÅðÛª\r}n0½ý\nfˆn¯ñ¬\×U5†˜ð£tµ9T—–ž»¦ede\Û*N\nÔ†\Ýq\Õ% ’@H\éŒ\Åü\ÚÆŸ,»¥cT¡F³\äÐ‚wòG\Þ\ße]ý\Òò\\g\ê]Ó¯:½h\ÉOJÓ¦—¡\Ë\Î\É!i`>¾d%9S.\Û$ž¤¼|ñŸRdô[£D¨”d)—U5ª\Å1R\Í‚“È¤;°À\ÙÄ¬\rË©1lpMÃ¼‡\ÚC%§òmÉ U1Tœi®D¿4½\ÜXO\ÝH\Ù)’”Ž\Ð×‹ýº/Ùš.¥ieIª}\ïhL.f<óel¾\ÚÀK\Òo¤TÓ‰ B’’7a¨9…\Ã\rˆù”9`\Ò\ä\Ì\Æsß¯¦dŽ\Ýð¡\\Mpm§|L\Ó\ét½a£NU™£¼\ã”É–\ç9&YñB\Ð]™h<‰÷TH\Î\â6³\ZE\á\é\Õ;JdœyŠ\r*]©yr°\Óc	BR9@\Æ\ç¹1š»q/Om‹Óƒš\Ó\Îòy»^å‘™—w\Õa\Æ\\Oûª\âgXu~²\Ñj‡Áõ\é\ÎrªµZ\\ª\êO´¬\ã\à\Âõ*¹ºuc\âP \Z&\Æ}Î¿\é\ÑTÚ•¡6%AÔšÊ§&Ý·)\Ó3ò\Í.uA\âYq	RÑº\\#œòó\rŠ²0pbsÁ­…spÝ¢“\Ôý3»jR\Ó5š\ì\ÍF©,©Ò–\Õ6¥‘·*r\0\èq¼k\î\í7Ö½Om¹MW”¢\Ûv\àu·g\èT©õ\Î\ÎTB–^‘\r´\ÑP\é@QP\æ\0˜™ie÷-Éª|\ëJC\â®ô\Ê(M¸ú”žG)Œ+k¼M®ú+\ÝB•y©R˜\'€½uØº{UuK\é·5q?\ãB›˜V1Ì¤œmu:DsE-·-=/¥RŸIKªc\Çq?\Â\\%Xü‰#›(\ê\éj\å7Vð¼®÷•\í•9b¨\Ç\ÂQUœvü`¤\ä\ì \ë+Gh¹«eg›—¼ö\Ì¬yw€s“‚€« F³Ë°Y•lH=¼¡ƒª\'¼<™?VF3^\Ü\ã¦\"\'Iso\Ö1\âc\Ê0¾¹ŒŸ\'q3vNšX\å\ëð\Ì:•PJòOS\Ö#‡,òHˆ\Ön\ÛrZðµ*6\Ä\âAn~Il«=‰I\0üŽ\Ê8B¯eM´º&bjfJi/)©”#\nK¤•%IWL\àºvŽÿ\0”ZJyIøEYª|(\"ÿ\0½»¨7St\ÕN©\Ö“ñV\n\ÒB†\ä{\ï\Þ5œF\Ñ÷\r‚J\è¼?\Å)\Ø=\ìªa®\Ï\Ì~ÿ\0…\Ç:MS˜—¢1#Qÿ\0k\'\Í,\îF0¦\Ï!ý\"ë´ª©´-G#n±¤\â#‡•\è-\Å+9#Yv~N¶•<fa-òL#h\0gb9T>&5¶]h\à2µ\î\Ñ\ÍÕ¤ûw–;p»J®\é\n´Ì´«T\Ô$“.@$\'m„Cko\Î\É\\I¯ŠÓ­´ÁHK g=c´	\êŒ\ãRk™d\ç‘9;DB{Y-	9æ¤¦\î¥?4T©\Zzó›[ºÀfD•sZé†‰Rý6\Ô\íRnuéª¾š	6Y3)8qþ|„€~±½¨\ßZš\â=¶\Çbfšúy\\[s\âYWcÉŽRŸýYˆ\ÅV\è­3‰\êuNH(sM\Óo¨\Øû\ÉBõ=i°h\Ì2õ~¯\ì(|„µ38Úšij\' R†:ú\ÅðFR:•Mz´~jeMS²’ \Ì5á•¨¨\'?g;ÁŸª\r\\\Ø#”`ˆŒKÞ²5‰ŠeI©™gS”-§’|ˆ\"R«%V\á;”Ž±P–un£šSm2Ž\à\ï°\ï\é4#Jy]\Ôj\n§Ü›ñCJžt²”\0\Ú¼ð\Æ}c[nZ\Ó:¯¨\Ôû\ZZp°\'f9\\˜\róøhJJ”¬dg\0³K¤š#¥\ÏMU&*©žž™O\'Œ–<46Œ\ç•)$\È9\ì#7‡Z>½AP*\Öñ^+NÂƒ©\ç#ã‰ŸE4PJ\ä\0\0º@!º•±\É\í\n¸¼Œ\Ò:¬uÜ‘¼u+\Î`•‡\Ça×¤c œ\Æ\\ÁI\Ýü\à€T\n\ÉW½\Ê dt‚”;\ÆrH\Ì:c²Yµ€Ž° ‰\Æ70 HT“”G”|>c\Ý\Îø;ˆy3•#›\ÍÀ;*\èR\í¿cˆ)8\Ú@\'\ìÁT3¾;\ÄPJ ’3\ÐÃ†Tz\ÞF\ãg\ËDE=—Qß¼l¤P#=#[.\"\Ê\Ìž¦\"B!B¸¯±©÷®ˆUš\åKô†BQ\î\\”©°J‡ÁI\æ?H\âª%AR“¨<ýO\Â;\çW\Ö\Ð\Ò;˜<°”þ\á›«ÿ\0d¨ó2©wL\ÛU	ð³‹—À\Ù\'øU\å\ècš\ãz[Y§¸]¿…œ÷Û½ü«ú“T•œ”\r¬x…«/=(zÃº\Ñ}it –q>\Õ\âK\Ê/\Ã™RTúÀû%K)I$‚r2—{34\ÂT—Á=÷‰\Ý:~N¢\È+ Œc¨eU\Õ1Æ“¦$v;$l\î!µ¡T#,½A[Iu´6\ì¤\Ý!•`%%;+—9#©\í˜\Ój}\Ñ~j…-4\ë²\âz²\ÓO°ì¼—	o\ÅeÀ\ëjDò”­ \äuÀ\ÌL$­^u<\îÈ¥K\Îü§\àÐ­ú:ô¬š[<»\çx\Í5¥‰ì¬©©”šÀ~•i¡\\:X:N‰ë’mµ%T©¸§gœe\å¨-EEg9$’w$×k\Ù\ØVü»\ï\Ò6Z\Â%‚¹9wôôˆ(÷M²dg9ªT™”/%<Å¿a<ÀwÀ9Ç¤`j¼4wR¥R\âjT>ªü\àwOœœŸ©j¤\ë_T\Ò5D}¥œV>•?5GCLº¢p“°„­[B…`Z’v…·-\à\ÉÓ˜KL¤\îUŽªQ\î¢rIó0w@\Îz\Çgm@[\Ð–ñ³}v\ê½\ß‰º\Ô@;õ0‚\Éõ³Š\åJ‰Nz\ì!#\ï\0pFÙ‹\Ö )2­÷‚\îU\ï+nûA”r1óPFN~PÒ™\ï˜\Æýœg#\Î&\È‘\ÛY	Àý F §h%W¤\">p€žm±´6X\É\Æzˆp\âJ’;B\\‡sˆu`\Ù$Pù\í\Ö0´d\à*J	\è?L¹$XŠF\Û\'ra\ÃH\Î\àôƒ5.psÓ¼.\Ú\0\Ø\'óˆ†¤fZVr	ˆö³ëž˜ð\éb»¨Z©q¢Ÿ Ó¦’3³«\ì´\Ò:­gn\Ø$\à\Ö\ê^¾\Ù:m.\ãN\Î&z}y)w¹þúº zn}#—u?L˜\ã\ïXl­FÕ™µ·gYÔ©‰\ék6Qd1T›}\Ð\ZveD\åHKMƒ\È\0\Ï>	\ÆAf\0\çge¼zwS‹¿Ž)}j\áŠ\èÔŠE õ\ÜT\ã4\Úd\ä\Ü\È[³ªuô0TR‘„¤)Ä‰\ß#;G3T)\ÌU¤T\Ì\Ò\Ð\àÂ’F\Æ:·ˆ™\Ö>\Z®-³e\å\ägf)i]¼\Ë´\ÜÜ»¨˜–@	ÀJK!>@\å¨º\Í\r‰‰\Ù7|§2ï§•l¸œ…6¡\ÙIP)#±9>>\í-1ˆ\Â\ï|-\Êm£\ÃNC³ô\Çò õ\Z•Ã¥5\çi\î¹1O[‚	Sdœ\0–|ÿ\0±t\ë_(³¯!/Mò@q·6)>£¨†õŠrÜ §ºH\ëêŽ•[7(K­²\Z}*<®4JT“\èGH\çÛ­¦\ê\Üh¹€¸A\îº\Z\Ý\Ôja7<•‡\0\×ü µ\ËþEži‰™´6\Ó\ß\ê#›š\Ñ\ÍC§i:—?,\Ð;6 ú\Æ\â—`\Õºt\Ý3•\Ñk\äF~2yÎˆ!cº“C§\ê¤\×VªOW&§\Ûm­\å‚\ï\ÜOn±³\áÊ;+¯V¤ÚšT\Ü\Âk->\âB·Pl<¾\ÌjhôFeS2Œ%)d¤u‹£ƒ=;z©}\Ïß\Ë(KÑ¥\Ãl©—F9AóK|\Äùs§\Î2,):µ\ã\0\ï?L¬.%]–ö{õÀ]I¤Z÷¦:õCz³§W\nfU*¿£\"\ây“w%%$ô!IP\È\È\ÊNûD’i¤\à˜\ãË¶¹_\á\Îþ¼\ï«—+#8\ì\Êf\'» ‰ö9R\áSˆ#þò÷Js\ÌZ\Ï«zQ¯ô¦\ÎSœ\éIöª{À$Ž¼‹\éð\Ìwd/.u\'•Ô´û\ä\Â¤¤`wˆý¯­zqy1M¸\Ä\Ê\Î¬\ïÔ¬Ÿ!Í²¾DÄ‘I\æ9Ï®|\áFR”Ü¤ã¯¤c”±?UI;\í\Ö´¨dóJ$\å\ànNý\ãmœÁ”’\0\êc`ò\ã8Â’‰8Ymsu `ò@²¤ó!\'=¼ ¬ö\"¡\0x~¿õ2\ÍÓ‰TL\\•	NgÁ—m<\Î9!\Øz¢\Ä…·m”¤\äŒÆ†ñ\Õm>°\ÛR®k¢Y‡œ‰d+\ÓðBrb„\Õ>(.\ë±\Ç)–›\ÎR¤N\ßP¯®t2\Ç\Ùø\'ñŠ¥\ïi™}S)Ek9Z”IR™&¬%6—ð¯»³yF]2\ÖU¢\\\0a357¹Aõ\äFÿ\0œW\×:§x²©9Šòe%\ÖpX¦·\ázd¨þ1fœ‡}\âr0aCD”¢S‚2‹¹M@5¡7¸Q7V TZe.*Q\Ð\Ñe˜´øhž”˜gÙ¥\Ö<%\Ò\ÙK#mÀ§\Ê 6\í9º¢f‡!ð€\r¥=±¾ñ¼\á\Ýõ\Ò§2A–}\ÉGO°²\ÐCaX]\å]+O–\åJT\Ù9I\Û£Ÿ8¨\á\Í\ë~\àš\×kœUM¨9\â]”\ÖS¼¬Á\ë:>\âöñ\0\è¯¢•Ž––T\Í=ª„¶p¿.\Älai\ZCŠm\Ö\ÒN\éZT2•¤\ìA¨#¨}\å;\Ê%Žù\Åe\Ø_Ö°®*3=\Çp¸\Z¡$&§¥ÀZ@\Î\Þ_\Þ4ô–U;5„•lsƒ\'¯<)\ÌS}¢ôÑšzß‘W3³\Öû{¹*z•K¾ü>©í‘°\ç)j‹ru#2\âH!dË‚\ìGb#Š¸´©k[MAýô^‰iBú†ºF#Ð­›ró\è÷t¨v\Ûsa‡ž˜C\r6I\îOhYw…»Œ90I\ì„¾P¥¯3\\¾®I[7N¨*ž«O/•†‡\Ù@îµŸº„\É=¢¦·[ô·%d9\á\Ô\ì»³\íj\å\Ût\É\Ø6\\Šf\ëJ9‡\ÕÊ´1\Îû‡\î¡\É\îN71\Ú6žÐ´\ÒÐ“²\í\æÊ™•I.¼±\ï\Ì<­\Üu^ªVþƒ ˆÿ\0¼?Qt&\Þu±4š\ÃRJU[¬©.¸i¾\éi\' \ï\Ô\ï\Ò\Ã÷%˜[Îž‰\Îñ\Øp\ËiOS½\ãöôý¯>\ã\\WÛª\è§\î¹\ïú\\»\Å\ËM\ËU\ë\Õ6O+\ÌÑ•Ê±\ç\á+\0Ž‡\àb?M§½/A’J#œ\É3\Ì1’œ\àF\Ã_\ê*ºÜ©¥.eUZƒRL|\ê[Ó“Êœ‹\\‰C)Ù½3\Û\Ê6ñ…­\Õ\0(MY¦¥¥K\Í+\êú”¨t\ë´I´\ß_µ\ÇeŒMŠŒˆO»\'>J‚G’ö“ð\ÜzB3´‰\n2Ó’\ä(l‡A\ÆG—\Ê5j¥&[™–U€q\Ì ieVt¸\å^¶Ÿ\Öm´1^–™¤¾F	y>#Yÿ\0y;˜‹—Y£\×eS=F©±6Êº;.\èR(\ã§eˆJ\ãgl\ä÷1±³n[ŠÓŸý\ånU—t\0HF\á~ŠOEŒ!d%\åö+®\Êzú˜M}3žñ\\X|HZµy$J\Þ.	\ä¨%Å†Êšpù‚2S\êH°iuj]~˜\Íb‡PfnRe<òó2\î¡\Äù…\rˆŠH#t£J£$@ƒ¡>\îPñ=R\×)j•\"[Mk\Ò2D\ÊM=p©\\þ\Ø\é!”°S²FyÊ‰\ê\09Æ©7Y¬Ô“S©\Öf&–Nq÷µ,v\'´u**/]•y™™ >±£\á \î‘÷8¢\îj2““2,²”¥—\Ö\äbú@(&#*-+\"…aKN6\èL:T*yP\Î\Ý!\ÒdT”\î>b—h©\Ä$žûŒF@I\Zo³\Èx\än:M\æ”µ:rPvõ¥_\ê\é«	·0\ÊLû](´”\àD00Ki´‚¥­KNJ”XR\Þa\Êj \ÓYIn ™¦O¢\Ò3ýITm\ìúr$$Dº{w\Ä!t\ËZ\Ãs)Fò\êm^¥>ò\"¨„Ê’I]§•†g©\Èaô€™–C­\æ#xw?OJ^.´w+ý!¸…NÆ‘žeÀ&)\ë,¸9¼ŽG\äDODúf‚f\ZW2\\@ÿ\0h¡\Ò\n¬Di\r¸mjJ\Òv \Å}¬ü,\ÙúÈµ\×\ä‚(õò\ç\å›ú©£\Ø<\Ø\êœ{\ß‘c\Î\Ç(†jf®\È\Ú7K©\î8*÷\"&ñZ {›)$ÂbV¦\ÚGó9ŸºbŠ\Ô)Ü³CÄ…}ªö)?\Ý\×\Î\è6¯\×õq\Z1B·\Zý\â&\\D\Ì\ãsm¹.\ËH -\å)*\æJFv\nHQ;˜\í\Î8q±ø{µ…2‚k©Ì¤~ô­<\Ö™=yG^D\Ñ#\ârb¥¥ZW½y\ËÜ¢a\Ù6\åuLÓ©\áKö”¨E­g$¸$©j*W6ý\"\ã±u¦^¬µ§÷-b#tª]O±H\\óaù¶R2§[k<\ä½¶\Ø\ÈÛ¦5md\ãQƒ\'©þ}÷½¿¤)T 7°\ÄüJrß»¸§½*¢R6\ê³2\ËZ·òI‡ó>GH\Ú!Ú­8$\ì9÷\nð©®Fó(gúB£9²µcu@Õ¥MJ\ï Iò•%©·f\ÝOþSD\'ú–˜—L2\n1Ž€\Ñ\Ûbzúž›R“\'Ki¤Ÿ\áqÕ©Gú[O\ãgZ	R‰;\ÇUq9Z	\ÆT\Ì×†yVr’{FŠ\ì}T9tÏ”ûœ\à+\àbk\ì\Íe·\Û9…yDCVå’»q\ä6=\Ô`Œ÷\ÄºSºj\Óu)›\n8#l\Æi\Òn8\äË¡8	ÀIùB–—øŠ#/$–\Æñ³’–\r\Ë::\æ\" ­m\nš¹ú»S>óO\Ì%I\êA £bc¢ôšÙµ´¾Ò¦\éU¯M4ºDªe\é2þ\"–\Ø\É\æY*\'s¹91HY\Ôõ?p\ÓÐ„\î©\æ»8‹\æ«&yJî“±¦\"º¢B’N•¶•Ë°\ï5”‹ªTI\êŽò¼‚RN>\Ð\ì`F:\\¨©„NË¬´H?„V—ý5-]Uˆ\Ç\×\ÄE¡Al³5.1\Ñ@½Z§!›Á\å¡Y²…«xÁý#&˜€2\ånY*¤t«T\ì:• cþ«l¬\Ì`7¤¤ ðÁ\åøÅ²¤­%uœÓ–‚œm\Ò4ô\á²\Øþ-¢MtI”\È-i\êHŽÚ²«T\ï/&ra”K©”¶”\ãx/ù\0h_½\Ñ&YÄ¼\0\ìp¿\é*„´©e´‚ñ\ådYªRœ–š¤…!c\Í$`þQ^¨2ˆQ£õeÑ«u:CS‰\æH\í\Ì7ý3õ±4\\a\Êz²T…7\ê“ÿ\0?\Ö([tMS=÷²˜ð\Ý\ÈÜ”+üñŸœ^”vW.\ÛSÍ¬\ãbHi\'¬™Ê¬„ò¹\\“¶\é/\Ü3\å^«ekJz¨öHõ\'>eø\å\ã\'Ž	ž7õ\ä\Ô\rd¹-ûŽZ¿3$‰;~·1+-%(•\0\Ë2\éB“õ^ZP=W²ŽI¥+\ÂBb\èi\Êj™)—)!)=I?xÿ\0aþq\âG\í!pˆÆœ\ê}—\ÄÕ½N(f\é”]\àR±•HS>«`©?ûu±kj‰\êƒ\éµ\ì2\0Tx‚\×\ê\äÓ³u}t¼\æœ|‚ó\ÝSj+\ÇL\å\Íñ’~\ÏWeù¨\Ó|zjL\íMÁF[”\ë&rnmkq÷ùJ&&9”IR“\á$‚T\çðÇœœ<h•gˆ=j´´BÞ™n^r\ë¸%)lÍ¾yPÇŒ\êP\\$öHQ>¸¼}O\é/öº]A\Ò0¢·#D·)mIHË¡8\Ê9\Õ\æµ­Gº”LeÝ–°\0\é(Ó¦Ü€\â“S5\ÙÌ­!/#Ý˜m=¼Ç¡\ê\"¾×Š¡›ª\Ó-\æCr\ì¹2úGu«\ÜG\à9\Ï\ÌDž\ÝnuŠª\ç\åŽÊ´vXò1^jz^v\ê¨U%\ÒTÌœ¿\"–~ò’	Pùtøƒ\Z\Ð «\àJ\Óiì¢—©Vy0&\êNuCA-–R¿\Æ7ª—!EI>•Jr•d\Ó\åžAû\"\æzó¯\ßWõ(\ÃòÊƒdŒo˜yDœ­k¸—~¬€Jº\ÄCum\ÆÛ¢º\Òþú‚G¬Nfšt§;½\â!rPŸ¸®v%\ÝÝ–Î F\Ç\Ë1\êOt\ÎÞz‘o2¤¶2h\ÜS¥Ã´õ¸RHRO\Î\ÞÌ®Q¶%\Ù÷y—€”m$™,R\Ñ©¨INô\æL9zRš	\é6•<\Ïö‹±ô%\ÇŒnNb©ÒŠz—{\Ë(#fZ\É\ÇOw\Þ-–P[®¨dl#·P9jœ”l,…§p`CŠ«O¦lò\'b\é*€¯\n?añuÀ¶¥\\v\îŸkÅT©N>–¤$dªm—ŸuG	J±$ž\Ñe\Ô4öÂ«Ì™ª­©&û¸ÁZ\Û9Ç–\ÆË¦u…«t‚µ\êÑ\'.óªÅ”\Îû…,öŒJiV;\î\ÊP¤\\ ‘6¥zvT\ÆDº\ÝcC4¢zX¥\ë=¥$ù>\ç\ãö¡µ?‡M’wÅ–³\ÂW\æ&\Ýÿ\0Š\"D¹\ÝÓ·´KLT0-\å\Òÿ\0\ÎoE´\êXŸ”úŽÿ\0\â”X\"¶6P9\Ý\Ó%ðÙ¦O\Î9ÔªaÀ·@œ8\æ\0€G¤H%´\êÛ”–C\r¢`%°“€1$K\Ýý_Û§%)˜±ñGùG<q\ïôRh\ÒC·\í½`¾n\êD·>ü\ä›V\äÜ»a×œl6T\çŠ\ÊóÊBq´¬ç°4\0Akwu\Ïg\ìÁpc§\×u.ø³µÿ\0T¥jy\æ§$^’¶óKAÈ–c\Ñ\'l\É)¶þ¶a\ì‘\ï(¹ó\é¹\ÕÕ”À‘”Ý9¥µ*¹f*/¤+>ñ	\Ï\éÊ§–\íJž\í-Ë¦q	y$8¡.‚NNUß¾ÿ\0ŒºZ‡1\ãª\Ú?¡t®P\Ûu÷’r\0—Nßœ$­§­\Ü\ãþ\ì?\ÎRÖ¢òwH/@\ä”1þ¯²£þ(E;SÃ…\ár)*?hû \ßú @†\Ò\Ô9\î˜W8W”­>\ÜÀ¼\Ùo 2 \çú\áÒ¸kk\Üÿ\0µƒG.—_\ê!ka\':§u¶´4Z^Ò©=Q5£0§[Ù¹yFsüF$i¶e\Ûl´§Ô¬œ“\ËTZ%cû¤Ÿµ¤f\â*aÀq±:\ZŸ›Sºÿ\Ù','Derek','Limbo',19,NULL,'09463276543','Cuenca',NULL),('U0003',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0\È\0–\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0S\0\r\n\0\0\0!1AQ	\"2aq‘¡\Ñ\n#B±Á$%3RSbt‚”¢\Ã\ÓCTUr„’“£\Ò&4Fsƒ\áð\Âÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\04\0	\0\0\0\0\0\0!AQ1q‘\"a¡±Áð#R2Bb\Ñ\á’ÿ\Ú\0\0\0?\0\ì—\ì…&QÅ»ˆ`ŒŸWüX%\ÝG’I\æ€Ž\Ùq?\â\Ã\Ø\èvš´¢\ëv„žH\0þJ	wF´üVÓ’\âGHá‹­\íñ)†þ§\Ò\Z\Ù\Ëv\à$÷/ }\Z³\Z«o#e[µÁŽ‡\å¨ÿ\0Ö‡\ëº=`ý\'%¹ÿ\0GA\Ò\r?öUiÉŸþ3›!\Ý0\Õ\ÛpŸÅª\é8\ïRoüx!ý^¡\r›¶\ëh\Éÿ\0[4?Kñ /Gôü‹FK9ÿ\0GJôO\Î3hHŽùù0‡@6]”~\î±Ñp»vµ\Óýp\Ïøñª­f·•¥6\Ýo\n\ÉW\î\ã_Oùø‘\Ò-?:D»§\îw´’Á\ÉÍ£#ýX}\Ñ`‘¼\'q\è£\ã­vÜ«hi›v»€0k\í¿\ç\Æ*\×{x\á×­,×™\Éÿ\0¯\Å\é-„¤±ü\Ý0W\ìGbø¥%ñù0û¡úRdy7)Œ\æ·Û‹q.ªÓ¬‚J?ñ;mŽž<b\î½PHË–­dû…uœúðû:OdfÓ’ù°û£$\é5N?dºÿ\0¢§\îˆöRq6Q\ãº\ín:Ÿ“›b¸z~\î4\ÖN´Zï€—­º\Ù8Þ¾\Ø\Û\Ëÿ\01\ìOcó`\ÚR\ÕS÷G«\ÒK$`¦Ò“\ÏóTý\Ñ\Êwz`5¬ö\êðØ·+|§¨5Æ\é~—\Õ\ê#L†™·\ëa#\Z\ÛJý/\Ã\Õý)²”0›NLc\ÊX}\ÐC\ÚYgr\àÚ’›\Ò\ã\î„^­`}“Mz·J\') \×<ö«2¾û,\Òö?3×³ï©²¾‡3šYi‘kJw\É\Æ#\Ç4¾\Ó@\ÛR\Ãm³.>\èn NCùMYT¤…ršUÁý}£ýôqLiµ®\Þ9m©_ù\î\Ön\ê§¥X­¿‚#Â„¨\ì\ë–0\ì²\\…‰i³ùƒ\êŒL³\È>¨2@\Ã\Ù+”Y•`ŽR\Øú£\Ã#,F\íˆ6.„\\%™ÈƒN”#¸\ÄÒ¤\ÕÕ½ü\ãf7B.¹+P\Ñ$T1Óºøg1·£	–¡¢Sû6~¸ôQ¤ù³\×1µ¡	\\­ošdŠûc\ÓJ‘V\Êk´l@…Ð‹„®V©¡Ó•þk\íŒm\ÓT?yþ\Ôo`ùõ)=\ÄD\Ó\ÃÂs‡b“M¯N#d+Áv9}Pq\n\àc¤xñO\Z—Uü¤7¬ºrÏ²G\Ó\Ôr=PL¥\Ô\ìº]B{¬`@Z\ï)\Î %9\Þ2\'\"]d–<¤÷9NqG—*#´`µ”\îñ\å%Ÿ&:‘\0nL\ä\Æ—XÀÌœoö\Â\ÎS\\-‘\Ë\ÜÀ\Ê<\ãP\Ìl„¢0rx¥|€v\Ì,\å6`·AAómó6{\â4•1ÈžSôÀñ\Ö;\í\æ6r–e¸\\hm˜ôº\Òv\ÏQ\Ò4|e)D´dT3\Ú¹\É\\­¿\Æ x\é;\Õ+W(õ:Ç¨9VÃ´g|®²’\Ú.z¹1\àQ\ë%G¾;FAy\ì\Ä!0*vÕ¬§ \Ì\Å\ÓÊT\Ó+|J\È\àw#\ÏW¹ú`¤Ì’\Ø$b~lò‘ðch•²§|Akš@{ó	\Ó.Tì»o\Z3…$œc~‘’’Wz}N\àwjˆ\0\'\Êª•«™K\í=S*\ë˜p\n¬›¥W«(g.:¼$\Ó\î\n•~g\Â\ç%¤ž^\Ñÿ\0÷»í†ž¥juŸ¥ö”\Ýõ~\Üô\ÊTƒ~$\Ì\Ô\Êð”œ$ªQ8#$€Ž>zF}7:¯¨õ\é\Í2\á¶rbÜ ¶™ºš[\Ì\ì\Ê\Û\ã! GD¨\ç\Ý\Ë<qªº($›°\Ñu†ø\â‹N\ìú‡\Í3Ì»\ÓiVØœm´¶}\ê\È\ß=²NÑ¥M\â\ê\ßj£,\Å^jYÌ¸KŸ+J¹	8\n\É\ê2zô÷\Ç\Í\ïùCNQ”\íRnš³\Ï\ç(–z¢‡Q\' †\ç\âa˜÷Z\äõ\ÛÍ¦•Z\Ûd)¥Rßœ0ò±ü@\È#¬V\É^óq\Ù\\ú`Ákê¾³»)ó\É}#\Ö8Á\Ø\ç\Ë~ð{5ÖO\ï£óG¸ô\ß^ZÛ”Õ‹5-O‘f]ù‰i¾i‚[i)YC—™\\¥D	\'¯x\ê&‚kÞ›k½•)}\é\ÍÂš…2s\Ôje·ù\Ê:´\àQ*B³\Ø÷\Ú54‡,c™©\ndMD=bÇ¬nK\ÏŒu÷CJZq\Æ\ÞðÊ¶=	=!jJeI\åÂ¾0ˆQ-¹ýbv\èd—\ÇH\×B²C\ç¼f”=¶\"0\Ì7V\rQ\És˜%Á€<„k6±Ëœž»{\àÀSŒ\ç¬Su+£^q% føW Á\Æþp!Éº}W®:\É;F¥Fei—þ4õ6q*	\Ê;ñ\Z…\Ã$žnÏþ ¢µ\æ&H\Î!6bp¨ž\Ø1±2·9p3õ\Âs\áx÷üa\Ô\r×Š›Y\îNý\ãV§Z”¦I½?Q›C,²ÒœyÕœ •€Œ\ÝK©\ÎVOHgrúkf‹\nBd%\é©uM\ÕTŽYtn†\ÉþZ€Ï¸{\ã&!Z\Ê\n7L\í»NÁh¢¥}mSbnýý\ÃrªW¥Š\é\íf½˜±i3)Šbù¥¤œpò6­ñ0øO.TG—*Ugš÷\Â\êô¶\Äõ½ ^­W&\Ý\nYô¶˜8\Ì\ãÀuZÁ\Ç`PŽÊ‰³So7\îS7sÕp\Õf·¹‰I[\0‹ª(G¸8OœI\Ü6p¸\Õm÷µNõ•K•	±†R¤\ì\Ëc$% ô\É%_Oº\0ÿ\0S‘Ÿ»!»\ç’ô\nL!³›š?<\ÕO\ÒG%Zö¨·t\ß\î¼ú\ßõ“\ãg>B,«À‡nPª/7@G3r¼e\0`‘€|ú“ž‹bRi²­†B@Nž¡W¦IJR%\n\É\ÈPA\Æ+dvbt]Ñ\ÐFÜ¡º®Skž\Ü\Ús7V¶V\ê\Z*)šð•\Ë\â\'8\å=•·x”=þ‘;ßƒ_•ºßœ™¨Ø·!Cw5\åMó™–’}™†¼¿?”¤õIzW+u\Òf^2i*žBJs¾˜£ˆ¡L[÷NÁ<‹•x\ÏSòŸmx­ˆ\Ü{\Äaø³¥f§Vý~-‚¶\éý%}Miõ\ë@\ÔKB™{Ú•vjÊ¤‹Srò\ë\æna—‡|”#\ã:i\ÊR}\Û\æg\àöñ5?t\é=c…;¶¤]™µ\njV³Ž9Ÿ–òð¶“\îm\Òòc¢c¦Ô¶	H\ïñ‚hfeDA\í\Ý\Ë ”°ì•˜ÊšõlA\ÈN\ì 3.¤67\Ûx=©rT.ýâ™:&”%!\0uÀ\é¤gùFAœo„f\Z$d¬Jº-\ÐyA\Èø@ƒ”\È)\0À‡,w	\ÈH®Ü¯”\ç\æùL¦˜¬ø’\åQ\Ò\Þ\Ì§3T¶©U“\Ëò™f\\8\Æ\ãõÁU\íDr°\Óm	@\×!\Î|Nh\è\æK*“—VaC5 y\æ \Üj?;,¥\Ú\r€Oz‹qþ0;¹\Ï}óú µ\×V¢AR½ø‡•(\Î\Ô\é\Òrëš”h6\Ò\n\Ü&¨\Ö\É$\Ç½#š\Õ9©7­Q¯«5Š¨a 9\ìK €¿l_.)5E‰W«_(\äY’S-o¿:ð€?µŒº¯V.\íPzz¡4­58\ï9\Ø±\É\í\í¾”T\Í#°ö\Ð\"G kZùNúµ¢\åµ5¨\Z±o\é\Õ=‚–$R*u@Ÿ\ÍB+\rŸyVN<€‹©b\Ðj’”¦še…¥	la°Š-¥\Ü_Ó´r~­~\Èp\ép\Ýo\Õ\æ\Ë\ÎT\ÛAC-°=V[lr’@@˜\ã%G&:ô\Îh­Zqª\rÃ¤÷=\nl\í\à\Ì\É$K \ã~\â8.\Ã+dhpnƒ\ÂþHÖ“\Ã\áha}‰÷ª´©‘ª6HR>Žl‘\Zõj®ô¹[‹R‰öS¸†\Õ3‰‹:\ã·y\Ð\Ð\çÉŸo\Ä	q<«ý“¯úU\î\Ë)s6õ‰£si¿¢QN=„\å¨\0I@uˆ\ÅE4®\Ê\è\Í[O38è¦‹\Î\Û|È¼\ÌÌ˜ $œ\Þ9\íÇ­ þš\Ü\Ô\ÝN¢²[m‰\Ð]p\'¢\ËÝƒ«\ÅG¤7T¿vU¥ô\ZdŸT0û`ö%Y?oxC\×ù[£Ytº¿gjE„ŠU]¹5:\×\ÉIT»§\ælž˜=²ce-,”\Îp-\Þ\Æ\ë[S!LXk„\æôSq#¥\Zóe\êµ2u”Ê±VnB¬…8BOœü“DvmJJÿ\0 ˜\ïk\Z¦eönb\Ì	3NÇ”| p!¨ò\Õy»Rjea\ÆVô£­ó{*NTœÛ¥L}ðÕ©\îj¶„\Úwù›ñœ¨\ÑTÒ‡ñ\èO†\çöÐ¨-Â‰‚¦Zc\Øj>?\0b-k\âŽ`5\ì~\ßuj?fI\àpš\0g§®\éýPp\Ö\n†Üµz!Ï’]û¢\îc|Ž\Û\ÆÜ¼ó™IÂ¶÷GmrT\È5‚¡\Ñuš8\í³.œ}j5jyIÚ·K\'ù2\Î\ïöDD™¢£Ç˜\ÄmJ¼\àÂ’“Û´FÁL\0¥ujœÿ\0(P¬\Ó\Æ{	g\ê˜œu-\ä¤\à³\"n–Š¿\'Y/gPu	\í·\'ýTÖ¨jÁý­^ùþA²~\Ô\Â:%“Ëœö\è;ÀK{ó=³˜”¢»ÿ\0S]ÁMê¤!(\Ñÿ\0ù€\åï¨ž?Ž\Ó\Ï7÷F‡(\í¸‚œpŒÅ™”T-\Ç\î¦\ÝR\Úe)Dª\ÝO\Í	\Ùôó4 \0\ÂAÛ´sº½[ŸcN\ëS2®£ZT\Ã©	Ê3ž\Ûp\è{¢\àzD®U\ÍW(vû.\ä2‡q\Ì\à~£WúQ/ªºñC´ªbFHÎ¾…Œ¶V¡ý·R¢#\ÏñYš\ìA\ï;[\åÿ\0Q\æLM,l\Ý\ßt\É\Ô~+\î­2—M“BÓ‰·UO¦ò­\éºpjT†\ÚÏ†——\êä€IQ\Ú!\ëˆû¿\\«/UÒ·d[ja––òS‡™d€@Kcd\ã\Ö8\Ú:Ñ©¼.JU˜\ä£>¹E„\á–Á\n\îÁˆ\êÁ*Yüd¼*nÎ”¯,\Ël„û€~\"bt§!\Ñû\\Ü®ü˜iœ8I\ìqaõL]\Ó\Ûæ¹¥\Ó5)0\Â\å ¶Á\ÎÃ¸Š\íª/^¶MqS2öšß˜šœR$\ÖXZ™a´\ï\Î\â’*s€3\Ôüt\ÛL\í\Z<•¹Q‘’“Im\ÙelF—OV.¤­\Ê$\ÊK0¢Z}¥aI\Ï\Â0\ÓV\Úk¼\\.•FL9Xly\\\Ý\Ó~/x×½*\ÎÒ¨º\rT\\¼£g	m·PW//:\Ú\ä\ÎN\Øb\ß\è¥7S56\×3z«¦\ï\Ðy’“LÎ¡\îpF	\ÊOº{À\ê©E¡7wM\ÎK¥YKjPÿ\08‘kúA%C’C´\ÓI\åJˆ\Þ4U\×G>\Æ\áu’“\n©‰¤\Ë!wˆeÂ»N\Ø^”zA/}>—G+(¬™†SŒa.\0¿Ð¡õGS}Z…\\¬h\Zh\è¸\ê\r\nEZb]³>\â”(‡€u*9Û­Ô¤\ËzXu|˜nMRh\æ9Œ»*ýqsý\Zõ•5J¹\èd\à\"}·€\é¹\çIú=Q\Ó\Ô\ã\'v6ÿ\0ùº¯ƒ-=\ß[+yó\Åp¨—.j¡\ï½I\ßû \ÔW\ë©%DŸ\ç\î}ðŠ‰  7\ÜA¨™\àŸ(%7C)`\Üw\Ü\\\ãýñ|x›’\äF¸g¿­¯ï„µ:1\ÌT~ˆó\Å6ò0Ú¤–v\Ü\éNrOõ\ß3Jû\àBBŸ\åÂ’GH\'\Õ?\á	ÊˆF+}$\àªªB”«9\ë¼õ\\ \âd\ã\Î2‡rž\ÉaS 3ˆÐž\r¡K\æ\Ù#0œõmB»ù\Â5\ÝsµL¡L\Ï8\î9Z0Ÿ.F”£Œ¾@Ñº§<d]ŽUõzaeðZ’”xöõA\Ç\Ú\"z</©GŒ©I\ZÃ‰åœµ\Ýl)G¢Êƒ˜øò¶O\×z¯4ý\ËzÕŸpœ<†\Ú\È(•,Ÿ£?TCT\ÝU§iO–µÿ\08ø—bå•–Ÿ^p—}§YRIy9øG\ÂMdÎ¿sr½F\0\Ê8\ãwñ²\í\rsQ¨Ê—\r¨r\å;\í&¨\êÜ\Ëu1NŸ¬¸\Å\ZYô*¨\ã\nÁðó\Ó# \Î>ˆõjð¿\èV\Ä\Ü\í\ÅM†RÐ„«\ÚH\ÎÐ®\"ôz/1o\ëYTj\Ä\êK\ÊùÙ…¤L£8¥\0R¤ r;ˆ«_V‹û‘<¸ŒyŠ\ÎXü\\\èCtI\ÙKZeµ&¥°û³\n)\Î6$\Ô+¡óˆÆ·®úoy¸™\Ý&»U1\\•¬­¦T |4Ÿ\Ê$”r“\ëtò0Æ¯“Eò\è«\Ò\ï§\Ó/‚G\É\é¼\És\Í9lO\×>ôš]õ|\ìŠ+|³’`)c\ß\ÈI?C²“_e¤•D“J\Æ\æ}ƒyV\ÛJõ’Br„Ó“§\Ä\ä\Ü\rxÚ½5\ZQ\Ê3³/T¡E*Ÿ(¡VFº\ß7\Åø\ÔÆ˜[³\Ì\Ûs³GÂªÊ¹.f[\Æ\î4Ú° º¨ùw‰‡RõB¥zeT\Ô\ÝK¯–\é4\ns“s%kÀW\"s\Èu)XH\É46\×d¶¼(?§:ZÛ®y\ßukþ\ÍS¸–¤+l¡j\ÎwC,£PˆµžŽŠš\\¹\Ø\æö–œ\0{…¨\Å\r\á\Úñª\ê\ësjmprN\Ü5E\Ôf²·[œ¿G0K\Ñ\é<Ü´\Ía\îl­n\äÔŽug\ì?dv¢»q†\ãaò^{ZD˜sœ?¸“\æn®›s„\'\ÕV7ûca‰\ÅtBS¤\ëõ–&‰\0>¸0 ô¸fÀ½NcÎ’G)\Î{ˆN3\0y¿hðM“Œm\Ðv…\Ù$¨\ì\Ö:(@„§&”H \â+„–ù¼HO‹¹Û¯H)\ë¡\És>b\"¶.÷\â:Áÿ\0j\'!ß¯\Ê1e¸V)ë›œ9\ßÏ¤25’ò-Z\îÉ‡IS»‰\êF>˜Kz\ì)N³Ž†#\ík¼–Åµ2ÿ\0ˆTJKmú\Ñ\Ê\Æg\èP:\ÝÎžk«‚\Óú\Æ Ñ°\ÕBw%u2ò•‹™*®amK­‡(9V}\Ù1V8 K\"Å¨¡\ç0§):‚Nþ!ZõR\Ö)tY+m`§\ÇG<Áp\Ð<\î+¹”º+/ÔžKIT÷&ä„¤\í\ïõÔ¿ªp8Éªa\í¯\È#Laùh\Ü=\Ê\äú48ß—\×\í”²îº›º(L·%Sni[Ì²0–\æŸ0\'ø@ùˆ´\Z£–£Ø¬ \Úr3\ÏÈŒ\ßF‰\î27G@B‡C2\ÑZ\í\ã¤W*oûJ¦\ìŒ\ä£eHu>Ê“‘\Ì\Ú\ÇE$\ãpûŽ»z=ý V^­Qå­C\r\Ó\ê«o‘\Æ^\Îc(Qö¾cv1@úJ®½9öo\å\îðO\èþ,f±OýCÿ\07M\é\Ý\'\ÒknEš¶ž\\t\æ%\ç‡(\ÃÍ¾€¥¨©XZ¢r¥d÷‡6\è%­{\ÕENŸ’–K\évbz¸÷Ž\éP\0e¶ý†\Îµ\Ê1¾\"\ÊNZš	sLª¤e\Z[\Êõ”•8¤n<\Æwú ‹³Qô—K­\ç\Õ*©iP\Ê	YBö\é\ï=c#±\n§2\Â÷EMLÑ™±1§\Ñ‡	ñ­•Oa\×e\Øi2¾$\àrŒoô ñ\ãP\â:\ág@ôÂ¢¯\Å*dÿ\0\îŒ\Ë+õjs(=ˆ\ê\Óg§ð•¿\æ¦&~9ø¸º5“Q¡ZS/JSJ\Ûze*)S¨\ß\ÔI\ìsß \Ú(%±CS\î±:¶3\Õ¥¾Þ¯0\ÉV#¯Ñ²;\ÔË©¼y@˜\í|“Oc\Üý•Œá¶”ŠUný¹Œ\'\Ü\ÂÕ¿\ÒG\Ù³{•ªeyT÷U…L¶9>\Ð\É\ê\æ\ÌW\r5’4{e¦\\õ\Î(gÉ¶\Úaý£·\\Å£[¡\×\ÙPüÀ´\n€#\ß\Ó\íŒ=|µ¦_zRAž“¦8]‘¨-m\áNgf¥¦ðy¹¾$\ÃÇ¹¥\ët¦\'¤\ÝC­ñ‡T´Â¬\Ø\éÑ¼HÀ\áº{Ç–”¹ò‚¤ƒœü\0\ï)öºž†“6@\Æ`\á3\ê\ï\åP[O<@—xŸ13‚23\î\ÌmRP\ã‚¤$%g\Þ \åVTµ\Ôv†ÌŒÃ¯-,°µ©\\©BS’¢N\0¹‹·\Ã¡—X5V‰+y\ë•\Óø“!2Ú£¦OÆ©-ŠÒ¢/‘\Ð+™CºGH­‘—§Tö§p­-•ò¾s\rûöŸ3X“§°¥‚•¹\ÎTwf;S\à„\ÞmZy´4‚J¯XqþOž®_\Û\Ïl*\åsòI>\\¨\0EôÚ’V¼\Ó§\ÒD½>¹IihÄ¢ZAw\nI	H\0U!=;ÀÏ¥Lsi›mŽ¾H³\ÑXÀ©.v\ãO5Ï«\ÊQ5k¾` •6™¶¥B×¿ªAú& l¶­Ö…ni*)yAiQ¹”@û\"Å³K\nS\Èx\çÎ‹Is\Þ[t¦WÅ²ª•Ž\Äô»\\\ËB\Ö\Ú\Ç\\8\Ú\ÈÁø’ r–~Ž[x\"zø:Ì·\ÅBZ{£2\×\r\"¥G˜HC\Ê\ç\r-h\Ï7ly‚>9\ë\nZ=n\ÌÙ—+Ö­Y*J™P2\ît<½A\ÏPX1\'YT\Ùy\n\Íe$!‡˜K§«j§\Ðqÿ\0kT¦\ÞSòUºJ\Ûbw—\Öad>\É@Ï²°I\ÇL£ª\Ú\Ée\Ì\×jÈ®;i\Ù	k‡u,ZWŽ¥\É0Ü¼½\ç8YÀ\åñV@ø\ã;\í‚](«VŸš\'~W\Ø€\Ú5-9‡D³LºÊšW(\nJ»~¸]Ÿ¤®m\èÊO^‚39\à\ÛkK¢²­\ÜEIKŠJ¨\ì))R†¿\àŽ\æ!\É{5M³\'S•”?$bx\Ë6q²J[;ù\ïöšõ\ÚPN\\2%\Ä¨©\àv\åloƒ\å•`}6ž’Š¿\êD¼˜SŽ\êd\ëa\à\ÊY“g8=\Ç\åO\Ö#½LÇ¶ˆ¼!Š—Ve)\"‡ –]bU\Ô\ì\ê\ê-\r¼Ë˜F~¨64šE§+:¾©%´(œ€yJ†\á\"¢™4\ÓkiG\ít\Õ[[\Ä\'\ØC\íx*>ýÒŸ®+”\å1oO\ÚÎ\ÑfidºKessc®\èY8÷˜\Î\ío!V…y´\Ý¨\æÁ@(õ\å\Ïÿ\0y\æ-2m™¶\â”‘\ç\ç\Þõ“[¨\×mýT£\Ñ[§ªEÚ‹„N\ï\ì¶ù;y\ÇH4KÑÄ”öJ^6ýV™^˜S\î4ý5© Ë©\å8B\ÂT‚7\ÆAOnaÐ–¦7ôKInÇ„3ŒSÀöõšl\í\Ç?õF~ \êmòcÔ¼yH\Ì8u3GµKFç™¦juP¢½2e¾X\È\äx\'¯\"\ÒJUŽø\'¬4š\ä\'Gk9dt\Û\Ã\n{À„ÉºŠF`CIJÁXžý\r·\Å\Ü\Ý3U8•«N[i}2vÄ˜	¨:B’^YÈ—\ê€WŽ¼†:k;4ôœ\Óó0\ê¼\'Oð}•|	õO\ÄF\Ôx´%Ä”) ƒ\ÔZ\Ð\Ñe\×\Õ+cñžNŸ,“…\"{cñIû¢Žzy´ÎI\áŽ\Ø\Ôf[H©\ÛWñ\Ò1\Ì\Ñ\0-„œ{£ …	¨Ë¶\æpBÂ¾ÿ\0\\ssŽ®58}\ãwR\î\Þ	ô\Ö\ãD\ÝSOª~\rXM´½Uô\Ó&¢q2%\Ý!—’Ð½Ž\Ä\ç\×Ñ²¦‡ƒeÓ ª’Y”\Ú\×\\»¯4\Ä\ÅvaÉ„¡Š²\í-\â({÷Ä‚|\É\ÈúD6\èlOVªv\\ô¸mŠ»‹™‘R\Õû\Ä\ÖŠ\Éò\Éõ‡˜ \Ä\×]Ðª\ä\Å\ã5¦5Kb—Ji¥—\Z™d¾Ú•’HR– 0|±#ƒK¦_–naÖŸ9Jœq¯\ÎP\è°\ÙQ\çU8=l\Æ\Ü\Ãba\Å)\'ˆ9\æ\ÅT]Uµ\ëvŠ\Üo3,\ê\\*L»L©@!Kü£\éW@7\Ç\\ž›E~\Òûª«-]¢Tª3<òó7+2¥n€HO7^\ÜÀç§«+»´vµ8™Šk\Ôæ”h„OÊ¸…eôc(\Äf+þ¶ú\Zµ%û‚f¡\Ã\åz5L™W<2¯8X™“\æè”»\ÊR\âF\Ø\'•@c9\Æ`\×\Ñ\ÊHD\èk\0vÿ\0›¡L^yT$§:2³\Ã5\Íf¥\Êez]\Æ\'d\ß,MJ\Ì ¥l¸“Ê¤¨„yX\ZQº+\Òv•K\å3õ\Ã2Ìž…Jü\â{$’{\0L\\\'4ö•ª\Zlë•½Pnb\î¡\Úô\ÉMN‘m%.—\Ó.\ÓNN`\Ê\0ïª§A\nI\'hup¡\Ö\æŸ\é\Ñ\Åf£¡m÷\å\é*™PJX•HË¯Aü£Š´“\ä4\rþTüSÕœt\ïñ\ç\í\âŠ-N0\ßX^\Öÿ\0.>þ\ç\æý¹[½¯k¹Æ–‘›r]¶\èõ‡:\ÛB’\ä“\Ð¹¾c£z›\è\äVŠN\Ü\Ò\í^¬Ü•J¤½}\nh\ÌJ:YlW\ä\Ü^[VPV\ÃcGž‡kÕ«…Û›U\çÚ·(\éyn\ÌÉ°±1;0’²yG\'¨\È;bIöc¤ºè£³lû\ÂY—”\Äü“¶ûªbdM\Ër–\Âz+\Ö\Û~½NLTSRE	…†ý¾²Ši\ß7UãŸš\ç|¥®¹Š4\íWVm9,%%7°\Û\Ï`~ƒ\êmŸq\\—¨›™¦®¤\Ã^4±V\Þ2S\á<†FAò1aø­´t>\Æ\×y½\"¦_©£U%gNÉ»&ø\Ì6\ê›\0/”§+	\Ù%@FA…þm]\r½µN“a\Ú|K[«º*/ò\ÉQ¥fC³N©¢\àKiu	Q%)\nÀõ±‚=¡Ÿ?MtuE¡‡)=\íóE\Ç£}8qp\Ì6]=\á;ÑµdéžŒ[\Õ{R\Ýe2³´yi¯’©D¸•©°£\Ìs¹=\"\Ü\éu®4±D¬\êT7ˆ¦œœ‚;“°¸<©\ÍT¸j´‘>¢f$©‚Nc˜\ï\Î\É-\ïÿ\0‰\æyÖ–´\ç\ÃYR}\ÇgíƒºJH\ák\\\ÞUUT’’\Çr£\Íu\áþ…\Än’OX·Ôº%\ç¦I™§N#\nU:d\ZP#\Ú\0zª\n‡q…\Õ{f\ì\Ò[ê©§W½1RUZL\Ébm…g…¤þrRUÐ…ÁŠi\é\á_öEÒ\ÄE•L\n®\Ú\ä\ÖP\Ê=i\Êfr¢q\ÕL“\Î?\\òªF\\]bseú\á\ÆK½ûÀ†„\åkÏ˜Ge5ôA\0FA71ê–¨OZ”ßŸe\'T\Û256Œ\Ö€¦\Éð\È>\ì©&/’A\0\î¥šö\Ù.\Þu«kÀ\Ó\ZÎ¦\"Û©\ÝSûu\Öj,±<ã«•.(\Ê\æu80•rò£ˆô	ªn‰\ÙWF²X\Ü:¹¨\\\'\é¬¹J·ªº‹^—v±N­77\É3]šnY/7$\'ð|º\ã3„8\Õ ¸Y\Ò_H\å°\Ü\åRµU´\ï\ãnz\Â\Ô+iÔ·T·\çCM¬8Ò”[j\ÂB\ÚWª°;\æÿ\0:qÁ\æœTý\Z\ë\Å·cpùª·\\\Ím\íb›±¦Ÿm(šy´e)¥­.™”‘\ãaµ¡\â©\äRˆ\Ã\Ûs·ú¶\é\Å\â}u?H\ÕtŠ»¯ö2ž \ÔlW¢S\Ñ<ý™s´\Ó5d”žd\ÍË©µ­š”¢†\Ê%V\ê\0\Ý\\½!óJ\á‚ù§­\Õ\Z2½œor\0\î\ë¿š\Å\Ã7ú\Ã\'\r>k\ÊZö¼´rò£U\çõ>Š°ä•ŸkS\Øð\'>[P	\åy”€¦)_!eIL¼xñ\â\Îñ\×+Ò±¤šY!u\é½faŠ%-ª,\ësóm$J6g[”¼\ã\r-n¥ie·Ô—\n‚ù\ÈF	hq§¸­\ÑV\Å85?„	9e5=Ke§\rFSò˜Nü\É8\Éú?D>ôo‚»*ð³\éDôô\ä¼\ËIlL¶\ÐIB”‚Žøûc\×*\æ´_\ÎØ•­º(õªm:V¥W•}‡Ù§INªD¼\è)(q\Æ,”¡EHÁ\åR¢~Ñ¥3Ff~Ñ˜*DÃªa\'¸\Ï6\ß\\P\È\\\É\0r“\æý»„1\Â-•o>*öƒEN¥·\Zš”šÁni…‚•´ 6 ¤AØƒ\Õ{…Š®§\ÍJiã«¥X”5·ó]&Q\ì \0)uÓŽ©‘)\ê9I\êsœ7\'¬\"Ô˜ùM—\ä‡!yg\Äqg\Ùvú\Ï\ÕœÖ·[,‘N÷]¤¨z\è\á\×L\ìkzJÄ³-–%\Û+J\æ_	\æuÀ“ŸYGs¸³¥Zk/%pT\êN°•j]¡\ì¤\åGôªsÁº\ímÉ¶Vm$6…ƒ±\ßr \ê3Ÿ!¤TžAõÝ\äOž2Eœ\ãuq$3U\Âo\Â	\ÓÚ­Ä¥j\é¶+“R^=A\Ä;òIµ¶O-	\ÇG²GO½\×¡mzA\ètmf¼\å<9Ê‚\åèŸŒ(R—6jUYT¦\\»“\â¥„ú›\ä£\Ý\×\Òñ\èû\â\'‹ýy©StŠØ§\Ô\ÚK\ìN\Î2»’VQmÉ»IzEn²¢Ò’§y‡:9HO]\ÄA\Üú9\ïm5\ãÑ¹u_[\ì\Ö\'(Z…+1Q¡\Ð\êSU\'„ø›Jœe-´Ç‚ÓŠu\n*\ÂÀ*;\'˜Òq|£\è¼\ZŠ’¾h\Ü\ÉZS\ÜhŸ;uµ²‘ð\ÊWlt¢Ò—±i\ÕZM$2\ÅQ\Ç\Ép~’a\ÔH\îzð6\Ú\\S‰@\n_´Gx@vn~¯¨\Í\ÈJ™*D‘rq`ûo»²ú’£þ\Ò|\ãŠQe\íD\çq%8 š:F¯N˜¤\Ô\åPü´\Ófa—R\ãjIJ’G‘ˆ::‚\á¼\'Üœ\Zk¬Õ†ú]~P\nœµjkùL¡W\ïj?\Æ4O\"‡¹*\è¡/§\ÊGM\ß\á\âËœ¼¦U\ïBŠr\Û 8YT£\Å\à?“Ì–3\ï\å9š\èž\å]\nf¥Y\Õz‹´iJ\Û(ši\Å#ÁyA%Ddû¢¹úBª\É\Óm!«Ó›•}F\æfe2®uC.¥\\¹ð¡ÿ\0\ÔIq\\\ìº9†·p¹™\ÄG§‹>µTXú!@´*´ª¥B¥Rn\ç¤L>±2¶@!.4û|£•)\Û}ó\ç\Zv\ç\ádjrž\å¯ÄŸ¶-\ÙF›O‡;\'Kª¿.‡‘\Ü)©¤L¡c\Üvi …ð73W6w;ªTÓ¢„\èªvÊªim\ÕÁ\åÍ¦\ÔZô£’õ‰jßrM\æœIB\ÂÌš\Ùst©C˜#˜gl´\ZG\Çw¢Šû6\ß\Ó]\âvØ£®ˆðvÙv¤\å«I˜\è–T\Ðme\Õs,,‚°\ï:‚ùùˆ\"Fzrf\nqH\à\ë+G§ZU`X´I\ÕZo	º…Á4\Ü\Ýz\ã}\ÆÞ¬<[K³ ¥´¥	\0¥		H\0b¹\Z¶¯‰G%\ÞÅ˜iyQ\ê\nû\Äp\×+CI\0… Ì¦`¨Ÿk\Ö\n\'§\Ñú\"!\ã‹¾¸4\ÓúE\í\ÄÆ¤³m\Òk‘J’¨LÈ¾ónM)—Peµ”–\Öyˆ	\Û\Ü@#`•\á§u•§+	»¡\\yp¨–ò*VOºi>\ÑO>yJ6´\às6\ã‰ZNB\ÊÖKŸ£7‡#4\Íÿ\0\Æœü\Â&ú)¶\äñ«Ì«\n\'¹ \î	\Û\Ú\"\Ð\Úò\ê­2¾\äª]­Ÿ„C\è}¬]\Ó\×\\¯÷¦¡U&WùZ¥^‡(\Ë3(-¤bfeJJ<<¤lN\Ã&7W\ábZ²È˜\Ñ\ÏGe2UÖS/9[º[C‰I#8L¼§ª6€¾\Ã\Ê\è6’µ\Ö7\È\ë]1n_Â¶\ã\Ê\ã˜2šuÃ–œH—A \ÈTg\Ý°\ÚaGú1×¯F¶jo<ÙšË­\æP^·š§nv¤©\ÆU¶_qj-·\áJ\nYð“‚I\Û}\ÌŠµŒ(h²²2\\\ÒJŸ\à@T”\Ç_\Ö%ÐºkNSž£U\Ä\ä¬\ãi\æ)Ii\Ä-°<”T‚ö\Ä!¬Ü¯ÿ\Ù','Trisha','Gunio',23,NULL,'09466485696','Pulo, Lipa',NULL),('U0004',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0q\0\È\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0K\0\n	\0\0\0\0!1AQa\"2q	#R‘Bb¡$35rt‚±³Á%468v\Ñ7CSs²\Â\áðñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\02\0\0\0\0\0\0\0!1\"2AQaq3‘¡±RBÁ\Âÿ\Ú\0\0\0?\0±ýÎ±­ûzß‹·vbj5Û†”¹Æ“\"\âJG²œº§8HPmjHRByç–‰\×Pºm[ô¦\é\Ûn\ÛË¨K\èK¾Ð„:@ 9\È<À\ëª\Þ\å©2–\í>¿µ¡¸ÕªK©]=\Ù¥öŠ8ÂœeA`\å+H#—Cƒ\á¦\Æôöž\Þû\â\Ô\î&\Ðc”Ê³lU¡wp:\ÑHS3T0\à\ç…\'ŽG†£i¦fŒº°UR8M–\î²\Ëß«~´ú-c1o>¦	*3EiV=z\ètÉƒ9S\Ñ\"9QFJ—\Ë?ü\é±w\Ìg\ëRf·@¥”¹NNSF€XK\ëag \'‹™\Î4\ë¤ÆrDbJ™1\ÂQ\ï\ÆRÁ \ç©õÓ˜\ä;	”+~“Z‡V[¶\ê£\ÈA,•)e•©\'—%tÏ§]xÌ Ñ¬ûm)£\ÒR‹•7\ÍnÔ’zI@¦1NA-:\é\0|%Y\ZÒ¸©3®ûu\êu6[\Ñ¥Œ¬r9\ë\ät±)0v@\ÓÜ®]N®sûqò‚”)\Ù œ|† QG»\é.8ßºZQË‰oŸ÷sÑ¯ðV\é¶cšO6\ÂJŸ	ø”‘Ïó\×\Ã÷ú•	NÓ¬i\ÜRÀ\rºÀ\Ä\ärYòÇ‘\Óg4\ê\ÉJ¶B‚£Óªµ•&BPl§@ d~\ÐðÔL ÑŠ\ÙJ¥\ÊZ>ñ\ÞóšþX\å¢z{Uˆ0N©$-”¶Ž\êBð\ç/x-#\Ç>#–—;‘¿\ÛKcK]º×·U=\êe%!\Õ$\çõˆ<(ùŸM!v\ç)JE\ÉY¦Hª\n\"ZmÔ¤\ÍJGx³\ã\Ï\Ë:0ŸU*Š&2\Ês€d#\'\Z¯17‚ÿ\0®\Ô™C·\à\ÓZpõœ\îý’”ß­–\ëû˜]«p%5Œ}\Üv[B.¡t¬”BžGpn¿y[Ì½ZŒó‹’œ>¶=\î\åD\ãÿ\0¼µu\Â&3t\Ø/¾ixIm\ÓÄ¡œó\'®‚™¼o˜™\Â>²¬©R#¡@Ÿ—½½w•*C’jT\ntô«¨HS*úc#÷i#;3€Qý4£¥ý–%\ÕU[O´¶–\Ù\à\â\ëë­š•¢\å\n\ä«}JÐ¾¥+\ÉIñÿ\0óCð;M\Úm×™7lwi\r!<-¡\êz{¢Iñy´Ë¶[³§@Uz€\Ôu³1E\×$\Æu%¨ó\')\È:+‰\Ê°‚^Q­K¾}U¨N¬)H\áXL\Ü$\"œóü´aR]j‹Fuo¨L»÷#º¬ Ÿ-|½sm\ìk\ÑZ;\Êj¢\ËJu\æ›iÂ•\'\æR0¡\×\Ô\Ë\ÆQ°ª2Ù’¥’JGÐ¢\ï	\à ,-\åBR–š\í!\Èõš#0\Ô\æRcG\'€§<¹šñ“kC¦9úY¸	O³ ’ñRSÀ½¾ª4z„|\Ö\\©¸Ò›\n+a)\È_¦4<\íZ¡S‚ôHo—RPñ}<IRO†_–—kI¤œp¤*iu\êKu\'¢A}d¥Æ»Õ¥h!@]i\×.+h	iT¨¤¡\áð©^_MCJf \ÄiKŽˆ\í€J8R\ÈjJ«5™\íG‡\Ä\êZ.`ð§\×F¥	p(¹U¬Ð§;QŒ\Òß‘Ý€Ñ‘\ï!$g]y³x\Ö*“Ør\Î¼¸i+› )*\äG\Ôøjf÷¤Šœ„S™”€„\\R•\Â3ž™ñ­7J¤\ÔP\ï[\ÂAÁ*óùhÃ€\å$Ze\å_¦@º$\Ð)sdû…ò\nŸx«Y¯K\Î\Ûr›tC¸\éÔ„P—%¥<r\êˆ\äO˜\Z\Íax\'dm\Ò\èNÑ¼Wk÷P+²ZnVøYy\Õ\ãºH\é’O€\å“\á¯\ç\í-\ØÍ—e\ÚlI\Ý5V\ÒCT\Új³…xq:j7sör~ö±/j­\nT¹\Òj–ÛÐ…Ÿ^#\É x“¬\Úo°K³Í‚\ã5þ\Ó{\ÅQƒ 0~ƒB©žü¤Žan\ä£ \ëªdp9\Ê\ì\Ô4”l¦\ïœÖ¸ƒ€	\Üþ\Zÿ\0%+¡ý¤=¤/[±U»¾\íµl›o-\Ò]š”H-ž„aag\ëùi\á²m.\ØYµ\äX•ZL:¼t.·\ZS­6|p]YSe_<|õ¡z]e\Ïd¨R(½™;*\Ù%Êƒ\Â\Ýrö”*•ô*R\ß+ú(\å\ç\\›\íq\ï5+t®¸u˜	t.=1ˆô\ÈJÁ\02\Ãi\áN#\'*Á<ô/º\noy\Ï\ÙuK\'JUõU3ij(¡dc|»\Ïð‚?…\Ð¦ûE{3n‚‘Ë…\Ú;\Ë  \Í\á[\n\'¦l”þxÓ¾<ø5Jrjj‹Gu9nDwBÒ±\èG]qJV\Ñ\íK\Ï\ZÅ“P™nM\â\ÈvŠ÷	ý¦ŽP¡\é[}®·£²\ÍNü®Ë—NŸRDZ€ÿ\0\Üñ(-M|8$c–\Ï]<¦\ê­D5\ç?\n#©{\n¦Ž‘\ÓR8BðvÚšô>rº¡xU\åQXSŠ¨e\'ªs\ÏB—/i+m¬IW\ëYDP0\nJrä…Ÿ…¶\Ó\ÕK\'J]³\í©·;\æÉ¢Ü…»z¶–ÔµÆ”\ïÜ¼2Kk>=}\ÓÏ—Ž«\îÞµ-õ¿Þ¨0M˜ò™£\Ç\ÉÂ°p§ˆüJðò\Zžm\Îb\ÖÂ¸-Ë¥.ö*óM[k‡\ì~\à¦÷\Û#x»I\ÕUFˆ‡m«uN\ê™\ây÷G2O\áN=u;cY\Ñ!°†šŠç \í©\Û\Éiu•ÈŽ€ƒ§µµf\ËC(þ(Añ\ZR\Z˜\Þ2â‘’•ñ´µnZô\Èh9À\å¢\'(‘–Ž œrðÖ¤kfteq!…s\ÑM¿mÔ¥€‡qŽ„gJºjw\r\ÊM‘Mœa\Õ!.0(FN}5	*\Þ²~šo\ËÛ‡\Ü9S\\¼õ þ\ÜŒ–ùj&¢h\Úì‚ž\ÅM#\Î‘õ\ÊŽ%HK9\èF…)4\ë\ïnjO\Ö6Ö´iª|ñJ‡Á\Å\ZAý¶ºg\Ô`ú\ê\Ä\ÎÛ†W\ÉI\ë\×Pu²Ž)JQZd+\Èv\Å:6Á\Â´·§ý$­»:\çJ¨\å¬%*Œ³\ÉM©DŸÂ£\ËÀ8iVEr@ŸTb0BˆKo2@ñÁO™:¯û…·)PSG \å*IÁÀ‚:0;=\ï…ZªŸôu¸÷\ÕL¨9\È\Ël~¢¿m>~#\×RPU	8;¨ÊšC\É\êü§Ü´{¯ô“R˜\èX-ðK-´\É\Ç\ÄFO¦´œj¢˜\Ë2K†8°Ÿxyú\ç\ÇF\Ý\Ó*¨D•&:¤¥ =”y\àô\Ðjm{ƒÛ“LD„¡Gˆ²yxø\ê@K‘²†#Å·\nÄ‡tE2\Å%‡\Ûqõ?\Ô/+B†H\æ=9\rQ U¡S”eT\Ûuò9ý\ß\nU\åËž?=H\Ú\Ûu]¸\ç{-ž\ãï…\Ü48”¯^^gM¦».¹@·Ü¹7:\ï‹Gˆ\Ò8œC(\ï\\\Æ:gÓžŒM¶ˆ@ù@U¦õ£\Õ]J¦¦cˆy¡\Þ6\ÌV’{\ÒO|ôÎ¢©p\ë²`ûuF\nh¸\n›J\ærž¾8<ü<´i»wM¯o\Ím‹Z-Vs(\âÒ¤6x\ÎF\nºc8\å\åžzüve’Â§V\Üx\Ë)qe*\ä…\r9ˆ5\Ãt\Òl°\à%\íÀ\ífŸhH«Î¤™.\Ç^[J\Î0\Ù\êušdÝµJt{=\ê\Å,U¸Z\Ë^ØŒ¡dô˜\Öh‹@8B\Ò\ç\\÷~¢v^ÙŠ¾\à.²ª|©øb¥\å\n_*A\nžñª¼}©i{\ÓE·xöºªD \È_”*´\Ê\Õ×‰\Õ¥¼}VN•[»\Ú´\r\"óˆþü\Þ\Æö¦¾²—#T\nP\æ€”×Æ¥ª·3÷SP*{%cZ\ïS\ä\'MB”ÃJV’9}3®}$n€\á>¹Àù\È^´R\Û\çcé£Œ\Z˜ÏŠ2\Ç9\ç\î\Ý24c\å=v\Åû\r7\Z‹\Z\ÅÞ­\Ø\Ý;\"½ †\Å\Ú\Õu •Ÿ\×q\n„;”\ç\Ì?Ž®N\ß}‡\×\ßm\Ú\ëý–ûTÑ·*Ö«+\ÚiËš\Ëlñ\'ƒr[9\ËƒŸ–¹q_s©\ÐVôkr\Ðy<<\ÑŽ\Ù^=8€\ç¢N\Ä_h~ýö#¾Þª\íþ\èT©Q&I+¬Ù“X?£&¨‘Ÿ¹>\ëK\å\Éh\áWžG-)ˆk\"-pðA?\ÐI²žñÒ·v\Õ\Ðj†C\é#t4ý¼Oö­þ\íÿ\0öl[ë¾¶†©md´©-Ÿf“HGg>ô¬cs&vÙš\×\è\ê´\Ê\åJ]nžú²¤¸\Ù$ôŽå®®vVûP¶µµ­\×\Üh‘h\ÕY\ÌpÊ£Õ’…´þG>,¥\Äúuô\ÔF\ë}’˜&M¹[•\Ùó\'3\Ç.%1\Þò›1\\\ÈR™Woš¿\î\È³¦&\×F¸·*\ÛS\Ú%â¦¡´\×pbki\Ó\å\É\á\Þ\ã\î¹U\Ùo´.\æoþ\è5gW-ªs\ã\ÄS\Ó]iµ‡P!! “\ç_ý¶±\àDˆ\Ã(†\é\Ìs:G\íObYý˜÷ž\á™>+HUamº\ßpx”‚xŠ\áQ9Á\æ›÷Ÿj-›\ìÿ\0¥^Õ´÷\ån,q\Æ\ê\Ètú\é\ÜTòÉ´m\Â\å÷›]EYúÚžøƒ³œL¬v\ßZôøM!iˆ„“Ž`s\Ñ\í>\ß\ï[k#\å\ÓTbö°Ç©¹\Ü\íÿ\0f\ËÆ´‘\Í.G„xHó\Èj\Äv|\í¾½\ÅLt\\ûC]·žX\ãUFqûõ$)¦‰ž?\íA¾x0~@¶Y\r…-ŒúcR°©ŒEF\Þ1\é¯j\r\ÍC®DK\Ðd‘ð‘\Ï[’\Ü`\'!cY© l›	\Ø-7\ÛR‘„’yyj.cN(ü<õõ^»‘IO1{\ç?UX\É\ÐE\Õ|o,–6]KrB%Íª” ròJ	Ð–	\ÅoQ\Ê$˜Â.z„ª²´\å\\\å\ã¤\î\×\Úñ*Z\×i\Ð6\Å1²JP$¾G€Ê\Ò\Ò%\Ýö\Ê\Ù7p«\ÞûF¹i	Qöˆ™\ì¥e?²®G>\\´Œ–\é\Z2J2©¥\Ø!Y+²žä°¡Ü\Ë:U\ÞT	´\É\r\×)/)©q]²\â9p¨m\ÞòÀSt›šÈª\Û5’\ßÔŠ\Ì6´Œ¡c\ÔNÜ–dj„Eq6=\á\È\ãL\Úù)¥\Z‚)bmDd/‹#q¿(\ÌU\Øx¥öš\ÆqÀ\à\ë\Ë\Èõ\Ónö²v\â\Ï\n(`(w²TŽ_O3¤f\ßY\×Uq \Ómä°¸u*ƒl\Õ\è ¶\Ù<–Ÿ\\\à}usj»Ÿjm\r¾š=\Z\íS[o€6\Â@B9eGþšŸetE›r ›j˜I¨‚&£\Û\Öv\Í[š|fZXAS)#‰\\¹¨Ÿ-V\íüÝº¦\á\Ö\Ô\Ë5\0)±ù2\Ñýc\â³\ë©m\ìÞ—®4\"•Cš¥´¤…L®\\k\ÇÀ‘øG\ï\Ò9\ÊÒªµ J_\nG0¥\ägRÀ;\Æ\å]3˜{¦!­ð¹žh¤Rh\ÅÀ\Ë\áN)„q-8|A\ZÐ°«{Ž€\êk\r‡XT–e!Å¤…))HH\åž@+\Ë\ÇQ£a:(1 ³[“2\Ý\â{\Ù$©\Â<1\é¯k>…,\Ñ\ZEfRR\è<H\ê >\Ï\n#\rõLY0\éuE!\å`,6¼cõš§F¨@§-©\rq|IA<þº\Ío\Ä}Q\Â£iØ©TZ}\á:RÒ¯u°°–s£½½\Ý\é6-6*N”\ÊI\áe¶ˆ_\âÏ‰õ:{\Øfþ\è\\¬G©\×!«‚H\nm3u\Æ<\Ò\ßR=Nt!\Ú²½\'bœg\Ø.˜2f-|/\Óa$©LÄ¥§]w«\çJô<°\â\Z&MŽCI8ü\à:\Ã\ÕÝ¡ô\ÝG~*¤¦\ï8sƒZ_ø\Ôœ¡­\ËK´\Æ\ìL¶\ëo\Ô\ÊWñ:´d$y\åDõ\ÑC?f\æö\Þr+q*(™ ¦\á¦s\r¥$uNyÆ›={D\î½õ{s&Œ\Ìù°\ZIˆ¦)C‰Æ¹|#\0‘\ç[«Ê­¶˜ò\ï\Æ\à¥\Ù†› Rø\Ï\ê•ÅŒ’÷@\æ|5B¹t%®‘­¨£†ž8\Ü<š¤tŸ~6\Ò\êý7\Ú_úã¤‚\ï%tò°þ£™i\ÚN\Íð“\â9û\äú\Î{ób7m\èc‚›R„\ÜF«Rfƒ<=8”ÚŽ\ÏOžÁÝ¿ûpY7-·ŸzÄ¯\Ñ\ÔÃ®-5X\Êu\áÂBø†A\ç\Ôj\ÕV-]­©µ9¯aK–\Éd,9\ÏpŸ\ÈôÒ¶F\Û\ì\Ø^*¸è¯¦9e\"Cœ+C,=\Ä’Ê²	$c–ª5}!Cqƒ\ê­:š\Ü\éÃŽF~Ç•w¯\êzûU\\´=G_ f°X4»N6.a\Ëv\à„\æªÜµ\rù–›”SUJ”ôD±%<Y\rs\')üÎµ\í.\É]’ö\Öro\ÓjB \ê¸\Ó.»$,o\Ýüõ5²u[V\îŠ*°T\Ë\í¯ÓŽôó\Ó\ÞÈ³\ìÉðÈ¶a~«¡„…\'\äqª4\ÑT\ÐLcs°F\ÅD±ñU´Kð‘‘ø)CRûB¾\Ï]ž•Õ¨ß´¸O¯\ét§d\0}T\ÃJBG\Ì\è¢\Ø\íc\ÙC|)\Ò\'\ÙB£1T\ì\Ä[\ï¤!DrÁ(\çô\Î4Ð©\ì\Ýs\è—ä´´Œ$Í«Ëšu÷\ZÁU%¼&¤¼\'\áJ	ò\ZM\Òwœœ£0´ º]FS0…nÈ­¦dB¢mM©8ð €sôÑµ­P¸®(|d¥\n˜>=A×›Ä„\Æq\å¹Ä¬¢Nlz{0i=\Ò\æFs¦\ÝÛ‡Ìš[\Â¹¨õøl­õF\ïc\'€\ä\éW{v…ªm³\éJlJ\ÝA\Ò}\Ö\éð£\êz©Õ‰˜žõ=\Ú\Ç\"0y\èb½µ¶\Í{/=qž¤\è\0-9D\Éñ\â\n¹£\í<\Ü\ZUÊ‹ba\ÝÑ«!]jQi\ìû8?0µ+÷i¯av±\ß[Ù‘*_aÛ¾’ÊB\ê5º{eI\Ç\ÇÂ·R@ô<ý5¼ö\ÍR©\îñ0…¤\Ñ.þzšµ\í81d¥\":ˆO?y\ÂG\ï\Ò\ÂyI\Zzc¸\åFi›ª¶\Õ,‡`H)Ê“ ¶¢“\åÄ…(\r\\tW\"¡m´Œyi‹ \Ü`†\Û	\0hR\ïh\áj\ès¦ó\å\ÎÜ Œ–»‰_m7*\áÅ™\Ì)¹	p§I\ÏùjIW½b¯SªÈ«\Õ\ã¿\n:\Üw\ÚC\\$ðŸ2=5X}\ÈUô=Æ´•(¤\àò8#¦…7Šö\ã¡ZÖ§+¸Š;\ÉL\ÅiJq\Äô	\â=|Iñ\Ñ\ÒS™$<%jn-§¦,\rÜ…§p\ßp\êx Ô2p­\rÞ—2\í…3/¡ù2[\âî“•)<y\êlW*t\ÑW\\d´Ó¯°Ò˜!\ä\ÚI=5\r_·\î\Õ*]¨‰Š„H$ñ£óÕ¢7iŸK—¸\åk_5f.H1•]BK÷‚*¢IòP=59LÞ‹nž\Ë0ÚŠ\à\âB[u\Ö	\àW–:[¹2\Ý5Z]·8\Ý\r¦Sl¬‡¸#Ó—©:%E¿IQ\æ˜\Ê\0©J‘1‚tSŽVŒ-%JV¯§\Øe2`\È.¡J÷Q#—\î\Z\Í/\ÍfŠ«\Î}vö½)ÔºB™Ja¤¯|i$+‰+Á\è<¼uš\ßx\çnz#”ß¦\Ô-¹Ô©ô»–*žj ¤—\ßfWtðÀ\Æ8¹\å<þ1\Ë@Wf-Š¾2!Y3¤\Æm|\ê\ÝJlŸ70\0üÆn-‰¢\\5a\"q\îdH-ñ\0$\Þ\Ê»œ`«…¾t\è\ã\Ï:±–€‚šee€\ê<¥U÷Z{¬\'Ô´\ÓCòN5k°]ª\è™ôs\\\Ü\È}Z\Ñ\Ï\Ét®Ÿ§z’°]¡°Dú¯G\Êþ1Ç…¤ø(\îðƒ\ÙÃ³M\Ô\í\Z=:}_!¨hZ˜hc¢œ8S§öS\îù«U¾wj\Ê]\Å$Ó·\Ú_m\ï8’¥©\r¸®¡HÀ8òå£ªý½´tŠ;\Ò(\ÛU·U…2ž¦E\É[~A#‘\ä\ì\Ä|À\å¥5z··T†Ÿ©\Ì\ì\ËeS™P<N¿\"¤Bs\Ë)þ>®ž»7K^z*š\æ\ÌqvÄ½\Ùqý\Çý/<õ\ÏOv¯p®mulR66xš!hlM‚N6÷\å¹»»ƒ!ø;–™-\íJK‘»¸l\ç\ÞSŠ\á\r Ÿ%,‘\ät®ÝŽ\Ôð\Ì\ÕP,….\ézL\Ô=Ry‚*‚\Â‡\0~\Òy`\×KK\Ãm\íÑ’*6\Ì\ÚT¨?\ÍkRLw9ñp¾\ë™V=qË¦˜»Ga\Ûô«Yš\ÄÈŒ´ “÷®c>žZ¿QYm5™¥tGÄ†“ù\Øas;—Zu-…d•s\Í.\Z\Üvc“”\ä\ì\Úný§\ÞO\ÐoúT80$·\ÅMi \Zs#\îù“yó<ó®‡\Ø·Nzo$!$ŽxV¹n\ÅF\ÞF*”\ê€\"2\Â\Ð\ãI\'*‡—3«	²\Û\ÏZE\n=V\æ¤Ï\r\ÞI–\à¥ \å#\ç®!\Û/g²Q\ÌÛ¦,Å\Ê}ÿ\0u>\È{Qm\Ò7P\Þ¦løI<lû…|$oE:;$¤\å@t\n\Ð}{´Û¤¦7Ý¶…+\Â24‰¹®Ë©ú7\ékBS3\Ù(\Îø\ZR\Õ÷r¿B\Å\ÊÁŽ”¼.“Â‘¯;1¯•\èfL\É<ªèµ»–”µ\"URí†£œä¾‘\ÏË®˜öNòYsDAZŠyp¼¹·F»6^üš§œ½h/¯‘s‚`Z‘\á\Ìc\ë¦m¬\î\Ò\Ûðý’\r÷‡ˆ\âAi\ÇŸ\ÈiS©»» \Ô2\å¤^Hl<\åv:\æ·05\"ý³\Ü\ãn—sÀ\âG6Ø”•+ò\Z©\Ö\×%F]UÛ¥R¡„û«KnH@ó9#F´Û†“¾[j8\ïØ¥¹ÀO–RœhFŸP“4o”\â—s.[jZ\\H\ç\ÈgP÷­A“\Æc€\ß\Ä|´«\Ü\Þ\Ñf\Ë\Ú\Ã+ö©*´¶Árž\érJ\Ôp\Óa<N(“\Ñ G\ÂÞš…\åLY‰oMf¤…2j1Ë…>¨W4ýt“†xDHŒn“¶wnYˆ\nG0p|u¯qWS!*9u\ÒfÚ¨-Ò™‰\Ã|ú\'EÆ¼óŒ)Dò\æ<ô\Ý\Í$\à&’I!\r\î=}ŠI5©•\":\n\ÈOS\é¤\Å\ÏÚ­\ÈR\Ý\Z—œŸh2ŸŸ†Š«\ÕÑ»\Ã\ÚN\Û\Ú\Î6\ÓK£Âdn\×5€b\Ò\ØÀ\àa$ò[\Ê\ÎxFH\Ç<j\ä\Î\ìóaF¡²\ÍBoTœm\08ª¥\Z;Šp\ã™\æŽD\ê\Ûj·f0\çOº\×\Èe\Æv\\ÐŸ\ÚõKMvü¥\Ã<YHüa’3¡š÷k\Z%Q.B¦ÂŸST…€´{9m.Ÿ—†¯\æv^\ì—wIrº}ž©‰.\ä3Z·\âû¿\Òc_\Ú\å¤^õ}3kP\ã\Öû:o\Z^‹\Þ%\ÇiU\ÆR—Ö‘Ð¶ú\0Bˆª¤¤=H\ËF\æp8§\ÕW\É;Ç¸•—\Ì*dj]9(÷ZfTg\ÖQ\èH÷I€\ëNuGp]’#]\×meTŽ7M\nŽZAñ^´eN\Ù\ê\Ù\Ê\Ûö\Ír\á¦15…¥NG«\Ó\Üi\Õ$ž©RJ“õ\æ¤k\Ýb\Ïþ?[\ë\Ö\Ýô¦“\ß4G™[g\Ü„gQ\Ï¾‰\ËN±Œ¥…™iÔ¨Sn\Û&Æ«\ÔW\ï~¥U¥>¥g>òŠ–9òñÁ\Æušy\Ðnûbta.\Öq‡iÎŒ¶\ÌWr\Øô\ëýú\Í^\ÎQˆðšÂŸAm’‘	¾~E*—kU’ób„’—Å‘\Ú[…S™·©÷!\î§É¥2\ì¤ ’qH§Ÿ>Y\Ç\ÓA›»ÁhÜµ…”:\ä{ªdH\ém$}\Ûd\0NO3×ž£#„Õ¸H3€POhúü=ºšºiM®\Ã\î†§\Õ\âPA?BT•qxró\Ò\çu{L\Ù\è¶\Ü7f\ÃYðbHIG\èï´¥’1€K \äi\ÛZµºÛ­½*nw\Å6”1¡6ùmAÁ\Íkñ\'ý4¤£7)\×;ºý­>§-’K	—$© \êR‰ð²`÷L[ñ\Æ•h§¨»SQšYh»\ÎðxK\Ã\Ü\Þ=›Ÿ\å\ÓmºER|‹Æp\ÓhP\ÛA.B\ê<’…/\ß\ÓG›un®ö¡?S±7\r™N\ÇÂ—M¬EDT„û y ªsnjÓ¿¢\êV”jCIø”…+‹‡\ÌuújÀö|§=fm\Ô;ž…;ó\é\ë*p\ç\Ú\Ùñ6¬`¤òùk\Ð}+v¬‘ŸP*$“a\ç\rþ\Û\Ï\Êó7^\ÓR¸6\ÓGi>MyùkøøK\Õ\é»\énˆ¿\Â:$G¡Kq\rµR‡-+i<D\0T@÷Oˆ\å«\0{\rv™¶-h7mC¸\æ¼\è[°\n\Õ.+,’\é\rº\Ú\Þ8<¼´»£ö‚ª\í\ÝÚš£A¡H¥OŠ4©{\Èò[W\Æ\Ù\â\'„:y\\¾\Ë=ª\ìÑ¥Æ´mjI¤O-\Ê9öt»PRò\éËÔŸQu=\Õ\ÔÅ;‚©V˜´¶¨J@\È9wj{*^\í¹D\Ë^\á®Gœ\Ú¥Æº#wR2”§M¤\Ä:ó\Òþñ…Q‹UzÜ½¨\Ó\êM}™	ðüI#!I>`]J˜\î\nÀ\0Ž¹\ç N\Ð4k\n¥¶µ{‚ù„’\Í\Zœì¦¥#“¬©)$«\Ô\à`ò:ó\í\Æ\ßDŽ—•\ÞmwY)4\Ç\è5 [¶½…x½uR!Å£\Ô% !\É\è€Û¨s ­IJ¹ø\ã: \Þ-µ\ß\îÖ­\Ò \Ö{CÀK§d¶š5¨+–¥Gq*QÇÀGC¶^\à\Û7­	Š„µ6\ì9i%\n8<³Œ#©¨öE>‘(O´\îÊŽBP\áÀ\Õ^V5Ž\Ã\Â\è÷\Zz˜À‘7*·Wj™;/af\\z|º\éAØ¶\ÅIZh£ƒ%*)+)ñ>\':\Ø\Z?o\Ëj\ÙJVñÀ¶\í¨)0_r’Äš‡vOT¸\ç’|¸#\Ï[†÷\"¨¦Ù‘|=À“€Jy\ã\ç1myq\Ê©VœyC%XÎƒ\\zv	]tyNTµ‘µ\È58×†\å\\•¶·&=^\á\ÚÁ#\n\îR@C\0€\îÒœ\àg:2©9õŽ3Žƒ\Z5\êm.(\â”\ÚR‘\ÍJ^–«\Úrß´¡¼\í6:\æ<\Ø8	PJI§\ÃM‹I;&STµ\ÙöO\ëš›‚§ß‚\ãbD¥ð²…/ó8ò\Zk\ÊUª„\'«nh§¥I ¹I‡—\æR·>G„ëš¿gfù\îŽõý¦ôJ…\Ç=k§\Óh\Ë4\è\Î\Ìt‘Å‚pNq•¦º\Í]®¾\ÜR\ËNû\Îr\â\ÏA«%ª\Ý	\Z\Ü7U¥\ÆF0\áEm¡·\Ûl\"\Æ\ÛX2\ØQSòd»Þ¿%\Òr\\qgš”I$O.T¹j\ë3ÚŽ\×A\ß9O»£2iö\ÐmÙŽ;)\Ó\î1\æ}O¦¾#ViH™#9P”O7\ÈÏ§–¬\ícZ0ZIe\åÈž\ãnßº š:c¡ôžEå¤ôóÔm[¶mS©\ëy\Õyº² D\ç \Ô->â¯¸¡\Ð\á\Æ@\è]9:’j\à©$f}j;y\ê–\Û\Z\ÙÇª\Ö}\Öü\ì5™¿6ò©7S{-(SªñÑ‡£«À0TŒó(<µCwio}¤r·g\ï-§#!•ò\á\\j“>\n†3\â“\Ìk¢\ê«\Ó\ÝBªOSÃ	n‡an¥´õ©~Sš¨Àx¶¢¤©©RpR~Za=0~\ìNb˜ƒº\å\Ý\nn\ÍRe*¥k\ÒfQj µMž¤\Å_ªšVA:\Í:7ÿ\0ìº¸©.=röq»„öÁ*ýYXK\ÃÑ·†¯’€>º\ÍEIO+]…$Ù˜FP’e¾‹Qˆ­ŽV\Ú\Zo\áÏ ò\Z¿®}¾ì¯±\Ï\Ô-¸­Îšû±\ád—%\Ê{*W™\'™>\Zbnu^\ÇÚ«Bu\éRJ\Ö`°¯eŽ§2§]P\ÂHTIó\×9»T]•š\Û6\Ì;\Ê\ázU\Æú‘)§\\%\Ø\Åj!œ~©\é\êJ++™RS\ß¤\Ìy\n\Z•¼t\ç®\Ùmnûsù1j¼O%n)X\Ãn Ï¢ù\é\ÅrGm@nö¡¢\î0…Dg\ïTV@ |ˆ\Õ^¨BjK†\ÙBÐ·Xö–Ê²IQÂ¾¸ÎŠ7Gµý½v\Ãv„ûz;O¥†X“Pi\ÅfB\Z\Ç”JUË¨<ô“\ì28r§,½¢\ßì°º(\å\Ô\Óþ[\ãðš\ÛÙ²\×UõµŠ»\âY^\ÅÂ´ª	rrñ\â ¡$ò9\èN•\ê·h-\rÅ‘G¨FŽ“Æ¶Ž\\ac\Ç>_»@4>\×[Ý·\èý\érL—\îFš\êAý^.cS·\'k­\Û\ß8\Í[\Õ]Æ¦[¬%®O²¥ó\æ·9ü±5l±]\Û\ì1Å»O¡T¾¥š^©«úª’5ñ1û\ã”À²÷a\íÀ©\ãSŒyª|.“6Tµüm63“\Ì\'\×]8\ìÙ’\èÙŠ{Û‘¹.¥5º\Å9¶£\ÒøA4Ö‰\âPR¿ñU\È:Œõ\Õ+û\Z»#»PÝŠ§h«\î¡lkdˆ´b\ÎjSO\Ëq<KTÚˆ÷@OŽTO€\×Q¨€\ßç§—N¡u{1t\ç•\ro³GK&§û)\×\çñž½ž«gÚ±».\í\×cª¤(+y3.*¤ZK\nŽ°Ã«÷ø|ý\ÐtødŸÝª£\ÛÁ\änoh­¹\Úå¯ŠŸA‡*½Slg\ß_òl‚:~#ªŒ\î\Ð\ÒU²Š0\éFR³g6\Éûc\í\Ûr¨ÓŠ–ˆ\êzJœú”µeXñ\Æ4Cf2ÿ\0\Õõ\'RQ~ð\Ñ]X)Æ’†•\É)\ÇM\rL€ ùtg‹\Ç\Z©\ÕfI\n·@ö1˜†¸u*R_pñ$c:õªo\íF*\ra\'½48\ÚG\Ç<xh¯n.k®WuH¦+„õy\ÓÂ‘þgH2–¢C†«ª\áŒjrŽ»wò¹5=P¬¥†RNV\âü>¼†“7þ÷Ü·\äw(;3mT®\ÊÓ§»i4ø.HC|ñ\ÄJG>º³6\ïbR¿\Ü\Ë\ÝR*¡·8\ÑME\ÒH9sûGšmÝƒh\ØT¸ô«Fß\Z,t\á¸ðc¥¶\Û@\rNRYXF©yP5w—?-fÁSß²ï³¿nÍŠ\íg´\rá¶¨‰C¨Òœ§\\\rÕªŒ¦@ad-.6\ÚÄ•¤{¼¹å®¨][©\Z¡\0pJv\"qïº2>¤€4¤b²–šSŽ¼\Ú‘ð¶®Ÿ3\ÓPR\î¥Ý†i\î¨@a\ÎÀ!\Åy\ã©\Èad#@\É1ä¦•um\Ùo\ÐÔŠ\r^pJIz¢Bc\×\áW¼}¥f\îô\Úd†£R-¶\Ö°+—\ÃÀŸ€’Iô\Ð-.¨\Ý:–\Ü\ê’:\ry\"®€\á\î×•¨ó:q„Žb/u\ïWjpS£\Ä p÷Ž<|òJSùFÜ—½óUŽ\ã4Û‰ŠXP\ä÷²¶â‡¨\n$h)\êô§_ö\Zx\ãwó§\áoþ§^­T¡Rò&B½Ë‰J>ƒÀk\Ë0•\"~\æSd‘/7&eYZ^h¥x\à\ãD\'rn\Êk_¤&÷ï´•²u_\ÙN `\×dº‘\"b\Ãm8#´}ïš•þC^\ÏV#%£\í	\n2H\Ð8E¼a0\è;ŸG¬¡†S$!\çš{; $c\Ç\Ã÷\ë4¬Œ\Í>¢¥”òƒ€¾h\äs\Ìk4 ,T;}¿\ì\ê\Äÿ\0™¢‚½R®\Ôñ5qÿ\0Xoü$\ë5š”‘G*¾?žWýIý^v¯\Âÿ\0õeÿ\0q\Ök4Ð¡o)Kp²=ý}\ÍAŽ‡\å¬\Öi¤¾d\æ>J\ê\ï\Ø\rÿ\07gü\ê\ïø-\êû§ùó\Z\Íf²?*]¼…\ê:ý5X7\Ûþ2ÿ\0£ÿ\0Œ\æ³Y¦µ^E+Aú«\Íÿ\0ý¿å¨™?þ–³Yª\ã\Ô\çü—\å3ùÕ¿\é7m\ä“ò\Z\Íf§h?EFWò‰—ñ±ý=O\æ\ï\ìŸ\î\Ök5,\ÕyQ5¯÷jGþB¿»Z›yþ\ã\Æþ°?¿Y¬Ö(\Â.=~šóüºõš\Í\Z%÷Dÿ\0gwújÖ¼?\çg>º\Íf´\îÊ›‡ð}\Õ•G\ËY¬\ÖB’¥ÿ\0°/Y¬\ÖhEÿ\Ù','BIGGUS DICKUS','ChadBig',21,NULL,'09386508693','Lipa Batangas','Hello Kim jong Un'),('U0005',NULL,'Keith Richard','MEMER',21,NULL,'09386508693','Ibabao',NULL),('U0006',NULL,'Chad Big','Montefalco',21,NULL,'09876543222','Cuenca',NULL),('U0007',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0q\0\È\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0L\0\0\0\0\0!1A\"Q2aq#‘46¡±²	358Bstð$%7bruv‚³Á\ÂCDR´\Ñ\áñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\04\0\0\0\0\0\0\0\0\0!1Aq\"2Q±ð3a‘¡Á\á#4R\ÑC\Âñÿ\Ú\0\0\0?\0ü95\åI\Ív\á’\âxm¥8°„’v¦•\äg\Â\è(m¹_\Ýo>\rô«\ç4²õ\ä8²wp©G\ï©	Œ¹¥8r\Ã8\\\Åe_:&\à|c\Ûß»>‘\ål’£Cy#s\Ç!\å\æ”M¸¯¤<›\Â\ÚAò4\Ób¹\Þ\ã¦Ó¦¢ÁJ±\Î\n\×ó\ì+Þ¦›®¦LX\ä^%_2M8\âŒeAz,<`&*vÇ©5Lm\rj^bA%Fh^V\ßY(\È) “V§\r§Fn3\ä6 \Í¦=\ÇDH\ÔR\ÒŠy\Z\Ïý*_H\ÎMµ\r!Ü€û#4¬@\æl¦\Úý…Ê¼\á\ÒyFP·µ)¸‚:F\Çm\Åñ-”Ä½$²šP\ä•Â–Zaõ¸’U¹i°³÷þúª™)2¸5\ÅBF€%@j\êà­¥\éo%\çwBZ\î(O\è:\à†—BI ¥¥\á*P\'bz„©­9\ìÿ\0ÀMYª–\êmlF‰¤†\Õ1\ÕD«\Î\ëW|\ÕL\Å4tT¥3µ®\ÌNSZ»D.F®p\ÆG2V“Ó¦h?R\é¹6k»L•r/u6¬Œýkô/N{p\êdd¿z\ÕWi«ø\åES,Œc|•m\é½7¾?u£\í]4‡®Ðš\0©q¥Ú™\âq\Ôs¥h\Ç\Þ)˜l™@µ¿‰\áójW\çe\â\Ò.’v8¡«›;\Å `ƒ\ÜV³ö§öâ·³\ã\ï_\í!\ÍO¥\ÒR|…¡q	\Ø\Ú\É(\é‚S\ëŠ\ÎZ—J¾ÊŒ\ë	Z¾w’ýugF\Ò\Ëi´\Ø1-’œ\r„ó‹X(À\Í7LeŠˆ36\ÒôUøo¶:ì¡¸?CÞ›ü‹)\Îz\Ô\îa ×‚—:œc”œ\â¾\Äc\Ä_&:\×f#+•UÝ–Ì„ž„\ë\Ë\Åõ N\Ùi1\åOSÖ¹•)j\Û\ï5\æ\\Œ¯\0t\ï\ë^íŒªD”4\Äq[Ie\Ä)M1ou¶\Õ/—†˜].eWP\èÇ•c4i&V›\È)éŠ¯\î-¥rŠ³œ¯#zÀ\à\á¢\0,\êŠnMºG”§žÔ©\ÊZKÖ†*-ŠU1h\'TöX\n‰’\ï>\ZGARz:\Ðõ\Þûh*+tg•\Ó*X.‘¶jÀ\àm¿7órq¢C*É¨œr´¹t\rU\'\ÜeKb\ãODÁLVG>z›³´½9\ÂÜƒ‡e+ \ì(q\å=«µ£\Ë\Ç1[\á	Ï 4Q\Är-3bCžX\ìŽtSB[B83\á÷I\ÍVPž’¥\êTH’@ûQ’{oG|O°¹{\Ô\Ð\"\ÅFK\Ñ\Ðó4;\Ã=Fö™×‘\îp\ËAY)Qz#OS±òº•$Ÿ¨­c\Ñzwˆ\Z²©MÇ±^£\Å\"#n$·\n\æ\æB;0³\Ðá“·–Žy\ÙÍ¾\â–I\ÊAUGÔ›U¢‡²	ñp?¤i\Ý\ÛK*6‡b\ì„yÐ¤ò;\äT‡¸i\ÄM7{Cz\ãD]-²)Ju2a«”\à´‚…B	‹/–¦N…µ\ÂFzR7Q‘Bz¡ƒ¼\ê°=®•y­­³/\è·4#%)	tž€zšq`\á\Ël²\Ý\ÝJñœyÔµ<\Ø\ßW/(P\' \ß\'¥XÖ­\ï\î\\,\ÓY\ähò\Ûsv\0oƒ—®*\Ã\áO\0u#q¢]§AS²\nLFœ\Ï:P	\É!XHô~†Á™\Û-\Ôx©\Z\×Õ®<\à.“\Ò\ì\Ä\ÖEšW\rÅ—·©²\\”±\ÙJ9	OL¨öÚ¯=®81¡“\ÇJ[Q\Z*\n\Ó,„”\'m)mÓ½gýQ{›ªu¼\Ùw\ëšb[-Žû«)@HBP\Ù	<€\à$dTv\îO¡ƒö\çöl\Ð7F4­—†&øµ8D‹MK\\¥\ä‚L…¸\ß9;o¸ù\â§\Îù¥\"ü‡\Ýså‡¤mO¸h´þƒ\ãµõµGM\Ü\\´\ÝXmnAC\ï%l<1\Ì2Vž\ê\ÈØŒdW[\'¶7\rÔ¥iýQdf=\Åp©\È\ÈKjY\Ç\È\0Fz`ú\ÖW\Õ|TÐœA¼Ë½p·LK²º\Ë\å7,\æo!*\Ý.(%E$\ç>d“‘\×U‹ÁN\ê=Aizøöšqy\æÔ–\Ñ=-\0!%Ä¨$üÀ¢ˆ¥ 5\ÙG.&33\ï\ã¨ñW¾…ö¹\à·\Þ~\ÃqŠ¸\Ð\Ñ\rÁtvS*So Œ¬ò¨+$Ný+-ñ§\Ù\Ù\×Y\ß&³Àþ:A€\ëŠ[°\í7»RU9\Ü4™Mf€\è9’¾À\ã¨¹:oW=¯\æi–nf\ß\å·\å\\\0>\ì;´\Ìy\Õ\Ø\0¢;‚FrºYýš\ÝZôü./¼‹\Ûnø~#—V\n¼\ìTœ $o\Ó\ÊqØš&\ã\\m\ë\Öêˆ°q\ÄzŽ#\Âþ+;\ë\î\ê\Îjq¢5¾›0$¾‘\îò›}.Ä““\å[N£(ZÀ(»¸ªþ\ëa•iœ¨“R“·0ëƒ\Ú+K\ëK>¸¹ªG	õ)[²­\Ü\Ï\Û9–6*Zy·\åR{c·Êª­s§.M+Á»\Â)m\Ì8Ó‹A\çk;`ý\'¸=\í\ïŽQˆ5R¼fŽ*´	{›\íÒ¼¸¥x¼\Ã;zÔ•\Æ\ÒüU).4\0N\Ù\n~5\ãn¡XR~Ÿ:\Z¤ðmyueK\Ü÷¢¾Y…\Î\å\â¬T³B…$¯É«c†V[lh˜\â@+Vk\ÏvVè°¦<BRc0\" \î½WAo(¨l\ÔÑ¾³›\ï2¤)KNqš9\Ê\Ô>x¥\Æ\Z¢h´am”6µl6\ÏÊ•1\Ó\ï‰\Öo\'Ì©P¹\Çu\à\â\ÝY!i”GHß©«7A04·\r\å\ßlIJ	úUwf„»\Å\í¸¡9\Ê\ÅY¼GlZ´ô6\ÈÇ”€~Y®db\ÖwŸ]=+‡\íh¨\×:WÀ\Æ\\YýtË‰÷ö\æÞ¤º’·N1\èOp\á\r\éýr¼89T\âJ\Z9Á;Uey–\äËŠ–µ“\æ\ïE\êbž\î\êRÀd:´)•[\'˜¨rÖ³\àdt\ëK\\>\êùQš~B<[%\ÊG\Å\ÕlYQ\î\Ò\ÎOe¡\ë6ðƒKCªQ%ð|À-\Õ›Q;üJžw\ï\Ö÷Hi—\Ãl\0¬l“Ö½‹ó#£ÒžF\ÛtðZ]©B\á5ñzv\êóg“	e.Ejb\Ëi \ã\àQ)#\î\ïRw>,Cº\ÛW_p¿Oj)ö\Ýfs\ÐC2q\'#\nk“ew5j\ãÆ›\âDP¸¿`’»ŒV\Ów\Ûk\ÉL•2ÁÄ¬rº@\Ø+)8Ø“D¼A\áTHZZN«Òš™›)BŒ{„6¹V²R\ê2|5Žý½	®;D¬wr–£‘\á²h}q^´÷´\r-­<Æ¥\àÍ¶—„Éƒ!\ä-;’r²3¿n\Ôn\ç\ì±t„©z>$fË YÜ²¥\ÈA\'\Ô\ç\î¬™k¼H‘\r-\Ìq\É+\çYB\Û!D¾\èß˜\ã\ÓõQT\Î(Þ¢iµZl6\Ò\ÝK‹i-„\Û ®Ó¦p\Ã\Ñ\ä²\\mÒ¿ðºó¨›T¤­\É,%½\ÙeA´!`•ü$­džü vz·*é¥¯?“\å\ê«Í¥ÆŠq\îÖ´-~˜I\Ç\\l1]\à\ëýg9´µn¸º\Ò	\Ù\r\åG\'\ëûh§OkM[¦œNtÊ›\ÎV\Îgl_Dq3E¥\ÝðºúA;\ê®^\è«}§BLâ†ª·\ê_b\Þã¶»]ñ¦Ÿs!$—\Ê\Ël¤eYY\Î\Þ_9}ö©\â\ë—|\ÐÒ¦Ùše`ÆŒmÜˆO(ø	^{\äw\éW¿8…e\ÐÊŸ\â&¬aw·YB¤¥\ÂV¦Ðµ\0\ï\Í\æ\É\é’©{Gxvžæ ¹Ç·£‘ô)\"šIHQØ£©¥a\ç{f/\r³\ÞO–Š7ž±faòU6’¶k_ks¾jM¨\í·fP÷‡ Kƒú•m\à¥\Ñ\Èñ\Æ06s\0\Ím¢-\\\à­\Þm²7³\Òo\ìÜ›\\Y°\ä\ßHu¢H\rº\ß2¸;÷­\Ò\Ïøo¯mr4lmW\r\È/ÀðVˆ²’H*òŽtõJ‡®r²G®ºZv¢—d\ã—\Å\Ò\çj|´›\Ò¶\\ž\Ðþ-n-²žrQƒ““UAŽts—}ÿ\0.>´L‹;Ákš@\î¿ùö]=Ÿxw:\ë\Ä\è\ZRZf·nm™2´{÷TH—\Ï\Ç\'-¬¡I\'U€Ú‹8¿\ìE©n‘$\ß4ñŽ¹k<\È\ÉNTHP)I\ÎH$dúŠõ\ÂOhNKf“\Ñ=…b—\ÎX\Ï\ÇR”µ«§%D©yI#$\çM¨Ú“ˆ7™\Î\êW¹EZ”P\ÃJÇ‚®nUC¸®† ±¯\ÙPY$\Ïh=\ê˜\â²O´”½9e‚:¥÷\n*\âi\é/!\á\ê\r=k–›öö˜\Ên¼K³D\áÅ•ÀT›\Ç$þN\Ï\Ù\Ç ¾\éÛ¢[û\èŠ×¯ø\Ójñ#X¸™¨\àž\\(Å½\ÈoËÇ•}+§A\ê\Î#_\r\ÓSjrŠ\âLº]¥8ñil•¬“ôÞ•/\âN£@Þ†Q»…rû¨ˆÏœfa†\çõ%\ÎC_ù\ÛFˆO¹òñ¤¡\Õ\'\æý*Th³§´B¯úr\ê\Å\Ö\ÖÁKOËŒ•!l-Y	K­/lœd{M¯\\C\Òp\ï#Eð†2\Ò\Ë\0&}þJ¤HP\ÎCyÙ¤|†ÿ\0:€\×.Ei„«\ÞS…$9%j\È=r	Á\éY#òÆŸµ±›\Ý\0\êuxmT¯2÷?:|”m\×5\'}œ¹S99‰J6ññ2{U\Ìq­U¢ôR\ZVzbN\äYò/¨¥L\ím¨»\ã\ì“ß½*Ü¡\Ë\Å\ÔTg-Ë¸\êör<¨<\Ê4c®–.º±-´r9ƒh¥Â4,q¤\ÜªJ	\íýó_t\ê»\ë0¥PÂŠÕ¿¥q‹À™\Ïþ!^\íX\ÞW^$LoOXa\é¶ˆðµ[Å‡&\ëuLHˆ*[®a õ5%\Ä\ÝJõ\çUIG‘r§\è*\Ãö~\Ñv\èP\Ü\×ú´û¼qöe]\ÕÚ›¿-‡\Î\íþ¥a\ßA<¿[X\à÷lJÀ¹\\›\Äu\0õ ]-s.\Û\Æy\ä\n\ï\Ä\Ýg\'^\ê÷\ï.¯\ì|8\É\ì*G†0Û•Š1”³\æU60\è`.h\ê}{’\\¤¦\ì¬\í5Ûˆ3a\ËASP\í©H\åQª\Æsû*[…œx\â„\Ô2§ô„2¢•§œ\0S\ßbpv\íÒ‡t|õÅ“¨µ*Ù©\Ò\Úô\ÛÏ‡rÐ¦n’”Ž \àü\Ïo\×Q–‚]ÆƒG¯ŠD\ÉEz±µo†­”\Ñ\Õ\×ò¥ˆ°eÅ«·ÂTIô\ëCw\Ð··*Z‡Œ\áû@¨\Ü\Ô–—“md°’\Âò‚¡’w\é¿`+ž¥º8\Ûm%n«—\Ã\ÊFzŽ\ã\ë^– \ÃCe3YÑŠ\nN¯¸Z\ÞLkK)/)ymdü#\åE½AwvO<ž.²“\ÊÌ§<\Â\"q•,o\Ôý\çZªü\Ô6Ò¦B”\áH\Î\à|ªFÁxq‡\âJù”yÕ…nšK˜K,ÊÐ9¥¦?›ccS9\Ì<Q¨\îR”V\á?+N6œïž˜\ß\×z\Ô÷›@aû„]\n\ÌT¾\â\Ð\Äh·I>\n\åJBT²@\ß\ÎÂ½J¹C™\áøò[Ê–2]Ny{ÿ\0Jñq·6\êƒ×—\Øä€–\ÞJþ\Ð\r¹‘\è7\Î\ãþ´q9\à\Ù>köJ—¨5\Ù,\\Ú±[ì¡•µ\"\É\Ý\Ô6À\æ ùûœœœœ“D—}m©e\Ù[ºj›¢&\ÏJJŽ\\)Ö“ŽT¬ˆ\ìhkZ\Ï\Óvv\ÚoO]Œ–\Þnulúglƒô¡»ž¢”ôfÒ·	\Ü\ã\äZög\ÈðO_F2\nE65	Ú©Gku\Èñš!\Ù\Æ@\Ç\âv­E\ÃX\\<\â+°\Í\ëT\ÅDÙ‘w->P!I “Ê³Ô“\ëY+E½%Vg¡\ÆeG\Þ_F\ä\ã\Ê	Q$úmS\Õ&Kyû£\Þô¤)i\ÌøkAß­W\0‘À\Ñ\ÛDR\ÄU\ÅkýUÂ¯g~Ov.¯×¶¶‹(>YRŠ	\ÇÙ‚\0P…g¯j_j\Í\î–W¸\r\Ö-N\Ü.\ï %\é?\èŒt³Ö«\ÍJ\í—PÛ\É\Ä;\â\Ë#•\×^.%ð:¤óˆþ\â«{Â—\ï+. \àƒž†™Jl…c:f7H›†\Ò‚Òœ_Ä¢Ný\êKS:ü\ÆÜ™\ÌyPŸ¸P¶œ–´ „ƒ8¢+¼\ä\Æ\Ò\ëñ6+Aõ§\Î\â\ÙE*#m‚\n¯\å½\Ì\ê\Õ\Í\Ô\×Œ¬!#s_¥-Ó¾Ûš\Ópù\ÉN	\0\Ón…£\Ùun!‡\Ô3šU5z·†€\éŽô©}3P\åj\í«n©°\éõ!€§’OÖ 4ü\Ç,zf^¤_ñŽŽVó]¸¸÷u·YâŒ‚×˜™\ÅyÖŒ3\n\Í\Â\Ö\0b7Š\îz\ä·Xš?‘³\È+\Ý\Ú\ä€\í6\ÙZ—R7\0•È‘¿\Þj\à\â½\í+¤!ð\ÎÖ ‚\ÓA\ÉJI\ê}(C„\ÖØ¶g¬.HLq–ù»še®/Ž\ê\rLõ\Ñ\å¶	$~Ê¤þ¤\à›\çö	{7Ÿ’e\\\Ír°\êhÿ\0…ñKp\äNIÁ\r’j»÷”¶9~\ê²8u-¶!Ã¶<y}\é\Íþ”üE˜©- g²ˆ¡\Ä\á+ÑŠ°ô—T²U·s]xwni¹EAjy\ìz\â¸k‰¬D\\}9¢HO(\îh£O\ØW\Ù\È\Ê\nBV\á³S2\Ë/ùõò[°\äxöø®[’‡\ÒP\np¢N(3W\Âñ#q\Ü\n[D–Ê¶*|f¬. h+\Ôþ;rÑŽ.Q\Ó\â\Æe\ã\Å\Æ\å\æG\âj²qvf©º\"\Ù|‚”Im¢Ëƒ‚T\áC±Š)Cœ\Ûo°¤™³•E	\äp\Î\ã½M\é\É3\Ã\0\Él‚Ÿ)Ižµ\ÕVA!*™7Nrqýþµ\æ+O\Ãx¤íƒ¸ùT®p;$4\\ue\ÊKJ*d0@;ŸÖ„¤^o‹i\È\ßh›s¥ÓŒQ¬\ä³ )´\ÙR|¤n:t\Ç\×CN4\ÓÏ H8#)…r\ÚDÆµÛ„\ÎÎ¥ ]Zˆ\0¥f»ûÛ²yG!#8W\×Àa^\ZÌŒr\çy¦t•Š+\ï\Æe\×2·6 oŠözÔªƒAVW	´;\çGsž	S‹% ±€½±Œÿ\0}\è{]ªï§¯¦\r\îS\ÅÔ¹\Î\Ù<‰#lgåªÚ²Ëµ?f¶šG…BYñ>%$y¾y\ßñ5UqKR\Ûõe²d‡\r\ÂÞ’Â¤¸¬—\Ùþ‡1õN\éÏ \ÔÂŠo[u. œú!;\Ä\Õ;\Ì\ê\ÙD…÷>´93\Ä.`œýjFJ–\ÚB=i”°£•\ã½6\Ò\Ú8©M:µsž§ÒŸ\ë¹%›Pd–\Ô\ÏE>$«¡5ó‰ò4\ÛY\Ý[š™\á\ÆpJ\Ö\ÐI+*PÚ‹ô,\Ú0§r=(9\éV™m	µ!	\êF\ã4s;,ejì¶Š\Ü=Ðª•yÔ’\Ð\ÄT²\ÏT÷¥RD\Ó#mE}\Z¯]Ft\'™¦\npú\0¢i\Â\ä­O©n,²r‚|0AþˆÚ¼i;ˆ\Óú^~¢QËŽe¶©µ \'L\éuÞ¤ñ‰G\Ê]\éHH\á@y•Q¹®Ú’ü\Ô(m\éˆ;$Žõw|&qI¥ uùS1-R¯Iy\Õw\É&½\\\ßK÷©>½EY@4€¥\r§%NCC\'™@`UÍ¤4t‰\Â=\à† ¤a^¦«ŽYUx\ÕQ¡\É\çX\n\Ò5rK®\Zh\èû„\çSÌ†\Æ\àddŸ\ïY;\Îp\Æ\îPX\ÊJF\Ô\ÜC\â\Ô-/¤-«—5÷œˆ\è„s-G²Fw5¨\àðfÿ\0¤¢Å‘m´™ˆSs\ä¼Àp¸H(AP÷\ÎNOSŒZ\\\Z\à\Ï¸kn5¶/¾_®\Ì\îS\å#\ÌBRB6\ÊZ:\ç&‰%\ë‹\í8Ý¾ä…ª2¼)¨lt¤…u\Æˆªr\ÆÀÖž˜ùŸ#‰`\ÑPW.¹oÿ\0(\Ú^,»±S8\Ëj „ü\ë5ûQp~*.Š\âf˜Œ–.(9\Óx\ä”@\Éø§Žÿ\0kŽ,^a´\ßøD\ä“\à%\Å5!<€y`p}~UNñ*\Å+TÀqø¡±\á“\Ì\É\È\nù\ÇõÔ’:žE¬½l\ã*mi-\îs$akec?Áýt\é®0ZuAÐ¤‹\Ítü(CŠ\ÚJv‡\ÕòP˜\ËŸ_;k\å £ñ\Í*r×¹=~T³eU\Ñ4\ÇZ\Ùg\ÇqbS)W)<¡\ì\Ä\0:\Ô2e59Õ¥•$¨\î£Ì¢~ý±U™“…#oŸJ\Ó\Z­ˆR›™+AØœn?ú 1e²6 6Eq.1X˜°ûˆJS\Õ^\'ñ;\â§,Z\Ì\Ûo°¦\×*\è\Ú\ÞÖ™8	ll¥ôl÷Ú‚u£¶Ê¼®d9|\é,¤\Ùû4•¢Ÿi½\"Æ¤Ë•-¢\Ø}L\0<\é\É\'8ë¿¥kc.§V¨\Ú5\ël€Ö–\íe\Âøª,3­\ÅçŠô¦¹CˆRr\nH\ØyH\ïUŒù¢\ë$¿²W‰=\ëœV\ê\Ñ\\G~\ë\Ù\Z÷\n-\Î\Õy¶µ%¦ç´—vi\åPÁ\0\äŽûŠ†\ã/°nƒ\â}ŽN¬ö}µÆµ\êf\Ò^z\Ê\ä¥%‰\é\0©a¡\Ñ‘¸	\Æ65F\Z\×;$‚\Ë\ì¢\ÄF\æ\ÂÃ²Ð HRrEq\Ø1ù€\íR÷»,\ëd÷ Ï„\ìy8¦\ä0ò9V\Ú\ÒpR zF1L|¤†\Ô;\î+ ö$\Æò¤´½¥)Œ‡”1É¡ýw<Ë»–ó”¢ŠŒ¤[\à ¤\ä K²\×2\èyA%J\ëS4\æ’\Ó\Z)«œX\Ëuaa;œÑ½•j‹¾c±=.mðZa\Æ,ŒüªEÛ’P„FA>F÷¥\Ïoj&\Ñ+\í\Þ\á\ï2\ËI^}iT;<I\î8µt;\nT\r ±\ä^ª#P7ù?LÁ¶¼¼yÖŸ_­B]õ—X\ÌE_•¶\0\Ï]ë†°\Õ_§ò£fš¨¢[}I¤\ÔñŽ­»}þ*\âÒŸx¥É\Æó\×jp‡<Y\Ç\'ú]iµµmªH+V\0\Ú\ÐÃ³®-²\Ð%N¹€>ú¥¦Šv{9\éøñ\å\ÈÕ“’<8Í’\Ù#©­\ìmo¬ø‡w\â|\ÈA\æ¢rÁ€\n\ÊIZ\Ï2ùN1²@\Éô5ž=öM—NÁÐšn;ŽO˜´ 3KqJ\Ø$\ä\Ö\Ä\àƒšw…Z\nˆ\\)Q¥F†§¥/Jp:¯1QÜ€IÏ”d$Kƒ¯)”ò”X§\Ä7W\í\ê\ïç’¢„°û-\'¥A*N22A\ÎN*ž\×7I¬MnL8Á˜®¼£9´°Š‚HP\0$\ç—|ŸAÖˆ\îZ\æØŒ´óhWŽ—S\Ì\à\Æ\ÈRwÁ\é\Øc~\ëk«\â3tT`\Ø\ÃÜªy\åñ§mÀódm\Ôo÷\Z<C¯e>•Á_5›VI+J\Þ_S¬—9K|Ã”²O¯§­B\ß%®\Ý(±ny^\ê\Ä\'t»y\êH\í\ê=j­\\S:.¤vCi.\á\n,\ã¡#±Ú˜B½Ë—dCòQ\nm\å¤\å+\íJœ#i^Z\Z‚c\Ä^\Ûuöu\Ô\ÃJ‚›\'`J³ÈŒ\ç·J\Ìz‡O\Ï\ÒwG¬÷X\n\æd\ì¬c™9\Øý+Y\Û52\Æ`º\Ðe•\'”­*Q)öÿ\0ö†¸\ËÃ–õ†žN Ó±rt˜Ï¥9ñSƒ\ÌÃ¾¹ùô¯F\âÓ•É¡Â¬,\Ù\Úd§™ø@«›®\Í= Ô°‰¥þ&\Ýÿ\0\äQ²øGj\×Zgò¯Dˆ\ÓA\ÃöiC˜-À|\Èi\Âr7ò+r:\Z¶\èKmÀ*\ß1nÅ’ÚŠÌ‚…ˆRU‚{mNs{Ó£}š	\Ì;g¥8ƒ\â\Êh\0ÏœŸCž•kð+€\Ü1ã¾¼´ðÅ«\àŒý\ÖIJ$¶\ØñR…-\\£;$üªª‘Á[\ÓIGº\\\èV0Rž¢´ðnð\Ù:_Ú¢,›š‹\îÿ\0‚÷5Bp¡XŽ\èg\Ç ©8\ÝC¹\Ü3\Z\éºZ\\ÎŽi­-\n`\Ûm<‰l·¶ú.</Ô†\Õ-÷’€ó‘Gƒ\Ì]B@ :\Ùë“Œ1V¿\r¯Û“\äý\ÑL%÷‡šJ“€±\å#o‹|Ú„m±ôÆ‹ö\Ü\Ö7¼\èVÞµk\í	r†ˆP””\ß^7J‰s”¡ž\\`Šµ\ê½®\×rÓ®G1¤\Û.^\0)p!Ih«\ì\ÔG@p3œ\ç¥f*\Æ&Á\Õs¢•\ï\Ã\Ñ\Û^)\ÏðŒ{#¶\îŸw\Ú+@Yy=\ÝÒM4ò¤©_)@óN3·|\íXbYS”¤\ëõsGñF«_\ä\ÛÜ®x2¡·b ’¥$ƒ\È9\é…m½`¯mOe=OÀ>\"ÌŸa±È“£\çÿ\0ŽY.§\r´µ²²:)\n\Èú`÷«\"u·)\à¦cŽj*Ÿº\ÈJ¬\è\0ù±Ö \á˜PZ2\ß#Ÿ¶k\å\Æ\èXˆ\áÀ\ì\r7v\ßùF\0šË„\ãú9¤VPAVŠ ô]\Ìû’Z¼©\è3^Ûœ‰q+øj-…\ÌVHQ\éô®P½\æ/;Ûž~\æ±ô[¢6´\ás\0}|§›¨¥MiMGS«;“ž´©e\Æ\Ñe(5ú\×Á\Ðý)R©†\êµ\Ú7\Æ>”A ?Iaÿ\0\\)R¦ž\ÊS\Õ\éÂŸ\çE£\Ú\Èý\ÅV§¹~š·þ\ÒWî¦•*\Ü7°o%\Ï\Å{_ª‰\Ó?§.ÿ\0k÷ª3Š¤ò¿³ÿ\0\Ü)R¥M\ÛðL‡q\Éq§üÞ£úöÿ\0xTfýþ©ýª¥J¢‡ýŠ{»!B\Æü\í¿øh©\ë\'òD\ßõ—ûÔ©U3ö‚ó6U¦‡þW¿¾¿eE{C8]Cýtoý»t©U£²y ¼\Î\Ø\åõOl¿š\Æþ³þ\ÓZŸø4¾%f¶\Ív•*,\'µ<Š?\Ä?l|>Š\Ç\âó“Ñ¿\îE\Û÷¢\Ô7¿?¸bc÷“J•%ÿ\0»g®+Ÿ\í\Û\ÉK\éÿ\0Ð™\Ô#ö\nþó=£¿«™ÿ\0(R¥O\Ú]\ÉN\Øsú/Ï½Qù¢~”\ëMÿ\0$\Åÿ\0ZT¨\åØª\Û\Ø…óó\ä©\\\ßüÁ?AJ•#üA7M.¿›ýô©R M/ÿ\Ù','Foo','Bar',43,'Male','09876785554','Cuenca',NULL),('U0008',NULL,'Keith','Foo',21,'Male','09386508693','Ibabao',NULL);
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

-- Dump completed on 2021-10-23 12:22:21
