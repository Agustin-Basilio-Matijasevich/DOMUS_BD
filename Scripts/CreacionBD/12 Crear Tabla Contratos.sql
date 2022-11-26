CREATE TABLE domus.Contrato_Cerrado (
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
