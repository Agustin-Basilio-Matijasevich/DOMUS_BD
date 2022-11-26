CREATE TABLE domus.Cita (
	NRO_Cita INT UNSIGNED auto_increment NOT NULL,
	F_Creacion_Cita DATE NOT NULL,
	H_Creacion_Cita TIME NOT NULL,
	F_Asignacion_Cita DATE NULL,
	H_Asignacion_Cita TIME NULL,
	F_Cita DATE NULL,
	H_Cita TIME NULL,
	F_Concluye_Cita DATE NULL,
	H_Concluye_Cita TIME NULL,
	Secre_Asigna_Cita INT UNSIGNED NULL,
	AI_Atiende_Cita INT UNSIGNED NULL,
	Client_Solicita_Cita INT UNSIGNED NOT NULL,
	Propiedad_Involucrada INT UNSIGNED NOT NULL,
	Tipo_Cita ENUM ('Solicitud','Agendada') NOT NULL,
	CONSTRAINT Cita_pk PRIMARY KEY (NRO_Cita),
	CONSTRAINT `Secre-Asigna_FK` FOREIGN KEY (Secre_Asigna_Cita) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT `AI-Atiende_FK` FOREIGN KEY (AI_Atiende_Cita) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT `Clien-Solicita_FK` FOREIGN KEY (Client_Solicita_Cita) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT `Prop-Involuc_FK` FOREIGN KEY (Propiedad_Involucrada) REFERENCES domus.propiedad(ID_Propiedad) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Citas de Clientes con Agentes Inmobiliarios'
AUTO_INCREMENT=1;
