# Traer citas pendientes de asignar
select NRO_Cita, 
'Solicita=>', u.Nombres, u.Apellidos, u.DNI_CUIL, 
'Por Propiedad=>', Direccion, Tipo_Propiedad, Estado_Propiedad, CONCAT(p.Nombre_Ciudad_Propiedad, ', ', p.Nombre_Provincia_Propiedad, ', ', p.Nombre_Pais_Propiedad ) as Lugar, 
'Del Dueño=>', u2.Nombres, u2.Apellidos, u2.DNI_CUIL
from cita c 
inner join usuario u 
on Client_Solicita_Cita = ID_Usuario 
inner join propiedad p 
on Propiedad_Involucrada = ID_Propiedad 
inner join usuario u2 
on p.ID_Dueño = u2.ID_Usuario 
where Tipo_Cita = 'Solicitud'
order by F_Creacion_Cita;