ggplot(data = iris) +
  geom_bar(mapping = aes(x = Species))

ggplot(data = iris) + # EN GGPLOT '+' REEMPLAZA '%>%'
  geom_point(mapping = aes(x = Sepal.Length, y = Petal.Length,
                           color = Species,
                           size = Petal.Width,
                           alpha = Sepal.Width)
             ) +
  geom_smooth(aes(x = Sepal.Length, y = Petal.Length))