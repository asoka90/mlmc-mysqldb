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
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user_profile` (`uid`) ON DELETE CASCADE
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
  `bill_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prefix_id` varchar(1) NOT NULL DEFAULT 'P',
  `patient_id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `doctor_id` varchar(255) NOT NULL,
  `consultfee` int NOT NULL,
  `discount` tinyint(1) NOT NULL,
  `medical_prescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES ('20211112000001','2021-11-12 03:30:24','P',0004,'U0002',1000,0,''),('20211113000002','2021-11-13 00:55:39','P',0005,'U0006',1000,0,'foo x2 \nbar x1 \n'),('20211115000003','2021-11-15 12:41:52','P',0010,'U0002',1000,0,'foo \n');
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
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `user_profile` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('U0002','Resident',NULL,'Hired');
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
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_history`
--

LOCK TABLES `medical_history` WRITE;
/*!40000 ALTER TABLE `medical_history` DISABLE KEYS */;
INSERT INTO `medical_history` VALUES ('P',0005,'foo','bar','2021-11-13 00:57:08'),('P',0010,'foo','bar','2021-11-18 08:22:26'),('P',0019,'foo','bar','2021-11-18 08:24:11'),('P',0013,'foo','bar','2021-11-18 08:26:28'),('P',0009,'UTI','Positive','2021-11-19 07:09:38');
/*!40000 ALTER TABLE `medical_history` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('P',0006,'mary rose','smith',21,'Female','1998-11-19','09980876','Cuenca'),('P',0007,'Jackson','Homenick',31,'Male','1983-12-26','1-861-611-1185x','8968 Gulgowski Pine\nNorth Elmerbury, LA 38857-2388'),('P',0008,'Carley','Crist',111,'Male','1998-08-10','05417799166','335 Pouros Course\nEast Darien, NC 39296'),('P',0009,'Joshuah','Buckridge',94,'Male','1994-01-25','610.677.0712x73','18586 Lyda Forks Suite 947\nMcDermottton, ND 78110-1236'),('P',0010,'Brant','Stiedemann',117,'Female','1998-11-06','1-072-375-6463','21156 Medhurst Ferry Suite 132\nSouth Pearl, FL 29274-0900'),('P',0011,'Demarco','Luettgen',22,'Male','1988-04-03','+42(7)371848021','47327 Boyer Port\nMayertfort, AK 23947'),('P',0012,'Gerson','Bradtke',83,'Female','1999-06-17','1-023-382-0750x','504 Nolan Prairie Suite 673\nEast Caden, WY 77538-0678'),('P',0013,'Ewald','Harber',35,'Female','1997-10-06','460-519-9327x58','3554 Billy Spurs\nO\'Reillyville, AZ 40991-8029'),('P',0014,'Marcos','Smith',61,'Male','1988-06-07','791.072.9279x52','6106 Hiram Parks Apt. 513\nJavonteview, MA 00021'),('P',0015,'Silas','Walter',1,'Female','1993-03-20','1-877-802-6237x','21615 Green Stravenue\nJosianeborough, ND 53633-5900'),('P',0016,'Marian','Ledner',117,'Male','2013-12-30','1-283-197-8637x','48462 Raquel Extensions\nNorth Veldaland, RI 15357-0436'),('P',0017,'Ana','Wilderman',92,'Female','2014-01-16','698-722-2822','336 Wintheiser Trail Apt. 607\nNew Manuelberg, MA 48301'),('P',0018,'Sydnee','Bode',122,'Male','1994-12-25','+20(2)254566020','785 Koss Stravenue Apt. 338\nLake Jessicamouth, KY 33404'),('P',0019,'Eleonore','Doyle',74,'Male','2001-07-27','+64(9)737436364','108 Angel Forks\nPort Hiltonview, IL 29726'),('P',0020,'Elton','Corwin',30,'Male','1973-01-19','(471)852-5949x9','6264 Eldridge Land\nWest Jevonburgh, NC 40316'),('P',0021,'Elissa','Bahringer',131,'Male','2021-10-10','111.967.6420','280 Mertie Pass\nCarlieside, NM 55613'),('P',0022,'Kendrick','Armstrong',139,'Male','1973-05-10','1-857-580-4957','3730 Estrella Ferry Apt. 618\nKarianeshire, DC 01541'),('P',0023,'Alex','Hamill',140,'Female','1991-12-12','555.285.1615x62','77918 Oberbrunner Stream\nGerholdside, WV 28581'),('P',0024,'Tomasa','Wiegand',105,'Female','2011-07-07','1-695-041-5633x','3421 Katarina Corner Apt. 058\nWest Vena, VA 82407'),('P',0025,'Mathias','Flatley',123,'Female','2001-08-21','1-828-973-8338x','550 Joseph Corners\nFeilberg, NY 84937'),('P',0026,'Ethyl','Lueilwitz',24,'Male','1989-03-21','(985)012-9024','960 Bergnaum Burg Apt. 931\nJulietmouth, AR 33841-6964'),('P',0027,'Anika','Mraz',31,'Male','2014-02-06','1-463-487-8377x','665 Eunice Run Apt. 307\nWest Verona, MN 01918-6886'),('P',0028,'Alicia','Sawayn',3,'Male','1987-06-09','930.521.9373x98','95703 Witting Road Apt. 671\nDonniefurt, AL 32762'),('P',0029,'Raphael','Effertz',68,'Male','2017-07-19','(036)390-2673','8762 Kaylah Spur\nColeberg, NJ 96980-0095'),('P',0030,'Lewis','Smith',48,'Male','1991-10-10','1-249-364-1567','0309 Maggio Manors\nRamonaside, AR 74702-2234'),('P',0031,'Myah','Stokes',7,'Male','1985-08-25','(080)037-6402','4557 Hegmann Spring\nBlandaville, MA 86653-2252'),('P',0032,'Benny','Kuhlman',49,'Female','1987-01-24','1-045-208-2102x','8246 Julian Forks Apt. 401\nLillamouth, IL 65724-1473'),('P',0033,'Gilberto','Heidenreich',41,'Male','2011-09-14','583.601.8608','4058 Reilly Place Suite 176\nNorth Myronmouth, DE 36486-1334'),('P',0034,'Adaline','Mraz',42,'Female','1990-02-19','312-902-3226x33','331 Gerlach Plaza\nEast Leon, FL 41079-7092'),('P',0035,'Lorenza','Crona',94,'Male','1991-02-09','+12(6)751621989','31424 Dooley Spring\nAlenastad, MN 55202'),('P',0036,'Jammie','Waelchi',46,'Male','2001-04-22','010-112-5986x23','6702 Valentina Villages\nBarrowsfort, WA 26021'),('P',0037,'Andre','Von',50,'Male','1987-09-29','+63(0)729202376','84133 Ophelia Vista\nTerryton, WI 70038'),('P',0038,'Madisyn','Hirthe',119,'Female','2003-08-07','1-125-049-4587x','216 Nitzsche Alley Suite 162\nGiovaniberg, RI 71749-7142'),('P',0039,'Simone','Osinski',68,'Female','2011-03-29','779-418-4877x81','7836 Dario Loop Apt. 726\nLake Lydia, MO 64190-1638'),('P',0040,'Josiah','Witting',71,'Male','2012-12-11','193-618-0715','088 Nader Shoal Suite 205\nHeaneyside, WI 24607'),('P',0041,'Magnolia','Greenfelder',135,'Male','2021-08-14','751-818-0343x69','81184 Ebert Rest Suite 152\nRoobmouth, NM 49738'),('P',0042,'Oren','Rippin',21,'Male','2009-06-04','1-839-690-1561x','701 Dare Forks\nHayleehaven, MS 72458'),('P',0043,'Nicholaus','Gerlach',0,'Female','1976-07-21','(839)371-5063x6','125 Kelley Forges Apt. 076\nEast Idella, AR 26607'),('P',0044,'Mae','Runolfsson',39,'Male','1984-01-04','1-675-115-8607x','652 Brett Manors Suite 614\nManleyhaven, SC 14901-4883'),('P',0045,'Elenora','Bogan',64,'Female','1979-02-07','982-274-0727','456 Sawayn Burgs\nMurazikfort, OR 18306'),('P',0046,'Leda','Lockman',43,'Female','2002-01-31','00698348825','661 Felicita Meadow Apt. 243\nPort Ima, MN 83558-9806'),('P',0047,'Serena','Johns',135,'Female','1983-01-05','1-729-607-1600','56301 Owen Valley Apt. 820\nDaxbury, UT 84839-6863'),('P',0048,'Dylan','Miller',119,'Female','1984-11-05','(183)739-9281','92043 Gene Prairie Suite 514\nOtisfurt, WA 49340'),('P',0049,'Aglae','Hodkiewicz',68,'Male','1981-01-29','1-424-702-0186','4134 Moises Radial\nLake Abbiemouth, CA 68929-3434'),('P',0050,'Whitney','Bailey',113,'Female','2021-10-19','1-746-098-9500x','183 Bradford Viaduct Apt. 245\nNew Alexis, VT 05883-0626'),('P',0051,'Jacky','Mertz',38,'Female','2001-07-12','151-547-9590x53','15224 Alfred Corner\nLake Ethelynhaven, AR 23392-1825'),('P',0052,'Madyson','Stanton',18,'Female','1993-02-13','(514)468-0283','04416 Kirlin Lock\nSouth Araberg, MD 55394-4833'),('P',0053,'Dolly','Schamberger',77,'Male','1971-10-18','865.423.7482','281 Satterfield Villages\nDurganberg, NH 92569-8355'),('P',0054,'Lillie','Funk',4,'Male','1995-06-30','473.520.1642x89','864 Ortiz Ranch Suite 242\nCathrineville, NY 22000'),('P',0055,'Raphaelle','McKenzie',71,'Male','2003-07-23','1-212-558-3776x','6017 Ashton Mill Apt. 279\nNew Lukas, NE 03599'),('P',0056,'Charity','Huel',69,'Male','1991-01-06','1-720-870-6542x','2918 Bogan Land\nPort Nilston, NM 04736-1869'),('P',0057,'Florine','Jakubowski',6,'Male','2013-04-10','610-546-4556x34','2670 Daphne Fields Suite 247\nWest Kaylahmouth, IL 02689'),('P',0058,'Thomas','Mertz',1,'Female','1984-07-29','(299)191-6330x5','39525 Tromp Streets\nHarveyport, MO 63297-8921'),('P',0059,'Marjolaine','Feeney',125,'Male','2000-10-13','362-063-2947x31','887 Bednar Creek Suite 412\nLake Callie, MD 51458-2453'),('P',0060,'Theresa','Luettgen',93,'Male','1991-10-19','974-761-3926x31','4416 Ila Streets\nEdnastad, NV 10163-3840'),('P',0061,'Furman','Lind',88,'Male','2002-02-28','(025)441-9060x4','01560 Alicia Orchard\nJacobsbury, NV 92071'),('P',0062,'Rod','McCullough',32,'Female','1990-03-09','+08(6)476102707','61653 Kerluke Lights Suite 024\nPort Lina, NC 23896-7438'),('P',0063,'Tabitha','Reilly',37,'Male','1971-04-03','1-662-271-0020','4726 Erdman Plains Suite 131\nMohrville, DE 82031-1869'),('P',0064,'Clair','Jast',64,'Female','2017-03-29','828.839.1680','41280 Sydnie Forest Suite 137\nShannatown, SC 58225-3912'),('P',0065,'Savanna','Sauer',107,'Female','2010-09-20','317-219-8426x36','5706 Bosco Manor\nLarueside, CA 71518-8169'),('P',0066,'Aiyana','Beier',87,'Male','2008-10-05','301-216-3041x74','403 Louisa Loop Suite 742\nKundemouth, MS 12740'),('P',0067,'Margret','Kassulke',34,'Male','1995-04-24','905.717.6152','0401 Jerrold Walk Apt. 724\nNew Kelsiland, NJ 41830-2568'),('P',0068,'Christy','Muller',70,'Male','2003-11-15','(394)073-9491','373 Neoma Trace\nEast Zettaville, FL 30441-3383'),('P',0069,'Adolphus','Willms',18,'Female','2021-06-13','1-432-637-9602x','733 Kaylin Courts Apt. 071\nWest Dianna, RI 93525'),('P',0070,'Cary','Casper',66,'Female','1994-02-19','03314359568','9980 Gibson Row Suite 496\nStephanymouth, FL 56035'),('P',0071,'Jon','Kunde',27,'Female','2001-10-12','(065)330-4495','7999 Macy Crossroad Apt. 943\nWisokyton, MO 58103'),('P',0072,'Carol','Lynch',21,'Female','2013-06-11','1-677-767-2569','178 Walter Port\nSouth Lewis, RI 73047-6105'),('P',0073,'Bret','Stamm',63,'Male','2016-04-22','956-008-7627','9514 Christiansen Isle\nAlizeburgh, KS 91162'),('P',0074,'Valentina','Wyman',21,'Male','2018-05-03','+21(8)184133324','668 Linnea Well\nBartolettiborough, WA 73477-3795'),('P',0075,'Nikko','Littel',107,'Female','1971-07-04','975.405.2875x99','20347 Botsford Forks Suite 809\nWest Gerardo, PA 12518'),('P',0076,'Eryn','Trantow',81,'Male','2010-04-05','870-543-8679x04','7654 Lynch Mews Suite 837\nKendraton, MS 77962-0554'),('P',0077,'Zula','Graham',70,'Female','2018-04-29','688.476.9684x17','15225 Boyer Wells Suite 519\nLehnerborough, NM 77621'),('P',0078,'Mckayla','Berge',70,'Female','2018-10-28','079-213-9464','3691 Hammes Gateway Apt. 981\nSchmelerton, RI 02932'),('P',0079,'Kieran','Farrell',2,'Male','1994-06-17','1-599-999-7538x','18224 Shields Village Apt. 138\nPort Kimberlyport, ID 73560-0336'),('P',0080,'Peter','Crona',42,'Male','1983-10-05','1-162-298-5815','825 Vernice Prairie\nLake Justina, MN 65972-4282'),('P',0081,'Alison','Sporer',132,'Female','1971-05-08','(386)247-3601x9','286 Schultz Forks\nNorth Kaylah, MI 35204'),('P',0082,'Diana','Reynolds',89,'Female','2016-02-08','(682)469-4098x5','46253 Hilda Knoll\nJacobsfurt, KY 82889-7072'),('P',0083,'Annetta','Sawayn',41,'Male','2010-09-14','568.342.2207','8517 Amelia Gateway\nWest Columbustown, DE 71923'),('P',0084,'Emely','Legros',23,'Female','2002-09-09','1-694-143-6443','45672 Kendra Freeway Suite 446\nHeidishire, UT 57796-1645'),('P',0085,'General','Kunde',73,'Male','2010-07-07','+80(6)398862672','12437 Doyle Lodge\nBergnaumland, MO 11890-1311'),('P',0086,'Lindsay','Yundt',99,'Female','1989-04-19','+24(7)219723794','23817 Fritsch Island Apt. 941\nNorth Duncanview, SD 59782-4487'),('P',0087,'Lauriane','Stroman',28,'Female','1988-09-10','265.573.4091','187 Kling Keys\nJoshuahport, IA 17803-0499'),('P',0088,'Weldon','Roob',127,'Female','2009-12-07','575-344-4274x14','23047 Terry Inlet Apt. 336\nBenedictbury, HI 33192-6147'),('P',0089,'Polly','Pollich',40,'Male','1985-01-02','1-370-503-2439x','94097 Cormier Shoals\nNew Magali, SC 91660-5189'),('P',0090,'Wilhelmine','Little',132,'Male','1994-08-24','910-121-7710','72521 Albin Light\nSporerfurt, IA 08876-0325'),('P',0091,'Stephania','Hyatt',0,'Male','1984-07-19','+19(4)987952776','443 Bernhard Stravenue Suite 245\nHobartmouth, NE 32070-0877'),('P',0092,'Mittie','Parker',20,'Male','1990-05-31','(078)905-5711','304 Crawford Viaduct Suite 534\nVonberg, NE 07153'),('P',0093,'Amely','Mann',75,'Female','1976-09-21','829.212.8111x64','33763 Isac Isle Suite 508\nNikitamouth, MS 79762'),('P',0094,'Carey','Schuster',87,'Female','1982-04-24','04989995163','51413 Vivian Bypass Suite 335\nJimmyshire, OR 10399'),('P',0095,'Dakota','Jones',84,'Male','2005-06-04','389.168.3891x87','4615 O\'Reilly Ports Apt. 782\nPort Wiley, NE 61017'),('P',0096,'Jovanny','Beahan',125,'Male','1975-09-24','1-964-088-7706x','6126 Corwin Mission Apt. 638\nPort Raheemstad, AZ 77829-8158'),('P',0097,'Modesto','Klocko',56,'Female','1990-09-19','(002)257-2765x6','48166 Turner Cape Suite 966\nEldoramouth, PA 97370'),('P',0098,'Noe','Runolfsdottir',133,'Male','1996-12-21','412.645.8517','8749 Keely Vista\nPercyshire, GA 02801-4757'),('P',0099,'Annie','Nitzsche',59,'Female','1985-11-29','503.813.6076x91','31172 Summer Greens Apt. 078\nAugustinemouth, CO 57848-8724'),('P',0100,'Ronaldo','Bashirian',127,'Female','2000-12-05','1-224-244-0420x','4038 Retta Unions\nSouth Amara, NH 05291-5555'),('P',0101,'Estrella','Johnson',106,'Male','2015-07-17','793-883-2018x45','0121 Olson Divide Apt. 187\nBoyerport, MN 56396'),('P',0102,'Nathanael','Smith',72,'Female','2019-07-31','1-878-914-9997','81797 Jody Isle Apt. 996\nPort Kariane, ND 08127'),('P',0103,'Alivia','Padberg',98,'Male','2017-07-20','(419)667-5861x7','3174 Sauer Roads\nLake Friedamouth, NV 65271-9548'),('P',0104,'Loyal','Lueilwitz',62,'Female','2013-04-20','186.317.7199x42','86618 Koch Ports Apt. 433\nEast Karsonbury, SC 47098-9342'),('P',0105,'Ricky','Kiehn',79,'Female','2005-02-20','963.263.6802x84','1069 Raul Wall\nLindgrenport, NV 00189'),('P',0106,'Shannon','Runolfsdottir',3,'Male','1970-01-30','(062)109-6598x9','89493 Jones Hollow\nWest Frank, NH 83298-5449'),('P',0107,'Kailee','Harber',87,'Female','2020-10-19','1-013-549-7619','7948 Jacobson Shoal Suite 618\nEast Manuela, IA 97079'),('P',0108,'Arnold','Dicki',92,'Female','1984-08-16','1-951-391-5644x','7778 Breana River\nJonasstad, NM 83555-0373'),('P',0109,'Yolanda','Harris',104,'Male','2018-02-10','+52(7)098289768','710 Dorothea Ville\nLeonorachester, NJ 65008-4025'),('P',0110,'Isabel','Kemmer',2,'Female','2005-06-07','432.042.7967','4504 Gerardo Mountain Suite 189\nSouth Demarcoland, CO 36496-3710'),('P',0111,'Grover','Mueller',58,'Male','1972-02-28','1-274-230-4074x','3908 Valentina Village Apt. 116\nNew Enriquehaven, MT 62671-1360'),('P',0112,'Theodore','Grady',112,'Male','2005-12-19','926.483.4221','77193 Wilfrid Wells\nSouth Susiestad, VT 84224'),('P',0113,'Jamil','Graham',60,'Male','2003-09-04','551.355.8036x00','02067 Dare Meadows\nNorth Bailee, SD 57122-6532'),('P',0114,'Karlee','Lehner',136,'Male','1979-03-11','(367)207-9730x1','77539 Rosendo Drive Suite 431\nFlatleyport, OH 33464'),('P',0115,'Maci','Bechtelar',130,'Female','1974-11-26','(936)322-8099x2','940 Homenick Light Suite 302\nNew Kamille, OH 50111-9822'),('P',0116,'Jacinthe','Wiegand',13,'Male','1988-05-17','1-715-871-7698x','235 Roberts Hollow\nKilbackborough, AK 68859'),('P',0117,'Kadin','Tromp',57,'Male','1997-06-03','680-627-1860','262 Kreiger Points Apt. 361\nDuBuquefort, VT 26830'),('P',0118,'Kayden','Conn',103,'Female','2002-02-16','1-815-104-2833','463 Borer River Apt. 419\nPort Winifred, WA 76921'),('P',0119,'Kenneth','Jacobi',101,'Male','1995-09-28','835.422.9907','73494 Nikolaus Lake Apt. 890\nRyanbury, DE 86386-8955'),('P',0120,'Elisha','Leuschke',77,'Male','1978-07-30','+11(2)359460156','21639 Hoyt Radial Apt. 860\nWest Edenmouth, VA 87448-7016'),('P',0121,'Hilbert','Greenholt',137,'Male','1990-02-14','1-866-409-7141x','256 Medhurst Path\nPort Aliyatown, FL 07209-9739'),('P',0122,'Alda','Breitenberg',79,'Male','2001-05-02','1-121-951-6212','92601 Scarlett Fort\nAuerbury, WV 94753-8800'),('P',0123,'Minnie','Ullrich',128,'Male','1976-12-09','1-690-240-0222x','00764 Adela Road\nIleneville, AR 85384'),('P',0124,'Shane','Krajcik',123,'Female','2006-01-11','172-645-5188x60','978 Ransom Wall Apt. 923\nNew Kaci, MO 25200-3245'),('P',0125,'Kailee','Wisoky',7,'Male','2008-05-20','1-368-395-7385x','025 Wolf Glens Apt. 401\nNorth Isaacside, FL 18648'),('P',0126,'Veda','Treutel',126,'Female','1973-07-28','766.891.5948','84930 Jennie Ranch Apt. 352\nLemkehaven, KY 18651-4521'),('P',0127,'Gust','Grimes',9,'Male','1980-07-18','385.218.5380','01913 Graham Light\nSouth Loma, GA 59624'),('P',0128,'Enoch','Kertzmann',5,'Male','2021-04-19','04306491403','7550 Bergnaum Springs Apt. 165\nNorth Toni, SD 95029'),('P',0129,'Mateo','Reynolds',72,'Male','1993-06-17','847.366.0395','36717 Hazle Streets\nEast Violaport, TX 62842'),('P',0130,'Xzavier','Schneider',90,'Female','1992-12-07','+77(6)494146018','15277 Schamberger Shoal\nWilkinsonberg, ME 69010-8554'),('P',0131,'Roberta','Gislason',140,'Male','1993-06-02','(524)634-8972','71325 Bruen Road\nRociohaven, CT 91430'),('P',0132,'Ursula','Kassulke',68,'Male','2001-07-26','1-735-340-9632','197 Mathew Turnpike Suite 453\nNew Jayson, CT 63148'),('P',0133,'Bonnie','Herzog',127,'Female','2004-03-07','1-880-992-5573','04054 Uriel Summit Apt. 769\nEast Margarita, RI 69502'),('P',0134,'Lea','Kunde',4,'Female','2013-10-27','1-266-687-6586x','4469 Freida Ways\nHarrisside, OR 27521-9578'),('P',0135,'Asa','D\'Amore',137,'Female','2008-03-03','1-406-257-3042x','019 Verda Inlet Suite 120\nWest Brandyn, IL 58642'),('P',0136,'Josiah','Goyette',47,'Female','2016-01-05','201.034.2867x17','023 Vinnie Passage\nWelchshire, IN 34663-4684'),('P',0137,'Emely','Glover',7,'Female','1990-09-10','1-713-715-1203x','79509 Everette Fork\nLake Elinore, ND 87341-4236'),('P',0138,'Kelley','Keebler',122,'Female','2021-05-16','+26(4)356801068','4516 Marcos Road Apt. 465\nSouth Tre, KY 89526'),('P',0139,'Ova','Kirlin',131,'Female','2015-08-08','917.594.8807x63','0978 Kristy Mall\nCadenshire, OK 34552-9140'),('P',0140,'Flavio','Ferry',59,'Female','2005-09-25','(514)924-8065x6','144 Brekke Fields Apt. 204\nBridieborough, NY 13058'),('P',0141,'Kallie','Watsica',101,'Female','1985-06-19','09361404850','068 Will Route\nIsombury, PA 24658-9514'),('P',0142,'Dixie','Gaylord',19,'Female','2015-06-23','379.502.0898x17','3649 Salma Knoll Apt. 440\nNew Alysa, IL 36869'),('P',0143,'Otho','Bailey',82,'Male','2014-11-19','291.087.0659x48','0192 Morar Orchard Suite 054\nSouth Christa, RI 74382'),('P',0144,'Golda','Abshire',9,'Female','1987-04-13','1-532-376-0529','335 Nick Keys\nSchillerview, SC 91789'),('P',0145,'Judson','Rau',125,'Female','1974-06-16','791.508.8635x11','640 Martina Circles\nLueilwitzmouth, GA 13432-2570'),('P',0146,'Alvera','Tremblay',72,'Male','2009-01-16','1-005-159-6906','791 Nya Ramp Suite 924\nBlancahaven, VT 21305-2869'),('P',0147,'Leon','Tromp',53,'Female','2013-02-04','(939)993-0740x3','49173 Johns Crossroad\nStefanport, VA 91844'),('P',0148,'Lorena','Reynolds',25,'Female','1998-02-05','(113)392-7317','1106 Trent Parks Apt. 923\nCaitlynville, VT 25583-7432'),('P',0149,'Nola','Prohaska',107,'Male','1993-06-23','(036)068-6518x5','1641 Karl Cliff Apt. 313\nPort Leilamouth, DE 81428'),('P',0150,'Reggie','Zboncak',124,'Female','2018-03-23','(544)550-6446','595 Hayes Springs\nPort Wendy, PA 09453-0326'),('P',0151,'Nona','Watsica',29,'Male','1973-07-07','+22(6)528220104','96117 Upton Passage\nNew Adrielshire, LA 33639'),('P',0152,'Osbaldo','Pfannerstill',38,'Female','1992-04-14','1-547-587-0637x','98622 Quentin Mountains\nSchinnerview, AL 91287-7419'),('P',0153,'Melyssa','Maggio',65,'Female','1981-04-15','(878)604-7499','279 Okuneva Key Suite 228\nLamontton, DC 75046'),('P',0154,'Kevon','Powlowski',139,'Male','1994-10-22','665.952.9205','3833 Malachi Extension\nSkilesberg, AZ 97214-4526'),('P',0155,'Preston','Bailey',133,'Male','2004-12-14','918-600-0040x19','9247 Ward Walk Apt. 587\nEast Sister, CA 38054-0735'),('P',0156,'Audie','Weissnat',38,'Male','1987-06-06','813.446.3928','0503 Vance Stravenue\nLake Clarissa, NJ 04844');
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
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` varchar(255) NOT NULL,
  `date_hired` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('U0003',NULL,'Hired'),('U0004','2021-11-19','Hired');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
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
INSERT INTO `user_account` VALUES ('U0001','admin',_binary '$2b$12$95Ws96WC0ETKTzn.hzRP3u/JuFyo/.KajZks7tByGuNX8wsNwtoXW'),('U0002','doctor1',_binary '$2b$12$95Ws96WC0ETKTzn.hzRP3u/JuFyo/.KajZks7tByGuNX8wsNwtoXW'),('U0003','nurse1',_binary '$2b$12$95Ws96WC0ETKTzn.hzRP3u/JuFyo/.KajZks7tByGuNX8wsNwtoXW'),('U0004','staff2',_binary '$2b$12$fnE8WimudHOUeX40FB1IVejAEc9ndDah.gLK6f863FsVhXOvehPsq');
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
  CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_account` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES ('U0001',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0•\0\È\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0A\0\0\0\0!1\"AQ	2aq#B‘$Rb¡±\n3rÁğ%4C‚\Ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\09\0\0\0\0\0\0!1AQ\"aq2±#BR‘¡Á\Ñğ\áSbcr\Òÿ\Ú\0\0\0?\0ZZ\Êô‡\éı´½$ÿ\0\ìk®UÀ±c\Ö,#YYœ\Õ\"–\åe¥zo1\á\ŞÄ«B‡\n+‘ó«~R³ºÀµ\ä8”B¢\ß1]Dˆ\èCM\ÔGjS\Ø\âRBC‡\0¥\\ŒªWp\Ø~E\Å`†ÁXR”¿\n\ÇÀÆ¡v\År½·U\Æ\î‹eK@…¨¶¬« ä‚œ\ëŒ;o\í¹D×¬ª˜\â›S)\nùV9¥^¼£¨û#\Ğ\ÔzÖ†}Sh\â\ï	\æ’6PşbÑ«Òª”šÃ´ª¬u³-•­¹,¸0¤­´\ä|\Ğ\é…0A÷Œ[i—mõ[h\"ôµ\Ô\ÚoxM†\ê;MQ´\0|º”>Wù|\ãUk\ì/¿Ü…£§#µYƒy‚0y\ã]\ÙÖ¿¥\ë\Ú\"f\ÙPK¢\İ\â9¥Gøó„^²ÑµU2³	ğª\å*(õ\Ôo¥¤¤w}5õ\r8\à\nBr	À×©/Àu•Qœ—\İ[)o{”N?S¡\ßq:\çz\ä¼F\Öt•aË¾+\îtøÀˆ=İ¥Eyø\ç’P‚|)^4eQ©JSš*y`\Êùı7÷\Ú%)\ÓUp4›ƒÏ—ë·¶ñv^7Å‰b\Ñ\r\É}Ü±i°Z$ı\âSİ€c\ÉO‚¢<`}u^lGTbõ{\Ë{\ìñ¡Umh3\Zv\ìWÁ‹¤…¥œ…N{\0Qúöj\Ç\Ùo²B5÷X…¾_h\r\ã&ö¯­±÷;6<…&™8RPò@Oª{H\ÊRcÁõ4Hn]B\Ğ\Û+2-»nS\âR£AcÑ‡O†0\È\à6\Úp001œr¹‡_v\Ôó\År´“ƒ\ç\ç=%Ù”³<3f\äf\ÑVô¥\ÓF\Ãô©¹.u¹µ‡7—u\åI2\å^·\Ò0\Ä»¸ª3Z›i^;V¯Q|pQÀ]‘ö­4\'2.\Û}•¶RC‰R	?\ê\ä¯r\ß~zÈ·¶~I\Ö\Íbk?z\è\Åq+C$\ã#\×H\å \ä`‘DûGzuªR\×=‹\×\Òd®p3Á2~F|ó¤su\r\\\â¾)$¨z{\Ãq\Ê]€\Ù£¿ô.¯ö«aú½¸ôº4&=U\Õe†‚”)\\,ı1’~š·÷í†±¨J·6\n\Ír¹-³\Å\ê\è[p\ÒG…!\Ş\ç\×9H\×3¶‹\í\ÚJERe#üeI«S”“±HrZÃ €I\Üğ¡\àüè˜¶6k:\Ûg/Î•o—dTÁ™jÕIÿ\0kŒ).ü‹ö«y\Ów³ıO¦¦fD¾¡m\Ãk†ıü\ái­hu¹V;\Ú:‚“\Î\ÙXòP\Òş\Ñ±w;yã’¥©DµM\\¾\æ”\äÀ×€8ó’_[ö\Û-»´\à\Üm\Ç\Úú5M RU*c‘\\ÿ\0\"’´\ç<ùĞƒS \Ö(µ)4š\Õ2D)\İô¥F˜\Ém\æ\\\çØ¤”>¦G:\ÆSJI\ÂNu\Ón\é=1?.’†RE<úD!š¯Vd\Ş%N+&\ÄV\Şğ@}¥{\í_Q;}··­»gU\éW%‡Áª÷TZiÆ„U«\Ñy=\èW’“Œg\Ö\Ï^=3\í\äl\İ\Ç\Ü\æ©X\Í!^„ªl‚N 8\Ø\nB“\ìR<smvŠ\Ï\İ?\Å\è[Nõ\éK‹0jªˆSŠ=§\Ô@*\nHN@HòFŠ›ÿ\0¤KOw-\äVÜ©¿O«¦‘\Z<\ZŠ_RĞ°\Ëe\r‡{€.qÛ•\ZS\êiZUa4…¸´¤fü’O(cP\éÚ®¤É¬°„+‰$[™Oş`½6ÂŸw¨*\nR\0?Àyı;5®}§ıÑUuPP<®ŸI\èW\ì{÷\×.÷/iom¡¹Â›‹G,Iô»\âº\ÊÊ™”—[P\áI<qÂ‡\È\Ôxµ\ê\'!ps\Èö{E›h<\ÜÂ–ƒ\Ò\Ç\ésºÖ³(¢ÓŒ¥7\é¾~\Ùİ£§\Å\Û\Ë¹Vw°\âL\ïN#J?@=\êúh~\İµªÁap\í)t{N3”\'ğØªrCc\ë\ë8O8ÿ\0JF†²\Êq„ÿ\0\ÓI,\ä\çúhOB\é\ÙK\ïÿ\0mÿ\0¨›\ÕÉ£—8GD\í\\w\ÉwUİ¯\İwº´÷ğ_5\å-ÅŸ\İDœ\ã\è°‹.\ÜS\Ç\ï§V\Ù\îö§8·¦ŒZm))\0@\à\ã¹*QQ=c$/ƒ¥¬•2\àÿ\0Æ–¶q&>£Ş—ò“YwG\×ş5\åq‡¤ÿ\0mhJ€PõõÃƒxŒ\îeU¿©U$V§·\Ó/Le÷\Zk»Ş¦\Çú€\Ï\×:‡Pjt\é0‘6Ü½\å\\1S3%\Òj1‚jŒ¬U\nJGq(”‘\ÈNÎ§÷½\rrÏª\Ğ\êO)¸ò 8—CE^ˆ\í>\â‘Ê¸ø\Z‡\×\×Õ·\Ò\Û{\"¿*‰D\Ëõ\ZePõx\î$>\Ãi)=íµ»”«ò€S\åC\\Ûµ…W›p§+n\äô¶6\ç?\Ø\Í~yŠQ”(Û­\ÄH\í\n\ÍÍ´µö7\nÎ’©0•\Ø\ë­\ÇÏ¹\n‚1õı‚N<\ë¬¾ºp¥3v\ÜDŸt\î}ZG\İ\æÙ¶\Ì5H/\È\í[‹@!§\0¡!k_œ“ªşñ\Ú>¤·–<½°³o8¶¥ŒÜ‰\rş-5æ„·Z	\n\Â{=½½¨Â‡$j_ÓÀZ]\\±î­ ·—Q¨ºB&T\êJ\ê+<Rñ\á¤,Œ(\0<“\çIM=5¥+È™Z˜P<-7rÿ\0\É\Ê\Ã{u†Æ·¤JjJbÙœBZi²\Ş8@±\ï~G\Ê**6\Âõ\Õe6-oªJ«\Ö\Õ=¹^ªlZ4À\Ù<\å)x‚H8şU+	\Ñ]\Ñ\çO»qg\\\Ñm]½² À¦S\ÒgKˆ\Ë\\IZU„)\Âyq]\Ü\åYÔ¿x\ìj\Ôæ·®\ßf\Z©\ÕVš¬\Zsº™3·$,\'Mg+O´“<ks\ÒC(=T…\0¡Mh(ƒ\È÷sıF»±Ra}?Tm|¢\Îq|\èR±byglG)È²÷ùƒr\n 2\á\áùUl‚:\Üo\Ò,»–\ì¦P 9^«Nz<Rµ—$ˆ\Ëw\Ñ@8R\×é¤¨s\ÈhûC:·\Ù\ÓQfŸTf‹pSbE.2\Ó›+J¿\Õ\ÊI\ç<Œ\è˜\ëu¯[ngÓ¶\Î[\ë\ÎR\\\Çæ­¤\Æ\ï\ç¿\Ôü\Ç?\0]p§ª\ç\êp÷{[\Íw.Lõ-Æ»X\Ö\Ş‘(\à¦uÉšz•ö³…\Å+ \ïx\èi\ÇÌŠ~[!ı\Ş\ßkYÊ‹\ì\ì…B\ë¦úò•ë°º\Æ\"òA!!	@#?—şºôùÒ¯Qe_bÁ\Ømºª\\•E>·%¹‚–Z‚\ã,„! J?®¯Ï³ ªS5\çw;ve8Í§O™\é3Lh”ª®ş(R\Ç)i\0¤’9QV»ñ\ÒE`vF\ÃfÉ³\é+B\åšdT¶\Éw#\ÉI÷«Ç’NtÀv Üˆøv.¢#\É*#ó\íüLÂ¬“·˜jtÿ\0ÿ\0d\â·X°‘X\êK©•Á¸\ä\ÇK¢e\Ó\Ô\å¼ê‡©\Æ9BR<òu¿¶~Ã®µúB¿SY\è\Ã\í\n¤3ZŒ¾\äÑªñ$\Æ ó\ØúP§Z\Ç\ÆJGï®”u_ºUZ&\Ô)\êUFE.\Øz)]n\ã#¶Z\nÂ™FP\Ê\Ç8ñÎ©Í€\ë\"©\ÔK\Ñl’úl«C¢Cy¸ukÂ¾§R=F[púò\0%Ò>s¨ML,ñ)\\ö8~—ı\â\ŞZ˜\ÊAEŠS\Ôn`F¿zª\êFÃº\ám/\Úg±Ë´n‰¦±¹´ô—©5\×‚R\Ê\ä$”`\ç	\n=\è\Ï K\È2-\Â[ğ\Z@ÿ\0¸|cÇ\ã]N¼6®\Ì\Üİ¿\İk6—pQj1\Üú-V\"Š¾9R’¤¨Ÿ\ç\È\Ğùjt›S\é\Úóiª£Åºlº›Á¹´*\àV)“Ú¦%­ER\âXw.6“Ü—³L½\Ú;šv©Y„”¦ÿ\0)\çk\æ\Ş\\¹B‡Wöx\Õ]ñ5.xˆ#‘#¨‘¹6\ÌQ§nM\ëRô¡\Âv2óCò¹üR¥gùh\ï~º0z{\ê®\ÊÜªZƒ\Ø\ÊC\Û[%n\ç\Ô\Ï!_®©\î¤zt¶7\nú¨\íĞ¦¢K”…LŸOq¾\Øò”…{š(ü ”øW\0\çB—N›G~\Ù}<\ÛŸ·›–¦\áÎ¯T©ò)ÓU÷e0\è-úNBJ¬¥_” Æ¡WN´šUJšx”~dÅ¾±sF›gFI3F«xA\Ê\\goO\Ö:}»»[eo”ºx\ÇX%R`T™÷;ü`8“ô\ç\Ü?˜h¼,ªş\Ş\\²\í²#ˆ›kA=¸Cƒùlÿ\03jÁÁú~Ú¶:_\êf\âMpÚ·]a>\Ãİ’Š\Ü9\Èığ8ı5mõ)µV\Öü\Ù-×­fE\ÉKif+¥\Ïl¨ø\Éa_NIR>ŠùÕŸf\Ú\İTY\Ó!8x[R¸H\é\èTv‰£SS–øùa\Æ\âv=G/\Úm->\ìt÷ƒ\ÊOj†<x?\Ø\ë\ÇİœŸ\í®š\â\ÄlEÁu7\È\"\Ä\r\çÿ\0x\ÒÓŸwÿ\0wük\èr	W¶³Š<á†´´\ë\Í%)\ÊNy\Ò\ÖqFp\ÆW ¿¨\×\Å4¤ı4ö¾ƒ¯P=Q!&û¤‰X„\ÓEì”¥~¯\Êûdóª\Ø\ìU\"4\Ú]m6<‹v]9—Z~­9mS)À°\ÊU%À¢T\ÚH	\n\í*>À“g¦¥%5Ù‹Sq\à\á÷h{\ĞB\Î>OõÔ—öÙ±½\r<\è«A¯¼\ÅN3\Îˆ\ÑÔ”\Ò\Ø\ÚGp\îW%DùÀÆ¹¿µ\êz+\ZÂ›\"\ã½\Ò\\IIWL\à{\í\Ù}IT]3?>\Û!Å¶¤ğ˜\ßÛœE£!t\Ú\\Kz‰Aƒ\r€\ÜU-}Ïº\ØùW\Ğ\'õ\×\ÔDm\n\îH\Ç\×İœŸ®½ö„ØTO+W\'û\ê[²;ut·=­\\®·K‚S\êH˜T\n\Ö3I´Ÿ+?ğ\0<iŸD\Ò\ZS@S¦™Jl<JÜ“\Ï;\æõG©õ½P4\ê\É$\á \ãô\Ú\ÛmÏª\ÙŞˆ¤	$²X‘Nœ–\Õù›^|ò\å:‘R\Z¢\íe\â\İ÷oOzM£VmQ%H\0)øK$+\Ò{œ÷ „”“ù:˜u\Ñ;l`3uZ[µLü6k\nTxµ\ç‹2B\Óù»JPS… ÷+°p|\çU}vN°*­†\Ş2c\Ìÿ\0+\\¤\ÉN†Á\å|“\ïğ¤/8?\Z\Z«&—XiùŠR’\ê\0}«Ø‘\É`uO\ï2ŒThó-\ËT\Ñİ­&\í/\"	\èyˆ¨úö¼7e›R«‰(L™øp0=L%6¡BğR ~yùÁ\×o\ÑQÿ\0Î“qÁZf,U$£µeD”ür5\ÛF/Ksh\Õkr­BZ§¾ò]¥\Ï{Ó‘”…÷øOr{N9\×2:ÿ\0\Û=¿\Ä;\Ûh\îõ\×)_Œ&™Tq=Fr–’¢{^<(#Œ4¡–\Ñ/\ĞB¦¥ˆr]Ë±ƒ\çq\Ê\ÛCU\Z‰›K¾’Û­Y$~}ˆ<\Ä\Zı7\Õ\ê;\Ó—j\ÛNSTf*Ii!l¸\è.:\à$x\É\0Ÿß¦®~š:Œ\Ù\İÙ¿A\éÓ¦‡\îŠüv”Šş\å\ÜugS!*e—{V·ó\Ú\Ú=0x*\Zª¶>·a]´¡i]qJš,¦;\Ì<G\0\0;GÓÿ\0:<úµ6m­\Ä\Ğv\ŞÌ§Q\İS˜[T>}\Ş~sû\èL¸\Ø}\Äğ\Ş\ç’rŠK))r\éM±\í½†¾©U‹‚«\Ó6\êS\ãÈ–…)\Æ#\Ô\"¥M\Él’¥e$\áDg\Õ\ÇnQöKefÜµ((R¢†¬\ä\0S\äg\Z>\ÑKK¨«¨˜WN\ìB§*¨\ÌFE\ß!)Q¦†\Ü\Ë\Å-œ•Ÿ\ëo¶[©vb³:y^Õ»\Æò®¼QuT\é\ÍJªªL¯h.ª3Yû®x­£³\Ú9\ÎuË¥Ió‰O°\'z\ÈU¿(¿¤t¯ M€\Ï\ÜWÜŒ…#÷\Z‡V¡Vüt$¥m/¹¥$óŸœşš\×lö\íY7­­÷\ëR¥%˜¡?\Âf¥\È\îÿ\0‘Ô¥Cö#^nM\Æj)S.¸y\r}¾¦şm­LÊ­\n-)=wû¬\Ëò±$n¦.•®5èª¢V”\Ò2#\Ê^Lw\è¼aCıZzX‚k][0_y	B¯z³ªpºR•6V\îÁ9\íÀu|}§\Õg·¥Zİ‡l\Ó^¨Tk2\â±N¦\Æ@S\Î\ÉCÁc°;]Ç€9\Î5\0Ø˜mJ\ÇXV\ên\Ú\éÕ«^µ.¯%ªm-R`H~C*d0\ã½\Éš;ùV¸p\0\ÕÖ¯·C”zd¼µ9ß¯¤/õ˜˜®\ÍÊ¶\àJ®£\Ê\Â\Øş ]srª«\İw•!\ç\â-\É\Å))(P89GŸ\î4dlR\íÍ¤¢5Mh.¥ ¥¯\É\Ö&\ëô¯·{\æÚ¬1£•7\\b×¨Ô¤6”ğ9\î#ó\'\ÊI56–D\ï¼Eª!ö“‚‚Ò¸9ş¸\'\ÓBO*mfd%\Ş\ç\Ö\"URÉ•\á\á	ö‹~-\èğo5]\Í5µ”Yü:F\\@ú{°c¨O ¿¨\Ö\Âe\ÑT«Ó™¥.@\\VWŞsqŒÿ\0n5‰®\Ì\ìúzrJ0\ä\È<C\æ?7¤r\'h22tıVûRª\'8\Ø\Ë\ë\r†p\×\ÂÂˆ §t´kqc(v\í¥¬€qñ¥¬Œ…§ \ÅT¹_w\n	\íA[ªZ\ÂP\Ú\0\ÉZ\ÉÔ¯ÿ\0\İ0\à\Ê\è3©~\×m\Ã[ª\ì›Eø²ú„\'L©1$†\Ö\ËM\ä T\ãy 	k-Mş\'@r ,T\ÎIox \Ót3^ªµ*M¸}ˆj¡´wwı\Ó7»H¤J™k\àıÀ\Ì,Fe9 ÷”«½´òr§\Ú]?°•\ê\×Â¸,ë™©oR«O¡n!lw¦?j=5‚8\Æ0y\Æ\ÓV®Ñ±X\é2\rRZ7r$º(i\Ã:ı)R\ÕQOo¦,œ7ÛŒ‚¡‚¬œƒW\Òdtmr ?n\ÛWı²\Ójÿ\0\ícÓ››\0q\ìK\Î%Æ“ô\Ä\0\0Æ¹¦S´*µ—-j@A\âC‰I\nJ¸´:ft½cN-NPU…!_*…³\é\åË¦›A¡\Ü)6\ÍÀ\İV\n\n‹<%IRĞ®BH>ğu\âß©=J©Æœ‰N4\Ûr\ÛT‚Œ’´r9\È\äc\È\Ö\Î\à¸öòsjW 2\Ë+M^\Æ\ÕXÊ”©.$Ÿü¸ıµ¥¨nT¿º…\ĞwOn!¨ \0³n:qò;|ÿ\0]MvË§N20\ãà¤‚TQ“\Öşp=#\Ù\åu3¢}—Ò¸‚‚|Xò\ÄT\İ\â´7Ş–\Î\Ü\ŞwsTª´UŠmB£/B’ÃŠB\Ô\ÚÀ\à¦Ğ $‚œdjg|ô3{n.­U¸¯b\rU”ĞŸ`ˆ\Í&7j{\"<„´”„‚	K™\Êx	«›»ºÑ‚\äÿ\0ñ\'Cˆ–â¨¡vı©$œ%9%À“œüB®‹z¬’›†\ì\İ6/J]]J[[\Ñ\Ùbh–¦T¤!mI.,\'€;ú‘Æ’’:¥tšÙœ¥\ã…G‡•¡¹R¤3^”Ï k¨Œ.¯vŠlŠ\ÍN›:\Õ\ì¨58\Òj\Ğá•ŸÄ»[Kª\n\\RJ›	ö•„•¨§¹:ªj»;³5nşûl\Ù\Ò\Õ\"³\İ2ŸNª\È\ËT÷#<S–[N@Wµm¥dû“ƒ„•k¶\Çu÷n±¸.H¸o4x\È\î9UŒ—±\ŞV ˜\Î)c<¬‚8\í«?n«öö\åmœ\'¨lúK¡U\æ\Ò*õw¾‚\ÔJŒ=‡é«·5]Nu/8’C–*Br-\Ôt¿H•\'¤e\èÁ¦¦\È\å\Ğ§(uYTŸª±P\ìï”²¤ğ0³Œ\Û\Z&zy\Şjõ\ntV®†\Û	÷„¨€}\×Üš™¸Z}:B\Ìv¥­!%’NGÆ³\íòºh¯%,\ÉJ~R’¬5½rô%VI\Úø‰²u°{µrÀ_Wkûİ´¬´›„Î†Ë¡µ¡Ì¨w4S\İ\ç…‚?m½\'ô»ÔŒ\ZË›wb\İ1¬{R<•J¹\ïi­?R©¸£ÑŸ\ÌU\áD43Y½k_ô\×Zn;-XZ¢±ûøøıÿ\0MY¶\Ú¿\n\ä;n\ì\ÇjR\'„„Am%\Ç\Âp<Ÿ\íªÿ\0€™–YO±‚km2\È\'¤u<\Ø¨\ÖD?»\îÒª’ \Ç\ì.¼\æ\êÀ\ä­9öşÚ­ÿ\0½.)Á€°\ámÂ…¼¬„ş\Ó\ã\çUF\Éô½\Ô\r\éSƒ¹[\Ù|T(¼\ãÖ5\ì%@ò\ê³À\Æxóõ\ÑCÏ£[–\ê\"Ám¶€{\Z*\á#S\çU3Mğ®\×\ÇXö‰û\Ä6Hrİ’\İBjıGZ9R\Ôrsòó\È\ãN\ï¹R³\Z¥o]Ë§\Ç1ûŸˆ\í-/CP\Çş¥ô…2sRû•\ÔUm&U!2XD¨\ÅJq\Ç	·Ê³ñÎ«[­z^›d\ÏQ»c½\Éjß‰Z‘O¨C	.´û^š–^\È)!i(#ò\àk˜l¦E×/İ¤ª4=9*‰–Pò¬\\WÏ¼{\Û\éU\å¨À¡\Ém1\ãÔŸLF[w)c+6x\È \ã®£[\ÛC¬E»\"=·Ñ’¨7«,\ÄJ{•\nRAS\Í&ŞŸ€’~P5ª\Ø]ºUb‘p¤\ÌynW\ÚiÊœ%„¾’°hR”Ÿ9-ƒó¢×´\ãÄ¨S*’\è\ÅfE·\È\Å\r+ü»Š\ã•a§IıH\Ğe¤Ì¼òMĞ¯˜¦=ª©i($\ÛÏ§\í$(¿‡\Än	w¹m“\ê/»%_¡\Ó\ÚÌ¹¨’-[¢§jÉ¢\å6§\"‹PÁ\Ën…ı@÷\'Xzı¤7.\İ9‡A@#\Ò8–¤\ë\î\Ô][\æ\ê*¼----ZD;ZZZZ\È\Ë_¡\Óñ·º\Ö\Ø9‡r¯Y#Ò›J\â\ËzÅ°—Bp¼ö›I\'ıcMö§\é¬j\Í\nqÒ¤Pªô–&Â–\ÑjTWùK‰?\ÊSò?nF\ZÖºm\ZŸM½ wVG-ˆ#\ét\n\Â\èuF¦\Óøp}ñ\Õ7\Ëp:¯fT®œ¶&­V¥»$D3g­*y\0M€´©y\à\Òy\Îu„\Æ\×\Ù4£%‹\Òş©Ì¬B–¸\Ò\é4t!ˆ°¤6²—\ZSİ§\Ôq*\nI\ì\îHR\n\É\Ö\ÆÙ™U°)Ñ©k_›B‹2šˆ\"6\Év2JB{›q@\áa „¬ «“\È<\é¨p¢Si\ì\Ò ·\Û\Z2;A%X\ÎIVI9\ç$“’NrNú±™ƒ6§+ˆ	@8H7\â\Ö\Õ}£³ğ\áºRÁR†OHÀ¹\íhó\Ük™K£\É)~§\rUB¤\ã\Ä<°œò< \ê&©\ÜGR%õ\äT`³D²bFıP¡ÿ\0L\êx\âHYƒ\ç:ø’S•“’3¦\âû%\Ğ\êY)—)ˆ€k\íP\ÒC\á^e Ÿ¬Cb\ìû\Ï\Şfo…ûQWnø¬õÀ(Wö \ê§\êO§X6ÍµG¿¶\Òm\é=º=Á\Z]\Ï5·\"T\0…%´²\ÚTVF{NH\àcÎˆ°²9 ıBF±+u¨\å\"M\ÃV–\Ìx°[T™O¾²„$r®\á\È?L|\ê$\ßf\Z:^UE¶\Â1ó^~\Ñ>‘\Ú§5VÁûÁq\à·\Í\å\ï&\ßl¬Ê®\Õ.ù\Üúj¨\Î\Ôj‹H§7ü&™O¹m4\à\Éqarµ\ìd¡·gz•¹¶¤©ñ\é-U\éúô\ÕW)ª|!^›}¡©\r,şWVq\Ç!JF_P{Ç´\Ît½¸4\êm\í\×*Thbİ†\ÙB–óH`s\íPh,œsŒ\ç@\åkl ½‹‰iK\Í4·ZP?\Ãp $öŸ d\ß\\\ï«%©\Ún´´Kº\Ñ	\à\Û6>—‡ W*\Z¢‘ß¾q*\ã¢n8w\æ61inu\Ïmß°™¼U™4«ĞV%*Ò–ÁQQ\í ük\î\ÇtU¼=EÜ‰¦mõŠó0”˜\ë«\×j>‹2¿M\Ô^¼`Î±lZ3ÔŠ-%ôÕ¾\î\år¤\Í6p\î\ëmA\ÅJGw)q´÷”‘òu\Ñ-•¹ m\Î\Æ=\\¢!˜»Hešcq\Ğ2\ÓÒ–†›9÷€µ|\ä \Ô\çÃ€´¯œ\Û7°PVò¤Û”B{±\Ål] “\ç¸e‡Lt‹|[tª\ÕeuT\á¹\×qªºN\Äx\ÊQo÷\'Ü“¢bún\é\ë§zSS\ìK]µ\Ô;;_«\Ô\\/Jt};OûP?MTğË¥Q§\Åcµ¸øöŸ\çXú¹„«w\îu7–Ô†\Ó\îP\ÆU«¤»0\ÓBÄª ³\"76ûA_7t-ø,w¶\èõOj{|¡Hı³RıGu›dm•2\â¸.»³•«W¹gHT¬>‡\Ï\Z7+­˜Q«‰´\éR\Ò\åZW`4 \à?$Ÿ\ÆOÆ©Î¤zk\İ\ê—Gİ»÷p£V\ép\êq\ÓY¶\ØmM&g^BK(ŸyÊ’•)@5\\ıR]‡R\Ó\ê±VGœXK\Ğf\ßAr[66\'¼bPÚ½º\Ø\Ü\Z½\Ûs\î5:K—ÁN†\í@zil“‡]<u;û;z„²©{Qtuº\×\Út\È]ME=‘h÷%\Ò„a ’9À>|j\Ê\ê\nöÛ›:|™!¿Z©ğ)\Èe4\È1’òÖ¿I¤ö\É#\0r@ÎƒÛ¯\ìø\ëi\í6w\î¿mQj±‰Õ«.‘Võ\ê\Ôv•\îCG)q´÷$©=\ëP)cWz\ZªıS\â\n\Ûû•\İ\ç=¦iù\Z|³™»ÁAB\Çb,Gü\ÇD6\nôµk4jmnÏ¸bO¤É‚\ï{J	=¼`§8ò3\Î5<\Ü=\â—@,S\í\éEš»dJõ\Ùæ’‚ÁVq\ÓC\ÆS¬Íˆ\ÚZ®\çn.\í±l\Ó#I™M[\nºÔ…€û“¬«\Ü{GnAQ\0{•.\Û\í\î±7ò–ş\æmô¹Ë„·U\Å\ÔiŞƒÀ´\ĞT;”<(x8>x\×Æ„\ì÷º\×\ì\Ìø¥Öµs\æ2} wT\ënûMº\ãX})\érm!Z\íj­sV¤\\UÙ†LÙ¯-\é’NT\ëŠQ%_¡\çX\ÚCÇ-w«,·,\Ê[@ğ¤XzG-¸µ:²ã›˜ZZø§PƒÚ¡§iôª…W¹PÒ¥‘ùP?˜ı5<\ÛI\âQ\nua)0Ş–·\Ğv¾ğ˜Ğª{ ñ•}tµÔ¤\Òr±şwş™YŒ@\É\ZA“üƒ:Û¼\Ë*´6I>8\ÓL\Ó\ä¬zˆŠJ<wm/¢ÙˆI[—À1€\Zq(\î)×Ÿº•$¬?}niôğ©˜|a¼}58 \ìª\îr+ôµ6¦R\Ş\nAü¼r¯\éôÖ—\êm2\Ø.u°ş\"T¼Œ\Ä\Âì“\Ê*·™-(6FFqúi¿\Z°/\í«¬\Ñiq+¾S/‚P9@?¯A\é{‰‘”\ã:\Ù+6\Ì\ÊJ’ G”|¿.ôªøNc¹xW#»uG\ï®\æ\Ê\ÜÆ›´\éTö%\Ğ-Ê‰’„4À*¬T1•¬ù\Ñ¨H\ÂV´©J\Ïi\Zºk´\Å\Öh\Ó)MU$ÁT¸\Ëg\ïp\Ô¬÷\0\nH +\0\Ù_^u@Ş»GwXÓ£P­Š\nª\íMğ®+kV\nYBF2²ŒI$®;DûQ\æ\Ë`÷_Š×¾yzC³óOin:H\ï\î8A¶5_lDki =}\ï$;U¦£•!N=uúM%\Ø\Æ/c’„­R•Ú‰ÀP\î ¥µ‹\ÔşĞ³´t6kÿ\0\â\Ï\ÅzJÙ¦²óG\ï$\Ü@\íWh —2HN4Aôó³6¾\ÈY(¥™U®:‹\ë‘rV\ßJp§ÿ\0\áhy\ìN{B\Î	Op	HQ\Ì¬=¿U\éS„õEÒ¦Ø¢7÷&B0–Š\ÔVµ…qŸ•?M$õ¶¦\é\í)ñuF>ùJ±\Ğ\ÛC;LW®jT\ÉÓ»(I\â6°Q_I\Ú2Œ”7®YLxµ–d´ó\íz¨iµa‡\Î\Ée\Õ\0~\ãF6\ã],\Ó\ìZ]¹¥1®4\ÚG¨UÚ–ÃŠ@\'Ÿh<\è\Ü;Ş‘hÛŸ\à*\ŞC’›SNIC$µ)W´¬IğOh8Æ®µ\êº/R1–\Ú\r]\Ö\Ôj’ ¤™‰c·½m\'\êAVGO#(™fd²\Û\Î8=´1\'^L“„\ã\Óş\"k¹Ûº\Í;&q)	^8>4>\î%Ñ»ûˆ‰NZõ5\Ó\â0“÷§Xl­e\'À.Ú‚G„N\ÜZô\Ä;\ZŸ:°“YšX ¥¿TSRIP\áN€{ƒCò\ç$’5…X\Ü\ÓC·\Ù\Û\ëY-¦<uŸYõ»ƒ%xÊR\Î•||jdôó\èJS*.~±¹µ\Ç•dˆ‰t\ã±5+\ê\í¯W.	ó&òf\\™*Sˆ_n2r<øñı´tıµYPª÷6\Ù_õÉª¸bHatV+	ô\\rŠ\ÈPVA	\Ïv?—Qa·BÛ¯[¶,&\äPÛ’©µªŠê±‘:JT…-¥±¼HZ²•aZ\Â¦•d’‘¼û[Õ\édn³·‘b*Ì´Z¢ªS1\Ğ“0,ÊŠ8u	\íH\n	\ÈQY\Ï:ª\Õ!\ÄÉ™‰´\á!<\Ï1\é4\ç\ÆOT„Œ¹)I¹Y¿.^ñ3\ë2Õ³º\Ú\nT}¶¹\í\ê\Í\ïb^\Ğ\ê\ĞXT²a\ÉK\n%\è¯8\ØXË‰ €¢	\íĞµ¸}e\İ{uG»hwZ\é\Ó-\ä*+t\é#a„¨ÿ\0ô1¸e@%Y\È$kK\Ô\Æ\á\î‡N}N\Ö\ìm¡»ÿ\0	‰\\Cuˆ´¸M0\ê}g\Çñ\Â	\Êò¢\n\rGkTÁ\İ\Øn\Ü[…@,WgIn>§\n\Û2e’`(¡=\ä‚A\n\Ï\Ç\Ó[´\ÍQú, Bˆ\îW\âA\Ø\ç¯_hŸ©4,½eL¯\ï›\Şû\"Ep¹oõ	yÓ®úU\Æ\Í\Zà¦¶”7jW\r\Zk¿%—O,­y\ÉB²•r\0:.6w\î{‹bª/øb5¿r\ÓĞ„\×)\"7§\ê${BĞ”€1””\å*‚FN„-·\èòôºwb\Û\Ùz\í\ŞX2S]®Iô\Ó\Ø\Ó,­\ç\Ş÷v¡<6 \ã?]_²·ivò—E±6w¨J•zM\Ål9*†õ\ÕK„Ó°–şò\Ó	w±D6\ç¦\æGbÓƒ\îRV\0lQjRO”Ì²«¡c\æ9úòô„=VŸ3\"\âšP\Ş\â\Ø;ÿ\0¸‰\ïiõ\×JŠT3\à“¯)R®\Ô-*ö÷e*\È\Çï¨;©˜ª\Ôxu‰{óC‰&s`­¥3!\Ô:\nA+\nJ<Aú~º\í—Q=\Ğ)2¥/s¸k1Z[©	ÿ\0/·•)RJ‰ıI\×G§]\ÑOK\ë_ˆşBˆéºŠ¦”\×“\È\ß\ë\èöuf¿*;lSqµ\åIR‘±Šª¿½NO¦\0=˜$ı9×¾‚7+gú´¶j7F×¡!4)É§W\"­\\°\ëˆJÑŒ\ÊR¬\çô:0\ì\í¸E€ˆ°c¥(N	\ËX$~¼ù\Ğ%g[¦u%\àA­L\"R\Ës&*:N´ \Èe¸\Î6¹JA\0\çé¥¢=¹6\è\ãõÆ–‚~ÔšQ¹Yı`¼IKQ\Ï{\ëa&QR\Ò)\Î4°\ç\nq\\ıuµ t\íœ‰u:±uH*q\èÍ£ó\'ôW\\’-ù\×°‡‚”şdƒ©Õ«·É¡&\Z\Øl«µAI_4w1©\æ\Úm*\Ï<Àš4ü’œ+Jw\ØZö\íºŒ\×[¢%a’\áôû‰\Èñ«Û§›Çµ\Ò§8K*-H\îGğ\Îxóòu&·öVM\"ïš—¨¨ô”¼¡JğsôÕ¥@¡Å¡P’€\ÚR\ÈV]	À\Z‰Y\Ô\Æi‚\Ê9\Æú]¹Gû\åE½–¬\êm½J‚\Ç\İ\à²Rókg¸sÎ„\Ç*Ş”\Û)FTGj@ÿ\0t/8v\í­1ûbœ\Ôê—¤P\Ô>r”$~ƒ÷}»q\Ó]v]^\"uÒ¥:Ç\Óô#>?mhY ´(9\å\ëz\ÒUq+nù½úDT…%%*<:ğ …‘\Üd\'÷ıõ\êk/4¯\â$yÎšZ\ÒS”«<üi°Ò\æ/\ê)S\"ş‘\ì’S\Øq‚A<y?]Dº‹²oZ\î\Ö\ãM€¨ñ\å~\ËE¢•¶”0•¤¨‚3’¢?ıu,õ[Rac¹?˜}5‡xI•X\Û*\Ö\ß7­6ód\'%/ ıÒ¥\è4¤íš‚\íoC<%“w)X¹69Ø˜cve¨£ê––ú¬•øNm\çü@.+ğ7>‡*\î‹s57\äÁ(~2m÷§\Ôo…g)#>y\Ö\Ët-«6bà¢ŸWn\Üv=I~•Ô¥ğ•¤œ¶ AJñİ€Ojø\Ó;\çjN›MŸ\r\èn®t7¸\ì§)	Zs\ïıC ¦u\0´,ë–…fN›¹•¨F•Ÿv@t¶¦øCE@Ÿ~“:ä¤‡e·\Â\Úğ”ò66ôÏ¬t\âKi[‡µx’|¢\ë\éó§¾—¼\r[wõF©Z„j.3\"*%ˆ2g¸A}‚\0“\ê#\Ói^rVqŒjeº4\rŸÙÈ¸-«YŠuÚ­Ef Õ»^§¦l*Š\nrG¨•!Ğ\Ô%]\í,/\ãP*Ÿâ½·N\æP\î\ZA\È\Å\Æ\Ö\Òji¥.G-6\êÑ”–øô\Ïò–ù\ÔZ\í›Tİ›²™¸[³}~)\"\İb\İ\çTg¹mE‚´¥N†\Zxg> 	\ï=¤Œ\êõºL\ÄË\Î\"Ä 7 \ía\Ìõ´U¡\Äp\Ùf\é8\Î\İ\"Ğ¡ukZ\ï\\vwøV¡2¥2œó³fIl­§\Ë\èq¥‘\Úm¼¶UŸP)X\à5°\éb\İ\Ü=Ñ²\ç\ÄI ­ºô‰78ñûÌYå¿†Š•}ù\îòy\Ö%\Ë\Ô\'Mû©µ.\ì]ƒ·¯±\Úó¦3Q‘Eq\Ãq\n(?ê•«\Ô$Œ\Ñ\ÜH$OP>“\ë{¥\Óm\ÅP¸7JQ*¬¨±šDš{¬3>7-ú]¾šT‡{\ÈYAO\Æ«u+UJ•^\íl\\œ\æø\é\Z^rC«\\Uû\ß6‰7V´«3o÷6mN%¾\Ëuµ&\Õ³üFc²\êÁ¼\ëˆ÷”\á\Â9p…Áƒ\Ñ~\Îo\ÕrÛµ·\ës­ªe´FcN„\Ê\08µµ÷–‡·³KÀœ‚“k\í-¤¶zƒ\Üz\ë\ŞÛ\Ò-ø2j#É–¤vz¥„¥. p´Ò´Œö•)GÎ.]Mü6’p\Ò‡\äQ\ÚOÀ\Ç? \Ğ\äõbB¥¦$e„¸C¬^\ê\Å\È\âı<¢]FznN¯;\İ8TÛª6\Ûl\î¦ú^»lû±Şµ+¯I¨\Ó\äz\ÈjK-ª4–”’‡[[%8Z•(sœtŞ˜\î.¡÷-\İÆ­Û‘Ì™²a\nZ}Br\ËIm¬a¶R\Ê€€°5Ó»•\ëƒm\'ZF\ßrUYº{\Ñb\ÊZÒ€¡\Ê²¥x\ÊH\'\ç:¶õ\Ü}¨¾¤ôÕ¸vıúcô·ª­Ä¶ÁeE¶™xûK„© d§E`ƒ¨rõ:›eZÊ½¯¿8˜fœ%©”Ü±´C£}›{	v\ÓUH™b\"P†û¢S°\ëK\îÁ@\r\0	= r>	ó­$¿û>{\İ6\í¦+¶•N‡\';N¹g>~\î\r ÏŒğFº³\Ò~\ß\Ûf\ÒB©\Äjg\âğ›n%\Í\"©MLysf¡	C\Ï8”ûA\ï\n£\ÚT¯\Ë*×§[\Ô\áO¦²R€¢V9$ùşúè¡¨)uúZ—d$œ‹\Üo\n\éj;Ò“ª\ãQ)\ŞÇ¤d¿Ù˜>Î¾f\í\Õ\Éy5p\İ5\Ú\ß\â·Y¸ªm„/\ÓC-Gl)Ekm@=\ÊÁ%G\ÍEô{R9\â~¾eie)H\ày\Zj[À‚B¹ ñŸC\á.R”§a\ÂIlvœ\ékRleIP¾–°¥\'xú´U4m½\\	–\"¹’2N¤´G#($ÆˆW\Úq\ßş“úkA¸—¥Nz[¦[ª-9)cµ\Â<#\Ïş˜şºË Eª\Ó\Ùm£!\'\0;G9ú\ês¥n -\\\â \Ş7+¡¥©J—=\Îâ¯•qñª\×}÷Ğ¶\ã&+•B\Ò\ÓÏ¦’Yú5eU%}â˜°ë½¡!\Õ8?M]T×­ÚE\íÊ»fKo-JR•‘ÿ\0>uaD§™\é\à…h‡Pœ’\Êq9\"1÷C~^§Á2œˆ	yv 8U5\ÆÔ«ù—\çœ%Y,¤\á@ıq­•¶»2”ú*µI§A\ÊR9\ÛX\Ïo5‘N­¾±i‰‘R¢cz@£=\Üò14¤¤\\“,#np9:&Q\ŞLª\×\å»§oK¦¦§.RT2Ÿ\ârub\\Xo¤Añ:±+;§á¥¹¹\r¦T§p\ÒC`%	?_\ÛQ\Ù\ìG\ÂfB›JR±\Ûè¯’o¦Š\ä\çfA/\"§d\å\Ë\ár\ê\ÄGªA\ç\ŞT¦\Z\à\ã!	<~úÍŸd\\tÆš“6\'jd:…\çŒjwhZñ$OüA\ÛiÇ¤¤\0¶¼\ß%IN?\ë­\İÏ·[•vS¿«\'\î¨iA”2¦qF8\á#\ÔIš\ÃyA \'ó\í\Ø\ÓÁ\É~;®V\å\ç\0g]V%j\ê·vUQ©ó©\Òc¾c\å*zVa ¤¤¬RI\Ïq\ì\×>û\î+Q(\ÔyLˆ/-?x‚ò;›R\Ò8B°x\îùóÆ»½[GB4\É~K2TóAiI\ç\î«O-œ¨($ş¸\\®\ê_lfm\Ş\éN¶\ëI=\è„ˆ\ÊB–Ú¹\ïJO”\ã8ıF’šûO7+QT„´\îlÿ\0s\ï\r}]vbğo.\Ëk7$uˆõ©¹%™D¨ZN\\5X´6\Öñn;\ÇC\Ém¤œ”(­*Â³\ã:‘R/]˜©I¦±sÜ±œ¬\ÛQ‡\Ü\ëRjKpHJ’V€¸\ç\ØH\îÀ“[pzAöpt1\Ó5+bl\Ï\Ş-´pÜ·% ÎŒ\İ\Æ\Ï{4Ø«q~ˆKG\Ú„:¢ N1YD}‰ıõ_Ezee›\âôûS^´R–\Ûp\ãÕŒp\Ò\Æ~R\äøÒ¦nrMs%\nQIˆ\Û\Ò\Z²´ù–\é\ÈXM\È7\Ï\íº\ÚKÁÆ«ˆ¬·bS¨e—ªq#).z\É=\á~\Ü)H\ï\ØrAÂ £ccm\Zu\ßrÂ½·\nøv»RD8ñÚ“,j\Z=\èI#!dœù\çC6ııc}–U\ßû\ĞhB¾v\é/¡ª…VŒ\ÑCA¼œ&S\n÷\Ç_n{\\IZ\n±\î9ÆŒ¾™µ7¶\ÌA\ê\ÕNfƒ\"*Ÿ~ \ë‰eŠyl\0\ëRT¬œA\à\äòGt;¨œ¨J4*\å\Ú^1“~@˜š€\Ô\ã©va -;XX~‘r\Ón\'©µ\ç\Å9ø÷‹uzZ\Â\Z1‚”•4µ;Ô•$\n‰O[¼±oJ\\S\ĞU1(õŠ\ïğšX\Æ<`ë™½c\î\í\Õ\Ö\r6‘\Ñ~\å\ÑY¶©SıY\åT]‡2¥%.‡1Ü–(N=\å]\ç\ã\r¯ö¢õuÒ•F^\ÏŞ³Ux*”\èa\Ø\ÏF¤\ÛRrÜ¦‡?¡$§ô\ÕSfdm¨Á\ÜzÆ·]I˜*\Ìv\êE\È\Ã\é´p·q„‘œó\Éñ¡/sh\Ô;\Öj\ì¹./¸ªB¡^f{Í¤¶‡#\'ü¢!%+VPùr»rN¹ñu}¸\İp\\I•d\Ò-»f‘sXbDšS\Ï=¤{”·Á\È\ãÜ“Á#õ\Ö¡¿»µ¾Y\Ü=Õ½¤V@qºU23I#aCò0€TsÊ••Æ¾Æ’o½}À:X^3ªŠ•.y‹Gmú\0\ê.×‰F¤_±gAjs\Å0+=U[)P…8ô„²÷µ)}JO¹+\í\îmC\È$œô*”jŒ\ê°$6\ìy-¥L¼Û‰ZV\nBII!C¡Á5\Ë\í\è\Ëqo­†\Ù\Ë\Çi\à‰»m¹;vh;\Ûnş*Q(¦C¾\â°ÃŠ\ímm+\ŞP\ÙOiBjÂˆÑĞÁ\îWI\Û(6+q7q7¤z=QbÛ­.:š|@Z¯E\ÔeHIC¥\ŞÔ¡Dv¨~_Ê“\Í=%5$\nJBüV¶\Çlz\î`5\ÆR\áµ­†ıDÊ’\êN¾?MbÉ’ğWqs\ç:ùC.C[Ê’””‚@QÖ¢Uq }\ËùÆŠ¢/	Œ÷\êjP\í$~tµªa\Ç&8TŸÉ\Ò\ÖG\ĞˆClª¥	©”8\ÚOnxPMcAÜ§\á¶\ãj¦¬¸œ§\İ\í\Î>¹\Öu—ĞŸ\Ï\Ï\ï­U^JT’\ê2Ts\İÆ­Zi.\à\í\Ê%)$Dv7#qª2a· ESj¦À9?¾ªŠ¦\×W\ë\Ô\ÅV`T\Ôñt\æ[a²\\_œs«Zé¦Š«¨q\Ğ;yÏ=l8ºJ€a\á\é÷r;\08ıôe+4%eÁhXˆ~U3®”<M u¹¶\"\çM=Êº\ÙR’\È\ÈBòNyÆ¡¢Ş©´´‰\Ñ\Ã`aIÁ\È:9©Pß¦-/S•,ahV\0ú\êŠ\İú]>l÷Š@ˆ•º]¨Á\í<gû\çWt½O4·\nquM4\Ã ww\")†\ízsÍªU~/±¹\r(ñûŸ¯\èuµ¤mí”¥¶ôkú$W»Àa†Á\ïWè¢¯Ÿ\Ğjk+dn84¦}*·ko6¡Ü‘\áCı\'õ\ÕM|[\Î\Ù\Õù6\ÚûdH\Ğ!]\ÙOq\á$$şš —ûEE)r\Ö\Ş(Ş•]5	ZÛ½ö‹¶³u\Û6e‚·©÷Twf©…GX`\0ò‰ı@8ÀúşÚˆZ\ÓrU_E”Ì§TµPñË«\ïP\Çv\àóŸ\ÛD\×M\ßg¦\ßF¶)v\å¹&«Wq>¤–Vcv)?øe¿§#\'9\È\Õ\ÕmtÃ´{|Ë”\Ë.\ĞfŸ\ÇC¥¶\Ü*(W\Ïi<œ\ègQ\Ò\é\ám‘Æ³|·‚\Ùj=Rp6\á<#a\0\ÙÑ¦\à\ÂCwUR**ºzs¹\ÉkQ	\ïöü\'9\Ç\Æ5nn_\Ø\ÓStk:£»•«,ût¿.ˆò#ş*Â“•EVRKI\n\ÉşHù\Ñ}I\ÛBMÖ‹¾¹Nj[¬:•\Å2ù1Hùo23œ\ê|ºœn\â\ëJJ}\É\nù\Éÿ\0\ÓCU}G9X–m•ŸyEõ2%Nyn¶;\Ç(ú Ú™\"õş\0£\Ò]§ZAhZMT„Àm¶\ÙK!@•\×hœ‘\ÏÎ¥û7Y¸*“\n­˜\"D`°Ù’•ŸE¢¿…g\Æs\àrt`õ½³ôş\Øú•)6\ãu:R\Ñ2š\ÓO–J V¡\É%\ã³Â³õ\Z\İ\ê{l6²‹›pK‹(\"3P°ÊšZ;Js\ìVAöşo\ÓÎ•3Ô”76]^a­-©rA\èA+\Û\Ë\à€\Ü}—´7ZÀ—m\î´DÕ©S©åŠ…0\ÈòPÁA#\İ\Û\Îx\Æ1Ÿ~uú´\é»uzz½n­°³\îJBÉ¦\İ2÷6åº¦Z\íYJóI 8 €„‡pIÀÏw/f~Ğ®—·:ö•¶\Ó7ºªœ<#¶Q\rDµ$†\Ş\î\í*Àœ`\ä|l\ê?cI{\æ\Ü\ÍÅ£]øÉ­¸\ë\Õ Ô˜~:qJR’Œ¥Gœùùó©²\Ò\ëZ@”‡ó\ê)Ûœ2\î¯\â\ïxü\åCº¥PzmMØ‹oÜ™-¿Ø¡Œs\Üı?\ãN&®š\Ë\ÎUdK,¼]µ¹’VO*QúŸ©\×\è«gşÆ¯³û¡­œ¼\ïmÑ³)Û€\ÔHn\×.k’ö¡E”\âc\Ämnc1\Ûé°”·İ„§•¨{•’\äd)]õ“º·\í\Û=(B°\éLË„ªu%Ä§\áúr=`À1[e¤FYC\ÊKOz—“\È\Ö÷©F]ö\Û¾ñ\ã5d¿2\Z¶û@e6­ø\Õ\Æ\Ótö}wJT\Ìt2ò¥(cÀò4otw\ĞQ{“M¤Q\è\Öc”ºxBU&­p­L2\á“\Ú\Ù\ëı€:»6:Ø´6®ª\ÓV\å¡K¦%m„´`ACj\0ÿ\0¹8?QÎmš¸©\ÙD™ğ„´Tó€“ı~uE50‰•à­‰5K¥N_0Rô£·ô}‚\é\Ê\ÑÙŠ\r]\é‘\èt\ÅL×’R©(©O+\ÂTµ+\éX‰¬©\\¸\æsªúÚ©Lnİ€mM“(%c\Ö\È\×@Gy\É:1”-\"ã• l‰Pù¼L•]\Ãe!Y\'\Ï>t\Ôj”u¸úRSœ\ã\ãQ¸µx\îQşúp:\áËXù\È\êli‹‹:–\ã=±›{‡\ZZŠ\Ø\åô°\ã¥\å,€4µ‘‘^:\â›s¦{\ÛYW<iij\é¿\n…¢˜-D\Ä^\â’c4¢”y\Óuú¥)ZFFF––®Ñ†	„|BbUN€\Ê.3\ì=¼ãœi.\Ê,JÒ•	\ä%%Jƒ°O\æ<s¥¥ª\æœq.\à\ÄÇ’•\'\"Ä¯Á\é\ÎS\âDD©C§\Z¬\Z=ş\ê*—ğ¥	\ä\Õ{$D.”¥ÀHq8\Ò\Ò\ÑM”KM,oo\âkùv]n!õ£\ØT\ØF˜•Eg\Ñh\'µ¨\è9K`|şúÙº\Ûn·\ê\0O\ÓKKK µúŸ¬8À\ä\0\\ºr¬úª	Rc›S©GiÀ?_:ZZò>ö7z=g\Õ.†©¾²©´\×d–½^\ßS±%A9Á\í\äyÁó®\0õ§\Ö=c¯\Û\ŞmZn\ÙP,qmT¯V\Ûgü\İEÅ€\ì™\nKq	\î\íP	 ­G\É\Ò\Ò\Õ¢\0\É\æ.h\n\"|4Ç¢À§¡\Ú#¥Q[t‚T³\å\ÅÊ—ñ\ÜO\ï£\ìSŞ››bú\æ¤\íÅº\\‘JÜˆnQª¬?-\Ïò\Ée\ÓÌ‚JP° A! ¨+ğ4´´7IuÀúP	‚*«M–²3iêª„\Å\ç\Óõÿ\0eU\ŞW\İ*uN<€\Ø\Ç+ƒ¸~ºü\ìı˜ñ)5¦oû2¥IiP¤&„ ”¨>\Ğ\É@	\È“ó¥¥¦\Ğš}`²S>-ùoïˆ¿*w\ËJ³:\Ù_ùµSB{&¬ö8\è»Ÿœh\Üû:ö\Ş\Ş\Ü-½F\î\İŞ´\Ù,\Éq`<\æc°R\ï\íğµ{¸\'\Ç\ÓKKB´\æ›r|qÁmBjat­*\É\"6\å\ÉpY\Ş\ì$cÀúi\æÁR\ÒIù\Ò\Ò\ÑgÇ”	ó¼l[*@>\ÄÅ¶±\ì--{ûJLCJG=\é\î9ø\Ò\Ò\Ò\ÖFGÿ\Ù','Keith ','Limbo',21,NULL,'09386508693','Cuenca','Hello'),('U0002',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0\È\0\Ä\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0G\0	\0\0\0\0!1AQa\"q	#2B‘¡±\nRb¢Á$\Ñ3r\Ò\áñ&Tcs‚ƒ²\Âğÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\03\0\0\0\0\0\0\0!1AQ\"a2q‘¡±\ÑÁğñ#3R¢\áÿ\Ú\0\0\0?\0öS\ÚB\0\èœ5™¨\'s\Æz`„Fºbe|\Çx\Â¶`\0;QHÜ¾°\İ\Ùô\çxb\ë\ç$\æqòN	‚¤…°ry\Û?Œ&\ì\Èu%µt=w†%\í±Ÿ\Æ2—UŒ‰IO½¬\ì\0o8ac~Xj•gÈ…†N\0=\â)¨§	qJû\İ ÁJ^\à÷‚²Ú—¶ı!\Â^7\Ú$\Â N\é7W\Ø\Â*`\ã¬?q–˜h¾ò\Â‘•-jÀ3¦qÂ¦¸©MI\â\"Ï¤L\'\Ê\ÌWYSÛœ³A*\ê<¡J.s\ï\áMœ\à\"Ñ‘‘…+\é8\à¹:iôş+->¾qMóZ@‹Nu÷D5ˆ­:U«V\íÂ¦G\×\"‘Viõ y”¤\ät0d$\çR&‡\ÕJpp~Ÿ&;~Pº†\Äc\ã	´2%\" rL`\äQiW_X*\ÒzD\ç¹\Ş FT\Ü| ¸\îLD\Ò!¬ö\Îğ	\à¥DmùÀ\É\"\"8FO/q\n£\Ã\'9ùC|w0£eYÁˆ‘=m™U\'%„|\Ğ AY*(\ØşP\"J[\Ş\ÂN<¶{\Ïc\'\Ò¾²·”k¦?¤Ej#ÏÀ\Â+pc¬a\Å\á,H‰t\å*	W\\Â­ ‚sŒ°\á”\ç1ˆK´\Û˜w.\ÉWSK4V¨¤>‘N9lşøš\ÔJ’¥\æ®*‘T¥EqÀ\Ü\×.KŠÏ„\Ø÷\Ö|°:¨B¹Á¢J€T÷ˆş+t„{\r\Ûÿ\0\\¯\ÉZL²P}–O˜.nuÀ\Ã ó8¯€À\êH\å¯¿´_­÷\\ü\Õ†{F“f\Ò”K\Ök-¦z¢´\ç\á9ğZ>˜^<\ãÏ x“Ô®!\ï\ÙıS\Ö[¶n½V›p‚ü\ËÄ¡	\ÎÍ¶‚;€<¢¡¨\Õg&%\Õó„\'ò€\Ö>§¢»”\Ú\îdöó\ê¢µ—ş&5¦i÷u_n*\É(\äZ¦ªk\ròù%¤” ‚bŸròT\Ó\æ`UV·Õº\Ö6?ŒB\Ö\ä\Ê\Ò\ã! w\Ä+$\î\åÕ”(gr”˜½¶\ìnSŠ€a \è¥*¯\Ï86Cnry\'\ç­MW½,:\Ò.\"ğŸ¡O4r‰ª\\Ê™Xù¤½:DMÉ¢Z|‚v÷¼3qO©\Ü~pC\0J÷kÃ²ğ³ôõq©¡“T\ÍF¸¥õ\Üdò½\'_h&p7ü“Hy¹\Â\Çhõ{‚Ÿ¥…®8$Ù¥\Ø7H¤]*eK~Ñ­:”M_´[?e\àş\îø\ê|\Ó\ÊO½.p‡pœ÷‰Şß³öµ\ëN¹¨5‰Š}RBeS\'¤Ÿ-=,øû¥c§*°H\î\à–ˆXÂ€iÿ\0LÇ§Oüù}\Õ:ğ¤X\éú\Å3À¿ö\ïü>\Û÷Få¤› I%›–—)<Ú–\Ä\Ú	B\Ô[\n\æJVRT\\\ëNñJ€‚“À\åÀ\Ì\ãÂE$\ç¬DQr	Œô \0$ñ® \ÈP\'¼m)\Ş\"Cºv\Ê\È@\0@Œ6’LYj	gÏºAs\ê9${2¬¤ŸH\×<\æs¬H­g9õ‚¤b\0Œ-`\äf\nU\ë\Ö\"‰d\å®\ß\á«X=¡Ô®\n\ÆOHˆ)jµf›mP¦\î\Z»¥¹I	G&fœ	$¥¶\ĞT£¹Àhù\ÎúR¸\å­q\ËÄ½CQ\ïIZô†v\Ú4Õ«v$Ò²KŠ\ÆÁ×—•«\È\07	\í\'\Ò\ã«W~p~VlI·jU\Zx¦‡$\ĞI–—}A¨²”³\âe[c\">mnš\ÃS¿*Û™nMdœtR»œù\r‡ıb¶‚ú±\Ù_MŒ5À):\Í]*w\à#J¹³Ÿ‡ÿ\0·†:•¹\É\âsp}b3R¸İœ˜S…£¢R~\î!\İU*\Ó\"ZE…$,{¤\ç$\ÆlŒªA5´©\"SÃ•†2”ı£\Øœ®te´;\á«8$íˆº¸f\àˆmğ\æ\éÁ#&\é›B°¡\è\0Ê¿H\ë»+\è/ª\Ôešš»\ïw\Ö\áPñD´‚zsúÆ²·µ¢bg\à·ö\Ş¿¬\Ğ\çC\'şF>\Ûı—›nSj¨QöE—6Ê”6’‘6´ò\ÍKr\í²‚qùxõ\ê\Êú\rô\ÎVh*¯W¨8À\Ç\Õ)\àJ½I\Ç\é]»ô3p·Fyª„İ¡\í¯6y¼)¥’\Ù\Ç@@\ëg\Ó?e²\0y«·\ä	şğ\ÌS§9ÒzcxVV~jBa/!8Z\Ûc\Ücú.´¹o9)G\Óy:d\àÊ™Ÿ§§\ÂR6b\n|Á\æ\Ï\\)Søxš•¦Î¿(\ä\ã\éS¾$ª”GDUt\'ûö\ÜjzÂ‘i¬{\ß:\Ş\Õ\Õ\é\ÕÓ’\"\äªÃ‡n\'õG‡MF–\Ôı4¸“¨²ğR¶+RNA\È\ÈøI¼(k¬\ïún\ë2$›§¢³Nm\ç$pV¶\\)À¨„‚3¸!8\Ä|´R”À\ç\è<£\İ\Ù\ÂÕº\Å\ë\ÃÛ§µË•\Ù\Õ[\"BQ÷Ô³),ó$„¤²‚´/=s\Ò7\\™`RôA	q$‡Uò\Æ +sˆ:¶‚(\ï‘òŠ’,\çc\0ØŒ\ç} Ÿù\ÄDJ.6\Î#)›¡ŒH\Ëg&\"„Bt\Ñ÷O\ã0\Ù “ùÀˆ†_V\Ø>Q®u]D<y^\éß·œk\ŞV	\É\íX’Y\0o\'\'¤d÷0P¢\"(2 Œm\ÖJ\à+>°Å³\î\ç¾a\ã}¼\â\'*ï«Zbó\à¯Um©)%L=7`\Ô\Ã\'ZÄºÔœg\Õ#ğ”\Ê\İI\ÙYYâ´ŸÇ‚BH\ï’wü}…³*\Ì\ë\Ç6\Ò\\eÔ”8…Œ…$ŒA\ë´|–ñqc\É[H\ß\ÍMm\É\É\İ\Õ6%ËŒ!¹—R»l\0\Ä\ZN®°®\Ò_D\ĞşUGoÊ½Rš_6\á	%yô\ï\×ôfğ8­\\”\Ô\ëò›\ÍK/òRi\êNL\Ñw; vóøG+è¶•Tn\Êõ*\×2‹B\ëUv¤\Ê\ÏP\n²³@“\ëğ¥4-:´\ä$\äd\Ğ\Ûr’­\ËÊ€’”¤\Ï¦\ã|@¶(\Ó;\ïğ]g†ø[Z\ÓuTm\îƒ\ÜõùÊ»´OG­\Û&ˆÄ¬­5¤6R\0H\0c\áG²2„ò\àô\"}! Pw\ÇcA<\ã òp…¿~²\é)\ãm!\ÂF\Şpb\0P)\é\Ä7i\Ç¬œõ\ßx\ÖV¨¿¼Ÿ.Š”ód\í\È\Äú\ÚO\à’\"·’\ìJ\ëş¦Z:_bN\İ7eY™9Yv§ãƒ˜€7	©8\Ò\â¹\ÅN®LN[\Ô\×İ–ö‚Ü£M ©K\ì”\Ô\íó>C¤{¬Ùº´ëŠº§\çfe–’\Ô\İA\×R\ê\0R~$œv\ÄCl¯£\ã‡}&ª¢·CµX\\\è\È/º\Ø8Oğ¤ò>ç¹ƒku\ìõ¹®d‘¶p¯¸´£ui\Ê\æÀ>ô\Ç`¼‚Ô¾õG4¾Ÿ¨›)—~¦µ\äÁ%M c©éœ\ŞQ\é§ì¼©£ejÿ\0\Ö(º*4Œ‚6	ğæ±¿Ç´9ú@´JOQ´n¡L“–@zEH\í¶\ÊO¦R>[D‹öi\ì%[z!ªUù… =3xJ\É)°w@bX«‰{ò£…\ß>\î“\ÅC\æì¸¯ğ\ÚE !„G|\Úô¡g®\ĞU}¨Ê¶\ÎğE\äF\År\Ä#\ÌGa\'?Œœuˆ \İaA\0¾p™óóŒ¤\ã|À;\'\İ;k<ƒ\İÏ¬#y\å\'\ä`@ª\ÂFaD$¨Æ½Õ’O–!ó\ëO†#^\éHQÁ\Ø+:$V£’Gh9\Ş0\é\ß?Œ¡\ç˜”\à%šQ w\ïe\Õ\ß\×x`\Ñ!@r\ìOh},p Ÿ\ÒBL­\Å9{$„ô;GÏ¯&I\ÊñÕ¨²Šq?[|\ÔV\ÚV\Ö\Åx\é\ÂG£»| ‰#\ÊR€3sñ\á\Ã%\áQ\ãN­}Smg&i\Õiy9\ÔT&L¼²],¦]Lø«RR\\%œòı¢1˜\×q#U´fş‹y\áú”\á¢#¯¤.<“\à8\é¬Å…©¶|º\İ]®\Ë\ÕVºœ+!Jø³¾¯})Z%\ÂıU½9³UúÄªG\ï	jj\Ò”8\Ï*Ö­¹ÿ\0”g\ß°q±b\é\î±1\Â,µ}$\İLª¬¾_c•.2\\l$\'™Ç—Œa!;’b \Ó\ï£Î…^­šbĞ£\ÎOOL•95yN¸9\İR²V¦YuY\É9!D?(\çYn[PT»$\Æ\Óû’\í\ßzË‹r\ÛR“\æ0{}6õSõ~\Ğ}‰Hğ\å\í+\Õe!°f	©¡¶\ĞO`BTO\Ç\0f:W…o¥\ãB8€—š“¹´ú¹gOI²—\\n¨·N2…¥#›gm²H9_ª\è?	u™kJ£~\èrbQ·ƒ\r\Ú&o\ÅI\ÉO# \ï¹¤YZspj~«P—vi\r3I¯jXif”\Ì\Õ9å ’O9Z7Â†v\ìc& ¤iƒI;™ıB\×Ğ©E\Şw\×\Õ\é\ä\0Ø•\èe.µo\Õe9#:Û:B¬‚”k/]B²lZkµkªÔ»\r6§¥nBR2H\ãŠ4s½.\Ò\Ë\Ò_Fµ:B\ãµ*sL\Í>‰J\ÄÔº\åY,%*q ò–€	J‚‘\Ô(vŸúş·8›»\ê\Öö„Y\Õ\ÂrJyro.«<\ÛR>\ëhZ\Ü\æl¨‡ˆ”\ç˜`\0¦Ş¹`!Ÿ¤\Ş\Ój*–\än ƒ÷\Ùh5\ã\é\Ö\ÒK&«1n\éf†\ÜW7³‰‰é¥¦I„yAQN{>qP\Íı:È«¤¸2®\ä…Ö¹\ĞGq€AòÛ¬oµwX\áª÷U•«\×ş—\Øó\ï•/÷t®LTJ“y¼E(…\îw8\êbki\éûú¥¦ú\ÇC\Ô\Û\n£D©4¹–f¦¬KÄ‚R¥¤…\ì A ´X\Ûv9jdú\ç§\ÉSR\îÖF\Å\Ì\0òÕ´yºô\î¥nº\Ù<T\èü\Í\ßd™y–Jg©³Xñe–SS–’7J\Æ\Ê k}ö{vö€_o aSwó‹XòÄ³@Ÿ<÷\ÌQúI¢µ0‘¯\ê%V†šD£n·3I{\r²\Û\ËPB\×.T…ƒº9\Ê„Œ\Ç@ı·D•\Ñ\Ã=\ç3.\Â\ÚvWSj2s©\\\É\nm¦\0)=Á¸\Ú2x]Ó®\çt…‹\â+š/±\äÌ¸\Óüº\ìG¤\ä\Ö\'|bšP* \r‰\0“¾1¾¸…c\×9¶;~q…¨\'´œcˆ¥Œ¬“\nÀ‚óŒó ¦J¡\Ì$ A\â@\ë\"B$¢L)A¬wø\Ã\Îr}!\äÊˆl8\Û\Ò\"tB£\Óñ‚•\Øù\Æ\n÷\æ\è sùˆJvœ\'\0Çœ?“\İAQ­A\Ã\é5öùAJw\\ó\ÇF³\ê­P§i\í“R2H™•3S¡JIRyˆÁ(!X\è\É;ô0\ãŸHÎ¢\Ò(we\å\\©\ÏM\È\Î\É%Iz®û¬†Š\Ê´¶\âŠ©\Îd«\É\ÉÁ\Ş;£\í5MjÛ‘\Ôi62\í1^\Í:q’e\Ü;’¿ùG$k=*±}\Ó\'—¨¸Ü­\"MÕ‰T«\Üu@¥@‘ÜLˆå¸§9•\Üdú|¦xvnN$j\ÔH3ş!P\ÜJğ{m\ÒoW‰f®J„\ÍfY¥\Ój3ó¯x‹2o(’|ù\ãd¸Á\Ş\'Sü%W/™\'(\×Uvil¬r¸–¦–‚\à\ïºH1lÖ¬\Ê®i\ä\í‰q-\Ñ%Y¦–]y“‡*H)q²Ğ “\æ‘\rmª\×zr\ërÆŒ‹É†’‹‚Ğª0Û“@\r–\ä¤Ò›ğ\Öz‡œ“ƒ\Ú5\ï\×p\Æ\êv[ø[kz¾\Ì\çh`‡0\ã\Ğo#\Ğ\í•T_¿FN˜ê—H³.iŠÌ”½§‘˜¦¶Ï´\Öy”Ú#H\æ\0\à\äú\à\â:N´â—£v5F’ö*]©EúD³@#•„…\â9œ$’¢TNTI„\åøŠ}†¿\ÅğÛª\r}n0½ı\nfˆn¯ñ¬\×U5†˜ğ£tµ9T—–»¦ede\Û*N\nÔ†\İq\Õ% ’@H\éŒ\Åü\ÚÆŸ,»¥cT¡F³\äĞ‚wòG\Ş\ße]ı\Òò\\g\ê]Ó¯:½h\ÉOJÓ¦—¡\Ë\Î\É!i`>¾d%9S.\Û$¤¼|ñŸRdô[£D¨”d)—U5ª\Å1R\Í‚“È¤;°À\ÙÄ¬\rË©1lpMÃ¼‡\ÚC%§òmÉ U1Tœi®D¿4½\ÜXO\İH\Ù)’”\Ğ×‹ıº/Ùš.¥ieIª}\ïhL.f<óel¾\ÚÀK\Òo¤TÓ‰ B’’7a¨9…\Ã\rˆù”9`\Ò\ä\Ì\Æsß¯¦d\İğ¡\\Mpm§|L\Ó\ét½a£NU™£¼\ã”É–\ç9&YñB\Ğ]™h<‰÷TH\Î\â6³\ZE\á\é\Õ;JdœyŠ\r*]©yr°\Óc	BR9@\Æ\ç¹1š»q/Om‹Óƒš\Ó\Îòy»^å‘™—w\Õa\Æ\\Oûª\âgXu~²\Ñj‡Áõ\é\ÎrªµZ\\ª\êO´¬\ã\à\Âõ*¹ºuc\âP \Z&\Æ}Î¿\é\ÑTÚ•¡6%AÔšÊ§&İ·)\Ó3ò\Í.uA\âYq	RÑº\\#œòó\rŠ²0pbsÁ­…spİ¢“\Ôı3»jR\Ó5š\ì\ÍF©,©Ò–\Õ6¥‘·*r\0\èq¼k\î\í7Ö½Om¹MW”¢\Ûv\àu·g\èT©õ\Î\ÎTB–^‘\r´\ÑP\é@QP\æ\0˜™ie÷-Éª|\ëJC\â®ô\Ê(M¸ú”G)Œ+k¼M®ú+\İB•y©R˜\'€½uØº{UuK\é·5q?\ãB›˜V1Ì¤œmu:DsE-·-=/¥RŸIKªc\Çq?\Â\\%Xü‰#›(\ê\éj\å7Vğ¼®÷•\í•9b¨\Ç\ÂQUœvü`¤\ä\ì \ë+Gh¹«eg›—¼ö\Ì¬yw€s“‚€« F³Ë°Y•lH=¼¡ƒª\'¼<™?VF3^\Ü\ã¦\"\'Iso\Ö1\âc\Ê0¾¹ŒŸ\'q3vNšX\å\ëğ\Ì:•PJòOS\Ö#‡,òHˆ\Ön\ÛrZğµ*6\Ä\âAn~Il«=‰I\0ü\Ê8B¯eM´º&bjfJi/)©”#\nK¤•%IWL\àºvÿ\0”ZJyIøEYª|(\"ÿ\0½»¨7St\ÕN©\Ö“ñV\n\ÒB†\ä{\ï\Ş5œF\Ñ÷\r‚J\è¼?\Å)\Ø=\ìªa®\Ï\Ì~ÿ\0…\Ç:MS˜—¢1#Qÿ\0k\'\Í,\îF0¦\Ï!ı\"ë´ª©´-G#n±¤\â#‡•\è-\Å+9#Yv~N¶•<fa-òL#h\0gb9T>&5¶]h\à2µ\î\Ñ\ÍÕ¤ûw–;p»J®\é\n´Ì´«T\Ô$“.@$\'m„Cko\Î\É\\I¯ŠÓ­´ÁHK g=c´	\êŒ\ãRk™d\ç‘9;DB{Y-	9æ¤¦\î¥?4T©\Zzó›[ºÀfD•sZé†‰Rı6\Ô\íRnuéª¾š	6Y3)8qş|„€~±½¨\ßZš\â=¶\Çbfšúy\\[s\âYWcÉRŸıYˆ\ÅV\è­3‰\êuNH(sM\Óo¨\Øû\ÉBõ=i°h\Ì2õ~¯\ì(|„µ38Úšij\' R†:ú\ÅğFR:•Mz´~jeMS²’ \Ì5á•¨¨\'?g;ÁŸª\r\\\Ø#”`ˆŒKŞ²5‰ŠeI©™gS”-§’|ˆ\"R«%V\á;”±P–un£šSm2\à\ï°\ï\é4#Jy]\Ôj\n§Ü›ñCJt²”\0\Ú¼ğ\Æ}c[nZ\Ó:¯¨\Ôû\ZZp°\'f9\\˜\róøhJJ”¬dg\0³K¤š#¥\ÏMU&*©™O\'Œ–<46Œ\ç•)$\È9\ì#7‡Z>½AP*\Öñ^+NÂƒ©\ç#ã‰ŸE4PJ\ä\0\0º@!º•±\É\í\n¸¼Œ\Ò:¬uÜ‘¼u+\Î`•‡\Ça×¤c œ\Æ\\ÁI\İü\à€T\n\ÉW½\Ê dt‚”;\ÆrH\Ì:c²Yµ€° ‰\Æ70 HT“”G”|>c\İ\Îø;ˆy3•#›\ÍÀ;*\èR\í¿cˆ)8\Ú@\'\ìÁT3¾;\ÄPJ ’3\ĞÃ†Tz\ŞF\ãg\ËDE=—Qß¼l¤P#=#[.\"\Ê\Ì¦\"B!B¸¯±©÷®ˆUš\åKô†BQ\î\\”©°J‡ÁI\æ?H\âª%AR“¨<ıO\Â;\çW\Ö\Ğ\Ò;˜<°”ş\á›«ÿ\0d¨ó2©wL\ÛU	ğ³‹—À\Ù\'øU\å\ècš\ãz[Y§¸]¿…œ÷Û½ü«ú“T•œ”\r¬x…«/=(zÃº\Ñ}it –q>\Õ\âK\Ê/\Ã™RTúÀû%K)I$‚r2—{34\ÂT—Á=÷‰\İ:~N¢\È+ Œc¨eU\Õ1Æ“¦$v;$l\î!µ¡T#,½A[Iu´6\ì¤\İ!•`%%;+—9#©\í˜\Ój}\Ñ~j…-4\ë²\âz²\ÓO°ì¼—	o\ÅeÀ\ëjDò”­ \äuÀ\ÌL$­^u<\îÈ¥K\Îü§\àĞ­ú:ô¬š[<»\çx\Í5¥‰ì¬©©”šÀ~•i¡\\:X:N‰ë’mµ%T©¸§gœe\å¨-EEg9$’w$×k\Ù\ØVü»\ï\Ò6Z\Â%‚¹9wôôˆ(÷M²dg9ªT™”/%<Å¿a<ÀwÀ9Ç¤`j¼4wR¥R\âjT>ªü\àwOœœŸ©j¤\ë_T\Ò5D}¥œV>•?5GCLº¢p“°„­[B…`Z’v…·-\à\ÉÓ˜KL¤\îUªQ\î¢rIó0w@\Îz\Çgm@[\Ğ–ñ³}v\ê½\ß‰º\Ô@;õ0‚\Éõ³Š\åJ‰Nz\ì!#\ï\0pFÙ‹\Ö )2­÷‚\îU\ï+nûA”r1óPFN~PÒ™\ï˜\Æıœg#\Î&\È‘\ÛY	Àı F §h%W¤\">p€m±´6X\É\Æzˆp\âJ’;B\\‡sˆu`\Ù$Pù\í\Ö0´d\à*J	\è?L¹$XŠF\Û\'ra\ÃH\Î\àôƒ5.psÓ¼.\Ú\0\Ø\'óˆ†¤fZVr	ˆö³ë˜ğ\éb»¨Z©q¢Ÿ Ó¦’3³«\ì´\Ò:­gn\Ø$\à\Ö\ê^¾\Ù:m.\ãN\Î&z}y)w¹şúº zn}#—u?L˜\ã\ïXl­FÕ™µ·gYÔ©‰\ék6Qd1T›}\Ğ\ZveD\åHKMƒ\È\0\Ï>	\ÆAf\0\çge¼zwS‹¿)}j\áŠ\èÔŠE õ\ÜT\ã4\Úd\ä\Ü\È[³ªuô0TR‘„¤)Ä‰\ß#;G3T)\ÌU¤T\Ì\Ò\Ğ\àÂ’F\Æ:·ˆ™\Ö>\Z®-³e\å\ägf)i]¼\Ë´\ÜÜ»¨˜–@	ÀJK!>@\å¨º\Í\r‰‰\Ù7|§2ï§•l¸œ…6¡\ÙIP)#±9>>\í-1ˆ\Â\ï|-\Êm£\ÃNC³ô\Çò õ\Z•Ã¥5\çi\î¹1O[‚	Sdœ\0–|ÿ\0±t\ë_(³¯!/Mò@q·6)>£¨†õŠrÜ §ºH\ëê•[7(K­²\Z}*<®4JT“\èGH\çÛ­¦\ê\Üh¹€¸A\îº\Z\İ\Ôja7<•‡\0\×ü µ\ËşEi‰™´6\Ó\ß\ê#›š\Ñ\ÍC§i:—?,\Ğ;6 ú\Æ\â—`\Õºt\İ3•\Ñk\äF~2yÎˆ!cº“C§\ê¤\×VªOW&§\Ûm­\å‚\ï\ÜOn±³\áÊ;+¯V¤ÚšT\Ü\Âk->\âB·Pl<¾\ÌjhôFeS2Œ%)d¤u‹£ƒ=;z©}\Ïß\Ë(KÑ¥\Ãl©—F9AóK|\Äùs§\Î2,):µ\ã\0\ï?L¬.%]–ö{õÀ]I¤Z÷¦:õCz³§W\nfU*¿£\"\ây“w%%$ô!IP\È\È\ÊNûD’i¤\à˜\ãË¶¹_\á\Îş¼\ï«—+#8\ì\Êf\'» ‰ö9R\áSˆ#şò÷Js\ÌZ\Ï«zQ¯ô¦\ÎSœ\éIöª{À$¼‹\éğ\Ìwd/.u\'•Ô´û\ä\Â¤¤`wˆı¯­zqy1M¸\Ä\Ê\Î¬\ïÔ¬Ÿ!Í²¾DÄ‘I\æ9Ï®|\áFR”Ü¤ã¯¤c”±?UI;\í\Ö´¨dóJ$\å\ànNı\ãmœÁ”’\0\êc`ò\ã8Â’‰8Ymsu `ò@²¤ó!\'=¼ ¬ö\"¡\0x~¿õ2\ÍÓ‰TL\\•	NgÁ—m<\Î9!\Øz¢\Ä…·m”¤\äŒÆ†ñ\Õm>°\ÛR®k¢Y‡œ‰d+\ÓğBrb„\Õ>(.\ë±\Ç)–›\ÎR¤N\ßP¯®t2\Ç\Ùø\'ñŠ¥\ïi™}S)Ek9Z”IR™&¬%6—ğ¯»³yF]2\ÖU¢\\\0a357¹Aõ\äFÿ\0œW\×:§x²©9Šòe%\ÖpX¦·\ázd¨ş1fœ‡}\âr0aCD”¢S‚2‹¹M@5¡7¸Q7V TZe.*Q\Ğ\Ñe˜´øh”˜gÙ¥\Ö<%\Ò\ÙK#mÀ§\Ê 6\í9º¢f‡!ğ€\r¥=±¾ñ¼\á\İõ\Ò§2A–}\ÉGO°²\ĞCaX]\å]+O–\åJT\Ù9I\Û£Ÿ8¨\á\Í\ë~\àš\×kœUM¨9\â]”\ÖS¼¬Á\ë:>\âöñ\0\è¯¢•––T\Í=ª„¶p¿.\Älai\ZCŠm\Ö\ÒN\éZT2•¤\ìA¨#¨}\å;\Ê%ù\Åe\Ø_Ö°®*3=\Çp¸\Z¡$&§¥ÀZ@\Î\Ş_\Ş4ô–U;5„•lsƒ\'¯<)\ÌS}¢ôÑšzß‘W3³\Öû{¹*z•K¾ü>©í‘°\ç)j‹ru#2\âH!dË‚\ìGb#Š¸´©k[MAıô^‰iBú†ºF#Ğ­›ró\è÷t¨v\Ûsa‡˜C\r6I\îOhYw…»Œ90I\ì„¾P¥¯3\\¾®I[7N¨*«O/•†‡\Ù@îµŸº„\É=¢¦·[ô·%d9\á\Ô\ì»³\íj\å\Ût\É\Ø6\\Šf\ëJ9‡\ÕÊ´1\Îû‡\î¡\É\îN71\Ú6Ğ´\ÒĞ“²\í\æÊ™•I.¼±\ï\Ì<­\Üu^ªVşƒ ˆÿ\0¼?Qt&\Şu±4š\ÃRJU[¬©.¸i¾\éi\' \ï\Ô\ï\Ò\Ã÷%˜[Î‰\Îñ\Øp\ËiOS½\ãöôı¯>\ã\\WÛª\è§\î¹\ïú\\»\Å\ËM\ËU\ë\Õ6O+\ÌÑ•Ê±\ç\á+\0‡\àb?M§½/A’J#œ\É3\Ì1’œ\àF\Ã_\ê*ºÜ©¥.eUZƒRL|\ê[Ó“Êœ‹\\‰C)Ù½3\Û\Ê6ñ…­\Õ\0(MY¦¥¥K\Í+\êú”¨t\ë´I´\ß_µ\ÇeŒMŠŒˆO»\'>J‚G’ö“ğ\ÜzB3´‰\n2Ó’\ä(l‡A\ÆG—\Ê5j¥&[™–U€q\Ì ieVt¸\å^¶Ÿ\Öm´1^–™¤¾F	y>#Yÿ\0y;˜‹—Y£\×eS=F©±6Êº;.\èR(\ã§eˆJ\ãgl\ä÷1±³n[ŠÓŸı\ånU—t\0HF\á~ŠOEŒ!d%\åö+®\Êzú˜M}3ñ\\X|HZµy$J\Ş.	\ä¨%Å†Êšpù‚2S\êH°iuj]~˜\Íb‡PfnRe<òó2\î¡\Äù…\rˆŠH#t£J£$@ƒ¡>\îPñ=R\×)j•\"[Mk\Ò2D\ÊM=p©\\ş\Ø\é!”°S²FyÊ‰\ê\09Æ©7Y¬Ô“S©\Öf&–Nq÷µ,v\'´u**/]•y™™ >±£\á \î‘÷8¢\îj2““2,²”¥—\Ö\äbú@(&#*-+\"…aKN6\èL:T*yP\Î\İ!\ÒdT”\î>b—h©\Ä$ûŒF@I\Zo³\Èx\än:M\æ”µ:rPvõ¥_\ê\é«	·0\ÊLû](´”\àD00Ki´‚¥­KNJ”XR\Şa\Êj \ÓYIn ™¦O¢\Ò3ıITm\ìúr$$Dº{w\Ä!t\ËZ\Ãs)Fò\êm^¥>ò\"¨„Ê’I]§•†g©\Èaô€™–C­\æ#xw?OJ^.´w+ı!¸…NÆ‘eÀ&)\ë,¸9¼G\äDODúf‚f\ZW2\\@ÿ\0h¡\Ò\n¬Di\r¸mjJ\Òv \Å}¬ü,\ÙúÈµ\×\ä‚(õò\ç\å›ú©£\Ø<\Ø\êœ{\ß‘c\Î\Ç(†jf®\È\Ú7K©\î8*÷\"&ñZ {›)$ÂbV¦\ÚGó9ŸºbŠ\Ô)Ü³CÄ…}ªö)?\İ\×\Î\è6¯\×õq\Z1B·\Zı\â&\\D\Ì\ãsm¹.\ËH -\å)*\æJFv\nHQ;˜\í\Î8q±ø{µ…2‚k©Ì¤~ô­<\Ö™=yG^D\Ñ#\ârb¥¥ZW½y\ËÜ¢a\Ù6\åuLÓ©\áKö”¨E­g$¸$©j*W6ı\"\ã±u¦^¬µ§÷-b#tª]O±H\\óaù¶R2§[k<\ä½¶\Ø\ÈÛ¦5md\ãQƒ\'©ş}÷½¿¤)T 7°\ÄüJrß»¸§½*¢R6\ê³2\ËZ·òI‡ó>GH\Ú!Ú­8$\ì9÷\nğ©®Fó(gúB£9²µcu@Õ¥MJ\ï Iò•%©·f\İOşSD\'ú–˜—L2\n1€\Ñ\Ûbzú›R“\'Ki¤Ÿ\áqÕ©Gú[O\ãgZ	R‰;\ÇUq9Z	\ÆT\Ì×†yVr’{FŠ\ì}T9tÏ”ûœ\à+\àbk\ì\Íe·\Û9…yDCVå’»q\ä6=\Ô`Œ÷\ÄºSºj\Óu)›\n8#l\Æi\Òn8\äË¡8	ÀIùB–—øŠ#/$–\Æñ³’–\r\Ë::\æ\" ­m\nš¹ú»S>óO\Ì%I\êA £bc¢ôšÙµ´¾Ò¦\éU¯M4ºDªe\é2ş\"–\Ø\É\æY*\'s¹91HY\Ôõ?p\ÓĞ„\î©\æ»8‹\æ«&yJî“±¦\"º¢B’N•¶•Ë°\ï5”‹ªTI\êò¼‚RN>\Ğ\ì`F:\\¨©„NË¬´H?„V—ı5-]Uˆ\Ç\×\ÄE¡Al³5.1\Ñ@½Z§!›Á\å¡Y²…«xÁı#&˜€2\ånY*¤t«T\ì:• cş«l¬\Ì`7¤¤ ğÁ\åøÅ²¤­%uœÓ–‚œm\Ò4ô\á²\Øş-¢MtI”\È-i\êHÚ²«T\ï/&ra”K©”¶”\ãx/ù\0h_½\Ñ&YÄ¼\0\ìp¿\é*„´©e´‚ñ\ådYªRœ–š¤…!c\Í$`şQ^¨2ˆQ£õeÑ«u:CS‰\æH\í\Ì7ı3õ±4\\a\Êz²T…7\ê“ÿ\0?\Ö([tMS=÷²˜ğ\İ\ÈÜ”+üñŸœ^”vW.\ÛSÍ¬\ãbHi\'¬™Ê¬„ò¹\\“¶\é/\Ü3\å^«ekJz¨öHõ\'>eø\å\ã\'	7õ\ä\Ô\rd¹-ûZ¿3$‰;~·1+-%(•\0\Ë2\éB“õ^ZP=W²I¥+\ÂBb\èi\Êj™)—)!)=I?xÿ\0aşq\âG\í!pˆÆœ\ê}—\ÄÕ½N(f\é”]\àR±•HS>«`©?ûu±kj‰\êƒ\éµ\ì2\0Tx‚\×\ê\äÓ³u}t¼\æœ|‚ó\İSj+\ÇL\å\Íñ’~\ÏWeù¨\Ó|zjL\íMÁF[”\ë&rnmkq÷ùJ&&9”IR“\á$‚T\çğÇœœ<h•gˆ=j´´BŞ™n^r\ë¸%)lÍ¾yPÇŒ\êP\\$öHQ>¸¼}O\é/öº]A\Ò0¢·#D·)mIHË¡8\Ê9\Õ\æµ­Gº”Leİ–°\0\é(Ó¦Ü€\â“S5\ÙÌ­!/#İ˜m=¼Ç¡\ê\"¾×Š¡›ª\Ó-\æCr\ì¹2úGu«\ÜG\à9\Ï\ÌD\İnuŠª\ç\åÊ´vXò1^jz^v\ê¨U%\ÒTÌœ¿\"–~ò’	Pùtøƒ\Z\Ğ «\àJ\Óiì¢—©Vy0&\êNuCA-–R¿\Æ7ª—!EI>•Jr•d\Ó\åAû\"\æzó¯\ßWõ(\ÃòÊƒdŒo˜yDœ­k¸—~¬€Jº\ÄCum\ÆÛ¢º\Òşú‚G¬Nfšt§;½\â!rPŸ¸®v%\İİ–Î F\Ç\Ë1\êOt\ÎŞz‘o2¤¶2h\ÜS¥Ã´õ¸RHRO\Î\ŞÌ®Q¶%\Ù÷y—€”m$™,R\Ñ©¨INô\æL9zRš	\é6•<\Ïö‹±ô%\ÇŒnNb©ÒŠz—{\Ë(#fZ\É\ÇOw\Ş-–P[®¨dl#·P9jœ”l,…§p`CŠ«O¦lò\'b\é*€¯\n?añuÀ¶¥\\v\îŸkÅT©N>–¤$dªm—ŸuG	J±$\Ñe\Ô4öÂ«Ì™ª­©&û¸ÁZ\Û9Ç–\ÆË¦u…«t‚µ\êÑ\'.óªÅ”\Îû…,öŒJiV;\î\ÊP¤\\ ‘6¥zvT\ÆDº\İcC4¢zX¥\ë=¥$ù>\ç\ãö¡µ?‡M’wÅ–³\ÂW\æ&\İÿ\0Š\"D¹\İÓ·´KLT0-\å\Òÿ\0\ÎoE´\êXŸ”úÿ\0\â”X\"¶6P9\İ\Ó%ğÙ¦O\Î9ÔªaÀ·@œ8\æ\0€G¤H%´\êÛ”–C\r¢`%°“€1$K\İı_Û§%)˜±ñGùG<q\ïôRh\ÒC·\í½`¾n\êD·>ü\ä›V\äÜ»a×œl6T\çŠ\ÊóÊBq´¬ç°4\0Akwu\Ïg\ìÁpc§\×u.ø³µÿ\0T¥jy\æ§$^’¶óKAÈ–c\Ñ\'l\É)¶ş¶a\ì‘\ï(¹ó\é¹\ÕÕ”À‘”İ9¥µ*¹f*/¤+>ñ	\Ï\éÊ§–\íJ\í-Ë¦q	y$8¡.‚NNUß¾ÿ\0ŒºZ‡1\ãª\Ú?¡t®P\Ûu÷’r\0—Nßœ$­§­\Ü\ãş\ì?\ÎRÖ¢òwH/@\ä”1ş¯²£ş(E;SÃ…\ár)*?hû \ßú @†\Ò\Ô9\î˜W8W”­>\ÜÀ¼\Ùo 2 \çú\áÒ¸kk\Üÿ\0µƒG.—_\ê!ka\':§u¶´4Z^Ò©=Q5£0§[Ù¹yFsüF$i¶e\Ûl´§Ô¬œ“\ËTZ%cû¤Ÿµ¤f\â*aÀq±:\ZŸ›Sºÿ\Ù','Derek','Limbo',19,NULL,'09463276543','Cuenca',NULL),('U0003',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0\È\0\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0Q\0\0\0\0\0!1AQ	\"2Raq‘#B’¡±3rÁ\n7³\Ñ4Sbv¢´DFTcdet‚ƒ“•¤\Ó\áğÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\09\0\0\0\0\0\0\0!1AQqa‘¡\"\Ñğ2BR±3S‚²ÁCbr’\Âÿ\Ú\0\0\0?\0\åøR\Îr³óƒ™^Ú¾qA\Ôüb°.‚9•\í«ñAÌ¯m_Š B9•\í«ñAÌ¯m_Š\0R’~!\Êö\Õø \æW¶¯\Å[‘›wt°~ø¼š$ú\Ç0@$±9•\í«ñAÌ¾\å«\çj¢O¤d |¢\Ò\éómõdı\Ğ\"B³Ì¯m_Še{jüQU%i8[jñH£™^Ú¿\Êö\Õø ‚#™~Ú¾p¨ó«\ç8\Ú/ywü\áùÁr^GSñŠ\ÅSñŠ!\í¦}\\­ “\ÚKó\ê”„~°°·\í\0OdrG„	~\êM\Ómw\æ3Àû“\n\Zm—\Ó\ê!T)›~“1\\­M5+)(Ê›š}XCHH\ÉR€5/Y´\êµa\×.\Ûv®Ä¹§JL®œk.\"Y6…¸\ÈR¹œh¨\Ì\0\Ü\ã¬:¨JÈ•²’\0%¾\è\ËE–’6l{öˆñ¥\Ü}_Ê›ú.ğ¶\é•G\Şq¦¤Q.Ç›ó-N¤(­aD\0N0\Î3\ß\n\Î µŠù¸o\ÛjFÇº\æmº+³Jm~j\ï$\Ë\ïr•s’’’\0JS\ÜI\'9\Ù>\É\'4\î ƒYÛ¹1‹3e+¡¿\Ê\"§\Z\ç¨W¡&F^\àªH7Ma ¦%*\nm•»É\ÙN9	\nÁ\İ[\ä‚Àwxd\â·L)62\ÊÕ»ş¡1YziA5	\É7\ÓhZ‡#Kx\îy{\ÔG(\æë˜$\Ş ¥½B\Ë\Ø\å‘÷ˆOÔ­\'eó\Ù$ƒ\Ş<!ôœµ˜}8—yµ\çEaY;B~¯g€’\Î¼m\nZBdß”˜•W+\È#ø‹p\à×­ Ako„#j´G\äVT”’ŸCT\í¨\nÀ€œÁ‘\ã\0\ì`R*ò\êñ‚/#©ø\Æu’\åAĞ¢=~qO”rvd4¶w‡Ò·2\èm£\ã%vÙµò”\Ëh^P-B\à-m\îbı±m…M»„5¼Z\Ú\å#b\Ğ\î\İ*­OKSisŠU]ªTÒš˜.¬¡,,r¥¤aĞ«$cpğ!yIZ=\än\n\İ¥|\Ì\ËnÎ¼\ä\ÕT·0.B@J\ÆU’¢\nSŒ¾Øº£E¿*u9šÍˆÔ«T&‚Ÿni\çF€BA\Èzı\Ğ\á\éU:r^‘5X¸ß~¹?4^­\ÍTTµ8\ëÛy•\ë`+¨\ÎùŒ‹Ê•JÔ«fnÕ¦\İ¶µ©=¢\åœK¥<ª•I¦q\r&J”S–O™-7Òšÿ\0<·\ÚZ\åä¥\×\Ì%;©]y“o\Óh[\İZquN¦Fn|\Õg¼\Õö™’Cs`8\ÃguX¤¸\'=I\Ú\Z\ÖjÈµe-\Æ\İ\í‹	=£©N9Ö¢I?Ÿ¹)H\çQrOHD\æ\Ñ¹¨÷B\Ò=F½«s+ª³0\Â\ÒIzz¨;Ew\0NJ\Ãa:‹û?§\ê\ìêœ¯4ã¦œ¦šKo2¥+•ú¨\0`ú^\ÏLˆ\Ş\ßzµj\Ø$\ËT\ì\Ä\ÙG2ee“’3Ó˜ôN}ûû¡gq)G\\\äÀº\è\ÆQ/)K¾O\ÙI¦\Ù\Éû Mİ¦\Ó¬\èó\ÚÍ Z¦«’‰Hz¡=+Kt™d,8\Ä\Â ,’/?¤B},£lu‰Á°\ën±^w%;V)K2\ëH~@©¶\å\Ñ$°O3\r¶p\â\ÒR s\éròn},\Ãÿ\0\äö\á†½S\áº{\Ş3o:#L¨.I§\ÑûS935\Û‹¯vZ\ØY)H$’I)Hôi\í2şM\é7Î§\ê˜’œLÄ“’“„:‡F@\å(–\É;\ã¬sªb”©\Ô,k\è0K[\"yO5\ën\ç0;}¢sc$\ÈW­P9ˆk¿q\áK–\Ö)A¼û±3c…8‰“›²8r¾j\ìİ®\È.n˜\åC\ÎK†2—C\Êrpy†rÁ_¶<\í\n­=D¨°”\ÍH\Í9/2„¨(YJ€#b2ñèµ½¥v\\\Ğ\\5s\ĞôPW·©n$xƒ#¢u\Ú#’N—\ZA\Çxğa\ÜlaÏº\íÍ•õy÷CuX\\„\ÉHG¢N\Ñ\éE7H‚±²Ÿgó‚\'\Úü J•6u™IYNJûC©iĞ¹ŠR[\Ûl\í	‹.’0’[ğ\Æ\Ğ\ê\ÚtpG\ÄÃš¼ot•º·(|©I-÷mÓŒ\Ş\"H½\Ò\ZRŞ•¢\ÒR‰\é\Õ1VS“Ï¹É„6¦¹BQ‚²{0T£„«`1Î…N”m\ßµö•ª\×²Ğ­÷k¶\ÕRuS¦zMi+‘J†Jo ¡(\Üsú¤c$D)\ÑFM•o‰¹®fF¦8ı%´)3AÄ„¸ñ#bœú x¹1£ú£§–\Ëõ‰š´²¤.°[`­)gr##Ÿw\Ê=[\\7¾\í¾\ìı\Ö\ä\ËªPòrŠmD\'?h²s\Üv;ô\å†\Ú]r„\íD”š¸Ã­918J‡›%D\0Q£ 2s¢79¬nóŒ\0½\rmg¼@\Í,$µ\ZÏ¶\\»Û«¥öÖ¤II$`\'®Op\ÆLgPn:%\ÓMMR‡>\ÜÌ»›#¸øw\Üa¡¾N{jœ©+–ñ™~fnZeEE\ç9ZQI™\r\ãqœ\ã›=3¼H \áGLæ¯»nß­S[˜—™¯I36\ÈAJmS(\nIÁ²J’O‚‰\ëk½±Á­jø{\Å\ÇL‚´\Úl®3qK\ÄsCDNj\\¶µ\ï·g-u­\r¶ş;UK„ó!y\æ\í\×#¿º#}rÓ¯\ÛW–¬\Õ-kœIV\Ú{B°w\ç ‚#\ê~IŸ\'#sM\Ëp›n0\ã\Î)Nª]\é¦\Ê\ÔNIW+\Ã\'>1‹)\ä†òmH\Õ&+rœ\'PQ94\0˜™ó¥k»%ı†Ã§„k,c6;\Û\æ¹õ0:\ï\Ñ\Ã\ß\ä¹Ë¥•\ê/ôe¦™›§LKL\É\ê\ÛÖœl¥A³Z•\æ$\ì,\Ä¸›«jÿ\0o\èe•RWÒ•ú\Ã2ÓŒJº}\ê\Ê)Z‡*=NO€\î\Ì}»Á/\n\Ïh$\Ï\Îh\Í8\Ø•\ÏL\Û>s1Ø¹0CÁÂ®Ó´\Ïh\Ú\ëc)\éˆJZ\ŞK?\'Í•{±©\ÇVü­vY¥7/S\Í-\ÆÒ¤”^gˆ”‘ÍŒ\à‘˜òY\í%¹©¼\Ç|O.\Zhc\Ï\Éz.0›Š­hk†MÉ‚òQi…J5na\Ú\è{\èú-¡1-*©‡9\ÜRCŒ\åJV\ÙQ$“\Ósÿ\0[\èİ¦¤Ü«Jz\×\çOş\áq\ÔûBô—Lëª¹¬K\"V›>¦Ê¦Yq\ÅÚˆ%8Rˆ\ê‘ò„ı[ƒ\ë“óJ¶Sß˜š}oL:§\ßkRŠ”­œ\ï$˜Z{Kf\Ë÷\×,t9­\')óóQ¿¸u£)o	<c\Éq¾\í¡\à+\ĞÛ¿\ã\re\çCôWõ{÷Gs\æ¸\à\ît5¡µ\ç®ffùbùaxn\Ñm«\Ùú;`JP‘SŸ]A2®:¾\İHq‚{E+ R†\Ø\ë{-¡´\Ä.[EŒp&uy¯|*\âÖ‰¨\â§\ä¹\éôs¾\ìÁ\nŸ£Zö\Ê\î¯ˆS‘e\ÓA(\Êv¤:v´€	A\å\î\Îğ†²\ä÷I	\ë°\ÚûrS	HÇ‡H‘yÎ©Ko\Èç””Å½o\Ñ\ËWZtv³b\Ş4)š”›²şr‰IõJ­÷™ú\Æ\Ó\Ú\' *H9\è\ÜĞ¥G*p:\Æ\Şñ°\İ\ÔM:®XLU\"º\Õ\"bI\ÌÁq²±\ÂğLœ\×3P„\ÏO®RE–Â»u6e\Îp\Ù9\'»\ŞbHpı¢ô\Ë^X^	$	ÇŠƒi\rê«—´V\ê!q“\îˆ÷ÁŞ€\Í\Û\Ú\Ã_\ÓY»\Â^¨İ½Tx\Ô^–J\Ò\ß\Õ>¹e¥<À\Ú-µƒ\ÑI>\è›\0\0@\0°Ñ™m\Î2úDX\Ñ0H—t:ÿ\0Z­;bğ¦Wi½ª2\Ôq\íõ¢\0`!C¤\ÖÍ­ş²H¼7	\èP\éõ³k¬’\ï\r\Æb\Ï\Æ‹Søg¢\êëŸ¼Wñk®\Î/´JÊ¾*v5ÁWiT9Ÿ6®U‘OR¤)\ÓG»Q,¼ğ>‚Ä£+wÇªœóXt\\ıâ¿ˆ\Ç?\ïûµ9oq…¢\Ó\Ô)‰\ëº\îº\æj¶e9¶J\ßy…Q\ê&›{>\Í.KóŒu†úœEò\ÆŞ•Ãœtw=\02²\êõ_I£t}A>\êI\Êñû\Ã\ä\ãT/7z¼©‹‚í’¶\å$~…=»ór­\Í\Ë“\Íõhq‡R\âW’0\nHjÿ\0šn\ßU­:œ­\Ï;R¡\" &¼\Ú@­§¦$dšš”iyú\ÇÛ—ul¤%${Ñ˜]U\í]^¬Î†-©½l°¼ó„öJM>\Øz\è=\éhº„,ı•“¸\".KQ\î\Û\ÏS\'.\Ô\Óf¤\ÃÚƒ}_Iš)Š$\í«.\ì»\ë8B\Ã\í´Ğ¯)‚_\î‹Y\Ô\Æ\ì\ë\Æ&;h¼bö¯!¬vú\ÍM‰)¯\nõ-:›\Ô\ê}N\ávBFr/3,›yÁ4Ÿ¥Q\Ï\"\èl¨s6\ç«\Ì	Â¶ F\æô\ã\ÏB,:ÁtÖ¥®Wi6\ÓS\îO\Õd(\nz]\Ô\ÈÎµ%8ZPW§\Ø\Ì<„+a¶T2‘˜\æ}p\Ói\\2W-\n¤MNiZUQ•ª-—§%\ZPir\çnNVV‡vY%\Îl†ı‚NË·®]u¶-}IjMõ\"Û©\Ì\nlúŠ\ÕlV§+\Í\È*QDŒ!O,:¤”\ãµm¶Ö¡õaP\ê¸E7b}D7Œk™‘ªc/«¸p\Ó\çòS÷J8Œ\Ó=i½.«Áš˜›³W$Š\Ë\ïI\Ø\æ›`L2\ZY?Y–\È\'\0c1¼¸rİ½sOA)µ-ÿ\0ñ…O‘ŞƒP³®m^³\ëó\î½S’ı“Dù˜Q.v¢Œ”º}—9\Û>\î–ÁÖ³`/½4úöŒB\áT)\Ûm)°\È÷dÿ\0”\Ûê®«…9\Î\Öô¹\Ûôb|\Ê\İy¨öD¢nª¬´²XO#yNù\Ì9–\ãI<\Û\Ù_»G\İ]µË”\ä@3\n.)oBh$BÒ†\Ğ\'\èG\ĞJy’{\Î!iD\ß‡\n2¢%?O¤´ßŒ\İP§\ËJvB¨Y©4B0‡\Èx\ã\Ü\êÁ÷\æ\rF¹¸‰v²ªNŠ\Øú\å¥Ó‰Š½\ÙPu–\İpı–Zd© uZ°	;g‡U\è\ÌTø©\ê%>m+–]¼\Å-H\ä!AöQYğ)\Æ\0=v;cx³v\Ô\Ş[¢«V˜mA\0g˜\0:¤G%¶\ìÅ¥À\ÙúTªS2NPH\ÔuL\rÁª¼|\Ø\rª©\\\á\îÓ¹¤›\Ï\"Öª<	\ï!.£÷ Ä€\áJó\ÔJ½|T-yª+\Õ:\Õ=õR\ç”²ù™@[ gp\Èhò;\Ò:HIÕ›X““ûI!şğ\Üp\ë\ŞQ¹cZ(µVÈ‘È‚H\î!v©YÖ·.q¬ç´ƒ“ Á\æ\0ö2º±PšbB]ùù’ \Ó\r­\Ç\nPTBR	8\0N@	=\Ğ\×[\Üjğ\ÅuÑ¨\×M·©iœ“¯7\ÍLšf9\é4gS$•¯,\å–\Õ4´²•¸•/ ƒ‡6¶´5MœqÅ„¥2\î•(œ\09NN{£’¼>\Ë_”C5›F\ï9\Å\È\ÉS\íûúÉš}$U\és÷Túe\Ö\Óyú\ŞGĞ²¬aM©--$l\\\ì,©]\Ós`‚\0\å˜q\äx€Uœ\\\\>‹š\0\Ôhù®”\êO|;iòÎ˜j. ³M­¼€¶)\ê¦L»\Ì\n¹\nm¥#\ÔG}†\ç¬h\é¼|ğ‘Wª¹E§j’›mº¡[)·§ó\ËMA\\ğ\Éc±\0•\ã€2H\Üq‡jYsüğ\åO«S\åœ^\åjª‡\\Áœ@¤¡¤…oÓ—\Ñ\Ç\Î!Æ‘U\åÕ¬óO½q\É)…K\ëOf\ÈZB›Qd’¢®oH(r\à`cœœ\í\ê¶\Ãm«Û‡’\é-F¿\åş\ßu[ª´\ê–\å\Û\ç\æºecñ9¡\Z“b\Öu2È¼<ş‰A§·;Un4\ÎYrşrÛ‰Bšu%•s‚„«¼uÈ8\è\áAVı6\í–\Õ;L®*)“òô9Õµ4¹Õ¾ÜªB’Ák\\³\è	;…6A\0\ã,÷“\Ò\í¤S8\\õ\áO›¤i\ä”\Ì\ä\ÃE)\é5Q’©iw•œ#‘õ{\nÛŸ&mJÎi-‡Wk‘eñ=h\ËZ“³JšM6mÉ©ù5¤9€ó…,\ïŒ½a)a¶\ï¯Q„Ÿ…ÀÆ†:s#±C\îê¶›\\\0\Ì_^« 4>:¸R¸jnQ¨úª\Ú\æ\ĞÄ“Ë—]\Zqµò\Í\çÍ†\ÈÊœ!@\'\Ö\ÊH b.y_+Ô‹\ÂOM.º\ëzF§B››’u\ÆÒ–Ë†]hQBÀR2’\ÜiøÆ´«“úù§º™¥õ1=\'W²\íyª•N” \Zœ”¸SNral°·fùÒ®şp®øy|²RR\Ô\É\ë™*œ5-JŸi‘\à”­„\È\éa6”-ñKw\Ó$\ïok\ÂŸÄ¯ıj•lj\r7}\ÈP+²W±ùA²<D|\Ş\n°”vSÃ•³\ï‡2\İpƒˆhì¹±„€|9ö\ì\Ğ\äF…L9\ãPHR-(/\à\'\Ç0\ßP\æO\"NzBÎ‡4\nFû÷Â¨\Êko\ÊT\Åğ¨J\Ì4¤…\Í-ÖŠ‡®… Gˆ\Ş<\Éğ­xq¦÷…ùl\êz\ØgO©ŒÔ¦¾‚u”ªwµx7Ù¯´m{%\Åøe r0\ã\ëTƒU+\Ğ.\È\Í!I^7_¢¡ğ\ÉIû¡®§\×ë´©	\Ê]*·7-+Qm-\Ô%¥\æV†æ•s%.$,¸ Ã±\ë`8û§\âkp\Óóo¬ƒº}@[f{WÀ[ºw\\\ÒÖ)i:Aø›\èJmi\Z\ã©*õ×¬wµ}\ê|\Ïo*\Ä\ía,K…}v¥›m.cı,ƒ\ŞHx4úÙµ¶ÿ\0Œ’?\í\r\Âna\ŞÅ…½Œò¤œxÂHy†«Ú©Y_´r\Øñó†\â¹R\âµ\Ã\Új4\È\0:X[B\nn\ZŒõ\'\Ôæº·4\Ë3	r^a¤¸ÛIqµ¤©\'b=Ab4”\Í0\ÓJ,Ô¤\åN(\È\æ\ÊQXmr\Ù\Î{2”Œ•+\ÕÇ¬|c|\ç\ïüF+/şP\ßñ\Ö-\Äg\nA\Úz\Ã~³\Ü\í¹fŞ–m\ÏZ¢6\ã\Ì.NfZjnA)s³qh;­°Š)\Æ0wJk|\ÉÙ’º¦\ÚôÕº\rMÙ‰y*ú%$D¼Ò¹\\¡„\á~‹ov€U\æ\Ø\\Ü´\ë?‰û†±Py\æ*I¥j*-e\Ë(aù“ZGh‡Á*V[Js“Íœ`fÿ\0ONÿ\0…\İÑšû( Zš…ªTy\éZ“¢ŒÉ‡B^B½Eve\' +1\ß~)C\Ì4O`O¸¹\\\Ö\Ş-~mùû)\áK\Õ~d(\Õ\ÚUò\Óöiò\îK\ÊÜ’rJ”KAo6C-L6…¶“Ê•”$\à`EºÆ¯pc9N¨T®\ëN•¤3N›ª=8ô’\Ñ(\Û\È	‘ye@„…¡a,«\ÙP	81/»SR%õVj¼&\\­¦\å²5F[³¤\æÒ•&­)\'k=\Ú7‡\0J\×\æŠZù:BÀÁ\"ü]\n\í\Æ\Õ/Tmmº»phµš*´¶y”„-š)\Æ\ZÊ·ô\ês¿\"DIK	¥R«Gˆ~(\ê$4\æ:1>õ\íi;£)ÿ\0?Eu’VÏ²‘#+-\'iRS-,\Â\"\ÓT\æƒl´—R–ÀN´¡`\0¤¥]@1|´.U¬Cÿ\0WT?´b\'›Ÿ¼V\ßh\Äò×¾¬X)\ÏZ}GûF\"\r›$\ãÿ\0«ûJ\\\\»\İ\Û÷\n	sŸby\ĞğFŸS\ÖU—Q	-«›\ÜaÓµ\êhH*\è!‰³*©\åH\n\ÜC§hVJO7p\Îğ€\ÈLpNõ|PN\Ãc*,ÿ\0.\00\Ø\Ğ\êi\'\'¤,(\Õ ¤%\\\Ø0¡FB[Ö¥\Í~×£\ÔüªƒyöÀ\Ê0!’ c#¤;Ôš¨	^\âÚ—m7Hª}1 €%\'VIH\èÛ§$§\àw#\ïğŒûo°ª·6¬¼¦\'Ã\ïøc¯Y\à¯\ÛŠS·¹}C$õ\Z\ãö„˜q´:Úšpe*\"7šB\Ëòú·l>¹•8‘qH’BI\Ä\Â:oŒü\'ª“\é¥ÓŸ©-‡6V[heJ\ÂzEªw-g]lÆ¥ˆ•—rî¦§²m ’“4\ØÂ”z\í\áˆ\Ì-hV¬eº-F»˜\Ö\Öf\\¸Z.(ŠEG\Ö?ğ3`\äRj;\Ğ\ÕR\Õ[X\Å0<X\àóY\ŞI£O\n<$!\Æ]G0¹y™‰†-Ñ–\Ş}m­\ç\îR\Ô\Ód¤§ãŠ¸\á\ÅHl\è8\niÊ½C<‰÷[nL¨ƒ’\â\ÛqhQûIYI\È8‡/ÀA\à\"c^\ä\êó\êTb!ùBljœ;p\Ñ[ª\Ô\ëµ^©¯N\Ög¼ò«6ª&š˜\ì\Ö\×jµ	Wf\ë\ç\ØqI\èH‹·6‚p\çy\Ê\Ï\É]¼?\Ó*,\Õ—r¢\Ô\Õ\0)3\naC%C§ –šJ@\Ø\Ó\ìˆrp<Ç¸ó\ê—Ã¥úB\×5\\a–\Ò\Ëtz€J$Õ°\ËmYKÕ­?Ref\Z\Å:£´\Ã%ú\Æ:g¬t?ÀG9<¼³¦R»§	ö©•?\íeã¯³“÷\Å?\êşÒ¹ø¼}İ¿p w\ÒNœO\â‚ŸJl|\à:J§n•‹gWJ\nPUºv0\êZUÔ‚•øw\Ã\rOœ\\œÀu*À\Î\âR\äH\í<;\àª6\n6\İl¥ş}aeG«„\é\í¥µqDv»gc\Ú\Â”…/sù\Ã\Ô:\ÔÊ°!$+~ø\ÄÔ¹\Ä\ÏÛ’ò\åD?Iu6\æ„Ä•\Í)*o<\Ú<\Üõ‹µû†Z¥%+,\Ë\ÅD\Îg”\ã‹\ï\Äq6†½\ZX=\Ãğ	c &8.\Î\ÏĞ­S \æ4Ù€L	\Z­sO7˜\0/,x\æ;£Ş˜é•¿3­¶•bEK•qU9\Å! \nD\Óg¡\é÷@\ãhu<«Nprx>#\Â6š{\\—µ\ïúzµ\Ï\ær©Y—\İi\Ê\r¶òV¯Du8§_t`Ôª9\Şa…º\Ôl\Ó \ç’\ëc¿½Wñóoø\Åø\\qEb\ã¬\0I\ÆhO?\Æ-\Â\æqûGWÿ\0Ğ‹Ú­¿XõTO°^ÿ\0-Ş…>PC<£\Ü)cÓ¼*-¨(‚‡hÎ õ÷Ç¥ùF8YB;O\Úz©)¢:H\é\ÒÃ¯«°>\'8 ¹µnm\è<²£À#0Ÿ8!€™òšp•)ûû¦°1\×Œk¦ü«ü\Éf/\Z\Ø\ÇP-\Ç\Ïò‰>\é\Å?’\ïú•\Û\ìúƒ\Ô)!\ÌşuG\Ìn2\íR\ê¸ÿ\0–‰;\å“\àFCy›Ş¾\0\ë‹Z`ÿ\0(X.4ôŒk’ÃĞª\İFu›~B \ÍP\Ô)NJò©\×R9Bım®#¯X_P\Åú”\Ü\0œ\È hW¹·­f\æ±\àœ¸ù…>–w\Çó‚0\àWwB ÜŸŒeQ\î0|!\nSƒ=¾>\' Œ.\ã\ê*™_¢z4“·\Ş{ÿ\0Hº”%	H\0€@\àœkn\èŸx$%Ö™I\ï9Z¿œ/-\Ê\Ò\ãoMÎ¿1Ê yV÷*~)À?~a‰¦U\æ)\ë\0+)\Ì,mû¼a$;œwA‘tP9‡x)GKj›\æ\ÍS%™Cn -%¤Gº2”¨‚¡œŒ÷A\è\îš\å!\Ê\ÂŞ”ô\Ûx%²{³\àO\æ!r™…}¹gGı\ĞC=\âö°\ìJ¥»óƒ‘<A\Ì\áoxMõ,C§]™H\Ìr<Gb®G\âT\êš\Æ\é\0üsŸ\î>w.²Ÿ\ãIO\ë\ßSn¶f’RRO0\èœsCy®<•\æœ¶HØŒˆò¢£0”\'`J\äÿ\0¼ DÄ¨\åi§¸%)9ı\"\ä&‰Fa0FGumºe6œıMrm¡³…„\0rvŒf^\'ü¥@g û¡­\×c4f%\èHšRœtv\Ï+¢F\ÉùœŸº;[;iVó£I„Œ\äÄ„f}„.6\Ğ]S´\Â*\Õxœ O3÷\Íh«•\å (KÔN;œPXÿ\0k\Î—-\Õ:\Ø)%·ŠTR~G#óŒ:õ\ßè¨—±\ï\Ì#j\Õ\Ç\ç”P…a\'¾7òeaLd•J\íÊ™×‹<\êFNü\ãŸH×œ¤|  ”‘zƒ¼Û²ô¥\×Ë°¯Tÿ\0w\İ\r^7D,A\â`‹]¤\Ïü€ÿ\0\æ N•\èu? q%\ŞË¡\Æw\ïQ\Ôüc\Ë\Í\0R\nI\ÊI\î?\İÃ¡öRğ\à\Å\æ_y…s4²=ÑOs´“A\å)#) õ$(½MBU\éş¨\Ô,‹Vº\Ø*\ìW‡›\Î\Î6vR~ñù\â%¥\Z±N¸i2\Õ\ÊD\Ê^•›e.°\â{\ÒG\ë\ÜGq!\Ú\á£Z[³\ç¿a.™¾ZdÛ¹“˜p\í*ñ\ê	\îB¿#¿yŠF\Ù\à.\Äm…\İ53\Ûó\ZşJß²X\ËpûƒmX\Å7œ\'i\èt=¼Ô\î\ÆcÊ™iG*i$ø‘ ŒzajÊ‰JR9R\0+x™™—’—rrqô4\ÓH+u\×”$u$‚L„€$¬jır™l\Ñfkõ‰Ô´£EÇ–Op\î$œ\0<LE\ëS§nû‚n¸\îB¦%\ÎCh%#\à6\ïZ\Şu\" -\Ëq\Õ&‰(\æBñƒ6\àûgıöG\Ş{°\Ú\ÆÇ±øğ»cq\\EWğı-\å\Ô\ê{k\'Ú¼i¸À¡D\Í6qıN\ç\Ğh;J\ä\Ä\Ü\ÄÒ¹pü3\à‚.Š©ˆ ‚\"0|!Pu?¬Pu?¬V¥ÁJ\İl‹\È\â3ú\æ.Å£„M\çº1÷ƒÿ\0\Ü] \ÑÁ‚§{Ex˜™µeÙµ/ò\ì\Í=D¬úG3²\é\îJ‡U w£\Ş6İ¹qR®©V¡T˜›•S„4ì»@ã‡9\Ø\Ä&‹²³\Ó\Ò!bFyö©\åp2ò‘\Î<ñK\Æ6.\ÇªkPw†ó®R\Ó\ç ô=¸«nµ·–\Å*\Íñ\Z4\Îòœ\ä}J–—¶\Ø6˜f¿\\mÙ–\ÕõRRXq\å‚Á\0\á;\äeDDÕ­yºµEj¦ô} +(ey.`\ì]W\Ú>\îƒÀõ„(JA\È\ÅcÙƒ\ì„¼UüuÃ \á\î|×“\ÚlCa§øx=Oa\äˆ ‚-\nºˆ ‚\"\ØÁVq´^¹\Õ\ãW÷|\à\ÈJ²v0`ø \Zx,<Û˜?U—>\á€\"c$F@‚A\Í>\'#ÀÁƒ\à`‚#ÀÁƒ\à`‚#ÀÁƒ\à`‚#ÀÁƒ\à`‚#ÀÀ ¬l\Ê B÷ÈŸ ‚/ÿ\Ù','Trisha','Gunio',23,NULL,'09466485696','Pulo, Lipa','Hello, My name is Trisha\n'),('U0004',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0q\0\È\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0L\0\0\0\0\0!1A\"Q2aq#‘46¡±²	358Bstğ$%7bruv‚³Á\ÂCDR´\Ñ\áñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\04\0\0\0\0\0\0\0\0\0!1Aq\"2Q±ğ3a‘¡Á\á#4R\ÑC\Âñÿ\Ú\0\0\0?\0ü95\åI\Ív\á’\âxm¥8°„’v¦•\äg\Â\è(m¹_\İo>\rô«\ç4²õ\ä8²wp©G\ï©	Œ¹¥8r\Ã8\\\Åe_:&\à|c\Ûß»>‘\ål’£Cy#s\Ç!\å\æ”M¸¯¤<›\Â\ÚAò4\Ób¹\Ş\ã¦Ó¦¢ÁJ±\Î\n\×ó\ì+Ş¦›®¦LX\ä^%_2M8\âŒeAz,<`&*vÇ©5Lm\rj^bA%Fh^V\ßY(\È) “V§\r§Fn3\ä6 \Í¦=\ÇDH\ÔR\ÒŠy\Z\Ïı*_H\ÎMµ\r!Ü€û#4¬@\æl¦\Úı…Ê¼\á\ÒyFP·µ)¸‚:F\Çm\Åñ-”Ä½$²šP\ä•Â–Zaõ¸’U¹i°³÷şúª™)2¸5\ÅBF€%@j\êà­¥\éo%\çwBZ\î(O\è:\à†—BI ¥¥\á*P\'bz„©­9\ìÿ\0ÀMYª–\êmlF‰¤†\Õ1\ÕD«\Î\ëW|\ÕL\Å4tT¥3µ®\ÌNSZ»D.F®p\ÆG2V“Ó¦h?R\é¹6k»L•r/u6¬Œıkô/N{p\êdd¿z\ÕWi«ø\åES,Œc|•m\é½7¾?u£\í]4‡®Ğš\0©q¥Ú™\âq\Ôs¥h\Ç\Ş)˜l™@µ¿‰\áójW\çe\â\Ò.’v8¡«›;\Å `ƒ\ÜV³ö§öâ·³\ã\ï_\í!\ÍO¥\ÒR|…¡q	\Ø\Ú\É(\é‚S\ëŠ\ÎZ—J¾ÊŒ\ë	Z¾w’ıugF\Ò\Ëi´\Ø1-’œ\r„ó‹X(À\Í7LeŠˆ36\ÒôUøo¶:ì¡¸?CŞ›ü‹)\Îz\Ô\îa ×‚—:œc”œ\â¾\Äc\Ä_&:\×f#+•Uİ–Ì„„\ë\Ë\Åõ N\Ùi1\åOSÖ¹•)j\Û\ï5\æ\\Œ¯\0t\ï\ë^íŒªD”4\Äq[Ie\Ä)M1ou¶\Õ/—†˜].eWP\èÇ•c4i&V›\È)éŠ¯\î-¥rŠ³œ¯#zÀ\à\á¢\0,\êŠnMºG”§Ô©\ÊZKÖ†*-ŠU1h\'TöX\n‰’\ï>\ZGARz:\Ğõ\Şûh*+tg•\Ó*X.‘¶jÀ\àm¿7órq¢C*É¨œr´¹t\rU\'\ÜeKb\ãODÁLVG>z›³´½9\ÂÜƒ‡e+ \ì(q\å=«µ£\Ë\Ç1[\á	Ï 4Q\Är-3bCX\ìtSB[B83\á÷I\ÍVP’¥\êTH’@ûQ’{oG|O°¹{\Ô\Ğ\"\ÅFK\Ñ\Ğó4;\Ã=Fö™×‘\îp\ËAY)Qz#OS±òº•$Ÿ¨­c\Ñzwˆ\Z²©MÇ±^£\Å\"#n$·\n\æ\æB;0³\Ğá“·–y\ÙÍ¾\â–I\ÊAUGÔ›U¢‡²	ñp?¤i\İ\ÛK*6‡b\ì„yĞ¤ò;\äT‡¸i\ÄM7{Cz\ãD]-²)Ju2a«”\à´‚…B	‹/–¦N…µ\ÂFzR7Q‘Bz¡ƒ¼\ê°=®•y­­³/\è·4#%)	t€zšq`\á\Ël²\İ\İJñœyÔµ<\Ø\ßW/(P\' \ß\'¥XÖ­\ï\î\\,\ÓY\ähò\Ûsv\0oƒ—®*\Ã\áO\0u#q¢]§AS²\nLFœ\Ï:P	\É!XHô~†Á™\Û-\Ôx©\Z\×Õ®<\à.“\Ò\ì\Ä\ÖEšW\rÅ—·©²\\”±\ÙJ9	OL¨öÚ¯=®81¡“\ÇJ[Q\Z*\n\Ó,„”\'m)mÓ½gıQ{›ªu¼\Ùw\ëšb[-û«)@HBP\Ù	<€\à$dTv\îO¡ƒö\çöl\Ğ7F4­—†&øµ8D‹MK\\¥\ä‚L…¸\ß9;o¸ù\â§\Îù¥\"ü‡\İså‡¤mO¸h´şƒ\ãµõµGM\Ü\\´\İXmnAC\ï%l<1\Ì2V\ê\ÈØŒdW[\'¶7\rÔ¥iıQdf=\Åp©\È\ÈKjY\Ç\È\0Fz`ú\ÖW\Õ|TĞœA¼Ë½p·LK²º\Ë\å7,\æo!*\İ.(%E$\ç>d“‘\×U‹ÁN\ê=Aizøöšqy\æÔ–\Ñ=-\0!%Ä¨$üÀ¢ˆ¥ 5\ÙG.&33\ï\ã¨ñW¾…ö¹\à·\Ş~\ÃqŠ¸\Ğ\Ñ\rÁtvS*So Œ¬ò¨+$Nı+-ñ§\Ù\Ù\×Y\ß&³Àş:A€\ëŠ[°\í7»RU9\Ü4™Mf€\è9’¾À\ã¨¹:oW=¯\æi–nf\ß\å·\å\\\0>\ì;´\Ìy\Õ\Ø\0¢;‚FrºYıš\İZôü./¼‹\Ûnø~#—V\n¼\ìTœ $o\Ó\ÊqØš&\ã\\m\ë\Öêˆ°q\Äz#\Âş+;\ë\î\ê\Îjq¢5¾›0$¾‘\îò›}.Ä““\å[N£(ZÀ(»¸ªş\ëa•iœ¨“R“·0ëƒ\Ú+K\ëK>¸¹ªG	õ)[²­\Ü\Ï\Û9–6*Zy·\åR{c·Êª­s§.M+Á»\Â)m\Ì8Ó‹A\çk;`ı\'¸=\í\ïQˆ5R¼f*´	{›\íÒ¼¸¥x¼\Ã;zÔ•\Æ\ÒüU).4\0N\Ù\n~5\ãn¡XR~Ÿ:\Z¤ğmyueK\Ü÷¢¾Y…\Î\å\â¬T³B…$¯É«c†V[lh˜\â@+Vk\ÏvVè°¦<BRc0\" \î½WAo(¨l\ÔÑ¾³›\ï2¤)KNqš9\Ê\Ô>x¥\Æ\Z¢h´am”6µl6\ÏÊ•1\Ó\ï‰\Öo\'Ì©P¹\Çu\à\â\İY!i”GHß©«7A04·\r\å\ßlIJ	úUwf„»\Å\í¸¡9\Ê\ÅY¼GlZ´ô6\ÈÇ”€~Y®db\ÖwŸ]=+‡\íh¨\×:WÀ\Æ\\YıtË‰÷ö\æŞ¤º’·N1\èOp\á\r\éır¼89T\âJ\Z9Á;Uey–\äËŠ–µ“\æ\ïE\êb\î\êRÀd:´)•[\'˜¨rÖ³\àdt\ëK\\>\êùQš~B<[%\ÊG\Å\ÕlYQ\î\Ò\ÎOe¡\ë6ğƒKCªQ%ğ|À-\Õ›Q;üJw\ï\Ö÷Hi—\Ãl\0¬l“Ö½‹ó#£ÒF\ÛtğZ]©B\á5ñzv\êóg“	e.Ejb\Ëi \ã\àQ)#\î\ïRw>,Cº\ÛW_p¿Oj)ö\İfs\ĞC2q\'#\nk“ew5j\ãÆ›\âDP¸¿`’»ŒV\Ów\Ûk\ÉL•2ÁÄ¬rº@\Ø+)8Ø“D¼A\áTHZZN«Òš™›)BŒ{„6¹V²R\ê2|5ı½	®;D¬wr–£‘\á²h}q^´÷´\r-­<Æ¥\àÍ¶—„Éƒ!\ä-;’r²3¿n\Ôn\ç\ì±t„©z>$fË YÜ²¥\ÈA\'\Ô\ç\î¬™k¼H‘\r-\Ìq\É+\çYB\Û!D¾\èß˜\ã\ÓõQT\Î(Ş¢iµZl6\Ò\İK‹i-„\Û ®Ó¦p\Ã\Ñ\ä²\\mÒ¿ğºó¨›T¤­\É,%½\ÙeA´!`•ü$­dü vz·*é¥¯?“\å\ê«Í¥ÆŠq\îÖ´-~˜I\Ç\\l1]\à\ëıg9´µn¸º\Ò	\Ù\r\åG\'\ëûh§OkM[¦œNtÊ›\ÎV\Îgl_Dq3E¥\İğºúA;\ê®^\è«}§BLâ†ª·\ê_b\Şã¶»]ñ¦Ÿs!$—\Ê\Ël¤eYY\Î\Ş_9}ö©\â\ë—|\ĞÒ¦Ùše`ÆŒmÜˆO(ø	^{\äw\éW¿8…e\ĞÊŸ\â&¬aw·YB¤¥\ÂV¦Ğµ\0\ï\Í\æ\É\é’©{Gxvæ ¹Ç·£‘ô)\"šIHQØ£©¥a\ç{f/\r³\ŞO–Š7±faòU6’¶k_ks¾jM¨\í·fP÷‡ Kƒú•m\à¥\Ñ\Èñ\Æ06s\0\Ím¢-\\\à­\Şm²7³\Òo\ìÜ›\\Y°\ä\ßHu¢H\rº\ß2¸;÷­\Ò\Ïøo¯mr4lmW\r\È/ÀğVˆ²’H*òtõJ‡®r²G®ºZv¢—d\ã—\Å\Ò\çj|´›\Ò¶\\\Ğş-n-²rQƒ““UAts—}ÿ\0.>´L‹;Ákš@\î¿ùö]=Ÿxw:\ë\Ä\è\ZRZf·nm™2´{÷TH—\Ï\Ç\'-¬¡I\'U€Ú‹8¿\ìE©n‘$\ß4ñ¹k<\È\ÉNTHP)I\ÎH$dúŠõ\ÂOhNKf“\Ñ=…b—\ÎX\Ï\ÇR”µ«§%D©yI#$\çM¨Ú“ˆ7™\Î\êW¹EZ”P\ÃJÇ‚®nUC¸®† ±¯\ÙPY$\Ïh=\ê˜\â²O´”½9e‚:¥÷\n*\âi\é/!\á\ê\r=k–›öö˜\Ên¼K³D\áÅ•ÀT›\Ç$şN\Ï\Ù\Ç ¾\éÛ¢[û\èŠ×¯ø\Ójñ#X¸™¨\à\\(Å½\ÈoËÇ•}+§A\ê\Î#_\r\ÓSjrŠ\âLº]¥8ñil•¬“ôŞ•/\âN£@Ş†Q»…rû¨ˆÏœfa†\çõ%\ÎC_ù\ÛFˆO¹òñ¤¡\Õ\'\æı*Th³§´B¯úr\ê\Å\Ö\ÖÁKOËŒ•!l-Y	K­/lœd{M¯\\C\Òp\ï#Eğ†2\Ò\Ë\0&}şJ¤HP\ÎCyÙ¤|†ÿ\0:€\×.Ei„«\ŞS…$9%j\È=r	Á\éY#òÆŸµ±›\İ\0\êuxmT¯2÷?:|”m\×5\'}œ¹S99‰J6ññ2{U\Ìq­U¢ôR\ZVzbN\äYò/¨¥L\ím¨»\ã\ì“ß½*Ü¡\Ë\Å\ÔTg-Ë¸\êör<¨<\Ê4c®–.º±-´r9ƒh¥Â4,q¤\ÜªJ	\íıó_t\ê»\ë0¥PÂŠÕ¿¥q‹À™\Ïş!^\íX\ŞW^$LoOXa\é¶ˆğµ[Å‡&\ëuLHˆ*[®a õ5%\Ä\İJõ\çUIG‘r§\è*\Ãö~\Ñv\èP\Ü\×ú´û¼qöe]\ÕÚ›¿-‡\Î\íş¥a\ßA<¿[X\à÷lJÀ¹\\›\Äu\0õ ]-s.\Û\Æy\ä\n\ï\Ä\İg\'^\ê÷\ï.¯\ì|8\É\ì*G†0Û•Š1”³\æU60\è`.h\ê}{’\\¤¦\ì¬\í5Ûˆ3a\ËASP\í©H\åQª\Æsû*[…œx\â„\Ô2§ô„2¢•§œ\0S\ßbpv\íÒ‡t|õÅ“¨µ*Ù©\Ò\Úô\ÛÏ‡rĞ¦n’” \àü\Ïo\×Q–‚]ÆƒG¯ŠD\ÉEz±µo†­”\Ñ\Õ\×ò¥ˆ°eÅ«·ÂTIô\ëCw\Ğ··*Z‡Œ\áû@¨\Ü\Ô–—“md°’\Âò‚¡’w\é¿`+¥º8\Ûm%n«—\Ã\ÊFz\ã\ë^– \ÃCe3YÑŠ\nN¯¸Z\ŞLkK)/)ymdü#\åE½AwvO<.²“\ÊÌ§<\Â\"q•,o\Ôı\çZªü\Ô6Ò¦B”\áH\Î\à|ªFÁxq‡\âJù”yÕ…nšK˜K,ÊĞ9¥¦?›ccS9\Ì<Q¨\îR”V\á?+N6œï˜\ß\×z\Ô÷›@aû„]\n\ÌT¾\â\Ğ\Äh·I>\n\åJBT²@\ß\ÎÂ½J¹C™\áøò[Ê–2]Ny{ÿ\0Jñq·6\êƒ×—\Øä€–\ŞJş\Ğ\r¹‘\è7\Î\ãş´q9\à\Ù>köJ—¨5\Ù,\\Ú±[ì¡•µ\"\É\İ\Ô6À\æ ùûœœœœ“D—}m©e\Ù[ºj›¢&\ÏJJ\\)Ö“T¬ˆ\ìhkZ\Ï\Óvv\ÚoO]Œ–\Şnulúglƒô¡»¢”ôfÒ·	\Ü\ã\äZög\ÈğO_F2\nE65	Ú©Gku\Èñš!\Ù\Æ@\Ç\âv­E\ÃX\\<\â+°\Í\ëT\ÅDÙ‘w->P!I “Ê³Ô“\ëY+E½%Vg¡\ÆeG\Ş_F\ä\ã\Ê	Q$úmS\Õ&Kyû£\Şô¤)i\ÌøkAß­W\0‘À\Ñ\ÛDR\ÄU\ÅkıUÂ¯g~Ov.¯×¶¶‹(>YRŠ	\ÇÙ‚\0P…g¯j_j\Í\î–W¸\r\Ö-N\Ü.\ï %\é?\èŒt³Ö«\ÍJ\í—PÛ\É\Ä;\â\Ë#•\×^.%ğ:¤óˆş\â«{Â—\ï+. \àƒ†™Jl…c:f7H›†\Ò‚Òœ_Ä¢Nı\êKS:ü\ÆÜ™\ÌyPŸ¸P¶œ–´ „ƒ8¢+¼\ä\Æ\Ò\ëñ6+Aõ§\Î\â\ÙE*#m‚\n¯\å½\Ì\ê\Õ\Í\Ô\×Œ¬!#s_¥-Ó¾Ûš\Ópù\ÉN	\0\Ón…£\Ùun!‡\Ô3šU5z·†€\éô©}3P\åj\í«n©°\éõ!€§’OÖ 4ü\Ç,zf^¤_ñVó]¸¸÷u·YâŒ‚×˜™\ÅyÖŒ3\n\Í\Â\Ö\0b7Š\îz\ä·Xš?‘³\È+\İ\Ú\ä€\í6\ÙZ—R7\0•È‘¿\Şj\à\â½\í+¤!ğ\ÎÖ ‚\ÓA\ÉJI\ê}(C„\ÖØ¶g¬.HLq–ù»še®/\ê\rLõ\Ñ\å¶	$~Ê¤ş¤\à›\çö	{7Ÿ’e\\\Ír°\êhÿ\0…ñKp\äNIÁ\r’j»÷”¶9~\ê²8u-¶!Ã¶<y}\é\Íş”üE˜©- g²ˆ¡\Ä\á+ÑŠ°ô—T²U·s]xwni¹EAjy\ìz\â¸k‰¬D\\}9¢HO(\îh£O\ØW\Ù\È\Ê\nBV\á³S2\Ë/ùõò[°\äxöø®[’‡\ÒP\np¢N(3W\Âñ#q\Ü\n[D–Ê¶*|f¬. h+\Ôş;rÑ.Q\Ó\â\Æe\ã\Å\Æ\å\æG\âj²qvf©º\"\Ù|‚”Im¢Ëƒ‚T\áC±Š)Cœ\Ûo°¤™³•E	\äp\Î\ã½M\é\É3\Ã\0\Él‚Ÿ)Iµ\ÕVA!*™7Nrqışµ\æ+O\Ãx¤íƒ¸ùT®p;$4\\ue\ÊKJ*d0@;ŸÖ„¤^o‹i\È\ßh›s¥ÓŒQ¬\ä³ )´\ÙR|¤n:t\Ç\×CN4\ÓÏ H8#)…r\ÚDÆµÛ„\ÎÎ¥ ]Zˆ\0¥f»ûÛ²yG!#8W\×Àa^\ZÌŒr\çy¦t•Š+\ï\Æe\×2·6 oŠözÔªƒAVW	´;\çGs	S‹% ±€½±Œÿ\0}\è{]ªï§¯¦\r\îS\ÅÔ¹\Î\Ù<‰#lgåªÚ²Ëµ?f¶šG…BYñ>%$y¾y\ßñ5UqKR\Ûõe²d‡\r\ÂŞ’Â¤¸¬—\Ùş‡1õN\éÏ \ÔÂŠo[u. œú!;\Ä\Õ;\Ì\ê\ÙD…÷>´93\Ä.`œıjFJ–\ÚB=i”°£•\ã½6\Ò\Ú8©M:µs§ÒŸ\ë¹%›Pd–\Ô\ÏE>$«¡5ó‰ò4\ÛY\İ[š™\á\ÆpJ\Ö\ĞI+*PÚ‹ô,\Ú0§r=(9\éV™m	µ!	\êF\ã4s;,ejì¶Š\Ü=Ğª•yÔ’\Ğ\ÄT²\ÏT÷¥RD\Ó#mE}\Z¯]Ft\'™¦\npú\0¢i\Â\ä­O©n,²r‚|0AşˆÚ¼i;ˆ\Óú^~¢QËe¶©µ \'L\éuŞ¤ñ‰G\Ê]\éHH\á@y•Q¹®Ú’ü\Ô(m\éˆ;$õw|&qI¥ uùS1-R¯Iy\Õw\É&½\\\ßK÷©>½EY@4€¥\r§%NCC\'™@`UÍ¤4t‰\Â=\à† ¤a^¦«YUx\ÕQ¡\É\çX\n\Ò5rK®\Zh\èû„\çSÌ†\Æ\àddŸ\ïY;\Îp\Æ\îPX\ÊJF\Ô\ÜC\â\Ô-/¤-«—5÷œˆ\è„s-G²Fw5¨\àğfÿ\0¤¢Å‘m´™ˆSs\ä¼Àp¸H(AP÷\ÎNOSŒZ\\\Z\à\Ï¸kn5¶/¾_®\Ì\îS\å#\ÌBRB6\ÊZ:\ç&‰%\ë‹\í8İ¾ä…ª2¼)¨lt¤…u\Æˆªr\ÆÀÖ˜ùŸ#‰`\ÑPW.¹oÿ\0(\Ú^,»±S8\Ëj „ü\ë5ûQp~*.Š\âf˜Œ–.(9\Óx\ä”@\Éø§ÿ\0k,^a´\ßøD\ä“\à%\Å5!<€y`p}~UNñ*\Å+TÀqø¡±\á“\Ì\É\È\nù\ÇõÔ’:E¬½l\ã*mi-\îs$akec?Áıt\é®0ZuAĞ¤‹\Ítü(CŠ\ÚJv‡\ÕòP˜\ËŸ_;k\å £ñ\Í*r×¹=~T³eU\Ñ4\ÇZ\Ùg\ÇqbS)W)<¡\ì\Ä\0:\Ô2e59Õ¥•$¨\î£Ì¢~ı±U™“…#oŸJ\Ó\Z­ˆR›™+AØœn?ú 1e²6 6Eq.1X˜°ûˆJS\Õ^\'ñ;\â§,Z\Ì\Ûo°¦\×*\è\Ú\ŞÖ™8	ll¥ôl÷Ú‚u£¶Ê¼®d9|\é,¤\Ùû4•¢Ÿi½\"Æ¤Ë•-¢\Ø}L\0<\é\É\'8ë¿¥kc.§V¨\Ú5\ël€Ö–\íe\Âøª,3­\ÅçŠô¦¹CˆRr\nH\ØyH\ïUŒù¢\ë$¿²W‰=\ëœV\ê\Ñ\\G~\ë\Ù\Z÷\n-\Î\Õy¶µ%¦ç´—vi\åPÁ\0\äûŠ†\ã/°nƒ\â}N¬ö}µÆµ\êf\Ò^z\Ê\ä¥%‰\é\0©a¡\Ñ‘¸	\Æ65F\Z\×;$‚\Ë\ì¢\ÄF\æ\ÂÃ²Ğ HRrEq\Ø1ù€\íR÷»,\ëd÷ Ï„\ìy8¦\ä0ò9V\Ú\ÒpR zF1L|¤†\Ô;\î+ ö$\Æò¤´½¥)Œ‡”1É¡ıw<Ë»–ó”¢ŠŒ¤[\à ¤\ä K²\×2\èyA%J\ëS4\æ’\Ó\Z)«œX\Ëuaa;œÑ½•j‹¾c±=.mğZa\Æ,ŒüªEÛ’P„FA>F÷¥\Ïoj&\Ñ+\í\Ş\á\ï2\ËI^}iT;<I\î8µt;\nT\r ±\ä^ª#P7ù?LÁ¶¼¼yÖŸ_­B]õ—X\ÌE_•¶\0\Ï]ë†°\Õ_§ò£fš¨¢[}I¤\Ôñ­»}ş*\âÒŸx¥É\Æó\×jp‡<Y\Ç\'ú]iµµmªH+V\0\Ú\ĞÃ³®-²\Ğ%N¹€>ú¥¦Šv{9\éøñ\å\ÈÕ“’<8Í’\Ù#©­\ìmo¬ø‡w\â|\ÈA\æ¢rÁ€\n\ÊIZ\Ï2ùN1²@\Éô5=öM—NÁĞšn;O˜´ 3KqJ\Ø$\ä\Ö\Ä\àƒšw…Z\nˆ\\)Q¥F†§¥/Jp:¯1QÜ€IÏ”d$Kƒ¯)”ò”X§\Ä7W\í\ê\ïç’¢„°û-\'¥A*N22A\ÎN*\×7I¬MnL8Á˜®¼£9´°Š‚HP\0$\ç—|ŸAÖˆ\îZ\æØŒ´óhW—S\Ì\à\Æ\ÈRwÁ\é\Øc~\ëk«\â3tT`\Ø\ÃÜªy\åñ§mÀódm\Ôo÷\Z<C¯e>•Á_5›VI+J\Ş_S¬—9K|Ã”²O¯§­B\ß%®\İ(±ny^\ê\Ä\'t»y\êH\í\ê=j­\\S:.¤vCi.\á\n,\ã¡#±Ú˜B½Ë—dCòQ\nm\å¤\å+\íJœ#i^Z\Z‚c\Ä^\Ûuöu\Ô\ÃJ‚›\'`J³ÈŒ\ç·J\Ìz‡O\Ï\ÒwG¬÷X\n\æd\ì¬c™9\Øı+Y\Û52\Æ`º\Ğe•\'”­*Q)öÿ\0ö†¸\ËÃ–õ†N Ó±rt˜Ï¥9ñSƒ\ÌÃ¾¹ùô¯F\âÓ•É¡Â¬,\Ù\Úd§™ø@«›®\Í= Ô°‰¥ş&\İÿ\0\äQ²øGj\×Zgò¯Dˆ\ÓA\ÃöiC˜-À|\Èi\Âr7ò+r:\Z¶\èKmÀ*\ß1nÅ’ÚŠÌ‚…ˆRU‚{mNs{Ó£}š	\Ì;g¥8ƒ\â\Êh\0ÏœŸC•kğ+€\Ü1ã¾¼´ğÅ«\àŒı\ÖIJ$¶\ØñR…-\\£;$üªª‘Á[\ÓIGº\\\èV0R¢´ğnğ\Ù:_Ú¢,›š‹\îÿ\0‚÷5Bp¡X\èg\Ç ©8\İC¹\Ü3\Z\éºZ\\Îi­-\n`\Ûm<‰l·¶ú.</Ô†\Õ-÷’€ó‘Gƒ\Ì]B@ :\Ùë“Œ1V¿\r¯Û“\äı\ÑL%÷‡šJ“€±\å#o‹|Ú„m±ôÆ‹ö\Ü\Ö7¼\èVŞµk\í	r†ˆP””\ß^7J‰s”¡\\`Šµ\ê½®\×rÓ®G1¤\Û.^\0)p!Ih«\ì\ÔG@p3œ\ç¥f*\Æ&Á\Õs¢•\ï\Ã\Ñ\Û^)\ÏğŒ{#¶\îŸw\Ú+@Yy=\İÒM4ò¤©_)@óN3·|\íXbYS”¤\ëõsGñF«_\ä\ÛÜ®x2¡·b ’¥$ƒ\È9\é…m½`¯mOe=OÀ>\"ÌŸa±È“£\çÿ\0Y.§\r´µ²²:)\n\Èú`÷«\"u·)\à¦cj*Ÿº\ÈJ¬\è\0ù±Ö \á˜PZ2\ß#Ÿ¶k\å\Æ\èXˆ\áÀ\ì\r7v\ßùF\0šË„\ãú9¤VPAVŠ ô]\Ìû’Z¼©\è3^Ûœ‰q+øj-…\ÌVHQ\éô®P½\æ/;Û~\æ±ô[¢6´\ás\0}|§›¨¥MiMGS«;“´©e\Æ\Ñe(5ú\×Á\Ğı)R©†\êµ\Ú7\Æ>”A ?Iaÿ\0\\)R¦\ÊS\Õ\éÂŸ\çE£\Ú\Èı\ÅV§¹~š·ş\ÒWî¦•*\Ü7°o%\Ï\Å{_ª‰\Ó?§.ÿ\0k÷ª3Š¤ò¿³ÿ\0\Ü)R¥M\ÛğL‡q\Éq§üŞ£úöÿ\0xTfış©ıª¥J¢‡ıŠ{»!B\Æü\í¿øh©\ë\'òD\ßõ—ûÔ©U3ö‚ó6U¦‡şW¿¾¿eE{C8]Cıtoı»t©U£²y ¼\Î\Ø\åõOl¿š\Æş³ş\ÓZŸø4¾%f¶\Ív•*,\'µ<Š?\Ä?l|>Š\Ç\âó“Ñ¿\îE\Û÷¢\Ô7¿?¸bc÷“J•%ÿ\0»g®+Ÿ\í\Û\ÉK\éÿ\0Ğ™\Ô#ö\nşó=£¿«™ÿ\0(R¥O\Ú]\ÉN\Øsú/Ï½Qù¢~”\ëMÿ\0$\Åÿ\0ZT¨\åØª\Û\Ø…óó\ä©\\\ßüÁ?AJ•#üA7M.¿›ıô©R M/ÿ\Ù','john','doe',23,'Female','09386508693','Cuenca',NULL);
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
    ELSEIF (SELECT count(*) from staff where staff_id = UID) > 0 then
    BEGIN
		Set dummyRole = "Staff";
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
/*!50001 VIEW `userdata` AS select `user_account`.`id` AS `id`,`user_account`.`user_name` AS `user_name`,`user_account`.`password_hashed` AS `password_hashed`,`up`.`fname` AS `fname`,`up`.`lname` AS `lname`,`up`.`bio` AS `bio`,`up`.`age` AS `age`,`up`.`contact` AS `contact`,`up`.`address` AS `address`,`up`.`userphoto` AS `photo`,coalesce(`admin`.`date_hired`,`doctor`.`date_hired`,`staff`.`date_hired`) AS `date_hired`,`doctor`.`specialization` AS `specialization`,coalesce(`admin`.`status`,`doctor`.`status`,`staff`.`status`) AS `status` from ((((`user_profile` `up` left join `user_account` on((`user_account`.`id` = `up`.`uid`))) left join `admin` on((`up`.`uid` = `admin`.`admin_id`))) left join `doctor` on((`up`.`uid` = `doctor`.`doctor_id`))) left join `staff` on((`up`.`uid` = `staff`.`staff_id`))) */;
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

-- Dump completed on 2021-11-19 16:57:25
