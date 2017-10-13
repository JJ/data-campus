require(ggplot2) 
require(ggthemes)
library(tidyr)
library(dplyr)

data <- read.csv("mujeres-en-informática-desde-1986-sin-UNED.csv", fileEncoding="latin1")
data.por.uni <- data[data$Genero=='Total',]
data.por.uni <- data.por.uni[data.por.uni$Universidad!='Univ. Públicas Presenciales',]
data.por.uni <- data.por.uni[data.por.uni$Universidad!='Univ. Públicas No Presenciales',]
data.por.uni <- data.por.uni[data.por.uni$Universidad!='Unis sin UNED',]
ggplot(data.por.uni,aes(x=Curso,y=Valor,group=Universidad,color=Universidad))+geom_line() +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))
data.total <- data[data$Universidad=='Unis sin UNED',]
ggplot(data.total,aes(x=Curso,y=Valor,group=Genero,color=Genero))+geom_line() +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

data.percentage <- spread(data.total,Genero,Valor)
data.percentage$porcentaje <- data.percentage$Mujeres/data.percentage$Total
ggplot(data.percentage,aes(x=Curso,y=porcentaje,fill=porcentaje))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Calcula porcentajes y lo traza
data <-  spread(data,Genero,Valor)
data$porcentaje <- data$Mujeres/data$Total
mutate.deltap <- data %>% group_by(Universidad) %>% mutate(delta.p=c(NA,diff(porcentaje)))
mutate.delta <- data %>% group_by(Universidad) %>% mutate(delta=c(NA,diff(Mujeres)))
data$delta.p <- mutate.deltap$delta.p
data$delta <- mutate.delta$delta
data.last <- data[data$Curso=="2016-2017",]
ggplot(data.last,aes(x=reorder(Universidad,porcentaje),y=porcentaje,fill=porcentaje))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggplot(data.last,aes(x=reorder(Universidad,delta.p),y=delta.p,fill=delta))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

data.egresados <- read.csv("graduados-en-informática.csv", fileEncoding="latin1")
data.egresados <- spread(data.egresados,Genero,Valor)
combined.u <- sort(union(levels(data$Universidad), levels(data.egresados$Universidad)))
combined.c <- sort(union(levels(data$Curso), levels(data.egresados$Curso)))
data.egresados <- mutate(data.egresados,Universidad=factor(Universidad,levels=combined.u))
data.egresados <- mutate(data.egresados,Curso=factor(Curso,levels=combined.c))
