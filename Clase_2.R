# When we create a Notebook from "New file" section is equal to Jupyter Notebooks
library(tidyverse)

head(iris) # Iris = df por default
str(iris) # Description
datos  = as.tibble(iris) # (tidyverse required) Tibble is like a modern df. Tidyverse principal feature is its speed related to other R libraries
# DataTypes: dbl (dobles), chr (strings), dttm (date time), lgl (logical), fctr (factor), date (fecha). (ampliar)

tibble(
  x = 1:5, # Del 1 al 5
  y = 1,
  z = x^2 + y
)
 # Tribble es una function que te crea un tibble pero ingresandolo de otra forma (ampliar)
tribble(
  ~x, ~y, ~z,
  "a", 2, 3.6,
  "b", 1, 8.5
)

df <- tibble(
  x = runif(5), #r-uniforme. Crea números random de manera uniforme
  y = rnorm(5) #r-normal. Crea números aleatorios con distribución normal
)

df["x"] # Te reduce el tibble al vector seleccionado
df[["x"]] # Acceder a una columna
df$x # Same thing
df[["x"]][1] # Acceder a elementos dentro de las columnas por posición
df[["x"]][1:5]

df[1] # Accedo a la columna número 1
df[[1]] # Accedo al contenido de la columna 1

df %>% .[["x"]] # Pipes (ampliar)
df %>% .$x # Same thing

setwd("/Users/martriay/dev/cosi/DS_intro") # Set working directory
flights <- read_csv("flights.csv") # Usando read_csv en vez de read.csv usamos a función propia de tidyverse que convierte nuestros datos directamente en un tibble
str(flights) # Decripción de la variable

filter(flights, MONTH == 1, DAY == 1) # Flitro por lo vuelos del 01/01

filter(flights, (MONTH == 11 | MONTH == 12) & !(DEPARTURE_DELAY < 0))

flights = filter(flights, DEPARTURE_DELAY < 60) # Sobreescribo la variable flights
arrange(flights, desc(DEPARTURE_DELAY)) # Ordenar de mayor a menor x dep_delay
sub_flights = select(flights, MONTH, DAY, TAIL_NUMBER, ORIGIN_AIRPORT, DESTINATION_AIRPORT, DEPARTURE_DELAY) # Seleciono unas columnas para armar otro tibble
rename(flights, año = YEAR) # Renombrar una columna

sub_flights = mutate(sub_flights, dep_puntual = DEPARTURE_DELAY > 0, dep_puntual_grave = DEPARTURE_DELAY > 30) # Creo dos columnas nuevas con bitwise operators

agrupar_x_mes = group_by(sub_flights, DESTINATION_AIRPORT) # Agrupo por destino

summarise(agrupar_x_mes,
  delay = mean(dep_puntual, na.rm = TRUE),
  delay_grave = mean(dep_puntual_grave = TRUE),
  conteo = n() # n es una funcion que cuenta cuantas ocurrenias tiene el tibble
)

flights %>%
  select(MONTH, DAY, TAIL_NUMBER, ORIGIN_AIRPORT, DESTINATION_AIRPORT, DEPARTURE_DELAY) %>%
  filter(DEPARTURE_DELAY < 30) %>%
  select(MONTH, DAY, TAIL_NUMBER, ORIGIN_AIRPORT, DESTINATION_AIRPORT, DEPARTURE_DELAY) %>%
  arrange(desc(DEPARTURE_DELAY)) %>%
  summarise(
    delay = mean(dep_puntual, na.rm = TRUE),
    delay_grave = mean(dep_puntual_grave = TRUE),
    conteo = n()
  )