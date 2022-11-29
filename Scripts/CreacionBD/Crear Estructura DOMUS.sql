CREATE TABLE Usuario (
	ID_Usuario INT UNSIGNED auto_increment NOT NULL,
	DNI INT UNSIGNED NOT NULL,
	Nombres varchar(50) NOT NULL,
	Apellidos varchar(50) NULL,
	Sexo ENUM ('Masculino','Femenino','No Especifica') NULL,
	Salario_Mensual DECIMAL NULL,
	Departamento ENUM ('Comercializacion','Administracion') NULL,
	Foto_Perfil BLOB NULL,
	Tipo_Usuario ENUM ('Cliente_Particular','Cliente_Corporativo','Empleado_Secretario','Empleado_Agente Inmobiliario','Empleado_Marketing','Empleado_Cajero','Empleado_Jefe de Departamento','Empleado_Administrador de Sistema','Empleado_Gerente General') NOT NULL,
	Correo varchar(50) NULL,
	username varchar(20) NOT NULL,
	password BLOB NOT NULL,
	CONSTRAINT Usuario_PK PRIMARY KEY (ID_Usuario),
	CONSTRAINT username_UK UNIQUE KEY (username)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Usuarios del Sistema'
AUTO_INCREMENT=1;

CREATE TABLE Idioma (
	Nombre_Idioma varchar(20) NOT NULL,
	CONSTRAINT Idioma_pk PRIMARY KEY (Nombre_Idioma)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Idiomas del Mundo';

CREATE TABLE Pais (
	Nombre_Pais varchar(20) NOT NULL,
	CONSTRAINT Pais_pk PRIMARY KEY (Nombre_Pais)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Paises del Mundo';

CREATE TABLE Pais_Habla_Idioma (
	Nombre_Idioma_Idioma varchar(20) NOT NULL,
	Nombre_Pais_Pais varchar(20) NOT NULL,
	CONSTRAINT Pais_Habla_Idioma_pk PRIMARY KEY (Nombre_Idioma_Idioma,Nombre_Pais_Pais),
	CONSTRAINT Pais_Habla_Idioma_FK FOREIGN KEY (Nombre_Idioma_Idioma) REFERENCES domus.idioma(Nombre_Idioma) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT Pais_Habla_Idioma_FK_1 FOREIGN KEY (Nombre_Pais_Pais) REFERENCES domus.pais(Nombre_Pais) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Conexion entre Paises e Idiomas que se hablan en el mismo';

CREATE TABLE Provincia (
	Nombre_Provincia varchar(20) NOT NULL,
	Nombre_Pais_Provincia varchar(20) NOT NULL,
	CONSTRAINT Provincia_pk PRIMARY KEY (Nombre_Provincia,Nombre_Pais_Provincia),
	CONSTRAINT Provincia_FK FOREIGN KEY (Nombre_Pais_Provincia) REFERENCES domus.pais(Nombre_Pais) ON DELETE CASCADE ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Provincias de un Pais';

CREATE TABLE Ciudad (
	Nombre_Ciudad varchar(20) NOT NULL,
	Nombre_Provincia_Ciudad varchar(20) NOT NULL,
	Nombre_Pais_Ciudad varchar(20) NOT NULL,
	CONSTRAINT Ciudad_pk PRIMARY KEY (Nombre_Ciudad,Nombre_Provincia_Ciudad,Nombre_Pais_Ciudad),
	CONSTRAINT Ciudad_FK FOREIGN KEY (Nombre_Provincia_Ciudad,Nombre_Pais_Ciudad) REFERENCES domus.provincia(Nombre_Provincia,Nombre_Pais_Provincia) ON DELETE CASCADE ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Ciudades de una Provincia';

CREATE TABLE AI_Atiende_Ciudad (
	Nombre_Ciudad_AI varchar(20) NOT NULL,
	Nombre_Provincia_AI varchar(20) NOT NULL,
	Nombre_Pais_AI varchar(20) NOT NULL,
	ID_AI INT UNSIGNED NOT NULL,
	CONSTRAINT AI_Atiende_Ciudad_pk PRIMARY KEY (Nombre_Ciudad_AI,Nombre_Provincia_AI,Nombre_Pais_AI,ID_AI),
	CONSTRAINT AI_Atiende_Ciudad_FK FOREIGN KEY (Nombre_Ciudad_AI,Nombre_Provincia_AI,Nombre_Pais_AI) REFERENCES domus.ciudad(Nombre_Ciudad,Nombre_Provincia_Ciudad,Nombre_Pais_Ciudad) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT AI_Atiende_Ciudad_FK_1 FOREIGN KEY (ID_AI) REFERENCES domus.usuario(ID_Usuario) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Conexion entre Agentes Inmobiliarios y ciudades para saber que zonas trabajan';

CREATE TABLE Propiedad (
	ID_Propiedad INT UNSIGNED auto_increment NOT NULL,
	ID_Dueño INT UNSIGNED NOT NULL,
	ID_Adquiere_o_Alquila INT UNSIGNED NULL,
	Nombre_Ciudad_Propiedad varchar(20) NOT NULL,
	Nombre_Provincia_Propiedad varchar(20) NOT NULL,
	Nombre_Pais_Propiedad varchar(20) NOT NULL,
	Tipo_Propiedad ENUM ('Casa','Departamento','Galpon','Campo','Terreno') NOT NULL,
	Pisos INT UNSIGNED NOT NULL,
	Metros_Cuadrados DECIMAL NOT NULL,
	Direccion varchar(100) NOT NULL,
	Estado_Propiedad ENUM ('Venta','Alquiler') NOT NULL,
	CONSTRAINT Propiedad_pk PRIMARY KEY (ID_Propiedad),
	CONSTRAINT UbicadaEnCiudad_FK FOREIGN KEY (Nombre_Ciudad_Propiedad,Nombre_Provincia_Propiedad,Nombre_Pais_Propiedad) REFERENCES domus.ciudad(Nombre_Ciudad,Nombre_Provincia_Ciudad,Nombre_Pais_Ciudad) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT Dueño_FK FOREIGN KEY (ID_Dueño) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Locatario_FK FOREIGN KEY (ID_Adquiere_o_Alquila) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Propiedades Administradas por la Empresa'
AUTO_INCREMENT=1;

CREATE TABLE Propiedad_Ruta_Documento (
	ID_Propiedad_Documento INT UNSIGNED NOT NULL,
	Ruta_PD varchar(100) NOT NULL,
	CONSTRAINT Propiedad_Ruta_Documento_pk PRIMARY KEY (ID_Propiedad_Documento,Ruta_PD),
	CONSTRAINT Propiedad_Ruta_Documento_FK FOREIGN KEY (ID_Propiedad_Documento) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Rutas a documentos afines a la propiedad';

CREATE TABLE Propiedad_Ruta_Imagen (
	ID_Propiedad_Imagen INT UNSIGNED NOT NULL,
	Ruta_PI varchar(100) NOT NULL,
	CONSTRAINT Propiedad_Ruta_Imagen_pk PRIMARY KEY (ID_Propiedad_Imagen,Ruta_PI),
	CONSTRAINT Propiedad_Ruta_Imagen_FK FOREIGN KEY (ID_Propiedad_Imagen) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Imagenes afines a la propiedad';

CREATE TABLE Cita (
	NRO_Cita INT UNSIGNED auto_increment NOT NULL,
	F_Creacion_Cita DATE NOT NULL,
	H_Creacion_Cita TIME NOT NULL,
	F_Asignacion_Cita DATE NULL,
	H_Asignacion_Cita TIME NULL,
	F_Cita DATE NULL,
	H_Cita TIME NULL,
	F_Concluye_Cita DATE NULL,
	H_Concluye_Cita TIME NULL,
	Secre_Asigna_Cita INT UNSIGNED NULL,
	AI_Atiende_Cita INT UNSIGNED NULL,
	Client_Solicita_Cita INT UNSIGNED NOT NULL,
	Propiedad_Involucrada INT UNSIGNED NOT NULL,
	Tipo_Cita ENUM ('Solicitud','Agendada') NOT NULL,
	CONSTRAINT Cita_pk PRIMARY KEY (NRO_Cita),
	CONSTRAINT `Secre-Asigna_FK` FOREIGN KEY (Secre_Asigna_Cita) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT `AI-Atiende_FK` FOREIGN KEY (AI_Atiende_Cita) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT `Clien-Solicita_FK` FOREIGN KEY (Client_Solicita_Cita) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT `Prop-Involuc_FK` FOREIGN KEY (Propiedad_Involucrada) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Citas de Clientes con Agentes Inmobiliarios'
AUTO_INCREMENT=1;

CREATE TABLE Contrato_Cerrado (
	NRO_Contrato INT UNSIGNED auto_increment NOT NULL,
	F_Creacion_Contrato DATE NOT NULL,
	F_Caduca_Contrato DATE NULL,
	Monto DECIMAL NOT NULL,
	Tipo_Contrato ENUM ('Alquiler','Venta') NOT NULL,
	AI_Responsable_Contrato INT UNSIGNED NOT NULL,
	Client_Involucrado_Contrato INT UNSIGNED NOT NULL,
	Prop_Involucrada_Contrato INT UNSIGNED NOT NULL,
	CONSTRAINT Contrato_Cerrado_pk PRIMARY KEY (NRO_Contrato),
	CONSTRAINT Responsable_ContratoFK FOREIGN KEY (AI_Responsable_Contrato) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Cliente_ContratoFK FOREIGN KEY (Client_Involucrado_Contrato) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Propiedad_ContratoFK FOREIGN KEY (Prop_Involucrada_Contrato) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Contratos Firmados y Cerrados con documentacion'
AUTO_INCREMENT=1;

CREATE TABLE Contrato_Ruta_Documento (
	NRO_Contrato_Documento INT UNSIGNED NOT NULL,
	Ruta_CD varchar(100) NOT NULL,
	CONSTRAINT Contrato_Ruta_Documento_pk PRIMARY KEY (NRO_Contrato_Documento,Ruta_CD),
	CONSTRAINT Contrato_Ruta_Documento_FK FOREIGN KEY (NRO_Contrato_Documento) REFERENCES domus.contrato_cerrado(NRO_Contrato) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Documentos afines al contrato';

CREATE TABLE Empleado_Cobro_Pendiente (
	NRO_Cobro INT UNSIGNED auto_increment NOT NULL,
	ID_Empleado_Cobra INT UNSIGNED NOT NULL,
	F_Creacion_CobroP DATE NOT NULL,
	H_Creacion_CobroP TIME NOT NULL,
	Monto_Cobro_Empleado DECIMAL NOT NULL,
	Descripcion_Cobro_Empleado varchar(100) NULL,
	Tipo_Cobro_Empleado ENUM ('Sueldo','Comision') NOT NULL,
	CONSTRAINT Empleado_Cobro_Pendiente_pk PRIMARY KEY (NRO_Cobro),
	CONSTRAINT Empleado_Cobro_Pendiente_FK FOREIGN KEY (ID_Empleado_Cobra) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Cobros Pendientes por Empleados (Sueldos, Comisiones)'
AUTO_INCREMENT=1;

CREATE TABLE Caja (
	ID_Caja INT UNSIGNED auto_increment NOT NULL,
	Descripcion_Caja varchar(100) NOT NULL,
	IsOpen BIT DEFAULT FALSE NOT NULL,
	CONSTRAINT Caja_pk PRIMARY KEY (ID_Caja)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Cajas de la Empresa (Dinero)'
AUTO_INCREMENT=1;

CREATE TABLE Cierre_Caja (
	ID_Caja_Cierre INT UNSIGNED NOT NULL,
	Fecha_Cierre_Caja DATE NOT NULL,
	Monto_Cierre DECIMAL NOT NULL,
	CONSTRAINT Cierre_Diario_Caja_pk PRIMARY KEY (ID_Caja_Cierre,Fecha_Cierre_Caja),
	CONSTRAINT Cierre_Diario_Caja_FK FOREIGN KEY (ID_Caja_Cierre) REFERENCES domus.caja(ID_Caja) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Registro de Cierre de Caja Diario';

CREATE TABLE Transaccion (
	NRO_Transaccion INT UNSIGNED auto_increment NOT NULL,
	F_Creacion_Transaccion DATE NOT NULL,
	H_Creacion_Transaccion TIME NOT NULL,
	Monto_Transaccion DECIMAL NOT NULL,
	Tipo_Transaccion ENUM ('Pago Sueldo','Cobro Alquiler','Pago Alquiler','Cobro Venta','Pago Venta') NOT NULL,
	Descripcion_Transaccion varchar(100) NULL,
	ID_Caja_Transaccion INT UNSIGNED NOT NULL,
	Cajera_Responsable_Transaccion INT UNSIGNED NOT NULL,
	Emp_Cobra_Transaccion INT UNSIGNED NULL,
	`Client_Paga-Cobra_Transaccion` INT UNSIGNED NULL,
	Prop_Involucrada_Transaccion INT UNSIGNED NULL,
	CONSTRAINT Transaccion_pk PRIMARY KEY (NRO_Transaccion),
	CONSTRAINT Fue_con_Caja_FK FOREIGN KEY (ID_Caja_Transaccion) REFERENCES domus.caja(ID_Caja) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Cobro_Cajera_FK FOREIGN KEY (Cajera_Responsable_Transaccion) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Se_Pago_Empleado_FK FOREIGN KEY (Emp_Cobra_Transaccion) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Incluye_Cliente_FK FOREIGN KEY (`Client_Paga-Cobra_Transaccion`) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Incluye_Propiedad_FK FOREIGN KEY (Prop_Involucrada_Transaccion) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Transacciones de Dinero'
AUTO_INCREMENT=1;

CREATE TABLE Transaccion_Ruta_Documento (
	NRO_Transaccion_Documento INT UNSIGNED NOT NULL,
	Ruta_DT varchar(100) NOT NULL,
	CONSTRAINT Transaccion_Ruta_Documento_pk PRIMARY KEY (NRO_Transaccion_Documento,Ruta_DT),
	CONSTRAINT Transaccion_Ruta_Documento_FK FOREIGN KEY (NRO_Transaccion_Documento) REFERENCES domus.transaccion(NRO_Transaccion) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Documentos afines a la Transaccion';

CREATE TABLE Deuda_Cliente (
	NRO_Deuda_Cliente INT UNSIGNED auto_increment NOT NULL,
	F_Creacion_Deuda DATE NOT NULL,
	Monto_Deuda DECIMAL NOT NULL,
	ID_Cliente_Debe INT UNSIGNED NOT NULL,
	ID_Propiedad_Deuda INT UNSIGNED NOT NULL,
	CONSTRAINT Deuda_Cliente_pk PRIMARY KEY (NRO_Deuda_Cliente),
	CONSTRAINT Deuda_Cliente_FK FOREIGN KEY (ID_Cliente_Debe) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Deuda_Cliente_FK_1 FOREIGN KEY (ID_Propiedad_Deuda) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Deudas de Clientes por Alquileres o Ventas'
AUTO_INCREMENT=1;

CREATE TABLE Cobro_Pend_Cliente (
	NRO_Cobro_P_Cliente INT UNSIGNED auto_increment NOT NULL,
	F_Creacion_Cobro_PC DATE NOT NULL,
	Monto_Cobro_PC DECIMAL NOT NULL,
	ID_Cliente_Cobra INT UNSIGNED NOT NULL,
	ID_Prop_Involuc_CPC INT UNSIGNED NOT NULL,
	CONSTRAINT Cobro_Pend_Cliente_pk PRIMARY KEY (NRO_Cobro_P_Cliente),
	CONSTRAINT Cobro_Pend_Cliente_FK FOREIGN KEY (ID_Cliente_Cobra) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Cobro_Pend_Cliente_FK_1 FOREIGN KEY (ID_Prop_Involuc_CPC) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Dinero que los clientes deben venir a cobrar de alquileres o ventas'
AUTO_INCREMENT=1;
