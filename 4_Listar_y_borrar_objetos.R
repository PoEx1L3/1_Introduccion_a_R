# Ver mas filas en las tibbles
options(tibble.print_max = 100)
# Mostrar todas las tibbles completas (son tablas)
options(tibble.width = Inf)
# Desactivar notacion cientifica
options(scipen = 999)

# Arroja las caracteristicas de memoria en uso y por utilizar
gc() 

# Genera en un stop en el maximo ampliable.
memory.limit(9999999999) 

# Genera en un stop en el maximo ampliable. Ignorado = False
memory.limit(size=1470000) 


#Para trabajar mas rapido con R aumentando el uso Ram en Mb

# 1 GB = 1.000 MB
# 1 TB = 1.000 GB
# 1 TB = 1.000.000 MB

# https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/memory.size

# Utilice memory.limit(). Puede aumentar el valor predeterminado con este comando memory.limit(size=2500), 
# donde el tama?o est? en MB. Debe utilizar 64 bits para aprovechar esto realmente.


# Cambiamos Idioma de Salida
Sys.setenv(LANG = "sp")

# Borro Todo el Environment
rm(list = ls()) 


##########################   Fijamos Directorio   ########################## 

# Imprime la ruta del directorio de trabajo actual

getwd()

# Imprime los elementos contenidos al interior de una carpeta determinada

dir()

# Cambiar el Directorio

setwd("E:/ESTUDIOS") 


# Guardo medioambiete
save.image("E:/PROYECTOS/DOCENCIA_/INAP/Versi?n3_/Intro_RSTudio_/Scripts_&_Data_set_Clases_/402_28_04_2022_Environment_1.RData")


# Instalamos paquete
# install.packages("readxl") Leer archivos xlsx en win
# install.packages("openxlsx") Leer archivos xlsx en win
# install.packages("writexl") Escribir archivos xlsx en win
#install.packages("tidyverse")

# Una vez instalados los drives correspondiente podremos hacer correr la libreria:
library(readxl) # Corremos libreria para leer archivos xlsx en win
library(openxlsx) # Corremos libreria para leer archivos xlsx en win
library(writexl) # Corremos libreria para escribir archivos xlsx en win
library(tidyverse)



#------------------------------------------------------------------------------#
# 4.1 Listar objetos.
#------------------------------------------------------------------------------#
# Las funciones ls() y objects() hacen lo mismo: listan los objetos que hemos 
# definido en la sesión.

x <- c(1:9)
y <- c(10:1)

ls()

z <- c(20:28)
objects()

#------------------------------------------------------------------------------#
# 4.2 Borrar objetos.
#------------------------------------------------------------------------------#
# Si queremos borrar objetos utilizamos la función rm()
rm(z)  # borramos el objeto z

ls()

# y si estamos interesados en borrar todos los objetos que hemos definido:

rm(list=ls())

# o

rm(list=objects())

ls()
