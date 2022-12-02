# Eligir Cliente que solicita
set @CLIENTE = 4;

# Elegir la propiedad a visitar
set @PROP = 5;

INSERT INTO cita
(F_Creacion_Cita, H_Creacion_Cita, Client_Solicita_Cita, Propiedad_Involucrada, Tipo_Cita)
VALUES(curdate(), curtime(), 
(select u.ID_Usuario 
from usuario u 
where u.ID_Usuario = @CLIENTE and (u.Tipo_Usuario = 'Cliente_Particular' or u.Tipo_Usuario = 'Cliente_Corporativo')), 
(select p.ID_Propiedad 
from propiedad p
where p.ID_Propiedad = @PROP and p.ID_Dueño != @CLIENTE), 
'Solicitud');