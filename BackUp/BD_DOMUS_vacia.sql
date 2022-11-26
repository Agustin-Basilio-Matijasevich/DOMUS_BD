-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: electronicanordeste.tplinkdns.com    Database: domus
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
  `Nombre_Ciudad_AI` varchar(20) NOT NULL,
  `Nombre_Provincia_AI` varchar(20) NOT NULL,
  `Nombre_Pais_AI` varchar(20) NOT NULL,
  `ID_AI` int unsigned NOT NULL,
  PRIMARY KEY (`Nombre_Ciudad_AI`,`Nombre_Provincia_AI`,`Nombre_Pais_AI`,`ID_AI`),
  KEY `AI_Atiende_Ciudad_FK_1` (`ID_AI`),
  CONSTRAINT `AI_Atiende_Ciudad_FK` FOREIGN KEY (`Nombre_Ciudad_AI`, `Nombre_Provincia_AI`, `Nombre_Pais_AI`) REFERENCES `ciudad` (`Nombre_Ciudad`, `Nombre_Provincia_Ciudad`, `Nombre_Pais_Ciudad`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `AI_Atiende_Ciudad_FK_1` FOREIGN KEY (`ID_AI`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Conexion entre Agentes Inmobiliarios y ciudades para saber que zonas trabajan';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja` (
  `ID_Caja` int unsigned NOT NULL AUTO_INCREMENT,
  `Descripcion_Caja` varchar(100) NOT NULL,
  `IsOpen` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID_Caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cajas de la Empresa (Dinero)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cierre_caja`
--

DROP TABLE IF EXISTS `cierre_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cierre_caja` (
  `ID_Caja_Cierre` int unsigned NOT NULL,
  `Fecha_Cierre_Caja` date NOT NULL,
  `Monto_Cierre` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID_Caja_Cierre`,`Fecha_Cierre_Caja`),
  CONSTRAINT `Cierre_Diario_Caja_FK` FOREIGN KEY (`ID_Caja_Cierre`) REFERENCES `caja` (`ID_Caja`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro de Cierre de Caja Diario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `NRO_Cita` int unsigned NOT NULL AUTO_INCREMENT,
  `F_Creacion_Cita` date NOT NULL,
  `H_Creacion_Cita` time NOT NULL,
  `F_Asignacion_Cita` date DEFAULT NULL,
  `H_Asignacion_Cita` time DEFAULT NULL,
  `F_Cita` date DEFAULT NULL,
  `H_Cita` time DEFAULT NULL,
  `F_Concluye_Cita` date DEFAULT NULL,
  `H_Concluye_Cita` time DEFAULT NULL,
  `Secre_Asigna_Cita` int unsigned DEFAULT NULL,
  `AI_Atiende_Cita` int unsigned DEFAULT NULL,
  `Client_Solicita_Cita` int unsigned NOT NULL,
  `Propiedad_Involucrada` int unsigned NOT NULL,
  `Tipo_Cita` enum('Solicitud','Agendada') NOT NULL,
  PRIMARY KEY (`NRO_Cita`),
  KEY `Secre-Asigna_FK` (`Secre_Asigna_Cita`),
  KEY `AI-Atiende_FK` (`AI_Atiende_Cita`),
  KEY `Clien-Solicita_FK` (`Client_Solicita_Cita`),
  KEY `Prop-Involuc_FK` (`Propiedad_Involucrada`),
  CONSTRAINT `AI-Atiende_FK` FOREIGN KEY (`AI_Atiende_Cita`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Clien-Solicita_FK` FOREIGN KEY (`Client_Solicita_Cita`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Prop-Involuc_FK` FOREIGN KEY (`Propiedad_Involucrada`) REFERENCES `propiedad` (`ID_Propiedad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Secre-Asigna_FK` FOREIGN KEY (`Secre_Asigna_Cita`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Citas de Clientes con Agentes Inmobiliarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `Nombre_Ciudad` varchar(20) NOT NULL,
  `Nombre_Provincia_Ciudad` varchar(20) NOT NULL,
  `Nombre_Pais_Ciudad` varchar(20) NOT NULL,
  PRIMARY KEY (`Nombre_Ciudad`,`Nombre_Provincia_Ciudad`,`Nombre_Pais_Ciudad`),
  KEY `Ciudad_FK` (`Nombre_Provincia_Ciudad`,`Nombre_Pais_Ciudad`),
  CONSTRAINT `Ciudad_FK` FOREIGN KEY (`Nombre_Provincia_Ciudad`, `Nombre_Pais_Ciudad`) REFERENCES `provincia` (`Nombre_Provincia`, `Nombre_Pais_Provincia`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ciudades de una Provincia';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cobro_pend_cliente`
--

DROP TABLE IF EXISTS `cobro_pend_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cobro_pend_cliente` (
  `NRO_Cobro_P_Cliente` int unsigned NOT NULL AUTO_INCREMENT,
  `F_Creacion_Cobro_PC` date NOT NULL,
  `Monto_Cobro_PC` decimal(10,0) NOT NULL,
  `ID_Cliente_Cobra` int unsigned NOT NULL,
  `ID_Prop_Involuc_CPC` int unsigned NOT NULL,
  PRIMARY KEY (`NRO_Cobro_P_Cliente`),
  KEY `Cobro_Pend_Cliente_FK` (`ID_Cliente_Cobra`),
  KEY `Cobro_Pend_Cliente_FK_1` (`ID_Prop_Involuc_CPC`),
  CONSTRAINT `Cobro_Pend_Cliente_FK` FOREIGN KEY (`ID_Cliente_Cobra`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Cobro_Pend_Cliente_FK_1` FOREIGN KEY (`ID_Prop_Involuc_CPC`) REFERENCES `propiedad` (`ID_Propiedad`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dinero que los clientes deben venir a cobrar de alquileres o ventas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contrato_cerrado`
--

DROP TABLE IF EXISTS `contrato_cerrado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato_cerrado` (
  `NRO_Contrato` int unsigned NOT NULL AUTO_INCREMENT,
  `F_Creacion_Contrato` date NOT NULL,
  `F_Caduca_Contrato` date DEFAULT NULL,
  `Monto` decimal(10,0) NOT NULL,
  `Tipo_Contrato` enum('Alquiler','Venta') NOT NULL,
  `AI_Responsable_Contrato` int unsigned NOT NULL,
  `Client_Involucrado_Contrato` int unsigned NOT NULL,
  `Prop_Involucrada_Contrato` int unsigned NOT NULL,
  PRIMARY KEY (`NRO_Contrato`),
  KEY `Responsable_ContratoFK` (`AI_Responsable_Contrato`),
  KEY `Cliente_ContratoFK` (`Client_Involucrado_Contrato`),
  KEY `Propiedad_ContratoFK` (`Prop_Involucrada_Contrato`),
  CONSTRAINT `Cliente_ContratoFK` FOREIGN KEY (`Client_Involucrado_Contrato`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Propiedad_ContratoFK` FOREIGN KEY (`Prop_Involucrada_Contrato`) REFERENCES `propiedad` (`ID_Propiedad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Responsable_ContratoFK` FOREIGN KEY (`AI_Responsable_Contrato`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contratos Firmados y Cerrados con documentacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contrato_ruta_documento`
--

DROP TABLE IF EXISTS `contrato_ruta_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato_ruta_documento` (
  `NRO_Contrato_Documento` int unsigned NOT NULL,
  `Ruta_CD` varchar(100) NOT NULL,
  PRIMARY KEY (`NRO_Contrato_Documento`,`Ruta_CD`),
  CONSTRAINT `Contrato_Ruta_Documento_FK` FOREIGN KEY (`NRO_Contrato_Documento`) REFERENCES `contrato_cerrado` (`NRO_Contrato`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Documentos afines al contrato';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deuda_cliente`
--

DROP TABLE IF EXISTS `deuda_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deuda_cliente` (
  `NRO_Deuda_Cliente` int unsigned NOT NULL AUTO_INCREMENT,
  `F_Creacion_Deuda` date NOT NULL,
  `Monto_Deuda` decimal(10,0) NOT NULL,
  `ID_Cliente_Debe` int unsigned NOT NULL,
  `ID_Propiedad_Deuda` int unsigned NOT NULL,
  PRIMARY KEY (`NRO_Deuda_Cliente`),
  KEY `Deuda_Cliente_FK` (`ID_Cliente_Debe`),
  KEY `Deuda_Cliente_FK_1` (`ID_Propiedad_Deuda`),
  CONSTRAINT `Deuda_Cliente_FK` FOREIGN KEY (`ID_Cliente_Debe`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Deuda_Cliente_FK_1` FOREIGN KEY (`ID_Propiedad_Deuda`) REFERENCES `propiedad` (`ID_Propiedad`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Deudas de Clientes por Alquileres o Ventas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empleado_cobro_pendiente`
--

DROP TABLE IF EXISTS `empleado_cobro_pendiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_cobro_pendiente` (
  `NRO_Cobro` int unsigned NOT NULL AUTO_INCREMENT,
  `ID_Empleado_Cobra` int unsigned NOT NULL,
  `F_Creacion_CobroP` date NOT NULL,
  `H_Creacion_CobroP` time NOT NULL,
  `Monto_Cobro_Empleado` decimal(10,0) NOT NULL,
  `Descripcion_Cobro_Empleado` varchar(100) DEFAULT NULL,
  `Tipo_Cobro_Empleado` enum('Sueldo','Comision') NOT NULL,
  PRIMARY KEY (`NRO_Cobro`),
  KEY `Empleado_Cobro_Pendiente_FK` (`ID_Empleado_Cobra`),
  CONSTRAINT `Empleado_Cobro_Pendiente_FK` FOREIGN KEY (`ID_Empleado_Cobra`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cobros Pendientes por Empleados (Sueldos, Comisiones)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idioma` (
  `Nombre_Idioma` varchar(20) NOT NULL,
  PRIMARY KEY (`Nombre_Idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Idiomas del Mundo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `Nombre_Pais` varchar(20) NOT NULL,
  PRIMARY KEY (`Nombre_Pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Paises del Mundo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pais_habla_idioma`
--

DROP TABLE IF EXISTS `pais_habla_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais_habla_idioma` (
  `Nombre_Idioma_Idioma` varchar(20) NOT NULL,
  `Nombre_Pais_Pais` varchar(20) NOT NULL,
  PRIMARY KEY (`Nombre_Idioma_Idioma`,`Nombre_Pais_Pais`),
  KEY `Pais_Habla_Idioma_FK_1` (`Nombre_Pais_Pais`),
  CONSTRAINT `Pais_Habla_Idioma_FK` FOREIGN KEY (`Nombre_Idioma_Idioma`) REFERENCES `idioma` (`Nombre_Idioma`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Pais_Habla_Idioma_FK_1` FOREIGN KEY (`Nombre_Pais_Pais`) REFERENCES `pais` (`Nombre_Pais`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Conexion entre Paises e Idiomas que se hablan en el mismo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propiedad`
--

DROP TABLE IF EXISTS `propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedad` (
  `ID_Propiedad` int unsigned NOT NULL AUTO_INCREMENT,
  `ID_Dueño` int unsigned NOT NULL,
  `ID_Adquiere_o_Alquila` int unsigned DEFAULT NULL,
  `Nombre_Ciudad_Propiedad` varchar(20) NOT NULL,
  `Nombre_Provincia_Propiedad` varchar(20) NOT NULL,
  `Nombre_Pais_Propiedad` varchar(20) NOT NULL,
  `Tipo_Propiedad` enum('Casa','Departamento','Galpon','Campo','Terreno') NOT NULL,
  `Pisos` int unsigned NOT NULL,
  `Metros_Cuadrados` decimal(10,0) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Estado_Propiedad` enum('Venta','Alquiler') NOT NULL,
  PRIMARY KEY (`ID_Propiedad`),
  KEY `UbicadaEnCiudad_FK` (`Nombre_Ciudad_Propiedad`,`Nombre_Provincia_Propiedad`,`Nombre_Pais_Propiedad`),
  KEY `Dueño_FK` (`ID_Dueño`),
  KEY `Locatario_FK` (`ID_Adquiere_o_Alquila`),
  CONSTRAINT `Dueño_FK` FOREIGN KEY (`ID_Dueño`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Locatario_FK` FOREIGN KEY (`ID_Adquiere_o_Alquila`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `UbicadaEnCiudad_FK` FOREIGN KEY (`Nombre_Ciudad_Propiedad`, `Nombre_Provincia_Propiedad`, `Nombre_Pais_Propiedad`) REFERENCES `ciudad` (`Nombre_Ciudad`, `Nombre_Provincia_Ciudad`, `Nombre_Pais_Ciudad`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Propiedades Administradas por la Empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propiedad_ruta_documento`
--

DROP TABLE IF EXISTS `propiedad_ruta_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedad_ruta_documento` (
  `ID_Propiedad_Documento` int unsigned NOT NULL,
  `Ruta_PD` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Propiedad_Documento`,`Ruta_PD`),
  CONSTRAINT `Propiedad_Ruta_Documento_FK` FOREIGN KEY (`ID_Propiedad_Documento`) REFERENCES `propiedad` (`ID_Propiedad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Rutas a documentos afines a la propiedad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propiedad_ruta_imagen`
--

DROP TABLE IF EXISTS `propiedad_ruta_imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedad_ruta_imagen` (
  `ID_Propiedad_Imagen` int unsigned NOT NULL,
  `Ruta_PI` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Propiedad_Imagen`,`Ruta_PI`),
  CONSTRAINT `Propiedad_Ruta_Imagen_FK` FOREIGN KEY (`ID_Propiedad_Imagen`) REFERENCES `propiedad` (`ID_Propiedad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Imagenes afines a la propiedad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `Nombre_Provincia` varchar(20) NOT NULL,
  `Nombre_Pais_Provincia` varchar(20) NOT NULL,
  PRIMARY KEY (`Nombre_Provincia`,`Nombre_Pais_Provincia`),
  KEY `Provincia_FK` (`Nombre_Pais_Provincia`),
  CONSTRAINT `Provincia_FK` FOREIGN KEY (`Nombre_Pais_Provincia`) REFERENCES `pais` (`Nombre_Pais`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Provincias de un Pais';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `NRO_Transaccion` int unsigned NOT NULL AUTO_INCREMENT,
  `F_Creacion_Transaccion` date NOT NULL,
  `H_Creacion_Transaccion` time NOT NULL,
  `Monto_Transaccion` decimal(10,0) NOT NULL,
  `Tipo_Transaccion` enum('Pago Sueldo','Cobro Alquiler','Pago Alquiler','Cobro Venta','Pago Venta') NOT NULL,
  `Descripcion_Transaccion` varchar(100) DEFAULT NULL,
  `ID_Caja_Transaccion` int unsigned NOT NULL,
  `Cajera_Responsable_Transaccion` int unsigned NOT NULL,
  `Emp_Cobra_Transaccion` int unsigned DEFAULT NULL,
  `Client_Paga-Cobra_Transaccion` int unsigned DEFAULT NULL,
  `Prop_Involucrada_Transaccion` int unsigned DEFAULT NULL,
  PRIMARY KEY (`NRO_Transaccion`),
  KEY `Fue_con_Caja_FK` (`ID_Caja_Transaccion`),
  KEY `Cobro_Cajera_FK` (`Cajera_Responsable_Transaccion`),
  KEY `Se_Pago_Empleado_FK` (`Emp_Cobra_Transaccion`),
  KEY `Incluye_Cliente_FK` (`Client_Paga-Cobra_Transaccion`),
  KEY `Incluye_Propiedad_FK` (`Prop_Involucrada_Transaccion`),
  CONSTRAINT `Cobro_Cajera_FK` FOREIGN KEY (`Cajera_Responsable_Transaccion`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Fue_con_Caja_FK` FOREIGN KEY (`ID_Caja_Transaccion`) REFERENCES `caja` (`ID_Caja`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Incluye_Cliente_FK` FOREIGN KEY (`Client_Paga-Cobra_Transaccion`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Incluye_Propiedad_FK` FOREIGN KEY (`Prop_Involucrada_Transaccion`) REFERENCES `propiedad` (`ID_Propiedad`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Se_Pago_Empleado_FK` FOREIGN KEY (`Emp_Cobra_Transaccion`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Transacciones de Dinero';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaccion_ruta_documento`
--

DROP TABLE IF EXISTS `transaccion_ruta_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion_ruta_documento` (
  `NRO_Transaccion_Documento` int unsigned NOT NULL,
  `Ruta_DT` varchar(100) NOT NULL,
  PRIMARY KEY (`NRO_Transaccion_Documento`,`Ruta_DT`),
  CONSTRAINT `Transaccion_Ruta_Documento_FK` FOREIGN KEY (`NRO_Transaccion_Documento`) REFERENCES `transaccion` (`NRO_Transaccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Documentos afines a la Transaccion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_Usuario` int unsigned NOT NULL AUTO_INCREMENT,
  `DNI` int unsigned NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Sexo` enum('Masculino','Femenino','No Especifica') DEFAULT NULL,
  `Salario_Mensual` decimal(10,0) DEFAULT NULL,
  `Departamento` enum('Comercializacion','Administracion') DEFAULT NULL,
  `Foto_Perfil` blob,
  `Tipo_Usuario` enum('Cliente_Particular','Cliente_Corporativo','Empleado_Secretario','Empleado_Agente Inmobiliario','Empleado_Marketing','Empleado_Cajero','Empleado_Jefe de Departamento','Empleado_Administrador de Sistema','Empleado_Gerente General') NOT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` blob NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `username_UK` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Usuarios del Sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'domus'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-26  9:30:10
