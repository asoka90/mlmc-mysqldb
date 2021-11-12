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
INSERT INTO `admin` VALUES ('U0001',NULL,'Hired'),('U0009','2021-11-08','Hired');
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
  `bill_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prefix_id` varchar(1) NOT NULL DEFAULT 'P',
  `patient_id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `doctor_id` varchar(255) NOT NULL,
  `consultfee` int NOT NULL,
  `discount` tinyint(1) NOT NULL,
  `medical_prescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `bill_ibfk_3` (`doctor_id`) /*!80000 INVISIBLE */,
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES ('20211112000001','2021-11-12 03:30:24','P',0004,'U0002',1000,0,'');
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
  `prefix_id` varchar(1) NOT NULL DEFAULT 'P',
  `patient_id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `findings_name` varchar(45) NOT NULL,
  `result` varchar(45) NOT NULL,
  `medical_historydate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `patient_idfk1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_history`
--

LOCK TABLES `medical_history` WRITE;
/*!40000 ALTER TABLE `medical_history` DISABLE KEYS */;
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
  `prefix_id` varchar(1) NOT NULL DEFAULT 'P',
  `patient_id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `age` smallint DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `dateBirth` date DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_id`,`prefix_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
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
INSERT INTO `user_account` VALUES ('U0001','admin',_binary '$2b$12$95Ws96WC0ETKTzn.hzRP3u/JuFyo/.KajZks7tByGuNX8wsNwtoXW'),('U0002','doctor1',_binary '$2b$12$95Ws96WC0ETKTzn.hzRP3u/JuFyo/.KajZks7tByGuNX8wsNwtoXW'),('U0003','nurse1',_binary '$2b$12$95Ws96WC0ETKTzn.hzRP3u/JuFyo/.KajZks7tByGuNX8wsNwtoXW'),('U0004','asoka_90',_binary '$2b$12$ypa7E92.N9eVwsV3PYwvse63AAetWw8gt0/m6Tx4Ul4AjTf24Jjte'),('U0005','limbokeith71',_binary '$2b$12$WTRZddaoEbfgF5Vo5A/phuHpp0vPN/BLl8KcoR81iAd8w1CEs0Rhy'),('U0006','doctor2',_binary '$2b$12$fgPS9tymKd76vmbvUhCeUOegHO4NT1AMZNdhPJBVOON2dep93Ygk6'),('U0007','admin2',_binary '$2b$12$yau0VgE4vT8aInYuwPxXUOrmuJPEzPpNd4crrF8VnieEtpom5XKEW'),('U0008','irondummy',_binary '$2b$12$kAHfUaC9UKlESHV.HC.lhe16tf828V8eh5NgQE2g/W2pihc4ai4iS'),('U0009','irondummy1',_binary '$2b$12$E7agBF6dJehOWDzSToVSr.mVW/RNlhlsDDRSn6zSHqy9grWBpIAra');
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
INSERT INTO `user_profile` VALUES ('U0001',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0•\0\È\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0A\0\0\0\0!1\"AQ	2aq#B‘$Rb¡±\n3rÁğ%4C‚\Ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\09\0\0\0\0\0\0!1AQ\"aq2±#BR‘¡Á\Ñğ\áSbcr\Òÿ\Ú\0\0\0?\0ZZ\Êô‡\éı´½$ÿ\0\ìk®UÀ±c\Ö,#YYœ\Õ\"–\åe¥zo1\á\ŞÄ«B‡\n+‘ó«~R³ºÀµ\ä8”B¢\ß1]Dˆ\èCM\ÔGjS\Ø\âRBC‡\0¥\\ŒªWp\Ø~E\Å`†ÁXR”¿\n\ÇÀÆ¡v\År½·U\Æ\î‹eK@…¨¶¬« ä‚œ\ëŒ;o\í¹D×¬ª˜\â›S)\nùV9¥^¼£¨û#\Ğ\ÔzÖ†}Sh\â\ï	\æ’6PşbÑ«Òª”šÃ´ª¬u³-•­¹,¸0¤­´\ä|\Ğ\é…0A÷Œ[i—mõ[h\"ôµ\Ô\ÚoxM†\ê;MQ´\0|º”>Wù|\ãUk\ì/¿Ü…£§#µYƒy‚0y\ã]\ÙÖ¿¥\ë\Ú\"f\ÙPK¢\İ\â9¥Gøó„^²ÑµU2³	ğª\å*(õ\Ôo¥¤¤w}5õ\r8\à\nBr	À×©/Àu•Qœ—\İ[)o{”N?S¡\ßq:\çz\ä¼F\Öt•aË¾+\îtøÀˆ=İ¥Eyø\ç’P‚|)^4eQ©JSš*y`\Êùı7÷\Ú%)\ÓUp4›ƒÏ—ë·¶ñv^7Å‰b\Ñ\r\É}Ü±i°Z$ı\âSİ€c\ÉO‚¢<`}u^lGTbõ{\Ë{\ìñ¡Umh3\Zv\ìWÁ‹¤…¥œ…N{\0Qúöj\Ç\Ùo²B5÷X…¾_h\r\ã&ö¯­±÷;6<…&™8RPò@Oª{H\ÊRcÁõ4Hn]B\Ğ\Û+2-»nS\âR£AcÑ‡O†0\È\à6\Úp001œr¹‡_v\Ôó\År´“ƒ\ç\ç=%Ù”³<3f\äf\ÑVô¥\ÓF\Ãô©¹.u¹µ‡7—u\åI2\å^·\Ò0\Ä»¸ª3Z›i^;V¯Q|pQÀ]‘ö­4\'2.\Û}•¶RC‰R	?\ê\ä¯r\ß~zÈ·¶~I\Ö\Íbk?z\è\Åq+C$\ã#\×H\å \ä`‘DûGzuªR\×=‹\×\Òd®p3Á2~F|ó¤su\r\\\â¾)$¨z{\Ãq\Ê]€\Ù£¿ô.¯ö«aú½¸ôº4&=U\Õe†‚”)\\,ı1’~š·÷í†±¨J·6\n\Ír¹-³\Å\ê\è[p\ÒG…!\Ş\ç\×9H\×3¶‹\í\ÚJERe#üeI«S”“±HrZÃ €I\Üğ¡\àüè˜¶6k:\Ûg/Î•o—dTÁ™jÕIÿ\0kŒ).ü‹ö«y\Ów³ıO¦¦fD¾¡m\Ãk†ıü\ái­hu¹V;\Ú:‚“\Î\ÙXòP\Òş\Ñ±w;yã’¥©DµM\\¾\æ”\äÀ×€8ó’_[ö\Û-»´\à\Üm\Ç\Úú5M RU*c‘\\ÿ\0\"’´\ç<ùĞƒS \Ö(µ)4š\Õ2D)\İô¥F˜\Ém\æ\\\çØ¤”>¦G:\ÆSJI\ÂNu\Ón\é=1?.’†RE<úD!š¯Vd\Ş%N+&\ÄV\Şğ@}¥{\í_Q;}··­»gU\éW%‡Áª÷TZiÆ„U«\Ñy=\èW’“Œg\Ö\Ï^=3\í\äl\İ\Ç\Ü\æ©X\Í!^„ªl‚N 8\Ø\nB“\ìR<smvŠ\Ï\İ?\Å\è[Nõ\éK‹0jªˆSŠ=§\Ô@*\nHN@HòFŠ›ÿ\0¤KOw-\äVÜ©¿O«¦‘\Z<\ZŠ_RĞ°\Ëe\r‡{€.qÛ•\ZS\êiZUa4…¸´¤fü’O(cP\éÚ®¤É¬°„+‰$[™Oş`½6ÂŸw¨*\nR\0?Àyı;5®}§ıÑUuPP<®ŸI\èW\ì{÷\×.÷/iom¡¹Â›‹G,Iô»\âº\ÊÊ™”—[P\áI<qÂ‡\È\Ôxµ\ê\'!ps\Èö{E›h<\ÜÂ–ƒ\Ò\Ç\ésºÖ³(¢ÓŒ¥7\é¾~\Ùİ£§\Å\Û\Ë¹Vw°\âL\ïN#J?@=\êúh~\İµªÁap\í)t{N3”\'ğØªrCc\ë\ë8O8ÿ\0JF†²\Êq„ÿ\0\ÓI,\ä\çúhOB\é\ÙK\ïÿ\0mÿ\0¨›\ÕÉ£—8GD\í\\w\ÉwUİ¯\İwº´÷ğ_5\å-ÅŸ\İDœ\ã\è°‹.\ÜS\Ç\ï§V\Ù\îö§8·¦ŒZm))\0@\à\ã¹*QQ=c$/ƒ¥¬•2\àÿ\0Æ–¶q&>£Ş—ò“YwG\×ş5\åq‡¤ÿ\0mhJ€PõõÃƒxŒ\îeU¿©U$V§·\Ó/Le÷\Zk»Ş¦\Çú€\Ï\×:‡Pjt\é0‘6Ü½\å\\1S3%\Òj1‚jŒ¬U\nJGq(”‘\ÈNÎ§÷½\rrÏª\Ğ\êO)¸ò 8—CE^ˆ\í>\â‘Ê¸ø\Z‡\×\×Õ·\Ò\Û{\"¿*‰D\Ëõ\ZePõx\î$>\Ãi)=íµ»”«ò€S\åC\\Ûµ…W›p§+n\äô¶6\ç?\Ø\Í~yŠQ”(Û­\ÄH\í\n\ÍÍ´µö7\nÎ’©0•\Ø\ë­\ÇÏ¹\n‚1õı‚N<\ë¬¾ºp¥3v\ÜDŸt\î}ZG\İ\æÙ¶\Ì5H/\È\í[‹@!§\0¡!k_œ“ªşñ\Ú>¤·–<½°³o8¶¥ŒÜ‰\rş-5æ„·Z	\n\Â{=½½¨Â‡$j_ÓÀZ]\\±î­ ·—Q¨ºB&T\êJ\ê+<Rñ\á¤,Œ(\0<“\çIM=5¥+È™Z˜P<-7rÿ\0\É\Ê\Ã{u†Æ·¤JjJbÙœBZi²\Ş8@±\ï~G\Ê**6\Âõ\Õe6-oªJ«\Ö\Õ=¹^ªlZ4À\Ù<\å)x‚H8şU+	\Ñ]\Ñ\çO»qg\\\Ñm]½² À¦S\ÒgKˆ\Ë\\IZU„)\Âyq]\Ü\åYÔ¿x\ìj\Ôæ·®\ßf\Z©\ÕVš¬\Zsº™3·$,\'Mg+O´“<ks\ÒC(=T…\0¡Mh(ƒ\È÷sıF»±Ra}?Tm|¢\Îq|\èR±byglG)È²÷ùƒr\n 2\á\áùUl‚:\Üo\Ò,»–\ì¦P 9^«Nz<Rµ—$ˆ\Ëw\Ñ@8R\×é¤¨s\ÈhûC:·\Ù\ÓQfŸTf‹pSbE.2\Ó›+J¿\Õ\ÊI\ç<Œ\è˜\ëu¯[ngÓ¶\Î[\ë\ÎR\\\Çæ­¤\Æ\ï\ç¿\Ôü\Ç?\0]p§ª\ç\êp÷{[\Íw.Lõ-Æ»X\Ö\Ş‘(\à¦uÉšz•ö³…\Å+ \ïx\èi\ÇÌŠ~[!ı\Ş\ßkYÊ‹\ì\ì…B\ë¦úò•ë°º\Æ\"òA!!	@#?—şºôùÒ¯Qe_bÁ\Ømºª\\•E>·%¹‚–Z‚\ã,„! J?®¯Ï³ ªS5\çw;ve8Í§O™\é3Lh”ª®ş(R\Ç)i\0¤’9QV»ñ\ÒE`vF\ÃfÉ³\é+B\åšdT¶\Éw#\ÉI÷«Ç’NtÀv Üˆøv.¢#\É*#ó\íüLÂ¬“·˜jtÿ\0ÿ\0d\â·X°‘X\êK©•Á¸\ä\ÇK¢e\Ó\Ô\å¼ê‡©\Æ9BR<òu¿¶~Ã®µúB¿SY\è\Ã\í\n¤3ZŒ¾\äÑªñ$\Æ ó\ØúP§Z\Ç\ÆJGï®”u_ºUZ&\Ô)\êUFE.\Øz)]n\ã#¶Z\nÂ™FP\Ê\Ç8ñÎ©Í€\ë\"©\ÔK\Ñl’úl«C¢Cy¸ukÂ¾§R=F[púò\0%Ò>s¨ML,ñ)\\ö8~—ı\â\ŞZ˜\ÊAEŠS\Ôn`F¿zª\êFÃº\ám/\Úg±Ë´n‰¦±¹´ô—©5\×‚R\Ê\ä$”`\ç	\n=\è\Ï K\È2-\Â[ğ\Z@ÿ\0¸|cÇ\ã]N¼6®\Ì\Üİ¿\İk6—pQj1\Üú-V\"Š¾9R’¤¨Ÿ\ç\È\Ğùjt›S\é\Úóiª£Åºlº›Á¹´*\àV)“Ú¦%­ER\âXw.6“Ü—³L½\Ú;šv©Y„”¦ÿ\0)\çk\æ\Ş\\¹B‡Wöx\Õ]ñ5.xˆ#‘#¨‘¹6\ÌQ§nM\ëRô¡\Âv2óCò¹üR¥gùh\ï~º0z{\ê®\ÊÜªZƒ\Ø\ÊC\Û[%n\ç\Ô\Ï!_®©\î¤zt¶7\nú¨\íĞ¦¢K”…LŸOq¾\Øò”…{š(ü ”øW\0\çB—N›G~\Ù}<\ÛŸ·›–¦\áÎ¯T©ò)ÓU÷e0\è-úNBJ¬¥_” Æ¡WN´šUJšx”~dÅ¾±sF›gFI3F«xA\Ê\\goO\Ö:}»»[eo”ºx\ÇX%R`T™÷;ü`8“ô\ç\Ü?˜h¼,ªş\Ş\\²\í²#ˆ›kA=¸Cƒùlÿ\03jÁÁú~Ú¶:_\êf\âMpÚ·]a>\Ãİ’Š\Ü9\Èığ8ı5mõ)µV\Öü\Ù-×­fE\ÉKif+¥\Ïl¨ø\Éa_NIR>ŠùÕŸf\Ú\İTY\Ó!8x[R¸H\é\èTv‰£SS–øùa\Æ\âv=G/\Úm->\ìt÷ƒ\ÊOj†<x?\Ø\ë\ÇİœŸ\í®š\â\ÄlEÁu7\È\"\Ä\r\çÿ\0x\ÒÓŸwÿ\0wük\èr	W¶³Š<á†´´\ë\Í%)\ÊNy\Ò\ÖqFp\ÆW ¿¨\×\Å4¤ı4ö¾ƒ¯P=Q!&û¤‰X„\ÓEì”¥~¯\Êûdóª\Ø\ìU\"4\Ú]m6<‹v]9—Z~­9mS)À°\ÊU%À¢T\ÚH	\n\í*>À“g¦¥%5Ù‹Sq\à\á÷h{\ĞB\Î>OõÔ—öÙ±½\r<\è«A¯¼\ÅN3\Îˆ\ÑÔ”\Ò\Ø\ÚGp\îW%DùÀÆ¹¿µ\êz+\ZÂ›\"\ã½\Ò\\IIWL\à{\í\Ù}IT]3?>\Û!Å¶¤ğ˜\ßÛœE£!t\Ú\\Kz‰Aƒ\r€\ÜU-}Ïº\ØùW\Ğ\'õ\×\ÔDm\n\îH\Ç\×İœŸ®½ö„ØTO+W\'û\ê[²;ut·=­\\®·K‚S\êH˜T\n\Ö3I´Ÿ+?ğ\0<iŸD\Ò\ZS@S¦™Jl<JÜ“\Ï;\æõG©õ½P4\ê\É$\á \ãô\Ú\ÛmÏª\ÙŞˆ¤	$²X‘Nœ–\Õù›^|ò\å:‘R\Z¢\íe\â\İ÷oOzM£VmQ%H\0)øK$+\Ò{œ÷ „”“ù:˜u\Ñ;l`3uZ[µLü6k\nTxµ\ç‹2B\Óù»JPS… ÷+°p|\çU}vN°*­†\Ş2c\Ìÿ\0+\\¤\ÉN†Á\å|“\ïğ¤/8?\Z\Z«&—XiùŠR’\ê\0}«Ø‘\É`uO\ï2ŒThó-\ËT\Ñİ­&\í/\"	\èyˆ¨úö¼7e›R«‰(L™øp0=L%6¡BğR ~yùÁ\×o\ÑQÿ\0Î“qÁZf,U$£µeD”ür5\ÛF/Ksh\Õkr­BZ§¾ò]¥\Ï{Ó‘”…÷øOr{N9\×2:ÿ\0\Û=¿\Ä;\Ûh\îõ\×)_Œ&™Tq=Fr–’¢{^<(#Œ4¡–\Ñ/\ĞB¦¥ˆr]Ë±ƒ\çq\Ê\ÛCU\Z‰›K¾’Û­Y$~}ˆ<\Ä\Zı7\Õ\ê;\Ó—j\ÛNSTf*Ii!l¸\è.:\à$x\É\0Ÿß¦®~š:Œ\Ù\İÙ¿A\éÓ¦‡\îŠüv”Šş\å\ÜugS!*e—{V·ó\Ú\Ú=0x*\Zª¶>·a]´¡i]qJš,¦;\Ì<G\0\0;GÓÿ\0:<úµ6m­\Ä\Ğv\ŞÌ§Q\İS˜[T>}\Ş~sû\èL¸\Ø}\Äğ\Ş\ç’rŠK))r\éM±\í½†¾©U‹‚«\Ó6\êS\ãÈ–…)\Æ#\Ô\"¥M\Él’¥e$\áDg\Õ\ÇnQöKefÜµ((R¢†¬\ä\0S\äg\Z>\ÑKK¨«¨˜WN\ìB§*¨\ÌFE\ß!)Q¦†\Ü\Ë\Å-œ•Ÿ\ëo¶[©vb³:y^Õ»\Æò®¼QuT\é\ÍJªªL¯h.ª3Yû®x­£³\Ú9\ÎuË¥Ió‰O°\'z\ÈU¿(¿¤t¯ M€\Ï\ÜWÜŒ…#÷\Z‡V¡Vüt$¥m/¹¥$óŸœşš\×lö\íY7­­÷\ëR¥%˜¡?\Âf¥\È\îÿ\0‘Ô¥Cö#^nM\Æj)S.¸y\r}¾¦şm­LÊ­\n-)=wû¬\Ëò±$n¦.•®5èª¢V”\Ò2#\Ê^Lw\è¼aCıZzX‚k][0_y	B¯z³ªpºR•6V\îÁ9\íÀu|}§\Õg·¥Zİ‡l\Ó^¨Tk2\â±N¦\Æ@S\Î\ÉCÁc°;]Ç€9\Î5\0Ø˜mJ\ÇXV\ên\Ú\éÕ«^µ.¯%ªm-R`H~C*d0\ã½\Éš;ùV¸p\0\ÕÖ¯·C”zd¼µ9ß¯¤/õ˜˜®\ÍÊ¶\àJ®£\Ê\Â\Øş ]srª«\İw•!\ç\â-\É\Å))(P89GŸ\î4dlR\íÍ¤¢5Mh.¥ ¥¯\É\Ö&\ëô¯·{\æÚ¬1£•7\\b×¨Ô¤6”ğ9\î#ó\'\ÊI56–D\ï¼Eª!ö“‚‚Ò¸9ş¸\'\ÓBO*mfd%\Ş\ç\Ö\"URÉ•\á\á	ö‹~-\èğo5]\Í5µ”Yü:F\\@ú{°c¨O ¿¨\Ö\Âe\ÑT«Ó™¥.@\\VWŞsqŒÿ\0n5‰®\Ì\ìúzrJ0\ä\È<C\æ?7¤r\'h22tıVûRª\'8\Ø\Ë\ë\r†p\×\ÂÂˆ §t´kqc(v\í¥¬€qñ¥¬Œ…§ \ÅT¹_w\n	\íA[ªZ\ÂP\Ú\0\ÉZ\ÉÔ¯ÿ\0\İ0\à\Ê\è3©~\×m\Ã[ª\ì›Eø²ú„\'L©1$†\Ö\ËM\ä T\ãy 	k-Mş\'@r ,T\ÎIox \Ót3^ªµ*M¸}ˆj¡´wwı\Ó7»H¤J™k\àıÀ\Ì,Fe9 ÷”«½´òr§\Ú]?°•\ê\×Â¸,ë™©oR«O¡n!lw¦?j=5‚8\Æ0y\Æ\ÓV®Ñ±X\é2\rRZ7r$º(i\Ã:ı)R\ÕQOo¦,œ7ÛŒ‚¡‚¬œƒW\Òdtmr ?n\ÛWı²\Ójÿ\0\ícÓ››\0q\ìK\Î%Æ“ô\Ä\0\0Æ¹¦S´*µ—-j@A\âC‰I\nJ¸´:ft½cN-NPU…!_*…³\é\åË¦›A¡\Ü)6\ÍÀ\İV\n\n‹<%IRĞ®BH>ğu\âß©=J©Æœ‰N4\Ûr\ÛT‚Œ’´r9\È\äc\È\Ö\Î\à¸öòsjW 2\Ë+M^\Æ\ÕXÊ”©.$Ÿü¸ıµ¥¨nT¿º…\ĞwOn!¨ \0³n:qò;|ÿ\0]MvË§N20\ãà¤‚TQ“\Öşp=#\Ù\åu3¢}—Ò¸‚‚|Xò\ÄT\İ\â´7Ş–\Î\Ü\ŞwsTª´UŠmB£/B’ÃŠB\Ô\ÚÀ\à¦Ğ $‚œdjg|ô3{n.­U¸¯b\rU”ĞŸ`ˆ\Í&7j{\"<„´”„‚	K™\Êx	«›»ºÑ‚\äÿ\0ñ\'Cˆ–â¨¡vı©$œ%9%À“œüB®‹z¬’›†\ì\İ6/J]]J[[\Ñ\Ùbh–¦T¤!mI.,\'€;ú‘Æ’’:¥tšÙœ¥\ã…G‡•¡¹R¤3^”Ï k¨Œ.¯vŠlŠ\ÍN›:\Õ\ì¨58\Òj\Ğá•ŸÄ»[Kª\n\\RJ›	ö•„•¨§¹:ªj»;³5nşûl\Ù\Ò\Õ\"³\İ2ŸNª\È\ËT÷#<S–[N@Wµm¥dû“ƒ„•k¶\Çu÷n±¸.H¸o4x\È\î9UŒ—±\ŞV ˜\Î)c<¬‚8\í«?n«öö\åmœ\'¨lúK¡U\æ\Ò*õw¾‚\ÔJŒ=‡é«·5]Nu/8’C–*Br-\Ôt¿H•\'¤e\èÁ¦¦\È\å\Ğ§(uYTŸª±P\ìï”²¤ğ0³Œ\Û\Z&zy\Şjõ\ntV®†\Û	÷„¨€}\×Üš™¸Z}:B\Ìv¥­!%’NGÆ³\íòºh¯%,\ÉJ~R’¬5½rô%VI\Úø‰²u°{µrÀ_Wkûİ´¬´›„Î†Ë¡µ¡Ì¨w4S\İ\ç…‚?m½\'ô»ÔŒ\ZË›wb\İ1¬{R<•J¹\ïi­?R©¸£ÑŸ\ÌU\áD43Y½k_ô\×Zn;-XZ¢±ûøøıÿ\0MY¶\Ú¿\n\ä;n\ì\ÇjR\'„„Am%\Ç\Âp<Ÿ\íªÿ\0€™–YO±‚km2\È\'¤u<\Ø¨\ÖD?»\îÒª’ \Ç\ì.¼\æ\êÀ\ä­9öşÚ­ÿ\0½.)Á€°\ámÂ…¼¬„ş\Ó\ã\çUF\Éô½\Ô\r\éSƒ¹[\Ù|T(¼\ãÖ5\ì%@ò\ê³À\Æxóõ\ÑCÏ£[–\ê\"Ám¶€{\Z*\á#S\çU3Mğ®\×\ÇXö‰û\Ä6Hrİ’\İBjıGZ9R\Ôrsòó\È\ãN\ï¹R³\Z¥o]Ë§\Ç1ûŸˆ\í-/CP\Çş¥ô…2sRû•\ÔUm&U!2XD¨\ÅJq\Ç	·Ê³ñÎ«[­z^›d\ÏQ»c½\Éjß‰Z‘O¨C	.´û^š–^\È)!i(#ò\àk˜l¦E×/İ¤ª4=9*‰–Pò¬\\WÏ¼{\Û\éU\å¨À¡\Ém1\ãÔŸLF[w)c+6x\È \ã®£[\ÛC¬E»\"=·Ñ’¨7«,\ÄJ{•\nRAS\Í&ŞŸ€’~P5ª\Ø]ºUb‘p¤\ÌynW\ÚiÊœ%„¾’°hR”Ÿ9-ƒó¢×´\ãÄ¨S*’\è\ÅfE·\È\Å\r+ü»Š\ã•a§IıH\Ğe¤Ì¼òMĞ¯˜¦=ª©i($\ÛÏ§\í$(¿‡\Än	w¹m“\ê/»%_¡\Ó\ÚÌ¹¨’-[¢§jÉ¢\å6§\"‹PÁ\Ën…ı@÷\'Xzı¤7.\İ9‡A@#\Ò8–¤\ë\î\Ô][\æ\ê*¼----ZD;ZZZZ\È\Ë_¡\Óñ·º\Ö\Ø9‡r¯Y#Ò›J\â\ËzÅ°—Bp¼ö›I\'ıcMö§\é¬j\Í\nqÒ¤Pªô–&Â–\ÑjTWùK‰?\ÊSò?nF\ZÖºm\ZŸM½ wVG-ˆ#\ét\n\Â\èuF¦\Óøp}ñ\Õ7\Ëp:¯fT®œ¶&­V¥»$D3g­*y\0M€´©y\à\Òy\Îu„\Æ\×\Ù4£%‹\Òş©Ì¬B–¸\Ò\é4t!ˆ°¤6²—\ZSİ§\Ôq*\nI\ì\îHR\n\É\Ö\ÆÙ™U°)Ñ©k_›B‹2šˆ\"6\Év2JB{›q@\áa „¬ «“\È<\é¨p¢Si\ì\Ò ·\Û\Z2;A%X\ÎIVI9\ç$“’NrNú±™ƒ6§+ˆ	@8H7\â\Ö\Õ}£³ğ\áºRÁR†OHÀ¹\íhó\Ük™K£\É)~§\rUB¤\ã\Ä<°œò< \ê&©\ÜGR%õ\äT`³D²bFıP¡ÿ\0L\êx\âHYƒ\ç:ø’S•“’3¦\âû%\Ğ\êY)—)ˆ€k\íP\ÒC\á^e Ÿ¬Cb\ìû\Ï\Şfo…ûQWnø¬õÀ(Wö \ê§\êO§X6ÍµG¿¶\Òm\é=º=Á\Z]\Ï5·\"T\0…%´²\ÚTVF{NH\àcÎˆ°²9 ıBF±+u¨\å\"M\ÃV–\Ìx°[T™O¾²„$r®\á\È?L|\ê$\ßf\Z:^UE¶\Â1ó^~\Ñ>‘\Ú§5VÁûÁq\à·\Í\å\ï&\ßl¬Ê®\Õ.ù\Üúj¨\Î\Ôj‹H§7ü&™O¹m4\à\Éqarµ\ìd¡·gz•¹¶¤©ñ\é-U\éúô\ÕW)ª|!^›}¡©\r,şWVq\Ç!JF_P{Ç´\Ît½¸4\êm\í\×*Thbİ†\ÙB–óH`s\íPh,œsŒ\ç@\åkl ½‹‰iK\Í4·ZP?\Ãp $öŸ d\ß\\\ï«%©\Ún´´Kº\Ñ	\à\Û6>—‡ W*\Z¢‘ß¾q*\ã¢n8w\æ61inu\Ïmß°™¼U™4«ĞV%*Ò–ÁQQ\í ük\î\ÇtU¼=EÜ‰¦mõŠó0”˜\ë«\×j>‹2¿M\Ô^¼`Î±lZ3ÔŠ-%ôÕ¾\î\år¤\Í6p\î\ëmA\ÅJGw)q´÷”‘òu\Ñ-•¹ m\Î\Æ=\\¢!˜»Hešcq\Ğ2\ÓÒ–†›9÷€µ|\ä \Ô\çÃ€´¯œ\Û7°PVò¤Û”B{±\Ål] “\ç¸e‡Lt‹|[tª\ÕeuT\á¹\×qªºN\Äx\ÊQo÷\'Ü“¢bún\é\ë§zSS\ìK]µ\Ô;;_«\Ô\\/Jt};OûP?MTğË¥Q§\Åcµ¸øöŸ\çXú¹„«w\îu7–Ô†\Ó\îP\ÆU«¤»0\ÓBÄª ³\"76ûA_7t-ø,w¶\èõOj{|¡Hı³RıGu›dm•2\â¸.»³•«W¹gHT¬>‡\Ï\Z7+­˜Q«‰´\éR\Ò\åZW`4 \à?$Ÿ\ÆOÆ©Î¤zk\İ\ê—Gİ»÷p£V\ép\êq\ÓY¶\ØmM&g^BK(ŸyÊ’•)@5\\ıR]‡R\Ó\ê±VGœXK\Ğf\ßAr[66\'¼bPÚ½º\Ø\Ü\Z½\Ûs\î5:K—ÁN†\í@zil“‡]<u;û;z„²©{Qtuº\×\Út\È]ME=‘h÷%\Ò„a ’9À>|j\Ê\ê\nöÛ›:|™!¿Z©ğ)\Èe4\È1’òÖ¿I¤ö\É#\0r@ÎƒÛ¯\ìø\ëi\í6w\î¿mQj±‰Õ«.‘Võ\ê\Ôv•\îCG)q´÷$©=\ëP)cWz\ZªıS\â\n\Ûû•\İ\ç=¦iù\Z|³™»ÁAB\Çb,Gü\ÇD6\nôµk4jmnÏ¸bO¤É‚\ï{J	=¼`§8ò3\Î5<\Ü=\â—@,S\í\éEš»dJõ\Ùæ’‚ÁVq\ÓC\ÆS¬Íˆ\ÚZ®\çn.\í±l\Ó#I™M[\nºÔ…€û“¬«\Ü{GnAQ\0{•.\Û\í\î±7ò–ş\æmô¹Ë„·U\Å\ÔiŞƒÀ´\ĞT;”<(x8>x\×Æ„\ì÷º\×\ì\Ìø¥Öµs\æ2} wT\ënûMº\ãX})\érm!Z\íj­sV¤\\UÙ†LÙ¯-\é’NT\ëŠQ%_¡\çX\ÚCÇ-w«,·,\Ê[@ğ¤XzG-¸µ:²ã›˜ZZø§PƒÚ¡§iôª…W¹PÒ¥‘ùP?˜ı5<\ÛI\âQ\nua)0Ş–·\Ğv¾ğ˜Ğª{ ñ•}tµÔ¤\Òr±şwş™YŒ@\É\ZA“üƒ:Û¼\Ë*´6I>8\ÓL\Ó\ä¬zˆŠJ<wm/¢ÙˆI[—À1€\Zq(\î)×Ÿº•$¬?}niôğ©˜|a¼}58 \ìª\îr+ôµ6¦R\Ş\nAü¼r¯\éôÖ—\êm2\Ø.u°ş\"T¼Œ\Ä\Âì“\Ê*·™-(6FFqúi¿\Z°/\í«¬\Ñiq+¾S/‚P9@?¯A\é{‰‘”\ã:\Ù+6\Ì\ÊJ’ G”|¿.ôªøNc¹xW#»uG\ï®\æ\Ê\ÜÆ›´\éTö%\Ğ-Ê‰’„4À*¬T1•¬ù\Ñ¨H\ÂV´©J\Ïi\Zºk´\Å\Öh\Ó)MU$ÁT¸\Ëg\ïp\Ô¬÷\0\nH +\0\Ù_^u@Ş»GwXÓ£P­Š\nª\íMğ®+kV\nYBF2²ŒI$®;DûQ\æ\Ë`÷_Š×¾yzC³óOin:H\ï\î8A¶5_lDki =}\ï$;U¦£•!N=uúM%\Ø\Æ/c’„­R•Ú‰ÀP\î ¥µ‹\ÔşĞ³´t6kÿ\0\â\Ï\ÅzJÙ¦²óG\ï$\Ü@\íWh —2HN4Aôó³6¾\ÈY(¥™U®:‹\ë‘rV\ßJp§ÿ\0\áhy\ìN{B\Î	Op	HQ\Ì¬=¿U\éS„õEÒ¦Ø¢7÷&B0–Š\ÔVµ…qŸ•?M$õ¶¦\é\í)ñuF>ùJ±\Ğ\ÛC;LW®jT\ÉÓ»(I\â6°Q_I\Ú2Œ”7®YLxµ–d´ó\íz¨iµa‡\Î\Ée\Õ\0~\ãF6\ã],\Ó\ìZ]¹¥1®4\ÚG¨UÚ–ÃŠ@\'Ÿh<\è\Ü;Ş‘hÛŸ\à*\ŞC’›SNIC$µ)W´¬IğOh8Æ®µ\êº/R1–\Ú\r]\Ö\Ôj’ ¤™‰c·½m\'\êAVGO#(™fd²\Û\Î8=´1\'^L“„\ã\Óş\"k¹Ûº\Í;&q)	^8>4>\î%Ñ»ûˆ‰NZõ5\Ó\â0“÷§Xl­e\'À.Ú‚G„N\ÜZô\Ä;\ZŸ:°“YšX ¥¿TSRIP\áN€{ƒCò\ç$’5…X\Ü\ÓC·\Ù\Û\ëY-¦<uŸYõ»ƒ%xÊR\Î•||jdôó\èJS*.~±¹µ\Ç•dˆ‰t\ã±5+\ê\í¯W.	ó&òf\\™*Sˆ_n2r<øñı´tıµYPª÷6\Ù_õÉª¸bHatV+	ô\\rŠ\ÈPVA	\Ïv?—Qa·BÛ¯[¶,&\äPÛ’©µªŠê±‘:JT…-¥±¼HZ²•aZ\Â¦•d’‘¼û[Õ\édn³·‘b*Ì´Z¢ªS1\Ğ“0,ÊŠ8u	\íH\n	\ÈQY\Ï:ª\Õ!\ÄÉ™‰´\á!<\Ï1\é4\ç\ÆOT„Œ¹)I¹Y¿.^ñ3\ë2Õ³º\Ú\nT}¶¹\í\ê\Í\ïb^\Ğ\ê\ĞXT²a\ÉK\n%\è¯8\ØXË‰ €¢	\íĞµ¸}e\İ{uG»hwZ\é\Ó-\ä*+t\é#a„¨ÿ\0ô1¸e@%Y\È$kK\Ô\Æ\á\î‡N}N\Ö\ìm¡»ÿ\0	‰\\Cuˆ´¸M0\ê}g\Çñ\Â	\Êò¢\n\rGkTÁ\İ\Øn\Ü[…@,WgIn>§\n\Û2e’`(¡=\ä‚A\n\Ï\Ç\Ó[´\ÍQú, Bˆ\îW\âA\Ø\ç¯_hŸ©4,½eL¯\ï›\Şû\"Ep¹oõ	yÓ®úU\Æ\Í\Zà¦¶”7jW\r\Zk¿%—O,­y\ÉB²•r\0:.6w\î{‹bª/øb5¿r\ÓĞ„\×)\"7§\ê${BĞ”€1””\å*‚FN„-·\èòôºwb\Û\Ùz\í\ŞX2S]®Iô\Ó\Ø\Ó,­\ç\Ş÷v¡<6 \ã?]_²·ivò—E±6w¨J•zM\Ål9*†õ\ÕK„Ó°–şò\Ó	w±D6\ç¦\æGbÓƒ\îRV\0lQjRO”Ì²«¡c\æ9úòô„=VŸ3\"\âšP\Ş\â\Ø;ÿ\0¸‰\ïiõ\×JŠT3\à“¯)R®\Ô-*ö÷e*\È\Çï¨;©˜ª\Ôxu‰{óC‰&s`­¥3!\Ô:\nA+\nJ<Aú~º\í—Q=\Ğ)2¥/s¸k1Z[©	ÿ\0/·•)RJ‰ıI\×G§]\ÑOK\ë_ˆşBˆéºŠ¦”\×“\È\ß\ë\èöuf¿*;lSqµ\åIR‘±Šª¿½NO¦\0=˜$ı9×¾‚7+gú´¶j7F×¡!4)É§W\"­\\°\ëˆJÑŒ\ÊR¬\çô:0\ì\í¸E€ˆ°c¥(N	\ËX$~¼ù\Ğ%g[¦u%\àA­L\"R\Ës&*:N´ \Èe¸\Î6¹JA\0\çé¥¢=¹6\è\ãõÆ–‚~ÔšQ¹Yı`¼IKQ\Ï{\ëa&QR\Ò)\Î4°\ç\nq\\ıuµ t\íœ‰u:±uH*q\èÍ£ó\'ôW\\’-ù\×°‡‚”şdƒ©Õ«·É¡&\Z\Øl«µAI_4w1©\æ\Úm*\Ï<Àš4ü’œ+Jw\ØZö\íºŒ\×[¢%a’\áôû‰\Èñ«Û§›Çµ\Ò§8K*-H\îGğ\Îxóòu&·öVM\"ïš—¨¨ô”¼¡JğsôÕ¥@¡Å¡P’€\ÚR\ÈV]	À\Z‰Y\Ô\Æi‚\Ê9\Æú]¹Gû\åE½–¬\êm½J‚\Ç\İ\à²Rókg¸sÎ„\Ç*Ş”\Û)FTGj@ÿ\0t/8v\í­1ûbœ\Ôê—¤P\Ô>r”$~ƒ÷}»q\Ó]v]^\"uÒ¥:Ç\Óô#>?mhY ´(9\å\ëz\ÒUq+nù½úDT…%%*<:ğ …‘\Üd\'÷ıõ\êk/4¯\â$yÎšZ\ÒS”«<üi°Ò\æ/\ê)S\"ş‘\ì’S\Øq‚A<y?]Dº‹²oZ\î\Ö\ãM€¨ñ\å~\ËE¢•¶”0•¤¨‚3’¢?ıu,õ[Rac¹?˜}5‡xI•X\Û*\Ö\ß7­6ód\'%/ ıÒ¥\è4¤íš‚\íoC<%“w)X¹69Ø˜cve¨£ê––ú¬•øNm\çü@.+ğ7>‡*\î‹s57\äÁ(~2m÷§\Ôo…g)#>y\Ö\Ët-«6bà¢ŸWn\Üv=I~•Ô¥ğ•¤œ¶ AJñİ€Ojø\Ó;\çjN›MŸ\r\èn®t7¸\ì§)	Zs\ïıC ¦u\0´,ë–…fN›¹•¨F•Ÿv@t¶¦øCE@Ÿ~“:ä¤‡e·\Â\Úğ”ò66ôÏ¬t\âKi[‡µx’|¢\ë\éó§¾—¼\r[wõF©Z„j.3\"*%ˆ2g¸A}‚\0“\ê#\Ói^rVqŒjeº4\rŸÙÈ¸-«YŠuÚ­Ef Õ»^§¦l*Š\nrG¨•!Ğ\Ô%]\í,/\ãP*Ÿâ½·N\æP\î\ZA\È\Å\Æ\Ö\Òji¥.G-6\êÑ”–øô\Ïò–ù\ÔZ\í›Tİ›²™¸[³}~)\"\İb\İ\çTg¹mE‚´¥N†\Zxg> 	\ï=¤Œ\êõºL\ÄË\Î\"Ä 7 \ía\Ìõ´U¡\Äp\Ùf\é8\Î\İ\"Ğ¡ukZ\ï\\vwøV¡2¥2œó³fIl­§\Ë\èq¥‘\Úm¼¶UŸP)X\à5°\éb\İ\Ü=Ñ²\ç\ÄI ­ºô‰78ñûÌYå¿†Š•}ù\îòy\Ö%\Ë\Ô\'Mû©µ.\ì]ƒ·¯±\Úó¦3Q‘Eq\Ãq\n(?ê•«\Ô$Œ\Ñ\ÜH$OP>“\ë{¥\Óm\ÅP¸7JQ*¬¨±šDš{¬3>7-ú]¾šT‡{\ÈYAO\Æ«u+UJ•^\íl\\œ\æø\é\Z^rC«\\Uû\ß6‰7V´«3o÷6mN%¾\Ëuµ&\Õ³üFc²\êÁ¼\ëˆ÷”\á\Â9p…Áƒ\Ñ~\Îo\ÕrÛµ·\ës­ªe´FcN„\Ê\08µµ÷–‡·³KÀœ‚“k\í-¤¶zƒ\Üz\ë\ŞÛ\Ò-ø2j#É–¤vz¥„¥. p´Ò´Œö•)GÎ.]Mü6’p\Ò‡\äQ\ÚOÀ\Ç? \Ğ\äõbB¥¦$e„¸C¬^\ê\Å\È\âı<¢]FznN¯;\İ8TÛª6\Ûl\î¦ú^»lû±Şµ+¯I¨\Ó\äz\ÈjK-ª4–”’‡[[%8Z•(sœtŞ˜\î.¡÷-\İÆ­Û‘Ì™²a\nZ}Br\ËIm¬a¶R\Ê€€°5Ó»•\ëƒm\'ZF\ßrUYº{\Ñb\ÊZÒ€¡\Ê²¥x\ÊH\'\ç:¶õ\Ü}¨¾¤ôÕ¸vıúcô·ª­Ä¶ÁeE¶™xûK„© d§E`ƒ¨rõ:›eZÊ½¯¿8˜fœ%©”Ü±´C£}›{	v\ÓUH™b\"P†û¢S°\ëK\îÁ@\r\0	= r>	ó­$¿û>{\İ6\í¦+¶•N‡\';N¹g>~\î\r ÏŒğFº³\Ò~\ß\Ûf\ÒB©\Äjg\âğ›n%\Í\"©MLysf¡	C\Ï8”ûA\ï\n£\ÚT¯\Ë*×§[\Ô\áO¦²R€¢V9$ùşúè¡¨)uúZ—d$œ‹\Üo\n\éj;Ò“ª\ãQ)\ŞÇ¤d¿Ù˜>Î¾f\í\Õ\Éy5p\İ5\Ú\ß\â·Y¸ªm„/\ÓC-Gl)Ekm@=\ÊÁ%G\ÍEô{R9\â~¾eie)H\ày\Zj[À‚B¹ ñŸC\á.R”§a\ÂIlvœ\ékRleIP¾–°¥\'xú´U4m½\\	–\"¹’2N¤´G#($ÆˆW\Úq\ßş“úkA¸—¥Nz[¦[ª-9)cµ\Â<#\Ïş˜şºË Eª\Ó\Ùm£!\'\0;G9ú\ês¥n -\\\â \Ş7+¡¥©J—=\Îâ¯•qñª\×}÷Ğ¶\ã&+•B\Ò\ÓÏ¦’Yú5eU%}â˜°ë½¡!\Õ8?M]T×­ÚE\íÊ»fKo-JR•‘ÿ\0>uaD§™\é\à…h‡Pœ’\Êq9\"1÷C~^§Á2œˆ	yv 8U5\ÆÔ«ù—\çœ%Y,¤\á@ıq­•¶»2”ú*µI§A\ÊR9\ÛX\Ïo5‘N­¾±i‰‘R¢cz@£=\Üò14¤¤\\“,#np9:&Q\ŞLª\×\å»§oK¦¦§.RT2Ÿ\ârub\\Xo¤Añ:±+;§á¥¹¹\r¦T§p\ÒC`%	?_\ÛQ\Ù\ìG\ÂfB›JR±\Ûè¯’o¦Š\ä\çfA/\"§d\å\Ë\ár\ê\ÄGªA\ç\ŞT¦\Z\à\ã!	<~úÍŸd\\tÆš“6\'jd:…\çŒjwhZñ$OüA\ÛiÇ¤¤\0¶¼\ß%IN?\ë­\İÏ·[•vS¿«\'\î¨iA”2¦qF8\á#\ÔIš\ÃyA \'ó\í\Ø\ÓÁ\É~;®V\å\ç\0g]V%j\ê·vUQ©ó©\Òc¾c\å*zVa ¤¤¬RI\Ïq\ì\×>û\î+Q(\ÔyLˆ/-?x‚ò;›R\Ò8B°x\îùóÆ»½[GB4\É~K2TóAiI\ç\î«O-œ¨($ş¸\\®\ê_lfm\Ş\éN¶\ëI=\è„ˆ\ÊB–Ú¹\ïJO”\ã8ıF’šûO7+QT„´\îlÿ\0s\ï\r}]vbğo.\Ëk7$uˆõ©¹%™D¨ZN\\5X´6\Öñn;\ÇC\Ém¤œ”(­*Â³\ã:‘R/]˜©I¦±sÜ±œ¬\ÛQ‡\Ü\ëRjKpHJ’V€¸\ç\ØH\îÀ“[pzAöpt1\Ó5+bl\Ï\Ş-´pÜ·% ÎŒ\İ\Æ\Ï{4Ø«q~ˆKG\Ú„:¢ N1YD}‰ıõ_Ezee›\âôûS^´R–\Ûp\ãÕŒp\Ò\Æ~R\äøÒ¦nrMs%\nQIˆ\Û\Ò\Z²´ù–\é\ÈXM\È7\Ï\íº\ÚKÁÆ«ˆ¬·bS¨e—ªq#).z\É=\á~\Ü)H\ï\ØrAÂ £ccm\Zu\ßrÂ½·\nøv»RD8ñÚ“,j\Z=\èI#!dœù\çC6ııc}–U\ßû\ĞhB¾v\é/¡ª…VŒ\ÑCA¼œ&S\n÷\Ç_n{\\IZ\n±\î9ÆŒ¾™µ7¶\ÌA\ê\ÕNfƒ\"*Ÿ~ \ë‰eŠyl\0\ëRT¬œA\à\äòGt;¨œ¨J4*\å\Ú^1“~@˜š€\Ô\ã©va -;XX~‘r\Ón\'©µ\ç\Å9ø÷‹uzZ\Â\Z1‚”•4µ;Ô•$\n‰O[¼±oJ\\S\ĞU1(õŠ\ïğšX\Æ<`ë™½c\î\í\Õ\Ö\r6‘\Ñ~\å\ÑY¶©SıY\åT]‡2¥%.‡1Ü–(N=\å]\ç\ã\r¯ö¢õuÒ•F^\ÏŞ³Ux*”\èa\Ø\ÏF¤\ÛRrÜ¦‡?¡$§ô\ÕSfdm¨Á\ÜzÆ·]I˜*\Ìv\êE\È\Ã\é´p·q„‘œó\Éñ¡/sh\Ô;\Öj\ì¹./¸ªB¡^f{Í¤¶‡#\'ü¢!%+VPùr»rN¹ñu}¸\İp\\I•d\Ò-»f‘sXbDšS\Ï=¤{”·Á\È\ãÜ“Á#õ\Ö¡¿»µ¾Y\Ü=Õ½¤V@qºU23I#aCò0€TsÊ••Æ¾Æ’o½}À:X^3ªŠ•.y‹Gmú\0\ê.×‰F¤_±gAjs\Å0+=U[)P…8ô„²÷µ)}JO¹+\í\îmC\È$œô*”jŒ\ê°$6\ìy-¥L¼Û‰ZV\nBII!C¡Á5\Ë\í\è\Ëqo­†\Ù\Ë\Çi\à‰»m¹;vh;\Ûnş*Q(¦C¾\â°ÃŠ\ímm+\ŞP\ÙOiBjÂˆÑĞÁ\îWI\Û(6+q7q7¤z=QbÛ­.:š|@Z¯E\ÔeHIC¥\ŞÔ¡Dv¨~_Ê“\Í=%5$\nJBüV¶\Çlz\î`5\ÆR\áµ­†ıDÊ’\êN¾?MbÉ’ğWqs\ç:ùC.C[Ê’””‚@QÖ¢Uq }\ËùÆŠ¢/	Œ÷\êjP\í$~tµªa\Ç&8TŸÉ\Ò\ÖG\ĞˆClª¥	©”8\ÚOnxPMcAÜ§\á¶\ãj¦¬¸œ§\İ\í\Î>¹\Öu—ĞŸ\Ï\Ï\ï­U^JT’\ê2Ts\İÆ­Zi.\à\í\Ê%)$Dv7#qª2a· ESj¦À9?¾ªŠ¦\×W\ë\Ô\ÅV`T\Ôñt\æ[a²\\_œs«Zé¦Š«¨q\Ğ;yÏ=l8ºJ€a\á\é÷r;\08ıôe+4%eÁhXˆ~U3®”<M u¹¶\"\çM=Êº\ÙR’\È\ÈBòNyÆ¡¢Ş©´´‰\Ñ\Ã`aIÁ\È:9©Pß¦-/S•,ahV\0ú\êŠ\İú]>l÷Š@ˆ•º]¨Á\í<gû\çWt½O4·\nquM4\Ã ww\")†\ízsÍªU~/±¹\r(ñûŸ¯\èuµ¤mí”¥¶ôkú$W»Àa†Á\ïWè¢¯Ÿ\Ğjk+dn84¦}*·ko6¡Ü‘\áCı\'õ\ÕM|[\Î\Ù\Õù6\ÚûdH\Ğ!]\ÙOq\á$$şš —ûEE)r\Ö\Ş(Ş•]5	ZÛ½ö‹¶³u\Û6e‚·©÷Twf©…GX`\0ò‰ı@8ÀúşÚˆZ\ÓrU_E”Ì§TµPñË«\ïP\Çv\àóŸ\ÛD\×M\ßg¦\ßF¶)v\å¹&«Wq>¤–Vcv)?øe¿§#\'9\È\Õ\ÕmtÃ´{|Ë”\Ë.\ĞfŸ\ÇC¥¶\Ü*(W\Ïi<œ\ègQ\Ò\é\ám‘Æ³|·‚\Ùj=Rp6\á<#a\0\ÙÑ¦\à\ÂCwUR**ºzs¹\ÉkQ	\ïöü\'9\Ç\Æ5nn_\Ø\ÓStk:£»•«,ût¿.ˆò#ş*Â“•EVRKI\n\ÉşHù\Ñ}I\ÛBMÖ‹¾¹Nj[¬:•\Å2ù1Hùo23œ\ê|ºœn\â\ëJJ}\É\nù\Éÿ\0\ÓCU}G9X–m•ŸyEõ2%Nyn¶;\Ç(ú Ú™\"õş\0£\Ò]§ZAhZMT„Àm¶\ÙK!@•\×hœ‘\ÏÎ¥û7Y¸*“\n­˜\"D`°Ù’•ŸE¢¿…g\Æs\àrt`õ½³ôş\Øú•)6\ãu:R\Ñ2š\ÓO–J V¡\É%\ã³Â³õ\Z\İ\ê{l6²‹›pK‹(\"3P°ÊšZ;Js\ìVAöşo\ÓÎ•3Ô”76]^a­-©rA\èA+\Û\Ë\à€\Ü}—´7ZÀ—m\î´DÕ©S©åŠ…0\ÈòPÁA#\İ\Û\Îx\Æ1Ÿ~uú´\é»uzz½n­°³\îJBÉ¦\İ2÷6åº¦Z\íYJóI 8 €„‡pIÀÏw/f~Ğ®—·:ö•¶\Ó7ºªœ<#¶Q\rDµ$†\Ş\î\í*Àœ`\ä|l\ê?cI{\æ\Ü\ÍÅ£]øÉ­¸\ë\Õ Ô˜~:qJR’Œ¥Gœùùó©²\Ò\ëZ@”‡ó\ê)Ûœ2\î¯\â\ïxü\åCº¥PzmMØ‹oÜ™-¿Ø¡Œs\Üı?\ãN&®š\Ë\ÎUdK,¼]µ¹’VO*QúŸ©\×\è«gşÆ¯³û¡­œ¼\ïmÑ³)Û€\ÔHn\×.k’ö¡E”\âc\Ämnc1\Ûé°”·İ„§•¨{•’\äd)]õ“º·\í\Û=(B°\éLË„ªu%Ä§\áúr=`À1[e¤FYC\ÊKOz—“\È\Ö÷©F]ö\Û¾ñ\ã5d¿2\Z¶û@e6­ø\Õ\Æ\Ótö}wJT\Ìt2ò¥(cÀò4otw\ĞQ{“M¤Q\è\Öc”ºxBU&­p­L2\á“\Ú\Ù\ëı€:»6:Ø´6®ª\ÓV\å¡K¦%m„´`ACj\0ÿ\0¹8?QÎmš¸©\ÙD™ğ„´Tó€“ı~uE50‰•à­‰5K¥N_0Rô£·ô}‚\é\Ê\ÑÙŠ\r]\é‘\èt\ÅL×’R©(©O+\ÂTµ+\éX‰¬©\\¸\æsªúÚ©Lnİ€mM“(%c\Ö\È\×@Gy\É:1”-\"ã• l‰Pù¼L•]\Ãe!Y\'\Ï>t\Ôj”u¸úRSœ\ã\ãQ¸µx\îQşúp:\áËXù\È\êli‹‹:–\ã=±›{‡\ZZŠ\Ø\åô°\ã¥\å,€4µ‘‘^:\â›s¦{\ÛYW<iij\é¿\n…¢˜-D\Ä^\â’c4¢”y\Óuú¥)ZFFF––®Ñ†	„|BbUN€\Ê.3\ì=¼ãœi.\Ê,JÒ•	\ä%%Jƒ°O\æ<s¥¥ª\æœq.\à\ÄÇ’•\'\"Ä¯Á\é\ÎS\âDD©C§\Z¬\Z=ş\ê*—ğ¥	\ä\Õ{$D.”¥ÀHq8\Ò\Ò\ÑM”KM,oo\âkùv]n!õ£\ØT\ØF˜•Eg\Ñh\'µ¨\è9K`|şúÙº\Ûn·\ê\0O\ÓKKK µúŸ¬8À\ä\0\\ºr¬úª	Rc›S©GiÀ?_:ZZò>ö7z=g\Õ.†©¾²©´\×d–½^\ßS±%A9Á\í\äyÁó®\0õ§\Ö=c¯\Û\ŞmZn\ÙP,qmT¯V\Ûgü\İEÅ€\ì™\nKq	\î\íP	 ­G\É\Ò\Ò\Õ¢\0\É\æ.h\n\"|4Ç¢À§¡\Ú#¥Q[t‚T³\å\ÅÊ—ñ\ÜO\ï£\ìSŞ››bú\æ¤\íÅº\\‘JÜˆnQª¬?-\Ïò\Ée\ÓÌ‚JP° A! ¨+ğ4´´7IuÀúP	‚*«M–²3iêª„\Å\ç\Óõÿ\0eU\ŞW\İ*uN<€\Ø\Ç+ƒ¸~ºü\ìı˜ñ)5¦oû2¥IiP¤&„ ”¨>\Ğ\É@	\È“ó¥¥¦\Ğš}`²S>-ùoïˆ¿*w\ËJ³:\Ù_ùµSB{&¬ö8\è»Ÿœh\Üû:ö\Ş\Ş\Ü-½F\î\İŞ´\Ù,\Éq`<\æc°R\ï\íğµ{¸\'\Ç\ÓKKB´\æ›r|qÁmBjat­*\É\"6\å\ÉpY\Ş\ì$cÀúi\æÁR\ÒIù\Ò\Ò\ÑgÇ”	ó¼l[*@>\ÄÅ¶±\ì--{ûJLCJG=\é\î9ø\Ò\Ò\Ò\ÖFGÿ\Ù','Keith Richard','Limbo',21,NULL,'09386508693','Cuenca','Hello'),('U0002',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0\È\0\Ä\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0G\0	\0\0\0\0!1AQa\"q	#2B‘¡±\nRb¢Á$\Ñ3r\Ò\áñ&Tcs‚ƒ²\Âğÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\03\0\0\0\0\0\0\0!1AQ\"a2q‘¡±\ÑÁğñ#3R¢\áÿ\Ú\0\0\0?\0öS\ÚB\0\èœ5™¨\'s\Æz`„Fºbe|\Çx\Â¶`\0;QHÜ¾°\İ\Ùô\çxb\ë\ç$\æqòN	‚¤…°ry\Û?Œ&\ì\Èu%µt=w†%\í±Ÿ\Æ2—UŒ‰IO½¬\ì\0o8ac~Xj•gÈ…†N\0=\â)¨§	qJû\İ ÁJ^\à÷‚²Ú—¶ı!\Â^7\Ú$\Â N\é7W\Ø\Â*`\ã¬?q–˜h¾ò\Â‘•-jÀ3¦qÂ¦¸©MI\â\"Ï¤L\'\Ê\ÌWYSÛœ³A*\ê<¡J.s\ï\áMœ\à\"Ñ‘‘…+\é8\à¹:iôş+->¾qMóZ@‹Nu÷D5ˆ­:U«V\íÂ¦G\×\"‘Viõ y”¤\ät0d$\çR&‡\ÕJpp~Ÿ&;~Pº†\Äc\ã	´2%\" rL`\äQiW_X*\ÒzD\ç¹\Ş FT\Ü| ¸\îLD\Ò!¬ö\Îğ	\à¥DmùÀ\É\"\"8FO/q\n£\Ã\'9ùC|w0£eYÁˆ‘=m™U\'%„|\Ğ AY*(\ØşP\"J[\Ş\ÂN<¶{\Ïc\'\Ò¾²·”k¦?¤Ej#ÏÀ\Â+pc¬a\Å\á,H‰t\å*	W\\Â­ ‚sŒ°\á”\ç1ˆK´\Û˜w.\ÉWSK4V¨¤>‘N9lşøš\ÔJ’¥\æ®*‘T¥EqÀ\Ü\×.KŠÏ„\Ø÷\Ö|°:¨B¹Á¢J€T÷ˆş+t„{\r\Ûÿ\0\\¯\ÉZL²P}–O˜.nuÀ\Ã ó8¯€À\êH\å¯¿´_­÷\\ü\Õ†{F“f\Ò”K\Ök-¦z¢´\ç\á9ğZ>˜^<\ãÏ x“Ô®!\ï\ÙıS\Ö[¶n½V›p‚ü\ËÄ¡	\ÎÍ¶‚;€<¢¡¨\Õg&%\Õó„\'ò€\Ö>§¢»”\Ú\îdöó\ê¢µ—ş&5¦i÷u_n*\É(\äZ¦ªk\ròù%¤” ‚bŸròT\Ó\æ`UV·Õº\Ö6?ŒB\Ö\ä\Ê\Ò\ã! w\Ä+$\î\åÕ”(gr”˜½¶\ìnSŠ€a \è¥*¯\Ï86Cnry\'\ç­MW½,:\Ò.\"ğŸ¡O4r‰ª\\Ê™Xù¤½:DMÉ¢Z|‚v÷¼3qO©\Ü~pC\0J÷kÃ²ğ³ôõq©¡“T\ÍF¸¥õ\Üdò½\'_h&p7ü“Hy¹\Â\Çhõ{‚Ÿ¥…®8$Ù¥\Ø7H¤]*eK~Ñ­:”M_´[?e\àş\îø\ê|\Ó\ÊO½.p‡pœ÷‰Şß³öµ\ëN¹¨5‰Š}RBeS\'¤Ÿ-=,øû¥c§*°H\î\à–ˆXÂ€iÿ\0LÇ§Oüù}\Õ:ğ¤X\éú\Å3À¿ö\ïü>\Û÷Få¤› I%›–—)<Ú–\Ä\Ú	B\Ô[\n\æJVRT\\\ëNñJ€‚“À\åÀ\Ì\ãÂE$\ç¬DQr	Œô \0$ñ® \ÈP\'¼m)\Ş\"Cºv\Ê\È@\0@Œ6’LYj	gÏºAs\ê9${2¬¤ŸH\×<\æs¬H­g9õ‚¤b\0Œ-`\äf\nU\ë\Ö\"‰d\å®\ß\á«X=¡Ô®\n\ÆOHˆ)jµf›mP¦\î\Z»¥¹I	G&fœ	$¥¶\ĞT£¹Àhù\ÎúR¸\å­q\ËÄ½CQ\ïIZô†v\Ú4Õ«v$Ò²KŠ\ÆÁ×—•«\È\07	\í\'\Ò\ã«W~p~VlI·jU\Zx¦‡$\ĞI–—}A¨²”³\âe[c\">mnš\ÃS¿*Û™nMdœtR»œù\r‡ıb¶‚ú±\Ù_MŒ5À):\Í]*w\à#J¹³Ÿ‡ÿ\0·†:•¹\É\âsp}b3R¸İœ˜S…£¢R~\î!\İU*\Ó\"ZE…$,{¤\ç$\ÆlŒªA5´©\"SÃ•†2”ı£\Øœ®te´;\á«8$íˆº¸f\àˆmğ\æ\éÁ#&\é›B°¡\è\0Ê¿H\ë»+\è/ª\Ôešš»\ïw\Ö\áPñD´‚zsúÆ²·µ¢bg\à·ö\Ş¿¬\Ğ\çC\'şF>\Ûı—›nSj¨QöE—6Ê”6’‘6´ò\ÍKr\í²‚qùxõ\ê\Êú\rô\ÎVh*¯W¨8À\Ç\Õ)\àJ½I\Ç\é]»ô3p·Fyª„İ¡\í¯6y¼)¥’\Ù\Ç@@\ëg\Ó?e²\0y«·\ä	şğ\ÌS§9ÒzcxVV~jBa/!8Z\Ûc\Ücú.´¹o9)G\Óy:d\àÊ™Ÿ§§\ÂR6b\n|Á\æ\Ï\\)Søxš•¦Î¿(\ä\ã\éS¾$ª”GDUt\'ûö\ÜjzÂ‘i¬{\ß:\Ş\Õ\Õ\é\ÕÓ’\"\äªÃ‡n\'õG‡MF–\Ôı4¸“¨²ğR¶+RNA\È\ÈøI¼(k¬\ïún\ë2$›§¢³Nm\ç$pV¶\\)À¨„‚3¸!8\Ä|´R”À\ç\è<£\İ\Ù\ÂÕº\Å\ë\ÃÛ§µË•\Ù\Õ[\"BQ÷Ô³),ó$„¤²‚´/=s\Ò7\\™`RôA	q$‡Uò\Æ +sˆ:¶‚(\ï‘òŠ’,\çc\0ØŒ\ç} Ÿù\ÄDJ.6\Î#)›¡ŒH\Ëg&\"„Bt\Ñ÷O\ã0\Ù “ùÀˆ†_V\Ø>Q®u]D<y^\éß·œk\ŞV	\É\íX’Y\0o\'\'¤d÷0P¢\"(2 Œm\ÖJ\à+>°Å³\î\ç¾a\ã}¼\â\'*ï«Zbó\à¯Um©)%L=7`\Ô\Ã\'ZÄºÔœg\Õ#ğ”\Ê\İI\ÙYYâ´ŸÇ‚BH\ï’wü}…³*\Ì\ë\Ç6\Ò\\eÔ”8…Œ…$ŒA\ë´|–ñqc\É[H\ß\ÍMm\É\É\İ\Õ6%ËŒ!¹—R»l\0\Ä\ZN®°®\Ò_D\ĞşUGoÊ½Rš_6\á	%yô\ï\×ôfğ8­\\”\Ô\ëò›\ÍK/òRi\êNL\Ñw; vóøG+è¶•Tn\Êõ*\×2‹B\ëUv¤\Ê\ÏP\n²³@“\ëğ¥4-:´\ä$\äd\Ğ\Ûr’­\ËÊ€’”¤\Ï¦\ã|@¶(\Ó;\ïğ]g†ø[Z\ÓuTm\îƒ\ÜõùÊ»´OG­\Û&ˆÄ¬­5¤6R\0H\0c\áG²2„ò\àô\"}! Pw\ÇcA<\ã òp…¿~²\é)\ãm!\ÂF\Şpb\0P)\é\Ä7i\Ç¬œõ\ßx\ÖV¨¿¼Ÿ.Š”ód\í\È\Äú\ÚO\à’\"·’\ìJ\ëş¦Z:_bN\İ7eY™9Yv§ãƒ˜€7	©8\Ò\â¹\ÅN®LN[\Ô\×İ–ö‚Ü£M ©K\ì”\Ô\íó>C¤{¬Ùº´ëŠº§\çfe–’\Ô\İA\×R\ê\0R~$œv\ÄCl¯£\ã‡}&ª¢·CµX\\\è\È/º\Ø8Oğ¤ò>ç¹ƒku\ìõ¹®d‘¶p¯¸´£ui\Ê\æÀ>ô\Ç`¼‚Ô¾õG4¾Ÿ¨›)—~¦µ\äÁ%M c©éœ\ŞQ\é§ì¼©£ejÿ\0\Ö(º*4Œ‚6	ğæ±¿Ç´9ú@´JOQ´n¡L“–@zEH\í¶\ÊO¦R>[D‹öi\ì%[z!ªUù… =3xJ\É)°w@bX«‰{ò£…\ß>\î“\ÅC\æì¸¯ğ\ÚE !„G|\Úô¡g®\ĞU}¨Ê¶\ÎğE\äF\År\Ä#\ÌGa\'?Œœuˆ \İaA\0¾p™óóŒ¤\ã|À;\'\İ;k<ƒ\İÏ¬#y\å\'\ä`@ª\ÂFaD$¨Æ½Õ’O–!ó\ëO†#^\éHQÁ\Ø+:$V£’Gh9\Ş0\é\ß?Œ¡\ç˜”\à%šQ w\ïe\Õ\ß\×x`\Ñ!@r\ìOh},p Ÿ\ÒBL­\Å9{$„ô;GÏ¯&I\ÊñÕ¨²Šq?[|\ÔV\ÚV\Ö\Åx\é\ÂG£»| ‰#\ÊR€3sñ\á\Ã%\áQ\ãN­}Smg&i\Õiy9\ÔT&L¼²],¦]Lø«RR\\%œòı¢1˜\×q#U´fş‹y\áú”\á¢#¯¤.<“\à8\é¬Å…©¶|º\İ]®\Ë\ÕVºœ+!Jø³¾¯})Z%\ÂıU½9³UúÄªG\ï	jj\Ò”8\Ï*Ö­¹ÿ\0”g\ß°q±b\é\î±1\Â,µ}$\İLª¬¾_c•.2\\l$\'™Ç—Œa!;’b \Ó\ï£Î…^­šbĞ£\ÎOOL•95yN¸9\İR²V¦YuY\É9!D?(\çYn[PT»$\Æ\Óû’\í\ßzË‹r\ÛR“\æ0{}6õSõ~\Ğ}‰Hğ\å\í+\Õe!°f	©¡¶\ĞO`BTO\Ç\0f:W…o¥\ãB8€—š“¹´ú¹gOI²—\\n¨·N2…¥#›gm²H9_ª\è?	u™kJ£~\èrbQ·ƒ\r\Ú&o\ÅI\ÉO# \ï¹¤YZspj~«P—vi\r3I¯jXif”\Ì\Õ9å ’O9Z7Â†v\ìc& ¤iƒI;™ıB\×Ğ©E\Şw\×\Õ\é\ä\0Ø•\èe.µo\Õe9#:Û:B¬‚”k/]B²lZkµkªÔ»\r6§¥nBR2H\ãŠ4s½.\Ò\Ë\Ò_Fµ:B\ãµ*sL\Í>‰J\ÄÔº\åY,%*q ò–€	J‚‘\Ô(vŸúş·8›»\ê\Öö„Y\Õ\ÂrJyro.«<\ÛR>\ëhZ\Ü\æl¨‡ˆ”\ç˜`\0¦Ş¹`!Ÿ¤\Ş\Ój*–\än ƒ÷\Ùh5\ã\é\Ö\ÒK&«1n\éf†\ÜW7³‰‰é¥¦I„yAQN{>qP\Íı:È«¤¸2®\ä…Ö¹\ĞGq€AòÛ¬oµwX\áª÷U•«\×ş—\Øó\ï•/÷t®LTJ“y¼E(…\îw8\êbki\éûú¥¦ú\ÇC\Ô\Û\n£D©4¹–f¦¬KÄ‚R¥¤…\ì A ´X\Ûv9jdú\ç§\ÉSR\îÖF\Å\Ì\0òÕ´yºô\î¥nº\Ù<T\èü\Í\ßd™y–Jg©³Xñe–SS–’7J\Æ\Ê k}ö{vö€_o aSwó‹XòÄ³@Ÿ<÷\ÌQúI¢µ0‘¯\ê%V†šD£n·3I{\r²\Û\ËPB\×.T…ƒº9\Ê„Œ\Ç@ı·D•\Ñ\Ã=\ç3.\Â\ÚvWSj2s©\\\É\nm¦\0)=Á¸\Ú2x]Ó®\çt…‹\â+š/±\äÌ¸\Óüº\ìG¤\ä\Ö\'|bšP* \r‰\0“¾1¾¸…c\×9¶;~q…¨\'´œcˆ¥Œ¬“\nÀ‚óŒó ¦J¡\Ì$ A\â@\ë\"B$¢L)A¬wø\Ã\Îr}!\äÊˆl8\Û\Ò\"tB£\Óñ‚•\Øù\Æ\n÷\æ\è sùˆJvœ\'\0Çœ?“\İAQ­A\Ã\é5öùAJw\\ó\ÇF³\ê­P§i\í“R2H™•3S¡JIRyˆÁ(!X\è\É;ô0\ãŸHÎ¢\Ò(we\å\\©\ÏM\È\Î\É%Iz®û¬†Š\Ê´¶\âŠ©\Îd«\É\ÉÁ\Ş;£\í5MjÛ‘\Ôi62\í1^\Í:q’e\Ü;’¿ùG$k=*±}\Ó\'—¨¸Ü­\"MÕ‰T«\Üu@¥@‘ÜLˆå¸§9•\Üdú|¦xvnN$j\ÔH3ş!P\ÜJğ{m\ÒoW‰f®J„\ÍfY¥\Ój3ó¯x‹2o(’|ù\ãd¸Á\Ş\'Sü%W/™\'(\×Uvil¬r¸–¦–‚\à\ïºH1lÖ¬\Ê®i\ä\í‰q-\Ñ%Y¦–]y“‡*H)q²Ğ “\æ‘\rmª\×zr\ërÆŒ‹É†’‹‚Ğª0Û“@\r–\ä¤Ò›ğ\Öz‡œ“ƒ\Ú5\ï\×p\Æ\êv[ø[kz¾\Ì\çh`‡0\ã\Ğo#\Ğ\í•T_¿FN˜ê—H³.iŠÌ”½§‘˜¦¶Ï´\Öy”Ú#H\æ\0\à\äú\à\â:N´â—£v5F’ö*]©EúD³@#•„…\â9œ$’¢TNTI„\åøŠ}†¿\ÅğÛª\r}n0½ı\nfˆn¯ñ¬\×U5†˜ğ£tµ9T—–»¦ede\Û*N\nÔ†\İq\Õ% ’@H\éŒ\Åü\ÚÆŸ,»¥cT¡F³\äĞ‚wòG\Ş\ße]ı\Òò\\g\ê]Ó¯:½h\ÉOJÓ¦—¡\Ë\Î\É!i`>¾d%9S.\Û$¤¼|ñŸRdô[£D¨”d)—U5ª\Å1R\Í‚“È¤;°À\ÙÄ¬\rË©1lpMÃ¼‡\ÚC%§òmÉ U1Tœi®D¿4½\ÜXO\İH\Ù)’”\Ğ×‹ıº/Ùš.¥ieIª}\ïhL.f<óel¾\ÚÀK\Òo¤TÓ‰ B’’7a¨9…\Ã\rˆù”9`\Ò\ä\Ì\Æsß¯¦d\İğ¡\\Mpm§|L\Ó\ét½a£NU™£¼\ã”É–\ç9&YñB\Ğ]™h<‰÷TH\Î\â6³\ZE\á\é\Õ;JdœyŠ\r*]©yr°\Óc	BR9@\Æ\ç¹1š»q/Om‹Óƒš\Ó\Îòy»^å‘™—w\Õa\Æ\\Oûª\âgXu~²\Ñj‡Áõ\é\ÎrªµZ\\ª\êO´¬\ã\à\Âõ*¹ºuc\âP \Z&\Æ}Î¿\é\ÑTÚ•¡6%AÔšÊ§&İ·)\Ó3ò\Í.uA\âYq	RÑº\\#œòó\rŠ²0pbsÁ­…spİ¢“\Ôı3»jR\Ó5š\ì\ÍF©,©Ò–\Õ6¥‘·*r\0\èq¼k\î\í7Ö½Om¹MW”¢\Ûv\àu·g\èT©õ\Î\ÎTB–^‘\r´\ÑP\é@QP\æ\0˜™ie÷-Éª|\ëJC\â®ô\Ê(M¸ú”G)Œ+k¼M®ú+\İB•y©R˜\'€½uØº{UuK\é·5q?\ãB›˜V1Ì¤œmu:DsE-·-=/¥RŸIKªc\Çq?\Â\\%Xü‰#›(\ê\éj\å7Vğ¼®÷•\í•9b¨\Ç\ÂQUœvü`¤\ä\ì \ë+Gh¹«eg›—¼ö\Ì¬yw€s“‚€« F³Ë°Y•lH=¼¡ƒª\'¼<™?VF3^\Ü\ã¦\"\'Iso\Ö1\âc\Ê0¾¹ŒŸ\'q3vNšX\å\ëğ\Ì:•PJòOS\Ö#‡,òHˆ\Ön\ÛrZğµ*6\Ä\âAn~Il«=‰I\0ü\Ê8B¯eM´º&bjfJi/)©”#\nK¤•%IWL\àºvÿ\0”ZJyIøEYª|(\"ÿ\0½»¨7St\ÕN©\Ö“ñV\n\ÒB†\ä{\ï\Ş5œF\Ñ÷\r‚J\è¼?\Å)\Ø=\ìªa®\Ï\Ì~ÿ\0…\Ç:MS˜—¢1#Qÿ\0k\'\Í,\îF0¦\Ï!ı\"ë´ª©´-G#n±¤\â#‡•\è-\Å+9#Yv~N¶•<fa-òL#h\0gb9T>&5¶]h\à2µ\î\Ñ\ÍÕ¤ûw–;p»J®\é\n´Ì´«T\Ô$“.@$\'m„Cko\Î\É\\I¯ŠÓ­´ÁHK g=c´	\êŒ\ãRk™d\ç‘9;DB{Y-	9æ¤¦\î¥?4T©\Zzó›[ºÀfD•sZé†‰Rı6\Ô\íRnuéª¾š	6Y3)8qş|„€~±½¨\ßZš\â=¶\Çbfšúy\\[s\âYWcÉRŸıYˆ\ÅV\è­3‰\êuNH(sM\Óo¨\Øû\ÉBõ=i°h\Ì2õ~¯\ì(|„µ38Úšij\' R†:ú\ÅğFR:•Mz´~jeMS²’ \Ì5á•¨¨\'?g;ÁŸª\r\\\Ø#”`ˆŒKŞ²5‰ŠeI©™gS”-§’|ˆ\"R«%V\á;”±P–un£šSm2\à\ï°\ï\é4#Jy]\Ôj\n§Ü›ñCJt²”\0\Ú¼ğ\Æ}c[nZ\Ó:¯¨\Ôû\ZZp°\'f9\\˜\róøhJJ”¬dg\0³K¤š#¥\ÏMU&*©™O\'Œ–<46Œ\ç•)$\È9\ì#7‡Z>½AP*\Öñ^+NÂƒ©\ç#ã‰ŸE4PJ\ä\0\0º@!º•±\É\í\n¸¼Œ\Ò:¬uÜ‘¼u+\Î`•‡\Ça×¤c œ\Æ\\ÁI\İü\à€T\n\ÉW½\Ê dt‚”;\ÆrH\Ì:c²Yµ€° ‰\Æ70 HT“”G”|>c\İ\Îø;ˆy3•#›\ÍÀ;*\èR\í¿cˆ)8\Ú@\'\ìÁT3¾;\ÄPJ ’3\ĞÃ†Tz\ŞF\ãg\ËDE=—Qß¼l¤P#=#[.\"\Ê\Ì¦\"B!B¸¯±©÷®ˆUš\åKô†BQ\î\\”©°J‡ÁI\æ?H\âª%AR“¨<ıO\Â;\çW\Ö\Ğ\Ò;˜<°”ş\á›«ÿ\0d¨ó2©wL\ÛU	ğ³‹—À\Ù\'øU\å\ècš\ãz[Y§¸]¿…œ÷Û½ü«ú“T•œ”\r¬x…«/=(zÃº\Ñ}it –q>\Õ\âK\Ê/\Ã™RTúÀû%K)I$‚r2—{34\ÂT—Á=÷‰\İ:~N¢\È+ Œc¨eU\Õ1Æ“¦$v;$l\î!µ¡T#,½A[Iu´6\ì¤\İ!•`%%;+—9#©\í˜\Ój}\Ñ~j…-4\ë²\âz²\ÓO°ì¼—	o\ÅeÀ\ëjDò”­ \äuÀ\ÌL$­^u<\îÈ¥K\Îü§\àĞ­ú:ô¬š[<»\çx\Í5¥‰ì¬©©”šÀ~•i¡\\:X:N‰ë’mµ%T©¸§gœe\å¨-EEg9$’w$×k\Ù\ØVü»\ï\Ò6Z\Â%‚¹9wôôˆ(÷M²dg9ªT™”/%<Å¿a<ÀwÀ9Ç¤`j¼4wR¥R\âjT>ªü\àwOœœŸ©j¤\ë_T\Ò5D}¥œV>•?5GCLº¢p“°„­[B…`Z’v…·-\à\ÉÓ˜KL¤\îUªQ\î¢rIó0w@\Îz\Çgm@[\Ğ–ñ³}v\ê½\ß‰º\Ô@;õ0‚\Éõ³Š\åJ‰Nz\ì!#\ï\0pFÙ‹\Ö )2­÷‚\îU\ï+nûA”r1óPFN~PÒ™\ï˜\Æıœg#\Î&\È‘\ÛY	Àı F §h%W¤\">p€m±´6X\É\Æzˆp\âJ’;B\\‡sˆu`\Ù$Pù\í\Ö0´d\à*J	\è?L¹$XŠF\Û\'ra\ÃH\Î\àôƒ5.psÓ¼.\Ú\0\Ø\'óˆ†¤fZVr	ˆö³ë˜ğ\éb»¨Z©q¢Ÿ Ó¦’3³«\ì´\Ò:­gn\Ø$\à\Ö\ê^¾\Ù:m.\ãN\Î&z}y)w¹şúº zn}#—u?L˜\ã\ïXl­FÕ™µ·gYÔ©‰\ék6Qd1T›}\Ğ\ZveD\åHKMƒ\È\0\Ï>	\ÆAf\0\çge¼zwS‹¿)}j\áŠ\èÔŠE õ\ÜT\ã4\Úd\ä\Ü\È[³ªuô0TR‘„¤)Ä‰\ß#;G3T)\ÌU¤T\Ì\Ò\Ğ\àÂ’F\Æ:·ˆ™\Ö>\Z®-³e\å\ägf)i]¼\Ë´\ÜÜ»¨˜–@	ÀJK!>@\å¨º\Í\r‰‰\Ù7|§2ï§•l¸œ…6¡\ÙIP)#±9>>\í-1ˆ\Â\ï|-\Êm£\ÃNC³ô\Çò õ\Z•Ã¥5\çi\î¹1O[‚	Sdœ\0–|ÿ\0±t\ë_(³¯!/Mò@q·6)>£¨†õŠrÜ §ºH\ëê•[7(K­²\Z}*<®4JT“\èGH\çÛ­¦\ê\Üh¹€¸A\îº\Z\İ\Ôja7<•‡\0\×ü µ\ËşEi‰™´6\Ó\ß\ê#›š\Ñ\ÍC§i:—?,\Ğ;6 ú\Æ\â—`\Õºt\İ3•\Ñk\äF~2yÎˆ!cº“C§\ê¤\×VªOW&§\Ûm­\å‚\ï\ÜOn±³\áÊ;+¯V¤ÚšT\Ü\Âk->\âB·Pl<¾\ÌjhôFeS2Œ%)d¤u‹£ƒ=;z©}\Ïß\Ë(KÑ¥\Ãl©—F9AóK|\Äùs§\Î2,):µ\ã\0\ï?L¬.%]–ö{õÀ]I¤Z÷¦:õCz³§W\nfU*¿£\"\ây“w%%$ô!IP\È\È\ÊNûD’i¤\à˜\ãË¶¹_\á\Îş¼\ï«—+#8\ì\Êf\'» ‰ö9R\áSˆ#şò÷Js\ÌZ\Ï«zQ¯ô¦\ÎSœ\éIöª{À$¼‹\éğ\Ìwd/.u\'•Ô´û\ä\Â¤¤`wˆı¯­zqy1M¸\Ä\Ê\Î¬\ïÔ¬Ÿ!Í²¾DÄ‘I\æ9Ï®|\áFR”Ü¤ã¯¤c”±?UI;\í\Ö´¨dóJ$\å\ànNı\ãmœÁ”’\0\êc`ò\ã8Â’‰8Ymsu `ò@²¤ó!\'=¼ ¬ö\"¡\0x~¿õ2\ÍÓ‰TL\\•	NgÁ—m<\Î9!\Øz¢\Ä…·m”¤\äŒÆ†ñ\Õm>°\ÛR®k¢Y‡œ‰d+\ÓğBrb„\Õ>(.\ë±\Ç)–›\ÎR¤N\ßP¯®t2\Ç\Ùø\'ñŠ¥\ïi™}S)Ek9Z”IR™&¬%6—ğ¯»³yF]2\ÖU¢\\\0a357¹Aõ\äFÿ\0œW\×:§x²©9Šòe%\ÖpX¦·\ázd¨ş1fœ‡}\âr0aCD”¢S‚2‹¹M@5¡7¸Q7V TZe.*Q\Ğ\Ñe˜´øh”˜gÙ¥\Ö<%\Ò\ÙK#mÀ§\Ê 6\í9º¢f‡!ğ€\r¥=±¾ñ¼\á\İõ\Ò§2A–}\ÉGO°²\ĞCaX]\å]+O–\åJT\Ù9I\Û£Ÿ8¨\á\Í\ë~\àš\×kœUM¨9\â]”\ÖS¼¬Á\ë:>\âöñ\0\è¯¢•––T\Í=ª„¶p¿.\Älai\ZCŠm\Ö\ÒN\éZT2•¤\ìA¨#¨}\å;\Ê%ù\Åe\Ø_Ö°®*3=\Çp¸\Z¡$&§¥ÀZ@\Î\Ş_\Ş4ô–U;5„•lsƒ\'¯<)\ÌS}¢ôÑšzß‘W3³\Öû{¹*z•K¾ü>©í‘°\ç)j‹ru#2\âH!dË‚\ìGb#Š¸´©k[MAıô^‰iBú†ºF#Ğ­›ró\è÷t¨v\Ûsa‡˜C\r6I\îOhYw…»Œ90I\ì„¾P¥¯3\\¾®I[7N¨*«O/•†‡\Ù@îµŸº„\É=¢¦·[ô·%d9\á\Ô\ì»³\íj\å\Ût\É\Ø6\\Šf\ëJ9‡\ÕÊ´1\Îû‡\î¡\É\îN71\Ú6Ğ´\ÒĞ“²\í\æÊ™•I.¼±\ï\Ì<­\Üu^ªVşƒ ˆÿ\0¼?Qt&\Şu±4š\ÃRJU[¬©.¸i¾\éi\' \ï\Ô\ï\Ò\Ã÷%˜[Î‰\Îñ\Øp\ËiOS½\ãöôı¯>\ã\\WÛª\è§\î¹\ïú\\»\Å\ËM\ËU\ë\Õ6O+\ÌÑ•Ê±\ç\á+\0‡\àb?M§½/A’J#œ\É3\Ì1’œ\àF\Ã_\ê*ºÜ©¥.eUZƒRL|\ê[Ó“Êœ‹\\‰C)Ù½3\Û\Ê6ñ…­\Õ\0(MY¦¥¥K\Í+\êú”¨t\ë´I´\ß_µ\ÇeŒMŠŒˆO»\'>J‚G’ö“ğ\ÜzB3´‰\n2Ó’\ä(l‡A\ÆG—\Ê5j¥&[™–U€q\Ì ieVt¸\å^¶Ÿ\Öm´1^–™¤¾F	y>#Yÿ\0y;˜‹—Y£\×eS=F©±6Êº;.\èR(\ã§eˆJ\ãgl\ä÷1±³n[ŠÓŸı\ånU—t\0HF\á~ŠOEŒ!d%\åö+®\Êzú˜M}3ñ\\X|HZµy$J\Ş.	\ä¨%Å†Êšpù‚2S\êH°iuj]~˜\Íb‡PfnRe<òó2\î¡\Äù…\rˆŠH#t£J£$@ƒ¡>\îPñ=R\×)j•\"[Mk\Ò2D\ÊM=p©\\ş\Ø\é!”°S²FyÊ‰\ê\09Æ©7Y¬Ô“S©\Öf&–Nq÷µ,v\'´u**/]•y™™ >±£\á \î‘÷8¢\îj2““2,²”¥—\Ö\äbú@(&#*-+\"…aKN6\èL:T*yP\Î\İ!\ÒdT”\î>b—h©\Ä$ûŒF@I\Zo³\Èx\än:M\æ”µ:rPvõ¥_\ê\é«	·0\ÊLû](´”\àD00Ki´‚¥­KNJ”XR\Şa\Êj \ÓYIn ™¦O¢\Ò3ıITm\ìúr$$Dº{w\Ä!t\ËZ\Ãs)Fò\êm^¥>ò\"¨„Ê’I]§•†g©\Èaô€™–C­\æ#xw?OJ^.´w+ı!¸…NÆ‘eÀ&)\ë,¸9¼G\äDODúf‚f\ZW2\\@ÿ\0h¡\Ò\n¬Di\r¸mjJ\Òv \Å}¬ü,\ÙúÈµ\×\ä‚(õò\ç\å›ú©£\Ø<\Ø\êœ{\ß‘c\Î\Ç(†jf®\È\Ú7K©\î8*÷\"&ñZ {›)$ÂbV¦\ÚGó9ŸºbŠ\Ô)Ü³CÄ…}ªö)?\İ\×\Î\è6¯\×õq\Z1B·\Zı\â&\\D\Ì\ãsm¹.\ËH -\å)*\æJFv\nHQ;˜\í\Î8q±ø{µ…2‚k©Ì¤~ô­<\Ö™=yG^D\Ñ#\ârb¥¥ZW½y\ËÜ¢a\Ù6\åuLÓ©\áKö”¨E­g$¸$©j*W6ı\"\ã±u¦^¬µ§÷-b#tª]O±H\\óaù¶R2§[k<\ä½¶\Ø\ÈÛ¦5md\ãQƒ\'©ş}÷½¿¤)T 7°\ÄüJrß»¸§½*¢R6\ê³2\ËZ·òI‡ó>GH\Ú!Ú­8$\ì9÷\nğ©®Fó(gúB£9²µcu@Õ¥MJ\ï Iò•%©·f\İOşSD\'ú–˜—L2\n1€\Ñ\Ûbzú›R“\'Ki¤Ÿ\áqÕ©Gú[O\ãgZ	R‰;\ÇUq9Z	\ÆT\Ì×†yVr’{FŠ\ì}T9tÏ”ûœ\à+\àbk\ì\Íe·\Û9…yDCVå’»q\ä6=\Ô`Œ÷\ÄºSºj\Óu)›\n8#l\Æi\Òn8\äË¡8	ÀIùB–—øŠ#/$–\Æñ³’–\r\Ë::\æ\" ­m\nš¹ú»S>óO\Ì%I\êA £bc¢ôšÙµ´¾Ò¦\éU¯M4ºDªe\é2ş\"–\Ø\É\æY*\'s¹91HY\Ôõ?p\ÓĞ„\î©\æ»8‹\æ«&yJî“±¦\"º¢B’N•¶•Ë°\ï5”‹ªTI\êò¼‚RN>\Ğ\ì`F:\\¨©„NË¬´H?„V—ı5-]Uˆ\Ç\×\ÄE¡Al³5.1\Ñ@½Z§!›Á\å¡Y²…«xÁı#&˜€2\ånY*¤t«T\ì:• cş«l¬\Ì`7¤¤ ğÁ\åøÅ²¤­%uœÓ–‚œm\Ò4ô\á²\Øş-¢MtI”\È-i\êHÚ²«T\ï/&ra”K©”¶”\ãx/ù\0h_½\Ñ&YÄ¼\0\ìp¿\é*„´©e´‚ñ\ådYªRœ–š¤…!c\Í$`şQ^¨2ˆQ£õeÑ«u:CS‰\æH\í\Ì7ı3õ±4\\a\Êz²T…7\ê“ÿ\0?\Ö([tMS=÷²˜ğ\İ\ÈÜ”+üñŸœ^”vW.\ÛSÍ¬\ãbHi\'¬™Ê¬„ò¹\\“¶\é/\Ü3\å^«ekJz¨öHõ\'>eø\å\ã\'	7õ\ä\Ô\rd¹-ûZ¿3$‰;~·1+-%(•\0\Ë2\éB“õ^ZP=W²I¥+\ÂBb\èi\Êj™)—)!)=I?xÿ\0aşq\âG\í!pˆÆœ\ê}—\ÄÕ½N(f\é”]\àR±•HS>«`©?ûu±kj‰\êƒ\éµ\ì2\0Tx‚\×\ê\äÓ³u}t¼\æœ|‚ó\İSj+\ÇL\å\Íñ’~\ÏWeù¨\Ó|zjL\íMÁF[”\ë&rnmkq÷ùJ&&9”IR“\á$‚T\çğÇœœ<h•gˆ=j´´BŞ™n^r\ë¸%)lÍ¾yPÇŒ\êP\\$öHQ>¸¼}O\é/öº]A\Ò0¢·#D·)mIHË¡8\Ê9\Õ\æµ­Gº”Leİ–°\0\é(Ó¦Ü€\â“S5\ÙÌ­!/#İ˜m=¼Ç¡\ê\"¾×Š¡›ª\Ó-\æCr\ì¹2úGu«\ÜG\à9\Ï\ÌD\İnuŠª\ç\åÊ´vXò1^jz^v\ê¨U%\ÒTÌœ¿\"–~ò’	Pùtøƒ\Z\Ğ «\àJ\Óiì¢—©Vy0&\êNuCA-–R¿\Æ7ª—!EI>•Jr•d\Ó\åAû\"\æzó¯\ßWõ(\ÃòÊƒdŒo˜yDœ­k¸—~¬€Jº\ÄCum\ÆÛ¢º\Òşú‚G¬Nfšt§;½\â!rPŸ¸®v%\İİ–Î F\Ç\Ë1\êOt\ÎŞz‘o2¤¶2h\ÜS¥Ã´õ¸RHRO\Î\ŞÌ®Q¶%\Ù÷y—€”m$™,R\Ñ©¨INô\æL9zRš	\é6•<\Ïö‹±ô%\ÇŒnNb©ÒŠz—{\Ë(#fZ\É\ÇOw\Ş-–P[®¨dl#·P9jœ”l,…§p`CŠ«O¦lò\'b\é*€¯\n?añuÀ¶¥\\v\îŸkÅT©N>–¤$dªm—ŸuG	J±$\Ñe\Ô4öÂ«Ì™ª­©&û¸ÁZ\Û9Ç–\ÆË¦u…«t‚µ\êÑ\'.óªÅ”\Îû…,öŒJiV;\î\ÊP¤\\ ‘6¥zvT\ÆDº\İcC4¢zX¥\ë=¥$ù>\ç\ãö¡µ?‡M’wÅ–³\ÂW\æ&\İÿ\0Š\"D¹\İÓ·´KLT0-\å\Òÿ\0\ÎoE´\êXŸ”úÿ\0\â”X\"¶6P9\İ\Ó%ğÙ¦O\Î9ÔªaÀ·@œ8\æ\0€G¤H%´\êÛ”–C\r¢`%°“€1$K\İı_Û§%)˜±ñGùG<q\ïôRh\ÒC·\í½`¾n\êD·>ü\ä›V\äÜ»a×œl6T\çŠ\ÊóÊBq´¬ç°4\0Akwu\Ïg\ìÁpc§\×u.ø³µÿ\0T¥jy\æ§$^’¶óKAÈ–c\Ñ\'l\É)¶ş¶a\ì‘\ï(¹ó\é¹\ÕÕ”À‘”İ9¥µ*¹f*/¤+>ñ	\Ï\éÊ§–\íJ\í-Ë¦q	y$8¡.‚NNUß¾ÿ\0ŒºZ‡1\ãª\Ú?¡t®P\Ûu÷’r\0—Nßœ$­§­\Ü\ãş\ì?\ÎRÖ¢òwH/@\ä”1ş¯²£ş(E;SÃ…\ár)*?hû \ßú @†\Ò\Ô9\î˜W8W”­>\ÜÀ¼\Ùo 2 \çú\áÒ¸kk\Üÿ\0µƒG.—_\ê!ka\':§u¶´4Z^Ò©=Q5£0§[Ù¹yFsüF$i¶e\Ûl´§Ô¬œ“\ËTZ%cû¤Ÿµ¤f\â*aÀq±:\ZŸ›Sºÿ\Ù','Derek','Limbo',19,NULL,'09463276543','Cuenca',NULL),('U0003',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0\È\0\È\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0B\0\0\0!1\"AQ	aq#2BR‘¡±$3Á\ÑCSb\n%4r‚’¢ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0.\0\0\0\0\0\0!1AQ\"aq2±#3‘Á\Ñÿ\Ú\0\0\0?\0º»\îmºvª¹<|\Úm\×\Ó\ÄW\ë\åA }úhiÁ\í\Í‰»9¼\ÜtÁ*p¥*O//÷\ÔuU‹‚\ĞÜ‰WTo\Ã\ä&jŠ¢)$ õÂ“×ºO·\×D‹3o¡?=È²a\Ù}ÿ\0ÈŒ¤)Q\'$rŸ\á\Û\ÓU\×f\å\r\äI6¢†#\æ]ú”Jlè…‰€)+#—\'›0}şºÁªTiÒš§\ÖR·›J[”“\ÑXó\ê®Œñ_Z¬^\rY·y”™Tù˜^\"f<Ğ\ØQmGújYW¾jôj ¯&òzKEuÏ”’9P;\á^ÿ\0MiR\Õ\Ô\Ïv3.„œ\Ş„<ükÉ²‚¦ü“ü½\Ğ”¯\ë\Ê±ĞŸp\ì–·\Æ]µ¹ôªrŞ£ÁŠÇ‹0c•$sduûƒ¨ŒMÜ¿÷R\ã—‡óVõ&<7”·¥5Ì©+\å8H\È\ÆIÀú\è\Ç<m\í~\Ï\Ô*6\ì[JÚ§SŞ§µA•.®äªA\Ù/5(\r7Ê–ğ§\n°²Nª\×0\'ö–hV N”Ö¯:4X\æT‰­3Ê´ò¸\áÀ\ÔKw÷rÕµ\í÷.¯\Ä¬¥„%£ªô\Z\0p\é¶‘µ«q\Ä+Wl\æ\Û\çiR\ä²\Òbt\ë\È\ÚzÜ“¡\ï\ÜCF¸\ŞS3\æÇ…I‚¢³=ù-üÄƒPfg­\ç~%Œ¾ık\æm\Ô\ëWGÛŠ›vŸ,•:\ï™\ŞX\íú“\í¨Ù»oU#Q[jªŠC\í6·\ã7\Ìì¹«Vó\ì \Õ\ÙŠ\ÇÒ¯İ¿®\î:ØªSkC‰r®Iuºƒ*a+S¨(\0,©Ë©\Ü|Y¸S‘½“8q±·–ß‘nÂµV•{É“„M«Hp§Àoœxm€r}I\Ğ:\Ø\Ş\åL9‘z\"{Ux\ÖM—½ušlÁ¿.†\íj#	D&\Ş\çR£\Ø}q©•ø´a[\Ñ_ÿ\0Ps ­a\ç\ÈZ‚‡\\«>š\Z\Ë\Şg\ëô4\Õ\ì\ËM»¶—\"Jš>/Š¤£\'“\Í\Ó]P^ >\'ükZ4\İ\ÍzÂ\ZÈbSaJ¨­~$Æ¢\Ës‘•¶\Ò9	\ï\Ó\Z4®€h˜#gZ\Ô\ì=]\Ş]Î™Q\"š.\nz\\o\ÅNr~™ôõÔª\ÖÜ»v\ãºcQ\"Ú¯2·¢‡Ã\ÆÀú\ã\\›¾¸Ü»6û‡9Qv\Ó~)e\Ù˜ŠÀa…¶‡h€ë¼‘Ğ²\n\ĞYJ9ºòu\ÔÓ‡\Ş&¸\Û\Ş#¶®¥\ï´\Ë\Â\È\Ş::\ä\Ú5©‘31´ƒ–pP¶Ê°“\Ô)j\Â]Xe6¡\É\Ü\é\äXóe\×\'ÿ\0\âŒHb?\ÎøtFS\Ü7Œóe¨\î\ê\í\å^µp0\í \Z¦´\Ñ.¡J\ÈQı\Ï]O(õ\Z=ñFÏÚC^rT2ƒ§\é®n|a~!\Ñğ\ìµŞ¯pû\Ä\î\Ó>\Ì\"µ\"Ïª6¹÷…\×0\ë\Å!\\‰J\ÈONƒNµ\Ôh˜\ÊÑ»¥¿¥®÷\Ğ\Ç\â GVyhH\É=¹@ô\Z\Ú\Û\í“n-^¢«u‡¨\ê—[y¶ü¯{ó\Ç:\äv\Æüpkô^0\êa½<_[HÛ¶i¬Ui7•/k]pTV®EºÁiK\nk\Ê\ã ë®»‡ÄgˆN*œIü5wŞ¹j,C\\ºCË‡\ã³?\å\ÎdB\å\ÈğRA	\Ï\éW.AUƒ¬°\ÌT\ê1Nzı‘p®Î¼\ã©È…Ô¼Ü¸-r©M…uIIıC\Üiú‘*±W\Â\ê”ú²\å\ÚUx\Ë€\Ø\Â\éN2¥$õ\r¸şRu‡…ú\Ü\Ş2x{µ8³÷¾Pjµ.|¼ûn)r¤G£:”\ãmÀ¤‘ŸO®¡qoY\â\Ç}7³„> ¶ú†nm¡®3\ê½*2šb¯	ÿ\04ï†¢KNL	=;k‹l:–˜-»\ÚÎ…\Z \ã\nJ\ã¤øe`\ã¦3¥n\Ğl\Û=\ß4\Ô$€	\í¡\ÍwdŸ³\êÿ\0…S®¹”š\\\ÇB)\Z_ˆ˜®ÿ\0œİ’£œ\ÛR\Û{a#üšt\Ö\æÈ”\Ú\Ç3¨’@p½GaŸ¦¸\'\çbbİˆó¯\ï¨¦¦˜§\ÄSI^	ôV¾«Û°;WÜ–&=N\é1œZ\å-\Ç\ÇÌ¶…H\Ó=şšºúU>˜\n6\ÚHşº‰\ï]*0·y´bCC•\n?Ä“\Ü7‚c\Ò\í m÷·ğ‘}¸sÓ–B \Õú_\Ø^\ÇKC\ÊÕ‹I\Ük²e=Q\æÆ›Æ¹×‘\à?°é¥¨­ş\édÁı\î\Ö\Ô\Ü}.£Kj–´£\nj>\\*9ô\ë¨&\É\îÜ¾Z\ã\ÍS’)\ï¼@`½\ÈŠ\ètQİ—ÚšU™P*£1•…*1+ -ÄŒ¤w\êI\Z\nE·S\Ü#J.x\à+\å\ÛNO7¶4*\×L°@„±+®\ÜfYe¶ş¼‹¢úªc1\×\ãPÁÅ‚\nNO~£¾±\ï\Õ\ç*Ğ±\×q\Óu\ï‡„2#§‘;\ç¾1­^\É\\]¶‡.\ÈD´J\Z5HÃ‰V:­\Ì>İ´õi]³T%S/•6ôO­ÿ\0¦\\99õ\ÇR4Q.³[0;T<JŸ¶W·<BnuB<-\Óÿ\0I@‹\rL\Â,P\Ó!\ß*Ë¯¥µ’\â”\0NA\ÂQ\Óõj¯qÃ§ÿ\03»Ñµv\Å‰+öób÷¾Z3\rzÉ¶\ÔHm;\"P1\ÚJC.$´Q\éV5\Ò\"\İ\áê³“.º\ëv\ßuHGú®„ú#É‚\ê:z\Ç yOEA\ÕU\Ş^\'x¹øŸµwl«—]~•H±*\é«U¬«^L‚ºœ\Ï	‚¤” %·</e@ôQ\Z[Õ›Dõüˆk€‘\ã_‡½Â¹¸}·\îš=ûF\"–\Õ½w\ÍK”¹­«”8\ã«t… \'£ te\áÛ…\Ë7xvb²\Û\Å›º™I§ÅQŸP}K\ny¼#\Æ\ÂH*$¤\à\ß_8Rã›ƒ\èû[um/We\Ë&ô\'–\å‘y\ÒZŠšYğ\Ò\ë½p¡@Qó\è—cµhğ´r.{®ö@£\Çes+5‰\'NJ€\Çó€”¤›v:]¦&MFC\ÑÜ«ó!<)|&ø:¤\ïö\Ò/~h2©\Ñ\ï(MXÆ¥OIR¢Šs\nuL…~¦Ë®‘‘“úˆğ¿ğ\Ã\Ú\Ê\Îû\ïV\â\îVü+rV\åŠ%µ¡GBd¥\Ç8	q\Õ+\Ì?W.Ÿh\ÜEnn\Í\í>\æüS7úˆü:\Ì\ÚTJ.\ÔmõI\Å6iÔµ\Èl0\ä†Áò¿!\Å%\Õú€”§>š²67õş)xŒ\Ã\ßÉ^¶­˜\â^\å\Ş\ëFa±)L\åºdUvuÿ\0@¸¡„£$\ë»#KlM\Í\ï /‡ş\Zn)[-O…oÈ¤QÒŠ?ƒ\r*j\"9Ğd·\ĞT¨L÷\×#¸·8Z~^ùÀ\Ş}ÿ\0¹7*ø¯[p¡Y¦4\ç%¿ø‚Š_ˆ\Äl7Ê“\È•“®\Ì\îK²f¹Q±o»XÊ„óJb{N$8Ã(`¤û‚5Ì‰†ø]|\Z:òxv¾¶{k­6\'ÄŒ\äf\Ë\×\\\Æ\ÜV|\'xa\0“‚I>ú®|\ÉB\ï˜?“f\îF\ïo&ÁRø~øx\Ôlª«Zˆºõj³GñQd\ÆCO—9\ÊV\nÕ‚<\Ä\ã\Ô\êZ\âGp¶Éª\'ê†ˆô\î÷~EN\'<\ÆD5Ve§=BPÔ…‚;a@új\ïğÆ¦\ÒÃ„İ\Ã\í«¾\É2»QaU+\æ\í…\à\Ã*\Æ9ƒ¯¡¤$ò ¦t\0£p=7ˆx\Ë\â54¯˜ªW/\ÚÊ¬2\çi4÷T_Z}\ÂÔ\\zòmG\îF\ÄB8\âu\îƒy%\ÈsiNIu\ê%v\ã¸\â…²‡š\ÆAûW}5Flšo\Ã+o>¶\ÕoıË£\îÜ†.+RT\×ibmÁPœÄ‡š yVù.\\Ã¡Î?\å‰\Ä{oºb\\UJÕŒŠ \æ\Î%2\ÚXu\'\ê\Ù\Ï\ßE\Û.\İ\Ù=´¹ªÛ´«&Ø§O….¡vK¤°§˜XA	un¬Bp;«¨tU-÷¥F@p”/‡\ËKw÷{p8g\ß\Û\'\á\ÑrUf\í\Ï;i_n^”øôZMWÅŒ–C$‰Oœ’Ps\Ì5n~\ÜñÁV\ånUi+\"‘³»‰X\Ê&\ß\Ûõ§jF‡9YC¨aü%¿€\0\Ğ¦uÍŸŠ7¶n\Ûn•¿{u\Æ5÷\Äm…y\ãv\í\é%\æh*Ô’ˆ\í|°C(\ç@O1<Ü¤ö:\í½#r¶~‹P‡°ô¶µ\çÑ£N°\í\è•\æ%H‘Mq!a\å6\È\åm>dö*9\'8:\à›i\Ñ^g5/\Î!øˆ\á’\Ã\â_c¸N¼¥³rQ7ù\ËRÕ¶¢\Ã.*R+\íüh\èOT¿¥\ÇRGLdh™ğ!¬Q©¿®&¶ú%\İ.½\"§kWj­©3\'­¶–\ÛÎ¼\æJüBy\êŠ\\lõ™qñ\Å/u3Sˆ5µk\Êu\æ:\áBDWlúgF}u¢6\×	?üLJŸ5“‰\Ä&Ğ–!»\Ë\Ê\Ú\êPù\Ë\ìV|rWõ\Òûg³g\î4ğ\'Q«4jm\ÃKv‘TŒ—£¾Œ-µ{\ß\ÛL´	µ\Ëncv\Åu·¥°|°\êhO72Gd9\ê•\Ó=4\ç\Zr\Şg\Ä\n\ÆO¦³\"@\ä\çY\í\î{\é\Åu <Ÿ\ÊNRO\×Z\Õ\Ê+†˜ª]E®vœ#)\Î:l7-\\•¶t•5¡\Ğ\r4M\í˜I\n\Üfe\ì•FnCõB\ßR\Ú\\\åHş\ÚZ’o+\ÎQ-Ê‡Ê¶_SU%5±•)\nq<À}N–™h$\ÂI ²º\ï&\ÏU\äÓ§\Ûò\ŞT¨\î$˜`#!¢\Ç>§U\Æ\Ğzm\"\êm‘U\×\ï4¥ø`§\Z¾q^¡L¯Ê´œqøq\Ğ\êÔ¾ g§ö\ÕÜŠ\"­\İÔ¬\"(Xj¤\ã)aI\È<\Ê#·øĞ¾¤¥mC/t\ÂMn!\æƒyV \Ğ\\k…ºŠÔ¢¶\æ)\Ï^ c\ÓQ\Ê\åƒ*]ì»¾Ÿ.;´Z›Š2a”*;‹l ¤Ş™\Z”\ì\Ş\ÚSjvxn9—\â-H\ÎB±¸t=ı4®z\ÍSi\ä[Ò¤\ÂuÒ‰m¶\Ï61\Ôû}õtRƒ8<A-‡±nB­®\è¢S.®¡\ÇX¢\Ía+Š§@<‹PRO)ïŒW“·¸\á¬\\•/ô\ÌM½ \Ğ`%\é&\nŸ”ó!)\É‘\0û{j\äñ.\Å\Z\ã\ØÛ†§hn<\ëPV©¨bYŒ¦C\ÌJqIOƒù€¤©g\Ê2s\ÓT\Ûjøn\îÛ‹²©¸|snrÚ¦6[“O¥\Õ\ãAk\0¤º¦\ÑÍb€GS6ö#Z“\'n¹À–\Ë\Û1noŒ0nªµ\"©P©\Øğ®1n\ÇSm(¦`R’ T®R” \Ì{j\Ô|Y8z¹\în7yo™ŒRaY\Öú†\Ú\Úp%s¤\Í*Ci©KP\è·G7\å4:7úOhÂ£h6_mø•º­«Ì¢Æ©[\í©Š½dTœ™2Gˆ‚¦–ò\ÜJ¹s\Ì2z\ê\ßñ·öúleÇ²\ÕÚ”‰U–\Ãò_b8J¼6d6ê’œœ„MGa`c\ï@¯©F¾/\\>ñypUTu\Ú[ƒoZ”š…U\Ô,¿6¼¶\Ò\İ	\0~ChÂ”OU« \Z±¼\î6\Òn\n¶F\áp \íÔµ\â\Óc¹VNq-x/!¿÷)|g!|Àów\îO]X–8”\Û\r\á\Ù)U˜ôhb$\Êc…\êN¤4˜Á*nD	\0÷I\Z\ä†\åp…Ã½•½k‘µ›¸[·d•¿>Ï´.fØ¦NZU—˜S‰_\'©Bz>šœ¸E\î•\Õ´¿”\Ş4!qD¬\Ôl\êa“J)\Úuqj)n¡ ©-ãª’¥ø‰J‡p€G}Q#¸;\á\Ê\Ü\á\Ïv·b¿²”\êbİ ?øEfª—Tu\á’*YQh-|¡)q\ßµplúM\"‹BƒH¢QZ¦Ã‹\rÆ‚\ÛA\":\0\06\0\è0:tÓ´\ÅS„ñ«\æ\"[?0%„ø\\¾¼\Ü\İ1÷\Õ\ä/-JVT^·ˆÍ¹\ácmø§Ü§ı)K\Û4µ^µj(,:\Ã\ì_dù”²‚…w\æ\Õ\ã\àŠ\r¡Â½½²\Ó\á!ª\Êh\î.¯\ĞeË’Tôƒõ\Ê\İP÷Ğƒx\í\æ·*‰@¶-Ö£M =Tn}]ø. 0¸\Ñ0ò\ç—u-§\ÛZ\Ğ\İ]û¹v\Ö\è£\Ğ\íı¦©\\3§\Ä~^WŠ‡˜\Ç~V\Üq*p2F:j=\ì#Ò•Yó…{%Ï‡>û\×8\\¸§I·¥}ú\ÙW&/ò`Kt?KZD’¥s#=\ÔwÕ¯\Úù6›{lU\ÍnD©\Ğ-¨›¹9 \ÆrL·Sƒ\ÑE-¥Pô\çO¾‡\Ö=_a¸\ê \ÖxR\ŞIôš•ašcOÕ­\éR\'GB’‡BŠš}²F“zN6Sƒû\'†\Êz­İ¼§\\r\í\æ\ê†L¶fMzdš³\å!+~C«%K>T“\Ğ \r\\\Çf&Vµ5\âxÀ°¡\î\ï\0¼KmœjÊ³ö†tûØ‘ZŠ\'Ô¡ :ì€¡„œ¾Ÿ¤¡^§UW\áÓ´\ÜAq\'ğòÛŸˆ§\nL¿m\îVÀÂm×¨—·I©\Ó ó<””Œød\Çq	=9U\È;º\é\îığ\×\Ã\æı\ìôı‰\Üzz©6-b\n\Ñ2•à­”uW1	\Â\\ó¹\ë¡6\Çp›Ã†\É|>¯N¸+¨%úT»‰-]ÆVL\É\ëa\×ó•Ì¸\è\ä	$\0O¦ˆ%]}ÃÃ“o\îk€«&]\É\r–\î±¥\İ7 H<¦mI\åLs\ë\â$¢FƒŸ^7R\ì\Ø+OŒ\ã:½\ÄØ‹‰»Ššˆ­•;&!RZ\êp\0Q +V·\ä\Ø\í´‹Z²,\Ú,ˆ\æ’Ó¯\×+\è¦À§0”„ ¸\áJ;$\0†ô%÷öc“¡o…»b\Ğ(l\Ñª?_¤\Ö•	0V\\[Í¥$r2ô\Ô\İ\ã¶A\ØÁ·1\ì_\Åg‡\í\ì\á§n7®Å¨¢¥Y\ÜJ´:<>\ÉT\Æ*K Ii\Ä\ç(K	8¥œˆ\×Vr«Ri¸*yTúƒ\ßT«‚>~\Í.gü\ÛTC&·&Aj©Å©´<¥\áô!§ûc‘‚€pG¦¬«|W\è¿\0Ü˜\íÿ\0¼|ª¦:¶¤QôW¦£\ï\Ø\æ?\ÚÜ›3{4\Ê\ÉJ\É\È\è	\Ô?r8ƒk@r¡\ã–\Óùó\Û_k´\É*—\á\ÆIl+²lé²«¶;m¸Œ»·û’q\ÉM!\èª(\åSûiAØ$‰´\Í\ÄEª¹|­LNm$~hè´Ø-j\Ó6‚u­Yƒ\"5YÇ C\å\ä\Æ\è’\0	\Êı\Î=´´\Ö#q{[\âG\é—¥sÈ¯-–/­(ñ›?ó ‡T\ëˆ+Š7|\îöqªŸ3Œ‘’A\0\à@FW-\Ùr\Ûõ‚\ÅjdS\Ù\ÊGó«=F€\\I\Òh4\í\Õf\áŠ\Ëï¦½:¹\no³\Èò()C \ÈÁÆ¨u\n\É@\ßR\ÏNb–\'\Ì2\ì\Æü\ÙW}=\ËrÜŠcÉµ¼\Ëm!ö?}\×:Urš\í*µ\0øO¶PTHW2\ïª\×Â•fÓ \İ\àU]Cr%¶–˜.+\Ê\âsú@÷Î­;r©L§®­n\Ï-Ñ’<D!G·O]Y\Æt¶ D‡\"£]İ¦V9xo¯V¶>~\ÚQ*r\çS«L¶c\Ó\Ú%.¦_ˆŸÔ¨uAB\ÊW\Í\èNª½©\Â÷NXP\íJ}b”*Vû²\íıÅ¬.Z”\Å\ÅOr[\êLr\ç/ó¶\â\Ù\Ç)Yµxw¢î—¸R­\Ê$ª\è\'\æZb*~\"BI)O¶N§\Û²\Ö­ÃN–ı-+’\Ûs¤%ò¢T®b¥$Ÿs¥º°TÅ­‚‘¹M>{[3e÷\âûª\İ\ìC“A¸%Ë¬7Zÿ\0¸Jœ ˜®·¡«•@\ã•]ugw2±eW!Ê·¬\Z\Øbu^ Gš\ÓYĞ¦\Âù}pUœz\ãC\î[¤T·iºEv#OF˜•¶\ë*ô:+Ş–Íµ´\ÌUnj½\Z7™\";H@Âœp¿–@?b?aª¸Z4’e¬\ä\í\È\íBR\r\Ç\àö×µn\ív\Ön¥f%¥P²\é\Ğ/Z[]]©Uc0\ãBY|’ T……-¡Sh\ÏAG˜\à>Á~]‹_7}\Ä.	ÿ\0•_ù\Ò]}Kw\Ä|¼Ò¿Ì•tè“\ØhùjPÜ¨©\Éòz¸û¥Å•’NI\É\ÔÖ‘m\Âı^\ny\îF¨_œ½üG¦’›2(\Ä9­!˜\ÊW1Ç•=´9\ã¶Şš\×û”\ÛQ”]jÎ™%¡\ÔeM6]§¦S\Ü\ê\ÅÁ¦Æƒ\á7“ŒvÖ†\ìm­/uö¶\á±%·\Éø\Í\n\\I\éù¬©¼ÿ\0Sªÿ\0­$ò%Á\Òö§™Xø\Z\á*\æOòlKš\æC/\î$Iv\Í/˜Ç¤³PJ\\LvÁ\åB \É8\Ô\Æıø\í¥Õ¾ôN\"U:¯\n\ì·\Ì4A™b‹Ia€¤©Ÿùy\\BÔ•zö=Æ4Û•Í¾\á\æÈ±®¸!ª•Öƒk#%\ÆYKj\ë\ëúu6ğš’\è+F9¿Q\ÓU¬\Ë~ó©5}5\0>x•cbxµxy\âb\í\âºÓº\ê²n;šC¶dò„\ÓÒ·\ëˆA*HO\ê\ì­\Ö\İñ\Ä=\Õ\âE¤Z)|BË’ZHJ±×®O¨\ë¦yô\è€a\r÷\ì5òÄ¼N\Ø^‚k­ÿ\0±ª¤1,ÿ\0\é+>W×¸ıõ.&Yw\í\'R¾f¦®õcp\\»\çs\Ñ\ä\Û\×=˜Ì–\Ôò8\êA\0¤¤‘\×\ëªUÁ\Öo\Ù\Âÿ\0Ve–\é\Ó7Œ\í¨%Q£r\nr)…\èIye8*VZ\Özœ¤\Ú\èm³_7”°ºI\nPfbG—Ó¡\ï¡&\ÈğùV\Ø;ñ·\ëU5\İÍ«×¨B“’˜¤?\á©#ô\ê\éôÑ¡]€y™\ÓbıH\×¶}Gi\Ü8\İ\í\ÜtJtJµ>eM\ê2\0vsqºV\å_©\êAJH\í¡¥½·5;k€{·\áÍ¼[³SbüµC°ngaxõ*m¼Û±b\ÉJğd%µ%M¾fÀÕœ²w¿oü•“•:PZ	JO·A\ßZÛ½R´.8”Û‘Šb\ê\rEyj W7—+\æÿ\0 \×u~dªjaÈ›<ğï±›/·5ŠL\Ôj¯r\Ş7›‚\å©\"*`\Çz|„¡*,EI\åa°–\ÒA\'¹$“©\êør»>hM{3=„:\Äb¼t\n\Æm+*\Ækq\à\Ó\'\Âu¶\ÂW–2JcƒÛ¾£\ìn\Åñe:õ*Î¼eÍ\ÄO™Jy‚òt¡¥D{i\â\ë~BsWQ<f?\Óõ€¤3^¶R\È?©\ß?MD·>Ç®®œ\ë0*\é/\Èg9r8”“\Ù$öö\ÔKdø‚\İı\â²\ä\ÉTHp\äF{”±8ñÔ\Û¦›®\é\ÙwU$\ŞtX­\ÄmA\Õ6…)Ã“Œú.WŒz\ÊI^\Ù\î…\İn_qvºeT˜Œ°Ÿj\ÆRÏ ÿ\0\×KQ-¦ÛÄ¶·97MÁx\n•9(ğ\Ò\ĞR®b¡\æ\ï\×KH\ÌI\âG!w¸Ö®ùLTZ”Q+OC\n~—y\ã\ÈJOB‘\èG·®§™°4{\×j%\Û1K\rODˆh%>2F@ÀöÓÏ´;Oe¾Ù¶h©Õ™\è[_k©A\Æyºÿ\08Ôš\Óq©\Ñ\ZMF¢]©¡L”¯¶¬vòôû\rY²‘boŠdö°eò%	·%±`\ßqj\ÊHqpeaô/ ´¯Sûj\çmV\áÇ¨\ÓYy|\â+\é\Ëiy û> »2\ÚS[•h@[Ÿ<š” ò‡‡©# \ÈşúÚœ]^›n¸Rn\Ö?¦1%¨Ï–|Š†\Ö9y\Èş,g¯\ÛA±]±-5?ˆvõ”-\ê9–£xlxGshWX![r¥2€\0<©Ç·¾œ.J\ÕJ\Æ\Ø\ê\í\Ó6”¥¶\Ü7ƒidR1\×}3¦÷…¹©U»R¯¢!ó6¶\Ù|„/_ö\Ñ:„›³9\á\Ğ@’” \áMœÿ\0?’–\íqÄ¤;.\áN\è\Ğ\ÕCm!÷\êq\ÈÌ’¡Ì‘¦tn\ãÊ§8\Ü+¸\î0‰,‰“\ZQı|ª)Nq\é\Ğ\êÁƒ*nùE«Va©%\å03È°:=Æ8†¹\Ü\íıªÖŒ…˜<8±\ĞG\éJ\Ôÿ\0b®ƒV\Ş\Ş+‘÷º³\Z¢\Äa†’\Ói\0H©q^R\ÂP:w:€nnôm\æ\ÆQ¿¼«°?`©G\í\ßB\ÔüS6-\ç\Ó”‰R\Ş+\åğ˜o¯\Üı4 c[i\îš?\ÔWQ\neª\Ä\ÂR:“\ÛNMDi£\á)#˜^º\í&ü\Ú[JV¦¸¶›y €\à\ê>‡EFŞ§\Éa.´HO}BU—`\Ë\n\å¹X\Ôin¡X<\Ä\ÚÌ¨!<¡\è1­™U(òü—¤\Úf¯nİƒA€¹õ;3IBNyõ\Ùñ$;ù›jmda~\ãLW]=5\æ:\Ö@ş\é#\×P˜¼lğ\á2¤¸÷&\Ü\'x) û¸ú\ê­F»iŒ\Ö-ù\íÉ!¾fm@ƒ¦Š¬­\ÃHû’\àP\ÉU\n³¾›.\ËD-¶\Ãr>X<ò€K\ÉOE+éƒŒ\ë\ÚgŞ·šÛ\ÍZR\åS\Şq_†%£‰n€®b0[\êzi\ë`˜“Z¤ª\Î2\\uhª,³	h>\Z’RA>ƒ¡\ÔÎ©F¿v\æİŸQ¬W ?\â\Èqpœi\r[ş‰úvÎ¶4X^f\"£UÌ¿¼\Å`Q,«6+”ùH\ÑD$-2šW}pl5\İ÷¹iTª|\Ö(•¦œ\Ê>:r)C§o\ß[+E\'p©lF®¼\ì”%¥>—‚›I#°#\Ü\é¾\rµ;Z@j›t4I“\Î\ÔW]<‰ë“„ûK³xŒ–¥\ŞÓ³\×H—1ø\Ï<•\è”BšÇ©#¯ï¯›‹En¤û-Š£<Œ\Çğ\ã¸\Û )\n\ïÌŸnÚ˜q\rh\Õ\ì+&\ã\Ó\èô¹(ˆø›Î§•L£”\áC\ß\Ì\0ıõ\ÙZUÙ¾¶rwjU24\n%,¬2\çŠ\íM\Ä\È\0\ì„wÇ®š[^g|Á\İFõ»övÿ\0j¯’\ì9\êi™P\ÙKr9†}•_q¢\Õ\"nÀ¦\Çn™n«\'Å–O3„’NIõï©¦\îpûn\ß\Û12}¬T·—N2a%Óœ(`±ÀÆ¢55ÁaÂ¼\ÅRZ‚mM°J”…\İq¨«]$¯oz‰špJM\Î\Í§[_*´µ\ã~aO0\åöÎ–¨¶ı¼\Í\Ö\ÍÀ‹i0\ß.a—\İxR¥€~şšZšC±#÷\nıfÓ¬\î5-huRˆ´x\ÓRˆş \ns#®U\Ôı€\Ñ&Á¶(–\Õ=.•IDt†R¥‚TUª\'Ô“\ë¦k\â«\n…c>\Ã4¹\r¤¡\nKŠğ\Û\Ç0®¤”&¤\Åi!\à•\'\ÃIoc¾º-\Û\Ì\nÚº-\Z\ímL´\îIz$\ÖT\Û\ÉW #¡PuÌ¾$v\Z~\Ï^[®\ÒÜŠø*‹\'—£\Í/±^½~\Ú\êk\ç[yúc@ˆ¿gNØ§®Š\äe\"|Pšt†˜*PQ=R¢;\'IĞ­ˆ\×\ÕŞD3\Òó=—·ƒ*\'û»hlÑ‡l*ˆ±ó‹KNNrA8# \ï\Ğ\r[Ëªü†\Ú\Ö*P=MuJPWº0şº\çõ©ş‘~òF¾¤.5=J.¸úÑ€µ¨@>™>º,\î”*õ\Zh[øi™“‡Õb\Ø§\Ç\Ğú\è~]ƒ…¾D#§-¿om-\Æl\Ê-\Ë2\ZœmÖ—”ƒ\×NF}´ú“\äL®†ù_œ\â\ßRt©]@?\ØkUúP­S U\Ğ\Ê\éJ|Vˆ\è }ôõLm¸ÁN:0„#¯Ml\ÈTx\Ü\ĞŸ\ì\\‘+5\ÕÀ\ã›\å}9t\î\í\Ë&jt”\ÄJ\ÊZm98JG\ÛDK+€\r„²#ò\Ğ-ˆ\ép\'şG“ŸN§[{\ÅÅ¾\ÛmôRe;&TÇ•\È\Ã!TUõV9>ª:­‹ø±n%\Ë}Å³¬‘~jjYÊ¬¬~`A\æCm\á$~¯l\rDm°®”\ËI[\â%µƒµt«*?…M€–A\Û\í¢5½W[4¶£……\Ø\n\'\í ¶\ÖoV\à^“İ¢\İûq:iJ’Š HTgT=\î:z\ã\Z,\ÙhC\Ïs^¸\ëRwby—‘_a½f9-”\Â2ù”9\ÂO§¶¢’ö’ÓºŸ\rŠQÔºö¡„¾V\ÆA\î\çUótø¼ª\í4šœx}RŸø4g°\Éi¥\0©Aµ+¢\Î¦š­¢˜Tf\æ\âü-6Šõºå¸·©µ2~e—;}1§\Î\Z¶Ov¸h¨®Ò¯Ü¯V(o)!d°s\Üzô\Ğûc~2_¸U\ÔZ\Õ-§¸b¹\áóø/ NrO*óúzö\ï«Aµ\Û\ï³\Û\ïGMvÂ»!TY\å(\åuµ\éR\nN§g°/kW\Ø»À…“½h{usËªVc-MÊ‡\á¥m¤«•}\08ût\Ô\ÂõM®\íı=Y¹\ÍNŸUYRYX\åSe]‘ï¾º­R)¦l$¥N´š\n\n#¶|k\í•_“I.\â¹\ë-*Qk\ÇXu ´¡Dœ\0	ò¶tÌ¥\n*>L\Îu<&%®§ª²k–ú•83–\é\ÑúTSúT¬u?\×R¿\ÜıË‹%‡¯˜lÌ™ˆìœ´ñö\Ó]&³l§]¯U#üÄ¬*2T²¤·\ê{u\ë\ßRz]Uå¶“pS‡d´\Ç\ë\Çq’{h\é\nÀ\0a)\éĞ¯‹>K%5¥\ÓO)fJ×ªu—n*{OdZmZ\ÔWkuaA\ró,’®¸Ç®™-\Ë\"ı¯\Òd§¸óe¬¤(“½úi\Ón6ª=6K\î_µ\'j¥D\"\Ê8Kd„i½‹8˜Ñ¶üBĞ˜Šõ¥!h\\juIØ¯¸Cm\ç)\æÇ¸:\ìıš^ı\\\ÛOO¨†iNJn¯M_GYp Ÿ\Ü\é\Ã{­\Ú;R\ã\Øöšc¼¨eª\ÜvpĞ—ô\æIşD\ç ÷##BI·¶\ßKrd\ZªXmwZ“)\çJ\Ë\r€¹õ\ÓlüŠ¿‘Ñ–\Êó´ì¶’\Ü\Ù˜\êJÒ–\Ñ\ÍÊ•u\è1¥¡ÍY\Û=ÁZ*‘\éµ{ºDw’W)aE–Õœ‚”\ä\0=tµ\Î5¨À2Ss\ÚTk²ª%f1z2Ö•­®l¡œzd\ro±	H@\È\Zô—‚Mz’3¢\Úo¨@S2ZAµ†±B¤\\4—¨Õªk2\â\Èl¡øÏ )$÷eK\ã`tƒ¥(\É\Çm5”•Ô•/ƒ9ŸÆ–\Æ\Ò-}Ø«\Ú\ìEğ\á4\ê†\Ø8	i\Ä\äö\í¡Å‘nË§Ü´\è\"²\äoœÌ²9Fs“\Øô\Zµ\Ëu¦/º=Á²¨QÖ—?ˆ²¾ÿ\0\Ñ\ÛU\Ûmšùk˜X!O/=˜k5P©ˆQ4\Ø9Â¬\ÇÆ¡\"¸P\ä\\‘¬ø\Ì½!Zˆ\ì\ÚP3“÷\í©¥>3/2–\0…§\Î¨\Ğ\Ú\Ï\Û\é6\Æñ»:¡QKŸ5jŠ0 3\Ôg\é[d49‡P¦³À7\Ì\ÛeŠ\Ú\ï\Ã\ä	«?mh2d\"	Âµu\ÆJ¿\È\ÓmC-NÂ¶)ñ\\Z‰.G€„(ıru?§¿\ãFKjÀ\å>ºôóc#MrÀpg\"ö‰‘Fù\nq	e ”yR9Y\Ñ[Œ\0HÀ\ÉÖ­ÁP†Û¾\Z\Ö3\×	\'¾¶\í¢[o+\Âyˆ#Q?qÎ¿4´i\08ƒ‘C/M­n¹K1\Z’E´\ã<Àƒß¦¦õh‰n!G“›¯¾±Qªñq1\ß)\Ó6Ü‘[ˆµ¸kÙª4õT¢\ì­<²|WXŠ*\Ï|\ã¿\ÛE+Ci6\îDºm‰\n˜\ãC(Lfƒ÷\ÊzŸ\ßRwXe]Gp:\ë4%)-\åMa]¹¸’\Çfq$.„\ÎôT­)\É)N™­ˆ4Û—\Çñ\à¹)\Ò\âX\åixN9\ÈÊ¾\ÚynJT°µ’“\Ô\é‹f(7l11tĞ¶¼z¢²ò†|4Oaõ\0\ê\ïN\Ù\ÌQüÿ\0ˆ7©:\Îy\âN.*h\ÓS>·J‰!a¸M4’o¹=úkÅ¹]z\ÏH Q­€ú%(ğ\æğ\ãs\æWo\ÛF\ê\ËôûÖ…ø5%”!&7**²\ã\å(V1\Ó=Î½\í\í*\Ü\Û\ÛP1sÉ„©¹\â:\âH!Dv\Ç\ßşº\×\í\Z˜-\î9Ã¡Å‡HüBáºK·—Â¼&Ó\îN™\ã\íü›\ætjõ2«S¢Be\Îh\ëKÄ½${¬„§\×\ßOP©&ø}-~:™§4y¡S\ÏOüÅı“¦kWt®‰Û>‰W£.5-—R\ÌyHñ©:\îı˜\Òc~\ám0¦\ç\ËÜš²”³„²¢‚§U\ìUËŸ¦«U±´•hû\Ï]“.¾\ÓÑ§FuÔµS$£›œ%²¯\á\Èzj\Ìn\Í\Æı\Û%Ø”GCtª[¡5	`\â»ÿ\0¦ò_é µz†j÷ôLšµ¼\Ôşœ\é_/ÿ\0“i½•Áö\ä\Êß–\äß…°»¶şø©\\ŒW\ZzUH„\Ó\ŞF”;-n\ì\Í\Ãø±Mº\"¼\ÛD!–\ÛP\nH*ò}-#m´u\"\rÉ“¤¸\è9×¤º\áNAÖ£aa`@\Ö\Ğ8\é£\\Àó`(¹×¼…6¯\ÛZ\á\åŒ\rzòg\ë¤1<@\'\Ä6‘Isji•‰M·ólTü&\åór-™?\Ô\rR«~c‰}©\ÌD<\ÌIJ³ËŒ\'\'\ì5y¸õıŒJJ\ãUY-…w\É\È\Õ,µ\â7TS®;$¶¤¥X\é\ëş4¨õ˜o\0“V\Ä2DšŠux\ÇÃœ¥)s—¡`\àûi\ÂJÔ”§MLP`]¼/\Ó\îôdÄ‘G©&7&RT”õ8÷=uxødô\è:\rÍ§\Ûa¯™®\é\ÙMy\ÓyzœùJ:\ç¸×š\Í`0\Øe=T3\×\ÓZŒI(G(\èF´*2¼E®ú\ã˜x\Ôi‡*Œ\rBğº*¬D…	Jñ_’\èKm¥#*R”z§;Krl+Ú\Õ\Åbİ´ú­9\Õa©”\ÙHy¥`õI$g\é¡\Æ\à\Ò*\ïGŸo=5JUd‰tù\nÁ\ÉW\Ü\é¨\Ñlı?cü]·µbP©/¬©\Út<†Ô²rU\Ùúı4€q€yZ9wÅ¹K¥¹\"\ä«F‰¿ù$Iy-¡\ê¥£õt1I­B­\Ğ*¨—kygÀXPíœ‚;ƒ\ï V\êmuSx©mA¼ ±T¥%ô»®©-ó\Å@~¯\ßEM§·+0(\ìA­©†‘°\Ôq‘„ÿ\0`5YöO‰`-kX ó	ÔŠø–”¶•`òšrmâ¼~\Ù\ÔN4	_ ù@\ÆF\"HB¼®/\Í\ë¥£!<ˆ\ä©<Í¨¥]2tv\á\Ê-£L±¿¯9/H}KHt‚J{Ÿ\×UöC\èaJChGEg¾¬\ÎÁÃ¢»³TŠÄ¶#ò\ë\çu\Æ\Æp®¤\é\n\ZııL\Ï_°®8_ƒ«—DùT·‘i\Ûùi¦‰$6€‘ü©\ît¦\Õ|]™\ÙQÚ”\ä6Px\Óº&Ş—lıÄŠ\ã\Û5\äB§\Ê\ê‡ÀRz£zcB\ZMt\í¥\Í6¸\Ë\r6\ÜĞ§£S\ß\è\âœBºúiW·\äLšh	a¬‰“m\Ëy\åT\êe	S…Ô·=Ì­´ûtô\Óf\ìR¯›’•VzoKB‹(8 \0J³öşú†\Ù\Ñ÷*ñ¦7_«Áqš„\æ‚\\KŠ\0g õô\Ô\ÎÒ©¦Õ«N‹Y˜§\äD§#ÁiC®bJ’\Ü\rH\\\Å:û‘\ÚÅ¿MÛ‹l.§p2¸“¡…>\Û\ë\ê¥$dŸ|ú\èuSM™Yù6\íjsŸ‡©m\nˆ\ÂG7a\Ğj}q\Ğmû\æY­\ŞĞ–\Âb0\â©\î,•\ĞFˆ\î\í]ŸQ´\éôYpX†„©ƒŸÒ¬wÎ¹¶#™µ\â\06wg\è\Ğ\ï†*ñ£±\Z©!N¸üw2\n””’;g=½tµ#¾«®\Ùû‘O©S­w\äˆ5\Ú\äG^|$/	9\Çptµ\ÅÁóBRNN½ƒ¬(õ\ëûk\Ğ £›úh!`©›)\'”«\Ò\È÷\Z\ÕYW>s¯©ZÒ¡Ï’>úx3¼Á—\Z´\æ\çpÿ\0Q“c[\'§¯6?\ëª=@˜Ì‡\ÓMÔ¹§uíœ^~/¦0\ßµ–A%õ2\Ú®|Aª=G·\ênJz³H¡¬\Ò\å4\ä®N¸H\'¡\í KıÁô\å\İ&Y\á±zğ÷v\Û!O;SL§JË™!e\0)²“\Øô\Zˆ•e² ƒ8<¾l½Á U&Yô†£CfCm¸€‚µ”~ƒ¶M\nwß‘g\ß[y\æ”ÌµI\ÛQ\æIş‡ûhoR¬šÁt»\ÈÈ±#¯%\0\äv\îu®WÙŒµ”¼™\Öõrª\"0¼¼½u\0“*,Ùª\\©AQ\î¼g@-4‰a\'Boš£\Õy©RRS„õ\0g[³i•”q€\ØW2@C¿\ÛC\Í\Û\ß}¸\Øú\n\êwU\Ù\n–\×.‰ry\Ïò§ÔŸ \ÕCºş6{eo\Ü\îÓ¢\Û7øm‘ŠŒu q\Ñ* \ã¾ºC\çˆbœ\"\É\Ş\çS¡H±Ia¹¥·	\Ç*°0=;\ëj:\ç\Ñ\æ¥\ÂR y‰=?msv\ïø\Ømy“I—oZõÚƒR]P«¦cA•CF*!Ãœ\ç·mZn8\Ñ\Ú\íëµ™¯Û·`~¼\"JJÒ½º÷\ÔÌ¼°“.v¡56õ\æYH·s‹)iõw\Ó\å.Z<CŸ0\é ı¿u@¬\Îú–À–Hú\è‘ª\Ë-6œƒ„\ãUl°*GE5ô&\"\ÔHÁOPuköb\×bF\ÆQ¨u%+Ã“N\çP’­R\Ê\ÅÂYŒÚ™c\×F½\â~ö³[E½:+S B„\ß\Ê!HÃ‹N0R\îA\Ôc\Ôı/\Ó÷(\Ìb;øo_\Ï\íu^‘™\Ôk½Cå…µ4{”út·i\É\nyIq#ª¿¾5q6¢…{„ÔH~I\Å…`€HõÆ³m\Î\è\Òo\Úsr\\lB– hn8q‡øµ&\nG2}q­şv\'P ]Á”ü‰Èªük;,\Z2h\ì¼\ÚL\ÆjÛ¥ùKc-6yR‡?™>\Ú}®\ÙH•5\"\ãŠü\éŸ7n\äúıµ\"\n@\í¥Î“\ÛüjöÌ®n0¸V­ipŞ±?7Áo”³)¼•(÷\'é¿\ÓE\ë›!­¼§\ÒkóÌ•¢C¯aJúŸ¯m<ü”OO.*\n”FO(\É\ÔNü¬O¶©oÃŒ•r¼a¨Ò¬uA?\ãHÄ•wq \Ûy¼¯³qZ\Õ)Uj|¹\ãñ4)À¿\'\0~\Ù\Ò\Ó.\Û\î\Ìj|†6\âm¬8fQ/b€£N}ôµ_{–«@õô(\Ú\ÖL—05\í_Btb™\\Q\Æ}uğ/I\Ï]y\æQõ\ÒIN^”¶„U0qÅ³ù\ØÚ‹d\Í28$÷ı~Ÿ\ÓTº+•8LÌ¥Á\äv]!˜\ê?˜õ\Ç~„ô\ÕÀ\â\í\ê…GoÙ·(Q\\û\Õ&Ë6?€g©ıñ¡\r652\rV¦\Í\ÙDùzœw¹\Ï\Í… úŒôĞŒ\åÀ“¡\á7mz“\î$Ê–š¢i–š\èThò¿\Ø0òH\\ óT}s:q_\n‚\í~\rZU‡&-\nlt/+O/\éQş¤kRó\İ©ğ‹9\Ô0\0)rS@g\ìŸmV(8ˆ¥\ìM=nRLÚ„\ÙIKl-Î«dúôNOô\Ö«z\×‹GO¤w\éÀš“Ğ²\î\Ôø\ã÷$·2|VV”ûcCúÕ¯\n§Co‚¢´\î>ÚœÅ®\Ò/;r%\ËA“\ãÃ©ECñ\ÈP\È\ÓC\Ôô¶…¤‚z\ê÷wM³f\ÏÄ­­\Ãu·{M¥Ô«”fªf‡-OÇ‰<x‰p” A\È=š`\Ø[{¯‡ª\"š§­\å%—(\èR\\BÑ„…u õÕ†¸iN±%\ã¤Ÿ2q\ßMUq@ŸM0fAa<\î…)@\0O^\Ùúê­\Êv\Ú\ãY…™P	U®®\r¶\Ëvwjİ­m\Ö\ÍQ©”\Ê<SPŠˆ!¶¦<±„­`t!=Hº;m\r›o´¢P­ú#<±T \ï|öşÚ›\"½¨Ê‰J€\Ó*#”x#?m;[lr\Äl¸\ßQ•s¨u\'Uî¸•\äÇ–\Æ\ÆB´nl\Å:vQ„©c% ©.©\á$º¥¨ò§¦N¢\ÎFqùª™!\'$`{­‡\êmÂ§­j$`tÆ†ddX8T,h\ç\æ[—;IRRğ s~£ƒú\èµ@¸!\Ñ\ã?Z®\Ô[ù¢T´\Û`ò${~ºlŒø÷\ÍFmFm)B$i.·R\Ï ZP0·P\n\ÊF=´C•B™Y«En4\çk™)u®O(\ï¯õ?Q|ş \0<,/^:\×_i„[Jôk\æ\Ó&¹lpa¯\Å\ê	ş 4m\ÛN$\Ş.¦‹}(83ÊŠƒcúsştjÑ‹x¯\ÈJAm^\ÚÎ•Â§¸§‘R\äK9\0\êo]7 z£ªz~\à\Ø\ïøü¯Á\Ä\rÔºF7QB®¼üsbÔ£Î‰p\å¶ón¡\Æ\ÎBµ°’q’­T\Ëxo-¾’ˆ°_D¨\åy-:|¤_¦Ö–şZ\ä·¬¤\ÓdºJ^[Qú+_Bzwú‹\Ğú\Ú\n\ìnß|Ág\Õ=3„Äª÷/\í\ã\Ü\ë¸qjQ•|tºÚ‡™*õ<„>Ÿ‡R´\n…dô\Ö\ËO §[\àU\×`\ìL\×+ñ“øn‰sQ¸\Ö\İY\Ö\n\Úğ\ä\ÂX\Ê?Lih°œ+KQ2x–\Ò\â\0\'¶\nI\ÏmbI#¢N½¤“œ\è´2—F1Œşúô\nBsa\nH8#®¾•«$qÖ¹Š<Ê£¾;\ïp\í¿E«²$À¹\Ö\Óa(<¼œ ó\ç×¯ù\×\Ëp®Îœ«ø4õ6”¤©ˆ4\×\ä\0z<²? \Z\'ñw`Û»‰iR\è•všª\\\çBG‰\á$ ±éŸ¾‡\Òf#H‡„¡¦\Ò„ tHšò\ê¨\ÎG“ù·Ÿ\âm};€™\'\Ş\í#u\ËZ‹A¥I­\ÔKl\ÆmN:¢@À:\çg›\Ã3p\ï\'o)ª	¥\Ç\nj\Ñ=›óŸ©?\Øj\ÔqÍ¸I£X­\Ù0e-¹5%”¼¤\Ğ\ê£ş\ï®xq}wS\í\rª’òª\ï:H\ÍgG×•tŠ\rù+ö\ÓÓ±•i\Æk[K\Éğ\ì\İ»§Â…»RŒğ*§9&ø\ÎH-< >\İÑ’ry³\×T\à;¹®N\Ú[\Ïm\æIR¦WZŸ?ùo·Ê¯ÿ\0\Û\ß\ë«\ä\ÍQ2yŠQË…\×\×^\Ò@¬ú˜a´÷}Æ‹’c\ã\ß\Ø\êZ³œ¨J\nTr9tB®>h`pOm4¥L‚T±\Ôz\ê9XG\æ_’İµbB#•JZ¹sï©„h”–’\Ù\0u\ÓC2ZB‚\ÚÀ<\İu¾õÀ\Üh©.+\ÌGa ¹.\É0½NÌºf:Ô‘¥”˜\ê@\Ğöì¸§İ·„\r©´Ÿ95EÉ¯%_ı¬Tõ[„úAõÖ–ğ\ï4R?…	J¨>y\"\Åds-J\' ú\è‘\Ã\'•kn\n¯[\İôş5Zk¤Ò‡1eªZ\Øg¯\×X?Pu´Å¨¢“\Ä7…w<’Ù´ys)\ÍĞ­š[4\è\íşR\ä29‰JF2	\è	úz\è©fDM#ThdşXQZ–:«\î}õ’‘@¢\Ñi\á¸QÒ„6’N=u\ê]\É!–!\çO)\Êzúò‹,±Ü“ó%²\Şã¨¤D~£1OV”a°\0\Âñ\×ö\×\Ã:•Oó\Æg\æè©öÖœšµè¥5\çó$¨\ç\ZŞ§\Ğ7•\Zd’ƒ\ç\0y‡\ßL]ƒ©8<\Z”€ô¤=¶\Õ#\Â8Tœ«¨\Ï\Ø\ë*)I3|¤s§Q#\ÓY£@JIh0H9\åPõÒ\Ë\à\èÊ¬U\Ï>$¿nw¦ã³œšIv9\ï\Åe?¶{,Ì·\ïx\á1ùiA>h®Ÿ1?ûO®«!l$òŸCœkj“Q\äª¥…¥YJ\Â\ÎG\ï¯Dô§¯ú¿D°Ws{•ƒÿ\0“1Õ½=…œ…«­-¼iˆ\0“öÎ–„vøKgÀ§]Jñ[YJ!=U’q\Ôzıôµ\ï½?\Ö©\â­\éonüƒ\ä\ç÷ô¼\ìk\n:ÿ\0\Ô\ØjbyñÏ¬\ê|~ ­4´\á\èN5“\Ç*=¶ó?RşO}eBÖ¾\ÃMHu\Î|ƒıõ\êD\ã…¾µa(AR}†u\í©o¨\åRÍ¨(\Üûú\å\Û/D³^q\è\0ıG÷?\ãQ:‚\Ú<|u\Î\0§[o¨\Èq\É.+\Ì\âÔ£\×\Ü\çQšø£\Òe¦,Ç‰JrR`v:ù7\Ô9¯›\Ôî¸÷şg´ôœELT©G\0	U8\é¹\Ñşi™j\n(§s!‚z¨’\ì5\ÌN>\'\İ\è­\Ñ\á\Ö[j Ó±\Èm	!=~¹ÿ\0\Z\é—\"•ÿ\0ˆÈ¨´Û*;t”¸r	\äÊ°?}s\æ\ì\Ú;×N.({Cbº\Ìg\ÑCqÙ’¤s!§™n¸\â±\×¤cÜ­/£L¡m¼*‚wõ\'\ëö:`{Uù<M\ïƒv\ë\"\Ç\âlÙ³¥–Øº(\ÇG\\ûD:€d¬~ú\ê¬:\Ë/ºX+*ùs®>XQ}ğg\ÆU±D\İ\ÚZé«¤Üˆ&j\Óù/GQ)ñP¯\âN?O]ucn,Gw\Z°n$\Ïp\ÒY!FC.\à<£\Ô \ß#\í¯E\ê\İGŸÕ†uÿ\0s7\Óq¬´\Z\ÈÑ“	‹u´€\â‰Î™dTÚˆ¢œöjh«^—¢û\à%i\è\n@‘\Ø\rC¯ªŞùL²‡\Ş¢Â•Ÿ°×œ_ı@§d%d‰«\Æôû±\Ùh\Ø\å}¨J.>²\0\îO¦¡w\Ş\æ\ÏZLz*X)€}G¾½L«V«sD–¢ÃÚ‰p¼±”£©ÿ\0¿M;\í\ÑR¯\ëª\ìôÁ*Ÿ–IQÿ\0r\à÷‚R{k;Ÿê¼œ\Ä=£´C´tª±‡s\Çn\ZöU:£W½ó.q!\È\í¼¢¢‘œ…¯\ÓVj;BT‰r¦{b\Új–\È,«\Í\Ê8újG„­µ&JIµ†Ë½²l\Û\Ç\ßx<,\Ã)\éÓ£´`µá´¬ø\Ë\'¯~\ß\ÓJ@2x%\0r3ƒ­”\Í…ò\íP’z\é®K’dº†›Iğ”2µ{j´ª 3n\Ûx2WWš…\'®N{\êC­C\Î%T\ê€\ÏT\ä¨´™yi\Ñ=4ùIšôJzCMù\Ü\î¥\'J²“\âo‰r\å6<(Áı9O§\ÓY\\\Ãm¶>e|©F\\t„«\ÛZˆj[\n	[\Ê\Ó\ÌBOclHa‡˜!\ÇH9%>§K\É<\ÈûN\ç\Ó,$¡	>(\'ª\Ç\\\çZõz\Í\ÙJ_ªLR\Éğ\ÛJr¢>\ÚÑ¸+°-˜\í6\ãJuC\Ãm>\Ş\çX#@u×¥®bÃ²hen£9A9ÀöÓ¾\"v€y’Z5j|©pÏ€\ÚZ/!m¹#˜c¶–²[Œ;\ZLV\Ü@)K\í€ \æ\ZZ?\ÒlcClüÿ\0\ä\ÔB›†ş¡!-¿\Ì?-_ÿ\0\'Y\0u\'˜²¬úùN––¾\ÓÙ0O¿0ğVu\çè“¦ûÊ \ìbc¦3Š*d  \ç\'¦––†uk¾s/§üKxˆ­zo\ì@ä–¥2\ß*#:|½\ÃgC\Ë\ãmjw•!øKº\à\È	VRr2®ƒ¾4´µòv]a\ï$™\ì¸6²\0¯\\xYUh4)tky\ç^\\fy#¨\á+°ú\rF¾\Ü1½¶ûgVß«¢\Şy7-÷5\ĞË°¯59¥ò4\Ø\È\é\ÌRV}úiih\ÕlõtH\î \ãq\Ö7¹”¥‡ƒüJp‘µœUX\É\Û\íÑ²—\'sÀ¨°\ÙD˜n\ãm¯>£±Ó–\Ù\ì\İ`¶Š‰´6I\ÏD¢\Å¦T´©N»ü\Î,ãª‰\ëô\ZZZnFK\ãca\ìñ¹r‚ò\áF\ãv‡^«+D›%‡]\åğ‹jûŸs¦ZÕ½T \È\ê\r5E\çpŸ¨…D}\Î:}--®…\îòa\ä\È~\Ñ\âl\Óö³t\Ë\ê’SªJ•¸\å-¤}@}í´\ìHğ`R\Ô\ÓM6\Ú\É?\ÛKKIe |™W\'&\ßZ\Å\Zdv\ÂDuö\ï\Èu\â4zƒï©¤\Æs¦Jı´´µ\0\ÇB`ñk	†¢\Ô\æ1™†\á\Éó~Y÷\ÖZdIM\ÄY\\Wr¡ùgKK\\¸É¿&9\í`8˜bR$©\Ç¸NùG”òH¤ª\Z /˜Ô¶t´µ Æ¯\ì\È}\æŠ5G¤\äGXm=u\æP„»!\È\î–\Ğ2|‡¯\ÛKKJq«É‘‹\ßr?5Fu\ç¥S\İ!-’’[\'—R›r˜ş>bcœ‚¤--Fq\Ó~L\ãsG¶[SµH\í%‡+\Íõ\ä?\Ì4´´´w¤c!¥¼ùÿ\0\ä\Ôlchş\'ÿ\Ù','Trisha','Gunio',23,NULL,'09466485696','Pulo, Lipa',NULL),('U0004',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0q\0\È\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0K\0\n	\0\0\0\0!1AQa\"2q	#R‘Bb¡$35rt‚±³Á%468v\Ñ7CSs²\Â\áğñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\02\0\0\0\0\0\0\0!1\"2AQaq3‘¡±RBÁ\Âÿ\Ú\0\0\0?\0±ıÎ±­ûzß‹·vbj5Û†”¹Æ“\"\âJG²œº§8HPmjHRByç–‰\×Pºm[ô¦\é\Ûn\ÛË¨K\èK¾Ğ„:@ 9\È<À\ëª\Ş\å©2–\í>¿µ¡¸ÕªK©]=\Ù¥öŠ8ÂœeA`\å+H#—Cƒ\á¦\Æôö\Şû\â\Ô\î&\Ğc”Ê³lU¡wp:\ÑHS3T0\à\ç…\'G†£i¦fŒº°UR8M–\î²\Ëß«~´ú-c1o>¦	*3EiV=z\ètÉƒ9S\Ñ\"9QFJ—\Ë?ü\é±w\Ìg\ëRf·@¥”¹NNSF€XK\ëag \'‹™\Î4\ë¤ÆrDbJ™1\ÂQ\ï\ÆRÁ \ç©õÓ˜\ä;	”+~“Z‡V[¶\ê£\ÈA,•)e•©\'—%tÏ§]xÌ Ñ¬ûm)£\ÒR‹•7\ÍnÔ’zI@¦1NA-:\é\0|%Y\ZÒ¸©3®ûu\êu6[\Ñ¥Œ¬r9\ë\ät±)0v@\ÓÜ®]N®sûqò‚”)\Ù œ|† QG»\é.8ßºZQË‰oŸ÷sÑ¯ğV\é¶cšO6\ÂJŸ	ø”‘Ïó\×\Ã÷ú•	NÓ¬i\ÜRÀ\rºÀ\Ä\ärYòÇ‘\Óg4\ê\ÉJ¶B‚£Óªµ•&BPl§@ d~\ĞğÔL ÑŠ\ÙJ¥\ÊZ>ñ\ŞóšşX\å¢z{Uˆ0N©$-”¶\êBğ\ç/x-#\Ç>#–—;‘¿\ÛKcK]º×·U=\êe%!\Õ$\çõˆ<(ùŸM!v\ç)JE\ÉY¦Hª\n\"ZmÔ¤\ÍJGx³\ã\Ï\Ë:0ŸU*Š&2\Ês€d#\'\Z¯17‚ÿ\0®\Ô™C·\à\ÓZpõœ\îı’”ß­–\ëû˜]«p%5Œ}\Üv[B.¡t¬”BGpn¿y[Ì½ZŒó‹’œ>¶=\î\åD\ãÿ\0¼µu\Â&3t\Ø/¾ixIm\ÓÄ¡œó\'®‚™¼o˜™\Â>²¬©R#¡@Ÿ—½½w•*C’jT\ntô«¨HS*úc#÷i#;3€Qı4£¥ı–%\ÕU[O´¶–\Ù\à\â\ëë­š•¢\å\n\ä«}JĞ¾¥+\ÉIñÿ\0óCğ;M\Úm×™7lwi\r!<-¡\êz{¢Iñy´Ë¶[³§@Uz€\Ôu³1E\×$\Æu%¨ó\')\È:+‰\Ê°‚^Q­K¾}U¨N¬)H\áXL\Ü$\"œóü´aR]j‹Fuo¨L»÷#º¬ Ÿ-|½sm\ìk\ÑZ;\Êj¢\ËJu\æ›iÂ•\'\æR0¡\×\Ô\Ë\ÆQ°ª2Ù’¥’JGĞ¢\ï	\à ,-\åBR–š\í!\Èõš#0\Ô\æRcG\'€§<¹šñ“kC¦9úY¸	O³ ’ñRSÀ½¾ª4z„|\Ö\\©¸Ò›\n+a)\È_¦4<\íZ¡S‚ôHo—RPñ}<IRO†_–—kI¤œp¤*iu\êKu\'¢A}d¥Æ»Õ¥h!@]i\×.+h	iT¨¤¡\áğ©^_MCJf \ÄiKˆ\í€J8R\ÈjJ«5™\íG‡\Ä\êZ.`ğ§\×F¥	p(¹U¬Ğ§;QŒ\Òß‘İ€Ñ‘\ï!$g]y³x\Ö*“Ør\Î¼¸i+› )*\äG\Ôøjf÷¤Šœ„S™”€„\\R•\Â3™ñ­7J¤\ÔP\ï[\ÂAÁ*óùhÃ€\å$Ze\å_¦@º$\Ğ)sdû…ò\nŸx«Y¯K\Î\Ûr›tC¸\éÔ„P—%¥<r\êˆ\äO˜\Z\Íax\'dm\Ò\èNÑ¼Wk÷P+²ZnVøYy\Õ\ãºH\é’O€\å“\á¯\ç\í-\ØÍ—e\ÚlI\İ5V\ÒCT\Új³…xq:j7sör~ö±/j­\nT¹\Òj–ÛĞ…Ÿ^#\É x“¬\Úo°K³Í‚\ã5ş\Ó{\ÅQƒ 0~ƒB©ü¤an\ä£ \ëªdp9\Ê\ì\Ô4”l¦\ïœÖ¸ƒ€	\Üş\Zÿ\0%+¡ı¤=¤/[±U»¾\íµl›o-\Ò]š”H-„aag\ëùi\á²m.\ØYµ\äX•ZL:¼t.·\ZS­6|p]YSe_<|õ¡z]e\Ïd¨R(½™;*\Ù%Êƒ\Â\İrö”*•ô*R\ß+ú(\å\ç\\›\íq\ï5+t®¸u˜	t.=1ˆô\ÈJÁ\02\Ãi\áN#\'*Á<ô/º\noy\Ï\ÙuK\'JUõU3ij(¡dc|»\Ïğ‚?…\Ğ¦ûE{3n‚‘Ë…\Ú;\Ë  \Í\á[\n\'¦l”şxÓ¾<ø5Jrjj‹Gu9nDwBÒ±\èG]qJV\Ñ\íK\Ï\ZÅ“P™nM\â\ÈvŠ÷	ı¦P¡\é[}®·£²\ÍNü®Ë—NŸRDZ€ÿ\0\Üñ(-M|8$c–\Ï]<¦\ê­D5\ç?\n#©{\n¦‘\ÓR8BğvÚšô>rº¡xU\åQXSŠ¨e\'ªs\ÏB—/i+m¬IW\ëYDP0\nJrä…Ÿ…¶\Ó\ÕK\'J]³\í©·;\æÉ¢Ü…»z¶–ÔµÆ”\ïÜ¼2Kk>=}\ÓÏ—«\îŞµ-õ¿Ş¨0M˜ò™£\Ç\ÉÂ°p§ˆüJğò\Zm\Îb\ÖÂ¸-Ë¥.ö*óM[k‡\ì~\à¦÷\Û#x»I\ÕUFˆ‡m«uN\ê™\ây÷G2O\áN=u;cY\Ñ!°†šŠç \í©\Û\Éiu•È€ƒ§µµf\ËC(ş(Añ\ZR\Z˜\Ş2â‘’•ñ´µnZô\Èh9À\å¢\'(‘– œrğÖ¤kfteq!…s\ÑM¿mÔ¥€‡q„gJºjw\r\ÊM‘Mœa\Õ!.0(FN}5	*\Ş²~šo\ËÛ‡\Ü9S\\¼õ ş\ÜŒ–ùj&¢h\Úì‚\ÅM#\Î‘õ\Ê%HK9\èF…)4\ë\ïnjO\Ö6Ö´iª|ñJ‡Á\Å\ZAı¶ºg\Ô`ú\ê\Ä\ÎÛ†W\ÉI\ë\×Pu²)JQZd+\Èv\Å:6Á\Â´·§ı$­»:\çJ¨\å¬%*Œ³\ÉM©DŸÂ£\ËÀ8iVEr@ŸTb0BˆKo2@ñÁO™:¯û…·)PSG \å*IÁÀ‚:0;=\ï…ZªŸôu¸÷\ÕL¨9\È\Ël~¢¿m>~#\×RPU	8;¨ÊšC\É\êü§Ü´{¯ô“R˜\èX-ğK-´\É\Ç\ÄFO¦´œj¢˜\Ë2K†8°Ÿxyú\ç\ÇF\İ\Ó*¨D•&:¤¥ =”y\àô\Ğjm{ƒÛ“LD„¡Gˆ²yxø\ê@K‘²†#Å·\nÄ‡tE2\Å%‡\Ûqõ?\Ô/+B†H\æ=9\rQ U¡S”eT\Ûuò9ı\ß\nU\åË?=H\Ú\Ûu]¸\ç{-\ãï…\Ü48”¯^^gM¦».¹@·Ü¹7:\ï‹Gˆ\Ò8œC(\ï\\\Æ:gÓŒM¶ˆ@ù@U¦õ£\Õ]J¦¦cˆy¡\Ş6\ÌV’{\ÒO|ôÎ¢©p\ë²`ûuF\nh¸\n›J\ær¾8<ü<´i»wM¯o\Ím‹Z-Vs(\âÒ¤6x\ÎF\nºc8\å\åzüve’Â§V\Üx\Ë)qe*\ä…\r9ˆ5\Ãt\Òl°\à%\íÀ\ífŸhH«Î¤™.\Ç^[J\Î0\Ù\êušdİµJt{=\ê\Å,U¸Z\Ë^ØŒ¡dô˜\Öh‹@8B\Ò\ç\\÷~¢v^ÙŠ¾\à.²ª|©øb¥\å\n_*A\nñª¼}©i{\ÓE·xöºªD \È_”*´\Ê\Õ×‰\Õ¥¼}VN•[»\Ú´\r\"óˆşü\Ş\Æö¦¾²—#T\nP\æ€”×Æ¥ª·3÷SP*{%cZ\ïS\ä\'MB”ÃJV’9}3®}$n€\á>¹Àù\È^´R\Û\çcé£Œ\Z˜ÏŠ2\Ç9\ç\î\İ24c\å=v\Åû\r7\Z‹\Z\ÅŞ­\Ø\İ;\"½ †\Å\Ú\Õu •Ÿ\×q\n„;”\ç\Ì?®N\ß}‡\×\ßm\Ú\ëı–ûTÑ·*Ö«+\ÚiËš\Ëlñ\'ƒr[9\ËƒŸ–¹q_s©\ĞVôkr\Ğy<<\Ñ\Ù^=8€\ç¢N\Ä_h~ıö#¾Şª\íş\èT©Q&I+¬Ù“X?£&¨‘Ÿ¹>\ëK\å\Éh\áWG-)ˆk\"-pğA?\ĞI²ñÒ·v\Õ\Ğj†C\é#t4ı¼Oö­ş\íÿ\0öl[ë¾¶†©md´©-Ÿf“HGg>ô¬cs&vÙš\×\è\ê´\Ê\åJ]nú²¤¸\Ù$ôå®®vVûP¶µµ­\×\Üh‘h\ÕY\ÌpÊ£Õ’…´şG>,¥\Äúuô\ÔF\ë}’˜&M¹[•\Ùó\'3\Ç.%1\Şò›1\\\ÈR™Woš¿\î\È³¦&\×F¸·*\ÛS\Ú%â¦¡´\×pbki\Ó\å\É\á\Ş\ã\î¹U\Ùo´.\æoş\è5gW-ªs\ã\ÄS\Ó]iµ‡P!! “\ç_ı¶±\àDˆ\Ã(†\é\Ìs:G\íObYı˜÷\á™>+HUamº\ßpx”‚xŠ\áQ9Á\æ›÷Ÿj-›\ìÿ\0¥^Õ´÷\ån,q\Æ\ê\Ètú\é\ÜTòÉ´m\Â\å÷›]EYúÚøƒ³œL¬v\ßZôøM!iˆ„“`s\Ñ\í>\ß\ï[k#\å\ÓTbö°Ç©¹\Ü\íÿ\0f\ËÆ´‘\Í.G„xHó\Èj\Äv|\í¾½\ÅLt\\ûC]·X\ãUFqûõ$)¦‰?\íA¾x0~@¶Y\r…-ŒúcR°©ŒEF\Ş1\é¯j\r\ÍC®DK\Ğd‘ğ‘\Ï[’\Ü`\'!cY© l›	\Ø-7\ÛR‘„’yyj.cN(ü<õõ^»‘IO1{\ç?UX\É\ĞE\Õ|o,–6]KrB%Íª” ròJ	Ğ–	\ÅoQ\Ê$˜Â.z„ª²´\å\\\å\ã¤\î\×\Úñ*Z\×i\Ğ6\Å1²JP$¾G€Ê\Ò\Ò%\İö\Ê\Ù7p«\ŞûF¹i	Qöˆ™\ì¥e?²®G>\\´Œ–\é\Z2J2©¥\Ø!Y+²ä°¡Ü\Ë:U\ŞT	´\É\r\×)/)©q]²\â9p¨m\ŞòÀSt›šÈª\Û5’\ßÔŠ\Ì6´Œ¡c\ÔNÜ–dj„Eq6=\á\È\ãL\Úù)¥\Z‚)bmDd/‹#q¿(\ÌU\Øx¥öš\ÆqÀ\à\ë\Ë\Èõ\Ónö²v\â\Ï\n(`(w²T_O3¤f\ßY\×Uq \Ómä°¸u*ƒl\Õ\è ¶\Ù<–Ÿ\\\à}usj»Ÿjm\r¾š=\Z\íS[o€6\Â@B9eGşšŸetE›r ›j˜I¨‚&£\Û\Öv\Í[š|fZXAS)#‰\\¹¨Ÿ-V\íüİº¦\á\Ö\Ô\Ë5\0)±ù2\Ñıc\â³\ë©m\ìŞ—®4\"•Cš¥´¤…L®\\k\ÇÀ‘øG\ï\Ò9\ÊÒªµ J_\nG0¥\ägRÀ;\Æ\å]3˜{¦!­ğ¹h¤Rh\ÅÀ\Ë\áN)„q-8|A\ZĞ°«{€\êk\r‡XT–e!Å¤…))HH\å@+\Ë\ÇQ£a:(1 ³[“2\İ\â{\Ù$©\Â<1\é¯k>…,\Ñ\ZEfRR\è<H\ê >\Ï\n#\rõLY0\éuE!\å`,6¼cõš§F¨@§-©\rq|IA<şº\Ío\Ä}Q\Â£iØ©TZ}\á:RÒ¯u°°–s£½½\İ\é6-6*N”\ÊI\áe¶ˆ_\âÏ‰õ:{\Øfş\è\\¬G©\×!«‚H\nm3u\Æ<\Ò\ßR=Nt!\Ú²½\'bœg\Ø.˜2f-|/\Óa$©LÄ¥§]w«\çJô<°\â\Z&MCI8ü\à:\Ã\Õİ¡ô\İG~*¤¦\ï8sƒZ_ø\Ôœ¡­\ËK´\Æ\ìL¶\ëo\Ô\ÊWñ:´d$y\åDõ\ÑC?f\æö\Şr+q*(™ ¦\á¦s\r¥$uNyÆ›={D\î½õ{s&Œ\Ìù°\ZIˆ¦)C‰Æ¹|#\0‘\ç[«Ê­¶˜ò\ï\Æ\à¥\Ù†› Rø\Ï\ê•ÅŒ’÷@\æ|5B¹t%®‘­¨£†8\Ü<š¤tŸ~6\Ò\êı7\Ú_úã¤‚\ï%tò°ş£™i\ÚN\Íğ“\â9û\äú\Î{ób7m\èc‚›R„\ÜF«Rfƒ<=8”Ú\ÏOÁİ¿ûpY7-·ŸzÄ¯\Ñ\ÔÃ®-5X\Êu\áÂBø†A\ç\Ôj\ÕV-]­©µ9¯aK–\Éd,9\ÏpŸ\ÈôÒ¶F\Û\ì\Ø^*¸è¯¦9e\"Cœ+C,=\Ä’Ê²	$c–ª5}!Cqƒ\ê­:š\Ü\éÃF~Ç•w¯\êzûU\\´=G_ f°X4»N6.a\Ëv\à„\æªÜµ\rù–›”SUJ”ôD±%<Y\rs\')üÎµ\í.\É]’ö\Öro\ÓjB \ê¸\Ó.»$,o\İüõ5²u[V\îŠ*°T\Ë\í¯Óôó\Ó\ŞÈ³\ìÉğÈ¶a~«¡„…\'\äqª4\ÑT\ĞLcs°F\ÅD±ñU´Kğ‘‘ø)CRûB¾\Ï]•Õ¨ß´¸O¯\ét§d\0}T\ÃJBG\Ì\è¢\Ø\íc\ÙC|)\Ò\'\ÙB£1T\ì\Ä[\ï¤!DrÁ(\çô\Î4Ğ©\ì\İs\è—ä´´Œ$Í«Ëšu÷\ZÁU%¼&¤¼\'\áJ	ò\ZM\Òwœœ£0´ º]FS0…nÈ­¦dB¢mM©8ğ €sôÑµ­P¸®(|d¥\n˜>=A×›Ä„\Æq\å¹Ä¬¢Nlz{0i=\Ò\æFs¦\İÛ‡Ìš[\Â¹¨õøl­õF\ïc\'€\ä\éW{v…ªm³\éJlJ\İA\Ò}\Ö\éğ£\êz©Õ‰˜õ=\Ú\Ç\"0y\èb½µ¶\Í{/=q¤\è\0-9D\Éñ\â\n¹£\í<\Ü\ZUÊ‹ba\İÑ«!]jQi\ìû8?0µ+÷i¯av±\ß[Ù‘*_aÛ¾’ÊB\ê5º{eI\Ç\ÇÂ·R@ô<ı5¼ö\ÍR©\îñ0…¤\Ñ.şzšµ\í81d¥\":ˆO?y\ÂG\ï\Ò\ÂyI\Zzc¸\åFi›ª¶\Õ,‡`H)Ê“ ¶¢“\åÄ…(\r\\tW\"¡m´Œyi‹ \Ü`†\Û	\0hR\ïh\áj\ès¦ó\å\ÎÜ Œ–»‰_m7*\áÅ™\Ì)¹	p§I\ÏùjIW½b¯SªÈ«\Õ\ã¿\n:\Üw\ÚC\\$ğŸ2=5X}\ÈUô=Æ´•(¤\àò8#¦…7Šö\ã¡ZÖ§+¸Š;\ÉL\ÅiJq\Äô	\â=|Iñ\Ñ\ÒS™$<%jn-§¦,\rÜ…§p\ßp\êx Ô2p­\rŞ—2\í…3/¡ù2[\âî“•)<y\êlW*t\ÑW\\d´Ó¯°Ò˜!\ä\ÚI=5\r_·\î\Õ*]¨‰Š„H$ñ£óÕ¢7iŸK—¸\åk_5f.H1•]BK÷‚*¢IòP=59LŞ‹n\Ë0ÚŠ\à\âB[u\Ö	\àW–:[¹2\İ5Z]·8\İ\r¦Sl¬‡¸#Ó—©:%E¿IQ\æ˜\Ê\0©J‘1‚tSVŒ-%JV¯§\Øe2`\È.¡J÷Q#—\î\Z\Í/\ÍfŠ«\Î}vö½)ÔºB™Ja¤¯|i$+‰+Á\è<¼uš\ßx\çnz#”ß¦\Ô-¹Ô©ô»–*j ¤—\ßfWtğÀ\Æ8¹\å<ş1\Ë@Wf-Š¾2!Y3¤\Æm|\ê\İJlŸ70\0üÆn-‰¢\\5a\"q\îdH-ñ\0$\Ş\Ê»œ`«…¾t\è\ã\Ï:±–€‚šee€\ê<¥U÷Z{¬\'Ô´\ÓCòN5k°]ª\è™ôs\\\Ü\È}Z\Ñ\Ï\Ét®Ÿ§z’°]¡°Dú¯G\Êş1Ç…¤ø(\îğƒ\ÙÃ³M\Ô\í\Z=:}_!¨hZ˜hc¢œ8S§öS\îù«U¾wj\Ê]\Å$Ó·\Ú_m\ï8’¥©\r¸®¡HÀ8òå£ªı½´tŠ;\Ò(\ÛU·U…2¦E\É[~A#‘\ä\ì\Ä|À\å¥5z··T†Ÿ©\Ì\ì\ËeS™P<N¿\"¤Bs\Ë)ş>®»7K^z*š\æ\ÌqvÄ½\Ùqı\Çı/<õ\ÏOv¯p®mulR66xš!hlM‚N6÷\å¹»»ƒ!ø;–™-\íJK‘»¸l\ç\ŞSŠ\á\r Ÿ%,‘\ät®İ\Ôğ\Ì\ÕP,….\ézL\Ô=Ry‚*‚\Â‡\0~\Òy`\×KK\Ãm\íÑ’*6\Ì\ÚT¨?\ÍkRLw9ñp¾\ë™V=qË¦˜»Ga\Ûô«Yš\ÄÈŒ´ “÷®c>Z¿QYm5™¥tGÄ†“ù\Øas;—Zu-…d•s\Í.\Z\Üvc“”\ä\ì\Únı§\ŞO\ĞoúT80$·\ÅMi \Zs#\îù“yó<ó®‡\Ø·Nzo$!$xV¹n\ÅF\ŞF*”\ê€\"2\Â\Ğ\ãI\'*‡—3«	²\Û\ÏZE\n=V\æ¤Ï\r\ŞI–\à¥ \å#\ç®!\Û/g²Q\ÌÛ¦,Å\Ê}ÿ\0u>\È{Qm\Ò7P\Ş¦løI<lû…|$oE:;$¤\å@t\n\Ğ}{´Û¤¦7İ¶…+\Â24‰¹®Ë©ú7\ékBS3\Ù(\Îø\ZR\Õ÷r¿B\Å\ÊÁ”¼.“Â‘¯;1¯•\èfL\É<ªèµ»–”µ\"URí†£œä¾‘\ÏË®˜öNòYsDAZŠyp¼¹·F»6^üš§œ½h/¯‘s‚`Z‘\á\Ìc\ë¦m¬\î\Ò\Ûğı’\r÷‡ˆ\âAi\ÇŸ\ÈiS©»» \Ô2\å¤^Hl<\åv:\æ·05\"ı³\Ü\ãn—sÀ\âG6Ø”•+ò\Z©\Ö\×%F]UÛ¥R¡„û«KnH@ó9#F´Û†“¾[j8\ïØ¥¹ÀO–RœhFŸP“4o”\â—s.[jZ\\H\ç\ÈgP÷­A“\Æc€\ß\Ä|´«\Ü\Ş\Ñf\Ë\Ú\Ã+ö©*´¶Ár\érJ\Ôp\Óa<N(“\Ñ G\ÂŞš…\åLY‰oMf¤…2j1Ë…>¨W4ıt“†xDHŒn“¶wnYˆ\nG0p|u¯qWS!*9u\ÒfÚ¨-Ò™‰\Ã|ú\'EÆ¼óŒ)Dò\æ<ô\İ\Í$\à&’I!\r\î=}ŠI5©•\":\n\ÈOS\é¤\Å\ÏÚ­\ÈR\İ\Z—œŸh2ŸŸ†Š«\ÕÑ»\Ã\ÚN\Û\Ú\Î6\ÓK£Âdn\×5€b\Ò\ØÀ\àa$ò[\Ê\ÎxFH\Ç<j\ä\Î\ìóaF¡²\ÍBoTœm\08ª¥\Z;Šp\ã™\æD\ê\Ûj·f0\çOº\×\Èe\Æv\\ĞŸ\ÚõKMvü¥\Ã<YHüa’3¡š÷k\Z%Q.B¦ÂŸST…€´{9m.Ÿ—†¯\æv^\ì—wIrº}©‰.\ä3Z·\âû¿\Òc_\Ú\å¤^õ}3kP\ã\Öû:o\Z^‹\Ş%\ÇiU\ÆR—Ö‘Ğ¶ú\0Bˆª¤¤=H\ËF\æp8§\ÕW\É;Ç¸•—\Ì*dj]9(÷ZfTg\ÖQ\èH÷I€\ëNuGp]’#]\×meT7M\nZAñ^´eN\Ù\ê\Ù\Ê\Ûö\Ír\á¦15…¥NG«\Ó\Üi\Õ$©RJ“õ\æ¤k\İb\Ïş?[\ë\Ö\İô¦“\ß4G™[g\Ü„gQ\Ï¾‰\ËN±Œ¥…™iÔ¨Sn\Û&Æ«\ÔW\ï~¥U¥>¥g>òŠ–9òñÁ\Æušy\Ğnûbta.\Öq‡iÎŒ¶\ÌWr\Øô\ëıú\Í^\ÎQˆğšÂŸAm’‘	¾~E*—kU’ób„’—Å‘\Ú[…S™·©÷!\î§É¥2\ì¤ ’qH§Ÿ>Y\Ç\ÓA›»ÁhÜµ…”:\ä{ªdH\ém$}\Ûd\0NO3×£#„Õ¸H3€POhúü=ºšºiM®\Ã\î†§\Õ\âPA?BT•qxró\Ò\çu{L\Ù\è¶\Ü7f\ÃYğbHIG\èï´¥’1€K \äi\ÛZµºÛ­½*nw\Å6”1¡6ùmAÁ\Íkñ\'ı4¤£7)\×;ºı­>§-’K	—$© \êR‰ğ²`÷L[ñ\Æ•h§¨»SQšYh»\ÎğxK\Ã\Ü\Ş=›Ÿ\å\ÓmºER|‹Æp\ÓhP\ÛA.B\ê<’…/\ß\ÓG›un®ö¡?S±7\r™N\ÇÂ—M¬EDT„û y ªsnjÓ¿¢\êV”jCIø”…+‹‡\ÌuújÀö|§=fm\Ô;…;ó\é\ë*p\ç\Ú\Ùñ6¬`¤òùk\Ğ}+v¬‘ŸP*$“a\ç\rş\Û\Ï\Êó7^\ÓR¸6\ÓGi>MyùkøøK\Õ\é»\énˆ¿\Â:$G¡Kq\rµR‡-+i<D\0T@÷Oˆ\å«\0{\rv™¶-h7mC¸\æ¼\è[°\n\Õ.+,’\é\rº\Ú\Ş8<¼´»£ö‚ª\í\İÚš£A¡H¥OŠ4©{\Èò[W\Æ\Ù\â\'„:y\\¾\Ë=ª\ìÑ¥Æ´mjI¤O-\Ê9öt»PRò\éËÔŸQu=\Õ\ÔÅ;‚©V˜´¶¨J@\È9wj{*^\í¹D\Ë^\á®Gœ\Ú¥Æº#wR2”§M¤\Ä:ó\Òşñ…Q‹UzÜ½¨\Ó\êM}™	ğüI#!I>`]J˜\î\nÀ\0¹\ç N\Ğ4k\n¥¶µ{‚ù„’\Í\Zœì¦¥#“¬©)$«\Ô\à`ò:ó\í\Æ\ßD—•\ŞmwY)4\Ç\è5 [¶½…x½uR!Å£\Ô% !\É\è€Û¨s ­IJ¹ø\ã: \Ş-µ\ß\îÖ­\Ò \Ö{CÀK§d¶š5¨+–¥Gq*QÇÀGC¶^\à\Û7­	Š„µ6\ì9i%\n8<³Œ#©¨öE>‘(O´\îÊBP\áÀ\Õ^V5\Ã\Â\è÷\Zz˜À‘7*·Wj™;/af\\z|º\éAØ¶\ÅIZh£ƒ%*)+)ñ>\':\Ø\Z?o\Ëj\ÙJVñÀ¶\í¨)0_r’Äš‡vOT¸\ç’|¸#\Ï[†÷\"¨¦Ù‘|=À“€Jy\ã\ç1myq\Ê©VœyC%XÎƒ\\zv	]tyNTµ‘µ\È58×†\å\\•¶·&=^\á\ÚÁ#\n\îR@C\0€\îÒœ\àg:2©9õ3ƒ\Z5\êm.(\â”\ÚR‘\ÍJ^–«\Úrß´¡¼\í6:\æ<\Ø8	PJI§\ÃM‹I;&STµ\ÙöO\ëš›‚§ß‚\ãbD¥ğ²…/ó8ò\Zk\ÊUª„\'«nh§¥I ¹I‡—\æR·>G„ëš¿gfù\îõı¦ôJ…\Ç=k§\Óh\Ë4\è\Î\Ìt‘Å‚pNq•¦º\Í]®¾\ÜR\ËNû\Îr\â\ÏA«%ª\İ	\Z\Ü7U¥\ÆF0\áEm¡·\Ûl\"\Æ\ÛX2\ØQSòd»Ş¿%\Òr\\qgš”I$O.T¹j\ë3Ú\×A\ß9O»£2iö\ĞmÙ;)\Ó\î1\æ}O¦¾#ViH™#9P”O7\ÈÏ§–¬\ícZ0ZIe\åÈ\ãnßº š:c¡ôEå¤ôóÔm[¶mS©\ëy\Õyº² D\ç \Ô->â¯¸¡\Ğ\á\Æ@\è]9:’j\à©$f}j;y\ê–\Û\Z\ÙÇª\Ö}\Öü\ì5™¿6ò©7S{-(SªñÑ‡£«À0TŒó(<µCwio}¤r·g\ï-§#!•ò\á\\j“>\n†3\â“\Ìk¢\ê«\Ó\İBªOSÃ	n‡an¥´õ©~Sš¨Àx¶¢¤©©RpR~Za=0~\ìNb˜ƒº\å\İ\nn\ÍRe*¥k\ÒfQj µM¤\Å_ªšVA:\Í:7ÿ\0ìº¸©.=röq»„öÁ*ıYXK\ÃÑ·†¯’€>º\ÍEIO+]…$Ù˜FP’e¾‹Qˆ­V\Ú\Zo\áÏ ò\Z¿®}¾ì¯±\Ï\Ô-¸­Îšû±\ád—%\Ê{*W™\'™>\Zbnu^\ÇÚ«Bu\éRJ\Ö`°¯e§2§]P\ÂHTIó\×9»T]•š\Û6\Ì;\Ê\ázU\Æú‘)§\\%\Ø\Åj!œ~©\é\êJ++™RS\ß¤\Ìy\n\Z•¼t\ç®\Ùmnûsù1j¼O%n)X\Ãn Ï¢ù\é\ÅrGm@nö¡¢\î0…Dg\ïTV@ |ˆ\Õ^¨BjK†\ÙBĞ·Xö–Ê²IQÂ¾¸ÎŠ7Gµı½v\Ãv„ûz;O¥†X“Pi\ÅfB\Z\Ç”JUË¨<ô“\ì28r§,½¢\ßì°º(\å\Ô\Óş[\ãğš\ÛÙ²\×UõµŠ»\âY^\ÅÂ´ª	rrñ\â ¡$ò9\èN•\ê·h-\rÅ‘G¨F“Æ¶\\ac\Ç>_»@4>\×[İ·\èı\érL—\îFš\êAı^.cS·\'k­\Û\ß8\Í[\Õ]Æ¦[¬%®O²¥ó\æ·9ü±5l±]\Û\ì1Å»O¡T¾¥š^©«úª’5ñ1û\ã”À²÷a\íÀ©\ãSŒyª|.“6Tµüm63“\Ì\'\×]8\ìÙ’\èÙŠ{Û‘¹.¥5º\Å9¶£\ÒøA4Ö‰\âPR¿ñU\È:Œõ\Õ+û\Z»#»PİŠ§h«\î¡lkdˆ´b\ÎjSO\Ëq<KTÚˆ÷@OTO€\×Q¨€\ßç§—N¡u{1t\ç•\ro³GK&§û)\×\çñ½«gÚ±».\í\×cª¤(+y3.*¤ZK\n°Ã«÷ø|ı\ĞtødŸİª£\ÛÁ\änoh­¹\Úå¯ŠŸA‡*½Slg\ß_òl‚:~#ªŒ\î\Ğ\ÒU²Š0\éFR³g6\Éûc\í\Ûr¨ÓŠ–ˆ\êzJœú”µeXñ\Æ4Cf2ÿ\0\Õõ\'RQ~ğ\Ñ]X)Æ’†•\É)\ÇM\rL€ ùtg‹\Ç\Z©\ÕfI\n·@ö1˜†¸u*R_pñ$c:õªo\íF*\ra\'½48\ÚG\Ç<xh¯n.k®WuH¦+„õy\ÓÂ‘şgH2–¢C†«ª\áŒjr»wò¹5=P¬¥†RNV\âü>¼†“7ş÷Ü·\äw(;3mT®\ÊÓ§»i4ø.HC|ñ\ÄJG>º³6\ïbR¿\Ü\Ë\İR*¡·8\ÑME\ÒH9sûGšmİƒh\ØT¸ô«Fß\Z,t\á¸ğc¥¶\Û@\rNRYXF©yP5w—?-fÁSß²ï³¿nÍŠ\íg´\rá¶¨‰C¨Òœ§\\\rÕªŒ¦@ad-.6\ÚÄ•¤{¼¹å®¨][©\Z¡\0pJv\"qïº2>¤€4¤b²–šS¼\Ú‘ğ¶®Ÿ3\ÓPR\î¥İ†i\î¨@a\ÎÀ!\Åy\ã©\Èad#@\É1ä¦•um\Ùo\ĞÔŠ\r^pJIz¢Bc\×\áW¼}¥f\îô\Úd†£R-¶\Ö°+—\ÃÀŸ€’Iô\Ğ-.¨\İ:–\Ü\ê’:\ry\"®€\á\î×•¨ó:q„b/u\ïWjpS£\Ä p÷<|òJSùFÜ—½óU\ã4Û‰ŠXP\ä÷²¶â‡¨\n$h)\êô§_ö\Zx\ãwó§\áoş§^­T¡Rò&B½Ë‰J>ƒÀk\Ë0•\"~\æSd‘/7&eYZ^h¥x\à\ãD\'rn\Êk_¤&÷ï´•²u_\ÙN `\×dº‘\"b\Ãm8#´}ïš•şC^\ÏV#%£\í	\n2H\Ğ8E¼a0\è;ŸG¬¡†S$!\çš{; $c\Ç\Ã÷\ë4¬Œ\Í>¢¥”òƒ€¾h\äs\Ìk4 ,T;}¿\ì\ê\Äÿ\0™¢‚½R®\Ôñ5qÿ\0Xoü$\ë5š”‘G*¾?WıIı^v¯\Âÿ\0õeÿ\0q\Ök4Ğ¡o)Kp²=ı}\ÍA‡\å¬\Öi¤¾d\æ>J\ê\ï\Ø\rÿ\07gü\ê\ïø-\êû§ùó\Z\Íf²?*]¼…\ê:ı5X7\Ûş2ÿ\0£ÿ\0Œ\æ³Y¦µ^E+Aú«\Íÿ\0ı¿å¨™?ş–³Yª\ã\Ô\çü—\å3ùÕ¿\é7m\ä“ò\Z\Íf§h?EFWò‰—ñ±ı=O\æ\ï\ìŸ\î\Ök5,\ÕyQ5¯÷jGşB¿»Z›yş\ã\Æş°?¿Y¬Ö(\Â.=~šóüºõš\Í\Z%÷Dÿ\0gwújÖ¼?\çg>º\Íf´\îÊ›‡ğ}\Õ•G\ËY¬\ÖB’¥ÿ\0°/Y¬\ÖhEÿ\Ù','BIGGUS DICKUS','ChadBig',21,NULL,'09386508693','Lipa Batangas','Hello Kim jong Un'),('U0005',NULL,'Keith Richard','MEMER',21,NULL,'09386508693','Ibabao',NULL),('U0006',NULL,'Chad Big','Montefalco',21,NULL,'09876543222','Cuenca',NULL),('U0007',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0q\0\È\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0L\0\0\0\0\0!1A\"Q2aq#‘46¡±²	358Bstğ$%7bruv‚³Á\ÂCDR´\Ñ\áñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\04\0\0\0\0\0\0\0\0\0!1Aq\"2Q±ğ3a‘¡Á\á#4R\ÑC\Âñÿ\Ú\0\0\0?\0ü95\åI\Ív\á’\âxm¥8°„’v¦•\äg\Â\è(m¹_\İo>\rô«\ç4²õ\ä8²wp©G\ï©	Œ¹¥8r\Ã8\\\Åe_:&\à|c\Ûß»>‘\ål’£Cy#s\Ç!\å\æ”M¸¯¤<›\Â\ÚAò4\Ób¹\Ş\ã¦Ó¦¢ÁJ±\Î\n\×ó\ì+Ş¦›®¦LX\ä^%_2M8\âŒeAz,<`&*vÇ©5Lm\rj^bA%Fh^V\ßY(\È) “V§\r§Fn3\ä6 \Í¦=\ÇDH\ÔR\ÒŠy\Z\Ïı*_H\ÎMµ\r!Ü€û#4¬@\æl¦\Úı…Ê¼\á\ÒyFP·µ)¸‚:F\Çm\Åñ-”Ä½$²šP\ä•Â–Zaõ¸’U¹i°³÷şúª™)2¸5\ÅBF€%@j\êà­¥\éo%\çwBZ\î(O\è:\à†—BI ¥¥\á*P\'bz„©­9\ìÿ\0ÀMYª–\êmlF‰¤†\Õ1\ÕD«\Î\ëW|\ÕL\Å4tT¥3µ®\ÌNSZ»D.F®p\ÆG2V“Ó¦h?R\é¹6k»L•r/u6¬Œıkô/N{p\êdd¿z\ÕWi«ø\åES,Œc|•m\é½7¾?u£\í]4‡®Ğš\0©q¥Ú™\âq\Ôs¥h\Ç\Ş)˜l™@µ¿‰\áójW\çe\â\Ò.’v8¡«›;\Å `ƒ\ÜV³ö§öâ·³\ã\ï_\í!\ÍO¥\ÒR|…¡q	\Ø\Ú\É(\é‚S\ëŠ\ÎZ—J¾ÊŒ\ë	Z¾w’ıugF\Ò\Ëi´\Ø1-’œ\r„ó‹X(À\Í7LeŠˆ36\ÒôUøo¶:ì¡¸?CŞ›ü‹)\Îz\Ô\îa ×‚—:œc”œ\â¾\Äc\Ä_&:\×f#+•Uİ–Ì„„\ë\Ë\Åõ N\Ùi1\åOSÖ¹•)j\Û\ï5\æ\\Œ¯\0t\ï\ë^íŒªD”4\Äq[Ie\Ä)M1ou¶\Õ/—†˜].eWP\èÇ•c4i&V›\È)éŠ¯\î-¥rŠ³œ¯#zÀ\à\á¢\0,\êŠnMºG”§Ô©\ÊZKÖ†*-ŠU1h\'TöX\n‰’\ï>\ZGARz:\Ğõ\Şûh*+tg•\Ó*X.‘¶jÀ\àm¿7órq¢C*É¨œr´¹t\rU\'\ÜeKb\ãODÁLVG>z›³´½9\ÂÜƒ‡e+ \ì(q\å=«µ£\Ë\Ç1[\á	Ï 4Q\Är-3bCX\ìtSB[B83\á÷I\ÍVP’¥\êTH’@ûQ’{oG|O°¹{\Ô\Ğ\"\ÅFK\Ñ\Ğó4;\Ã=Fö™×‘\îp\ËAY)Qz#OS±òº•$Ÿ¨­c\Ñzwˆ\Z²©MÇ±^£\Å\"#n$·\n\æ\æB;0³\Ğá“·–y\ÙÍ¾\â–I\ÊAUGÔ›U¢‡²	ñp?¤i\İ\ÛK*6‡b\ì„yĞ¤ò;\äT‡¸i\ÄM7{Cz\ãD]-²)Ju2a«”\à´‚…B	‹/–¦N…µ\ÂFzR7Q‘Bz¡ƒ¼\ê°=®•y­­³/\è·4#%)	t€zšq`\á\Ël²\İ\İJñœyÔµ<\Ø\ßW/(P\' \ß\'¥XÖ­\ï\î\\,\ÓY\ähò\Ûsv\0oƒ—®*\Ã\áO\0u#q¢]§AS²\nLFœ\Ï:P	\É!XHô~†Á™\Û-\Ôx©\Z\×Õ®<\à.“\Ò\ì\Ä\ÖEšW\rÅ—·©²\\”±\ÙJ9	OL¨öÚ¯=®81¡“\ÇJ[Q\Z*\n\Ó,„”\'m)mÓ½gıQ{›ªu¼\Ùw\ëšb[-û«)@HBP\Ù	<€\à$dTv\îO¡ƒö\çöl\Ğ7F4­—†&øµ8D‹MK\\¥\ä‚L…¸\ß9;o¸ù\â§\Îù¥\"ü‡\İså‡¤mO¸h´şƒ\ãµõµGM\Ü\\´\İXmnAC\ï%l<1\Ì2V\ê\ÈØŒdW[\'¶7\rÔ¥iıQdf=\Åp©\È\ÈKjY\Ç\È\0Fz`ú\ÖW\Õ|TĞœA¼Ë½p·LK²º\Ë\å7,\æo!*\İ.(%E$\ç>d“‘\×U‹ÁN\ê=Aizøöšqy\æÔ–\Ñ=-\0!%Ä¨$üÀ¢ˆ¥ 5\ÙG.&33\ï\ã¨ñW¾…ö¹\à·\Ş~\ÃqŠ¸\Ğ\Ñ\rÁtvS*So Œ¬ò¨+$Nı+-ñ§\Ù\Ù\×Y\ß&³Àş:A€\ëŠ[°\í7»RU9\Ü4™Mf€\è9’¾À\ã¨¹:oW=¯\æi–nf\ß\å·\å\\\0>\ì;´\Ìy\Õ\Ø\0¢;‚FrºYıš\İZôü./¼‹\Ûnø~#—V\n¼\ìTœ $o\Ó\ÊqØš&\ã\\m\ë\Öêˆ°q\Äz#\Âş+;\ë\î\ê\Îjq¢5¾›0$¾‘\îò›}.Ä““\å[N£(ZÀ(»¸ªş\ëa•iœ¨“R“·0ëƒ\Ú+K\ëK>¸¹ªG	õ)[²­\Ü\Ï\Û9–6*Zy·\åR{c·Êª­s§.M+Á»\Â)m\Ì8Ó‹A\çk;`ı\'¸=\í\ïQˆ5R¼f*´	{›\íÒ¼¸¥x¼\Ã;zÔ•\Æ\ÒüU).4\0N\Ù\n~5\ãn¡XR~Ÿ:\Z¤ğmyueK\Ü÷¢¾Y…\Î\å\â¬T³B…$¯É«c†V[lh˜\â@+Vk\ÏvVè°¦<BRc0\" \î½WAo(¨l\ÔÑ¾³›\ï2¤)KNqš9\Ê\Ô>x¥\Æ\Z¢h´am”6µl6\ÏÊ•1\Ó\ï‰\Öo\'Ì©P¹\Çu\à\â\İY!i”GHß©«7A04·\r\å\ßlIJ	úUwf„»\Å\í¸¡9\Ê\ÅY¼GlZ´ô6\ÈÇ”€~Y®db\ÖwŸ]=+‡\íh¨\×:WÀ\Æ\\YıtË‰÷ö\æŞ¤º’·N1\èOp\á\r\éır¼89T\âJ\Z9Á;Uey–\äËŠ–µ“\æ\ïE\êb\î\êRÀd:´)•[\'˜¨rÖ³\àdt\ëK\\>\êùQš~B<[%\ÊG\Å\ÕlYQ\î\Ò\ÎOe¡\ë6ğƒKCªQ%ğ|À-\Õ›Q;üJw\ï\Ö÷Hi—\Ãl\0¬l“Ö½‹ó#£ÒF\ÛtğZ]©B\á5ñzv\êóg“	e.Ejb\Ëi \ã\àQ)#\î\ïRw>,Cº\ÛW_p¿Oj)ö\İfs\ĞC2q\'#\nk“ew5j\ãÆ›\âDP¸¿`’»ŒV\Ów\Ûk\ÉL•2ÁÄ¬rº@\Ø+)8Ø“D¼A\áTHZZN«Òš™›)BŒ{„6¹V²R\ê2|5ı½	®;D¬wr–£‘\á²h}q^´÷´\r-­<Æ¥\àÍ¶—„Éƒ!\ä-;’r²3¿n\Ôn\ç\ì±t„©z>$fË YÜ²¥\ÈA\'\Ô\ç\î¬™k¼H‘\r-\Ìq\É+\çYB\Û!D¾\èß˜\ã\ÓõQT\Î(Ş¢iµZl6\Ò\İK‹i-„\Û ®Ó¦p\Ã\Ñ\ä²\\mÒ¿ğºó¨›T¤­\É,%½\ÙeA´!`•ü$­dü vz·*é¥¯?“\å\ê«Í¥ÆŠq\îÖ´-~˜I\Ç\\l1]\à\ëıg9´µn¸º\Ò	\Ù\r\åG\'\ëûh§OkM[¦œNtÊ›\ÎV\Îgl_Dq3E¥\İğºúA;\ê®^\è«}§BLâ†ª·\ê_b\Şã¶»]ñ¦Ÿs!$—\Ê\Ël¤eYY\Î\Ş_9}ö©\â\ë—|\ĞÒ¦Ùše`ÆŒmÜˆO(ø	^{\äw\éW¿8…e\ĞÊŸ\â&¬aw·YB¤¥\ÂV¦Ğµ\0\ï\Í\æ\É\é’©{Gxvæ ¹Ç·£‘ô)\"šIHQØ£©¥a\ç{f/\r³\ŞO–Š7±faòU6’¶k_ks¾jM¨\í·fP÷‡ Kƒú•m\à¥\Ñ\Èñ\Æ06s\0\Ím¢-\\\à­\Şm²7³\Òo\ìÜ›\\Y°\ä\ßHu¢H\rº\ß2¸;÷­\Ò\Ïøo¯mr4lmW\r\È/ÀğVˆ²’H*òtõJ‡®r²G®ºZv¢—d\ã—\Å\Ò\çj|´›\Ò¶\\\Ğş-n-²rQƒ““UAts—}ÿ\0.>´L‹;Ákš@\î¿ùö]=Ÿxw:\ë\Ä\è\ZRZf·nm™2´{÷TH—\Ï\Ç\'-¬¡I\'U€Ú‹8¿\ìE©n‘$\ß4ñ¹k<\È\ÉNTHP)I\ÎH$dúŠõ\ÂOhNKf“\Ñ=…b—\ÎX\Ï\ÇR”µ«§%D©yI#$\çM¨Ú“ˆ7™\Î\êW¹EZ”P\ÃJÇ‚®nUC¸®† ±¯\ÙPY$\Ïh=\ê˜\â²O´”½9e‚:¥÷\n*\âi\é/!\á\ê\r=k–›öö˜\Ên¼K³D\áÅ•ÀT›\Ç$şN\Ï\Ù\Ç ¾\éÛ¢[û\èŠ×¯ø\Ójñ#X¸™¨\à\\(Å½\ÈoËÇ•}+§A\ê\Î#_\r\ÓSjrŠ\âLº]¥8ñil•¬“ôŞ•/\âN£@Ş†Q»…rû¨ˆÏœfa†\çõ%\ÎC_ù\ÛFˆO¹òñ¤¡\Õ\'\æı*Th³§´B¯úr\ê\Å\Ö\ÖÁKOËŒ•!l-Y	K­/lœd{M¯\\C\Òp\ï#Eğ†2\Ò\Ë\0&}şJ¤HP\ÎCyÙ¤|†ÿ\0:€\×.Ei„«\ŞS…$9%j\È=r	Á\éY#òÆŸµ±›\İ\0\êuxmT¯2÷?:|”m\×5\'}œ¹S99‰J6ññ2{U\Ìq­U¢ôR\ZVzbN\äYò/¨¥L\ím¨»\ã\ì“ß½*Ü¡\Ë\Å\ÔTg-Ë¸\êör<¨<\Ê4c®–.º±-´r9ƒh¥Â4,q¤\ÜªJ	\íıó_t\ê»\ë0¥PÂŠÕ¿¥q‹À™\Ïş!^\íX\ŞW^$LoOXa\é¶ˆğµ[Å‡&\ëuLHˆ*[®a õ5%\Ä\İJõ\çUIG‘r§\è*\Ãö~\Ñv\èP\Ü\×ú´û¼qöe]\ÕÚ›¿-‡\Î\íş¥a\ßA<¿[X\à÷lJÀ¹\\›\Äu\0õ ]-s.\Û\Æy\ä\n\ï\Ä\İg\'^\ê÷\ï.¯\ì|8\É\ì*G†0Û•Š1”³\æU60\è`.h\ê}{’\\¤¦\ì¬\í5Ûˆ3a\ËASP\í©H\åQª\Æsû*[…œx\â„\Ô2§ô„2¢•§œ\0S\ßbpv\íÒ‡t|õÅ“¨µ*Ù©\Ò\Úô\ÛÏ‡rĞ¦n’” \àü\Ïo\×Q–‚]ÆƒG¯ŠD\ÉEz±µo†­”\Ñ\Õ\×ò¥ˆ°eÅ«·ÂTIô\ëCw\Ğ··*Z‡Œ\áû@¨\Ü\Ô–—“md°’\Âò‚¡’w\é¿`+¥º8\Ûm%n«—\Ã\ÊFz\ã\ë^– \ÃCe3YÑŠ\nN¯¸Z\ŞLkK)/)ymdü#\åE½AwvO<.²“\ÊÌ§<\Â\"q•,o\Ôı\çZªü\Ô6Ò¦B”\áH\Î\à|ªFÁxq‡\âJù”yÕ…nšK˜K,ÊĞ9¥¦?›ccS9\Ì<Q¨\îR”V\á?+N6œï˜\ß\×z\Ô÷›@aû„]\n\ÌT¾\â\Ğ\Äh·I>\n\åJBT²@\ß\ÎÂ½J¹C™\áøò[Ê–2]Ny{ÿ\0Jñq·6\êƒ×—\Øä€–\ŞJş\Ğ\r¹‘\è7\Î\ãş´q9\à\Ù>köJ—¨5\Ù,\\Ú±[ì¡•µ\"\É\İ\Ô6À\æ ùûœœœœ“D—}m©e\Ù[ºj›¢&\ÏJJ\\)Ö“T¬ˆ\ìhkZ\Ï\Óvv\ÚoO]Œ–\Şnulúglƒô¡»¢”ôfÒ·	\Ü\ã\äZög\ÈğO_F2\nE65	Ú©Gku\Èñš!\Ù\Æ@\Ç\âv­E\ÃX\\<\â+°\Í\ëT\ÅDÙ‘w->P!I “Ê³Ô“\ëY+E½%Vg¡\ÆeG\Ş_F\ä\ã\Ê	Q$úmS\Õ&Kyû£\Şô¤)i\ÌøkAß­W\0‘À\Ñ\ÛDR\ÄU\ÅkıUÂ¯g~Ov.¯×¶¶‹(>YRŠ	\ÇÙ‚\0P…g¯j_j\Í\î–W¸\r\Ö-N\Ü.\ï %\é?\èŒt³Ö«\ÍJ\í—PÛ\É\Ä;\â\Ë#•\×^.%ğ:¤óˆş\â«{Â—\ï+. \àƒ†™Jl…c:f7H›†\Ò‚Òœ_Ä¢Nı\êKS:ü\ÆÜ™\ÌyPŸ¸P¶œ–´ „ƒ8¢+¼\ä\Æ\Ò\ëñ6+Aõ§\Î\â\ÙE*#m‚\n¯\å½\Ì\ê\Õ\Í\Ô\×Œ¬!#s_¥-Ó¾Ûš\Ópù\ÉN	\0\Ón…£\Ùun!‡\Ô3šU5z·†€\éô©}3P\åj\í«n©°\éõ!€§’OÖ 4ü\Ç,zf^¤_ñVó]¸¸÷u·YâŒ‚×˜™\ÅyÖŒ3\n\Í\Â\Ö\0b7Š\îz\ä·Xš?‘³\È+\İ\Ú\ä€\í6\ÙZ—R7\0•È‘¿\Şj\à\â½\í+¤!ğ\ÎÖ ‚\ÓA\ÉJI\ê}(C„\ÖØ¶g¬.HLq–ù»še®/\ê\rLõ\Ñ\å¶	$~Ê¤ş¤\à›\çö	{7Ÿ’e\\\Ír°\êhÿ\0…ñKp\äNIÁ\r’j»÷”¶9~\ê²8u-¶!Ã¶<y}\é\Íş”üE˜©- g²ˆ¡\Ä\á+ÑŠ°ô—T²U·s]xwni¹EAjy\ìz\â¸k‰¬D\\}9¢HO(\îh£O\ØW\Ù\È\Ê\nBV\á³S2\Ë/ùõò[°\äxöø®[’‡\ÒP\np¢N(3W\Âñ#q\Ü\n[D–Ê¶*|f¬. h+\Ôş;rÑ.Q\Ó\â\Æe\ã\Å\Æ\å\æG\âj²qvf©º\"\Ù|‚”Im¢Ëƒ‚T\áC±Š)Cœ\Ûo°¤™³•E	\äp\Î\ã½M\é\É3\Ã\0\Él‚Ÿ)Iµ\ÕVA!*™7Nrqışµ\æ+O\Ãx¤íƒ¸ùT®p;$4\\ue\ÊKJ*d0@;ŸÖ„¤^o‹i\È\ßh›s¥ÓŒQ¬\ä³ )´\ÙR|¤n:t\Ç\×CN4\ÓÏ H8#)…r\ÚDÆµÛ„\ÎÎ¥ ]Zˆ\0¥f»ûÛ²yG!#8W\×Àa^\ZÌŒr\çy¦t•Š+\ï\Æe\×2·6 oŠözÔªƒAVW	´;\çGs	S‹% ±€½±Œÿ\0}\è{]ªï§¯¦\r\îS\ÅÔ¹\Î\Ù<‰#lgåªÚ²Ëµ?f¶šG…BYñ>%$y¾y\ßñ5UqKR\Ûõe²d‡\r\ÂŞ’Â¤¸¬—\Ùş‡1õN\éÏ \ÔÂŠo[u. œú!;\Ä\Õ;\Ì\ê\ÙD…÷>´93\Ä.`œıjFJ–\ÚB=i”°£•\ã½6\Ò\Ú8©M:µs§ÒŸ\ë¹%›Pd–\Ô\ÏE>$«¡5ó‰ò4\ÛY\İ[š™\á\ÆpJ\Ö\ĞI+*PÚ‹ô,\Ú0§r=(9\éV™m	µ!	\êF\ã4s;,ejì¶Š\Ü=Ğª•yÔ’\Ğ\ÄT²\ÏT÷¥RD\Ó#mE}\Z¯]Ft\'™¦\npú\0¢i\Â\ä­O©n,²r‚|0AşˆÚ¼i;ˆ\Óú^~¢QËe¶©µ \'L\éuŞ¤ñ‰G\Ê]\éHH\á@y•Q¹®Ú’ü\Ô(m\éˆ;$õw|&qI¥ uùS1-R¯Iy\Õw\É&½\\\ßK÷©>½EY@4€¥\r§%NCC\'™@`UÍ¤4t‰\Â=\à† ¤a^¦«YUx\ÕQ¡\É\çX\n\Ò5rK®\Zh\èû„\çSÌ†\Æ\àddŸ\ïY;\Îp\Æ\îPX\ÊJF\Ô\ÜC\â\Ô-/¤-«—5÷œˆ\è„s-G²Fw5¨\àğfÿ\0¤¢Å‘m´™ˆSs\ä¼Àp¸H(AP÷\ÎNOSŒZ\\\Z\à\Ï¸kn5¶/¾_®\Ì\îS\å#\ÌBRB6\ÊZ:\ç&‰%\ë‹\í8İ¾ä…ª2¼)¨lt¤…u\Æˆªr\ÆÀÖ˜ùŸ#‰`\ÑPW.¹oÿ\0(\Ú^,»±S8\Ëj „ü\ë5ûQp~*.Š\âf˜Œ–.(9\Óx\ä”@\Éø§ÿ\0k,^a´\ßøD\ä“\à%\Å5!<€y`p}~UNñ*\Å+TÀqø¡±\á“\Ì\É\È\nù\ÇõÔ’:E¬½l\ã*mi-\îs$akec?Áıt\é®0ZuAĞ¤‹\Ítü(CŠ\ÚJv‡\ÕòP˜\ËŸ_;k\å £ñ\Í*r×¹=~T³eU\Ñ4\ÇZ\Ùg\ÇqbS)W)<¡\ì\Ä\0:\Ô2e59Õ¥•$¨\î£Ì¢~ı±U™“…#oŸJ\Ó\Z­ˆR›™+AØœn?ú 1e²6 6Eq.1X˜°ûˆJS\Õ^\'ñ;\â§,Z\Ì\Ûo°¦\×*\è\Ú\ŞÖ™8	ll¥ôl÷Ú‚u£¶Ê¼®d9|\é,¤\Ùû4•¢Ÿi½\"Æ¤Ë•-¢\Ø}L\0<\é\É\'8ë¿¥kc.§V¨\Ú5\ël€Ö–\íe\Âøª,3­\ÅçŠô¦¹CˆRr\nH\ØyH\ïUŒù¢\ë$¿²W‰=\ëœV\ê\Ñ\\G~\ë\Ù\Z÷\n-\Î\Õy¶µ%¦ç´—vi\åPÁ\0\äûŠ†\ã/°nƒ\â}N¬ö}µÆµ\êf\Ò^z\Ê\ä¥%‰\é\0©a¡\Ñ‘¸	\Æ65F\Z\×;$‚\Ë\ì¢\ÄF\æ\ÂÃ²Ğ HRrEq\Ø1ù€\íR÷»,\ëd÷ Ï„\ìy8¦\ä0ò9V\Ú\ÒpR zF1L|¤†\Ô;\î+ ö$\Æò¤´½¥)Œ‡”1É¡ıw<Ë»–ó”¢ŠŒ¤[\à ¤\ä K²\×2\èyA%J\ëS4\æ’\Ó\Z)«œX\Ëuaa;œÑ½•j‹¾c±=.mğZa\Æ,ŒüªEÛ’P„FA>F÷¥\Ïoj&\Ñ+\í\Ş\á\ï2\ËI^}iT;<I\î8µt;\nT\r ±\ä^ª#P7ù?LÁ¶¼¼yÖŸ_­B]õ—X\ÌE_•¶\0\Ï]ë†°\Õ_§ò£fš¨¢[}I¤\Ôñ­»}ş*\âÒŸx¥É\Æó\×jp‡<Y\Ç\'ú]iµµmªH+V\0\Ú\ĞÃ³®-²\Ğ%N¹€>ú¥¦Šv{9\éøñ\å\ÈÕ“’<8Í’\Ù#©­\ìmo¬ø‡w\â|\ÈA\æ¢rÁ€\n\ÊIZ\Ï2ùN1²@\Éô5=öM—NÁĞšn;O˜´ 3KqJ\Ø$\ä\Ö\Ä\àƒšw…Z\nˆ\\)Q¥F†§¥/Jp:¯1QÜ€IÏ”d$Kƒ¯)”ò”X§\Ä7W\í\ê\ïç’¢„°û-\'¥A*N22A\ÎN*\×7I¬MnL8Á˜®¼£9´°Š‚HP\0$\ç—|ŸAÖˆ\îZ\æØŒ´óhW—S\Ì\à\Æ\ÈRwÁ\é\Øc~\ëk«\â3tT`\Ø\ÃÜªy\åñ§mÀódm\Ôo÷\Z<C¯e>•Á_5›VI+J\Ş_S¬—9K|Ã”²O¯§­B\ß%®\İ(±ny^\ê\Ä\'t»y\êH\í\ê=j­\\S:.¤vCi.\á\n,\ã¡#±Ú˜B½Ë—dCòQ\nm\å¤\å+\íJœ#i^Z\Z‚c\Ä^\Ûuöu\Ô\ÃJ‚›\'`J³ÈŒ\ç·J\Ìz‡O\Ï\ÒwG¬÷X\n\æd\ì¬c™9\Øı+Y\Û52\Æ`º\Ğe•\'”­*Q)öÿ\0ö†¸\ËÃ–õ†N Ó±rt˜Ï¥9ñSƒ\ÌÃ¾¹ùô¯F\âÓ•É¡Â¬,\Ù\Úd§™ø@«›®\Í= Ô°‰¥ş&\İÿ\0\äQ²øGj\×Zgò¯Dˆ\ÓA\ÃöiC˜-À|\Èi\Âr7ò+r:\Z¶\èKmÀ*\ß1nÅ’ÚŠÌ‚…ˆRU‚{mNs{Ó£}š	\Ì;g¥8ƒ\â\Êh\0ÏœŸC•kğ+€\Ü1ã¾¼´ğÅ«\àŒı\ÖIJ$¶\ØñR…-\\£;$üªª‘Á[\ÓIGº\\\èV0R¢´ğnğ\Ù:_Ú¢,›š‹\îÿ\0‚÷5Bp¡X\èg\Ç ©8\İC¹\Ü3\Z\éºZ\\Îi­-\n`\Ûm<‰l·¶ú.</Ô†\Õ-÷’€ó‘Gƒ\Ì]B@ :\Ùë“Œ1V¿\r¯Û“\äı\ÑL%÷‡šJ“€±\å#o‹|Ú„m±ôÆ‹ö\Ü\Ö7¼\èVŞµk\í	r†ˆP””\ß^7J‰s”¡\\`Šµ\ê½®\×rÓ®G1¤\Û.^\0)p!Ih«\ì\ÔG@p3œ\ç¥f*\Æ&Á\Õs¢•\ï\Ã\Ñ\Û^)\ÏğŒ{#¶\îŸw\Ú+@Yy=\İÒM4ò¤©_)@óN3·|\íXbYS”¤\ëõsGñF«_\ä\ÛÜ®x2¡·b ’¥$ƒ\È9\é…m½`¯mOe=OÀ>\"ÌŸa±È“£\çÿ\0Y.§\r´µ²²:)\n\Èú`÷«\"u·)\à¦cj*Ÿº\ÈJ¬\è\0ù±Ö \á˜PZ2\ß#Ÿ¶k\å\Æ\èXˆ\áÀ\ì\r7v\ßùF\0šË„\ãú9¤VPAVŠ ô]\Ìû’Z¼©\è3^Ûœ‰q+øj-…\ÌVHQ\éô®P½\æ/;Û~\æ±ô[¢6´\ás\0}|§›¨¥MiMGS«;“´©e\Æ\Ñe(5ú\×Á\Ğı)R©†\êµ\Ú7\Æ>”A ?Iaÿ\0\\)R¦\ÊS\Õ\éÂŸ\çE£\Ú\Èı\ÅV§¹~š·ş\ÒWî¦•*\Ü7°o%\Ï\Å{_ª‰\Ó?§.ÿ\0k÷ª3Š¤ò¿³ÿ\0\Ü)R¥M\ÛğL‡q\Éq§üŞ£úöÿ\0xTfış©ıª¥J¢‡ıŠ{»!B\Æü\í¿øh©\ë\'òD\ßõ—ûÔ©U3ö‚ó6U¦‡şW¿¾¿eE{C8]Cıtoı»t©U£²y ¼\Î\Ø\åõOl¿š\Æş³ş\ÓZŸø4¾%f¶\Ív•*,\'µ<Š?\Ä?l|>Š\Ç\âó“Ñ¿\îE\Û÷¢\Ô7¿?¸bc÷“J•%ÿ\0»g®+Ÿ\í\Û\ÉK\éÿ\0Ğ™\Ô#ö\nşó=£¿«™ÿ\0(R¥O\Ú]\ÉN\Øsú/Ï½Qù¢~”\ëMÿ\0$\Åÿ\0ZT¨\åØª\Û\Ø…óó\ä©\\\ßüÁ?AJ•#üA7M.¿›ıô©R M/ÿ\Ù','Foo','Bar',43,'Male','09876785554','Cuenca',NULL),('U0008',NULL,'Keith','Foo',21,'Male','09386508693','Ibabao',NULL),('U0009',NULL,'foo','bar',20,'Male','09386508693','Cuenca',NULL);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRole`(IN UID varchar(255), OUT Role varchar(30))
BEGIN
	Declare dummyRole varchar(30);
    Declare test varchar(30);
	IF (SELECT count(*) from admin where admin_id = UID) > 0 then
    Begin
		Set dummyRole = "Hospital Administrator";
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

-- Dump completed on 2021-11-12 11:36:44
