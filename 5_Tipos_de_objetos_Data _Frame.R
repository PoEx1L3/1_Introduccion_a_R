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
# 5. Data Frame.
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
# 5.1 Crear un data frame.
#------------------------------------------------------------------------------#

# Aunque normalmente los data frame los creamos al cargar/leer una base de datos
# vamos crear una data frame para ver su estructura.

x <- data.frame(Titulacion = c("Economía", "ADE", "Sociología", "Magisterio"), 
                Edad = c(25, 27, 25, 24))
x

#------------------------------------------------------------------------------#
# 5.2 Clase de un data frame.
#------------------------------------------------------------------------------#

class(x)

#------------------------------------------------------------------------------#
# 5.3 Dimensión de un data frame.
#------------------------------------------------------------------------------#

# ¿Cuál es la dimensión del objeto x (que es una data frame)?

nrow(x) # número de filas

ncol(x) # número de columnas

dim(x) # número de filas y columnas


#------------------------------------------------------------------------------#
# 5.4 Acceder a los elementos de un data frame.
#------------------------------------------------------------------------------#

# Para acceder a los elementos de un data frame utilizamos los símbolos $ o [].

# Si queremos seleccionar la variable Titulacion del objeto x 
# (que es un data frame):

x$Titulacion

# También lo podemos hacer así:
x[1]

# y para seleccionar sus dos primeros elementos de Titulacion:

x$Titulacion[1:2]

# Si trabajamos con una base de datos (o data frame), para no tener que acceder 
# a una variable utilizando la expresión objeto$variable, que a veces resulta 
# farragoso, puede hacerse un attach al objeto. 
# Esto nos permitirá acceder directamente a las variables de la base de datos 
# por su nombre.

# si escribo Titulacion dará: Error: object 'Titulacion' not found 
Titulacion

# En cambio: 
attach(x)

# si escribo Titulacion ahora dará: "Economía" "ADE" "Sociología" "Magisterio"
Titulacion


#------------------------------------------------------------------------------#
# 5.5 Agregar una nueva variable al data frame.
#------------------------------------------------------------------------------#
#  Por ejemplo, vamos a añadir la variable id (de identificador) al objeto x.

# Esto lo podemos hacer directamente utilizando el símbolo $.

x$id <- 1:4

x

# o podemos crear la nueva variable, 
# por ejemplo la variable obs (de observación) y después combinarla con nuestro  
# data frame x.

obs <- 1:4

x <-cbind(obs,x)

x

class(x)


#------------------------------------------------------------------------------#
# 5.6 Ver el contenido de un data frame: head y tail.
#------------------------------------------------------------------------------#

# head permite ver las 6 primeras observaciones y tail la segunda las 6 últimas.
# También podemos indicar el número de observaciones que queremos visualizar.


data(EuStockMarkets)        # cargamos los datos EuStockMarkets
EuStockMarkets              # para ver el contenido del objeto

head(EuStockMarkets) # 6 primeras observaciones

head(EuStockMarkets,10) # 10 primeras observaciones

tail(EuStockMarkets) # 6 últimas observaciones

tail(EuStockMarkets,10) # 10 últimas observaciones


#------------------------------------------------------------------------------#
# 5.7 Agregar nombres de filas/columnas en un data frame
#------------------------------------------------------------------------------#

# Si las columnas de un data frame no tienen nombres 
# (en nuestro ejemplo son Titulación y Edad), podemos incluirlos utilizando la 
# función names(). Para incluir nombres a las filas se utiliza 
# la función row.names().

lista2 <- list(c("Economía", "ADE", "Sociología", "Magisterio"), 
               c(25, 27, 25, 24))
z <- data.frame(lista2)

z

# # Para incluir los nombre a las columnas:
names(z) <- c("Titulación", "Edad")

z


#------------------------------------------------------------------------------#
# 5.8 Eliminando valores NA
#------------------------------------------------------------------------------#

# En R los valores perdidos se denotan por NA (Not Available). 
# Cuando trabajamos con datos, una de las tareas más importantes que hay 
# que realizar es la de limpiar la base de datos y prepararla para los 
# posteriores análisis.

# Vamos a hacer una breve introducción a cómo eliminar los valores NA 
# a través del siguiente ejemplo:


x <- c(1,2,NA,NA,5)
malos <- is.na(x)  # Identificamos los NA con TRUE. 
                   # La función is.na() es una función lógica.
malos

# Mostrar por pantalla todos los valores de x diferentes a malos (NA)
x[!malos] 

x


# Ahora supongamos que tenemos dos objetos (dos vectores con misma dimensión), 
# que tienen NAs en la misma fila, y nos queremos quedar únicamente con los 
# casos completos. Esta situación se ilustra en el siguiente ejemplo:

x <- c(1,2,NA,4,NA,6)           #dos vectores con NAs en la misma fila
y <- c("a","b",NA,"d",NA,"f" )  #dos vectores con NAs en la misma fila

completos <- complete.cases(x,y) # complete.cases() es una función lógica
                                 # para un par (x,y) que tienen valores NAs
                                 # en misma posición, y se puede gestionar 
                                 # sacarlos del análisis.
completos

x[completos]

y[completos]

#------------------------

v <- c(0,1,2,NA,NA,5,6)         #dos vectores con NAs en distinta fila
w <- c(9,8,NA,6,5,4,NA)         #dos vectores con NAs en distinta fila

completos2 <- complete.cases(v) # complete.cases() es una función lógica

completos2

v[completos2]

completos3 <- complete.cases(w) # complete.cases() es una función lógica

completos3

w[completos3]


#-------------------Caso aplicado

# Por último, vamos a ver lo anterior aplicado a un caso más práctico. 
# Cargamos los datos airquality que se encuentran en el paquete datasets 
# y vamos a seleccionar únicamente los casos que están completos.

data("airquality")
head(airquality) # primeras 6 observaciones de "airquality"

tail(airquality) # pultimas 6 observaciones de "airquality"

head(airquality,15) # primeras 15 observaciones de "airquality"

tail(airquality,15) # últimas 15 observaciones de "airquality"

length(airquality) # nos dará el número de variables

dim(airquality) # indica el número de (filas) y de (columnas)

summary(airquality)  # la función summary() proporciona un resumen de 
# todas las variables de la base de datos.

sinNAs <- complete.cases(airquality) # nos dirá si tenemos datos de todas las 
                                     # variables para cada individuo

head(sinNAs)

datos <- airquality[sinNAs,]         # de airquality, selecciona todas  
head(datos)                          # las columnas de los casos sinNAs.

dim(datos) # observad que han sido eliminados 42 casos, 
# manteniendo las observaciones sus posiciones filas originales.

# --- https://www.uv.es/pjperez/curso_R/tt_2_conceptos_basicos_R.html#nombres_de_filascolumnas
# 5.4. Factores (pendiente)

# https://www.uv.es/vcoll/curso_r.html

# https://es.r4ds.hadley.nz/
