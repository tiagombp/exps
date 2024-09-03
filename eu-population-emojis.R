library(datapasta)

library(extrafont)
loadfonts()

tribble_paste(data.frame(
  stringsAsFactors = FALSE,
  V1 = c("Austria","Belgium",
         "Bulgaria","Croatia","Cyprus","Czech Republic","Denmark",
         "Estonia","Finland","France","Germany","Greece",
         "Hungary","Ireland","Italy","Latvia","Lithuania",
         "Luxembourg","Malta","Netherlands","Poland","Portugal",
         "Romania","Slovakia","Slovenia","Spain","Sweden"),
  V2 = c(9104772,11754004,6447710,
         3850894,920701,10827529,5932654,1365884,5563970,
         68070697,84358845,10394055,9597085,5194336,58850717,
         1883008,2857279,660809,542051,17811291,36753736,10467366,
         19051562,5428792,2116792,48059777,10521556),
  V3 = c("2.0%","2.6%","1.4%","0.9%",
         "0.2%","2.4%","1.3%","0.3%","1.2%","15.2%","18.8%",
         "2.3%","2.1%","1.2%","13.1%","0.4%","0.6%","0.1%",
         "0.1%","4.0%","8.2%","2.3%","4.2%","1.2%","0.5%",
         "10.7%","2.3%"),
  V4 = c(83878,30667,110996,56594,
         9253,78871,42925,45336,338411,638475,357569,131694,
         93012,69947,302079,64586,65284,2595,316,37378,
         311928,92227,238398,49035,20273,505983,447424),
  V5 = c("2.0%","0.7%","2.6%","1.3%",
         "0.2%","1.9%","1.0%","1.1%","8.0%","15.1%","8.5%",
         "3.1%","2.2%","1.7%","7.1%","1.5%","1.5%","0.1%",
         "0.01%","0.9%","7.4%","2.2%","5.6%","1.2%","0.5%",
         "12.0%","10.6%"),
  V6 = c(109L,383L,58L,68L,100L,
         137L,138L,30L,16L,107L,236L,79L,103L,74L,195L,29L,
         44L,255L,1715L,477L,118L,113L,80L,111L,104L,95L,
         24L)
))
data <- tibble::tribble(
          ~Country,     ~Pop,~pct_pop,  ~Area,~pct_area,~density,
         "Austria",  9104772,  "2.0%",  83878,  "2.0%",  109L,
         "Belgium", 11754004,  "2.6%",  30667,  "0.7%",  383L,
        "Bulgaria",  6447710,  "1.4%", 110996,  "2.6%",   58L,
         "Croatia",  3850894,  "0.9%",  56594,  "1.3%",   68L,
          "Cyprus",   920701,  "0.2%",   9253,  "0.2%",  100L,
  "Czech Republic", 10827529,  "2.4%",  78871,  "1.9%",  137L,
         "Denmark",  5932654,  "1.3%",  42925,  "1.0%",  138L,
         "Estonia",  1365884,  "0.3%",  45336,  "1.1%",   30L,
         "Finland",  5563970,  "1.2%", 338411,  "8.0%",   16L,
          "France", 68070697, "15.2%", 638475, "15.1%",  107L,
         "Germany", 84358845, "18.8%", 357569,  "8.5%",  236L,
          "Greece", 10394055,  "2.3%", 131694,  "3.1%",   79L,
         "Hungary",  9597085,  "2.1%",  93012,  "2.2%",  103L,
         "Ireland",  5194336,  "1.2%",  69947,  "1.7%",   74L,
           "Italy", 58850717, "13.1%", 302079,  "7.1%",  195L,
          "Latvia",  1883008,  "0.4%",  64586,  "1.5%",   29L,
       "Lithuania",  2857279,  "0.6%",  65284,  "1.5%",   44L,
      "Luxembourg",   660809,  "0.1%",   2595,  "0.1%",  255L,
           "Malta",   542051,  "0.1%",    316, "0.01%", 1715L,
     "Netherlands", 17811291,  "4.0%",  37378,  "0.9%",  477L,
          "Poland", 36753736,  "8.2%", 311928,  "7.4%",  118L,
        "Portugal", 10467366,  "2.3%",  92227,  "2.2%",  113L,
         "Romania", 19051562,  "4.2%", 238398,  "5.6%",   80L,
        "Slovakia",  5428792,  "1.2%",  49035,  "1.2%",  111L,
        "Slovenia",  2116792,  "0.5%",  20273,  "0.5%",  104L,
           "Spain", 48059777, "10.7%", 505983, "12.0%",   95L,
          "Sweden", 10521556,  "2.3%", 447424, "10.6%",   24L
  )

data$emoji <- c("🇦🇹", "🇧🇪", "🇧🇬", "🇭🇷", "🇨🇾", "🇨🇿", "🇩🇰", "🇪🇪", "🇫🇮", "🇫🇷", "🇩🇪", "🇬🇷", "🇭🇺", "🇮🇪", "🇮🇹", "🇱🇻", "🇱🇹", "🇱🇺", "🇲🇹", "🇳🇱", "🇵🇱", "🇵🇹", "🇷🇴", "🇸🇰", "🇸🇮", "🇪🇸", "🇸🇪")


library(ggplot2)

ggplot(data) + geom_col(aes(x = Pop, y = Country)) + scale_y_discrete(limits = rev)

ggplot(data) + geom_col(aes(x = Pop, y = Country), fill = "hotpink") +
  scale_y_discrete(limits = rev) + 
  scale_x_continuous(labels = function(x){ ifelse(x == 0, 0, paste(format(x/1e6, big.mark = ".", decimal.mark = ",", scientific = FALSE), "million"))}, expand = c(0,0), limits = c(0, 89e6)) +
  labs(y = NULL, x = NULL) + 
  theme_minimal() +
  theme(
    text = element_text(family = "Work Sans"),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.x = element_blank())

ggsave("eu-pop.png", plot = last_plot(), device = "png", width = 7, height = 5, dpi = 300)

ggplot(data) + geom_col(aes(x = Pop, y = reorder(Country, Pop)), fill = "hotpink") +
  scale_y_discrete() + 
  scale_x_continuous(labels = function(x){ ifelse(x == 0, 0, paste(format(x/1e6, big.mark = ".", decimal.mark = ",", scientific = FALSE), "million"))}, expand = c(0,0), limits = c(0, 89e6)) +
  labs(y = NULL, x = NULL) + 
  theme_minimal() +
  theme(
    text = element_text(family = "Work Sans"),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.x = element_blank())

ggsave("eu-pop-order.png", plot = last_plot(), device = "png", width = 7, height = 5, dpi = 300)


ggplot(data, aes(x = Pop, y = reorder(Country, Pop))) + 
  geom_col(fill = "hotpink") +
  geom_text(aes(label = emoji), family = "Work Sans", hjust = "left") + 
  scale_y_discrete() + 
  scale_x_continuous(labels = function(x){ ifelse(x == 0, 0, paste(format(x/1e6, big.mark = ".", decimal.mark = ",", scientific = FALSE), "million"))}, expand = c(0,0), limits = c(0, 89e6)) +
  labs(y = NULL, x = NULL) + 
  theme_minimal() +
  theme(
    text = element_text(family = "Work Sans"),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.x = element_blank())

ggsave("eu-pop-order-emoji.png", plot = last_plot(), device = "png", width = 7, height = 5, dpi = 300)

library(tidyverse)
write.csv(data %>% select(Country, Pop), "pop-eu.csv")
    