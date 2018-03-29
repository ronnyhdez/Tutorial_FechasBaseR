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

data$Rdate <- as.POSIXlt(data$Rdate)
modelo <- lm(arr_delay ~ Rdate, data = data)

data$Rdate <- as.POSIXct(data$Rdate)

modelo <- lm(arr_delay ~ Rdate, data = data)
summary(modelo)

anova <- aov(arr_delay ~ Rdate, data = data)
summary(anova)

#convertir a continuo
data$Rdate <- as.POSIXct(data$Rdate) 

## ---- 3.1 Nombre completo del día ----
ejemplo <- data[1,1]
ejemplo

weekdays(ejemplo)

## ---- 3.2 Otros formatos ----
otras_fechas <- c("2feb2016","18jun1990","7nov1995")
strptime(otras_fechas,"%d%b%Y")

# ---- 4. Cálculos con el tiempo ----
as.difftime(otras_fechas, "%d%b%Y")


# vamos a generar dos fechas:
fecha_1 <- as.POSIXlt("2018-01-01")
fecha_2 <- as.POSIXlt("2017-01-02")

fecha_1 + 100000

fecha_1 - 100000

fecha_1 - fecha_2

fecha_1 <= fecha_2

difftime("2018-01-02","2017-12-01")

tiempo_1 <- as.difftime("12:00:00")
tiempo_2 <- as.difftime("17:20:00")
tiempo_2 - tiempo_1

# ---- 5. Generación de secuencias con tiempo ----

seq(as.POSIXlt("2018-01-01"), as.POSIXlt("2018-01-10"), "1 day")

seq(as.POSIXlt("2018-01-01"), as.POSIXlt("2018-02-01"), "1 weeks")

seq(as.POSIXlt("2018-01-01"),as.POSIXlt("2018-01-02"),8000)

seq(as.POSIXlt("2018-01-01"), by = "weeks", length = 7)

