CREATE TABLE domus.Propiedad_Ruta_Documento (
	ID_Propiedad_Documento INT UNSIGNED NOT NULL,
	Ruta_PD varchar(100) NOT NULL,
	CONSTRAINT Propiedad_Ruta_Documento_pk PRIMARY KEY (ID_Propiedad_Documento,Ruta_PD),
	CONSTRAINT Propiedad_Ruta_Documento_FK FOREIGN KEY (ID_Propiedad_Documento) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Rutas a documentos afines a la propiedad';
