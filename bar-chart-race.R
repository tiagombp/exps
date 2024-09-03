library(tidyverse)
library(gganimate)

df <- data.frame(
  coisa_sendo_medida = runif(18, min = 2, max = 20) + c(c(0,0,0), rep(c(20,0,0), 5)),
  categorias = rep(c("Santa Cruz", "Náutico", "Sport"), 6),
  tempo = rep(1:6, each = 3)
)

df_prep <- df %>% group_by(categorias) %>%
  mutate(valor = cumsum(coisa_sendo_medida)) %>%
  ungroup() %>%
  group_by(tempo) %>%
  mutate(rank = rank(coisa_sendo_medida))

ggplot(df_prep, aes(y = rank, x = valor / 2, height = .5, width = valor, fill = categorias)) + geom_tile() +
  gganimate::transition_states(states = tempo)
