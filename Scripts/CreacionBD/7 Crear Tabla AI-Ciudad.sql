CREATE TABLE domus.AI_Atiende_Ciudad (
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
