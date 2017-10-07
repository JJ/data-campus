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

# Máximos y mínimos
universidades <- levels(unique(data$Universidad))
porcentajes.universidad <- data.frame(uni=character(),
                                      max=double(),
                                      min=double(),
                                      last=double(),
                                      min.to.last=double(),
                                      max.to.last=double)

for(i in 1:length(universidades)){
    porcentaje.esta <- data[data$Universidad==universidades[i],]$porcentaje
    last <- porcentaje.esta[length(porcentaje.esta)]
    this.max <- max(porcentaje.esta)
    this.min <- min(porcentaje.esta)
    
    porcentajes.universidad <- rbind( porcentajes.universidad,
                                     data.frame(uni=universidades[i],
                                                last=last*100,
                                                max=this.max*100,
                                                min=this.min*100,
                                                min.to.last= (last - this.min)*100,
                                                max.to.last= (this.max - last)*100 ))
}

ggplot(porcentajes.universidad,aes(x=reorder(uni,min.to.last),y=min.to.last,fill=max))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+xlab('Subida porcentual desde mínimo')

ggplot(porcentajes.universidad,aes(x=reorder(uni,max.to.last),y=max.to.last,fill=min))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+xlab('Bajada porcentual desde máximo')
