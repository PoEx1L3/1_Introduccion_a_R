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
# 2. Instalar y cargar paquetes
#------------------------------------------------------------------------------#
# Utilizando la función install.packages()
# El nombre del paquete que queremos instalar debe ir entre comillas.

# dplyr es un paquete que se utiliza para manipular/gestionar datos
install.packages("dplyr")

# En ocasiones, para nuestra sesión de trabajo necesitamos instalar 
# varios paquetes.
install.packages(c("dplyr","ggplot2","xlsx"))
 
# Es habitual iniciar la sesión de trabajo en R con un “pequeño programa” 
# en el que se indica que para la sesión se requiere una serie de paquetes 
# y que si no están instalados los instale. Aquí tenemos la versión más 
# sencilla para hacer esto:

if(!require(dplyr)) {install.packages("dplyr")}
if(!require(dplyr)) {library(dplyr)}

if(!require(tidyverse)) {install.packages("tidyverse")}
if(!require(tidyverse)) {library(tidyverse)}

# Una vez instalado el paquete, hay que cargarlo para poderlo utilizar. 
# Esto se hace con la función library().
# Observad que el nombre del paquete no se pone entre comillas para cargarlo.
library(dplyr)
