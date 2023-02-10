# Ver mas filas en las tibbles
options(tibble.print_max = 100)
# Mostrar todas las tibbles completas (son tablas)
options(tibble.width = Inf)
# Desactivar notacion cientifica
options(scipen = 999)
# Cambiamos Idioma de Salida
Sys.setenv(LANG = "sp")
# Borro Todo el Environment
# rm(list = ls()) 

#------------------------------------------------------------------------------#
# 1. Fijamos Directorio----
#------------------------------------------------------------------------------#
# Imprime la ruta del directorio de trabajo actual
# choose.files()
dir()
getwd()

# Cambiar el Directorio

setwd("C:\\Users\\denis\\OneDrive\\Escritorio\\1_Introduccion_a_R\\") 
dir()
#------------------------------------------------------------------------------#
# 2. Instalar y cargar paquetes----
#------------------------------------------------------------------------------#
if(!require(dplyr)) {install.packages("dplyr")}
if(!require(dplyr)) {library(dplyr)}

if(!require(tidyverse)) {install.packages("tidyverse")}
if(!require(tidyverse)) {library(tidyverse)}

if(!require(readxl)) {install.packages("readxl")} 
if(!require(readxl)) {library(readxl)}


if(!require(openxlsx)) {install.packages("openxlsx")} 
if(!require(openxlsx)) {library(openxlsx)}

# install.packages("writexl")
library(writexl) # Corremos libreria para escribir archivos xlsx en win

if(!require(readr)) {install.packages("readr")} # lectura archivos extensión csv
if(!require(readr)) {library(readr)}

#------------------------------------------------------------------------------#
# 3.0 Importar archivos csv----
#------------------------------------------------------------------------------#

data0 <- read_delim("evdoc2015_60obs.csv", # Nombre del archivo completo
                   delim = ";",                 # Delimitador de columnas
                   col_names = TRUE,            # Las columnas tienen nombre?
                   col_types = cols(),          # Podemos modificar el tipo de datos de las columnas cuando importamos
                   na = c("", "NA"),            # Los espacios vacios deben ser reemplazados con NA
                   trim_ws = TRUE,              # Quita los espacios de antes y despues de las cadenas de texto
                   n_max = Inf,                 # Limite de filas a importar
                   progress = show_progress(),  # Mostrar progreso (estético para el programador)
                   skip_empty_rows = TRUE)      # Saltear filas en blanco

class(data0)

data0 <- as.data.frame(data0)

class(data0)

data1 <- data0 # Respaldo data0

class(data1)  

variable.names(data0)

#------------------------------------------------------------------------------#
# 3.1 Importar archivos xlsx----
#------------------------------------------------------------------------------#
# install.packages("openxlsx") ---> https://r-coder.com/leer-excel-r/
install.packages("openxlsx")
library(openxlsx) #---> no depende de JAVA y output es dataframe.
df1 <- read.xlsx("bd2015_dos_sheets.xlsx", sheet = 1)
df2 <- read.xlsx("bd2015_dos_sheets.xlsx", sheet = 2)

names(df1) # Antes de aplicar rbind, revisamos que df1 y df2 tienen las mismas v.a y en idéntico lugar.
names(df2) # Idem

df3 <- rbind(df1, df2, by = "MRUN", all.x = T) # Quiero crear un dataframe, con "todo lo de "Y" en "X" (de manera acumulativa).
View(df3)
class(df3)

rm(df3)
#------------------------------------------------------------------------------#
# 4. Tratamiento columnas----
#------------------------------------------------------------------------------#

# Pregunto nombre variable dataset
variable.names(data0)
colnames(data0)

# Pregunto cual es el fila/registro número 3 en columna número 2

data0[3,2]
  
# Pregunto cual es el fila/registro nº 2 en columnas desde nº1 hasta nº5

data0[2,1:5]

# Pregunto cuales son los registros desde nº1 hasta nº5 de la columna 2

data0[1:5,2]

# Pregunto cuales son todos los registros del dataset data0

data0[]

# Pregunto cuales son todos los registros del dataset data0, excepto fila/registro 1
data0 <- data1 #Restauro respaldo 

data2 <- data0[-1,]
dim(data0) # 60 18
dim(data2) # 59 18

# Pregunto cuales son todos los registros del dataset data0, excepto columna 1

data3 <- data0[,-1]
dim(data0) # 60 18
dim(data3) # 60 17

# Pregunto cual es el registro numero 3

data0[3,]

# Si quieren eliminar un dato (no se recomienda)

data0[-2,-1]

dim(data0)

View(data0)

# Visualizar el registro ubicado en la posición (1,3), e.d, fila 1 y columna 3.
View(data0[1,3])

# Puedo solicitar visualizar el 5to. vector y tipo de observación que posee.
str(data0[,5])

