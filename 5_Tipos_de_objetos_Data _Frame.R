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
# Los data frame pueden almacenar objetos/datos de distinto tipo: num??ricos, 
# car??cter, ??? En las matrices todos los elementos ten??an que ser enteros o 
# num??ricos.
# Los data frame pueden entenderse como un tipo especial de lista donde cada 
# elemento de la lista tiene que tener la misma longitud. 
# Cada elemento de la lista ser??a una columna y la longitud de cada elemento 
# de la lista ser??an las filas.

#------------------------------------------------------------------------------#
# 5.1 Crear un data frame.
#------------------------------------------------------------------------------#

# Aunque normalmente los data frame los creamos al cargar/leer una base de datos
# vamos crear una data frame para ver su estructura.

x <- data.frame(Titulacion = c("Econom??a", "ADE", "Sociolog??a", "Magisterio"), 
                Edad = c(25, 27, 25, 24))
x

#------------------------------------------------------------------------------#
# 5.2 Clase de un data frame.
#------------------------------------------------------------------------------#

class(x)

#------------------------------------------------------------------------------#
# 5.3 Dimensi??n de un data frame.
#------------------------------------------------------------------------------#

# ??Cu??l es la dimensi??n del objeto x (que es una data frame)?

nrow(x) # n??mero de filas

ncol(x) # n??mero de columnas

dim(x) # n??mero de filas y columnas


#------------------------------------------------------------------------------#
# 5.4 Acceder a los elementos de un data frame.
#------------------------------------------------------------------------------#

# Para acceder a los elementos de un data frame utilizamos los s??mbolos $ o [].

# Si queremos seleccionar la variable Titulacion del objeto x 
# (que es un data frame):

x$Titulacion

# Tambi??n lo podemos hacer as??:
x[1]

# y para seleccionar sus dos primeros elementos de Titulacion:

x$Titulacion[1:2]

# Si trabajamos con una base de datos (o data frame), para no tener que acceder 
# a una variable utilizando la expresi??n objeto$variable, que a veces resulta 
# farragoso, puede hacerse un attach al objeto. 
# Esto nos permitir?? acceder directamente a las variables de la base de datos 
# por su nombre.

# si escribo Titulacion dar??: Error: object 'Titulacion' not found 
Titulacion

# En cambio: 
attach(x)

# si escribo Titulacion ahora dar??: "Econom??a" "ADE" "Sociolog??a" "Magisterio"
Titulacion


#------------------------------------------------------------------------------#
# 5.5 Agregar una nueva variable al data frame.
#------------------------------------------------------------------------------#
#  Por ejemplo, vamos a a??adir la variable id (de identificador) al objeto x.

# Esto lo podemos hacer directamente utilizando el s??mbolo $.

x$id <- 1:4

x

# o podemos crear la nueva variable, 
# por ejemplo la variable obs (de observaci??n) y despu??s combinarla con nuestro  
# data frame x.

obs <- 1:4

x <-cbind(obs,x)

x

class(x)


#------------------------------------------------------------------------------#
# 5.6 Ver el contenido de un data frame: head y tail.
#------------------------------------------------------------------------------#

# head permite ver las 6 primeras observaciones y tail la segunda las 6 ??ltimas.
# Tambi??n podemos indicar el n??mero de observaciones que queremos visualizar.


data(EuStockMarkets)        # cargamos los datos EuStockMarkets
EuStockMarkets              # para ver el contenido del objeto

head(EuStockMarkets) # 6 primeras observaciones

head(EuStockMarkets,10) # 10 primeras observaciones

tail(EuStockMarkets) # 6 ??ltimas observaciones

tail(EuStockMarkets,10) # 10 ??ltimas observaciones


#------------------------------------------------------------------------------#
# 5.7 Agregar nombres de filas/columnas en un data frame
#------------------------------------------------------------------------------#

# Si las columnas de un data frame no tienen nombres 
# (en nuestro ejemplo son Titulaci??n y Edad), podemos incluirlos utilizando la 
# funci??n names(). Para incluir nombres a las filas se utiliza 
# la funci??n row.names().

lista2 <- list(c("Econom??a", "ADE", "Sociolog??a", "Magisterio"), 
               c(25, 27, 25, 24))
z <- data.frame(lista2)

z

# # Para incluir los nombre a las columnas:
names(z) <- c("Titulaci??n", "Edad")

z


#------------------------------------------------------------------------------#
# 5.8 Eliminando valores NA
#------------------------------------------------------------------------------#

# En R los valores perdidos se denotan por NA (Not Available). 
# Cuando trabajamos con datos, una de las tareas m??s importantes que hay 
# que realizar es la de limpiar la base de datos y prepararla para los 
# posteriores an??lisis.

# Vamos a hacer una breve introducci??n a c??mo eliminar los valores NA 
# a trav??s del siguiente ejemplo:


x <- c(1,2,NA,NA,5)
malos <- is.na(x)  # Identificamos los NA con TRUE. 
                   # La funci??n is.na() es una funci??n l??gica.
malos

# Mostrar por pantalla todos los valores de x diferentes a malos (NA)
x[!malos] 

x


# Ahora supongamos que tenemos dos objetos (dos vectores con misma dimensi??n), 
# que tienen NAs en la misma fila, y nos queremos quedar ??nicamente con los 
# casos completos. Esta situaci??n se ilustra en el siguiente ejemplo:

x <- c(1,2,NA,4,NA,6)           #dos vectores con NAs en la misma fila
y <- c("a","b",NA,"d",NA,"f" )  #dos vectores con NAs en la misma fila

completos <- complete.cases(x,y) # complete.cases() es una funci??n l??gica
                                 # para un par (x,y) que tienen valores NAs
                                 # en misma posici??n, y se puede gestionar 
                                 # sacarlos del an??lisis.
completos

x[completos]

y[completos]

#------------------------

v <- c(0,1,2,NA,NA,5,6)         #dos vectores con NAs en distinta fila
w <- c(9,8,NA,6,5,4,NA)         #dos vectores con NAs en distinta fila

completos2 <- complete.cases(v) # complete.cases() es una funci??n l??gica

completos2

v[completos2]

completos3 <- complete.cases(w) # complete.cases() es una funci??n l??gica

completos3

w[completos3]


#-------------------Caso aplicado

# Por ??ltimo, vamos a ver lo anterior aplicado a un caso m??s pr??ctico. 
# Cargamos los datos airquality que se encuentran en el paquete datasets 
# y vamos a seleccionar ??nicamente los casos que est??n completos.

data("airquality")
head(airquality) # primeras 6 observaciones de "airquality"

tail(airquality) # pultimas 6 observaciones de "airquality"

head(airquality,15) # primeras 15 observaciones de "airquality"

tail(airquality,15) # ??ltimas 15 observaciones de "airquality"

length(airquality) # nos dar?? el n??mero de variables

dim(airquality) # indica el n??mero de (filas) y de (columnas)

summary(airquality)  # la funci??n summary() proporciona un resumen de 
# todas las variables de la base de datos.

sinNAs <- complete.cases(airquality) # nos dir?? si tenemos datos de todas las 
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
