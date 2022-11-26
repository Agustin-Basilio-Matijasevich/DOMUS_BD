CREATE TABLE domus.Propiedad_Ruta_Imagen (
	ID_Propiedad_Imagen INT UNSIGNED NOT NULL,
	Ruta_PI varchar(100) NOT NULL,
	CONSTRAINT Propiedad_Ruta_Imagen_pk PRIMARY KEY (ID_Propiedad_Imagen,Ruta_PI),
	CONSTRAINT Propiedad_Ruta_Imagen_FK FOREIGN KEY (ID_Propiedad_Imagen) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Imagenes afines a la propiedad';
