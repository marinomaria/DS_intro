library(tidyverse)
library(nycflights13)

str(flights)
str(airlines)
str(airports) # Las tablas están relacionadas entre sí por distintas variables ("Estructura de tablas")
str(planes) # Necesidad de identificadores unívocos (ID o una columna en común)
str(weather)

# Cuatro tipo de uniones: inner_join(), left_join(), full_join() y right_join()
# inner_join(): Todos los casos que están en ambas tablas.
# left_join(): Pegame todos los registros de la tabla derecha a la tabla izquerda. Si no hay valores en común return NaN.
# right_join(): Same as left_join() pero al revés.
# full_join(): left_join() + right_join(). No pierde ningún valor rellena con NaN's.

x %>%
   inner_join(y, by='key') # We can add more arguments to the 'by' key arg. Same syntaxis for all the join functions

# Trabajar con duplicados: No pierde info pero cruza los duplicados.

flights = flights
planes = select(planes, model, manufacturer, tailnum, year)

flights %>%
  select(tailnum, origin, dest, dep_delay) %>%
  left_join(planes, key='tailnum')

flights %>%  # Similar a value_counts()
  group_by(dest) %>%
  summarise(aux = n()) %>%
  arrange(desc(aux))

summarise(flights, distinct())