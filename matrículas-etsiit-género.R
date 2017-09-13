require(ggplot2) 
require(ggthemes)

data <- read.csv("grados-género-2012-2017.csv")
data$total <- data$Mujeres+data$Hombres
data$porcentaje <- data$Mujeres/data$total


ggplot()+geom_line(data=data,aes(x=Año,y=porcentaje,color=Carrera))+ylab("Porcentaje de mujeres")+ guides(color=guide_legend(title="Carreras"))+theme_tufte()
ggplot()+geom_line(data=data,aes(x=Año,y=Mujeres,color=Carrera))+ylab("Número de mujeres")+ guides(color=guide_legend(title="Carreras"))+theme_tufte()




