DELIMITER $$ 
$$ 
create trigger Registrar_Cita_Concluida after update on cita 
for each row 
begin 
	if (new.F_Concluye_Cita is not NULL or new.H_Concluye_Cita is not NULL) then 
		INSERT INTO registro_de_citas 
		(NRO_Cita, 
		`Fechas=>`, FH_Creacion, FH_Asignacion, FH_Cita, FH_Conclusion, 
		`Secretaria=>`, Nombre_Secretaria, Apellido_Secretaria, DNI_Secretaria, Sexo_Secretaria, 
		`Agente Inmobiliatio=>`, Nombre_AI, Apellido_AI, DNI_AI, Sexo_AI, 
		`Cliente=>`, Nombre_Cliente, Apellido_Cliente, DNI_Cliente, Sexo_Cliente, 
		`Propiedad=>`, Ciudad_Prop, Provincia_Prop, Pais_Prop, Direccion_Prop, Tipo_Prop, Pisos_Prop, Metros_Cuadrados_Prop, Estado_Prop, 
		`Dueño=>`, Nombre_Dueño, Apellido_Dueño, DNI_Dueño, Sexo_Dueño)
		select 
		new.NRO_Cita,
		'Fechas=>', 
		cast(concat(c.F_Creacion_Cita, ' ', c.H_Creacion_Cita) as datetime) as FH_Creacion, 
		cast(concat(c.F_Asignacion_Cita, ' ', c.H_Asignacion_Cita) as datetime) as FH_Asignacion, 
		cast(concat(c.F_Cita, ' ', c.H_Cita) as datetime) as FH_Cita, 
		cast(concat(c.F_Concluye_Cita, ' ', c.H_Concluye_Cita) as datetime) as FH_Conclusion, 
		'Secretaria=>', 
		u.Nombres as Nombre_Secretaria,
		u.Apellidos as Apellido_Secretaria,
		u.DNI_CUIL as DNI_Secretaria,
		u.Sexo as Sexo_Secretaria,
		'Agente Inmobiliatio=>', 
		u2.Nombres as Nombre_AI,
		u2.Apellidos as Apellido_AI,
		u2.DNI_CUIL as DNI_AI,
		u2.Sexo as Sexo_AI,
		'Cliente=>', 
		u3.Nombres as Nombre_Cliente,
		u3.Apellidos as Apellido_Cliente,
		u3.DNI_CUIL as DNI_Cliente,
		u3.Sexo as Sexo_Cliente,
		'Propiedad=>', 
		p.Nombre_Ciudad_Propiedad as Ciudad_Prop, 
		p.Nombre_Provincia_Propiedad as Provincia_Prop, 
		p.Nombre_Pais_Propiedad as Pais_Prop, 
		p.Direccion as Direccion_Prop, 
		p.Tipo_Propiedad as Tipo_Prop, 
		p.Pisos as Pisos_Prop, 
		p.Metros_Cuadrados as Metros_Cuadrados_Prop, 
		p.Estado_Propiedad as Estado_Prop, 
		'Dueño=>', 
		u4.Nombres as Nombre_Dueño, 
		u4.Apellidos as Apellido_Dueño, 
		u4.DNI_CUIL as DNI_Dueño, 
		u4.Sexo as Sexo_Dueño 
		from cita c 
		inner join usuario u 
		on c.Secre_Asigna_Cita = u.ID_Usuario 
		inner join usuario u2 
		on c.AI_Atiende_Cita = u2.ID_Usuario 
		inner join usuario u3 
		on c.Client_Solicita_Cita = u3.ID_Usuario 
		inner join propiedad p 
		on c.Propiedad_Involucrada = p.ID_Propiedad 
		inner join usuario u4 
		on p.ID_Dueño = u4.ID_Usuario 
		where NRO_Cita = new.NRO_Cita; 
	end if; 
end;$$
DELIMITER ;