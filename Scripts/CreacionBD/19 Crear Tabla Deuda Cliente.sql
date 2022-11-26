CREATE TABLE domus.Deuda_Cliente (
	NRO_Deuda_Cliente INT UNSIGNED auto_increment NOT NULL,
	F_Creacion_Deuda DATE NOT NULL,
	Monto_Deuda DECIMAL NOT NULL,
	ID_Cliente_Debe INT UNSIGNED NOT NULL,
	ID_Propiedad_Deuda INT UNSIGNED NOT NULL,
	CONSTRAINT Deuda_Cliente_pk PRIMARY KEY (NRO_Deuda_Cliente),
	CONSTRAINT Deuda_Cliente_FK FOREIGN KEY (ID_Cliente_Debe) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Deuda_Cliente_FK_1 FOREIGN KEY (ID_Propiedad_Deuda) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Deudas de Clientes por Alquileres o Ventas'
AUTO_INCREMENT=1;
