CREATE TABLE domus.Cierre_Caja (
	ID_Caja_Cierre INT UNSIGNED NOT NULL,
	Fecha_Cierre_Caja DATE NOT NULL,
	Monto_Cierre DECIMAL NOT NULL,
	CONSTRAINT Cierre_Diario_Caja_pk PRIMARY KEY (ID_Caja_Cierre,Fecha_Cierre_Caja),
	CONSTRAINT Cierre_Diario_Caja_FK FOREIGN KEY (ID_Caja_Cierre) REFERENCES domus.caja(ID_Caja) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Registro de Cierre de Caja Diario';
