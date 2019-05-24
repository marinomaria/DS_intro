library(tidyverse) #Cargo las librerías que voy a usar
library(sf)

mortalidad <- read.csv('https://bitsandbricks.github.io/data/mortalidad_infantil_caba_2016.csv') #Cargo los datos de la tasa de mortalidad por comuna (2016)

dim(mortalidad) #dimensions
names(mortalidad) #column names
head(mortalidad) #first observations (head) of the df

#Primer plotteo: barplot, tasa de mortalidad por comuna
ggplot(mortalidad) +
  geom_col(aes(x = factor(Comuna), y = Tasa2016))

comunas <- st_read('https://bitsandbricks.github.io/data/CABA_comunas.geojson') #Cargo información geográfica de las comunas
rivadavia <- st_read('https://bitsandbricks.github.io/data/avenida_rivadavia.geojson') #Cargo info de la ubicación de Av. Rivadavia

#Segundo plotteo: Mapa de la Ciudad + división entre comunas (color-coded) + Avenida Rivadavia
ggplot(comunas) +
  geom_sf(aes(fill = comunas)) +
  geom_sf(data = rivadavia, color = "red")

#Creo la variable norte-sur y la añado a ambos df's
norte_o_sur <- c("Sur", "Norte", "Sur", "Sur", "Sur", "Norte", "Sur", "Sur", "Sur", "Norte", "Norte", "Norte", "Norte", "Norte", "Norte")
comunas <- mutate(comunas, ubicacion = norte_o_sur)
mortalidad <- mutate(mortalidad, ubicación = norte_o_sur)

#Tercer plotteo: Visualizo que esté bien hecha la distribución norte-sur
ggplot(comunas) +
  geom_sf(aes(fill = ubicacion)) +
  geom_sf(data = rivadavia, color = "red")

#Cuarto plotteo: Tasa de mortalidad por comuna, marcada en una gradiente
ggplot(comunas) +
  geom_sf(aes(fill = mortalidad$Tasa2016)) +
  geom_sf(data = rivadavia, color = "red") +
  scale_fill_distiller(palette = "Spectral")

#Quinto ploteo: Barplot de la tasa de mortalidad por comuna con diferenciación norte-sur
ggplot(mortalidad) +
  geom_col(aes(x = Comuna, y = Tasa2016, fill = ubicación)) +
  labs(title = "Mortalidad infantil en la Ciudad Autónoma de Buenos Aires",
       subtitle = "Año 2016",
       y = "tasa") 
