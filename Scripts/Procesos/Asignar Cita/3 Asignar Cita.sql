# Elija la cita
set @CITA = 13;

# Elija a quien asigna la cita
set @AGENTE = 2;

# Que secretaria hace la Asignacion
set @SECRE = 3;

# Elija Fecha y Hora a la que programa la cita
set @FECHA = '2022-12-3';
set @HORA = '08:00:00';

# Asigna la cita
update cita c
set 
c.F_Asignacion_Cita = curdate(), 
c.H_Asignacion_Cita = curtime(), 
c.F_Cita = @FECHA, 
c.H_Cita = @HORA, 
c.Secre_Asigna_Cita = @SECRE, 
c.AI_Atiende_Cita = @AGENTE, 
c.Tipo_Cita = 'Agendada'
where NRO_Cita = @CITA and Tipo_Cita = 'Solicitud' and timestamp(curdate(), curtime()) < timestamp(@FECHA, @HORA) ;