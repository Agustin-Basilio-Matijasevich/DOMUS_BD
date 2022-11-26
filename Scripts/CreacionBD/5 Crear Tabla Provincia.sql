CREATE TABLE domus.Provincia (
	Nombre_Provincia varchar(20) NOT NULL,
	Nombre_Pais_Provincia varchar(20) NOT NULL,
	CONSTRAINT Provincia_pk PRIMARY KEY (Nombre_Provincia,Nombre_Pais_Provincia),
	CONSTRAINT Provincia_FK FOREIGN KEY (Nombre_Pais_Provincia) REFERENCES domus.pais(Nombre_Pais) ON DELETE CASCADE ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Provincias de un Pais';
