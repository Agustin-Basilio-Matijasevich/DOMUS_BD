CREATE TABLE domus.Ciudad (
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
