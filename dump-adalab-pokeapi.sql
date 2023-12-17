-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: adalab-pokeapi
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `evolv` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `stats` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (1,'bulbasaur','grass, poison','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',NULL,'{\"hp\": 45, \"speed\": 45, \"attack\": 49, \"defense\": 49, \"special-attack\": 65, \"special-defense\": 65}'),(2,'ivysaur','grass, poison','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png','bulbasaur','{\"hp\": 60, \"speed\": 60, \"attack\": 62, \"defense\": 63, \"special-attack\": 80, \"special-defense\": 80}'),(3,'venusaur','grass, poison','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png','ivysaur','{\"hp\": 80, \"speed\": 80, \"attack\": 82, \"defense\": 83, \"special-attack\": 100, \"special-defense\": 100}'),(4,'charmander','fire','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',NULL,'{\"hp\": 39, \"speed\": 65, \"attack\": 52, \"defense\": 43, \"special-attack\": 60, \"special-defense\": 50}'),(5,'charmeleon','fire','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png','charmander','{\"hp\": 58, \"speed\": 80, \"attack\": 64, \"defense\": 58, \"special-attack\": 80, \"special-defense\": 65}'),(6,'charizard','fire, flying','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png','charmeleon','{\"hp\": 78, \"speed\": 100, \"attack\": 84, \"defense\": 78, \"special-attack\": 109, \"special-defense\": 85}'),(7,'squirtle','water','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png',NULL,'{\"hp\": 44, \"speed\": 43, \"attack\": 48, \"defense\": 65, \"special-attack\": 50, \"special-defense\": 64}'),(8,'wartortle','water','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png','squirtle','{\"hp\": 59, \"speed\": 58, \"attack\": 63, \"defense\": 80, \"special-attack\": 65, \"special-defense\": 80}'),(9,'blastoise','water','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png','wartortle','{\"hp\": 79, \"speed\": 78, \"attack\": 83, \"defense\": 100, \"special-attack\": 85, \"special-defense\": 105}'),(10,'caterpie','bug','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png',NULL,'{\"hp\": 45, \"speed\": 45, \"attack\": 30, \"defense\": 35, \"special-attack\": 20, \"special-defense\": 20}'),(11,'metapod','bug','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/11.png','caterpie','{\"hp\": 50, \"speed\": 30, \"attack\": 20, \"defense\": 55, \"special-attack\": 25, \"special-defense\": 25}'),(12,'butterfree','bug, flying','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png','metapod','{\"hp\": 60, \"speed\": 70, \"attack\": 45, \"defense\": 50, \"special-attack\": 90, \"special-defense\": 80}'),(13,'weedle','bug, poison','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/13.png',NULL,'{\"hp\": 40, \"speed\": 50, \"attack\": 35, \"defense\": 30, \"special-attack\": 20, \"special-defense\": 20}'),(14,'kakuna','bug, poison','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/14.png','weedle','{\"hp\": 45, \"speed\": 35, \"attack\": 25, \"defense\": 50, \"special-attack\": 25, \"special-defense\": 25}'),(15,'beedrill','bug, poison','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/15.png','kakuna','{\"hp\": 65, \"speed\": 75, \"attack\": 90, \"defense\": 40, \"special-attack\": 45, \"special-defense\": 80}'),(16,'pidgey','normal, flying','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/16.png',NULL,'{\"hp\": 40, \"speed\": 56, \"attack\": 45, \"defense\": 40, \"special-attack\": 35, \"special-defense\": 35}'),(17,'pidgeotto','normal, flying','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/17.png','pidgey','{\"hp\": 63, \"speed\": 71, \"attack\": 60, \"defense\": 55, \"special-attack\": 50, \"special-defense\": 50}'),(18,'pidgeot','normal, flying','https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/18.png','pidgeotto','{\"hp\": 83, \"speed\": 101, \"attack\": 80, \"defense\": 75, \"special-attack\": 70, \"special-defense\": 70}');
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'adalab-pokeapi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-17 19:50:28
