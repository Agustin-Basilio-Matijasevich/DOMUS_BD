CREATE TABLE domus.Cobro_Pend_Cliente (
	NRO_Cobro_P_Cliente INT UNSIGNED auto_increment NOT NULL,
	F_Creacion_Cobro_PC DATE NOT NULL,
	Monto_Cobro_PC DECIMAL NOT NULL,
	ID_Cliente_Cobra INT UNSIGNED NOT NULL,
	ID_Prop_Involuc_CPC INT UNSIGNED NOT NULL,
	CONSTRAINT Cobro_Pend_Cliente_pk PRIMARY KEY (NRO_Cobro_P_Cliente),
	CONSTRAINT Cobro_Pend_Cliente_FK FOREIGN KEY (ID_Cliente_Cobra) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Cobro_Pend_Cliente_FK_1 FOREIGN KEY (ID_Prop_Involuc_CPC) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Dinero que los clientes deben venir a cobrar de alquileres o ventas'
AUTO_INCREMENT=1;
