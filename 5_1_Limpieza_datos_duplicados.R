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

# Selección/cambio directorio actual
choose.files()
setwd("C:\\Users\\denis\\Desktop\\m0d2\\scripts_m0d2_practico1\\")

# Imprime los elementos contenidos al interior de una carpeta determinada

dir()

# Instalamos paquete
# install.packages("readxl") Leer archivos xlsx en win
# install.packages("openxlsx") Leer archivos xlsx en win
# install.packages("writexl") Escribir archivos xlsx en win
#install.packages("tidyverse")

# Una vez instalados los drives correspondiente podremos hacer correr la libreria:
if(!require(readxl)) {install.packages("readxl")}
if(!require(readxl)) {library(readxl)}

library(readxl) # Corremos libreria para leer archivos xlsx en win
library(openxlsx) # Corremos libreria para leer archivos xlsx en win
library(writexl) # Corremos libreria para escribir archivos xlsx en win
library(tidyverse)

#------------------------------------------------------------------------------#
# 1.0. Data Frame ----
#------------------------------------------------------------------------------#
# Los data frame se usan para almacenar datos en forma de 
# tablas (filas / columnas), como estamos habituados en Excel, Spss, etc.
# Los data frame pueden almacenar objetos/datos de distinto tipo: numéricos, 
# carácter, … En las matrices todos los elementos tenían que ser enteros o 
# numéricos.
# Los data frame pueden entenderse como un tipo especial de lista donde cada 
# elemento de la lista tiene que tener la misma longitud. 
# Cada elemento de la lista sería una columna y la longitud de cada elemento 
# de la lista serían las filas.

#------------------------------------------------------------------------------#
# 1.1 Carga datos ----
#------------------------------------------------------------------------------#

# 1.1.1 Selección archivo actual en R
file.choose()

df1 <- read_excel("bd_duplicados.xlsx", sheet = "dataframe_con_ID")
df2 <- read_excel("bd_duplicados.xlsx", sheet = "dataframe_sin_ID")
          
#------------------------------------------------------------------------------#
# 1.2 Clase de un data frame ----
#------------------------------------------------------------------------------#

class(df1)
class(df2)

#------------------------------------------------------------------------------#
# 1.3 Cambio objeto a dataframe ----
#------------------------------------------------------------------------------#

df1 <- as.data.frame(df1)
df2 <- as.data.frame(df2)

class(df1)
class(df2)

#------------------------------------------------------------------------------#
# 1.4 Dimensión de un data frame  ----
#------------------------------------------------------------------------------#

# ¿Cuál es la dimensión del objeto x (que es una data frame)?

nrow(df1) # número de filas

ncol(df1) # número de columnas

dim(df1) # número de filas y columnas
dim(df2) # número de filas y columnas

#------------------------------------------------------------------------------#
# 1.5 Detección observaciones duplicadas en un dataframe ----
#------------------------------------------------------------------------------#

# Para la identificación, usaremos la función duplicated() que devuelve el 
# recuento de filas duplicadas.

# Enfoque :
# Crear/cargar dataframe
# Pasarlo a la función duplicada()
# Esta función devuelve las filas que están duplicadas en formas de valores 
# booleanos (TRUE/FALSE).
# Aplicar la función de sum para obtener el número de obs. duplicadas.

# df %>% duplicated() %>% sum() <---- no està detectando valores repetidos 
                                      # (exceptuando ID)

# Si revisas la documentación de duplicated():

# Por lo que de entrada ya se estaría esperando un vector o un objeto tipo 
# dataframe. Conceptualmente los duplicados serían aquellas filas cuyas columnas 
# exceptuando el ID son iguales, por lo que simplemente haces un "slice" del 
# dataframe de las columnas de interés:

df1[duplicated(df1[, c("Latitud", "Longitud", "Altitud")]), ]

df2[duplicated(df2[, c("Latitud", "Longitud", "Altitud")]), ]


df2_duplicados <- df2[duplicated(df2[, c("Latitud", "Longitud", "Altitud")]), ]

df2_duplicados <- as.data.frame(df2_duplicados)

class(df2_duplicados)

print(df2_duplicados)

# O incluso mejor, por ser mas generalizable 
# Seleccionamos para duplicated() todas las variables menos ID

df1[duplicated(df1[, -which(names(df1) == "ID")]), ] # Solo sirve para dataframes con ID

# Como puedes observar, lo interesante es que los duplicados son las posteriores 
# apariciones de los datos, por lo que, efectivamente, eliminando duplicados, 
# nos quedamos con los valores esperados:

# Negamos los valores duplicados
df1[which(!duplicated(df1[, -which(names(df1) == "ID")])), ]

# En caso que quieras usas dplyr, puedes usar distinct(), la sintaxis es un poco 
# más sencilla y clara:

df1 %>% distinct(Longitud, Latitud, Altitud, .keep_all = T)

df2 %>% distinct(Longitud, Latitud, Altitud, .keep_all = T)

#------------------------------------------------------------------------------#
# 1.6 # Guardo medioambiete ----
#------------------------------------------------------------------------------#

#save.image("E:/PROYECTOS/DOCENCIA_/INAP/Versi?n3_/Intro_RSTudio_/Scripts_&_Data_set_Clases_/402_28_04_2022_Environment_1.RData")

