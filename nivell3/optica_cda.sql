-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: optica_cda
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL,
  `nom_client` varchar(200) NOT NULL,
  `adreça_client` varchar(200) DEFAULT NULL,
  `telefon_client` varchar(200) NOT NULL,
  `email_client` varchar(200) NOT NULL,
  `data_registre_client` date DEFAULT NULL,
  `recomanacio_client` int DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Ferran FR','Ramon Trias Fargas, 25-27, 08005 Barcelona','+34684123456','ferran@f.com','2016-09-21',NULL),(2,'Alvaro M','Roc Boronat, 138, 08018 Barcelona','+34684789321','alvaro@a.com','2017-01-10',1),(3,'Ignacio C','Plaça de la Mercè, 10-12, 08002 Barcelona','+34684284646','ignacio@c.com','2020-09-01',2),(4,'Cristiano G','Passeig de Sant Joan, 56, 08009 Barcelona','+34684987000','cristiano@g.it','2019-05-21',1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL,
  `nom_marca` varchar(200) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Ray-Ban'),(2,'Oakley'),(3,'Polaroid'),(4,'Arnette'),(5,'Police'),(6,'Persol'),(7,'Northweek'),(8,'Hawkers');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidor`
--

DROP TABLE IF EXISTS `proveidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveidor` (
  `id_proveidor` int NOT NULL,
  `nom_proveidor` varchar(200) NOT NULL,
  `adreça_proveidor_carrer` varchar(200) NOT NULL,
  `adreça_proveidor_numero` int NOT NULL,
  `adreça_proveidor_pis` int NOT NULL,
  `adreça_proveidor_porta` varchar(45) NOT NULL,
  `adreça_proveidor_ciutat` varchar(100) NOT NULL,
  `adreça_proveidor_cp` varchar(45) NOT NULL,
  `adreça_proveidor_pais` varchar(45) NOT NULL,
  `telefon_proveidor` varchar(45) NOT NULL,
  `fax_proveidor` varchar(45) NOT NULL,
  `NIF_proveidor` varchar(45) NOT NULL,
  PRIMARY KEY (`id_proveidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidor`
--

LOCK TABLES `proveidor` WRITE;
/*!40000 ALTER TABLE `proveidor` DISABLE KEYS */;
INSERT INTO `proveidor` VALUES (1,'Luxottica','Plaça de la Pau',3,6,'4','Cornellà de Llobregat','08940','Espanya','+34931517191','+34900122708','A58361569'),(2,'BarcelonaGlass','Plaça de Catalunya',1,7,'8a','Barcelona','08001','Espanya','+34900100200','+34900200100','56439143R'),(3,'GlassAlpino','Avinguda Itàlia',200,3,'2','Esplugues de Llobregat','08950','Espanya','+34684500700','+34936700500','45128967Z');
/*!40000 ALTER TABLE `proveidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacio`
--

DROP TABLE IF EXISTS `relacio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacio` (
  `id_proveidor` int NOT NULL,
  `id_marca` int NOT NULL,
  PRIMARY KEY (`id_marca`),
  KEY `fk_proveidorRelacio_idx` (`id_proveidor`),
  CONSTRAINT `fk_marcaRelacio` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  CONSTRAINT `fk_proveidorRelacio` FOREIGN KEY (`id_proveidor`) REFERENCES `proveidor` (`id_proveidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacio`
--

LOCK TABLES `relacio` WRITE;
/*!40000 ALTER TABLE `relacio` DISABLE KEYS */;
INSERT INTO `relacio` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,7),(3,8);
/*!40000 ALTER TABLE `relacio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id_ticket` int NOT NULL AUTO_INCREMENT,
  `id_ullera` int NOT NULL,
  `id_client` int NOT NULL,
  `id_treballador` int NOT NULL,
  PRIMARY KEY (`id_ticket`),
  KEY `fk_clientTicket_idx` (`id_client`),
  KEY `fk_treballadorTicket_idx` (`id_treballador`),
  KEY `fk_ulleraTicket_idx` (`id_ullera`),
  CONSTRAINT `fk_clientTicket` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `fk_treballadorTicket` FOREIGN KEY (`id_treballador`) REFERENCES `treballador` (`id_treballador`),
  CONSTRAINT `fk_ulleraTicket` FOREIGN KEY (`id_ullera`) REFERENCES `ullera` (`id_ullera`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,1,1),(2,3,4,3),(3,10,3,2),(4,3,2,3),(5,5,3,1),(6,8,4,3),(7,7,1,1);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treballador`
--

DROP TABLE IF EXISTS `treballador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treballador` (
  `id_treballador` int NOT NULL,
  `nom_treballador` varchar(200) NOT NULL,
  PRIMARY KEY (`id_treballador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treballador`
--

LOCK TABLES `treballador` WRITE;
/*!40000 ALTER TABLE `treballador` DISABLE KEYS */;
INSERT INTO `treballador` VALUES (1,'Natalia'),(2,'Héctor'),(3,'Adrián');
/*!40000 ALTER TABLE `treballador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ullera`
--

DROP TABLE IF EXISTS `ullera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ullera` (
  `id_ullera` int NOT NULL AUTO_INCREMENT,
  `id_marca` int NOT NULL,
  `grad_vidre_L` decimal(10,2) DEFAULT NULL,
  `grad_vidre_R` decimal(10,2) DEFAULT NULL,
  `muntura_tipus` enum('flotant','pasta','metàl·lica') DEFAULT NULL,
  `muntura_color` varchar(45) DEFAULT NULL,
  `color_vidre_L` varchar(45) DEFAULT NULL,
  `color_vidre_R` varchar(45) DEFAULT NULL,
  `preu` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_ullera`),
  KEY `fk_marcaUllera_idx` (`id_marca`),
  CONSTRAINT `fk_marcaUllera` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ullera`
--

LOCK TABLES `ullera` WRITE;
/*!40000 ALTER TABLE `ullera` DISABLE KEYS */;
INSERT INTO `ullera` VALUES (1,4,3.25,3.50,'flotant','marró','verd','verd',100.00),(2,8,0.00,0.00,'pasta','black','black','black',80.00),(3,5,2.75,2.85,'metàl·lica','gris','transparent','transparent',125.00),(4,7,0.25,0.75,'metàl·lica','black','transparent','transparent',130.00),(5,6,0.00,0.00,'pasta','vermell','blau','blau',189.00),(6,1,1.00,1.00,'flotant','verd','mirall','mirall',200.00),(7,8,0.75,1.00,'pasta','verd','marró','marró',150.00),(8,2,0.00,0.25,'flotant','gris','groc','groc',299.00),(9,2,1.25,1.75,'metàl·lica','marró','blau','blau',129.00),(10,3,0.00,0.50,'pasta','taronja','marró','marró',300.00);
/*!40000 ALTER TABLE `ullera` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-01 10:49:00
