CREATE TABLE domus.Contrato_Ruta_Documento (
	NRO_Contrato_Documento INT UNSIGNED NOT NULL,
	Ruta_CD varchar(100) NOT NULL,
	CONSTRAINT Contrato_Ruta_Documento_pk PRIMARY KEY (NRO_Contrato_Documento,Ruta_CD),
	CONSTRAINT Contrato_Ruta_Documento_FK FOREIGN KEY (NRO_Contrato_Documento) REFERENCES domus.contrato_cerrado(NRO_Contrato) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Documentos afines al contrato';
