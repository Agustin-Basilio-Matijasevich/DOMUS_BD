# Elegir Dueño
set @DUEÑO = 5;

# Elegir Ubicacion
set @CIUDAD = 'Barranqueras';
set @PROVINCIA = 'Chaco';
set @PAIS = 'Argentina';

# Elegir tipo de propiedad
set @TIPO = 'Casa';

# Elegir Pisos
set @PISOS = 1;

# Elegir Metros Cuadrados
set @MC = 150;

# Elegir Direccion
set @DIR = 'Cangallo 350';

# Elegir Estado
set @EST = 'Venta';

# Elegir Precio
set @PRECIO = 35000000;

INSERT INTO propiedad
(ID_Dueño, 
Nombre_Ciudad_Propiedad, Nombre_Provincia_Propiedad, Nombre_Pais_Propiedad, 
Tipo_Propiedad, 
Pisos, 
Metros_Cuadrados, 
Direccion, 
Estado_Propiedad, 
Precio_Sugerido)
VALUES(
(select u.ID_Usuario  
from usuario u 
where u.ID_Usuario = @DUEÑO and (u.Tipo_Usuario = 'Cliente_Particular' or u.Tipo_Usuario = 'Cliente_Corporativo')), 
@CIUDAD, @PROVINCIA, @PAIS, @TIPO, @PISOS, @MC, @DIR, @EST, @PRECIO);