# Crear una nueva variable que sume la columna 2 con la columna 5, de data0
class(data0)
str(data0)

data0$nva_var <- data0[,2]+data0[,5] # Es posible realizarlo, ya q ambas v.a son numeric

variable.names(data0)

class(data0)

str(data0)


# Crear una nueva variable que multiplique 12 veces el producto resultante de la 
# division de las suma de la columna 2 y 4, por la suma de las columnas 2 y 5 
# multiplicadas por 2.

data0$nva_var2 <- 12*((data0[,2]+data0[,4])/(2*(data0[,2]+data0[,5])))

#5. MERGING----
# 
#5.1 INNER JOIN ---- 
# https://www.datasciencemadesimple.com/join-in-r-merge-in-r/
# 
# Ahora podemos usar la función merge() R para combinar nuestros dos marcos de 
# datos por la columna id de la siguiente manera:

df1_df2_inner <- merge(df1, df2, by = "MRUN", all = F)      # Intersección entre df1 y df2 
class(df1_df2_inner)

# …o incluso podemos conservar todas las filas de ambos archivos de datos:

#5.2 OUTER JOIN ---- 
df1_df2_outer <- merge(df1, df2, by = "MRUN", all = T) # Quiero crear un dataframe, con "todo lo de "Y" en "X" (de manera acumulativa).
class(df1_df2_outer)

# La función merge proporciona las opciones all.x y all.y. Estas dos opciones se 
# pueden usar para retener ciertas filas de sus tablas de datos de entrada, 
# incluso cuando no se encuentra ninguna coincidencia para la fusión.

#5.3 LEFT JOIN ---- 
df1_df2_left <- merge(df1, df2, by = "MRUN", all.x = T) # Mantener todas las filas de "datos x" (df1). Quiero crear un dataframe, con "todo lo que encuentre de "X" en "Y".
class(df1_df2_left)

#5.4 RIGHT JOIN ---- 
df1_df2_right <- merge(df1, df2, by = "MRUN", all.y = T) # Mantener todas las filas de "datos y" (df2). Quiero crear un dataframe, con "todo lo que encuentre de "Y" en "X".
class(df1_df2_right)

#5.5 CROSS JOIN ---- 
# https://www.datasciencemadesimple.com/join-in-r-merge-in-r/
df1_df2_cross <- merge(df1, df2, by = NULL) # 10x10 cruces


#5. Renombrar Variables ----
# install.packages("dplyr")


#5.1 Renombrar una variable----
library(dplyr)

df1 <- rename(df1,c(MRUT="MRUN"))

colnames(df1)

View(df1)

# O también----
# install.packages("data.table")
library(data.table)

setnames(df1, old = c("MRUT"), new = c("MRUN")) #deshacemos cambio anterior

colnames(df1)

View(df1)

# O tambien
# install.packages("plyr")
# library(plyr)
# df1 <- plyr::rename(df1,c(MRUN="MRUT")) #deshacemos cambio anterior

#5.2 Reemplazar Observaciones----
df1_resp <- df1 # respaldo df1 antes de reemplazar obs.

str(df1$INSTR_PJE)

View(df1)
# Una condición----
df1$INSTR_PJE[df1$INSTR_PJE < 2.51] <- "I" # I: Insatisfactorio

View(df1)

# Dos condiciones "Y"----
df1 <- df1_resp # deshacemos reemplazo anterior
df1$INSTR_PJE[df1$INSTR_PJE >= 2.51 & df1$INSTR_PJE <= 3.0] <- "C" # C: Competente

View(df1)

# Dos condiciones "O"----
df1 <- df1_resp # deshacemos reemplazo anterior

df1$INSTR_PJE[df1$INSTR_PJE >= 3.01 | df1$INSTR_PJE <= 4.0] <- "D" # D: Competente

View(df1)

# Qué sucede con la función si en el hilo o cadena se encuentra un NA?
df1 <- df1_resp # deshacemos reemplazo anterior

df1$INSTR_PJE[df1$INSTR_PJE < 2.51] <- NA

View(df1)

df1$INSTR_PJE <- ifelse(df1$INSTR_PJE > 1.0 & df1$INSTR_PJE < 2.51, "I","C") # Reemplazamos con "I" y todo lo demas rellenar com "C".

View(df1)
# Se mantienen los valores NA y se reemplazan aquellos q cumplen condición

df1 <- df1_resp # deshacemos reemplazo anterior

# Qué sucede si reemplazo la condición por una palabra o conjunto de caracteres?
# R: Se reemplazan aquellos valores q cumplen condición

# Y si quiero rellenar el resto con informacion de un vector?

df1$nva_variable <- ifelse(df1$INSTR_PJE > 1.0 & df1$PF_PJE < 2.51, 
                           1, df1$PF_ESC)

View(df1)
