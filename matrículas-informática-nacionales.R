require(ggplot2) 
require(ggthemes)
library(tidyr)
library(dplyr)

data <- read.csv("mujeres-en-informática-desde-1986.csv", fileEncoding="latin1")
data.total <- data[data$Universidad=='Universidades Públicas',]
data.uned <- data[data$Universidad=='Nacional de Educación a Distancia',]
ggplot(data.total,aes(x=Curso,y=Valor,group_by="Genero"))+geom_line() +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

data.percentage <- spread(data.total,Genero,Valor)
data.percentage$porcentaje <- data.percentage$" Mujeres"/data.percentage$" Total"
ggplot(data.percentage,aes(x=Curso,y=porcentaje,fill=porcentaje))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

data.Granada <- data[data$Universidad=='Granada',]
ggplot(data.Granada,aes(x=Curso,y=Valor,group=Genero,color=Genero))+geom_line() +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+ggtitle('Universidad de Granada')

data.percentage.UGR <- spread(data.Granada,Genero,Valor)
data.percentage.UGR$porcentaje <- data.percentage.UGR$" Mujeres"/data.percentage.UGR$" Total"
ggplot(data.percentage.UGR,aes(x=Curso,y=porcentaje,fill=porcentaje))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

data.Malaga <- data[data$Universidad=='Málaga',]
ggplot(data.Malaga,aes(x=Curso,y=Valor,group=Genero,color=Genero))+geom_line() +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+ggtitle('Universidad de Málaga')

data.percentage.UMA <- spread(data.Malaga,Genero,Valor)
data.percentage.UMA$porcentaje <- data.percentage.UMA$" Mujeres"/data.percentage.UMA$" Total"
ggplot(data.percentage.UMA,aes(x=Curso,y=porcentaje,fill=porcentaje))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggplot()+geom_line(data=data.percentage.UMA,aes(x=Curso,y=porcentaje,color='blue',group=1))+geom_line(data=data.percentage.UGR,aes(x=Curso,y=porcentaje,color='red',group=1)) +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))
