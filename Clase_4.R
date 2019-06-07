library(tidyverse)
library(nycflights13)

flights = flights
aiports = airports

airports = rename(airports, dest=faa)

foo = flights %>%
  select(tailnum, origin, dest) %>%
  group_by(dest) %>%
  summarise(aux = n()) %>%
  arrange(desc(aux))

foo = foo %>%
  left_join(airports, key='dest') %>%
  select(dest, aux, name) %>%
  rename('faa_dest'='dest')

airports = rename(airports, origin=dest)

foo2 = flights %>%
  select(tailnum, origin, dest) %>%
  group_by(origin) %>%
  summarise(aux = n()) %>%
  arrange(desc(aux))

foo2 = foo2 %>%
  left_join(airports, key='origin') %>%
  select(origin, aux, name) %>%
  rename('faa_origin'='origin')