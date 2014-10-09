-- MySQL dump 10.13  Distrib 5.6.20, for Win64 (x86_64)
--
-- Host: localhost    Database: storedb
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Current Database: `storedb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `storedb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `storedb`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(130) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `idcustomer` int(11) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `phonenumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `idorder` varchar(20) NOT NULL,
  `price` double DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `customer_idcustomer` int(11) NOT NULL,
  PRIMARY KEY (`idorder`),
  KEY `fk_order_customer_idx` (`customer_idcustomer`),
  CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_idcustomer`) REFERENCES `customer` (`idcustomer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetail` (
  `idpizzaorder` int(11) NOT NULL,
  `specialpizzaorder` varchar(100) DEFAULT NULL,
  `toppingpizzaorder` varchar(100) DEFAULT NULL,
  `order_idorder` varchar(20) NOT NULL,
  PRIMARY KEY (`idpizzaorder`),
  KEY `fk_pizzaorder_order1_idx` (`order_idorder`),
  CONSTRAINT `fk_pizzaorder_order1` FOREIGN KEY (`order_idorder`) REFERENCES `order` (`idorder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialpizza`
--

DROP TABLE IF EXISTS `specialpizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialpizza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialpizza`
--

LOCK TABLES `specialpizza` WRITE;
/*!40000 ALTER TABLE `specialpizza` DISABLE KEYS */;
INSERT INTO `specialpizza` VALUES (1,1,12.95,'house'),(2,2,17.5,'house'),(3,3,22.5,'house'),(4,4,27.5,'house'),(5,1,13.25,'billy'),(6,2,17.95,'billy'),(7,3,22.95,'billy'),(8,4,28.5,'billy'),(9,1,12.75,'vegetarian'),(10,2,16.25,'vegetarian'),(11,3,22.25,'vegetarian'),(12,4,26.75,'vegetarian'),(13,1,12.75,'allmeat'),(14,2,16.75,'allmeat'),(15,3,22.5,'allmeat'),(16,4,26.5,'allmeat'),(17,1,13.25,'mexican'),(18,2,16.25,'mexican'),(19,3,22.25,'mexican'),(20,4,26.25,'mexican'),(21,1,12.5,'greek'),(22,2,16.5,'greek'),(23,3,22.5,'greek'),(24,4,26.5,'greek'),(25,1,12.75,'italian'),(26,2,16.75,'italian'),(27,3,21.75,'italian'),(28,4,26.75,'italian'),(29,1,12.5,'mediterranean'),(30,2,16.5,'mediterranean'),(31,3,22.5,'mediterranean'),(32,4,26.5,'mediterranean'),(33,1,13.25,'hawiian'),(34,2,16.25,'hawiian'),(35,3,22.25,'hawiian'),(36,4,26.25,'hawiian'),(37,1,12.5,'cheeseburger'),(38,2,16.5,'cheeseburger'),(39,3,22.5,'cheeseburger'),(40,4,26.5,'cheeseburger'),(41,1,12.75,'fourcheese'),(42,2,16.75,'fourcheese'),(43,3,21.75,'fourcheese'),(44,4,25.75,'fourcheese'),(45,1,13.5,'summerbbq'),(46,2,16.5,'summerbbq'),(47,3,22.5,'summerbbq'),(48,4,26.5,'summerbbq');
/*!40000 ALTER TABLE `specialpizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeid` varchar(45) DEFAULT NULL,
  `password` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'1234','2483:581e84606a417cca836ec6e5cabba84513efa8854ba900cf:bb6051ec36287da3dd550cc304d8824acd49f75e9cfb0ba8'),(2,'12345','6953:d5ccc3c313276100892fd6cbe9f13e5858e8567a0dddedd4:86a5d787d624e79a8ba185cdc31bc7b6d48caa802d3a0584');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toppingpizza`
--

DROP TABLE IF EXISTS `toppingpizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toppingpizza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toppingpizza`
--

LOCK TABLES `toppingpizza` WRITE;
/*!40000 ALTER TABLE `toppingpizza` DISABLE KEYS */;
INSERT INTO `toppingpizza` VALUES (1,1,9.95,'1-topping'),(2,2,13.95,'1-topping'),(3,3,18.25,'1-topping'),(4,4,21.5,'1-topping'),(5,1,10.95,'2-topping'),(6,2,14.95,'2-topping'),(7,3,19.5,'2-topping'),(8,4,22.75,'2-topping'),(9,1,11.25,'3-topping'),(10,2,15.25,'3-topping'),(11,3,19.95,'3-topping'),(12,4,24.95,'3-topping'),(13,1,12.75,'4-topping'),(14,2,15.95,'4-topping'),(15,3,20.25,'4-topping'),(16,4,25.95,'4-topping'),(17,1,13.25,'5-topping'),(18,2,16.5,'5-topping'),(19,3,21.75,'5-topping'),(20,4,26.5,'5-topping');
/*!40000 ALTER TABLE `toppingpizza` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-29  3:52:24
