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

data.Jaen <- data[data$Universidad=='Jaén',]
ggplot(data.Jaen,aes(x=Curso,y=Valor,group=Genero,color=Genero))+geom_line() +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+ggtitle('Universidad de Jaén')

data.percentage.Jaen <- spread(data.Jaen,Genero,Valor)
data.percentage.Jaen$porcentaje <- data.percentage.Jaen$" Mujeres"/data.percentage.Jaen$" Total"
ggplot(data.percentage.Jaen,aes(x=Curso,y=porcentaje,fill=porcentaje))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

data.UAL <- data[data$Universidad=='Almería',]
ggplot(data.UAL,aes(x=Curso,y=Valor,group=Genero,color=Genero))+geom_line() +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+ggtitle('Universidad de Almería')

data.percentage.UAL <- spread(data.UAL,Genero,Valor)
data.percentage.UAL$porcentaje <- data.percentage.UAL$" Mujeres"/data.percentage.UAL$" Total"
ggplot(data.percentage.UAL,aes(x=Curso,y=porcentaje,fill=porcentaje))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggplot()+geom_line(data=data.percentage.UMA,aes(x=Curso,y=porcentaje,color='UMA',group=1))+geom_line(data=data.percentage.UGR,aes(x=Curso,y=porcentaje,color='UGR',group=1))+geom_line(data=data.percentage.Jaen,aes(x=Curso,y=porcentaje,color='UJA',group=1))+geom_line(data=data.percentage.UAL,aes(x=Curso,y=porcentaje,color='UAL',group=1)) +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

data.UCA <- data[data$Universidad=='Cádiz',]
ggplot() +geom_line(data=data.UCA,aes(x=Curso,y=Total,group=1))+geom_line(data=data.UCA,aes(x=Curso,y=Mujeres,color=Mujeres,group=1) ) +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+ggtitle('Universidad de Cádiz')
