require(ggplot2) 
require(ggthemes)

attach("datos-universidades-desde-1986.Rdata") # Carga data y data.total

data$porcentaje <- data$porcentaje*100
data.Vigo <- data[data$Universidad=='Vigo',]
ggplot()+geom_line(data=data.Vigo,aes(x=Curso,group=1,y=Total,color="Total"))+geom_line(data=data.Vigo,group=1,aes(x=Curso,y=Mujeres,color="Mujeres")) +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+ggtitle('Universidad de Vigo')
ggplot(data.Vigo,aes(x=Curso,y=porcentaje,fill=Mujeres))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

data.Santiago <- data[data$Universidad=='Santiago de Compostela',]
ggplot()+geom_line(data=data.Santiago,aes(x=Curso,group=1,y=Total,color="Total"))+geom_line(data=data.Santiago,group=1,aes(x=Curso,y=Mujeres,color="Mujeres")) +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+ggtitle('Universidad de Santiago')
ggplot(data.Santiago,aes(x=Curso,y=porcentaje,fill=Mujeres))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

data.Coruna <- data[data$Universidad=='A Coruña',]
ggplot()+geom_line(data=data.Coruna,aes(x=Curso,group=1,y=Total,color="Total"))+geom_line(data=data.Coruna,group=1,aes(x=Curso,y=Mujeres,color="Mujeres")) +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+ggtitle('Universidade da Coruña')
ggplot(data.Coruna,aes(x=Curso,y=porcentaje,fill=Mujeres))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggplot()+geom_line(data=data.Vigo,aes(x=Curso,y=porcentaje,color='Vigo',group=1))+geom_line(data=data.Santiago,aes(x=Curso,y=porcentaje,color='Santiago',group=1))+geom_line(data=data.Coruna,aes(x=Curso,y=porcentaje,color='A Coruña',group=1))+theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

