CREATE TABLE domus.Empleado_Cobro_Pendiente (
	NRO_Cobro INT UNSIGNED auto_increment NOT NULL,
	ID_Empleado_Cobra INT UNSIGNED NOT NULL,
	F_Creacion_CobroP DATE NOT NULL,
	H_Creacion_CobroP TIME NOT NULL,
	Monto_Cobro_Empleado DECIMAL NOT NULL,
	Descripcion_Cobro_Empleado varchar(100) NULL,
	Tipo_Cobro_Empleado ENUM ('Sueldo','Comision') NOT NULL,
	CONSTRAINT Empleado_Cobro_Pendiente_pk PRIMARY KEY (NRO_Cobro),
	CONSTRAINT Empleado_Cobro_Pendiente_FK FOREIGN KEY (ID_Empleado_Cobra) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Cobros Pendientes por Empleados (Sueldos, Comisiones)'
AUTO_INCREMENT=1;
