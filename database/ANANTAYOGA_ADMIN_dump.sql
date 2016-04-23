-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ANANTAYOGA_ADMIN
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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


CREATE ANANTAYOGA_ADMIN;
USE ANANTAYOGA_ADMIN;

--
-- Table structure for table `PERSONAS`
--

DROP TABLE IF EXISTS `PERSONAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONAS` (
  `PERSONA_ID` int(100) NOT NULL COMMENT 'ID de persona',
  `NOMBRE` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `APELLIDO_1` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `APELLIDO_2` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DNI` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TELEFONO_1` int(11) DEFAULT NULL,
  `TELEFONO_2` int(11) DEFAULT NULL,
  PRIMARY KEY (`PERSONA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla donde guardamos todas las personas.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONAS`
--

LOCK TABLES `PERSONAS` WRITE;
/*!40000 ALTER TABLE `PERSONAS` DISABLE KEYS */;
INSERT INTO `PERSONAS` VALUES (1,'Ananta','Yoga','Yoga','00000000Z','info@anantayoga.org',946570958,NULL);
/*!40000 ALTER TABLE `PERSONAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPO_USUARIOS`
--

DROP TABLE IF EXISTS `TIPO_USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPO_USUARIOS` (
  `ID_USUARIO_TIPO` int(11) NOT NULL COMMENT 'ID de tipo de usuario',
  `NOMBRE` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `DESCRIPCION` text COLLATE utf8_spanish_ci NOT NULL,
  `NIVEL` int(1) NOT NULL COMMENT 'Con nivel gestionaremos si es administrador (1) o usuario normal (2)',
  PRIMARY KEY (`ID_USUARIO_TIPO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla donde guardamos todos los tipo de usuarios.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPO_USUARIOS`
--

LOCK TABLES `TIPO_USUARIOS` WRITE;
/*!40000 ALTER TABLE `TIPO_USUARIOS` DISABLE KEYS */;
INSERT INTO `TIPO_USUARIOS` VALUES (1,'ADMINISTRADOR','Administrador del sistema.',1);
/*!40000 ALTER TABLE `TIPO_USUARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIOS`
--

DROP TABLE IF EXISTS `USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIOS` (
  `USUARIO_ID` int(100) NOT NULL COMMENT 'ID de usuario',
  `PERSONA_ID` int(100) NOT NULL COMMENT 'ID de persona',
  `USUARIO_TIPO_ID` int(100) NOT NULL COMMENT 'ID de tipo de persona',
  `USERNAME` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Username utilizado para login',
  `PASSWORD` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Contraseña utilizada para login',
  PRIMARY KEY (`USUARIO_ID`),
  KEY `PERSONA_ID` (`PERSONA_ID`,`USUARIO_TIPO_ID`),
  KEY `PERSONA_ID_2` (`PERSONA_ID`),
  KEY `USUARIO_TIPO_ID` (`USUARIO_TIPO_ID`),
  CONSTRAINT `FK_USUARIO_PERSONA` FOREIGN KEY (`PERSONA_ID`) REFERENCES `PERSONAS` (`PERSONA_ID`),
  CONSTRAINT `FK_USUARIO_TIPO_USUARIO` FOREIGN KEY (`USUARIO_TIPO_ID`) REFERENCES `TIPO_USUARIOS` (`ID_USUARIO_TIPO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla donde guardamos todos los usuarios.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIOS`
--

LOCK TABLES `USUARIOS` WRITE;
/*!40000 ALTER TABLE `USUARIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `USUARIOS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-17  9:48:13
