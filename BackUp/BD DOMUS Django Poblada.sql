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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add usuario',4,'add_usuario'),(14,'Can change usuario',4,'change_usuario'),(15,'Can delete usuario',4,'delete_usuario'),(16,'Can view usuario',4,'view_usuario'),(17,'Can add caja',5,'add_caja'),(18,'Can change caja',5,'change_caja'),(19,'Can delete caja',5,'delete_caja'),(20,'Can view caja',5,'view_caja'),(21,'Can add ciudad',6,'add_ciudad'),(22,'Can change ciudad',6,'change_ciudad'),(23,'Can delete ciudad',6,'delete_ciudad'),(24,'Can view ciudad',6,'view_ciudad'),(25,'Can add contrato cerrado',7,'add_contratocerrado'),(26,'Can change contrato cerrado',7,'change_contratocerrado'),(27,'Can delete contrato cerrado',7,'delete_contratocerrado'),(28,'Can view contrato cerrado',7,'view_contratocerrado'),(29,'Can add idioma',8,'add_idioma'),(30,'Can change idioma',8,'change_idioma'),(31,'Can delete idioma',8,'delete_idioma'),(32,'Can view idioma',8,'view_idioma'),(33,'Can add pais',9,'add_pais'),(34,'Can change pais',9,'change_pais'),(35,'Can delete pais',9,'delete_pais'),(36,'Can view pais',9,'view_pais'),(37,'Can add propiedad',10,'add_propiedad'),(38,'Can change propiedad',10,'change_propiedad'),(39,'Can delete propiedad',10,'delete_propiedad'),(40,'Can view propiedad',10,'view_propiedad'),(41,'Can add registro de citas',11,'add_registrodecitas'),(42,'Can change registro de citas',11,'change_registrodecitas'),(43,'Can delete registro de citas',11,'delete_registrodecitas'),(44,'Can view registro de citas',11,'view_registrodecitas'),(45,'Can add transaccion',12,'add_transaccion'),(46,'Can change transaccion',12,'change_transaccion'),(47,'Can delete transaccion',12,'delete_transaccion'),(48,'Can view transaccion',12,'view_transaccion'),(49,'Can add transaccion ruta documento',13,'add_transaccionrutadocumento'),(50,'Can change transaccion ruta documento',13,'change_transaccionrutadocumento'),(51,'Can delete transaccion ruta documento',13,'delete_transaccionrutadocumento'),(52,'Can view transaccion ruta documento',13,'view_transaccionrutadocumento'),(53,'Can add provincia',14,'add_provincia'),(54,'Can change provincia',14,'change_provincia'),(55,'Can delete provincia',14,'delete_provincia'),(56,'Can view provincia',14,'view_provincia'),(57,'Can add propiedad ruta imagen',15,'add_propiedadrutaimagen'),(58,'Can change propiedad ruta imagen',15,'change_propiedadrutaimagen'),(59,'Can delete propiedad ruta imagen',15,'delete_propiedadrutaimagen'),(60,'Can view propiedad ruta imagen',15,'view_propiedadrutaimagen'),(61,'Can add propiedad ruta documento',16,'add_propiedadrutadocumento'),(62,'Can change propiedad ruta documento',16,'change_propiedadrutadocumento'),(63,'Can delete propiedad ruta documento',16,'delete_propiedadrutadocumento'),(64,'Can view propiedad ruta documento',16,'view_propiedadrutadocumento'),(65,'Can add pais habla idioma',17,'add_paishablaidioma'),(66,'Can change pais habla idioma',17,'change_paishablaidioma'),(67,'Can delete pais habla idioma',17,'delete_paishablaidioma'),(68,'Can view pais habla idioma',17,'view_paishablaidioma'),(69,'Can add empleado cobro pendiente',18,'add_empleadocobropendiente'),(70,'Can change empleado cobro pendiente',18,'change_empleadocobropendiente'),(71,'Can delete empleado cobro pendiente',18,'delete_empleadocobropendiente'),(72,'Can view empleado cobro pendiente',18,'view_empleadocobropendiente'),(73,'Can add deuda cliente',19,'add_deudacliente'),(74,'Can change deuda cliente',19,'change_deudacliente'),(75,'Can delete deuda cliente',19,'delete_deudacliente'),(76,'Can view deuda cliente',19,'view_deudacliente'),(77,'Can add contrato ruta documento',20,'add_contratorutadocumento'),(78,'Can change contrato ruta documento',20,'change_contratorutadocumento'),(79,'Can delete contrato ruta documento',20,'delete_contratorutadocumento'),(80,'Can view contrato ruta documento',20,'view_contratorutadocumento'),(81,'Can add cobro pend cliente',21,'add_cobropendcliente'),(82,'Can change cobro pend cliente',21,'change_cobropendcliente'),(83,'Can delete cobro pend cliente',21,'delete_cobropendcliente'),(84,'Can view cobro pend cliente',21,'view_cobropendcliente'),(85,'Can add cita',22,'add_cita'),(86,'Can change cita',22,'change_cita'),(87,'Can delete cita',22,'delete_cita'),(88,'Can view cita',22,'view_cita'),(89,'Can add cierre caja',23,'add_cierrecaja'),(90,'Can change cierre caja',23,'change_cierrecaja'),(91,'Can delete cierre caja',23,'delete_cierrecaja'),(92,'Can view cierre caja',23,'view_cierrecaja'),(93,'Can add ai atiende ciudad',24,'add_aiatiendeciudad'),(94,'Can change ai atiende ciudad',24,'change_aiatiendeciudad'),(95,'Can delete ai atiende ciudad',24,'delete_aiatiendeciudad'),(96,'Can view ai atiende ciudad',24,'view_aiatiendeciudad'),(97,'Can add log entry',25,'add_logentry'),(98,'Can change log entry',25,'change_logentry'),(99,'Can delete log entry',25,'delete_logentry'),(100,'Can view log entry',25,'view_logentry'),(101,'Can add session',26,'add_session'),(102,'Can change session',26,'change_session'),(103,'Can delete session',26,'delete_session'),(104,'Can view session',26,'view_session');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (5,'2022-12-06','08:00:00.000000','2022-12-06','08:00:00.000000','2022-12-06','08:00:00.000000','2022-12-04','21:35:00.000000','AG',3,5,1,2),(6,'2022-12-09','11:00:00.000000','2022-12-09','11:00:00.000000','2022-12-09','11:00:00.000000',NULL,NULL,'AG',3,4,3,2);
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `Registrar_Cita_Concluida` AFTER UPDATE ON `cita` FOR EACH ROW begin 
	if (new.F_Concluye_Cita is not NULL or new.H_Concluye_Cita is not NULL) then 
		INSERT INTO registro_de_citas 
		(NRO_Cita, 
		`Fechas=>`, FH_Creacion, FH_Asignacion, FH_Cita, FH_Conclusion, 
		`Secretaria=>`, Nombre_Secretaria, Apellido_Secretaria, DNI_Secretaria, Sexo_Secretaria, 
		`Agente Inmobiliatio=>`, Nombre_AI, Apellido_AI, DNI_AI, Sexo_AI, 
		`Cliente=>`, Nombre_Cliente, Apellido_Cliente, DNI_Cliente, Sexo_Cliente, 
		`Propiedad=>`, Ciudad_Prop, Provincia_Prop, Pais_Prop, Direccion_Prop, Tipo_Prop, Pisos_Prop, Metros_Cuadrados_Prop, Estado_Prop, 
		`Dueño=>`, Nombre_Dueño, Apellido_Dueño, DNI_Dueño, Sexo_Dueño)
		select 
		new.NRO_Cita,
		'Fechas=>', 
		cast(concat(c.F_Creacion_Cita, ' ', c.H_Creacion_Cita) as datetime) as FH_Creacion, 
		cast(concat(c.F_Asignacion_Cita, ' ', c.H_Asignacion_Cita) as datetime) as FH_Asignacion, 
		cast(concat(c.F_Cita, ' ', c.H_Cita) as datetime) as FH_Cita, 
		cast(concat(c.F_Concluye_Cita, ' ', c.H_Concluye_Cita) as datetime) as FH_Conclusion, 
		'Secretaria=>', 
		u.Nombres as Nombre_Secretaria,
		u.Apellidos as Apellido_Secretaria,
		u.DNI_CUIL as DNI_Secretaria,
		u.Sexo as Sexo_Secretaria,
		'Agente Inmobiliatio=>', 
		u2.Nombres as Nombre_AI,
		u2.Apellidos as Apellido_AI,
		u2.DNI_CUIL as DNI_AI,
		u2.Sexo as Sexo_AI,
		'Cliente=>', 
		u3.Nombres as Nombre_Cliente,
		u3.Apellidos as Apellido_Cliente,
		u3.DNI_CUIL as DNI_Cliente,
		u3.Sexo as Sexo_Cliente,
		'Propiedad=>', 
		ci.Nombre_Ciudad as Ciudad_Prop, 
		pr.Nombre_Provincia as Provincia_Prop, 
		pr.Nombre_Pais_Provincia as Pais_Prop, 
		p.Direccion as Direccion_Prop, 
		p.Tipo_Propiedad as Tipo_Prop, 
		p.Pisos as Pisos_Prop, 
		p.Metros_Cuadrados as Metros_Cuadrados_Prop, 
		p.Estado_Propiedad as Estado_Prop, 
		'Dueño=>', 
		u4.Nombres as Nombre_Dueño, 
		u4.Apellidos as Apellido_Dueño, 
		u4.DNI_CUIL as DNI_Dueño, 
		u4.Sexo as Sexo_Dueño 
		from cita c 
		inner join usuario u 
		on c.Secre_Asigna_Cita = u.id 
		inner join usuario u2 
		on c.AI_Atiende_Cita = u2.id 
		inner join usuario u3 
		on c.Client_Solicita_Cita = u3.id 
		inner join propiedad p 
		on c.Propiedad_Involucrada = p.ID_Propiedad 
		inner join usuario u4 
		on p.ID_Dueño = u4.id 
		inner join ciudad ci 
		on ci.ID_Ciudad = p.ID_Ciudad_Propiedad 
		inner join provincia pr 
		on pr.ID_Provincia = ci.ID_Provincia_Ciudad
		where NRO_Cita = new.NRO_Cita; 
	end if; 
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (2,'Barranqueras',1),(3,'Charata',1),(5,'Cordoba',3),(1,'Resistencia',1),(6,'Santa Fe',2),(4,'Tirol',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-12-03 06:03:31.689974','2','Alex Lopez Frutos',1,'[{\"added\": {}}]',4,1),(2,'2022-12-03 06:04:05.045253','1','Agustin Basilio Matijasevich',2,'[{\"changed\": {\"fields\": [\"Email\", \"Sexo\", \"Salario mensual\", \"Departamento\"]}}]',4,1),(3,'2022-12-03 06:05:23.708578','3','Daniel Cabrera',1,'[{\"added\": {}}]',4,1),(4,'2022-12-03 06:07:38.237742','4','Coca Cola SA',1,'[{\"added\": {}}]',4,1),(5,'2022-12-03 06:09:39.805836','5','Un Cliente',1,'[{\"added\": {}}]',4,1),(6,'2022-12-03 06:26:21.344748','1','COD PROP N°: 1',1,'[{\"added\": {}}]',10,1),(7,'2022-12-03 06:27:06.710858','2','COD PROP N°: 2',1,'[{\"added\": {}}]',10,1),(8,'2022-12-03 06:28:04.690657','3','COD PROP N°: 3',1,'[{\"added\": {}}]',10,1),(9,'2022-12-03 06:28:56.025296','4','COD PROP N°: 4',1,'[{\"added\": {}}]',10,1),(10,'2022-12-03 06:30:40.511853','5','COD PROP N°: 5',1,'[{\"added\": {}}]',10,1),(11,'2022-12-03 06:31:11.983727','6','COD PROP N°: 6',1,'[{\"added\": {}}]',10,1),(12,'2022-12-03 06:34:28.517019','1','Propiedad - Foto',1,'[{\"added\": {}}]',16,1),(13,'2022-12-03 06:43:46.779443','2','Propiedad - Foto',1,'[{\"added\": {}}]',16,1),(14,'2022-12-03 06:46:58.936722','2','Propiedad - Foto',3,'',16,1),(15,'2022-12-03 06:46:58.942596','1','Propiedad - Foto',3,'',16,1),(16,'2022-12-04 20:11:02.254106','1','Agustin Basilio Matijasevich',2,'[{\"changed\": {\"fields\": [\"Foto perfil\"]}}]',4,1),(17,'2022-12-04 20:17:20.006465','1','Agustin Basilio Matijasevich',2,'[{\"changed\": {\"fields\": [\"Foto perfil\"]}}]',4,1),(18,'2022-12-04 20:18:00.882362','3','Daniel Cabrera',2,'[{\"changed\": {\"fields\": [\"Foto perfil\"]}}]',4,1),(19,'2022-12-04 20:18:37.999160','2','Alex Lopez Frutos',2,'[{\"changed\": {\"fields\": [\"Foto perfil\"]}}]',4,1),(20,'2022-12-04 20:19:16.944814','5','Un Cliente',2,'[{\"changed\": {\"fields\": [\"Foto perfil\"]}}]',4,1),(21,'2022-12-04 20:19:44.384804','4','Coca Cola SA',2,'[{\"changed\": {\"fields\": [\"Foto perfil\"]}}]',4,1),(22,'2022-12-04 20:36:16.478179','3','Imagen - Propiedad N°3',1,'[{\"added\": {}}]',16,1),(23,'2022-12-04 20:36:45.121017','4','Imagen - Propiedad N°4',1,'[{\"added\": {}}]',16,1),(24,'2022-12-04 20:37:00.806328','5','Imagen - Propiedad N°5',1,'[{\"added\": {}}]',16,1),(25,'2022-12-04 20:37:17.980978','6','Imagen - Propiedad N°6',1,'[{\"added\": {}}]',16,1),(26,'2022-12-04 20:37:52.664306','7','Imagen - Propiedad N°7',1,'[{\"added\": {}}]',16,1),(27,'2022-12-04 20:38:16.043831','8','Imagen - Propiedad N°8',1,'[{\"added\": {}}]',16,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (25,'admin','logentry'),(2,'auth','group'),(1,'auth','permission'),(3,'contenttypes','contenttype'),(26,'sessions','session'),(24,'user','aiatiendeciudad'),(5,'user','caja'),(23,'user','cierrecaja'),(22,'user','cita'),(6,'user','ciudad'),(21,'user','cobropendcliente'),(7,'user','contratocerrado'),(20,'user','contratorutadocumento'),(19,'user','deudacliente'),(18,'user','empleadocobropendiente'),(8,'user','idioma'),(9,'user','pais'),(17,'user','paishablaidioma'),(10,'user','propiedad'),(16,'user','propiedadrutadocumento'),(15,'user','propiedadrutaimagen'),(14,'user','provincia'),(11,'user','registrodecitas'),(12,'user','transaccion'),(13,'user','transaccionrutadocumento'),(4,'user','usuario');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-12-03 05:27:01.662452'),(2,'contenttypes','0002_remove_content_type_name','2022-12-03 05:27:02.378371'),(3,'auth','0001_initial','2022-12-03 05:27:04.053381'),(4,'auth','0002_alter_permission_name_max_length','2022-12-03 05:27:04.343997'),(5,'auth','0003_alter_user_email_max_length','2022-12-03 05:27:04.466173'),(6,'auth','0004_alter_user_username_opts','2022-12-03 05:27:04.585273'),(7,'auth','0005_alter_user_last_login_null','2022-12-03 05:27:04.703343'),(8,'auth','0006_require_contenttypes_0002','2022-12-03 05:27:04.811600'),(9,'auth','0007_alter_validators_add_error_messages','2022-12-03 05:27:04.928811'),(10,'auth','0008_alter_user_username_max_length','2022-12-03 05:27:05.048064'),(11,'auth','0009_alter_user_last_name_max_length','2022-12-03 05:27:05.164201'),(12,'auth','0010_alter_group_name_max_length','2022-12-03 05:27:05.376552'),(13,'auth','0011_update_proxy_permissions','2022-12-03 05:27:05.649607'),(14,'auth','0012_alter_user_first_name_max_length','2022-12-03 05:27:05.763924'),(15,'user','0001_initial','2022-12-03 05:27:25.836333'),(16,'admin','0001_initial','2022-12-03 05:52:10.255320'),(17,'admin','0002_logentry_remove_auto_add','2022-12-03 05:52:10.380268'),(18,'admin','0003_logentry_add_action_flag_choices','2022-12-03 05:52:10.512587'),(19,'sessions','0001_initial','2022-12-03 05:52:10.962818'),(20,'user','0002_auto_20221204_2008','2022-12-04 20:08:33.006624');
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
INSERT INTO `idioma` VALUES ('Aleman'),('Español'),('Guarani'),('Ingles'),('Portugues');
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
INSERT INTO `pais` VALUES ('Alemania'),('Argentina'),('Brasil'),('España'),('Estados Unidos'),('Paraguay'),('Uruguay');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais_habla_idioma`
--

LOCK TABLES `pais_habla_idioma` WRITE;
/*!40000 ALTER TABLE `pais_habla_idioma` DISABLE KEYS */;
INSERT INTO `pais_habla_idioma` VALUES (8,'Aleman','Alemania'),(1,'Español','Argentina'),(2,'Español','España'),(3,'Español','Paraguay'),(4,'Español','Uruguay'),(6,'Guarani','Paraguay'),(5,'Ingles','Estados Unidos'),(7,'Portugues','Brasil');
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
  UNIQUE KEY `Unica_Direccion` (`Direccion`,`ID_Ciudad_Propiedad`),
  KEY `propiedad_ID_Adquiere_o_Alquila_65f40cd2_fk_usuario_id` (`ID_Adquiere_o_Alquila`),
  KEY `propiedad_ID_Ciudad_Propiedad_201f9214_fk_ciudad_ID_Ciudad` (`ID_Ciudad_Propiedad`),
  KEY `propiedad_ID_Dueño_a9373bb4_fk_usuario_id` (`ID_Dueño`),
  CONSTRAINT `propiedad_ID_Adquiere_o_Alquila_65f40cd2_fk_usuario_id` FOREIGN KEY (`ID_Adquiere_o_Alquila`) REFERENCES `usuario` (`id`),
  CONSTRAINT `propiedad_ID_Ciudad_Propiedad_201f9214_fk_ciudad_ID_Ciudad` FOREIGN KEY (`ID_Ciudad_Propiedad`) REFERENCES `ciudad` (`ID_Ciudad`),
  CONSTRAINT `propiedad_ID_Dueño_a9373bb4_fk_usuario_id` FOREIGN KEY (`ID_Dueño`) REFERENCES `usuario` (`id`),
  CONSTRAINT `propiedad_chk_1` CHECK ((`Pisos` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
INSERT INTO `propiedad` VALUES (1,'GAL',1,200,'Italia 16','ALQ',200000,NULL,1,4),(2,'CAS',2,45,'Rodriguez Peña 619','VEN',50000000,NULL,1,4),(3,'TER',1,30,'Pringles 500','VEN',20000000,NULL,3,5),(4,'CAS',3,100,'Bousadas 800','ALQ',100000,NULL,3,5),(5,'CAMP',1,1000,'La Negra 946','ALQ',200000,5,6,4),(6,'GAL',1,100,'Rita Agote de Sustaita 691','ALQ',200000,4,1,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad_ruta_documento`
--

LOCK TABLES `propiedad_ruta_documento` WRITE;
/*!40000 ALTER TABLE `propiedad_ruta_documento` DISABLE KEYS */;
INSERT INTO `propiedad_ruta_documento` VALUES (3,'Propiedades/2022-12/0f360f5db4764e88a74dd4ff75aadaf0.jpg',1),(4,'Propiedades/2022-12/262d878cbd5e4cd1869ad545912b0b74.jpg',2),(5,'Propiedades/2022-12/c3065b13720741a39bc82de17eb861fd.jpg',3),(6,'Propiedades/2022-12/02eb15bb0bc247bca0ff271056b97239.jpg',4),(7,'Propiedades/2022-12/b744be777e21475eb52405d679abc795.jpg',5),(8,'Propiedades/2022-12/e18108c6cf0a4f96971b2bdfe83d2e4e.jpg',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Chaco','Argentina'),(3,'Cordoba','Argentina'),(2,'Santa Fe','Argentina');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_de_citas`
--

DROP TABLE IF EXISTS `registro_de_citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_de_citas` (
  `ID_Registro` int NOT NULL AUTO_INCREMENT,
  `NRO_Cita` int unsigned NOT NULL,
  `Fechas=>` varchar(8) NOT NULL,
  `FH_Creacion` datetime(6) NOT NULL,
  `FH_Asignacion` datetime(6) NOT NULL,
  `FH_Cita` datetime(6) NOT NULL,
  `FH_Conclusion` datetime(6) NOT NULL,
  `Secretaria=>` varchar(12) NOT NULL,
  `Nombre_Secretaria` varchar(50) NOT NULL,
  `Apellido_Secretaria` varchar(50) DEFAULT NULL,
  `DNI_Secretaria` varchar(20) NOT NULL,
  `Sexo_Secretaria` varchar(13) DEFAULT NULL,
  `Agente Inmobiliatio=>` varchar(21) NOT NULL,
  `Nombre_AI` varchar(50) NOT NULL,
  `Apellido_AI` varchar(50) DEFAULT NULL,
  `DNI_AI` varchar(20) NOT NULL,
  `Sexo_AI` varchar(13) DEFAULT NULL,
  `Cliente=>` varchar(9) NOT NULL,
  `Nombre_Cliente` varchar(50) NOT NULL,
  `Apellido_Cliente` varchar(50) DEFAULT NULL,
  `DNI_Cliente` varchar(20) NOT NULL,
  `Sexo_Cliente` varchar(13) DEFAULT NULL,
  `Propiedad=>` varchar(11) NOT NULL,
  `Ciudad_Prop` varchar(20) NOT NULL,
  `Provincia_Prop` varchar(20) NOT NULL,
  `Pais_Prop` varchar(20) NOT NULL,
  `Direccion_Prop` varchar(100) NOT NULL,
  `Tipo_Prop` varchar(12) NOT NULL,
  `Pisos_Prop` int unsigned NOT NULL,
  `Metros_Cuadrados_Prop` decimal(10,0) NOT NULL,
  `Estado_Prop` varchar(8) NOT NULL,
  `Dueño=>` varchar(7) NOT NULL,
  `Nombre_Dueño` varchar(50) NOT NULL,
  `Apellido_Dueño` varchar(50) DEFAULT NULL,
  `DNI_Dueño` varchar(20) NOT NULL,
  `Sexo_Dueño` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`ID_Registro`),
  CONSTRAINT `registro_de_citas_chk_1` CHECK ((`NRO_Cita` >= 0)),
  CONSTRAINT `registro_de_citas_chk_2` CHECK ((`Pisos_Prop` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_de_citas`
--

LOCK TABLES `registro_de_citas` WRITE;
/*!40000 ALTER TABLE `registro_de_citas` DISABLE KEYS */;
INSERT INTO `registro_de_citas` VALUES (1,5,'Fechas=>','2022-12-06 08:00:00.000000','2022-12-06 08:00:00.000000','2022-12-06 08:00:00.000000','2022-12-04 21:35:00.000000','Secretaria=>','Alex','Lopez Frutos','42568987','M','Agente Inmobiliatio=>','Daniel','Cabrera','41365753','M','Cliente=>','Un','Cliente','38562147','M','Propiedad=>','Resistencia','Chaco','Argentina','Italia 16','GAL',1,200,'ALQ','Dueño=>','Coca Cola','SA','20396541237','NE');
/*!40000 ALTER TABLE `registro_de_citas` ENABLE KEYS */;
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
  `foto_perfil` varchar(100) NOT NULL,
  `tipo_usuario` varchar(10) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'pbkdf2_sha256$390000$k01yOTxJdk870feVicae79$y16Ng8t5QniNpqQCMseoQprNBatw5UMVTxo+0SOTRSU=','2022-12-04 21:39:40.837534',1,'admin','43146475','agustinbasiliomatijasevich@gmail.com','Agustin','Basilio Matijasevich','M',700000,'ADM','Usuarios/2022-12/bae73143a3074f3a9779d1a103c9fdee.jpg','EAS',1),(2,'pbkdf2_sha256$390000$zuKaRFSGcjLNc2jKwOiZkS$1tHLtm1aYqpzotL5Hoj9X5APLYs/zvUpzHQa3Agk3eE=','2022-12-04 23:00:52.175374',0,'secretario','42568987','alexkapo@hotmail.com','Alex','Lopez Frutos','M',500000,'COM','Usuarios/2022-12/9755fd0843d148d090120162d5b1def5.jpg','ES',1),(3,'pbkdf2_sha256$390000$4fmg0O4HHvGYd0mZxATE6i$giWSLBAVz7YwXfXrltQqWmmX0I48nPJ/z7Y+InMgfbs=','2022-12-04 23:00:07.828839',0,'agenteinmobiliario','41365753','cabreradaniel@gmail.com','Daniel','Cabrera','M',5000,'COM','Usuarios/2022-12/0bf08392d4fc4377a61cb79cd950a13e.jpg','EAI',1),(4,'pbkdf2_sha256$390000$lHOQUlHGTHw8JyxRxv7NxE$zrZ3vNkjxCpTphIr2WdrPX9OAZcC/SCsJns+JOXjdaM=','2022-12-03 06:11:30.000000',0,'cocacola','20396541237','CocaCola@gmail.com','Coca Cola','SA','NE',NULL,NULL,'Usuarios/2022-12/8d90a0e8c13448e0b690d9bdf6c6106c.png','CC',0),(5,'pbkdf2_sha256$390000$i7YoaV55ReJqhv8kfQ9FoE$YoKxmFNc0iIpY5gXRN1cvWwukCULRRmvVEFeO7Jl4s8=','2022-12-03 06:10:15.000000',0,'cliente','38562147','cliente@gmail.com','Un','Cliente','M',NULL,NULL,'Usuarios/2022-12/a62b5717cf2640d59a92fcaa38d190c7.jpg','CP',0);
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

-- Dump completed on 2022-12-05 10:16:10
