# Elegir Cita
set @CITA = 4;

# Busco ubicacion de propiedad
select p.Nombre_Ciudad_Propiedad, p.Nombre_Provincia_Propiedad, p.Nombre_Pais_Propiedad into @CIUDAD, @PROVINCIA, @PAIS 
from cita c 
inner join propiedad p 
on Propiedad_Involucrada = p.ID_Propiedad 
where NRO_Cita = @CITA;

# Traigo todos los agentes que trabajan en esa zona
select ID_Usuario, Nombres, Apellidos, Sexo, DNI_CUIL 
from usuario u 
inner join ai_atiende_ciudad aac 
on u.ID_Usuario = aac.ID_AI 
where aac.Nombre_Ciudad_AI = @CIUDAD and aac.Nombre_Provincia_AI = @PROVINCIA and aac.Nombre_Pais_AI = @PAIS;