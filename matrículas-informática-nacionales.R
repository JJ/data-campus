require(ggplot2) 
require(ggthemes)
library(tidyr)

data <- read.csv("mujeres-en-informática-desde-1986.csv", fileEncoding="latin1")
data.total <- data[data$Universidad=='Universidades Públicas',]
ggplot(data.total,aes(x=Curso,y=Valor,group_by="Genero"))+geom_line() +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

data.percentage <- spread(data.total,Genero,Valor)
data.percentage$porcentaje <- data.percentage$" Mujeres"/data.percentage$" Total"
ggplot(data.percentage,aes(x=Curso,y=porcentaje,fill=porcentaje))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

