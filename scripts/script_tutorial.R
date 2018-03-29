# Introducción al manejo de datos de fechas en R
# Por Ronny Hdez-mora


# ---- 1. Fechas y horas en R ----

Sys.time()


## ---- 1.2 Tipo y Clase del tiempo en R ----

fecha_hora <- Sys.time() # Guardar en un objeto

typeof(fecha_hora) # Tipo de dato

class(fecha_hora) # Clase del objeto

## ---- 1.3 Función sistema POSIX ----

unclass(fecha_hora)

# Definimos formato
fecha_hora <- as.POSIXlt(fecha_hora)

# Sacamos de la lista los objetos almacenados
unlist(fecha_hora) 

# ---- 2. Leer fechas desde archivos ----
data <- nycflights13::flights # Guardar en objeto datos seleccionados
head(data)

library(tidyr) # Paquete del cual vamos a utilizar función

data <- unite(data, Date, year, month,day, sep = "/")
head(data)

## ---- 2.1 Función strptime ----
Rdate <- strptime(as.character(data$Date), "%Y/%m/%d")
class(Rdate)

data <- data.frame(Rdate,data)
head(data)

# ---- 3. Análisis estadísticos con datos de fechas ----



