select p.Tipo_Propiedad, 
p.Estado_Propiedad, 
p.Precio_Sugerido, 
concat(p.Nombre_Ciudad_Propiedad, ', ', p.Nombre_Provincia_Propiedad, ', ', p.Nombre_Pais_Propiedad) as 'Ubicacion', 
p.Pisos, 
p.Metros_Cuadrados, 
p.Direccion, 
'Dueño=>' as 'Dueño', 
if (u.Tipo_Usuario='Cliente_Particular', 'Particular', 'Empresa'), 
u.Nombres, 
u.Apellidos, 
u.Foto_Perfil 
from propiedad p 
inner join usuario u 
on p.ID_Dueño = u.ID_Usuario 
where p.ID_Adquiere_o_Alquila is NULL;