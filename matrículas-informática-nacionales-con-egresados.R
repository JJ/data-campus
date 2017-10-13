require(ggplot2) 
require(ggthemes)
library(data.table)
library(dplyr)

data <- read.csv("matrículas-informática-nacionales-con-egresados.csv", fileEncoding="latin1")
data$Graduados.Hombres <- data$Graduados.Total-data$Graduadas
data$M.Hombres <- data$M.Total-data$M.Mujeres
data$p.graduados <- data$Graduados.Hombres/data$M.Hombres
data$p.graduadas <- data$Graduadas/data$M.Mujeres


data.presenciales <- data[data$Universidad=='Univ. Públicas Presenciales',]
ggplot() +geom_line(data=data.presenciales,aes(x=Curso,y=p.graduadas,group=1,color='Mujeres')) + geom_point(data=data.presenciales,aes(x=Curso,y=p.graduadas,group=1,color='Mujeres')) + geom_line(data=data.presenciales,aes(x=Curso,y=p.graduados,group=1,color='Total')) + geom_point(data=data.presenciales,aes(x=Curso,y=p.graduados,group=1,color='Total'))+theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+xlab('Cambio anual en las matrículas en informática')
