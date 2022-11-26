CREATE TABLE domus.Pais_Habla_Idioma (
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
