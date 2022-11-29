-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: electronicanordeste.tplinkdns.com    Database: domus_django
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `ai_atiende_ciudad`
--

DROP TABLE IF EXISTS `ai_atiende_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_atiende_ciudad` (
  `ID_AI_Atiende_Ciudad` int NOT NULL AUTO_INCREMENT,
  `ID_AI` bigint NOT NULL,
  `ID_Ciudad_AIatiendeCiudad` int NOT NULL,
  PRIMARY KEY (`ID_AI_Atiende_Ciudad`),
  UNIQUE KEY `AIAtiendeCiudad_pk` (`ID_Ciudad_AIatiendeCiudad`,`ID_AI`),
  KEY `ai_atiende_ciudad_ID_AI_1c9bb9fe_fk_usuario_id` (`ID_AI`),
  CONSTRAINT `ai_atiende_ciudad_ID_AI_1c9bb9fe_fk_usuario_id` FOREIGN KEY (`ID_AI`) REFERENCES `usuario` (`id`),
  CONSTRAINT `ai_atiende_ciudad_ID_Ciudad_AIatiendeC_fed0326f_fk_ciudad_ID` FOREIGN KEY (`ID_Ciudad_AIatiendeCiudad`) REFERENCES `ciudad` (`ID_Ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_atiende_ciudad`
--

LOCK TABLES `ai_atiende_ciudad` WRITE;
/*!40000 ALTER TABLE `ai_atiende_ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ai_atiende_ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add usuario',6,'add_usuario'),(22,'Can change usuario',6,'change_usuario'),(23,'Can delete usuario',6,'delete_usuario'),(24,'Can view usuario',6,'view_usuario'),(25,'Can add caja',7,'add_caja'),(26,'Can change caja',7,'change_caja'),(27,'Can delete caja',7,'delete_caja'),(28,'Can view caja',7,'view_caja'),(29,'Can add ciudad',8,'add_ciudad'),(30,'Can change ciudad',8,'change_ciudad'),(31,'Can delete ciudad',8,'delete_ciudad'),(32,'Can view ciudad',8,'view_ciudad'),(33,'Can add contrato cerrado',9,'add_contratocerrado'),(34,'Can change contrato cerrado',9,'change_contratocerrado'),(35,'Can delete contrato cerrado',9,'delete_contratocerrado'),(36,'Can view contrato cerrado',9,'view_contratocerrado'),(37,'Can add idioma',10,'add_idioma'),(38,'Can change idioma',10,'change_idioma'),(39,'Can delete idioma',10,'delete_idioma'),(40,'Can view idioma',10,'view_idioma'),(41,'Can add pais',11,'add_pais'),(42,'Can change pais',11,'change_pais'),(43,'Can delete pais',11,'delete_pais'),(44,'Can view pais',11,'view_pais'),(45,'Can add propiedad',12,'add_propiedad'),(46,'Can change propiedad',12,'change_propiedad'),(47,'Can delete propiedad',12,'delete_propiedad'),(48,'Can view propiedad',12,'view_propiedad'),(49,'Can add transaccion',13,'add_transaccion'),(50,'Can change transaccion',13,'change_transaccion'),(51,'Can delete transaccion',13,'delete_transaccion'),(52,'Can view transaccion',13,'view_transaccion'),(53,'Can add transaccion ruta documento',14,'add_transaccionrutadocumento'),(54,'Can change transaccion ruta documento',14,'change_transaccionrutadocumento'),(55,'Can delete transaccion ruta documento',14,'delete_transaccionrutadocumento'),(56,'Can view transaccion ruta documento',14,'view_transaccionrutadocumento'),(57,'Can add provincia',15,'add_provincia'),(58,'Can change provincia',15,'change_provincia'),(59,'Can delete provincia',15,'delete_provincia'),(60,'Can view provincia',15,'view_provincia'),(61,'Can add propiedad ruta imagen',16,'add_propiedadrutaimagen'),(62,'Can change propiedad ruta imagen',16,'change_propiedadrutaimagen'),(63,'Can delete propiedad ruta imagen',16,'delete_propiedadrutaimagen'),(64,'Can view propiedad ruta imagen',16,'view_propiedadrutaimagen'),(65,'Can add propiedad ruta documento',17,'add_propiedadrutadocumento'),(66,'Can change propiedad ruta documento',17,'change_propiedadrutadocumento'),(67,'Can delete propiedad ruta documento',17,'delete_propiedadrutadocumento'),(68,'Can view propiedad ruta documento',17,'view_propiedadrutadocumento'),(69,'Can add pais habla idioma',18,'add_paishablaidioma'),(70,'Can change pais habla idioma',18,'change_paishablaidioma'),(71,'Can delete pais habla idioma',18,'delete_paishablaidioma'),(72,'Can view pais habla idioma',18,'view_paishablaidioma'),(73,'Can add empleado cobro pendiente',19,'add_empleadocobropendiente'),(74,'Can change empleado cobro pendiente',19,'change_empleadocobropendiente'),(75,'Can delete empleado cobro pendiente',19,'delete_empleadocobropendiente'),(76,'Can view empleado cobro pendiente',19,'view_empleadocobropendiente'),(77,'Can add deuda cliente',20,'add_deudacliente'),(78,'Can change deuda cliente',20,'change_deudacliente'),(79,'Can delete deuda cliente',20,'delete_deudacliente'),(80,'Can view deuda cliente',20,'view_deudacliente'),(81,'Can add contrato ruta documento',21,'add_contratorutadocumento'),(82,'Can change contrato ruta documento',21,'change_contratorutadocumento'),(83,'Can delete contrato ruta documento',21,'delete_contratorutadocumento'),(84,'Can view contrato ruta documento',21,'view_contratorutadocumento'),(85,'Can add cobro pend cliente',22,'add_cobropendcliente'),(86,'Can change cobro pend cliente',22,'change_cobropendcliente'),(87,'Can delete cobro pend cliente',22,'delete_cobropendcliente'),(88,'Can view cobro pend cliente',22,'view_cobropendcliente'),(89,'Can add cita',23,'add_cita'),(90,'Can change cita',23,'change_cita'),(91,'Can delete cita',23,'delete_cita'),(92,'Can view cita',23,'view_cita'),(93,'Can add cierre caja',24,'add_cierrecaja'),(94,'Can change cierre caja',24,'change_cierrecaja'),(95,'Can delete cierre caja',24,'delete_cierrecaja'),(96,'Can view cierre caja',24,'view_cierrecaja'),(97,'Can add ai atiende ciudad',25,'add_aiatiendeciudad'),(98,'Can change ai atiende ciudad',25,'change_aiatiendeciudad'),(99,'Can delete ai atiende ciudad',25,'delete_aiatiendeciudad'),(100,'Can view ai atiende ciudad',25,'view_aiatiendeciudad');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja` (
  `ID_Caja` int NOT NULL AUTO_INCREMENT,
  `Descripcion_Caja` varchar(100) NOT NULL,
  `IsOpen` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_Caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cierre_caja`
--

DROP TABLE IF EXISTS `cierre_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cierre_caja` (
  `ID_Cierre_Caja` int NOT NULL AUTO_INCREMENT,
  `Fecha_Cierre_Caja` date NOT NULL,
  `Monto_Cierre` decimal(10,0) NOT NULL,
  `ID_Caja_Cierre` int NOT NULL,
  PRIMARY KEY (`ID_Cierre_Caja`),
  UNIQUE KEY `CierreCaja_pk` (`ID_Caja_Cierre`,`Fecha_Cierre_Caja`),
  CONSTRAINT `cierre_caja_ID_Caja_Cierre_5b68d4d3_fk_caja_ID_Caja` FOREIGN KEY (`ID_Caja_Cierre`) REFERENCES `caja` (`ID_Caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cierre_caja`
--

LOCK TABLES `cierre_caja` WRITE;
/*!40000 ALTER TABLE `cierre_caja` DISABLE KEYS */;
/*!40000 ALTER TABLE `cierre_caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `NRO_Cita` int NOT NULL AUTO_INCREMENT,
  `F_Creacion_Cita` date NOT NULL,
  `H_Creacion_Cita` time(6) NOT NULL,
  `F_Asignacion_Cita` date DEFAULT NULL,
  `H_Asignacion_Cita` time(6) DEFAULT NULL,
  `F_Cita` date DEFAULT NULL,
  `H_Cita` time(6) DEFAULT NULL,
  `F_Concluye_Cita` date DEFAULT NULL,
  `H_Concluye_Cita` time(6) DEFAULT NULL,
  `Tipo_Cita` varchar(9) NOT NULL,
  `AI_Atiende_Cita` bigint DEFAULT NULL,
  `Client_Solicita_Cita` bigint NOT NULL,
  `Propiedad_Involucrada` int NOT NULL,
  `Secre_Asigna_Cita` bigint DEFAULT NULL,
  PRIMARY KEY (`NRO_Cita`),
  KEY `cita_AI_Atiende_Cita_0d4b7743_fk_usuario_id` (`AI_Atiende_Cita`),
  KEY `cita_Client_Solicita_Cita_6a8f8471_fk_usuario_id` (`Client_Solicita_Cita`),
  KEY `cita_Propiedad_Involucrada_7501f0a7_fk_propiedad_ID_Propiedad` (`Propiedad_Involucrada`),
  KEY `cita_Secre_Asigna_Cita_822a9594_fk_usuario_id` (`Secre_Asigna_Cita`),
  CONSTRAINT `cita_AI_Atiende_Cita_0d4b7743_fk_usuario_id` FOREIGN KEY (`AI_Atiende_Cita`) REFERENCES `usuario` (`id`),
  CONSTRAINT `cita_Client_Solicita_Cita_6a8f8471_fk_usuario_id` FOREIGN KEY (`Client_Solicita_Cita`) REFERENCES `usuario` (`id`),
  CONSTRAINT `cita_Propiedad_Involucrada_7501f0a7_fk_propiedad_ID_Propiedad` FOREIGN KEY (`Propiedad_Involucrada`) REFERENCES `propiedad` (`ID_Propiedad`),
  CONSTRAINT `cita_Secre_Asigna_Cita_822a9594_fk_usuario_id` FOREIGN KEY (`Secre_Asigna_Cita`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `ID_Ciudad` int NOT NULL AUTO_INCREMENT,
  `Nombre_Ciudad` varchar(20) NOT NULL,
  `ID_Provincia_Ciudad` int NOT NULL,
  PRIMARY KEY (`ID_Ciudad`),
  UNIQUE KEY `Ciudad_pk` (`Nombre_Ciudad`,`ID_Provincia_Ciudad`),
  KEY `ciudad_ID_Provincia_Ciudad_d792a96f_fk_provincia_ID_Provincia` (`ID_Provincia_Ciudad`),
  CONSTRAINT `ciudad_ID_Provincia_Ciudad_d792a96f_fk_provincia_ID_Provincia` FOREIGN KEY (`ID_Provincia_Ciudad`) REFERENCES `provincia` (`ID_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobro_pend_cliente`
--

DROP TABLE IF EXISTS `cobro_pend_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cobro_pend_cliente` (
  `NRO_Cobro_P_Cliente` int NOT NULL AUTO_INCREMENT,
  `F_Creacion_Cobro_PC` date NOT NULL,
  `Monto_Cobro_PC` decimal(10,0) NOT NULL,
  `ID_Cliente_Cobra` bigint NOT NULL,
  `ID_Prop_Involuc_CPC` int NOT NULL,
  PRIMARY KEY (`NRO_Cobro_P_Cliente`),
  KEY `cobro_pend_cliente_ID_Cliente_Cobra_fcce5a4e_fk_usuario_id` (`ID_Cliente_Cobra`),
  KEY `cobro_pend_cliente_ID_Prop_Involuc_CPC_fc77e58c_fk_propiedad` (`ID_Prop_Involuc_CPC`),
  CONSTRAINT `cobro_pend_cliente_ID_Cliente_Cobra_fcce5a4e_fk_usuario_id` FOREIGN KEY (`ID_Cliente_Cobra`) REFERENCES `usuario` (`id`),
  CONSTRAINT `cobro_pend_cliente_ID_Prop_Involuc_CPC_fc77e58c_fk_propiedad` FOREIGN KEY (`ID_Prop_Involuc_CPC`) REFERENCES `propiedad` (`ID_Propiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobro_pend_cliente`
--

LOCK TABLES `cobro_pend_cliente` WRITE;
/*!40000 ALTER TABLE `cobro_pend_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobro_pend_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato_cerrado`
--

DROP TABLE IF EXISTS `contrato_cerrado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato_cerrado` (
  `NRO_Contrato` int NOT NULL AUTO_INCREMENT,
  `F_Creacion_Contrato` date NOT NULL,
  `F_Caduca_Contrato` date DEFAULT NULL,
  `Monto` decimal(10,0) NOT NULL,
  `Tipo_Contrato` varchar(8) NOT NULL,
  `AI_Responsable_Contrato` bigint NOT NULL,
  `Client_Involucrado_Contrato` bigint NOT NULL,
  `Prop_Involucrada_Contrato` int NOT NULL,
  PRIMARY KEY (`NRO_Contrato`),
  KEY `contrato_cerrado_Prop_Involucrada_Con_6caa8659_fk_propiedad` (`Prop_Involucrada_Contrato`),
  KEY `contrato_cerrado_AI_Responsable_Contrato_c0612e88_fk_usuario_id` (`AI_Responsable_Contrato`),
  KEY `contrato_cerrado_Client_Involucrado_C_62ee877c_fk_usuario_i` (`Client_Involucrado_Contrato`),
  CONSTRAINT `contrato_cerrado_AI_Responsable_Contrato_c0612e88_fk_usuario_id` FOREIGN KEY (`AI_Responsable_Contrato`) REFERENCES `usuario` (`id`),
  CONSTRAINT `contrato_cerrado_Client_Involucrado_C_62ee877c_fk_usuario_i` FOREIGN KEY (`Client_Involucrado_Contrato`) REFERENCES `usuario` (`id`),
  CONSTRAINT `contrato_cerrado_Prop_Involucrada_Con_6caa8659_fk_propiedad` FOREIGN KEY (`Prop_Involucrada_Contrato`) REFERENCES `propiedad` (`ID_Propiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato_cerrado`
--

LOCK TABLES `contrato_cerrado` WRITE;
/*!40000 ALTER TABLE `contrato_cerrado` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato_cerrado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato_ruta_documento`
--

DROP TABLE IF EXISTS `contrato_ruta_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato_ruta_documento` (
  `ID_Contrato_Ruta_Documento` int NOT NULL AUTO_INCREMENT,
  `Ruta_CD` varchar(100) NOT NULL,
  `NRO_Contrato_Documento` int NOT NULL,
  PRIMARY KEY (`ID_Contrato_Ruta_Documento`),
  UNIQUE KEY `Contrato_Ruta_Documento_pk` (`NRO_Contrato_Documento`,`Ruta_CD`),
  CONSTRAINT `contrato_ruta_docume_NRO_Contrato_Documen_75e3f24a_fk_contrato_` FOREIGN KEY (`NRO_Contrato_Documento`) REFERENCES `contrato_cerrado` (`NRO_Contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato_ruta_documento`
--

LOCK TABLES `contrato_ruta_documento` WRITE;
/*!40000 ALTER TABLE `contrato_ruta_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato_ruta_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deuda_cliente`
--

DROP TABLE IF EXISTS `deuda_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deuda_cliente` (
  `NRO_Deuda_Cliente` int NOT NULL AUTO_INCREMENT,
  `F_Creacion_Deuda` date NOT NULL,
  `Monto_Deuda` decimal(10,0) NOT NULL,
  `ID_Cliente_Debe` bigint NOT NULL,
  `ID_Propiedad_Deuda` int NOT NULL,
  PRIMARY KEY (`NRO_Deuda_Cliente`),
  KEY `deuda_cliente_ID_Cliente_Debe_af6d9415_fk_usuario_id` (`ID_Cliente_Debe`),
  KEY `deuda_cliente_ID_Propiedad_Deuda_0ce67d0a_fk_propiedad` (`ID_Propiedad_Deuda`),
  CONSTRAINT `deuda_cliente_ID_Cliente_Debe_af6d9415_fk_usuario_id` FOREIGN KEY (`ID_Cliente_Debe`) REFERENCES `usuario` (`id`),
  CONSTRAINT `deuda_cliente_ID_Propiedad_Deuda_0ce67d0a_fk_propiedad` FOREIGN KEY (`ID_Propiedad_Deuda`) REFERENCES `propiedad` (`ID_Propiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deuda_cliente`
--

LOCK TABLES `deuda_cliente` WRITE;
/*!40000 ALTER TABLE `deuda_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `deuda_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_usuario_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (2,'2022-11-28 00:19:25.258781','2','admin',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',6,2),(3,'2022-11-28 00:23:31.987948','2','admin',2,'[{\"changed\": {\"fields\": [\"Sexo\"]}}]',6,2),(4,'2022-11-28 00:38:44.281340','2','admin',2,'[{\"changed\": {\"fields\": [\"Email\", \"Apellidos\", \"Salario mensual\", \"Departamento\"]}}]',6,2),(5,'2022-11-28 02:53:42.038523','3','secretario',1,'[{\"added\": {}}]',6,2),(6,'2022-11-28 02:55:27.513564','4','agenteinmobiliario',1,'[{\"added\": {}}]',6,2),(7,'2022-11-28 02:56:46.844785','5','cliente',1,'[{\"added\": {}}]',6,2),(8,'2022-11-28 05:36:24.362982','5','cliente',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',6,2),(9,'2022-11-28 23:21:22.727516','6','cliente2',1,'[{\"added\": {}}]',6,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(25,'user','aiatiendeciudad'),(7,'user','caja'),(24,'user','cierrecaja'),(23,'user','cita'),(8,'user','ciudad'),(22,'user','cobropendcliente'),(9,'user','contratocerrado'),(21,'user','contratorutadocumento'),(20,'user','deudacliente'),(19,'user','empleadocobropendiente'),(10,'user','idioma'),(11,'user','pais'),(18,'user','paishablaidioma'),(12,'user','propiedad'),(17,'user','propiedadrutadocumento'),(16,'user','propiedadrutaimagen'),(15,'user','provincia'),(13,'user','transaccion'),(14,'user','transaccionrutadocumento'),(6,'user','usuario');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-11-27 23:50:29.090526'),(2,'contenttypes','0002_remove_content_type_name','2022-11-27 23:50:29.584435'),(3,'auth','0001_initial','2022-11-27 23:50:31.279415'),(4,'auth','0002_alter_permission_name_max_length','2022-11-27 23:50:31.559948'),(5,'auth','0003_alter_user_email_max_length','2022-11-27 23:50:31.680680'),(6,'auth','0004_alter_user_username_opts','2022-11-27 23:50:31.792956'),(7,'auth','0005_alter_user_last_login_null','2022-11-27 23:50:31.912365'),(8,'auth','0006_require_contenttypes_0002','2022-11-27 23:50:32.019007'),(9,'auth','0007_alter_validators_add_error_messages','2022-11-27 23:50:32.133651'),(10,'auth','0008_alter_user_username_max_length','2022-11-27 23:50:32.249400'),(11,'auth','0009_alter_user_last_name_max_length','2022-11-27 23:50:32.367311'),(12,'auth','0010_alter_group_name_max_length','2022-11-27 23:50:32.584747'),(13,'auth','0011_update_proxy_permissions','2022-11-27 23:50:32.854912'),(14,'auth','0012_alter_user_first_name_max_length','2022-11-27 23:50:32.969124'),(15,'user','0001_initial','2022-11-27 23:50:50.228103'),(16,'admin','0001_initial','2022-11-27 23:50:51.301079'),(17,'admin','0002_logentry_remove_auto_add','2022-11-27 23:50:51.422725'),(18,'admin','0003_logentry_add_action_flag_choices','2022-11-27 23:50:51.556307'),(19,'sessions','0001_initial','2022-11-27 23:50:52.090040'),(20,'user','0002_alter_usuario_departamento','2022-11-28 00:36:36.549569');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('o2uvsib4lje0te7mp3h5lm7o0hev6ba4','.eJxVjMsOwiAQRf-FtSE8C7h07zcQYGakaiAp7cr479qkC93ec859sZi2tcZt4BJnYGem2Ol3y6k8sO0A7qndOi-9rcuc-a7wgw5-7YDPy-H-HdQ06rcuImjhciDhDGVJRKqAVkDeegcYRDEWPXrtTRbOTlLJZPQks5UWBQF7fwDnDzep:1ozkd1:rk5hdprbgyW_LgbImsQNAeknNgZP7Q4AVDzkgtCeQFs','2022-12-12 20:21:23.206332'),('wvnp95p7a1omnxp15z1fbiz3ddk5rm4e','.eJxVjDsOwjAQRO_iGllZ_2JT0ucMlne94ABypDipEHcHSymgnHlv5iVi2rcS98ZrnLM4Cy1Ovx0menDtIN9TvS2SlrqtM8quyIM2OS2Zn5fD_TsoqZXv2ivraMgmIFydBp0GS6MyxAgag8XgFAQP5A37MRvS6G1PwZJiUCDeH8OMNuQ:1ozfDb:dSb4HFxaEvRZz1Dvvt8WpTtBYk26poveFwJDTLSmKeM','2022-12-12 14:34:47.033795');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_cobro_pendiente`
--

DROP TABLE IF EXISTS `empleado_cobro_pendiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_cobro_pendiente` (
  `NRO_Cobro` int NOT NULL AUTO_INCREMENT,
  `F_Creacion_CobroP` date NOT NULL,
  `H_Creacion_CobroP` time(6) NOT NULL,
  `Monto_Cobro_Empleado` decimal(10,0) NOT NULL,
  `Descripcion_Cobro_Empleado` varchar(100) DEFAULT NULL,
  `Tipo_Cobro_Empleado` varchar(8) NOT NULL,
  `ID_Empleado_Cobra` bigint NOT NULL,
  PRIMARY KEY (`NRO_Cobro`),
  KEY `empleado_cobro_pendi_ID_Empleado_Cobra_51411c0b_fk_usuario_i` (`ID_Empleado_Cobra`),
  CONSTRAINT `empleado_cobro_pendi_ID_Empleado_Cobra_51411c0b_fk_usuario_i` FOREIGN KEY (`ID_Empleado_Cobra`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_cobro_pendiente`
--

LOCK TABLES `empleado_cobro_pendiente` WRITE;
/*!40000 ALTER TABLE `empleado_cobro_pendiente` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado_cobro_pendiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idioma` (
  `Nombre_Idioma` varchar(20) NOT NULL,
  PRIMARY KEY (`Nombre_Idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `Nombre_Pais` varchar(20) NOT NULL,
  PRIMARY KEY (`Nombre_Pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais_habla_idioma`
--

DROP TABLE IF EXISTS `pais_habla_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais_habla_idioma` (
  `ID_Pais_Habla_Idioma` int NOT NULL AUTO_INCREMENT,
  `Nombre_Idioma_Idioma` varchar(20) NOT NULL,
  `Nombre_Pais_Pais` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Pais_Habla_Idioma`),
  UNIQUE KEY `PaisHablaIdioma_pk` (`Nombre_Idioma_Idioma`,`Nombre_Pais_Pais`),
  KEY `pais_habla_idioma_Nombre_Pais_Pais_8fad1dec_fk_pais_Nombre_Pais` (`Nombre_Pais_Pais`),
  CONSTRAINT `pais_habla_idioma_Nombre_Idioma_Idioma_6d9fe3f8_fk_idioma_No` FOREIGN KEY (`Nombre_Idioma_Idioma`) REFERENCES `idioma` (`Nombre_Idioma`),
  CONSTRAINT `pais_habla_idioma_Nombre_Pais_Pais_8fad1dec_fk_pais_Nombre_Pais` FOREIGN KEY (`Nombre_Pais_Pais`) REFERENCES `pais` (`Nombre_Pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais_habla_idioma`
--

LOCK TABLES `pais_habla_idioma` WRITE;
/*!40000 ALTER TABLE `pais_habla_idioma` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais_habla_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedad`
--

DROP TABLE IF EXISTS `propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedad` (
  `ID_Propiedad` int NOT NULL AUTO_INCREMENT,
  `Tipo_Propiedad` varchar(12) NOT NULL,
  `Pisos` int unsigned NOT NULL,
  `Metros_Cuadrados` decimal(10,0) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Estado_Propiedad` varchar(8) NOT NULL,
  `Precio_Sugerido` decimal(10,0) NOT NULL,
  `ID_Adquiere_o_Alquila` bigint DEFAULT NULL,
  `ID_Ciudad_Propiedad` int NOT NULL,
  `ID_Dueño` bigint NOT NULL,
  PRIMARY KEY (`ID_Propiedad`),
  KEY `propiedad_ID_Adquiere_o_Alquila_65f40cd2_fk_usuario_id` (`ID_Adquiere_o_Alquila`),
  KEY `propiedad_ID_Ciudad_Propiedad_201f9214_fk_ciudad_ID_Ciudad` (`ID_Ciudad_Propiedad`),
  KEY `propiedad_ID_Dueño_a9373bb4_fk_usuario_id` (`ID_Dueño`),
  CONSTRAINT `propiedad_ID_Adquiere_o_Alquila_65f40cd2_fk_usuario_id` FOREIGN KEY (`ID_Adquiere_o_Alquila`) REFERENCES `usuario` (`id`),
  CONSTRAINT `propiedad_ID_Ciudad_Propiedad_201f9214_fk_ciudad_ID_Ciudad` FOREIGN KEY (`ID_Ciudad_Propiedad`) REFERENCES `ciudad` (`ID_Ciudad`),
  CONSTRAINT `propiedad_ID_Dueño_a9373bb4_fk_usuario_id` FOREIGN KEY (`ID_Dueño`) REFERENCES `usuario` (`id`),
  CONSTRAINT `propiedad_chk_1` CHECK ((`Pisos` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `propiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedad_ruta_documento`
--

DROP TABLE IF EXISTS `propiedad_ruta_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedad_ruta_documento` (
  `ID_Propiedad_Ruta_Documento` int NOT NULL AUTO_INCREMENT,
  `Ruta_PD` varchar(100) NOT NULL,
  `ID_Propiedad_Documento` int NOT NULL,
  PRIMARY KEY (`ID_Propiedad_Ruta_Documento`),
  UNIQUE KEY `PropiedadRutaDocumento_pk` (`ID_Propiedad_Documento`,`Ruta_PD`),
  CONSTRAINT `propiedad_ruta_docum_ID_Propiedad_Documen_ed14ae46_fk_propiedad` FOREIGN KEY (`ID_Propiedad_Documento`) REFERENCES `propiedad` (`ID_Propiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad_ruta_documento`
--

LOCK TABLES `propiedad_ruta_documento` WRITE;
/*!40000 ALTER TABLE `propiedad_ruta_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `propiedad_ruta_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedad_ruta_imagen`
--

DROP TABLE IF EXISTS `propiedad_ruta_imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedad_ruta_imagen` (
  `ID_Propiedad_Ruta_Imagen` int NOT NULL AUTO_INCREMENT,
  `Ruta_PI` varchar(100) NOT NULL,
  `ID_Propiedad_Imagen` int NOT NULL,
  PRIMARY KEY (`ID_Propiedad_Ruta_Imagen`),
  UNIQUE KEY `PropiedadRutaImagen_pk` (`ID_Propiedad_Imagen`,`Ruta_PI`),
  CONSTRAINT `propiedad_ruta_image_ID_Propiedad_Imagen_2afe1b22_fk_propiedad` FOREIGN KEY (`ID_Propiedad_Imagen`) REFERENCES `propiedad` (`ID_Propiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad_ruta_imagen`
--

LOCK TABLES `propiedad_ruta_imagen` WRITE;
/*!40000 ALTER TABLE `propiedad_ruta_imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `propiedad_ruta_imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `ID_Provincia` int NOT NULL AUTO_INCREMENT,
  `Nombre_Provincia` varchar(20) NOT NULL,
  `Nombre_Pais_Provincia` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Provincia`),
  UNIQUE KEY `Provincia_pk` (`Nombre_Provincia`,`Nombre_Pais_Provincia`),
  KEY `provincia_Nombre_Pais_Provincia_d69a2e35_fk_pais_Nombre_Pais` (`Nombre_Pais_Provincia`),
  CONSTRAINT `provincia_Nombre_Pais_Provincia_d69a2e35_fk_pais_Nombre_Pais` FOREIGN KEY (`Nombre_Pais_Provincia`) REFERENCES `pais` (`Nombre_Pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `NRO_Transaccion` int NOT NULL AUTO_INCREMENT,
  `F_Creacion_Transaccion` date NOT NULL,
  `H_Creacion_Transaccion` time(6) NOT NULL,
  `Monto_Transaccion` decimal(10,0) NOT NULL,
  `Tipo_Transaccion` varchar(14) NOT NULL,
  `Descripcion_Transaccion` varchar(100) DEFAULT NULL,
  `Cajera_Responsable_Transaccion` bigint NOT NULL,
  `Client_Paga-Cobra_Transaccion` bigint DEFAULT NULL,
  `Emp_Cobra_Transaccion` bigint DEFAULT NULL,
  `ID_Caja_Transaccion` int NOT NULL,
  `Prop_Involucrada_Transaccion` int DEFAULT NULL,
  PRIMARY KEY (`NRO_Transaccion`),
  KEY `transaccion_Cajera_Responsable_T_60069335_fk_usuario_i` (`Cajera_Responsable_Transaccion`),
  KEY `transaccion_Client_Paga-Cobra_Transaccion_741b7544_fk_usuario_id` (`Client_Paga-Cobra_Transaccion`),
  KEY `transaccion_Emp_Cobra_Transaccion_dbd6e262_fk_usuario_id` (`Emp_Cobra_Transaccion`),
  KEY `transaccion_ID_Caja_Transaccion_b6856790_fk_caja_ID_Caja` (`ID_Caja_Transaccion`),
  KEY `transaccion_Prop_Involucrada_Tra_0830bd9c_fk_propiedad` (`Prop_Involucrada_Transaccion`),
  CONSTRAINT `transaccion_Cajera_Responsable_T_60069335_fk_usuario_i` FOREIGN KEY (`Cajera_Responsable_Transaccion`) REFERENCES `usuario` (`id`),
  CONSTRAINT `transaccion_Client_Paga-Cobra_Transaccion_741b7544_fk_usuario_id` FOREIGN KEY (`Client_Paga-Cobra_Transaccion`) REFERENCES `usuario` (`id`),
  CONSTRAINT `transaccion_Emp_Cobra_Transaccion_dbd6e262_fk_usuario_id` FOREIGN KEY (`Emp_Cobra_Transaccion`) REFERENCES `usuario` (`id`),
  CONSTRAINT `transaccion_ID_Caja_Transaccion_b6856790_fk_caja_ID_Caja` FOREIGN KEY (`ID_Caja_Transaccion`) REFERENCES `caja` (`ID_Caja`),
  CONSTRAINT `transaccion_Prop_Involucrada_Tra_0830bd9c_fk_propiedad` FOREIGN KEY (`Prop_Involucrada_Transaccion`) REFERENCES `propiedad` (`ID_Propiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion_ruta_documento`
--

DROP TABLE IF EXISTS `transaccion_ruta_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion_ruta_documento` (
  `ID_Transaccion_Ruta_Documento` int NOT NULL AUTO_INCREMENT,
  `Ruta_DT` varchar(100) NOT NULL,
  `NRO_Transaccion_Documento` int NOT NULL,
  PRIMARY KEY (`ID_Transaccion_Ruta_Documento`),
  UNIQUE KEY `TransaccionRutaDocumento_pk` (`NRO_Transaccion_Documento`,`Ruta_DT`),
  CONSTRAINT `transaccion_ruta_doc_NRO_Transaccion_Docu_212dea1a_fk_transacci` FOREIGN KEY (`NRO_Transaccion_Documento`) REFERENCES `transaccion` (`NRO_Transaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion_ruta_documento`
--

LOCK TABLES `transaccion_ruta_documento` WRITE;
/*!40000 ALTER TABLE `transaccion_ruta_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion_ruta_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(20) NOT NULL,
  `dni_cuil` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `sexo` varchar(10) NOT NULL,
  `salario_mensual` decimal(10,0) DEFAULT NULL,
  `departamento` varchar(16) DEFAULT NULL,
  `foto_perfil` longtext,
  `tipo_usuario` varchar(10) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'pbkdf2_sha256$390000$WkMzhnuMlOhWtMNz07abMY$f/Rvo3a0h595OXvZ+9RQSkR6AfBJ/b1XS23DM0H+PP0=','2022-11-28 23:20:26.683228',1,'admin','43146475','agustinbasiliomatijasevich@gmail.com','Agustin','Basilio Matijasevich','M',700000,'ADM','/9j/4AAQSkZJRgABAQAAAQABAAD/4gIoSUNDX1BST0ZJTEUAAQEAAAIYAAAAAAIQAABtbnRyUkdCIFhZWiAAAAAAAAAAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAAHRyWFlaAAABZAA','EAS',1),(3,'pbkdf2_sha256$390000$mhI3OEJehMUemIorM4uB0A$PxfqB3RprlssIxEROgD3OBJ1F/EH84sVfSN5qoqT/w0=','2022-11-28 20:20:40.703221',0,'secretario','41365753',NULL,'Alex','Lopez Frutos','M',500000,'COM','','ES',1),(4,'pbkdf2_sha256$260000$VBKWU32TiPv0k5zEgZFeCi$yyIyiI/YTQStLJwXpEtRWQ0tkbTAdK8im+2dmI8k18M=','2022-11-28 14:34:18.842910',0,'agenteinmobiliario','42365987',NULL,'Claudio',NULL,'M',600000,'COM','','EAI',1),(5,'pbkdf2_sha256$260000$Rv0bmjY9JgWlb9rkf20fsw$r/aYQFZ7lHbKMzWRhDKiqh2PzKVYDaEsQNuWBegLycc=','2022-11-28 05:36:55.813705',0,'cliente','12345678',NULL,'CocaCola',NULL,'NE',NULL,NULL,'','CC',0),(6,'pbkdf2_sha256$390000$VAi07N1Gvhx3IKwZHuCY1A$t/tIA+Pex7iCTV+i8G0pKiclMj1MfnHBQXQzWRV3/Ns=',NULL,0,'cliente2','25654987',NULL,'Otro Cliente',NULL,'NE',NULL,NULL,'','CP',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_groups`
--

DROP TABLE IF EXISTS `usuario_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_groups_usuario_id_group_id_2e3cd638_uniq` (`usuario_id`,`group_id`),
  KEY `usuario_groups_group_id_c67c8651_fk_auth_group_id` (`group_id`),
  CONSTRAINT `usuario_groups_group_id_c67c8651_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `usuario_groups_usuario_id_161fc80c_fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_groups`
--

LOCK TABLES `usuario_groups` WRITE;
/*!40000 ALTER TABLE `usuario_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_user_permissions`
--

DROP TABLE IF EXISTS `usuario_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_user_permissions_usuario_id_permission_id_3db58b8c_uniq` (`usuario_id`,`permission_id`),
  KEY `usuario_user_permiss_permission_id_a8893ce7_fk_auth_perm` (`permission_id`),
  CONSTRAINT `usuario_user_permiss_permission_id_a8893ce7_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `usuario_user_permissions_usuario_id_693d9c50_fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_user_permissions`
--

LOCK TABLES `usuario_user_permissions` WRITE;
/*!40000 ALTER TABLE `usuario_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'domus_django'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-28 20:23:44
