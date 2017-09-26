require(ggplot2) 
require(ggthemes)

data <- read.csv("nuevas-matrículas-ETSIIT.csv")
data$total <- data$Mujeres+data$Hombres
data$porcentaje <- 100*data$Mujeres/data$total
ggplot(data,aes(x=reorder(Carrera,porcentaje),y=porcentaje,fill=Mujeres))+geom_bar(stat = "identity")+ylab("Porcentaje de mujeres")+ labs(x="Grado")+guides(color=guide_legend(title="Carreras"))+theme_tufte()

