# Elegir la cita
set @CITA = 2;

UPDATE cita
SET F_Concluye_Cita=curdate(), H_Concluye_Cita=curtime() 
WHERE NRO_Cita = @CITA AND Tipo_Cita = 'Agendada' ;