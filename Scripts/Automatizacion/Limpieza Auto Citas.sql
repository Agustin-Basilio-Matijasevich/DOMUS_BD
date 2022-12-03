CREATE EVENT limpieza_citas
ON SCHEDULE EVERY 1 DAY
ON COMPLETION NOT PRESERVE
ENABLE
DO delete 
from cita 
where (F_Concluye_Cita is not null and H_Concluye_Cita is not null) and (TIMESTAMPDIFF(day, timestamp(F_Concluye_Cita, H_Concluye_Cita), current_timestamp()) > 30); 
