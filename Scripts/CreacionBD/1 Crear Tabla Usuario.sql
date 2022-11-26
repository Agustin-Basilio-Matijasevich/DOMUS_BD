CREATE TABLE domus.Usuario (
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
