require(ggplot2) 
require(ggthemes)
library(tidyr)
library(dplyr)

data <- read.csv("matrículas-informática-nacionales-con-egresados.csv", fileEncoding="latin1")
data <-  spread(data,Genero,Valor)

