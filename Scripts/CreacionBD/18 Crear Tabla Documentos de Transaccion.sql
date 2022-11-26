CREATE TABLE domus.Transaccion_Ruta_Documento (
	NRO_Transaccion_Documento INT UNSIGNED NOT NULL,
	Ruta_DT varchar(100) NOT NULL,
	CONSTRAINT Transaccion_Ruta_Documento_pk PRIMARY KEY (NRO_Transaccion_Documento,Ruta_DT),
	CONSTRAINT Transaccion_Ruta_Documento_FK FOREIGN KEY (NRO_Transaccion_Documento) REFERENCES domus.transaccion(NRO_Transaccion) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Documentos afines a la Transaccion';
