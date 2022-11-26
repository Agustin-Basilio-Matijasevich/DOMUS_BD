CREATE TABLE domus.Transaccion (
	NRO_Transaccion INT UNSIGNED auto_increment NOT NULL,
	F_Creacion_Transaccion DATE NOT NULL,
	H_Creacion_Transaccion TIME NOT NULL,
	Monto_Transaccion DECIMAL NOT NULL,
	Tipo_Transaccion ENUM ('Pago Sueldo','Cobro Alquiler','Pago Alquiler','Cobro Venta','Pago Venta') NOT NULL,
	Descripcion_Transaccion varchar(100) NULL,
	ID_Caja_Transaccion INT UNSIGNED NOT NULL,
	Cajera_Responsable_Transaccion INT UNSIGNED NOT NULL,
	Emp_Cobra_Transaccion INT UNSIGNED NULL,
	`Client_Paga-Cobra_Transaccion` INT UNSIGNED NULL,
	Prop_Involucrada_Transaccion INT UNSIGNED NULL,
	CONSTRAINT Transaccion_pk PRIMARY KEY (NRO_Transaccion),
	CONSTRAINT Fue_con_Caja_FK FOREIGN KEY (ID_Caja_Transaccion) REFERENCES domus.caja(ID_Caja) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Cobro_Cajera_FK FOREIGN KEY (Cajera_Responsable_Transaccion) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Se_Pago_Empleado_FK FOREIGN KEY (Emp_Cobra_Transaccion) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Incluye_Cliente_FK FOREIGN KEY (`Client_Paga-Cobra_Transaccion`) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Incluye_Propiedad_FK FOREIGN KEY (Prop_Involucrada_Transaccion) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Transacciones de Dinero'
AUTO_INCREMENT=1;
