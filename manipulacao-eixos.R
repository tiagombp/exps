library(tidyverse)
library(gganimate)

renda <- c(39.3, 38.9, 38.3, 39.2, 40, 40.2, 42.4, 42.2, 43.2, 44.6, 44.3, 43.5, 42, 39.2)
eob <- c(33.7, 34.1, 34.6, 34, 34, 34.1, 33, 32.8, 33.1, 32.1, 32.4, 32.9, 35.3, 37.5)
param <- c(rep(0, length(renda)), rep(40, length(renda)))
periodo <- 1:length(renda)


df <- data.frame(renda = c(renda, renda), lucro = c(lucro, lucro), periodo = c(periodo, periodo), param) %>% gather(-periodo, -param, key = series, value = valor)

anim <- ggplot(df, aes(x = periodo, y = valor, color = series)) + geom_line(size = 2) + geom_point(aes(y = param), color = "transparent") +
  transition_states(param) + view_follow()

animate(anim, duration = 4)

gganimate::anim_save("eixos.gifs")
