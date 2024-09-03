library(tidyverse)
library(vegalite)

a <- 1:20
b <- runif(20, 0, 20)
df <- data.frame(a, b)

vegalite::vegalite() %>% 
  add_data(df) %>% 
  encode_x("a", "Q") %>% 
  encode_y("b", "Q") %>% 
  vegalite::mark_circle()

