library(tidyverse)
library(MASS)
# ggplot() te abre una especie de 'canvas' sobre el cual vamos añadiendo data
data(swiss) # Este dataset está acortado. Construido sobre datos censales.

swiss %>%
  select(Catholic) %>%
  mutate(Catholic = Catholic>50) %>%
  ggplot() +
    geom_bar(mapping = aes(x = Catholic))

ggplot(data = sws) +
  geom_point(aes(x = IG, y = IH))

# ggplot(data = <DATA>) +
#   <GEOM_FUNCTION>(aes(x, y, color, size, alpha, shape)) +
#   labs('<TITLE>') +
#   xlab() +
#   ylab()

sws %>%
  mutate(mayoriaCathol = CATHOL > PROTEST) %>%
  ggplot() +
  geom_point(
    aes(x = SINGLE24, y = IH, color = CATHOL)
  ) +
  labs(colour = "Pct Católicos") +
  xlab() +
  ylab() +
  facet_wrap(~ mayoriaCathol, nrow = 1) # Esta f me hace dos gráficos!!

sws %>%
  mutate(mayoriaCathol = CATHOL > PROTEST) %>%
  ggplot() +
  geom_point(
    aes(x = SINGLE24, y = IH, color = CATHOL)
  ) +
  labs(colour = "Pct Católicos") +
  xlab() +
  ylab() +
  geom_smooth(method = "rlm", aes(x = SINGLE24, y = IH, linetype = mayoriaCathol)) # Esto me hace dos líneas de tendencia, cada una de acuerdo a cada grupo. 'rml' stands for robust linear model



