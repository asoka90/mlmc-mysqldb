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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_history`
--

LOCK TABLES `medical_history` WRITE;
/*!40000 ALTER TABLE `medical_history` DISABLE KEYS */;
INSERT INTO `medical_history` VALUES ('P',0005,'foo','bar','2021-11-13 00:57:08'),('P',0006,'UTI','Positive','2021-11-13 01:02:36');
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
  CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`nurse_id`) REFERENCES `user_profile` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES ('U0003',NULL,'Hired');
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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('P',0006,'mary rose','smith',21,'Female','1998-11-19','09980876','Cuenca'),('P',0007,'Jackson','Homenick',31,' Female','1983-12-26','1-861-611-1185x','8968 Gulgowski Pine\nNorth Elmerbury, LA 38857-2388'),('P',0008,'Carley','Crist',111,'Male','1998-08-10','05417799166','335 Pouros Course\nEast Darien, NC 39296'),('P',0009,'Joshuah','Buckridge',94,'Male','1994-01-25','610.677.0712x73','18586 Lyda Forks Suite 947\nMcDermottton, ND 78110-1236'),('P',0010,'Brant','Stiedemann',117,' Female','1998-11-06','1-072-375-6463','21156 Medhurst Ferry Suite 132\nSouth Pearl, FL 29274-0900'),('P',0011,'Demarco','Luettgen',22,'Male','1988-04-03','+42(7)371848021','47327 Boyer Port\nMayertfort, AK 23947'),('P',0012,'Gerson','Bradtke',83,' Female','1999-06-17','1-023-382-0750x','504 Nolan Prairie Suite 673\nEast Caden, WY 77538-0678'),('P',0013,'Ewald','Harber',35,' Female','1997-10-06','460-519-9327x58','3554 Billy Spurs\nO\'Reillyville, AZ 40991-8029'),('P',0014,'Marcos','Smith',61,'Male','1988-06-07','791.072.9279x52','6106 Hiram Parks Apt. 513\nJavonteview, MA 00021'),('P',0015,'Silas','Walter',1,' Female','1993-03-20','1-877-802-6237x','21615 Green Stravenue\nJosianeborough, ND 53633-5900'),('P',0016,'Marian','Ledner',117,'Male','2013-12-30','1-283-197-8637x','48462 Raquel Extensions\nNorth Veldaland, RI 15357-0436'),('P',0017,'Ana','Wilderman',92,' Female','2014-01-16','698-722-2822','336 Wintheiser Trail Apt. 607\nNew Manuelberg, MA 48301'),('P',0018,'Sydnee','Bode',122,'Male','1994-12-25','+20(2)254566020','785 Koss Stravenue Apt. 338\nLake Jessicamouth, KY 33404'),('P',0019,'Eleonore','Doyle',74,'Male','2001-07-27','+64(9)737436364','108 Angel Forks\nPort Hiltonview, IL 29726'),('P',0020,'Elton','Corwin',30,'Male','1973-01-19','(471)852-5949x9','6264 Eldridge Land\nWest Jevonburgh, NC 40316'),('P',0021,'Elissa','Bahringer',131,'Male','2021-10-10','111.967.6420','280 Mertie Pass\nCarlieside, NM 55613'),('P',0022,'Kendrick','Armstrong',139,'Male','1973-05-10','1-857-580-4957','3730 Estrella Ferry Apt. 618\nKarianeshire, DC 01541'),('P',0023,'Alex','Hamill',140,' Female','1991-12-12','555.285.1615x62','77918 Oberbrunner Stream\nGerholdside, WV 28581'),('P',0024,'Tomasa','Wiegand',105,' Female','2011-07-07','1-695-041-5633x','3421 Katarina Corner Apt. 058\nWest Vena, VA 82407'),('P',0025,'Mathias','Flatley',123,' Female','2001-08-21','1-828-973-8338x','550 Joseph Corners\nFeilberg, NY 84937'),('P',0026,'Ethyl','Lueilwitz',24,'Male','1989-03-21','(985)012-9024','960 Bergnaum Burg Apt. 931\nJulietmouth, AR 33841-6964'),('P',0027,'Anika','Mraz',31,'Male','2014-02-06','1-463-487-8377x','665 Eunice Run Apt. 307\nWest Verona, MN 01918-6886'),('P',0028,'Alicia','Sawayn',3,'Male','1987-06-09','930.521.9373x98','95703 Witting Road Apt. 671\nDonniefurt, AL 32762'),('P',0029,'Raphael','Effertz',68,'Male','2017-07-19','(036)390-2673','8762 Kaylah Spur\nColeberg, NJ 96980-0095'),('P',0030,'Lewis','Smith',48,'Male','1991-10-10','1-249-364-1567','0309 Maggio Manors\nRamonaside, AR 74702-2234'),('P',0031,'Myah','Stokes',7,'Male','1985-08-25','(080)037-6402','4557 Hegmann Spring\nBlandaville, MA 86653-2252'),('P',0032,'Benny','Kuhlman',49,' Female','1987-01-24','1-045-208-2102x','8246 Julian Forks Apt. 401\nLillamouth, IL 65724-1473'),('P',0033,'Gilberto','Heidenreich',41,'Male','2011-09-14','583.601.8608','4058 Reilly Place Suite 176\nNorth Myronmouth, DE 36486-1334'),('P',0034,'Adaline','Mraz',42,' Female','1990-02-19','312-902-3226x33','331 Gerlach Plaza\nEast Leon, FL 41079-7092'),('P',0035,'Lorenza','Crona',94,'Male','1991-02-09','+12(6)751621989','31424 Dooley Spring\nAlenastad, MN 55202'),('P',0036,'Jammie','Waelchi',46,'Male','2001-04-22','010-112-5986x23','6702 Valentina Villages\nBarrowsfort, WA 26021'),('P',0037,'Andre','Von',50,'Male','1987-09-29','+63(0)729202376','84133 Ophelia Vista\nTerryton, WI 70038'),('P',0038,'Madisyn','Hirthe',119,' Female','2003-08-07','1-125-049-4587x','216 Nitzsche Alley Suite 162\nGiovaniberg, RI 71749-7142'),('P',0039,'Simone','Osinski',68,' Female','2011-03-29','779-418-4877x81','7836 Dario Loop Apt. 726\nLake Lydia, MO 64190-1638'),('P',0040,'Josiah','Witting',71,'Male','2012-12-11','193-618-0715','088 Nader Shoal Suite 205\nHeaneyside, WI 24607'),('P',0041,'Magnolia','Greenfelder',135,'Male','2021-08-14','751-818-0343x69','81184 Ebert Rest Suite 152\nRoobmouth, NM 49738'),('P',0042,'Oren','Rippin',21,'Male','2009-06-04','1-839-690-1561x','701 Dare Forks\nHayleehaven, MS 72458'),('P',0043,'Nicholaus','Gerlach',0,' Female','1976-07-21','(839)371-5063x6','125 Kelley Forges Apt. 076\nEast Idella, AR 26607'),('P',0044,'Mae','Runolfsson',39,'Male','1984-01-04','1-675-115-8607x','652 Brett Manors Suite 614\nManleyhaven, SC 14901-4883'),('P',0045,'Elenora','Bogan',64,' Female','1979-02-07','982-274-0727','456 Sawayn Burgs\nMurazikfort, OR 18306'),('P',0046,'Leda','Lockman',43,' Female','2002-01-31','00698348825','661 Felicita Meadow Apt. 243\nPort Ima, MN 83558-9806'),('P',0047,'Serena','Johns',135,' Female','1983-01-05','1-729-607-1600','56301 Owen Valley Apt. 820\nDaxbury, UT 84839-6863'),('P',0048,'Dylan','Miller',119,' Female','1984-11-05','(183)739-9281','92043 Gene Prairie Suite 514\nOtisfurt, WA 49340'),('P',0049,'Aglae','Hodkiewicz',68,'Male','1981-01-29','1-424-702-0186','4134 Moises Radial\nLake Abbiemouth, CA 68929-3434'),('P',0050,'Whitney','Bailey',113,' Female','2021-10-19','1-746-098-9500x','183 Bradford Viaduct Apt. 245\nNew Alexis, VT 05883-0626'),('P',0051,'Jacky','Mertz',38,' Female','2001-07-12','151-547-9590x53','15224 Alfred Corner\nLake Ethelynhaven, AR 23392-1825'),('P',0052,'Madyson','Stanton',18,' Female','1993-02-13','(514)468-0283','04416 Kirlin Lock\nSouth Araberg, MD 55394-4833'),('P',0053,'Dolly','Schamberger',77,'Male','1971-10-18','865.423.7482','281 Satterfield Villages\nDurganberg, NH 92569-8355'),('P',0054,'Lillie','Funk',4,'Male','1995-06-30','473.520.1642x89','864 Ortiz Ranch Suite 242\nCathrineville, NY 22000'),('P',0055,'Raphaelle','McKenzie',71,'Male','2003-07-23','1-212-558-3776x','6017 Ashton Mill Apt. 279\nNew Lukas, NE 03599'),('P',0056,'Charity','Huel',69,'Male','1991-01-06','1-720-870-6542x','2918 Bogan Land\nPort Nilston, NM 04736-1869'),('P',0057,'Florine','Jakubowski',6,'Male','2013-04-10','610-546-4556x34','2670 Daphne Fields Suite 247\nWest Kaylahmouth, IL 02689'),('P',0058,'Thomas','Mertz',1,' Female','1984-07-29','(299)191-6330x5','39525 Tromp Streets\nHarveyport, MO 63297-8921'),('P',0059,'Marjolaine','Feeney',125,'Male','2000-10-13','362-063-2947x31','887 Bednar Creek Suite 412\nLake Callie, MD 51458-2453'),('P',0060,'Theresa','Luettgen',93,'Male','1991-10-19','974-761-3926x31','4416 Ila Streets\nEdnastad, NV 10163-3840'),('P',0061,'Furman','Lind',88,'Male','2002-02-28','(025)441-9060x4','01560 Alicia Orchard\nJacobsbury, NV 92071'),('P',0062,'Rod','McCullough',32,' Female','1990-03-09','+08(6)476102707','61653 Kerluke Lights Suite 024\nPort Lina, NC 23896-7438'),('P',0063,'Tabitha','Reilly',37,'Male','1971-04-03','1-662-271-0020','4726 Erdman Plains Suite 131\nMohrville, DE 82031-1869'),('P',0064,'Clair','Jast',64,' Female','2017-03-29','828.839.1680','41280 Sydnie Forest Suite 137\nShannatown, SC 58225-3912'),('P',0065,'Savanna','Sauer',107,' Female','2010-09-20','317-219-8426x36','5706 Bosco Manor\nLarueside, CA 71518-8169'),('P',0066,'Aiyana','Beier',87,'Male','2008-10-05','301-216-3041x74','403 Louisa Loop Suite 742\nKundemouth, MS 12740'),('P',0067,'Margret','Kassulke',34,'Male','1995-04-24','905.717.6152','0401 Jerrold Walk Apt. 724\nNew Kelsiland, NJ 41830-2568'),('P',0068,'Christy','Muller',70,'Male','2003-11-15','(394)073-9491','373 Neoma Trace\nEast Zettaville, FL 30441-3383'),('P',0069,'Adolphus','Willms',18,' Female','2021-06-13','1-432-637-9602x','733 Kaylin Courts Apt. 071\nWest Dianna, RI 93525'),('P',0070,'Cary','Casper',66,' Female','1994-02-19','03314359568','9980 Gibson Row Suite 496\nStephanymouth, FL 56035'),('P',0071,'Jon','Kunde',27,' Female','2001-10-12','(065)330-4495','7999 Macy Crossroad Apt. 943\nWisokyton, MO 58103'),('P',0072,'Carol','Lynch',21,' Female','2013-06-11','1-677-767-2569','178 Walter Port\nSouth Lewis, RI 73047-6105'),('P',0073,'Bret','Stamm',63,'Male','2016-04-22','956-008-7627','9514 Christiansen Isle\nAlizeburgh, KS 91162'),('P',0074,'Valentina','Wyman',21,'Male','2018-05-03','+21(8)184133324','668 Linnea Well\nBartolettiborough, WA 73477-3795'),('P',0075,'Nikko','Littel',107,' Female','1971-07-04','975.405.2875x99','20347 Botsford Forks Suite 809\nWest Gerardo, PA 12518'),('P',0076,'Eryn','Trantow',81,'Male','2010-04-05','870-543-8679x04','7654 Lynch Mews Suite 837\nKendraton, MS 77962-0554'),('P',0077,'Zula','Graham',70,' Female','2018-04-29','688.476.9684x17','15225 Boyer Wells Suite 519\nLehnerborough, NM 77621'),('P',0078,'Mckayla','Berge',70,' Female','2018-10-28','079-213-9464','3691 Hammes Gateway Apt. 981\nSchmelerton, RI 02932'),('P',0079,'Kieran','Farrell',2,'Male','1994-06-17','1-599-999-7538x','18224 Shields Village Apt. 138\nPort Kimberlyport, ID 73560-0336'),('P',0080,'Peter','Crona',42,'Male','1983-10-05','1-162-298-5815','825 Vernice Prairie\nLake Justina, MN 65972-4282'),('P',0081,'Alison','Sporer',132,' Female','1971-05-08','(386)247-3601x9','286 Schultz Forks\nNorth Kaylah, MI 35204'),('P',0082,'Diana','Reynolds',89,' Female','2016-02-08','(682)469-4098x5','46253 Hilda Knoll\nJacobsfurt, KY 82889-7072'),('P',0083,'Annetta','Sawayn',41,'Male','2010-09-14','568.342.2207','8517 Amelia Gateway\nWest Columbustown, DE 71923'),('P',0084,'Emely','Legros',23,' Female','2002-09-09','1-694-143-6443','45672 Kendra Freeway Suite 446\nHeidishire, UT 57796-1645'),('P',0085,'General','Kunde',73,'Male','2010-07-07','+80(6)398862672','12437 Doyle Lodge\nBergnaumland, MO 11890-1311'),('P',0086,'Lindsay','Yundt',99,' Female','1989-04-19','+24(7)219723794','23817 Fritsch Island Apt. 941\nNorth Duncanview, SD 59782-4487'),('P',0087,'Lauriane','Stroman',28,' Female','1988-09-10','265.573.4091','187 Kling Keys\nJoshuahport, IA 17803-0499'),('P',0088,'Weldon','Roob',127,' Female','2009-12-07','575-344-4274x14','23047 Terry Inlet Apt. 336\nBenedictbury, HI 33192-6147'),('P',0089,'Polly','Pollich',40,'Male','1985-01-02','1-370-503-2439x','94097 Cormier Shoals\nNew Magali, SC 91660-5189'),('P',0090,'Wilhelmine','Little',132,'Male','1994-08-24','910-121-7710','72521 Albin Light\nSporerfurt, IA 08876-0325'),('P',0091,'Stephania','Hyatt',0,'Male','1984-07-19','+19(4)987952776','443 Bernhard Stravenue Suite 245\nHobartmouth, NE 32070-0877'),('P',0092,'Mittie','Parker',20,'Male','1990-05-31','(078)905-5711','304 Crawford Viaduct Suite 534\nVonberg, NE 07153'),('P',0093,'Amely','Mann',75,' Female','1976-09-21','829.212.8111x64','33763 Isac Isle Suite 508\nNikitamouth, MS 79762'),('P',0094,'Carey','Schuster',87,' Female','1982-04-24','04989995163','51413 Vivian Bypass Suite 335\nJimmyshire, OR 10399'),('P',0095,'Dakota','Jones',84,'Male','2005-06-04','389.168.3891x87','4615 O\'Reilly Ports Apt. 782\nPort Wiley, NE 61017'),('P',0096,'Jovanny','Beahan',125,'Male','1975-09-24','1-964-088-7706x','6126 Corwin Mission Apt. 638\nPort Raheemstad, AZ 77829-8158'),('P',0097,'Modesto','Klocko',56,' Female','1990-09-19','(002)257-2765x6','48166 Turner Cape Suite 966\nEldoramouth, PA 97370'),('P',0098,'Noe','Runolfsdottir',133,'Male','1996-12-21','412.645.8517','8749 Keely Vista\nPercyshire, GA 02801-4757'),('P',0099,'Annie','Nitzsche',59,' Female','1985-11-29','503.813.6076x91','31172 Summer Greens Apt. 078\nAugustinemouth, CO 57848-8724'),('P',0100,'Ronaldo','Bashirian',127,' Female','2000-12-05','1-224-244-0420x','4038 Retta Unions\nSouth Amara, NH 05291-5555'),('P',0101,'Estrella','Johnson',106,'Male','2015-07-17','793-883-2018x45','0121 Olson Divide Apt. 187\nBoyerport, MN 56396'),('P',0102,'Nathanael','Smith',72,' Female','2019-07-31','1-878-914-9997','81797 Jody Isle Apt. 996\nPort Kariane, ND 08127'),('P',0103,'Alivia','Padberg',98,'Male','2017-07-20','(419)667-5861x7','3174 Sauer Roads\nLake Friedamouth, NV 65271-9548'),('P',0104,'Loyal','Lueilwitz',62,' Female','2013-04-20','186.317.7199x42','86618 Koch Ports Apt. 433\nEast Karsonbury, SC 47098-9342'),('P',0105,'Ricky','Kiehn',79,' Female','2005-02-20','963.263.6802x84','1069 Raul Wall\nLindgrenport, NV 00189'),('P',0106,'Shannon','Runolfsdottir',3,'Male','1970-01-30','(062)109-6598x9','89493 Jones Hollow\nWest Frank, NH 83298-5449'),('P',0107,'Kailee','Harber',87,' Female','2020-10-19','1-013-549-7619','7948 Jacobson Shoal Suite 618\nEast Manuela, IA 97079'),('P',0108,'Arnold','Dicki',92,' Female','1984-08-16','1-951-391-5644x','7778 Breana River\nJonasstad, NM 83555-0373'),('P',0109,'Yolanda','Harris',104,'Male','2018-02-10','+52(7)098289768','710 Dorothea Ville\nLeonorachester, NJ 65008-4025'),('P',0110,'Isabel','Kemmer',2,' Female','2005-06-07','432.042.7967','4504 Gerardo Mountain Suite 189\nSouth Demarcoland, CO 36496-3710'),('P',0111,'Grover','Mueller',58,'Male','1972-02-28','1-274-230-4074x','3908 Valentina Village Apt. 116\nNew Enriquehaven, MT 62671-1360'),('P',0112,'Theodore','Grady',112,'Male','2005-12-19','926.483.4221','77193 Wilfrid Wells\nSouth Susiestad, VT 84224'),('P',0113,'Jamil','Graham',60,'Male','2003-09-04','551.355.8036x00','02067 Dare Meadows\nNorth Bailee, SD 57122-6532'),('P',0114,'Karlee','Lehner',136,'Male','1979-03-11','(367)207-9730x1','77539 Rosendo Drive Suite 431\nFlatleyport, OH 33464'),('P',0115,'Maci','Bechtelar',130,' Female','1974-11-26','(936)322-8099x2','940 Homenick Light Suite 302\nNew Kamille, OH 50111-9822'),('P',0116,'Jacinthe','Wiegand',13,'Male','1988-05-17','1-715-871-7698x','235 Roberts Hollow\nKilbackborough, AK 68859'),('P',0117,'Kadin','Tromp',57,'Male','1997-06-03','680-627-1860','262 Kreiger Points Apt. 361\nDuBuquefort, VT 26830'),('P',0118,'Kayden','Conn',103,' Female','2002-02-16','1-815-104-2833','463 Borer River Apt. 419\nPort Winifred, WA 76921'),('P',0119,'Kenneth','Jacobi',101,'Male','1995-09-28','835.422.9907','73494 Nikolaus Lake Apt. 890\nRyanbury, DE 86386-8955'),('P',0120,'Elisha','Leuschke',77,'Male','1978-07-30','+11(2)359460156','21639 Hoyt Radial Apt. 860\nWest Edenmouth, VA 87448-7016'),('P',0121,'Hilbert','Greenholt',137,'Male','1990-02-14','1-866-409-7141x','256 Medhurst Path\nPort Aliyatown, FL 07209-9739'),('P',0122,'Alda','Breitenberg',79,'Male','2001-05-02','1-121-951-6212','92601 Scarlett Fort\nAuerbury, WV 94753-8800'),('P',0123,'Minnie','Ullrich',128,'Male','1976-12-09','1-690-240-0222x','00764 Adela Road\nIleneville, AR 85384'),('P',0124,'Shane','Krajcik',123,' Female','2006-01-11','172-645-5188x60','978 Ransom Wall Apt. 923\nNew Kaci, MO 25200-3245'),('P',0125,'Kailee','Wisoky',7,'Male','2008-05-20','1-368-395-7385x','025 Wolf Glens Apt. 401\nNorth Isaacside, FL 18648'),('P',0126,'Veda','Treutel',126,' Female','1973-07-28','766.891.5948','84930 Jennie Ranch Apt. 352\nLemkehaven, KY 18651-4521'),('P',0127,'Gust','Grimes',9,'Male','1980-07-18','385.218.5380','01913 Graham Light\nSouth Loma, GA 59624'),('P',0128,'Enoch','Kertzmann',5,'Male','2021-04-19','04306491403','7550 Bergnaum Springs Apt. 165\nNorth Toni, SD 95029'),('P',0129,'Mateo','Reynolds',72,'Male','1993-06-17','847.366.0395','36717 Hazle Streets\nEast Violaport, TX 62842'),('P',0130,'Xzavier','Schneider',90,' Female','1992-12-07','+77(6)494146018','15277 Schamberger Shoal\nWilkinsonberg, ME 69010-8554'),('P',0131,'Roberta','Gislason',140,'Male','1993-06-02','(524)634-8972','71325 Bruen Road\nRociohaven, CT 91430'),('P',0132,'Ursula','Kassulke',68,'Male','2001-07-26','1-735-340-9632','197 Mathew Turnpike Suite 453\nNew Jayson, CT 63148'),('P',0133,'Bonnie','Herzog',127,' Female','2004-03-07','1-880-992-5573','04054 Uriel Summit Apt. 769\nEast Margarita, RI 69502'),('P',0134,'Lea','Kunde',4,' Female','2013-10-27','1-266-687-6586x','4469 Freida Ways\nHarrisside, OR 27521-9578'),('P',0135,'Asa','D\'Amore',137,' Female','2008-03-03','1-406-257-3042x','019 Verda Inlet Suite 120\nWest Brandyn, IL 58642'),('P',0136,'Josiah','Goyette',47,' Female','2016-01-05','201.034.2867x17','023 Vinnie Passage\nWelchshire, IN 34663-4684'),('P',0137,'Emely','Glover',7,' Female','1990-09-10','1-713-715-1203x','79509 Everette Fork\nLake Elinore, ND 87341-4236'),('P',0138,'Kelley','Keebler',122,' Female','2021-05-16','+26(4)356801068','4516 Marcos Road Apt. 465\nSouth Tre, KY 89526'),('P',0139,'Ova','Kirlin',131,' Female','2015-08-08','917.594.8807x63','0978 Kristy Mall\nCadenshire, OK 34552-9140'),('P',0140,'Flavio','Ferry',59,' Female','2005-09-25','(514)924-8065x6','144 Brekke Fields Apt. 204\nBridieborough, NY 13058'),('P',0141,'Kallie','Watsica',101,' Female','1985-06-19','09361404850','068 Will Route\nIsombury, PA 24658-9514'),('P',0142,'Dixie','Gaylord',19,' Female','2015-06-23','379.502.0898x17','3649 Salma Knoll Apt. 440\nNew Alysa, IL 36869'),('P',0143,'Otho','Bailey',82,'Male','2014-11-19','291.087.0659x48','0192 Morar Orchard Suite 054\nSouth Christa, RI 74382'),('P',0144,'Golda','Abshire',9,' Female','1987-04-13','1-532-376-0529','335 Nick Keys\nSchillerview, SC 91789'),('P',0145,'Judson','Rau',125,' Female','1974-06-16','791.508.8635x11','640 Martina Circles\nLueilwitzmouth, GA 13432-2570'),('P',0146,'Alvera','Tremblay',72,'Male','2009-01-16','1-005-159-6906','791 Nya Ramp Suite 924\nBlancahaven, VT 21305-2869'),('P',0147,'Leon','Tromp',53,' Female','2013-02-04','(939)993-0740x3','49173 Johns Crossroad\nStefanport, VA 91844'),('P',0148,'Lorena','Reynolds',25,' Female','1998-02-05','(113)392-7317','1106 Trent Parks Apt. 923\nCaitlynville, VT 25583-7432'),('P',0149,'Nola','Prohaska',107,'Male','1993-06-23','(036)068-6518x5','1641 Karl Cliff Apt. 313\nPort Leilamouth, DE 81428'),('P',0150,'Reggie','Zboncak',124,' Female','2018-03-23','(544)550-6446','595 Hayes Springs\nPort Wendy, PA 09453-0326'),('P',0151,'Nona','Watsica',29,'Male','1973-07-07','+22(6)528220104','96117 Upton Passage\nNew Adrielshire, LA 33639'),('P',0152,'Osbaldo','Pfannerstill',38,' Female','1992-04-14','1-547-587-0637x','98622 Quentin Mountains\nSchinnerview, AL 91287-7419'),('P',0153,'Melyssa','Maggio',65,' Female','1981-04-15','(878)604-7499','279 Okuneva Key Suite 228\nLamontton, DC 75046'),('P',0154,'Kevon','Powlowski',139,'Male','1994-10-22','665.952.9205','3833 Malachi Extension\nSkilesberg, AZ 97214-4526'),('P',0155,'Preston','Bailey',133,'Male','2004-12-14','918-600-0040x19','9247 Ward Walk Apt. 587\nEast Sister, CA 38054-0735'),('P',0156,'Audie','Weissnat',38,'Male','1987-06-06','813.446.3928','0503 Vance Stravenue\nLake Clarissa, NJ 04844');
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
INSERT INTO `user_account` VALUES ('U0001','admin',_binary '$2b$12$95Ws96WC0ETKTzn.hzRP3u/JuFyo/.KajZks7tByGuNX8wsNwtoXW'),('U0002','doctor1',_binary '$2b$12$95Ws96WC0ETKTzn.hzRP3u/JuFyo/.KajZks7tByGuNX8wsNwtoXW'),('U0003','nurse1',_binary '$2b$12$95Ws96WC0ETKTzn.hzRP3u/JuFyo/.KajZks7tByGuNX8wsNwtoXW');
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
INSERT INTO `user_profile` VALUES ('U0001',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0•\0\È\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0A\0\0\0\0!1\"AQ	2aq#B‘$Rb¡±\n3rÁğ%4C‚\Ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\09\0\0\0\0\0\0!1AQ\"aq2±#BR‘¡Á\Ñğ\áSbcr\Òÿ\Ú\0\0\0?\0ZZ\Êô‡\éı´½$ÿ\0\ìk®UÀ±c\Ö,#YYœ\Õ\"–\åe¥zo1\á\ŞÄ«B‡\n+‘ó«~R³ºÀµ\ä8”B¢\ß1]Dˆ\èCM\ÔGjS\Ø\âRBC‡\0¥\\ŒªWp\Ø~E\Å`†ÁXR”¿\n\ÇÀÆ¡v\År½·U\Æ\î‹eK@…¨¶¬« ä‚œ\ëŒ;o\í¹D×¬ª˜\â›S)\nùV9¥^¼£¨û#\Ğ\ÔzÖ†}Sh\â\ï	\æ’6PşbÑ«Òª”šÃ´ª¬u³-•­¹,¸0¤­´\ä|\Ğ\é…0A÷Œ[i—mõ[h\"ôµ\Ô\ÚoxM†\ê;MQ´\0|º”>Wù|\ãUk\ì/¿Ü…£§#µYƒy‚0y\ã]\ÙÖ¿¥\ë\Ú\"f\ÙPK¢\İ\â9¥Gøó„^²ÑµU2³	ğª\å*(õ\Ôo¥¤¤w}5õ\r8\à\nBr	À×©/Àu•Qœ—\İ[)o{”N?S¡\ßq:\çz\ä¼F\Öt•aË¾+\îtøÀˆ=İ¥Eyø\ç’P‚|)^4eQ©JSš*y`\Êùı7÷\Ú%)\ÓUp4›ƒÏ—ë·¶ñv^7Å‰b\Ñ\r\É}Ü±i°Z$ı\âSİ€c\ÉO‚¢<`}u^lGTbõ{\Ë{\ìñ¡Umh3\Zv\ìWÁ‹¤…¥œ…N{\0Qúöj\Ç\Ùo²B5÷X…¾_h\r\ã&ö¯­±÷;6<…&™8RPò@Oª{H\ÊRcÁõ4Hn]B\Ğ\Û+2-»nS\âR£AcÑ‡O†0\È\à6\Úp001œr¹‡_v\Ôó\År´“ƒ\ç\ç=%Ù”³<3f\äf\ÑVô¥\ÓF\Ãô©¹.u¹µ‡7—u\åI2\å^·\Ò0\Ä»¸ª3Z›i^;V¯Q|pQÀ]‘ö­4\'2.\Û}•¶RC‰R	?\ê\ä¯r\ß~zÈ·¶~I\Ö\Íbk?z\è\Åq+C$\ã#\×H\å \ä`‘DûGzuªR\×=‹\×\Òd®p3Á2~F|ó¤su\r\\\â¾)$¨z{\Ãq\Ê]€\Ù£¿ô.¯ö«aú½¸ôº4&=U\Õe†‚”)\\,ı1’~š·÷í†±¨J·6\n\Ír¹-³\Å\ê\è[p\ÒG…!\Ş\ç\×9H\×3¶‹\í\ÚJERe#üeI«S”“±HrZÃ €I\Üğ¡\àüè˜¶6k:\Ûg/Î•o—dTÁ™jÕIÿ\0kŒ).ü‹ö«y\Ów³ıO¦¦fD¾¡m\Ãk†ıü\ái­hu¹V;\Ú:‚“\Î\ÙXòP\Òş\Ñ±w;yã’¥©DµM\\¾\æ”\äÀ×€8ó’_[ö\Û-»´\à\Üm\Ç\Úú5M RU*c‘\\ÿ\0\"’´\ç<ùĞƒS \Ö(µ)4š\Õ2D)\İô¥F˜\Ém\æ\\\çØ¤”>¦G:\ÆSJI\ÂNu\Ón\é=1?.’†RE<úD!š¯Vd\Ş%N+&\ÄV\Şğ@}¥{\í_Q;}··­»gU\éW%‡Áª÷TZiÆ„U«\Ñy=\èW’“Œg\Ö\Ï^=3\í\äl\İ\Ç\Ü\æ©X\Í!^„ªl‚N 8\Ø\nB“\ìR<smvŠ\Ï\İ?\Å\è[Nõ\éK‹0jªˆSŠ=§\Ô@*\nHN@HòFŠ›ÿ\0¤KOw-\äVÜ©¿O«¦‘\Z<\ZŠ_RĞ°\Ëe\r‡{€.qÛ•\ZS\êiZUa4…¸´¤fü’O(cP\éÚ®¤É¬°„+‰$[™Oş`½6ÂŸw¨*\nR\0?Àyı;5®}§ıÑUuPP<®ŸI\èW\ì{÷\×.÷/iom¡¹Â›‹G,Iô»\âº\ÊÊ™”—[P\áI<qÂ‡\È\Ôxµ\ê\'!ps\Èö{E›h<\ÜÂ–ƒ\Ò\Ç\ésºÖ³(¢ÓŒ¥7\é¾~\Ùİ£§\Å\Û\Ë¹Vw°\âL\ïN#J?@=\êúh~\İµªÁap\í)t{N3”\'ğØªrCc\ë\ë8O8ÿ\0JF†²\Êq„ÿ\0\ÓI,\ä\çúhOB\é\ÙK\ïÿ\0mÿ\0¨›\ÕÉ£—8GD\í\\w\ÉwUİ¯\İwº´÷ğ_5\å-ÅŸ\İDœ\ã\è°‹.\ÜS\Ç\ï§V\Ù\îö§8·¦ŒZm))\0@\à\ã¹*QQ=c$/ƒ¥¬•2\àÿ\0Æ–¶q&>£Ş—ò“YwG\×ş5\åq‡¤ÿ\0mhJ€PõõÃƒxŒ\îeU¿©U$V§·\Ó/Le÷\Zk»Ş¦\Çú€\Ï\×:‡Pjt\é0‘6Ü½\å\\1S3%\Òj1‚jŒ¬U\nJGq(”‘\ÈNÎ§÷½\rrÏª\Ğ\êO)¸ò 8—CE^ˆ\í>\â‘Ê¸ø\Z‡\×\×Õ·\Ò\Û{\"¿*‰D\Ëõ\ZePõx\î$>\Ãi)=íµ»”«ò€S\åC\\Ûµ…W›p§+n\äô¶6\ç?\Ø\Í~yŠQ”(Û­\ÄH\í\n\ÍÍ´µö7\nÎ’©0•\Ø\ë­\ÇÏ¹\n‚1õı‚N<\ë¬¾ºp¥3v\ÜDŸt\î}ZG\İ\æÙ¶\Ì5H/\È\í[‹@!§\0¡!k_œ“ªşñ\Ú>¤·–<½°³o8¶¥ŒÜ‰\rş-5æ„·Z	\n\Â{=½½¨Â‡$j_ÓÀZ]\\±î­ ·—Q¨ºB&T\êJ\ê+<Rñ\á¤,Œ(\0<“\çIM=5¥+È™Z˜P<-7rÿ\0\É\Ê\Ã{u†Æ·¤JjJbÙœBZi²\Ş8@±\ï~G\Ê**6\Âõ\Õe6-oªJ«\Ö\Õ=¹^ªlZ4À\Ù<\å)x‚H8şU+	\Ñ]\Ñ\çO»qg\\\Ñm]½² À¦S\ÒgKˆ\Ë\\IZU„)\Âyq]\Ü\åYÔ¿x\ìj\Ôæ·®\ßf\Z©\ÕVš¬\Zsº™3·$,\'Mg+O´“<ks\ÒC(=T…\0¡Mh(ƒ\È÷sıF»±Ra}?Tm|¢\Îq|\èR±byglG)È²÷ùƒr\n 2\á\áùUl‚:\Üo\Ò,»–\ì¦P 9^«Nz<Rµ—$ˆ\Ëw\Ñ@8R\×é¤¨s\ÈhûC:·\Ù\ÓQfŸTf‹pSbE.2\Ó›+J¿\Õ\ÊI\ç<Œ\è˜\ëu¯[ngÓ¶\Î[\ë\ÎR\\\Çæ­¤\Æ\ï\ç¿\Ôü\Ç?\0]p§ª\ç\êp÷{[\Íw.Lõ-Æ»X\Ö\Ş‘(\à¦uÉšz•ö³…\Å+ \ïx\èi\ÇÌŠ~[!ı\Ş\ßkYÊ‹\ì\ì…B\ë¦úò•ë°º\Æ\"òA!!	@#?—şºôùÒ¯Qe_bÁ\Ømºª\\•E>·%¹‚–Z‚\ã,„! J?®¯Ï³ ªS5\çw;ve8Í§O™\é3Lh”ª®ş(R\Ç)i\0¤’9QV»ñ\ÒE`vF\ÃfÉ³\é+B\åšdT¶\Éw#\ÉI÷«Ç’NtÀv Üˆøv.¢#\É*#ó\íüLÂ¬“·˜jtÿ\0ÿ\0d\â·X°‘X\êK©•Á¸\ä\ÇK¢e\Ó\Ô\å¼ê‡©\Æ9BR<òu¿¶~Ã®µúB¿SY\è\Ã\í\n¤3ZŒ¾\äÑªñ$\Æ ó\ØúP§Z\Ç\ÆJGï®”u_ºUZ&\Ô)\êUFE.\Øz)]n\ã#¶Z\nÂ™FP\Ê\Ç8ñÎ©Í€\ë\"©\ÔK\Ñl’úl«C¢Cy¸ukÂ¾§R=F[púò\0%Ò>s¨ML,ñ)\\ö8~—ı\â\ŞZ˜\ÊAEŠS\Ôn`F¿zª\êFÃº\ám/\Úg±Ë´n‰¦±¹´ô—©5\×‚R\Ê\ä$”`\ç	\n=\è\Ï K\È2-\Â[ğ\Z@ÿ\0¸|cÇ\ã]N¼6®\Ì\Üİ¿\İk6—pQj1\Üú-V\"Š¾9R’¤¨Ÿ\ç\È\Ğùjt›S\é\Úóiª£Åºlº›Á¹´*\àV)“Ú¦%­ER\âXw.6“Ü—³L½\Ú;šv©Y„”¦ÿ\0)\çk\æ\Ş\\¹B‡Wöx\Õ]ñ5.xˆ#‘#¨‘¹6\ÌQ§nM\ëRô¡\Âv2óCò¹üR¥gùh\ï~º0z{\ê®\ÊÜªZƒ\Ø\ÊC\Û[%n\ç\Ô\Ï!_®©\î¤zt¶7\nú¨\íĞ¦¢K”…LŸOq¾\Øò”…{š(ü ”øW\0\çB—N›G~\Ù}<\ÛŸ·›–¦\áÎ¯T©ò)ÓU÷e0\è-úNBJ¬¥_” Æ¡WN´šUJšx”~dÅ¾±sF›gFI3F«xA\Ê\\goO\Ö:}»»[eo”ºx\ÇX%R`T™÷;ü`8“ô\ç\Ü?˜h¼,ªş\Ş\\²\í²#ˆ›kA=¸Cƒùlÿ\03jÁÁú~Ú¶:_\êf\âMpÚ·]a>\Ãİ’Š\Ü9\Èığ8ı5mõ)µV\Öü\Ù-×­fE\ÉKif+¥\Ïl¨ø\Éa_NIR>ŠùÕŸf\Ú\İTY\Ó!8x[R¸H\é\èTv‰£SS–øùa\Æ\âv=G/\Úm->\ìt÷ƒ\ÊOj†<x?\Ø\ë\ÇİœŸ\í®š\â\ÄlEÁu7\È\"\Ä\r\çÿ\0x\ÒÓŸwÿ\0wük\èr	W¶³Š<á†´´\ë\Í%)\ÊNy\Ò\ÖqFp\ÆW ¿¨\×\Å4¤ı4ö¾ƒ¯P=Q!&û¤‰X„\ÓEì”¥~¯\Êûdóª\Ø\ìU\"4\Ú]m6<‹v]9—Z~­9mS)À°\ÊU%À¢T\ÚH	\n\í*>À“g¦¥%5Ù‹Sq\à\á÷h{\ĞB\Î>OõÔ—öÙ±½\r<\è«A¯¼\ÅN3\Îˆ\ÑÔ”\Ò\Ø\ÚGp\îW%DùÀÆ¹¿µ\êz+\ZÂ›\"\ã½\Ò\\IIWL\à{\í\Ù}IT]3?>\Û!Å¶¤ğ˜\ßÛœE£!t\Ú\\Kz‰Aƒ\r€\ÜU-}Ïº\ØùW\Ğ\'õ\×\ÔDm\n\îH\Ç\×İœŸ®½ö„ØTO+W\'û\ê[²;ut·=­\\®·K‚S\êH˜T\n\Ö3I´Ÿ+?ğ\0<iŸD\Ò\ZS@S¦™Jl<JÜ“\Ï;\æõG©õ½P4\ê\É$\á \ãô\Ú\ÛmÏª\ÙŞˆ¤	$²X‘Nœ–\Õù›^|ò\å:‘R\Z¢\íe\â\İ÷oOzM£VmQ%H\0)øK$+\Ò{œ÷ „”“ù:˜u\Ñ;l`3uZ[µLü6k\nTxµ\ç‹2B\Óù»JPS… ÷+°p|\çU}vN°*­†\Ş2c\Ìÿ\0+\\¤\ÉN†Á\å|“\ïğ¤/8?\Z\Z«&—XiùŠR’\ê\0}«Ø‘\É`uO\ï2ŒThó-\ËT\Ñİ­&\í/\"	\èyˆ¨úö¼7e›R«‰(L™øp0=L%6¡BğR ~yùÁ\×o\ÑQÿ\0Î“qÁZf,U$£µeD”ür5\ÛF/Ksh\Õkr­BZ§¾ò]¥\Ï{Ó‘”…÷øOr{N9\×2:ÿ\0\Û=¿\Ä;\Ûh\îõ\×)_Œ&™Tq=Fr–’¢{^<(#Œ4¡–\Ñ/\ĞB¦¥ˆr]Ë±ƒ\çq\Ê\ÛCU\Z‰›K¾’Û­Y$~}ˆ<\Ä\Zı7\Õ\ê;\Ó—j\ÛNSTf*Ii!l¸\è.:\à$x\É\0Ÿß¦®~š:Œ\Ù\İÙ¿A\éÓ¦‡\îŠüv”Šş\å\ÜugS!*e—{V·ó\Ú\Ú=0x*\Zª¶>·a]´¡i]qJš,¦;\Ì<G\0\0;GÓÿ\0:<úµ6m­\Ä\Ğv\ŞÌ§Q\İS˜[T>}\Ş~sû\èL¸\Ø}\Äğ\Ş\ç’rŠK))r\éM±\í½†¾©U‹‚«\Ó6\êS\ãÈ–…)\Æ#\Ô\"¥M\Él’¥e$\áDg\Õ\ÇnQöKefÜµ((R¢†¬\ä\0S\äg\Z>\ÑKK¨«¨˜WN\ìB§*¨\ÌFE\ß!)Q¦†\Ü\Ë\Å-œ•Ÿ\ëo¶[©vb³:y^Õ»\Æò®¼QuT\é\ÍJªªL¯h.ª3Yû®x­£³\Ú9\ÎuË¥Ió‰O°\'z\ÈU¿(¿¤t¯ M€\Ï\ÜWÜŒ…#÷\Z‡V¡Vüt$¥m/¹¥$óŸœşš\×lö\íY7­­÷\ëR¥%˜¡?\Âf¥\È\îÿ\0‘Ô¥Cö#^nM\Æj)S.¸y\r}¾¦şm­LÊ­\n-)=wû¬\Ëò±$n¦.•®5èª¢V”\Ò2#\Ê^Lw\è¼aCıZzX‚k][0_y	B¯z³ªpºR•6V\îÁ9\íÀu|}§\Õg·¥Zİ‡l\Ó^¨Tk2\â±N¦\Æ@S\Î\ÉCÁc°;]Ç€9\Î5\0Ø˜mJ\ÇXV\ên\Ú\éÕ«^µ.¯%ªm-R`H~C*d0\ã½\Éš;ùV¸p\0\ÕÖ¯·C”zd¼µ9ß¯¤/õ˜˜®\ÍÊ¶\àJ®£\Ê\Â\Øş ]srª«\İw•!\ç\â-\É\Å))(P89GŸ\î4dlR\íÍ¤¢5Mh.¥ ¥¯\É\Ö&\ëô¯·{\æÚ¬1£•7\\b×¨Ô¤6”ğ9\î#ó\'\ÊI56–D\ï¼Eª!ö“‚‚Ò¸9ş¸\'\ÓBO*mfd%\Ş\ç\Ö\"URÉ•\á\á	ö‹~-\èğo5]\Í5µ”Yü:F\\@ú{°c¨O ¿¨\Ö\Âe\ÑT«Ó™¥.@\\VWŞsqŒÿ\0n5‰®\Ì\ìúzrJ0\ä\È<C\æ?7¤r\'h22tıVûRª\'8\Ø\Ë\ë\r†p\×\ÂÂˆ §t´kqc(v\í¥¬€qñ¥¬Œ…§ \ÅT¹_w\n	\íA[ªZ\ÂP\Ú\0\ÉZ\ÉÔ¯ÿ\0\İ0\à\Ê\è3©~\×m\Ã[ª\ì›Eø²ú„\'L©1$†\Ö\ËM\ä T\ãy 	k-Mş\'@r ,T\ÎIox \Ót3^ªµ*M¸}ˆj¡´wwı\Ó7»H¤J™k\àıÀ\Ì,Fe9 ÷”«½´òr§\Ú]?°•\ê\×Â¸,ë™©oR«O¡n!lw¦?j=5‚8\Æ0y\Æ\ÓV®Ñ±X\é2\rRZ7r$º(i\Ã:ı)R\ÕQOo¦,œ7ÛŒ‚¡‚¬œƒW\Òdtmr ?n\ÛWı²\Ójÿ\0\ícÓ››\0q\ìK\Î%Æ“ô\Ä\0\0Æ¹¦S´*µ—-j@A\âC‰I\nJ¸´:ft½cN-NPU…!_*…³\é\åË¦›A¡\Ü)6\ÍÀ\İV\n\n‹<%IRĞ®BH>ğu\âß©=J©Æœ‰N4\Ûr\ÛT‚Œ’´r9\È\äc\È\Ö\Î\à¸öòsjW 2\Ë+M^\Æ\ÕXÊ”©.$Ÿü¸ıµ¥¨nT¿º…\ĞwOn!¨ \0³n:qò;|ÿ\0]MvË§N20\ãà¤‚TQ“\Öşp=#\Ù\åu3¢}—Ò¸‚‚|Xò\ÄT\İ\â´7Ş–\Î\Ü\ŞwsTª´UŠmB£/B’ÃŠB\Ô\ÚÀ\à¦Ğ $‚œdjg|ô3{n.­U¸¯b\rU”ĞŸ`ˆ\Í&7j{\"<„´”„‚	K™\Êx	«›»ºÑ‚\äÿ\0ñ\'Cˆ–â¨¡vı©$œ%9%À“œüB®‹z¬’›†\ì\İ6/J]]J[[\Ñ\Ùbh–¦T¤!mI.,\'€;ú‘Æ’’:¥tšÙœ¥\ã…G‡•¡¹R¤3^”Ï k¨Œ.¯vŠlŠ\ÍN›:\Õ\ì¨58\Òj\Ğá•ŸÄ»[Kª\n\\RJ›	ö•„•¨§¹:ªj»;³5nşûl\Ù\Ò\Õ\"³\İ2ŸNª\È\ËT÷#<S–[N@Wµm¥dû“ƒ„•k¶\Çu÷n±¸.H¸o4x\È\î9UŒ—±\ŞV ˜\Î)c<¬‚8\í«?n«öö\åmœ\'¨lúK¡U\æ\Ò*õw¾‚\ÔJŒ=‡é«·5]Nu/8’C–*Br-\Ôt¿H•\'¤e\èÁ¦¦\È\å\Ğ§(uYTŸª±P\ìï”²¤ğ0³Œ\Û\Z&zy\Şjõ\ntV®†\Û	÷„¨€}\×Üš™¸Z}:B\Ìv¥­!%’NGÆ³\íòºh¯%,\ÉJ~R’¬5½rô%VI\Úø‰²u°{µrÀ_Wkûİ´¬´›„Î†Ë¡µ¡Ì¨w4S\İ\ç…‚?m½\'ô»ÔŒ\ZË›wb\İ1¬{R<•J¹\ïi­?R©¸£ÑŸ\ÌU\áD43Y½k_ô\×Zn;-XZ¢±ûøøıÿ\0MY¶\Ú¿\n\ä;n\ì\ÇjR\'„„Am%\Ç\Âp<Ÿ\íªÿ\0€™–YO±‚km2\È\'¤u<\Ø¨\ÖD?»\îÒª’ \Ç\ì.¼\æ\êÀ\ä­9öşÚ­ÿ\0½.)Á€°\ámÂ…¼¬„ş\Ó\ã\çUF\Éô½\Ô\r\éSƒ¹[\Ù|T(¼\ãÖ5\ì%@ò\ê³À\Æxóõ\ÑCÏ£[–\ê\"Ám¶€{\Z*\á#S\çU3Mğ®\×\ÇXö‰û\Ä6Hrİ’\İBjıGZ9R\Ôrsòó\È\ãN\ï¹R³\Z¥o]Ë§\Ç1ûŸˆ\í-/CP\Çş¥ô…2sRû•\ÔUm&U!2XD¨\ÅJq\Ç	·Ê³ñÎ«[­z^›d\ÏQ»c½\Éjß‰Z‘O¨C	.´û^š–^\È)!i(#ò\àk˜l¦E×/İ¤ª4=9*‰–Pò¬\\WÏ¼{\Û\éU\å¨À¡\Ém1\ãÔŸLF[w)c+6x\È \ã®£[\ÛC¬E»\"=·Ñ’¨7«,\ÄJ{•\nRAS\Í&ŞŸ€’~P5ª\Ø]ºUb‘p¤\ÌynW\ÚiÊœ%„¾’°hR”Ÿ9-ƒó¢×´\ãÄ¨S*’\è\ÅfE·\È\Å\r+ü»Š\ã•a§IıH\Ğe¤Ì¼òMĞ¯˜¦=ª©i($\ÛÏ§\í$(¿‡\Än	w¹m“\ê/»%_¡\Ó\ÚÌ¹¨’-[¢§jÉ¢\å6§\"‹PÁ\Ën…ı@÷\'Xzı¤7.\İ9‡A@#\Ò8–¤\ë\î\Ô][\æ\ê*¼----ZD;ZZZZ\È\Ë_¡\Óñ·º\Ö\Ø9‡r¯Y#Ò›J\â\ËzÅ°—Bp¼ö›I\'ıcMö§\é¬j\Í\nqÒ¤Pªô–&Â–\ÑjTWùK‰?\ÊSò?nF\ZÖºm\ZŸM½ wVG-ˆ#\ét\n\Â\èuF¦\Óøp}ñ\Õ7\Ëp:¯fT®œ¶&­V¥»$D3g­*y\0M€´©y\à\Òy\Îu„\Æ\×\Ù4£%‹\Òş©Ì¬B–¸\Ò\é4t!ˆ°¤6²—\ZSİ§\Ôq*\nI\ì\îHR\n\É\Ö\ÆÙ™U°)Ñ©k_›B‹2šˆ\"6\Év2JB{›q@\áa „¬ «“\È<\é¨p¢Si\ì\Ò ·\Û\Z2;A%X\ÎIVI9\ç$“’NrNú±™ƒ6§+ˆ	@8H7\â\Ö\Õ}£³ğ\áºRÁR†OHÀ¹\íhó\Ük™K£\É)~§\rUB¤\ã\Ä<°œò< \ê&©\ÜGR%õ\äT`³D²bFıP¡ÿ\0L\êx\âHYƒ\ç:ø’S•“’3¦\âû%\Ğ\êY)—)ˆ€k\íP\ÒC\á^e Ÿ¬Cb\ìû\Ï\Şfo…ûQWnø¬õÀ(Wö \ê§\êO§X6ÍµG¿¶\Òm\é=º=Á\Z]\Ï5·\"T\0…%´²\ÚTVF{NH\àcÎˆ°²9 ıBF±+u¨\å\"M\ÃV–\Ìx°[T™O¾²„$r®\á\È?L|\ê$\ßf\Z:^UE¶\Â1ó^~\Ñ>‘\Ú§5VÁûÁq\à·\Í\å\ï&\ßl¬Ê®\Õ.ù\Üúj¨\Î\Ôj‹H§7ü&™O¹m4\à\Éqarµ\ìd¡·gz•¹¶¤©ñ\é-U\éúô\ÕW)ª|!^›}¡©\r,şWVq\Ç!JF_P{Ç´\Ît½¸4\êm\í\×*Thbİ†\ÙB–óH`s\íPh,œsŒ\ç@\åkl ½‹‰iK\Í4·ZP?\Ãp $öŸ d\ß\\\ï«%©\Ún´´Kº\Ñ	\à\Û6>—‡ W*\Z¢‘ß¾q*\ã¢n8w\æ61inu\Ïmß°™¼U™4«ĞV%*Ò–ÁQQ\í ük\î\ÇtU¼=EÜ‰¦mõŠó0”˜\ë«\×j>‹2¿M\Ô^¼`Î±lZ3ÔŠ-%ôÕ¾\î\år¤\Í6p\î\ëmA\ÅJGw)q´÷”‘òu\Ñ-•¹ m\Î\Æ=\\¢!˜»Hešcq\Ğ2\ÓÒ–†›9÷€µ|\ä \Ô\çÃ€´¯œ\Û7°PVò¤Û”B{±\Ål] “\ç¸e‡Lt‹|[tª\ÕeuT\á¹\×qªºN\Äx\ÊQo÷\'Ü“¢bún\é\ë§zSS\ìK]µ\Ô;;_«\Ô\\/Jt};OûP?MTğË¥Q§\Åcµ¸øöŸ\çXú¹„«w\îu7–Ô†\Ó\îP\ÆU«¤»0\ÓBÄª ³\"76ûA_7t-ø,w¶\èõOj{|¡Hı³RıGu›dm•2\â¸.»³•«W¹gHT¬>‡\Ï\Z7+­˜Q«‰´\éR\Ò\åZW`4 \à?$Ÿ\ÆOÆ©Î¤zk\İ\ê—Gİ»÷p£V\ép\êq\ÓY¶\ØmM&g^BK(ŸyÊ’•)@5\\ıR]‡R\Ó\ê±VGœXK\Ğf\ßAr[66\'¼bPÚ½º\Ø\Ü\Z½\Ûs\î5:K—ÁN†\í@zil“‡]<u;û;z„²©{Qtuº\×\Út\È]ME=‘h÷%\Ò„a ’9À>|j\Ê\ê\nöÛ›:|™!¿Z©ğ)\Èe4\È1’òÖ¿I¤ö\É#\0r@ÎƒÛ¯\ìø\ëi\í6w\î¿mQj±‰Õ«.‘Võ\ê\Ôv•\îCG)q´÷$©=\ëP)cWz\ZªıS\â\n\Ûû•\İ\ç=¦iù\Z|³™»ÁAB\Çb,Gü\ÇD6\nôµk4jmnÏ¸bO¤É‚\ï{J	=¼`§8ò3\Î5<\Ü=\â—@,S\í\éEš»dJõ\Ùæ’‚ÁVq\ÓC\ÆS¬Íˆ\ÚZ®\çn.\í±l\Ó#I™M[\nºÔ…€û“¬«\Ü{GnAQ\0{•.\Û\í\î±7ò–ş\æmô¹Ë„·U\Å\ÔiŞƒÀ´\ĞT;”<(x8>x\×Æ„\ì÷º\×\ì\Ìø¥Öµs\æ2} wT\ënûMº\ãX})\érm!Z\íj­sV¤\\UÙ†LÙ¯-\é’NT\ëŠQ%_¡\çX\ÚCÇ-w«,·,\Ê[@ğ¤XzG-¸µ:²ã›˜ZZø§PƒÚ¡§iôª…W¹PÒ¥‘ùP?˜ı5<\ÛI\âQ\nua)0Ş–·\Ğv¾ğ˜Ğª{ ñ•}tµÔ¤\Òr±şwş™YŒ@\É\ZA“üƒ:Û¼\Ë*´6I>8\ÓL\Ó\ä¬zˆŠJ<wm/¢ÙˆI[—À1€\Zq(\î)×Ÿº•$¬?}niôğ©˜|a¼}58 \ìª\îr+ôµ6¦R\Ş\nAü¼r¯\éôÖ—\êm2\Ø.u°ş\"T¼Œ\Ä\Âì“\Ê*·™-(6FFqúi¿\Z°/\í«¬\Ñiq+¾S/‚P9@?¯A\é{‰‘”\ã:\Ù+6\Ì\ÊJ’ G”|¿.ôªøNc¹xW#»uG\ï®\æ\Ê\ÜÆ›´\éTö%\Ğ-Ê‰’„4À*¬T1•¬ù\Ñ¨H\ÂV´©J\Ïi\Zºk´\Å\Öh\Ó)MU$ÁT¸\Ëg\ïp\Ô¬÷\0\nH +\0\Ù_^u@Ş»GwXÓ£P­Š\nª\íMğ®+kV\nYBF2²ŒI$®;DûQ\æ\Ë`÷_Š×¾yzC³óOin:H\ï\î8A¶5_lDki =}\ï$;U¦£•!N=uúM%\Ø\Æ/c’„­R•Ú‰ÀP\î ¥µ‹\ÔşĞ³´t6kÿ\0\â\Ï\ÅzJÙ¦²óG\ï$\Ü@\íWh —2HN4Aôó³6¾\ÈY(¥™U®:‹\ë‘rV\ßJp§ÿ\0\áhy\ìN{B\Î	Op	HQ\Ì¬=¿U\éS„õEÒ¦Ø¢7÷&B0–Š\ÔVµ…qŸ•?M$õ¶¦\é\í)ñuF>ùJ±\Ğ\ÛC;LW®jT\ÉÓ»(I\â6°Q_I\Ú2Œ”7®YLxµ–d´ó\íz¨iµa‡\Î\Ée\Õ\0~\ãF6\ã],\Ó\ìZ]¹¥1®4\ÚG¨UÚ–ÃŠ@\'Ÿh<\è\Ü;Ş‘hÛŸ\à*\ŞC’›SNIC$µ)W´¬IğOh8Æ®µ\êº/R1–\Ú\r]\Ö\Ôj’ ¤™‰c·½m\'\êAVGO#(™fd²\Û\Î8=´1\'^L“„\ã\Óş\"k¹Ûº\Í;&q)	^8>4>\î%Ñ»ûˆ‰NZõ5\Ó\â0“÷§Xl­e\'À.Ú‚G„N\ÜZô\Ä;\ZŸ:°“YšX ¥¿TSRIP\áN€{ƒCò\ç$’5…X\Ü\ÓC·\Ù\Û\ëY-¦<uŸYõ»ƒ%xÊR\Î•||jdôó\èJS*.~±¹µ\Ç•dˆ‰t\ã±5+\ê\í¯W.	ó&òf\\™*Sˆ_n2r<øñı´tıµYPª÷6\Ù_õÉª¸bHatV+	ô\\rŠ\ÈPVA	\Ïv?—Qa·BÛ¯[¶,&\äPÛ’©µªŠê±‘:JT…-¥±¼HZ²•aZ\Â¦•d’‘¼û[Õ\édn³·‘b*Ì´Z¢ªS1\Ğ“0,ÊŠ8u	\íH\n	\ÈQY\Ï:ª\Õ!\ÄÉ™‰´\á!<\Ï1\é4\ç\ÆOT„Œ¹)I¹Y¿.^ñ3\ë2Õ³º\Ú\nT}¶¹\í\ê\Í\ïb^\Ğ\ê\ĞXT²a\ÉK\n%\è¯8\ØXË‰ €¢	\íĞµ¸}e\İ{uG»hwZ\é\Ó-\ä*+t\é#a„¨ÿ\0ô1¸e@%Y\È$kK\Ô\Æ\á\î‡N}N\Ö\ìm¡»ÿ\0	‰\\Cuˆ´¸M0\ê}g\Çñ\Â	\Êò¢\n\rGkTÁ\İ\Øn\Ü[…@,WgIn>§\n\Û2e’`(¡=\ä‚A\n\Ï\Ç\Ó[´\ÍQú, Bˆ\îW\âA\Ø\ç¯_hŸ©4,½eL¯\ï›\Şû\"Ep¹oõ	yÓ®úU\Æ\Í\Zà¦¶”7jW\r\Zk¿%—O,­y\ÉB²•r\0:.6w\î{‹bª/øb5¿r\ÓĞ„\×)\"7§\ê${BĞ”€1””\å*‚FN„-·\èòôºwb\Û\Ùz\í\ŞX2S]®Iô\Ó\Ø\Ó,­\ç\Ş÷v¡<6 \ã?]_²·ivò—E±6w¨J•zM\Ål9*†õ\ÕK„Ó°–şò\Ó	w±D6\ç¦\æGbÓƒ\îRV\0lQjRO”Ì²«¡c\æ9úòô„=VŸ3\"\âšP\Ş\â\Ø;ÿ\0¸‰\ïiõ\×JŠT3\à“¯)R®\Ô-*ö÷e*\È\Çï¨;©˜ª\Ôxu‰{óC‰&s`­¥3!\Ô:\nA+\nJ<Aú~º\í—Q=\Ğ)2¥/s¸k1Z[©	ÿ\0/·•)RJ‰ıI\×G§]\ÑOK\ë_ˆşBˆéºŠ¦”\×“\È\ß\ë\èöuf¿*;lSqµ\åIR‘±Šª¿½NO¦\0=˜$ı9×¾‚7+gú´¶j7F×¡!4)É§W\"­\\°\ëˆJÑŒ\ÊR¬\çô:0\ì\í¸E€ˆ°c¥(N	\ËX$~¼ù\Ğ%g[¦u%\àA­L\"R\Ës&*:N´ \Èe¸\Î6¹JA\0\çé¥¢=¹6\è\ãõÆ–‚~ÔšQ¹Yı`¼IKQ\Ï{\ëa&QR\Ò)\Î4°\ç\nq\\ıuµ t\íœ‰u:±uH*q\èÍ£ó\'ôW\\’-ù\×°‡‚”şdƒ©Õ«·É¡&\Z\Øl«µAI_4w1©\æ\Úm*\Ï<Àš4ü’œ+Jw\ØZö\íºŒ\×[¢%a’\áôû‰\Èñ«Û§›Çµ\Ò§8K*-H\îGğ\Îxóòu&·öVM\"ïš—¨¨ô”¼¡JğsôÕ¥@¡Å¡P’€\ÚR\ÈV]	À\Z‰Y\Ô\Æi‚\Ê9\Æú]¹Gû\åE½–¬\êm½J‚\Ç\İ\à²Rókg¸sÎ„\Ç*Ş”\Û)FTGj@ÿ\0t/8v\í­1ûbœ\Ôê—¤P\Ô>r”$~ƒ÷}»q\Ó]v]^\"uÒ¥:Ç\Óô#>?mhY ´(9\å\ëz\ÒUq+nù½úDT…%%*<:ğ …‘\Üd\'÷ıõ\êk/4¯\â$yÎšZ\ÒS”«<üi°Ò\æ/\ê)S\"ş‘\ì’S\Øq‚A<y?]Dº‹²oZ\î\Ö\ãM€¨ñ\å~\ËE¢•¶”0•¤¨‚3’¢?ıu,õ[Rac¹?˜}5‡xI•X\Û*\Ö\ß7­6ód\'%/ ıÒ¥\è4¤íš‚\íoC<%“w)X¹69Ø˜cve¨£ê––ú¬•øNm\çü@.+ğ7>‡*\î‹s57\äÁ(~2m÷§\Ôo…g)#>y\Ö\Ët-«6bà¢ŸWn\Üv=I~•Ô¥ğ•¤œ¶ AJñİ€Ojø\Ó;\çjN›MŸ\r\èn®t7¸\ì§)	Zs\ïıC ¦u\0´,ë–…fN›¹•¨F•Ÿv@t¶¦øCE@Ÿ~“:ä¤‡e·\Â\Úğ”ò66ôÏ¬t\âKi[‡µx’|¢\ë\éó§¾—¼\r[wõF©Z„j.3\"*%ˆ2g¸A}‚\0“\ê#\Ói^rVqŒjeº4\rŸÙÈ¸-«YŠuÚ­Ef Õ»^§¦l*Š\nrG¨•!Ğ\Ô%]\í,/\ãP*Ÿâ½·N\æP\î\ZA\È\Å\Æ\Ö\Òji¥.G-6\êÑ”–øô\Ïò–ù\ÔZ\í›Tİ›²™¸[³}~)\"\İb\İ\çTg¹mE‚´¥N†\Zxg> 	\ï=¤Œ\êõºL\ÄË\Î\"Ä 7 \ía\Ìõ´U¡\Äp\Ùf\é8\Î\İ\"Ğ¡ukZ\ï\\vwøV¡2¥2œó³fIl­§\Ë\èq¥‘\Úm¼¶UŸP)X\à5°\éb\İ\Ü=Ñ²\ç\ÄI ­ºô‰78ñûÌYå¿†Š•}ù\îòy\Ö%\Ë\Ô\'Mû©µ.\ì]ƒ·¯±\Úó¦3Q‘Eq\Ãq\n(?ê•«\Ô$Œ\Ñ\ÜH$OP>“\ë{¥\Óm\ÅP¸7JQ*¬¨±šDš{¬3>7-ú]¾šT‡{\ÈYAO\Æ«u+UJ•^\íl\\œ\æø\é\Z^rC«\\Uû\ß6‰7V´«3o÷6mN%¾\Ëuµ&\Õ³üFc²\êÁ¼\ëˆ÷”\á\Â9p…Áƒ\Ñ~\Îo\ÕrÛµ·\ës­ªe´FcN„\Ê\08µµ÷–‡·³KÀœ‚“k\í-¤¶zƒ\Üz\ë\ŞÛ\Ò-ø2j#É–¤vz¥„¥. p´Ò´Œö•)GÎ.]Mü6’p\Ò‡\äQ\ÚOÀ\Ç? \Ğ\äõbB¥¦$e„¸C¬^\ê\Å\È\âı<¢]FznN¯;\İ8TÛª6\Ûl\î¦ú^»lû±Şµ+¯I¨\Ó\äz\ÈjK-ª4–”’‡[[%8Z•(sœtŞ˜\î.¡÷-\İÆ­Û‘Ì™²a\nZ}Br\ËIm¬a¶R\Ê€€°5Ó»•\ëƒm\'ZF\ßrUYº{\Ñb\ÊZÒ€¡\Ê²¥x\ÊH\'\ç:¶õ\Ü}¨¾¤ôÕ¸vıúcô·ª­Ä¶ÁeE¶™xûK„© d§E`ƒ¨rõ:›eZÊ½¯¿8˜fœ%©”Ü±´C£}›{	v\ÓUH™b\"P†û¢S°\ëK\îÁ@\r\0	= r>	ó­$¿û>{\İ6\í¦+¶•N‡\';N¹g>~\î\r ÏŒğFº³\Ò~\ß\Ûf\ÒB©\Äjg\âğ›n%\Í\"©MLysf¡	C\Ï8”ûA\ï\n£\ÚT¯\Ë*×§[\Ô\áO¦²R€¢V9$ùşúè¡¨)uúZ—d$œ‹\Üo\n\éj;Ò“ª\ãQ)\ŞÇ¤d¿Ù˜>Î¾f\í\Õ\Éy5p\İ5\Ú\ß\â·Y¸ªm„/\ÓC-Gl)Ekm@=\ÊÁ%G\ÍEô{R9\â~¾eie)H\ày\Zj[À‚B¹ ñŸC\á.R”§a\ÂIlvœ\ékRleIP¾–°¥\'xú´U4m½\\	–\"¹’2N¤´G#($ÆˆW\Úq\ßş“úkA¸—¥Nz[¦[ª-9)cµ\Â<#\Ïş˜şºË Eª\Ó\Ùm£!\'\0;G9ú\ês¥n -\\\â \Ş7+¡¥©J—=\Îâ¯•qñª\×}÷Ğ¶\ã&+•B\Ò\ÓÏ¦’Yú5eU%}â˜°ë½¡!\Õ8?M]T×­ÚE\íÊ»fKo-JR•‘ÿ\0>uaD§™\é\à…h‡Pœ’\Êq9\"1÷C~^§Á2œˆ	yv 8U5\ÆÔ«ù—\çœ%Y,¤\á@ıq­•¶»2”ú*µI§A\ÊR9\ÛX\Ïo5‘N­¾±i‰‘R¢cz@£=\Üò14¤¤\\“,#np9:&Q\ŞLª\×\å»§oK¦¦§.RT2Ÿ\ârub\\Xo¤Añ:±+;§á¥¹¹\r¦T§p\ÒC`%	?_\ÛQ\Ù\ìG\ÂfB›JR±\Ûè¯’o¦Š\ä\çfA/\"§d\å\Ë\ár\ê\ÄGªA\ç\ŞT¦\Z\à\ã!	<~úÍŸd\\tÆš“6\'jd:…\çŒjwhZñ$OüA\ÛiÇ¤¤\0¶¼\ß%IN?\ë­\İÏ·[•vS¿«\'\î¨iA”2¦qF8\á#\ÔIš\ÃyA \'ó\í\Ø\ÓÁ\É~;®V\å\ç\0g]V%j\ê·vUQ©ó©\Òc¾c\å*zVa ¤¤¬RI\Ïq\ì\×>û\î+Q(\ÔyLˆ/-?x‚ò;›R\Ò8B°x\îùóÆ»½[GB4\É~K2TóAiI\ç\î«O-œ¨($ş¸\\®\ê_lfm\Ş\éN¶\ëI=\è„ˆ\ÊB–Ú¹\ïJO”\ã8ıF’šûO7+QT„´\îlÿ\0s\ï\r}]vbğo.\Ëk7$uˆõ©¹%™D¨ZN\\5X´6\Öñn;\ÇC\Ém¤œ”(­*Â³\ã:‘R/]˜©I¦±sÜ±œ¬\ÛQ‡\Ü\ëRjKpHJ’V€¸\ç\ØH\îÀ“[pzAöpt1\Ó5+bl\Ï\Ş-´pÜ·% ÎŒ\İ\Æ\Ï{4Ø«q~ˆKG\Ú„:¢ N1YD}‰ıõ_Ezee›\âôûS^´R–\Ûp\ãÕŒp\Ò\Æ~R\äøÒ¦nrMs%\nQIˆ\Û\Ò\Z²´ù–\é\ÈXM\È7\Ï\íº\ÚKÁÆ«ˆ¬·bS¨e—ªq#).z\É=\á~\Ü)H\ï\ØrAÂ £ccm\Zu\ßrÂ½·\nøv»RD8ñÚ“,j\Z=\èI#!dœù\çC6ııc}–U\ßû\ĞhB¾v\é/¡ª…VŒ\ÑCA¼œ&S\n÷\Ç_n{\\IZ\n±\î9ÆŒ¾™µ7¶\ÌA\ê\ÕNfƒ\"*Ÿ~ \ë‰eŠyl\0\ëRT¬œA\à\äòGt;¨œ¨J4*\å\Ú^1“~@˜š€\Ô\ã©va -;XX~‘r\Ón\'©µ\ç\Å9ø÷‹uzZ\Â\Z1‚”•4µ;Ô•$\n‰O[¼±oJ\\S\ĞU1(õŠ\ïğšX\Æ<`ë™½c\î\í\Õ\Ö\r6‘\Ñ~\å\ÑY¶©SıY\åT]‡2¥%.‡1Ü–(N=\å]\ç\ã\r¯ö¢õuÒ•F^\ÏŞ³Ux*”\èa\Ø\ÏF¤\ÛRrÜ¦‡?¡$§ô\ÕSfdm¨Á\ÜzÆ·]I˜*\Ìv\êE\È\Ã\é´p·q„‘œó\Éñ¡/sh\Ô;\Öj\ì¹./¸ªB¡^f{Í¤¶‡#\'ü¢!%+VPùr»rN¹ñu}¸\İp\\I•d\Ò-»f‘sXbDšS\Ï=¤{”·Á\È\ãÜ“Á#õ\Ö¡¿»µ¾Y\Ü=Õ½¤V@qºU23I#aCò0€TsÊ••Æ¾Æ’o½}À:X^3ªŠ•.y‹Gmú\0\ê.×‰F¤_±gAjs\Å0+=U[)P…8ô„²÷µ)}JO¹+\í\îmC\È$œô*”jŒ\ê°$6\ìy-¥L¼Û‰ZV\nBII!C¡Á5\Ë\í\è\Ëqo­†\Ù\Ë\Çi\à‰»m¹;vh;\Ûnş*Q(¦C¾\â°ÃŠ\ímm+\ŞP\ÙOiBjÂˆÑĞÁ\îWI\Û(6+q7q7¤z=QbÛ­.:š|@Z¯E\ÔeHIC¥\ŞÔ¡Dv¨~_Ê“\Í=%5$\nJBüV¶\Çlz\î`5\ÆR\áµ­†ıDÊ’\êN¾?MbÉ’ğWqs\ç:ùC.C[Ê’””‚@QÖ¢Uq }\ËùÆŠ¢/	Œ÷\êjP\í$~tµªa\Ç&8TŸÉ\Ò\ÖG\ĞˆClª¥	©”8\ÚOnxPMcAÜ§\á¶\ãj¦¬¸œ§\İ\í\Î>¹\Öu—ĞŸ\Ï\Ï\ï­U^JT’\ê2Ts\İÆ­Zi.\à\í\Ê%)$Dv7#qª2a· ESj¦À9?¾ªŠ¦\×W\ë\Ô\ÅV`T\Ôñt\æ[a²\\_œs«Zé¦Š«¨q\Ğ;yÏ=l8ºJ€a\á\é÷r;\08ıôe+4%eÁhXˆ~U3®”<M u¹¶\"\çM=Êº\ÙR’\È\ÈBòNyÆ¡¢Ş©´´‰\Ñ\Ã`aIÁ\È:9©Pß¦-/S•,ahV\0ú\êŠ\İú]>l÷Š@ˆ•º]¨Á\í<gû\çWt½O4·\nquM4\Ã ww\")†\ízsÍªU~/±¹\r(ñûŸ¯\èuµ¤mí”¥¶ôkú$W»Àa†Á\ïWè¢¯Ÿ\Ğjk+dn84¦}*·ko6¡Ü‘\áCı\'õ\ÕM|[\Î\Ù\Õù6\ÚûdH\Ğ!]\ÙOq\á$$şš —ûEE)r\Ö\Ş(Ş•]5	ZÛ½ö‹¶³u\Û6e‚·©÷Twf©…GX`\0ò‰ı@8ÀúşÚˆZ\ÓrU_E”Ì§TµPñË«\ïP\Çv\àóŸ\ÛD\×M\ßg¦\ßF¶)v\å¹&«Wq>¤–Vcv)?øe¿§#\'9\È\Õ\ÕmtÃ´{|Ë”\Ë.\ĞfŸ\ÇC¥¶\Ü*(W\Ïi<œ\ègQ\Ò\é\ám‘Æ³|·‚\Ùj=Rp6\á<#a\0\ÙÑ¦\à\ÂCwUR**ºzs¹\ÉkQ	\ïöü\'9\Ç\Æ5nn_\Ø\ÓStk:£»•«,ût¿.ˆò#ş*Â“•EVRKI\n\ÉşHù\Ñ}I\ÛBMÖ‹¾¹Nj[¬:•\Å2ù1Hùo23œ\ê|ºœn\â\ëJJ}\É\nù\Éÿ\0\ÓCU}G9X–m•ŸyEõ2%Nyn¶;\Ç(ú Ú™\"õş\0£\Ò]§ZAhZMT„Àm¶\ÙK!@•\×hœ‘\ÏÎ¥û7Y¸*“\n­˜\"D`°Ù’•ŸE¢¿…g\Æs\àrt`õ½³ôş\Øú•)6\ãu:R\Ñ2š\ÓO–J V¡\É%\ã³Â³õ\Z\İ\ê{l6²‹›pK‹(\"3P°ÊšZ;Js\ìVAöşo\ÓÎ•3Ô”76]^a­-©rA\èA+\Û\Ë\à€\Ü}—´7ZÀ—m\î´DÕ©S©åŠ…0\ÈòPÁA#\İ\Û\Îx\Æ1Ÿ~uú´\é»uzz½n­°³\îJBÉ¦\İ2÷6åº¦Z\íYJóI 8 €„‡pIÀÏw/f~Ğ®—·:ö•¶\Ó7ºªœ<#¶Q\rDµ$†\Ş\î\í*Àœ`\ä|l\ê?cI{\æ\Ü\ÍÅ£]øÉ­¸\ë\Õ Ô˜~:qJR’Œ¥Gœùùó©²\Ò\ëZ@”‡ó\ê)Ûœ2\î¯\â\ïxü\åCº¥PzmMØ‹oÜ™-¿Ø¡Œs\Üı?\ãN&®š\Ë\ÎUdK,¼]µ¹’VO*QúŸ©\×\è«gşÆ¯³û¡­œ¼\ïmÑ³)Û€\ÔHn\×.k’ö¡E”\âc\Ämnc1\Ûé°”·İ„§•¨{•’\äd)]õ“º·\í\Û=(B°\éLË„ªu%Ä§\áúr=`À1[e¤FYC\ÊKOz—“\È\Ö÷©F]ö\Û¾ñ\ã5d¿2\Z¶û@e6­ø\Õ\Æ\Ótö}wJT\Ìt2ò¥(cÀò4otw\ĞQ{“M¤Q\è\Öc”ºxBU&­p­L2\á“\Ú\Ù\ëı€:»6:Ø´6®ª\ÓV\å¡K¦%m„´`ACj\0ÿ\0¹8?QÎmš¸©\ÙD™ğ„´Tó€“ı~uE50‰•à­‰5K¥N_0Rô£·ô}‚\é\Ê\ÑÙŠ\r]\é‘\èt\ÅL×’R©(©O+\ÂTµ+\éX‰¬©\\¸\æsªúÚ©Lnİ€mM“(%c\Ö\È\×@Gy\É:1”-\"ã• l‰Pù¼L•]\Ãe!Y\'\Ï>t\Ôj”u¸úRSœ\ã\ãQ¸µx\îQşúp:\áËXù\È\êli‹‹:–\ã=±›{‡\ZZŠ\Ø\åô°\ã¥\å,€4µ‘‘^:\â›s¦{\ÛYW<iij\é¿\n…¢˜-D\Ä^\â’c4¢”y\Óuú¥)ZFFF––®Ñ†	„|BbUN€\Ê.3\ì=¼ãœi.\Ê,JÒ•	\ä%%Jƒ°O\æ<s¥¥ª\æœq.\à\ÄÇ’•\'\"Ä¯Á\é\ÎS\âDD©C§\Z¬\Z=ş\ê*—ğ¥	\ä\Õ{$D.”¥ÀHq8\Ò\Ò\ÑM”KM,oo\âkùv]n!õ£\ØT\ØF˜•Eg\Ñh\'µ¨\è9K`|şúÙº\Ûn·\ê\0O\ÓKKK µúŸ¬8À\ä\0\\ºr¬úª	Rc›S©GiÀ?_:ZZò>ö7z=g\Õ.†©¾²©´\×d–½^\ßS±%A9Á\í\äyÁó®\0õ§\Ö=c¯\Û\ŞmZn\ÙP,qmT¯V\Ûgü\İEÅ€\ì™\nKq	\î\íP	 ­G\É\Ò\Ò\Õ¢\0\É\æ.h\n\"|4Ç¢À§¡\Ú#¥Q[t‚T³\å\ÅÊ—ñ\ÜO\ï£\ìSŞ››bú\æ¤\íÅº\\‘JÜˆnQª¬?-\Ïò\Ée\ÓÌ‚JP° A! ¨+ğ4´´7IuÀúP	‚*«M–²3iêª„\Å\ç\Óõÿ\0eU\ŞW\İ*uN<€\Ø\Ç+ƒ¸~ºü\ìı˜ñ)5¦oû2¥IiP¤&„ ”¨>\Ğ\É@	\È“ó¥¥¦\Ğš}`²S>-ùoïˆ¿*w\ËJ³:\Ù_ùµSB{&¬ö8\è»Ÿœh\Üû:ö\Ş\Ş\Ü-½F\î\İŞ´\Ù,\Éq`<\æc°R\ï\íğµ{¸\'\Ç\ÓKKB´\æ›r|qÁmBjat­*\É\"6\å\ÉpY\Ş\ì$cÀúi\æÁR\ÒIù\Ò\Ò\ÑgÇ”	ó¼l[*@>\ÄÅ¶±\ì--{ûJLCJG=\é\î9ø\Ò\Ò\Ò\ÖFGÿ\Ù','Keith Richard','Limbo',21,NULL,'09386508693','Cuenca','Hello'),('U0002',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0\È\0\Ä\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0G\0	\0\0\0\0!1AQa\"q	#2B‘¡±\nRb¢Á$\Ñ3r\Ò\áñ&Tcs‚ƒ²\Âğÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\03\0\0\0\0\0\0\0!1AQ\"a2q‘¡±\ÑÁğñ#3R¢\áÿ\Ú\0\0\0?\0öS\ÚB\0\èœ5™¨\'s\Æz`„Fºbe|\Çx\Â¶`\0;QHÜ¾°\İ\Ùô\çxb\ë\ç$\æqòN	‚¤…°ry\Û?Œ&\ì\Èu%µt=w†%\í±Ÿ\Æ2—UŒ‰IO½¬\ì\0o8ac~Xj•gÈ…†N\0=\â)¨§	qJû\İ ÁJ^\à÷‚²Ú—¶ı!\Â^7\Ú$\Â N\é7W\Ø\Â*`\ã¬?q–˜h¾ò\Â‘•-jÀ3¦qÂ¦¸©MI\â\"Ï¤L\'\Ê\ÌWYSÛœ³A*\ê<¡J.s\ï\áMœ\à\"Ñ‘‘…+\é8\à¹:iôş+->¾qMóZ@‹Nu÷D5ˆ­:U«V\íÂ¦G\×\"‘Viõ y”¤\ät0d$\çR&‡\ÕJpp~Ÿ&;~Pº†\Äc\ã	´2%\" rL`\äQiW_X*\ÒzD\ç¹\Ş FT\Ü| ¸\îLD\Ò!¬ö\Îğ	\à¥DmùÀ\É\"\"8FO/q\n£\Ã\'9ùC|w0£eYÁˆ‘=m™U\'%„|\Ğ AY*(\ØşP\"J[\Ş\ÂN<¶{\Ïc\'\Ò¾²·”k¦?¤Ej#ÏÀ\Â+pc¬a\Å\á,H‰t\å*	W\\Â­ ‚sŒ°\á”\ç1ˆK´\Û˜w.\ÉWSK4V¨¤>‘N9lşøš\ÔJ’¥\æ®*‘T¥EqÀ\Ü\×.KŠÏ„\Ø÷\Ö|°:¨B¹Á¢J€T÷ˆş+t„{\r\Ûÿ\0\\¯\ÉZL²P}–O˜.nuÀ\Ã ó8¯€À\êH\å¯¿´_­÷\\ü\Õ†{F“f\Ò”K\Ök-¦z¢´\ç\á9ğZ>˜^<\ãÏ x“Ô®!\ï\ÙıS\Ö[¶n½V›p‚ü\ËÄ¡	\ÎÍ¶‚;€<¢¡¨\Õg&%\Õó„\'ò€\Ö>§¢»”\Ú\îdöó\ê¢µ—ş&5¦i÷u_n*\É(\äZ¦ªk\ròù%¤” ‚bŸròT\Ó\æ`UV·Õº\Ö6?ŒB\Ö\ä\Ê\Ò\ã! w\Ä+$\î\åÕ”(gr”˜½¶\ìnSŠ€a \è¥*¯\Ï86Cnry\'\ç­MW½,:\Ò.\"ğŸ¡O4r‰ª\\Ê™Xù¤½:DMÉ¢Z|‚v÷¼3qO©\Ü~pC\0J÷kÃ²ğ³ôõq©¡“T\ÍF¸¥õ\Üdò½\'_h&p7ü“Hy¹\Â\Çhõ{‚Ÿ¥…®8$Ù¥\Ø7H¤]*eK~Ñ­:”M_´[?e\àş\îø\ê|\Ó\ÊO½.p‡pœ÷‰Şß³öµ\ëN¹¨5‰Š}RBeS\'¤Ÿ-=,øû¥c§*°H\î\à–ˆXÂ€iÿ\0LÇ§Oüù}\Õ:ğ¤X\éú\Å3À¿ö\ïü>\Û÷Få¤› I%›–—)<Ú–\Ä\Ú	B\Ô[\n\æJVRT\\\ëNñJ€‚“À\åÀ\Ì\ãÂE$\ç¬DQr	Œô \0$ñ® \ÈP\'¼m)\Ş\"Cºv\Ê\È@\0@Œ6’LYj	gÏºAs\ê9${2¬¤ŸH\×<\æs¬H­g9õ‚¤b\0Œ-`\äf\nU\ë\Ö\"‰d\å®\ß\á«X=¡Ô®\n\ÆOHˆ)jµf›mP¦\î\Z»¥¹I	G&fœ	$¥¶\ĞT£¹Àhù\ÎúR¸\å­q\ËÄ½CQ\ïIZô†v\Ú4Õ«v$Ò²KŠ\ÆÁ×—•«\È\07	\í\'\Ò\ã«W~p~VlI·jU\Zx¦‡$\ĞI–—}A¨²”³\âe[c\">mnš\ÃS¿*Û™nMdœtR»œù\r‡ıb¶‚ú±\Ù_MŒ5À):\Í]*w\à#J¹³Ÿ‡ÿ\0·†:•¹\É\âsp}b3R¸İœ˜S…£¢R~\î!\İU*\Ó\"ZE…$,{¤\ç$\ÆlŒªA5´©\"SÃ•†2”ı£\Øœ®te´;\á«8$íˆº¸f\àˆmğ\æ\éÁ#&\é›B°¡\è\0Ê¿H\ë»+\è/ª\Ôešš»\ïw\Ö\áPñD´‚zsúÆ²·µ¢bg\à·ö\Ş¿¬\Ğ\çC\'şF>\Ûı—›nSj¨QöE—6Ê”6’‘6´ò\ÍKr\í²‚qùxõ\ê\Êú\rô\ÎVh*¯W¨8À\Ç\Õ)\àJ½I\Ç\é]»ô3p·Fyª„İ¡\í¯6y¼)¥’\Ù\Ç@@\ëg\Ó?e²\0y«·\ä	şğ\ÌS§9ÒzcxVV~jBa/!8Z\Ûc\Ücú.´¹o9)G\Óy:d\àÊ™Ÿ§§\ÂR6b\n|Á\æ\Ï\\)Søxš•¦Î¿(\ä\ã\éS¾$ª”GDUt\'ûö\ÜjzÂ‘i¬{\ß:\Ş\Õ\Õ\é\ÕÓ’\"\äªÃ‡n\'õG‡MF–\Ôı4¸“¨²ğR¶+RNA\È\ÈøI¼(k¬\ïún\ë2$›§¢³Nm\ç$pV¶\\)À¨„‚3¸!8\Ä|´R”À\ç\è<£\İ\Ù\ÂÕº\Å\ë\ÃÛ§µË•\Ù\Õ[\"BQ÷Ô³),ó$„¤²‚´/=s\Ò7\\™`RôA	q$‡Uò\Æ +sˆ:¶‚(\ï‘òŠ’,\çc\0ØŒ\ç} Ÿù\ÄDJ.6\Î#)›¡ŒH\Ëg&\"„Bt\Ñ÷O\ã0\Ù “ùÀˆ†_V\Ø>Q®u]D<y^\éß·œk\ŞV	\É\íX’Y\0o\'\'¤d÷0P¢\"(2 Œm\ÖJ\à+>°Å³\î\ç¾a\ã}¼\â\'*ï«Zbó\à¯Um©)%L=7`\Ô\Ã\'ZÄºÔœg\Õ#ğ”\Ê\İI\ÙYYâ´ŸÇ‚BH\ï’wü}…³*\Ì\ë\Ç6\Ò\\eÔ”8…Œ…$ŒA\ë´|–ñqc\É[H\ß\ÍMm\É\É\İ\Õ6%ËŒ!¹—R»l\0\Ä\ZN®°®\Ò_D\ĞşUGoÊ½Rš_6\á	%yô\ï\×ôfğ8­\\”\Ô\ëò›\ÍK/òRi\êNL\Ñw; vóøG+è¶•Tn\Êõ*\×2‹B\ëUv¤\Ê\ÏP\n²³@“\ëğ¥4-:´\ä$\äd\Ğ\Ûr’­\ËÊ€’”¤\Ï¦\ã|@¶(\Ó;\ïğ]g†ø[Z\ÓuTm\îƒ\ÜõùÊ»´OG­\Û&ˆÄ¬­5¤6R\0H\0c\áG²2„ò\àô\"}! Pw\ÇcA<\ã òp…¿~²\é)\ãm!\ÂF\Şpb\0P)\é\Ä7i\Ç¬œõ\ßx\ÖV¨¿¼Ÿ.Š”ód\í\È\Äú\ÚO\à’\"·’\ìJ\ëş¦Z:_bN\İ7eY™9Yv§ãƒ˜€7	©8\Ò\â¹\ÅN®LN[\Ô\×İ–ö‚Ü£M ©K\ì”\Ô\íó>C¤{¬Ùº´ëŠº§\çfe–’\Ô\İA\×R\ê\0R~$œv\ÄCl¯£\ã‡}&ª¢·CµX\\\è\È/º\Ø8Oğ¤ò>ç¹ƒku\ìõ¹®d‘¶p¯¸´£ui\Ê\æÀ>ô\Ç`¼‚Ô¾õG4¾Ÿ¨›)—~¦µ\äÁ%M c©éœ\ŞQ\é§ì¼©£ejÿ\0\Ö(º*4Œ‚6	ğæ±¿Ç´9ú@´JOQ´n¡L“–@zEH\í¶\ÊO¦R>[D‹öi\ì%[z!ªUù… =3xJ\É)°w@bX«‰{ò£…\ß>\î“\ÅC\æì¸¯ğ\ÚE !„G|\Úô¡g®\ĞU}¨Ê¶\ÎğE\äF\År\Ä#\ÌGa\'?Œœuˆ \İaA\0¾p™óóŒ¤\ã|À;\'\İ;k<ƒ\İÏ¬#y\å\'\ä`@ª\ÂFaD$¨Æ½Õ’O–!ó\ëO†#^\éHQÁ\Ø+:$V£’Gh9\Ş0\é\ß?Œ¡\ç˜”\à%šQ w\ïe\Õ\ß\×x`\Ñ!@r\ìOh},p Ÿ\ÒBL­\Å9{$„ô;GÏ¯&I\ÊñÕ¨²Šq?[|\ÔV\ÚV\Ö\Åx\é\ÂG£»| ‰#\ÊR€3sñ\á\Ã%\áQ\ãN­}Smg&i\Õiy9\ÔT&L¼²],¦]Lø«RR\\%œòı¢1˜\×q#U´fş‹y\áú”\á¢#¯¤.<“\à8\é¬Å…©¶|º\İ]®\Ë\ÕVºœ+!Jø³¾¯})Z%\ÂıU½9³UúÄªG\ï	jj\Ò”8\Ï*Ö­¹ÿ\0”g\ß°q±b\é\î±1\Â,µ}$\İLª¬¾_c•.2\\l$\'™Ç—Œa!;’b \Ó\ï£Î…^­šbĞ£\ÎOOL•95yN¸9\İR²V¦YuY\É9!D?(\çYn[PT»$\Æ\Óû’\í\ßzË‹r\ÛR“\æ0{}6õSõ~\Ğ}‰Hğ\å\í+\Õe!°f	©¡¶\ĞO`BTO\Ç\0f:W…o¥\ãB8€—š“¹´ú¹gOI²—\\n¨·N2…¥#›gm²H9_ª\è?	u™kJ£~\èrbQ·ƒ\r\Ú&o\ÅI\ÉO# \ï¹¤YZspj~«P—vi\r3I¯jXif”\Ì\Õ9å ’O9Z7Â†v\ìc& ¤iƒI;™ıB\×Ğ©E\Şw\×\Õ\é\ä\0Ø•\èe.µo\Õe9#:Û:B¬‚”k/]B²lZkµkªÔ»\r6§¥nBR2H\ãŠ4s½.\Ò\Ë\Ò_Fµ:B\ãµ*sL\Í>‰J\ÄÔº\åY,%*q ò–€	J‚‘\Ô(vŸúş·8›»\ê\Öö„Y\Õ\ÂrJyro.«<\ÛR>\ëhZ\Ü\æl¨‡ˆ”\ç˜`\0¦Ş¹`!Ÿ¤\Ş\Ój*–\än ƒ÷\Ùh5\ã\é\Ö\ÒK&«1n\éf†\ÜW7³‰‰é¥¦I„yAQN{>qP\Íı:È«¤¸2®\ä…Ö¹\ĞGq€AòÛ¬oµwX\áª÷U•«\×ş—\Øó\ï•/÷t®LTJ“y¼E(…\îw8\êbki\éûú¥¦ú\ÇC\Ô\Û\n£D©4¹–f¦¬KÄ‚R¥¤…\ì A ´X\Ûv9jdú\ç§\ÉSR\îÖF\Å\Ì\0òÕ´yºô\î¥nº\Ù<T\èü\Í\ßd™y–Jg©³Xñe–SS–’7J\Æ\Ê k}ö{vö€_o aSwó‹XòÄ³@Ÿ<÷\ÌQúI¢µ0‘¯\ê%V†šD£n·3I{\r²\Û\ËPB\×.T…ƒº9\Ê„Œ\Ç@ı·D•\Ñ\Ã=\ç3.\Â\ÚvWSj2s©\\\É\nm¦\0)=Á¸\Ú2x]Ó®\çt…‹\â+š/±\äÌ¸\Óüº\ìG¤\ä\Ö\'|bšP* \r‰\0“¾1¾¸…c\×9¶;~q…¨\'´œcˆ¥Œ¬“\nÀ‚óŒó ¦J¡\Ì$ A\â@\ë\"B$¢L)A¬wø\Ã\Îr}!\äÊˆl8\Û\Ò\"tB£\Óñ‚•\Øù\Æ\n÷\æ\è sùˆJvœ\'\0Çœ?“\İAQ­A\Ã\é5öùAJw\\ó\ÇF³\ê­P§i\í“R2H™•3S¡JIRyˆÁ(!X\è\É;ô0\ãŸHÎ¢\Ò(we\å\\©\ÏM\È\Î\É%Iz®û¬†Š\Ê´¶\âŠ©\Îd«\É\ÉÁ\Ş;£\í5MjÛ‘\Ôi62\í1^\Í:q’e\Ü;’¿ùG$k=*±}\Ó\'—¨¸Ü­\"MÕ‰T«\Üu@¥@‘ÜLˆå¸§9•\Üdú|¦xvnN$j\ÔH3ş!P\ÜJğ{m\ÒoW‰f®J„\ÍfY¥\Ój3ó¯x‹2o(’|ù\ãd¸Á\Ş\'Sü%W/™\'(\×Uvil¬r¸–¦–‚\à\ïºH1lÖ¬\Ê®i\ä\í‰q-\Ñ%Y¦–]y“‡*H)q²Ğ “\æ‘\rmª\×zr\ërÆŒ‹É†’‹‚Ğª0Û“@\r–\ä¤Ò›ğ\Öz‡œ“ƒ\Ú5\ï\×p\Æ\êv[ø[kz¾\Ì\çh`‡0\ã\Ğo#\Ğ\í•T_¿FN˜ê—H³.iŠÌ”½§‘˜¦¶Ï´\Öy”Ú#H\æ\0\à\äú\à\â:N´â—£v5F’ö*]©EúD³@#•„…\â9œ$’¢TNTI„\åøŠ}†¿\ÅğÛª\r}n0½ı\nfˆn¯ñ¬\×U5†˜ğ£tµ9T—–»¦ede\Û*N\nÔ†\İq\Õ% ’@H\éŒ\Åü\ÚÆŸ,»¥cT¡F³\äĞ‚wòG\Ş\ße]ı\Òò\\g\ê]Ó¯:½h\ÉOJÓ¦—¡\Ë\Î\É!i`>¾d%9S.\Û$¤¼|ñŸRdô[£D¨”d)—U5ª\Å1R\Í‚“È¤;°À\ÙÄ¬\rË©1lpMÃ¼‡\ÚC%§òmÉ U1Tœi®D¿4½\ÜXO\İH\Ù)’”\Ğ×‹ıº/Ùš.¥ieIª}\ïhL.f<óel¾\ÚÀK\Òo¤TÓ‰ B’’7a¨9…\Ã\rˆù”9`\Ò\ä\Ì\Æsß¯¦d\İğ¡\\Mpm§|L\Ó\ét½a£NU™£¼\ã”É–\ç9&YñB\Ğ]™h<‰÷TH\Î\â6³\ZE\á\é\Õ;JdœyŠ\r*]©yr°\Óc	BR9@\Æ\ç¹1š»q/Om‹Óƒš\Ó\Îòy»^å‘™—w\Õa\Æ\\Oûª\âgXu~²\Ñj‡Áõ\é\ÎrªµZ\\ª\êO´¬\ã\à\Âõ*¹ºuc\âP \Z&\Æ}Î¿\é\ÑTÚ•¡6%AÔšÊ§&İ·)\Ó3ò\Í.uA\âYq	RÑº\\#œòó\rŠ²0pbsÁ­…spİ¢“\Ôı3»jR\Ó5š\ì\ÍF©,©Ò–\Õ6¥‘·*r\0\èq¼k\î\í7Ö½Om¹MW”¢\Ûv\àu·g\èT©õ\Î\ÎTB–^‘\r´\ÑP\é@QP\æ\0˜™ie÷-Éª|\ëJC\â®ô\Ê(M¸ú”G)Œ+k¼M®ú+\İB•y©R˜\'€½uØº{UuK\é·5q?\ãB›˜V1Ì¤œmu:DsE-·-=/¥RŸIKªc\Çq?\Â\\%Xü‰#›(\ê\éj\å7Vğ¼®÷•\í•9b¨\Ç\ÂQUœvü`¤\ä\ì \ë+Gh¹«eg›—¼ö\Ì¬yw€s“‚€« F³Ë°Y•lH=¼¡ƒª\'¼<™?VF3^\Ü\ã¦\"\'Iso\Ö1\âc\Ê0¾¹ŒŸ\'q3vNšX\å\ëğ\Ì:•PJòOS\Ö#‡,òHˆ\Ön\ÛrZğµ*6\Ä\âAn~Il«=‰I\0ü\Ê8B¯eM´º&bjfJi/)©”#\nK¤•%IWL\àºvÿ\0”ZJyIøEYª|(\"ÿ\0½»¨7St\ÕN©\Ö“ñV\n\ÒB†\ä{\ï\Ş5œF\Ñ÷\r‚J\è¼?\Å)\Ø=\ìªa®\Ï\Ì~ÿ\0…\Ç:MS˜—¢1#Qÿ\0k\'\Í,\îF0¦\Ï!ı\"ë´ª©´-G#n±¤\â#‡•\è-\Å+9#Yv~N¶•<fa-òL#h\0gb9T>&5¶]h\à2µ\î\Ñ\ÍÕ¤ûw–;p»J®\é\n´Ì´«T\Ô$“.@$\'m„Cko\Î\É\\I¯ŠÓ­´ÁHK g=c´	\êŒ\ãRk™d\ç‘9;DB{Y-	9æ¤¦\î¥?4T©\Zzó›[ºÀfD•sZé†‰Rı6\Ô\íRnuéª¾š	6Y3)8qş|„€~±½¨\ßZš\â=¶\Çbfšúy\\[s\âYWcÉRŸıYˆ\ÅV\è­3‰\êuNH(sM\Óo¨\Øû\ÉBõ=i°h\Ì2õ~¯\ì(|„µ38Úšij\' R†:ú\ÅğFR:•Mz´~jeMS²’ \Ì5á•¨¨\'?g;ÁŸª\r\\\Ø#”`ˆŒKŞ²5‰ŠeI©™gS”-§’|ˆ\"R«%V\á;”±P–un£šSm2\à\ï°\ï\é4#Jy]\Ôj\n§Ü›ñCJt²”\0\Ú¼ğ\Æ}c[nZ\Ó:¯¨\Ôû\ZZp°\'f9\\˜\róøhJJ”¬dg\0³K¤š#¥\ÏMU&*©™O\'Œ–<46Œ\ç•)$\È9\ì#7‡Z>½AP*\Öñ^+NÂƒ©\ç#ã‰ŸE4PJ\ä\0\0º@!º•±\É\í\n¸¼Œ\Ò:¬uÜ‘¼u+\Î`•‡\Ça×¤c œ\Æ\\ÁI\İü\à€T\n\ÉW½\Ê dt‚”;\ÆrH\Ì:c²Yµ€° ‰\Æ70 HT“”G”|>c\İ\Îø;ˆy3•#›\ÍÀ;*\èR\í¿cˆ)8\Ú@\'\ìÁT3¾;\ÄPJ ’3\ĞÃ†Tz\ŞF\ãg\ËDE=—Qß¼l¤P#=#[.\"\Ê\Ì¦\"B!B¸¯±©÷®ˆUš\åKô†BQ\î\\”©°J‡ÁI\æ?H\âª%AR“¨<ıO\Â;\çW\Ö\Ğ\Ò;˜<°”ş\á›«ÿ\0d¨ó2©wL\ÛU	ğ³‹—À\Ù\'øU\å\ècš\ãz[Y§¸]¿…œ÷Û½ü«ú“T•œ”\r¬x…«/=(zÃº\Ñ}it –q>\Õ\âK\Ê/\Ã™RTúÀû%K)I$‚r2—{34\ÂT—Á=÷‰\İ:~N¢\È+ Œc¨eU\Õ1Æ“¦$v;$l\î!µ¡T#,½A[Iu´6\ì¤\İ!•`%%;+—9#©\í˜\Ój}\Ñ~j…-4\ë²\âz²\ÓO°ì¼—	o\ÅeÀ\ëjDò”­ \äuÀ\ÌL$­^u<\îÈ¥K\Îü§\àĞ­ú:ô¬š[<»\çx\Í5¥‰ì¬©©”šÀ~•i¡\\:X:N‰ë’mµ%T©¸§gœe\å¨-EEg9$’w$×k\Ù\ØVü»\ï\Ò6Z\Â%‚¹9wôôˆ(÷M²dg9ªT™”/%<Å¿a<ÀwÀ9Ç¤`j¼4wR¥R\âjT>ªü\àwOœœŸ©j¤\ë_T\Ò5D}¥œV>•?5GCLº¢p“°„­[B…`Z’v…·-\à\ÉÓ˜KL¤\îUªQ\î¢rIó0w@\Îz\Çgm@[\Ğ–ñ³}v\ê½\ß‰º\Ô@;õ0‚\Éõ³Š\åJ‰Nz\ì!#\ï\0pFÙ‹\Ö )2­÷‚\îU\ï+nûA”r1óPFN~PÒ™\ï˜\Æıœg#\Î&\È‘\ÛY	Àı F §h%W¤\">p€m±´6X\É\Æzˆp\âJ’;B\\‡sˆu`\Ù$Pù\í\Ö0´d\à*J	\è?L¹$XŠF\Û\'ra\ÃH\Î\àôƒ5.psÓ¼.\Ú\0\Ø\'óˆ†¤fZVr	ˆö³ë˜ğ\éb»¨Z©q¢Ÿ Ó¦’3³«\ì´\Ò:­gn\Ø$\à\Ö\ê^¾\Ù:m.\ãN\Î&z}y)w¹şúº zn}#—u?L˜\ã\ïXl­FÕ™µ·gYÔ©‰\ék6Qd1T›}\Ğ\ZveD\åHKMƒ\È\0\Ï>	\ÆAf\0\çge¼zwS‹¿)}j\áŠ\èÔŠE õ\ÜT\ã4\Úd\ä\Ü\È[³ªuô0TR‘„¤)Ä‰\ß#;G3T)\ÌU¤T\Ì\Ò\Ğ\àÂ’F\Æ:·ˆ™\Ö>\Z®-³e\å\ägf)i]¼\Ë´\ÜÜ»¨˜–@	ÀJK!>@\å¨º\Í\r‰‰\Ù7|§2ï§•l¸œ…6¡\ÙIP)#±9>>\í-1ˆ\Â\ï|-\Êm£\ÃNC³ô\Çò õ\Z•Ã¥5\çi\î¹1O[‚	Sdœ\0–|ÿ\0±t\ë_(³¯!/Mò@q·6)>£¨†õŠrÜ §ºH\ëê•[7(K­²\Z}*<®4JT“\èGH\çÛ­¦\ê\Üh¹€¸A\îº\Z\İ\Ôja7<•‡\0\×ü µ\ËşEi‰™´6\Ó\ß\ê#›š\Ñ\ÍC§i:—?,\Ğ;6 ú\Æ\â—`\Õºt\İ3•\Ñk\äF~2yÎˆ!cº“C§\ê¤\×VªOW&§\Ûm­\å‚\ï\ÜOn±³\áÊ;+¯V¤ÚšT\Ü\Âk->\âB·Pl<¾\ÌjhôFeS2Œ%)d¤u‹£ƒ=;z©}\Ïß\Ë(KÑ¥\Ãl©—F9AóK|\Äùs§\Î2,):µ\ã\0\ï?L¬.%]–ö{õÀ]I¤Z÷¦:õCz³§W\nfU*¿£\"\ây“w%%$ô!IP\È\È\ÊNûD’i¤\à˜\ãË¶¹_\á\Îş¼\ï«—+#8\ì\Êf\'» ‰ö9R\áSˆ#şò÷Js\ÌZ\Ï«zQ¯ô¦\ÎSœ\éIöª{À$¼‹\éğ\Ìwd/.u\'•Ô´û\ä\Â¤¤`wˆı¯­zqy1M¸\Ä\Ê\Î¬\ïÔ¬Ÿ!Í²¾DÄ‘I\æ9Ï®|\áFR”Ü¤ã¯¤c”±?UI;\í\Ö´¨dóJ$\å\ànNı\ãmœÁ”’\0\êc`ò\ã8Â’‰8Ymsu `ò@²¤ó!\'=¼ ¬ö\"¡\0x~¿õ2\ÍÓ‰TL\\•	NgÁ—m<\Î9!\Øz¢\Ä…·m”¤\äŒÆ†ñ\Õm>°\ÛR®k¢Y‡œ‰d+\ÓğBrb„\Õ>(.\ë±\Ç)–›\ÎR¤N\ßP¯®t2\Ç\Ùø\'ñŠ¥\ïi™}S)Ek9Z”IR™&¬%6—ğ¯»³yF]2\ÖU¢\\\0a357¹Aõ\äFÿ\0œW\×:§x²©9Šòe%\ÖpX¦·\ázd¨ş1fœ‡}\âr0aCD”¢S‚2‹¹M@5¡7¸Q7V TZe.*Q\Ğ\Ñe˜´øh”˜gÙ¥\Ö<%\Ò\ÙK#mÀ§\Ê 6\í9º¢f‡!ğ€\r¥=±¾ñ¼\á\İõ\Ò§2A–}\ÉGO°²\ĞCaX]\å]+O–\åJT\Ù9I\Û£Ÿ8¨\á\Í\ë~\àš\×kœUM¨9\â]”\ÖS¼¬Á\ë:>\âöñ\0\è¯¢•––T\Í=ª„¶p¿.\Älai\ZCŠm\Ö\ÒN\éZT2•¤\ìA¨#¨}\å;\Ê%ù\Åe\Ø_Ö°®*3=\Çp¸\Z¡$&§¥ÀZ@\Î\Ş_\Ş4ô–U;5„•lsƒ\'¯<)\ÌS}¢ôÑšzß‘W3³\Öû{¹*z•K¾ü>©í‘°\ç)j‹ru#2\âH!dË‚\ìGb#Š¸´©k[MAıô^‰iBú†ºF#Ğ­›ró\è÷t¨v\Ûsa‡˜C\r6I\îOhYw…»Œ90I\ì„¾P¥¯3\\¾®I[7N¨*«O/•†‡\Ù@îµŸº„\É=¢¦·[ô·%d9\á\Ô\ì»³\íj\å\Ût\É\Ø6\\Šf\ëJ9‡\ÕÊ´1\Îû‡\î¡\É\îN71\Ú6Ğ´\ÒĞ“²\í\æÊ™•I.¼±\ï\Ì<­\Üu^ªVşƒ ˆÿ\0¼?Qt&\Şu±4š\ÃRJU[¬©.¸i¾\éi\' \ï\Ô\ï\Ò\Ã÷%˜[Î‰\Îñ\Øp\ËiOS½\ãöôı¯>\ã\\WÛª\è§\î¹\ïú\\»\Å\ËM\ËU\ë\Õ6O+\ÌÑ•Ê±\ç\á+\0‡\àb?M§½/A’J#œ\É3\Ì1’œ\àF\Ã_\ê*ºÜ©¥.eUZƒRL|\ê[Ó“Êœ‹\\‰C)Ù½3\Û\Ê6ñ…­\Õ\0(MY¦¥¥K\Í+\êú”¨t\ë´I´\ß_µ\ÇeŒMŠŒˆO»\'>J‚G’ö“ğ\ÜzB3´‰\n2Ó’\ä(l‡A\ÆG—\Ê5j¥&[™–U€q\Ì ieVt¸\å^¶Ÿ\Öm´1^–™¤¾F	y>#Yÿ\0y;˜‹—Y£\×eS=F©±6Êº;.\èR(\ã§eˆJ\ãgl\ä÷1±³n[ŠÓŸı\ånU—t\0HF\á~ŠOEŒ!d%\åö+®\Êzú˜M}3ñ\\X|HZµy$J\Ş.	\ä¨%Å†Êšpù‚2S\êH°iuj]~˜\Íb‡PfnRe<òó2\î¡\Äù…\rˆŠH#t£J£$@ƒ¡>\îPñ=R\×)j•\"[Mk\Ò2D\ÊM=p©\\ş\Ø\é!”°S²FyÊ‰\ê\09Æ©7Y¬Ô“S©\Öf&–Nq÷µ,v\'´u**/]•y™™ >±£\á \î‘÷8¢\îj2““2,²”¥—\Ö\äbú@(&#*-+\"…aKN6\èL:T*yP\Î\İ!\ÒdT”\î>b—h©\Ä$ûŒF@I\Zo³\Èx\än:M\æ”µ:rPvõ¥_\ê\é«	·0\ÊLû](´”\àD00Ki´‚¥­KNJ”XR\Şa\Êj \ÓYIn ™¦O¢\Ò3ıITm\ìúr$$Dº{w\Ä!t\ËZ\Ãs)Fò\êm^¥>ò\"¨„Ê’I]§•†g©\Èaô€™–C­\æ#xw?OJ^.´w+ı!¸…NÆ‘eÀ&)\ë,¸9¼G\äDODúf‚f\ZW2\\@ÿ\0h¡\Ò\n¬Di\r¸mjJ\Òv \Å}¬ü,\ÙúÈµ\×\ä‚(õò\ç\å›ú©£\Ø<\Ø\êœ{\ß‘c\Î\Ç(†jf®\È\Ú7K©\î8*÷\"&ñZ {›)$ÂbV¦\ÚGó9ŸºbŠ\Ô)Ü³CÄ…}ªö)?\İ\×\Î\è6¯\×õq\Z1B·\Zı\â&\\D\Ì\ãsm¹.\ËH -\å)*\æJFv\nHQ;˜\í\Î8q±ø{µ…2‚k©Ì¤~ô­<\Ö™=yG^D\Ñ#\ârb¥¥ZW½y\ËÜ¢a\Ù6\åuLÓ©\áKö”¨E­g$¸$©j*W6ı\"\ã±u¦^¬µ§÷-b#tª]O±H\\óaù¶R2§[k<\ä½¶\Ø\ÈÛ¦5md\ãQƒ\'©ş}÷½¿¤)T 7°\ÄüJrß»¸§½*¢R6\ê³2\ËZ·òI‡ó>GH\Ú!Ú­8$\ì9÷\nğ©®Fó(gúB£9²µcu@Õ¥MJ\ï Iò•%©·f\İOşSD\'ú–˜—L2\n1€\Ñ\Ûbzú›R“\'Ki¤Ÿ\áqÕ©Gú[O\ãgZ	R‰;\ÇUq9Z	\ÆT\Ì×†yVr’{FŠ\ì}T9tÏ”ûœ\à+\àbk\ì\Íe·\Û9…yDCVå’»q\ä6=\Ô`Œ÷\ÄºSºj\Óu)›\n8#l\Æi\Òn8\äË¡8	ÀIùB–—øŠ#/$–\Æñ³’–\r\Ë::\æ\" ­m\nš¹ú»S>óO\Ì%I\êA £bc¢ôšÙµ´¾Ò¦\éU¯M4ºDªe\é2ş\"–\Ø\É\æY*\'s¹91HY\Ôõ?p\ÓĞ„\î©\æ»8‹\æ«&yJî“±¦\"º¢B’N•¶•Ë°\ï5”‹ªTI\êò¼‚RN>\Ğ\ì`F:\\¨©„NË¬´H?„V—ı5-]Uˆ\Ç\×\ÄE¡Al³5.1\Ñ@½Z§!›Á\å¡Y²…«xÁı#&˜€2\ånY*¤t«T\ì:• cş«l¬\Ì`7¤¤ ğÁ\åøÅ²¤­%uœÓ–‚œm\Ò4ô\á²\Øş-¢MtI”\È-i\êHÚ²«T\ï/&ra”K©”¶”\ãx/ù\0h_½\Ñ&YÄ¼\0\ìp¿\é*„´©e´‚ñ\ådYªRœ–š¤…!c\Í$`şQ^¨2ˆQ£õeÑ«u:CS‰\æH\í\Ì7ı3õ±4\\a\Êz²T…7\ê“ÿ\0?\Ö([tMS=÷²˜ğ\İ\ÈÜ”+üñŸœ^”vW.\ÛSÍ¬\ãbHi\'¬™Ê¬„ò¹\\“¶\é/\Ü3\å^«ekJz¨öHõ\'>eø\å\ã\'	7õ\ä\Ô\rd¹-ûZ¿3$‰;~·1+-%(•\0\Ë2\éB“õ^ZP=W²I¥+\ÂBb\èi\Êj™)—)!)=I?xÿ\0aşq\âG\í!pˆÆœ\ê}—\ÄÕ½N(f\é”]\àR±•HS>«`©?ûu±kj‰\êƒ\éµ\ì2\0Tx‚\×\ê\äÓ³u}t¼\æœ|‚ó\İSj+\ÇL\å\Íñ’~\ÏWeù¨\Ó|zjL\íMÁF[”\ë&rnmkq÷ùJ&&9”IR“\á$‚T\çğÇœœ<h•gˆ=j´´BŞ™n^r\ë¸%)lÍ¾yPÇŒ\êP\\$öHQ>¸¼}O\é/öº]A\Ò0¢·#D·)mIHË¡8\Ê9\Õ\æµ­Gº”Leİ–°\0\é(Ó¦Ü€\â“S5\ÙÌ­!/#İ˜m=¼Ç¡\ê\"¾×Š¡›ª\Ó-\æCr\ì¹2úGu«\ÜG\à9\Ï\ÌD\İnuŠª\ç\åÊ´vXò1^jz^v\ê¨U%\ÒTÌœ¿\"–~ò’	Pùtøƒ\Z\Ğ «\àJ\Óiì¢—©Vy0&\êNuCA-–R¿\Æ7ª—!EI>•Jr•d\Ó\åAû\"\æzó¯\ßWõ(\ÃòÊƒdŒo˜yDœ­k¸—~¬€Jº\ÄCum\ÆÛ¢º\Òşú‚G¬Nfšt§;½\â!rPŸ¸®v%\İİ–Î F\Ç\Ë1\êOt\ÎŞz‘o2¤¶2h\ÜS¥Ã´õ¸RHRO\Î\ŞÌ®Q¶%\Ù÷y—€”m$™,R\Ñ©¨INô\æL9zRš	\é6•<\Ïö‹±ô%\ÇŒnNb©ÒŠz—{\Ë(#fZ\É\ÇOw\Ş-–P[®¨dl#·P9jœ”l,…§p`CŠ«O¦lò\'b\é*€¯\n?añuÀ¶¥\\v\îŸkÅT©N>–¤$dªm—ŸuG	J±$\Ñe\Ô4öÂ«Ì™ª­©&û¸ÁZ\Û9Ç–\ÆË¦u…«t‚µ\êÑ\'.óªÅ”\Îû…,öŒJiV;\î\ÊP¤\\ ‘6¥zvT\ÆDº\İcC4¢zX¥\ë=¥$ù>\ç\ãö¡µ?‡M’wÅ–³\ÂW\æ&\İÿ\0Š\"D¹\İÓ·´KLT0-\å\Òÿ\0\ÎoE´\êXŸ”úÿ\0\â”X\"¶6P9\İ\Ó%ğÙ¦O\Î9ÔªaÀ·@œ8\æ\0€G¤H%´\êÛ”–C\r¢`%°“€1$K\İı_Û§%)˜±ñGùG<q\ïôRh\ÒC·\í½`¾n\êD·>ü\ä›V\äÜ»a×œl6T\çŠ\ÊóÊBq´¬ç°4\0Akwu\Ïg\ìÁpc§\×u.ø³µÿ\0T¥jy\æ§$^’¶óKAÈ–c\Ñ\'l\É)¶ş¶a\ì‘\ï(¹ó\é¹\ÕÕ”À‘”İ9¥µ*¹f*/¤+>ñ	\Ï\éÊ§–\íJ\í-Ë¦q	y$8¡.‚NNUß¾ÿ\0ŒºZ‡1\ãª\Ú?¡t®P\Ûu÷’r\0—Nßœ$­§­\Ü\ãş\ì?\ÎRÖ¢òwH/@\ä”1ş¯²£ş(E;SÃ…\ár)*?hû \ßú @†\Ò\Ô9\î˜W8W”­>\ÜÀ¼\Ùo 2 \çú\áÒ¸kk\Üÿ\0µƒG.—_\ê!ka\':§u¶´4Z^Ò©=Q5£0§[Ù¹yFsüF$i¶e\Ûl´§Ô¬œ“\ËTZ%cû¤Ÿµ¤f\â*aÀq±:\ZŸ›Sºÿ\Ù','Derek','Limbo',19,NULL,'09463276543','Cuenca',NULL),('U0003',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0\È\0\È\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0B\0\0\0!1\"AQ	aq#2BR‘¡±$3Á\ÑCSb\n%4r‚’¢ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0.\0\0\0\0\0\0!1AQ\"aq2±#3‘Á\Ñÿ\Ú\0\0\0?\0º»\îmºvª¹<|\Úm\×\Ó\ÄW\ë\åA }úhiÁ\í\Í‰»9¼\ÜtÁ*p¥*O//÷\ÔuU‹‚\ĞÜ‰WTo\Ã\ä&jŠ¢)$ õÂ“×ºO·\×D‹3o¡?=È²a\Ù}ÿ\0ÈŒ¤)Q\'$rŸ\á\Û\ÓU\×f\å\r\äI6¢†#\æ]ú”Jlè…‰€)+#—\'›0}şºÁªTiÒš§\ÖR·›J[”“\ÑXó\ê®Œñ_Z¬^\rY·y”™Tù˜^\"f<Ğ\ØQmGújYW¾jôj ¯&òzKEuÏ”’9P;\á^ÿ\0MiR\Õ\Ô\Ïv3.„œ\Ş„<ükÉ²‚¦ü“ü½\Ğ”¯\ë\Ê±ĞŸp\ì–·\Æ]µ¹ôªrŞ£ÁŠÇ‹0c•$sduûƒ¨ŒMÜ¿÷R\ã—‡óVõ&<7”·¥5Ì©+\å8H\È\ÆIÀú\è\Ç<m\í~\Ï\Ô*6\ì[JÚ§SŞ§µA•.®äªA\Ù/5(\r7Ê–ğ§\n°²Nª\×0\'ö–hV N”Ö¯:4X\æT‰­3Ê´ò¸\áÀ\ÔKw÷rÕµ\í÷.¯\Ä¬¥„%£ªô\Z\0p\é¶‘µ«q\Ä+Wl\æ\Û\çiR\ä²\Òbt\ë\È\ÚzÜ“¡\ï\ÜCF¸\ŞS3\æÇ…I‚¢³=ù-üÄƒPfg­\ç~%Œ¾ık\æm\Ô\ëWGÛŠ›vŸ,•:\ï™\ŞX\íú“\í¨Ù»oU#Q[jªŠC\í6·\ã7\Ìì¹«Vó\ì \Õ\ÙŠ\ÇÒ¯İ¿®\î:ØªSkC‰r®Iuºƒ*a+S¨(\0,©Ë©\Ü|Y¸S‘½“8q±·–ß‘nÂµV•{É“„M«Hp§Àoœxm€r}I\Ğ:\Ø\Ş\åL9‘z\"{Ux\ÖM—½ušlÁ¿.†\íj#	D&\Ş\çR£\Ø}q©•ø´a[\Ñ_ÿ\0Ps ­a\ç\ÈZ‚‡\\«>š\Z\Ë\Şg\ëô4\Õ\ì\ËM»¶—\"Jš>/Š¤£\'“\Í\Ó]P^ >\'ükZ4\İ\ÍzÂ\ZÈbSaJ¨­~$Æ¢\Ës‘•¶\Ò9	\ï\Ó\Z4®€h˜#gZ\Ô\ì=]\Ş]Î™Q\"š.\nz\\o\ÅNr~™ôõÔª\ÖÜ»v\ãºcQ\"Ú¯2·¢‡Ã\ÆÀú\ã\\›¾¸Ü»6û‡9Qv\Ó~)e\Ù˜ŠÀa…¶‡h€ë¼‘Ğ²\n\ĞYJ9ºòu\ÔÓ‡\Ş&¸\Û\Ş#¶®¥\ï´\Ë\Â\È\Ş::\ä\Ú5©‘31´ƒ–pP¶Ê°“\Ô)j\Â]Xe6¡\É\Ü\é\äXóe\×\'ÿ\0\âŒHb?\ÎøtFS\Ü7Œóe¨\î\ê\í\å^µp0\í \Z¦´\Ñ.¡J\ÈQı\Ï]O(õ\Z=ñFÏÚC^rT2ƒ§\é®n|a~!\Ñğ\ìµŞ¯pû\Ä\î\Ó>\Ì\"µ\"Ïª6¹÷…\×0\ë\Å!\\‰J\ÈONƒNµ\Ôh˜\ÊÑ»¥¿¥®÷\Ğ\Ç\â GVyhH\É=¹@ô\Z\Ú\Û\í“n-^¢«u‡¨\ê—[y¶ü¯{ó\Ç:\äv\Æüpkô^0\êa½<_[HÛ¶i¬Ui7•/k]pTV®EºÁiK\nk\Ê\ã ë®»‡ÄgˆN*œIü5wŞ¹j,C\\ºCË‡\ã³?\å\ÎdB\å\ÈğRA	\Ï\éW.AUƒ¬°\ÌT\ê1Nzı‘p®Î¼\ã©È…Ô¼Ü¸-r©M…uIIıC\Üiú‘*±W\Â\ê”ú²\å\ÚUx\Ë€\Ø\Â\éN2¥$õ\r¸şRu‡…ú\Ü\Ş2x{µ8³÷¾Pjµ.|¼ûn)r¤G£:”\ãmÀ¤‘ŸO®¡qoY\â\Ç}7³„> ¶ú†nm¡®3\ê½*2šb¯	ÿ\04ï†¢KNL	=;k‹l:–˜-»\ÚÎ…\Z \ã\nJ\ã¤øe`\ã¦3¥n\Ğl\Û=\ß4\Ô$€	\í¡\ÍwdŸ³\êÿ\0…S®¹”š\\\ÇB)\Z_ˆ˜®ÿ\0œİ’£œ\ÛR\Û{a#üšt\Ö\æÈ”\Ú\Ç3¨’@p½GaŸ¦¸\'\çbbİˆó¯\ï¨¦¦˜§\ÄSI^	ôV¾«Û°;WÜ–&=N\é1œZ\å-\Ç\ÇÌ¶…H\Ó=şšºúU>˜\n6\ÚHşº‰\ï]*0·y´bCC•\n?Ä“\Ü7‚c\Ò\í m÷·ğ‘}¸sÓ–B \Õú_\Ø^\ÇKC\ÊÕ‹I\Ük²e=Q\æÆ›Æ¹×‘\à?°é¥¨­ş\édÁı\î\Ö\Ô\Ü}.£Kj–´£\nj>\\*9ô\ë¨&\É\îÜ¾Z\ã\ÍS’)\ï¼@`½\ÈŠ\ètQİ—ÚšU™P*£1•…*1+ -ÄŒ¤w\êI\Z\nE·S\Ü#J.x\à+\å\ÛNO7¶4*\×L°@„±+®\ÜfYe¶ş¼‹¢úªc1\×\ãPÁÅ‚\nNO~£¾±\ï\Õ\ç*Ğ±\×q\Óu\ï‡„2#§‘;\ç¾1­^\É\\]¶‡.\ÈD´J\Z5HÃ‰V:­\Ì>İ´õi]³T%S/•6ôO­ÿ\0¦\\99õ\ÇR4Q.³[0;T<JŸ¶W·<BnuB<-\Óÿ\0I@‹\rL\Â,P\Ó!\ß*Ë¯¥µ’\â”\0NA\ÂQ\Óõj¯qÃ§ÿ\03»Ñµv\Å‰+öób÷¾Z3\rzÉ¶\ÔHm;\"P1\ÚJC.$´Q\éV5\Ò\"\İ\áê³“.º\ëv\ßuHGú®„ú#É‚\ê:z\Ç yOEA\ÕU\Ş^\'x¹øŸµwl«—]~•H±*\é«U¬«^L‚ºœ\Ï	‚¤” %·</e@ôQ\Z[Õ›Dõüˆk€‘\ã_‡½Â¹¸}·\îš=ûF\"–\Õ½w\ÍK”¹­«”8\ã«t… \'£ te\áÛ…\Ë7xvb²\Û\Å›º™I§ÅQŸP}K\ny¼#\Æ\ÂH*$¤\à\ß_8Rã›ƒ\èû[um/We\Ë&ô\'–\å‘y\ÒZŠšYğ\Ò\ë½p¡@Qó\è—cµhğ´r.{®ö@£\Çes+5‰\'NJ€\Çó€”¤›v:]¦&MFC\ÑÜ«ó!<)|&ø:¤\ïö\Ò/~h2©\Ñ\ï(MXÆ¥OIR¢Šs\nuL…~¦Ë®‘‘“úˆğ¿ğ\Ã\Ú\Ê\Îû\ïV\â\îVü+rV\åŠ%µ¡GBd¥\Ç8	q\Õ+\Ì?W.Ÿh\ÜEnn\Í\í>\æüS7úˆü:\Ì\ÚTJ.\ÔmõI\Å6iÔµ\Èl0\ä†Áò¿!\Å%\Õú€”§>š²67õş)xŒ\Ã\ßÉ^¶­˜\â^\å\Ş\ëFa±)L\åºdUvuÿ\0@¸¡„£$\ë»#KlM\Í\ï /‡ş\Zn)[-O…oÈ¤QÒŠ?ƒ\r*j\"9Ğd·\ĞT¨L÷\×#¸·8Z~^ùÀ\Ş}ÿ\0¹7*ø¯[p¡Y¦4\ç%¿ø‚Š_ˆ\Äl7Ê“\È•“®\Ì\îK²f¹Q±o»XÊ„óJb{N$8Ã(`¤û‚5Ì‰†ø]|\Z:òxv¾¶{k­6\'ÄŒ\äf\Ë\×\\\Æ\ÜV|\'xa\0“‚I>ú®|\ÉB\ï˜?“f\îF\ïo&ÁRø~øx\Ôlª«Zˆºõj³GñQd\ÆCO—9\ÊV\nÕ‚<\Ä\ã\Ô\êZ\âGp¶Éª\'ê†ˆô\î÷~EN\'<\ÆD5Ve§=BPÔ…‚;a@új\ïğÆ¦\ÒÃ„İ\Ã\í«¾\É2»QaU+\æ\í…\à\Ã*\Æ9ƒ¯¡¤$ò ¦t\0£p=7ˆx\Ë\â54¯˜ªW/\ÚÊ¬2\çi4÷T_Z}\ÂÔ\\zòmG\îF\ÄB8\âu\îƒy%\ÈsiNIu\ê%v\ã¸\â…²‡š\ÆAûW}5Flšo\Ã+o>¶\ÕoıË£\îÜ†.+RT\×ibmÁPœÄ‡š yVù.\\Ã¡Î?\å‰\Ä{oºb\\UJÕŒŠ \æ\Î%2\ÚXu\'\ê\Ù\Ï\ßE\Û.\İ\Ù=´¹ªÛ´«&Ø§O….¡vK¤°§˜XA	un¬Bp;«¨tU-÷¥F@p”/‡\ËKw÷{p8g\ß\Û\'\á\ÑrUf\í\Ï;i_n^”øôZMWÅŒ–C$‰Oœ’Ps\Ì5n~\ÜñÁV\ånUi+\"‘³»‰X\Ê&\ß\Ûõ§jF‡9YC¨aü%¿€\0\Ğ¦uÍŸŠ7¶n\Ûn•¿{u\Æ5÷\Äm…y\ãv\í\é%\æh*Ô’ˆ\í|°C(\ç@O1<Ü¤ö:\í½#r¶~‹P‡°ô¶µ\çÑ£N°\í\è•\æ%H‘Mq!a\å6\È\åm>dö*9\'8:\à›i\Ñ^g5/\Î!øˆ\á’\Ã\â_c¸N¼¥³rQ7ù\ËRÕ¶¢\Ã.*R+\íüh\èOT¿¥\ÇRGLdh™ğ!¬Q©¿®&¶ú%\İ.½\"§kWj­©3\'­¶–\ÛÎ¼\æJüBy\êŠ\\lõ™qñ\Å/u3Sˆ5µk\Êu\æ:\áBDWlúgF}u¢6\×	?üLJŸ5“‰\Ä&Ğ–!»\Ë\Ê\Ú\êPù\Ë\ìV|rWõ\Òûg³g\î4ğ\'Q«4jm\ÃKv‘TŒ—£¾Œ-µ{\ß\ÛL´	µ\Ëncv\Åu·¥°|°\êhO72Gd9\ê•\Ó=4\ç\Zr\Şg\Ä\n\ÆO¦³\"@\ä\çY\í\î{\é\Åu <Ÿ\ÊNRO\×Z\Õ\Ê+†˜ª]E®vœ#)\Î:l7-\\•¶t•5¡\Ğ\r4M\í˜I\n\Üfe\ì•FnCõB\ßR\Ú\\\åHş\ÚZ’o+\ÎQ-Ê‡Ê¶_SU%5±•)\nq<À}N–™h$\ÂI ²º\ï&\ÏU\äÓ§\Ûò\ŞT¨\î$˜`#!¢\Ç>§U\Æ\Ğzm\"\êm‘U\×\ï4¥ø`§\Z¾q^¡L¯Ê´œqøq\Ğ\êÔ¾ g§ö\ÕÜŠ\"­\İÔ¬\"(Xj¤\ã)aI\È<\Ê#·øĞ¾¤¥mC/t\ÂMn!\æƒyV \Ğ\\k…ºŠÔ¢¶\æ)\Ï^ c\ÓQ\Ê\åƒ*]ì»¾Ÿ.;´Z›Š2a”*;‹l ¤Ş™\Z”\ì\Ş\ÚSjvxn9—\â-H\ÎB±¸t=ı4®z\ÍSi\ä[Ò¤\ÂuÒ‰m¶\Ï61\Ôû}õtRƒ8<A-‡±nB­®\è¢S.®¡\ÇX¢\Ía+Š§@<‹PRO)ïŒW“·¸\á¬\\•/ô\ÌM½ \Ğ`%\é&\nŸ”ó!)\É‘\0û{j\äñ.\Å\Z\ã\ØÛ†§hn<\ëPV©¨bYŒ¦C\ÌJqIOƒù€¤©g\Ê2s\ÓT\Ûjøn\îÛ‹²©¸|snrÚ¦6[“O¥\Õ\ãAk\0¤º¦\ÑÍb€GS6ö#Z“\'n¹À–\Ë\Û1noŒ0nªµ\"©P©\Øğ®1n\ÇSm(¦`R’ T®R” \Ì{j\Ô|Y8z¹\în7yo™ŒRaY\Öú†\Ú\Úp%s¤\Í*Ci©KP\è·G7\å4:7úOhÂ£h6_mø•º­«Ì¢Æ©[\í©Š½dTœ™2Gˆ‚¦–ò\ÜJ¹s\Ì2z\ê\ßñ·öúleÇ²\ÕÚ”‰U–\Ãò_b8J¼6d6ê’œœ„MGa`c\ï@¯©F¾/\\>ñypUTu\Ú[ƒoZ”š…U\Ô,¿6¼¶\Ò\İ	\0~ChÂ”OU« \Z±¼\î6\Òn\n¶F\áp \íÔµ\â\Óc¹VNq-x/!¿÷)|g!|Àów\îO]X–8”\Û\r\á\Ù)U˜ôhb$\Êc…\êN¤4˜Á*nD	\0÷I\Z\ä†\åp…Ã½•½k‘µ›¸[·d•¿>Ï´.fØ¦NZU—˜S‰_\'©Bz>šœ¸E\î•\Õ´¿”\Ş4!qD¬\Ôl\êa“J)\Úuqj)n¡ ©-ãª’¥ø‰J‡p€G}Q#¸;\á\Ê\Ü\á\Ïv·b¿²”\êbİ ?øEfª—Tu\á’*YQh-|¡)q\ßµplúM\"‹BƒH¢QZ¦Ã‹\rÆ‚\ÛA\":\0\06\0\è0:tÓ´\ÅS„ñ«\æ\"[?0%„ø\\¾¼\Ü\İ1÷\Õ\ä/-JVT^·ˆÍ¹\ácmø§Ü§ı)K\Û4µ^µj(,:\Ã\ì_dù”²‚…w\æ\Õ\ã\àŠ\r¡Â½½²\Ó\á!ª\Êh\î.¯\ĞeË’Tôƒõ\Ê\İP÷Ğƒx\í\æ·*‰@¶-Ö£M =Tn}]ø. 0¸\Ñ0ò\ç—u-§\ÛZ\Ğ\İ]û¹v\Ö\è£\Ğ\íı¦©\\3§\Ä~^WŠ‡˜\Ç~V\Üq*p2F:j=\ì#Ò•Yó…{%Ï‡>û\×8\\¸§I·¥}ú\ÙW&/ò`Kt?KZD’¥s#=\ÔwÕ¯\Úù6›{lU\ÍnD©\Ğ-¨›¹9 \ÆrL·Sƒ\ÑE-¥Pô\çO¾‡\Ö=_a¸\ê \ÖxR\ŞIôš•ašcOÕ­\éR\'GB’‡BŠš}²F“zN6Sƒû\'†\Êz­İ¼§\\r\í\æ\ê†L¶fMzdš³\å!+~C«%K>T“\Ğ \r\\\Çf&Vµ5\âxÀ°¡\î\ï\0¼KmœjÊ³ö†tûØ‘ZŠ\'Ô¡ :ì€¡„œ¾Ÿ¤¡^§UW\áÓ´\ÜAq\'ğòÛŸˆ§\nL¿m\îVÀÂm×¨—·I©\Ó ó<””Œød\Çq	=9U\È;º\é\îığ\×\Ã\æı\ìôı‰\Üzz©6-b\n\Ñ2•à­”uW1	\Â\\ó¹\ë¡6\Çp›Ã†\É|>¯N¸+¨%úT»‰-]ÆVL\É\ëa\×ó•Ì¸\è\ä	$\0O¦ˆ%]}ÃÃ“o\îk€«&]\É\r–\î±¥\İ7 H<¦mI\åLs\ë\â$¢FƒŸ^7R\ì\Ø+OŒ\ã:½\ÄØ‹‰»Ššˆ­•;&!RZ\êp\0Q +V·\ä\Ø\í´‹Z²,\Ú,ˆ\æ’Ó¯\×+\è¦À§0”„ ¸\áJ;$\0†ô%÷öc“¡o…»b\Ğ(l\Ñª?_¤\Ö•	0V\\[Í¥$r2ô\Ô\İ\ã¶A\ØÁ·1\ì_\Åg‡\í\ì\á§n7®Å¨¢¥Y\ÜJ´:<>\ÉT\Æ*K Ii\Ä\ç(K	8¥œˆ\×Vr«Ri¸*yTúƒ\ßT«‚>~\Í.gü\ÛTC&·&Aj©Å©´<¥\áô!§ûc‘‚€pG¦¬«|W\è¿\0Ü˜\íÿ\0¼|ª¦:¶¤QôW¦£\ï\Ø\æ?\ÚÜ›3{4\Ê\ÉJ\É\È\è	\Ô?r8ƒk@r¡\ã–\Óùó\Û_k´\É*—\á\ÆIl+²lé²«¶;m¸Œ»·û’q\ÉM!\èª(\åSûiAØ$‰´\Í\ÄEª¹|­LNm$~hè´Ø-j\Ó6‚u­Yƒ\"5YÇ C\å\ä\Æ\è’\0	\Êı\Î=´´\Ö#q{[\âG\é—¥sÈ¯-–/­(ñ›?ó ‡T\ëˆ+Š7|\îöqªŸ3Œ‘’A\0\à@FW-\Ùr\Ûõ‚\ÅjdS\Ù\ÊGó«=F€\\I\Òh4\í\Õf\áŠ\Ëï¦½:¹\no³\Èò()C \ÈÁÆ¨u\n\É@\ßR\ÏNb–\'\Ì2\ì\Æü\ÙW}=\ËrÜŠcÉµ¼\Ëm!ö?}\×:Urš\í*µ\0øO¶PTHW2\ïª\×Â•fÓ \İ\àU]Cr%¶–˜.+\Ê\âsú@÷Î­;r©L§®­n\Ï-Ñ’<D!G·O]Y\Æt¶ D‡\"£]İ¦V9xo¯V¶>~\ÚQ*r\çS«L¶c\Ó\Ú%.¦_ˆŸÔ¨uAB\ÊW\Í\èNª½©\Â÷NXP\íJ}b”*Vû²\íıÅ¬.Z”\Å\ÅOr[\êLr\ç/ó¶\â\Ù\Ç)Yµxw¢î—¸R­\Ê$ª\è\'\æZb*~\"BI)O¶N§\Û²\Ö­ÃN–ı-+’\Ûs¤%ò¢T®b¥$Ÿs¥º°TÅ­‚‘¹M>{[3e÷\âûª\İ\ìC“A¸%Ë¬7Zÿ\0¸Jœ ˜®·¡«•@\ã•]ugw2±eW!Ê·¬\Z\Øbu^ Gš\ÓYĞ¦\Âù}pUœz\ãC\î[¤T·iºEv#OF˜•¶\ë*ô:+Ş–Íµ´\ÌUnj½\Z7™\";H@Âœp¿–@?b?aª¸Z4’e¬\ä\í\È\íBR\r\Ç\àö×µn\ív\Ön¥f%¥P²\é\Ğ/Z[]]©Uc0\ãBY|’ T……-¡Sh\ÏAG˜\à>Á~]‹_7}\Ä.	ÿ\0•_ù\Ò]}Kw\Ä|¼Ò¿Ì•tè“\ØhùjPÜ¨©\Éòz¸û¥Å•’NI\É\ÔÖ‘m\Âı^\ny\îF¨_œ½üG¦’›2(\Ä9­!˜\ÊW1Ç•=´9\ã¶Şš\×û”\ÛQ”]jÎ™%¡\ÔeM6]§¦S\Ü\ê\ÅÁ¦Æƒ\á7“ŒvÖ†\ìm­/uö¶\á±%·\Éø\Í\n\\I\éù¬©¼ÿ\0Sªÿ\0­$ò%Á\Òö§™Xø\Z\á*\æOòlKš\æC/\î$Iv\Í/˜Ç¤³PJ\\LvÁ\åB \É8\Ô\Æıø\í¥Õ¾ôN\"U:¯\n\ì·\Ì4A™b‹Ia€¤©Ÿùy\\BÔ•zö=Æ4Û•Í¾\á\æÈ±®¸!ª•Öƒk#%\ÆYKj\ë\ëúu6ğš’\è+F9¿Q\ÓU¬\Ë~ó©5}5\0>x•cbxµxy\âb\í\âºÓº\ê²n;šC¶dò„\ÓÒ·\ëˆA*HO\ê\ì­\Ö\İñ\Ä=\Õ\âE¤Z)|BË’ZHJ±×®O¨\ë¦yô\è€a\r÷\ì5òÄ¼N\Ø^‚k­ÿ\0±ª¤1,ÿ\0\é+>W×¸ıõ.&Yw\í\'R¾f¦®õcp\\»\çs\Ñ\ä\Û\×=˜Ì–\Ôò8\êA\0¤¤‘\×\ëªUÁ\Öo\Ù\Âÿ\0Ve–\é\Ó7Œ\í¨%Q£r\nr)…\èIye8*VZ\Özœ¤\Ú\èm³_7”°ºI\nPfbG—Ó¡\ï¡&\ÈğùV\Ø;ñ·\ëU5\İÍ«×¨B“’˜¤?\á©#ô\ê\éôÑ¡]€y™\ÓbıH\×¶}Gi\Ü8\İ\í\ÜtJtJµ>eM\ê2\0vsqºV\å_©\êAJH\í¡¥½·5;k€{·\áÍ¼[³SbüµC°ngaxõ*m¼Û±b\ÉJğd%µ%M¾fÀÕœ²w¿oü•“•:PZ	JO·A\ßZÛ½R´.8”Û‘Šb\ê\rEyj W7—+\æÿ\0 \×u~dªjaÈ›<ğï±›/·5ŠL\Ôj¯r\Ş7›‚\å©\"*`\Çz|„¡*,EI\åa°–\ÒA\'¹$“©\êør»>hM{3=„:\Äb¼t\n\Æm+*\Ækq\à\Ó\'\Âu¶\ÂW–2JcƒÛ¾£\ìn\Åñe:õ*Î¼eÍ\ÄO™Jy‚òt¡¥D{i\â\ë~BsWQ<f?\Óõ€¤3^¶R\È?©\ß?MD·>Ç®®œ\ë0*\é/\Èg9r8”“\Ù$öö\ÔKdø‚\İı\â²\ä\ÉTHp\äF{”±8ñÔ\Û¦›®\é\ÙwU$\ŞtX­\ÄmA\Õ6…)Ã“Œú.WŒz\ÊI^\Ù\î…\İn_qvºeT˜Œ°Ÿj\ÆRÏ ÿ\0\×KQ-¦ÛÄ¶·97MÁx\n•9(ğ\Ò\ĞR®b¡\æ\ï\×KH\ÌI\âG!w¸Ö®ùLTZ”Q+OC\n~—y\ã\ÈJOB‘\èG·®§™°4{\×j%\Û1K\rODˆh%>2F@ÀöÓÏ´;Oe¾Ù¶h©Õ™\è[_k©A\Æyºÿ\08Ôš\Óq©\Ñ\ZMF¢]©¡L”¯¶¬vòôû\rY²‘boŠdö°eò%	·%±`\ßqj\ÊHqpeaô/ ´¯Sûj\çmV\áÇ¨\ÓYy|\â+\é\Ëiy û> »2\ÚS[•h@[Ÿ<š” ò‡‡©# \ÈşúÚœ]^›n¸Rn\Ö?¦1%¨Ï–|Š†\Ö9y\Èş,g¯\ÛA±]±-5?ˆvõ”-\ê9–£xlxGshWX![r¥2€\0<©Ç·¾œ.J\ÕJ\Æ\Ø\ê\í\Ó6”¥¶\Ü7ƒidR1\×}3¦÷…¹©U»R¯¢!ó6¶\Ù|„/_ö\Ñ:„›³9\á\Ğ@’” \áMœÿ\0?’–\íqÄ¤;.\áN\è\Ğ\ÕCm!÷\êq\ÈÌ’¡Ì‘¦tn\ãÊ§8\Ü+¸\î0‰,‰“\ZQı|ª)Nq\é\Ğ\êÁƒ*nùE«Va©%\å03È°:=Æ8†¹\Ü\íıªÖŒ…˜<8±\ĞG\éJ\Ôÿ\0b®ƒV\Ş\Ş+‘÷º³\Z¢\Äa†’\Ói\0H©q^R\ÂP:w:€nnôm\æ\ÆQ¿¼«°?`©G\í\ßB\ÔüS6-\ç\Ó”‰R\Ş+\åğ˜o¯\Üı4 c[i\îš?\ÔWQ\neª\Ä\ÂR:“\ÛNMDi£\á)#˜^º\í&ü\Ú[JV¦¸¶›y €\à\ê>‡EFŞ§\Éa.´HO}BU—`\Ë\n\å¹X\Ôin¡X<\Ä\ÚÌ¨!<¡\è1­™U(òü—¤\Úf¯nİƒA€¹õ;3IBNyõ\Ùñ$;ù›jmda~\ãLW]=5\æ:\Ö@ş\é#\×P˜¼lğ\á2¤¸÷&\Ü\'x) û¸ú\ê­F»iŒ\Ö-ù\íÉ!¾fm@ƒ¦Š¬­\ÃHû’\àP\ÉU\n³¾›.\ËD-¶\Ãr>X<ò€K\ÉOE+éƒŒ\ë\ÚgŞ·šÛ\ÍZR\åS\Şq_†%£‰n€®b0[\êzi\ë`˜“Z¤ª\Î2\\uhª,³	h>\Z’RA>ƒ¡\ÔÎ©F¿v\æİŸQ¬W ?\â\Èqpœi\r[ş‰úvÎ¶4X^f\"£UÌ¿¼\Å`Q,«6+”ùH\ÑD$-2šW}pl5\İ÷¹iTª|\Ö(•¦œ\Ê>:r)C§o\ß[+E\'p©lF®¼\ì”%¥>—‚›I#°#\Ü\é¾\rµ;Z@j›t4I“\Î\ÔW]<‰ë“„ûK³xŒ–¥\ŞÓ³\×H—1ø\Ï<•\è”BšÇ©#¯ï¯›‹En¤û-Š£<Œ\Çğ\ã¸\Û )\n\ïÌŸnÚ˜q\rh\Õ\ì+&\ã\Ó\èô¹(ˆø›Î§•L£”\áC\ß\Ì\0ıõ\ÙZUÙ¾¶rwjU24\n%,¬2\çŠ\íM\Ä\È\0\ì„wÇ®š[^g|Á\İFõ»övÿ\0j¯’\ì9\êi™P\ÙKr9†}•_q¢\Õ\"nÀ¦\Çn™n«\'Å–O3„’NIõï©¦\îpûn\ß\Û12}¬T·—N2a%Óœ(`±ÀÆ¢55ÁaÂ¼\ÅRZ‚mM°J”…\İq¨«]$¯oz‰špJM\Î\Í§[_*´µ\ã~aO0\åöÎ–¨¶ı¼\Í\Ö\ÍÀ‹i0\ß.a—\İxR¥€~şšZšC±#÷\nıfÓ¬\î5-huRˆ´x\ÓRˆş \ns#®U\Ôı€\Ñ&Á¶(–\Õ=.•IDt†R¥‚TUª\'Ô“\ë¦k\â«\n…c>\Ã4¹\r¤¡\nKŠğ\Û\Ç0®¤”&¤\Åi!\à•\'\ÃIoc¾º-\Û\Ì\nÚº-\Z\ímL´\îIz$\ÖT\Û\ÉW #¡PuÌ¾$v\Z~\Ï^[®\ÒÜŠø*‹\'—£\Í/±^½~\Ú\êk\ç[yúc@ˆ¿gNØ§®Š\äe\"|Pšt†˜*PQ=R¢;\'IĞ­ˆ\×\ÕŞD3\Òó=—·ƒ*\'û»hlÑ‡l*ˆ±ó‹KNNrA8# \ï\Ğ\r[Ëªü†\Ú\Ö*P=MuJPWº0şº\çõ©ş‘~òF¾¤.5=J.¸úÑ€µ¨@>™>º,\î”*õ\Zh[øi™“‡Õb\Ø§\Ç\Ğú\è~]ƒ…¾D#§-¿om-\Æl\Ê-\Ë2\ZœmÖ—”ƒ\×NF}´ú“\äL®†ù_œ\â\ßRt©]@?\ØkUúP­S U\Ğ\Ê\éJ|Vˆ\è }ôõLm¸ÁN:0„#¯Ml\ÈTx\Ü\ĞŸ\ì\\‘+5\ÕÀ\ã›\å}9t\î\í\Ë&jt”\ÄJ\ÊZm98JG\ÛDK+€\r„²#ò\Ğ-ˆ\ép\'şG“ŸN§[{\ÅÅ¾\ÛmôRe;&TÇ•\È\Ã!TUõV9>ª:­‹ø±n%\Ë}Å³¬‘~jjYÊ¬¬~`A\æCm\á$~¯l\rDm°®”\ËI[\â%µƒµt«*?…M€–A\Û\í¢5½W[4¶£……\Ø\n\'\í ¶\ÖoV\à^“İ¢\İûq:iJ’Š HTgT=\î:z\ã\Z,\ÙhC\Ïs^¸\ëRwby—‘_a½f9-”\Â2ù”9\ÂO§¶¢’ö’ÓºŸ\rŠQÔºö¡„¾V\ÆA\î\çUótø¼ª\í4šœx}RŸø4g°\Éi¥\0©Aµ+¢\Î¦š­¢˜Tf\æ\âü-6Šõºå¸·©µ2~e—;}1§\Î\Z¶Ov¸h¨®Ò¯Ü¯V(o)!d°s\Üzô\Ğûc~2_¸U\ÔZ\Õ-§¸b¹\áóø/ NrO*óúzö\ï«Aµ\Û\ï³\Û\ïGMvÂ»!TY\å(\åuµ\éR\nN§g°/kW\Ø»À…“½h{usËªVc-MÊ‡\á¥m¤«•}\08ût\Ô\ÂõM®\íı=Y¹\ÍNŸUYRYX\åSe]‘ï¾º­R)¦l$¥N´š\n\n#¶|k\í•_“I.\â¹\ë-*Qk\ÇXu ´¡Dœ\0	ò¶tÌ¥\n*>L\Îu<&%®§ª²k–ú•83–\é\ÑúTSúT¬u?\×R¿\ÜıË‹%‡¯˜lÌ™ˆìœ´ñö\Ó]&³l§]¯U#üÄ¬*2T²¤·\ê{u\ë\ßRz]Uå¶“pS‡d´\Ç\ë\Çq’{h\é\nÀ\0a)\éĞ¯‹>K%5¥\ÓO)fJ×ªu—n*{OdZmZ\ÔWkuaA\ró,’®¸Ç®™-\Ë\"ı¯\Òd§¸óe¬¤(“½úi\Ón6ª=6K\î_µ\'j¥D\"\Ê8Kd„i½‹8˜Ñ¶üBĞ˜Šõ¥!h\\juIØ¯¸Cm\ç)\æÇ¸:\ìıš^ı\\\ÛOO¨†iNJn¯M_GYp Ÿ\Ü\é\Ã{­\Ú;R\ã\Øöšc¼¨eª\ÜvpĞ—ô\æIşD\ç ÷##BI·¶\ßKrd\ZªXmwZ“)\çJ\Ë\r€¹õ\ÓlüŠ¿‘Ñ–\Êó´ì¶’\Ü\Ù˜\êJÒ–\Ñ\ÍÊ•u\è1¥¡ÍY\Û=ÁZ*‘\éµ{ºDw’W)aE–Õœ‚”\ä\0=tµ\Î5¨À2Ss\ÚTk²ª%f1z2Ö•­®l¡œzd\ro±	H@\È\Zô—‚Mz’3¢\Úo¨@S2ZAµ†±B¤\\4—¨Õªk2\â\Èl¡øÏ )$÷eK\ã`tƒ¥(\É\Çm5”•Ô•/ƒ9ŸÆ–\Æ\Ò-}Ø«\Ú\ìEğ\á4\ê†\Ø8	i\Ä\äö\í¡Å‘nË§Ü´\è\"²\äoœÌ²9Fs“\Øô\Zµ\Ëu¦/º=Á²¨QÖ—?ˆ²¾ÿ\0\Ñ\ÛU\Ûmšùk˜X!O/=˜k5P©ˆQ4\Ø9Â¬\ÇÆ¡\"¸P\ä\\‘¬ø\Ì½!Zˆ\ì\ÚP3“÷\í©¥>3/2–\0…§\Î¨\Ğ\Ú\Ï\Û\é6\Æñ»:¡QKŸ5jŠ0 3\Ôg\é[d49‡P¦³À7\Ì\ÛeŠ\Ú\ï\Ã\ä	«?mh2d\"	Âµu\ÆJ¿\È\ÓmC-NÂ¶)ñ\\Z‰.G€„(ıru?§¿\ãFKjÀ\å>ºôóc#MrÀpg\"ö‰‘Fù\nq	e ”yR9Y\Ñ[Œ\0HÀ\ÉÖ­ÁP†Û¾\Z\Ö3\×	\'¾¶\í¢[o+\Âyˆ#Q?qÎ¿4´i\08ƒ‘C/M­n¹K1\Z’E´\ã<Àƒß¦¦õh‰n!G“›¯¾±Qªñq1\ß)\Ó6Ü‘[ˆµ¸kÙª4õT¢\ì­<²|WXŠ*\Ï|\ã¿\ÛE+Ci6\îDºm‰\n˜\ãC(Lfƒ÷\ÊzŸ\ßRwXe]Gp:\ë4%)-\åMa]¹¸’\Çfq$.„\ÎôT­)\É)N™­ˆ4Û—\Çñ\à¹)\Ò\âX\åixN9\ÈÊ¾\ÚynJT°µ’“\Ô\é‹f(7l11tĞ¶¼z¢²ò†|4Oaõ\0\ê\ïN\Ù\ÌQüÿ\0ˆ7©:\Îy\âN.*h\ÓS>·J‰!a¸M4’o¹=úkÅ¹]z\ÏH Q­€ú%(ğ\æğ\ãs\æWo\ÛF\ê\ËôûÖ…ø5%”!&7**²\ã\å(V1\Ó=Î½\í\í*\Ü\Û\ÛP1sÉ„©¹\â:\âH!Dv\Ç\ßşº\×\í\Z˜-\î9Ã¡Å‡HüBáºK·—Â¼&Ó\îN™\ã\íü›\ætjõ2«S¢Be\Îh\ëKÄ½${¬„§\×\ßOP©&ø}-~:™§4y¡S\ÏOüÅı“¦kWt®‰Û>‰W£.5-—R\ÌyHñ©:\îı˜\Òc~\ám0¦\ç\ËÜš²”³„²¢‚§U\ìUËŸ¦«U±´•hû\Ï]“.¾\ÓÑ§FuÔµS$£›œ%²¯\á\Èzj\Ìn\Í\Æı\Û%Ø”GCtª[¡5	`\â»ÿ\0¦ò_é µz†j÷ôLšµ¼\Ôşœ\é_/ÿ\0“i½•Áö\ä\Êß–\äß…°»¶şø©\\ŒW\ZzUH„\Ó\ŞF”;-n\ì\Í\Ãø±Mº\"¼\ÛD!–\ÛP\nH*ò}-#m´u\"\rÉ“¤¸\è9×¤º\áNAÖ£aa`@\Ö\Ğ8\é£\\Àó`(¹×¼…6¯\ÛZ\á\åŒ\rzòg\ë¤1<@\'\Ä6‘Isji•‰M·ólTü&\åór-™?\Ô\rR«~c‰}©\ÌD<\ÌIJ³ËŒ\'\'\ì5y¸õıŒJJ\ãUY-…w\É\È\Õ,µ\â7TS®;$¶¤¥X\é\ëş4¨õ˜o\0“V\Ä2DšŠux\ÇÃœ¥)s—¡`\àûi\ÂJÔ”§MLP`]¼/\Ó\îôdÄ‘G©&7&RT”õ8÷=uxødô\è:\rÍ§\Ûa¯™®\é\ÙMy\ÓyzœùJ:\ç¸×š\Í`0\Øe=T3\×\ÓZŒI(G(\èF´*2¼E®ú\ã˜x\Ôi‡*Œ\rBğº*¬D…	Jñ_’\èKm¥#*R”z§;Krl+Ú\Õ\Åbİ´ú­9\Õa©”\ÙHy¥`õI$g\é¡\Æ\à\Ò*\ïGŸo=5JUd‰tù\nÁ\ÉW\Ü\é¨\Ñlı?cü]·µbP©/¬©\Út<†Ô²rU\Ùúı4€q€yZ9wÅ¹K¥¹\"\ä«F‰¿ù$Iy-¡\ê¥£õt1I­B­\Ğ*¨—kygÀXPíœ‚;ƒ\ï V\êmuSx©mA¼ ±T¥%ô»®©-ó\Å@~¯\ßEM§·+0(\ìA­©†‘°\Ôq‘„ÿ\0`5YöO‰`-kX ó	ÔŠø–”¶•`òšrmâ¼~\Ù\ÔN4	_ ù@\ÆF\"HB¼®/\Í\ë¥£!<ˆ\ä©<Í¨¥]2tv\á\Ê-£L±¿¯9/H}KHt‚J{Ÿ\×UöC\èaJChGEg¾¬\ÎÁÃ¢»³TŠÄ¶#ò\ë\çu\Æ\Æp®¤\é\n\ZııL\Ï_°®8_ƒ«—DùT·‘i\Ûùi¦‰$6€‘ü©\ît¦\Õ|]™\ÙQÚ”\ä6Px\Óº&Ş—lıÄŠ\ã\Û5\äB§\Ê\ê‡ÀRz£zcB\ZMt\í¥\Í6¸\Ë\r6\ÜĞ§£S\ß\è\âœBºúiW·\äLšh	a¬‰“m\Ëy\åT\êe	S…Ô·=Ì­´ûtô\Óf\ìR¯›’•VzoKB‹(8 \0J³öşú†\Ù\Ñ÷*ñ¦7_«Áqš„\æ‚\\KŠ\0g õô\Ô\ÎÒ©¦Õ«N‹Y˜§\äD§#ÁiC®bJ’\Ü\rH\\\Å:û‘\ÚÅ¿MÛ‹l.§p2¸“¡…>\Û\ë\ê¥$dŸ|ú\èuSM™Yù6\íjsŸ‡©m\nˆ\ÂG7a\Ğj}q\Ğmû\æY­\ŞĞ–\Âb0\â©\î,•\ĞFˆ\î\í]ŸQ´\éôYpX†„©ƒŸÒ¬wÎ¹¶#™µ\â\06wg\è\Ğ\ï†*ñ£±\Z©!N¸üw2\n””’;g=½tµ#¾«®\Ùû‘O©S­w\äˆ5\Ú\äG^|$/	9\Çptµ\ÅÁóBRNN½ƒ¬(õ\ëûk\Ğ £›úh!`©›)\'”«\Ò\È÷\Z\ÕYW>s¯©ZÒ¡Ï’>úx3¼Á—\Z´\æ\çpÿ\0Q“c[\'§¯6?\ëª=@˜Ì‡\ÓMÔ¹§uíœ^~/¦0\ßµ–A%õ2\Ú®|Aª=G·\ênJz³H¡¬\Ò\å4\ä®N¸H\'¡\í KıÁô\å\İ&Y\á±zğ÷v\Û!O;SL§JË™!e\0)²“\Øô\Zˆ•e² ƒ8<¾l½Á U&Yô†£CfCm¸€‚µ”~ƒ¶M\nwß‘g\ß[y\æ”ÌµI\ÛQ\æIş‡ûhoR¬šÁt»\ÈÈ±#¯%\0\äv\îu®WÙŒµ”¼™\Öõrª\"0¼¼½u\0“*,Ùª\\©AQ\î¼g@-4‰a\'Boš£\Õy©RRS„õ\0g[³i•”q€\ØW2@C¿\ÛC\Í\Û\ß}¸\Øú\n\êwU\Ù\n–\×.‰ry\Ïò§ÔŸ \ÕCºş6{eo\Ü\îÓ¢\Û7øm‘ŠŒu q\Ñ* \ã¾ºC\çˆbœ\"\É\Ş\çS¡H±Ia¹¥·	\Ç*°0=;\ëj:\ç\Ñ\æ¥\ÂR y‰=?msv\ïø\Ømy“I—oZõÚƒR]P«¦cA•CF*!Ãœ\ç·mZn8\Ñ\Ú\íëµ™¯Û·`~¼\"JJÒ½º÷\ÔÌ¼°“.v¡56õ\æYH·s‹)iõw\Ó\å.Z<CŸ0\é ı¿u@¬\Îú–À–Hú\è‘ª\Ë-6œƒ„\ãUl°*GE5ô&\"\ÔHÁOPuköb\×bF\ÆQ¨u%+Ã“N\çP’­R\Ê\ÅÂYŒÚ™c\×F½\â~ö³[E½:+S B„\ß\Ê!HÃ‹N0R\îA\Ôc\Ôı/\Ó÷(\Ìb;øo_\Ï\íu^‘™\Ôk½Cå…µ4{”út·i\É\nyIq#ª¿¾5q6¢…{„ÔH~I\Å…`€HõÆ³m\Î\è\Òo\Úsr\\lB– hn8q‡øµ&\nG2}q­şv\'P ]Á”ü‰Èªük;,\Z2h\ì¼\ÚL\ÆjÛ¥ùKc-6yR‡?™>\Ú}®\ÙH•5\"\ãŠü\éŸ7n\äúıµ\"\n@\í¥Î“\ÛüjöÌ®n0¸V­ipŞ±?7Áo”³)¼•(÷\'é¿\ÓE\ë›!­¼§\ÒkóÌ•¢C¯aJúŸ¯m<ü”OO.*\n”FO(\É\ÔNü¬O¶©oÃŒ•r¼a¨Ò¬uA?\ãHÄ•wq \Ûy¼¯³qZ\Õ)Uj|¹\ãñ4)À¿\'\0~\Ù\Ò\Ó.\Û\î\Ìj|†6\âm¬8fQ/b€£N}ôµ_{–«@õô(\Ú\ÖL—05\í_Btb™\\Q\Æ}uğ/I\Ï]y\æQõ\ÒIN^”¶„U0qÅ³ù\ØÚ‹d\Í28$÷ı~Ÿ\ÓTº+•8LÌ¥Á\äv]!˜\ê?˜õ\Ç~„ô\ÕÀ\â\í\ê…GoÙ·(Q\\û\Õ&Ë6?€g©ıñ¡\r652\rV¦\Í\ÙDùzœw¹\Ï\Í… úŒôĞŒ\åÀ“¡\á7mz“\î$Ê–š¢i–š\èThò¿\Ø0òH\\ óT}s:q_\n‚\í~\rZU‡&-\nlt/+O/\éQş¤kRó\İ©ğ‹9\Ô0\0)rS@g\ìŸmV(8ˆ¥\ìM=nRLÚ„\ÙIKl-Î«dúôNOô\Ö«z\×‹GO¤w\éÀš“Ğ²\î\Ôø\ã÷$·2|VV”ûcCúÕ¯\n§Co‚¢´\î>ÚœÅ®\Ò/;r%\ËA“\ãÃ©ECñ\ÈP\È\ÓC\Ôô¶…¤‚z\ê÷wM³f\ÏÄ­­\Ãu·{M¥Ô«”fªf‡-OÇ‰<x‰p” A\È=š`\Ø[{¯‡ª\"š§­\å%—(\èR\\BÑ„…u õÕ†¸iN±%\ã¤Ÿ2q\ßMUq@ŸM0fAa<\î…)@\0O^\Ùúê­\Êv\Ú\ãY…™P	U®®\r¶\Ëvwjİ­m\Ö\ÍQ©”\Ê<SPŠˆ!¶¦<±„­`t!=Hº;m\r›o´¢P­ú#<±T \ï|öşÚ›\"½¨Ê‰J€\Ó*#”x#?m;[lr\Äl¸\ßQ•s¨u\'Uî¸•\äÇ–\Æ\ÆB´nl\Å:vQ„©c% ©.©\á$º¥¨ò§¦N¢\ÎFqùª™!\'$`{­‡\êmÂ§­j$`tÆ†ddX8T,h\ç\æ[—;IRRğ s~£ƒú\èµ@¸!\Ñ\ã?Z®\Ô[ù¢T´\Û`ò${~ºlŒø÷\ÍFmFm)B$i.·R\Ï ZP0·P\n\ÊF=´C•B™Y«En4\çk™)u®O(\ï¯õ?Q|ş \0<,/^:\×_i„[Jôk\æ\Ó&¹lpa¯\Å\ê	ş 4m\ÛN$\Ş.¦‹}(83ÊŠƒcúsştjÑ‹x¯\ÈJAm^\ÚÎ•Â§¸§‘R\äK9\0\êo]7 z£ªz~\à\Ø\ïøü¯Á\Ä\rÔºF7QB®¼üsbÔ£Î‰p\å¶ón¡\Æ\ÎBµ°’q’­T\Ëxo-¾’ˆ°_D¨\åy-:|¤_¦Ö–şZ\ä·¬¤\ÓdºJ^[Qú+_Bzwú‹\Ğú\Ú\n\ìnß|Ág\Õ=3„Äª÷/\í\ã\Ü\ë¸qjQ•|tºÚ‡™*õ<„>Ÿ‡R´\n…dô\Ö\ËO §[\àU\×`\ìL\×+ñ“øn‰sQ¸\Ö\İY\Ö\n\Úğ\ä\ÂX\Ê?Lih°œ+KQ2x–\Ò\â\0\'¶\nI\ÏmbI#¢N½¤“œ\è´2—F1Œşúô\nBsa\nH8#®¾•«$qÖ¹Š<Ê£¾;\ïp\í¿E«²$À¹\Ö\Óa(<¼œ ó\ç×¯ù\×\Ëp®Îœ«ø4õ6”¤©ˆ4\×\ä\0z<²? \Z\'ñw`Û»‰iR\è•všª\\\çBG‰\á$ ±éŸ¾‡\Òf#H‡„¡¦\Ò„ tHšò\ê¨\ÎG“ù·Ÿ\âm};€™\'\Ş\í#u\ËZ‹A¥I­\ÔKl\ÆmN:¢@À:\çg›\Ã3p\ï\'o)ª	¥\Ç\nj\Ñ=›óŸ©?\Øj\ÔqÍ¸I£X­\Ù0e-¹5%”¼¤\Ğ\ê£ş\ï®xq}wS\í\rª’òª\ï:H\ÍgG×•tŠ\rù+ö\ÓÓ±•i\Æk[K\Éğ\ì\İ»§Â…»RŒğ*§9&ø\ÎH-< >\İÑ’ry³\×T\à;¹®N\Ú[\Ïm\æIR¦WZŸ?ùo·Ê¯ÿ\0\Û\ß\ë«\ä\ÍQ2yŠQË…\×\×^\Ò@¬ú˜a´÷}Æ‹’c\ã\ß\Ø\êZ³œ¨J\nTr9tB®>h`pOm4¥L‚T±\Ôz\ê9XG\æ_’İµbB#•JZ¹sï©„h”–’\Ù\0u\ÓC2ZB‚\ÚÀ<\İu¾õÀ\Üh©.+\ÌGa ¹.\É0½NÌºf:Ô‘¥”˜\ê@\Ğöì¸§İ·„\r©´Ÿ95EÉ¯%_ı¬Tõ[„úAõÖ–ğ\ï4R?…	J¨>y\"\Åds-J\' ú\è‘\Ã\'•kn\n¯[\İôş5Zk¤Ò‡1eªZ\Øg¯\×X?Pu´Å¨¢“\Ä7…w<’Ù´ys)\ÍĞ­š[4\è\íşR\ä29‰JF2	\è	úz\è©fDM#ThdşXQZ–:«\î}õ’‘@¢\Ñi\á¸QÒ„6’N=u\ê]\É!–!\çO)\Êzúò‹,±Ü“ó%²\Şã¨¤D~£1OV”a°\0\Âñ\×ö\×\Ã:•Oó\Æg\æè©öÖœšµè¥5\çó$¨\ç\ZŞ§\Ğ7•\Zd’ƒ\ç\0y‡\ßL]ƒ©8<\Z”€ô¤=¶\Õ#\Â8Tœ«¨\Ï\Ø\ë*)I3|¤s§Q#\ÓY£@JIh0H9\åPõÒ\Ë\à\èÊ¬U\Ï>$¿nw¦ã³œšIv9\ï\Åe?¶{,Ì·\ïx\á1ùiA>h®Ÿ1?ûO®«!l$òŸCœkj“Q\äª¥…¥YJ\Â\ÎG\ï¯Dô§¯ú¿D°Ws{•ƒÿ\0“1Õ½=…œ…«­-¼iˆ\0“öÎ–„vøKgÀ§]Jñ[YJ!=U’q\Ôzıôµ\ï½?\Ö©\â­\éonüƒ\ä\ç÷ô¼\ìk\n:ÿ\0\Ô\ØjbyñÏ¬\ê|~ ­4´\á\èN5“\Ç*=¶ó?RşO}eBÖ¾\ÃMHu\Î|ƒıõ\êD\ã…¾µa(AR}†u\í©o¨\åRÍ¨(\Üûú\å\Û/D³^q\è\0ıG÷?\ãQ:‚\Ú<|u\Î\0§[o¨\Èq\É.+\Ì\âÔ£\×\Ü\çQšø£\Òe¦,Ç‰JrR`v:ù7\Ô9¯›\Ôî¸÷şg´ôœELT©G\0	U8\é¹\Ñşi™j\n(§s!‚z¨’\ì5\ÌN>\'\İ\è­\Ñ\á\Ö[j Ó±\Èm	!=~¹ÿ\0\Z\é—\"•ÿ\0ˆÈ¨´Û*;t”¸r	\äÊ°?}s\æ\ì\Ú;×N.({Cbº\Ìg\ÑCqÙ’¤s!§™n¸\â±\×¤cÜ­/£L¡m¼*‚wõ\'\ëö:`{Uù<M\ïƒv\ë\"\Ç\âlÙ³¥–Øº(\ÇG\\ûD:€d¬~ú\ê¬:\Ë/ºX+*ùs®>XQ}ğg\ÆU±D\İ\ÚZé«¤Üˆ&j\Óù/GQ)ñP¯\âN?O]ucn,Gw\Z°n$\Ïp\ÒY!FC.\à<£\Ô \ß#\í¯E\ê\İGŸÕ†uÿ\0s7\Óq¬´\Z\ÈÑ“	‹u´€\â‰Î™dTÚˆ¢œöjh«^—¢û\à%i\è\n@‘\Ø\rC¯ªŞùL²‡\Ş¢Â•Ÿ°×œ_ı@§d%d‰«\Æôû±\Ùh\Ø\å}¨J.>²\0\îO¦¡w\Ş\æ\ÏZLz*X)€}G¾½L«V«sD–¢ÃÚ‰p¼±”£©ÿ\0¿M;\í\ÑR¯\ëª\ìôÁ*Ÿ–IQÿ\0r\à÷‚R{k;Ÿê¼œ\Ä=£´C´tª±‡s\Çn\ZöU:£W½ó.q!\È\í¼¢¢‘œ…¯\ÓVj;BT‰r¦{b\Új–\È,«\Í\Ê8újG„­µ&JIµ†Ë½²l\Û\Ç\ßx<,\Ã)\éÓ£´`µá´¬ø\Ë\'¯~\ß\ÓJ@2x%\0r3ƒ­”\Í…ò\íP’z\é®K’dº†›Iğ”2µ{j´ª 3n\Ûx2WWš…\'®N{\êC­C\Î%T\ê€\ÏT\ä¨´™yi\Ñ=4ùIšôJzCMù\Ü\î¥\'J²“\âo‰r\å6<(Áı9O§\ÓY\\\Ãm¶>e|©F\\t„«\ÛZˆj[\n	[\Ê\Ó\ÌBOclHa‡˜!\ÇH9%>§K\É<\ÈûN\ç\Ó,$¡	>(\'ª\Ç\\\çZõz\Í\ÙJ_ªLR\Éğ\ÛJr¢>\ÚÑ¸+°-˜\í6\ãJuC\Ãm>\Ş\çX#@u×¥®bÃ²hen£9A9ÀöÓ¾\"v€y’Z5j|©pÏ€\ÚZ/!m¹#˜c¶–²[Œ;\ZLV\Ü@)K\í€ \æ\ZZ?\ÒlcClüÿ\0\ä\ÔB›†ş¡!-¿\Ì?-_ÿ\0\'Y\0u\'˜²¬úùN––¾\ÓÙ0O¿0ğVu\çè“¦ûÊ \ìbc¦3Š*d  \ç\'¦––†uk¾s/§üKxˆ­zo\ì@ä–¥2\ß*#:|½\ÃgC\Ë\ãmjw•!øKº\à\È	VRr2®ƒ¾4´µòv]a\ï$™\ì¸6²\0¯\\xYUh4)tky\ç^\\fy#¨\á+°ú\rF¾\Ü1½¶ûgVß«¢\Şy7-÷5\ĞË°¯59¥ò4\Ø\È\é\ÌRV}úiih\ÕlõtH\î \ãq\Ö7¹”¥‡ƒüJp‘µœUX\É\Û\íÑ²—\'sÀ¨°\ÙD˜n\ãm¯>£±Ó–\Ù\ì\İ`¶Š‰´6I\ÏD¢\Å¦T´©N»ü\Î,ãª‰\ëô\ZZZnFK\ãca\ìñ¹r‚ò\áF\ãv‡^«+D›%‡]\åğ‹jûŸs¦ZÕ½T \È\ê\r5E\çpŸ¨…D}\Î:}--®…\îòa\ä\È~\Ñ\âl\Óö³t\Ë\ê’SªJ•¸\å-¤}@}í´\ìHğ`R\Ô\ÓM6\Ú\É?\ÛKKIe |™W\'&\ßZ\Å\Zdv\ÂDuö\ï\Èu\â4zƒï©¤\Æs¦Jı´´µ\0\ÇB`ñk	†¢\Ô\æ1™†\á\Éó~Y÷\ÖZdIM\ÄY\\Wr¡ùgKK\\¸É¿&9\í`8˜bR$©\Ç¸NùG”òH¤ª\Z /˜Ô¶t´µ Æ¯\ì\È}\æŠ5G¤\äGXm=u\æP„»!\È\î–\Ğ2|‡¯\ÛKKJq«É‘‹\ßr?5Fu\ç¥S\İ!-’’[\'—R›r˜ş>bcœ‚¤--Fq\Ó~L\ãsG¶[SµH\í%‡+\Íõ\ä?\Ì4´´´w¤c!¥¼ùÿ\0\ä\Ôlchş\'ÿ\Ù','Trisha','Gunio',23,NULL,'09466485696','Pulo, Lipa',NULL);
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

-- Dump completed on 2021-11-16 10:43:12
