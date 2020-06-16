library(dplyr)
library(ggplot2)

casos_estados <- read.csv("https://raw.githubusercontent.com/marcuswac/covid-br-data/master/covid-br-ms-states.csv")

glimpse (casos_estados)
summary(casos_estados)
names(casos_estados)

casos_sp_rj <- casos_estados %>%
  filter(estado == "SP" | estado == "RJ") %>%
  mutate(data = as.Date(data, format = "%Y-%m-%d"))

casos_sp_rj

plot1 <- ggplot(casos_sp_rj, aes(x = data, y = casosAcumulado,
                                 color = estado)) + 
  geom_line()

plot1

casos_pb_pe <- casos_estados %>%
  filter(estado == "PB" | estado == "PE") %>%
  mutate(data = as.Date(data, format = "%Y-%m-%d"))
casos_pb_pe

plot2 <- ggplot(casos_pb_pe, aes(x = data, y = casosAcumulado,
                                 color = estado)) + 
  geom_line()

plot2

casos_ce_rn <- casos_estados %>%
  filter(estado == "CE" | estado == "RN") %>%
  mutate(data = as.Date(data, format = "%Y-%m-%d"))
casos_ce_rn

plot3 <- ggplot(casos_ce_rn, aes(x = data, y = casosAcumulado,
                                 color = estado)) + 
  geom_line()

plot3

?ggsave

ggsave("casos_covid19_sp_rj.pdf", plot1)
ggsave("casos_covid19_pb_pe.pdf", plot2)
ggsave("casos_covid19_ce_rn.pdf", plot3)