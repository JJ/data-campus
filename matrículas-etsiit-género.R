require(ggplot2) 
require(ggthemes)
library(tidyr)

data <- read.csv("grados-género-2012-2017.csv")
data$total <- data$Mujeres+data$Hombres
data$porcentaje <- data$Mujeres/data$total
data$totalNueva <- data$NuevaMujeres+data$NuevaHombres
data$porcentajeNueva <- data$NuevaMujeres/data$totalNueva

ggplot()+geom_line(data=data,aes(x=Año,y=porcentaje,color=Carrera))+ylab("Porcentaje de mujeres")+ guides(color=guide_legend(title="Carreras"))+theme_tufte()

ggplot()+geom_line(data=data,aes(x=Año,y=Mujeres,color=Carrera))+ylab("Número de mujeres")+ guides(color=guide_legend(title="Carreras"))+theme_tufte()

data.v2 <-  gather(data,"Género","Valor",3:4)
data.gii <- data.v2[data.v2$Carrera=='Informática',]
ggplot(data.gii,aes(x=Año,y=Valor,fill=factor(Género)))+geom_bar(stat = "identity")
ggplot(data.gii,aes(x=Año,y=Valor/total,fill=factor(Género)),position="fill")+geom_bar(stat = "identity")+geom_text(aes(label=Género),position=position_stack(vjust=0.5),size=10)+theme_tufte()

datos.nota <- data[!is.na(data$NotaCorte),]
ggplot(datos.nota, aes(x=NotaCorte,y=porcentajeNueva,color=Carrera,shape=factor(Año),size=NuevaMujeres))+geom_point()+theme_tufte()
