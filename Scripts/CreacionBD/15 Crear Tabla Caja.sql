CREATE TABLE domus.Caja (
	ID_Caja INT UNSIGNED auto_increment NOT NULL,
	Descripcion_Caja varchar(100) NOT NULL,
	IsOpen BIT DEFAULT FALSE NOT NULL,
	CONSTRAINT Caja_pk PRIMARY KEY (ID_Caja)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Cajas de la Empresa (Dinero)'
AUTO_INCREMENT=1;
