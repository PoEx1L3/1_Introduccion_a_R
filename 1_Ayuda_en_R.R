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
file.choose()
setwd("C:\\Users\\denis\\Desktop\\G1tHub\\1_Introduccion_a_R\\") 


# Guardo medioambiete
save.image("C:\\Users\\denis\\Desktop\\G1tHub\\1_Introduccion_a_R\\53_24_09_2022_1_Ayuda_en_R.RData")


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
# 1. Ayuda en R
#------------------------------------------------------------------------------#

# Hay varias formas de pedir la ayuda de R. 
# Vamos a pedir la ayuda de la función mean().
help(mean)
?mean
median    # y pulsamos la tecla F1

#------------------------------------------------------------------------------#
# 1.1 Ayuda en R
#------------------------------------------------------------------------------#
# Si ejecutamos directamente la función library() se abrirá una ventana 
#listando los paquetes que tenemos instalados en R:
library() 

# Para obtener ayuda sobre un determinado paquete:
library(help="readxl")

