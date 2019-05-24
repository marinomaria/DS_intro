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
 # Tribble es un function que te crea un tibble pero ingresandolo de otra forma (ampliar)
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
