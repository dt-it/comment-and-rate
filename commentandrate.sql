-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: commentandrate
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'ROZRYWKA','Czas na chwilę relaksu i porcję rozrywki!'),(2,'SPORT','Najciekawsze nowinki ze świata sportu.'),(3,'BIZNES','Najciekawsze informacje biznesowe z kraju i nie tylko!'),(4,'POLITYKA','Wszystko co chcielibyście wiedzieć ze świata polityki'),(5,'KUCHNIA','Tu znajdziesz najlepsze przepisy');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `discovery_id` int NOT NULL,
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) /*!80000 INVISIBLE */,
  KEY `discovery_id` (`discovery_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`discovery_id`) REFERENCES `discovery` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,3,3,'Świetny film! Napięcie oraz świetna zabawa jest w każdej minucie filmu!','2021-02-17 20:03:32'),(2,4,3,'Mi film również bardzo się podobał. Ocena 11/10.','2021-02-17 20:05:16'),(3,4,1,'Nie lubię boksu, jest zbyt brutalny.\r\nNie będę oglądał i nie polecam innym.','2021-02-17 20:06:01'),(4,2,4,'Testowałam - świetny przepis.','2021-02-17 20:12:46');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discovery`
--

DROP TABLE IF EXISTS `discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discovery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `category_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `discovery_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `discovery_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discovery`
--

LOCK TABLES `discovery` WRITE;
/*!40000 ALTER TABLE `discovery` DISABLE KEYS */;
INSERT INTO `discovery` VALUES (1,'WILDER: FURY, JOSHUA I RUIZ JR NA SZCZYCIE','http://www.bokser.org/content/2021/02/16/150446/index.jsp','Najciekawsze walki bokserskie - kto zwycięży pasy wszystkich federacji?','2021-02-17 16:03:21',2,1),(2,'Ogromne morskie turbiny na niesubsydiowaną farmę wiatrową','https://www.gramwzielone.pl/energia-wiatrowa/104811/ogromne-morskieturbiny-na-niesubsydiowana-farme-wiatrowa','Siemens Gamesa Renewable Energy (SGRE) poinformował o pozyskaniu zamówienia na 69 turbin w technologii Direct Drive, o jednostkowej mocy 11 MW i średnicy łopat wirnika 200 metrów - jest to projekt farmy wiatrowej Hollandse Kust Noord o mocy 759 MW.','2021-02-17 16:05:50',3,2),(3,'Dżentelmeni - Guy Ritchie przeszedł samego siebie','https://www.filmweb.pl/film/D%C5%BCentelmeni-2019-817420','Fantastyczna komedia kryminalna: Handlarz marihuany postanawia sprzedać narkotykowe imperium i przejść na emeryturę. Pożegnanie z półświatkiem nie będzie jednak tak łatwe, jak mogło mu się wydawać. Polecam!','2021-02-17 16:06:44',1,3),(4,'Azjatycka zupa kokosowo-imbirowa','https://kuchnialidla.pl/zupa-kokosowo-imbirowa-z-esencja-kolendrowa','Czy przed żołądek można trafić do serca? Z pomocą zupy krem z batatów i marchewki udowadniamy, że tak!\r\nŚwietny przepis na zupę kokoswo-imbirową z esencją kolendrową.','2021-02-17 20:08:36',5,4),(5,'Przepis na pizzę z bazyliowo-pomidorowym sosem','https://kuchnialidla.pl/pizza-z-bazyliowo-pomidorowym-sosem','Doskonały sposób na pyszną pizzę z domowym sosem i dodatkami!\r\n','2021-02-17 20:11:40',5,2);
/*!40000 ALTER TABLE `discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `user_id` int NOT NULL,
  `discovery_id` int NOT NULL,
  `type` enum('LIKE') CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  PRIMARY KEY (`user_id`,`discovery_id`),
  KEY `discovery_id` (`discovery_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`discovery_id`) REFERENCES `discovery` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (2,4,'LIKE'),(4,4,'LIKE');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `registration_date` datetime NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Jan Kowalski','jan@kowalski.pl','2021-02-17 16:02:11','abe31fe1a2113e7e8bf174164515802806d388cf4f394cceace7341a182271ab'),(2,'Dominika','dominika@dominika.pl','2021-02-17 16:03:44','a266cbe3a16b755e38e83488e0c0f5f4a379f07a2fbc52536d543f44bcc5a34e'),(3,'New_User','new_user@gmail.com','2021-02-17 16:06:13','5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),(4,'Janusz Łakomy','lakomy@janusz.pl','2021-02-17 20:04:29','b513770b131e29095f4ce372e7f1966facc1d54d6d8079e64629256325bd57af'),(5,'Adrian','test@test.pl','2021-02-17 20:23:41','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`username`,`role_name`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('Adrian','USER'),('Dominika','USER'),('Jan Kowalski','USER'),('Janusz Łakomy','USER'),('New_User','USER');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vote` (
  `user_id` int NOT NULL,
  `discovery_id` int NOT NULL,
  `type` enum('UP','DOWN') CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`discovery_id`),
  KEY `discovery_id` (`discovery_id`),
  CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`discovery_id`) REFERENCES `discovery` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (1,1,'UP','2021-02-17 16:03:27'),(2,1,'UP','2021-02-17 16:03:52'),(2,2,'UP','2021-02-17 16:05:53'),(2,4,'UP','2021-02-17 20:11:46'),(2,5,'UP','2021-02-17 20:11:44'),(3,1,'UP','2021-02-17 16:06:50'),(3,2,'UP','2021-02-17 16:06:47'),(3,3,'UP','2021-02-17 16:06:53'),(4,1,'UP','2021-02-17 20:09:42'),(4,2,'UP','2021-02-17 20:09:27'),(4,3,'UP','2021-02-17 20:04:44'),(4,4,'UP','2021-02-17 20:09:01');
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'commentandrate'
--

--
-- Dumping routines for database 'commentandrate'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-01 20:05:22
