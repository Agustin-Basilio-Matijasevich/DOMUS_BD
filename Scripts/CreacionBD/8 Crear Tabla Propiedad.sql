CREATE TABLE domus.Propiedad (
	ID_Propiedad INT UNSIGNED auto_increment NOT NULL,
	ID_Dueño INT UNSIGNED NOT NULL,
	ID_Adquiere_o_Alquila INT UNSIGNED NULL,
	Nombre_Ciudad_Propiedad varchar(20) NOT NULL,
	Nombre_Provincia_Propiedad varchar(20) NOT NULL,
	Nombre_Pais_Propiedad varchar(20) NOT NULL,
	Tipo_Propiedad ENUM ('Casa','Departamento','Galpon','Campo','Terreno') NOT NULL,
	Pisos INT UNSIGNED NOT NULL,
	Metros_Cuadrados DECIMAL NOT NULL,
	Direccion varchar(100) NOT NULL,
	Estado_Propiedad ENUM ('Venta','Alquiler') NOT NULL,
	CONSTRAINT Propiedad_pk PRIMARY KEY (ID_Propiedad),
	CONSTRAINT UbicadaEnCiudad_FK FOREIGN KEY (Nombre_Ciudad_Propiedad,Nombre_Provincia_Propiedad,Nombre_Pais_Propiedad) REFERENCES domus.ciudad(Nombre_Ciudad,Nombre_Provincia_Ciudad,Nombre_Pais_Ciudad) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT Dueño_FK FOREIGN KEY (ID_Dueño) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT Locatario_FK FOREIGN KEY (ID_Adquiere_o_Alquila) REFERENCES domus.usuario(ID_Usuario) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT='Propiedades Administradas por la Empresa'
AUTO_INCREMENT=1;
