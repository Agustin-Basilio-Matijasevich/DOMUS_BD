CREATE EVENT limpieza_citas 
ON SCHEDULE EVERY 30 DAY STARTS '2023-01-02 06:00:00' 
DO 
delete 
from cita 
where F_Concluye_Cita is not null and H_Concluye_Cita is not null;