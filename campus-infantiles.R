## ----setup, include=FALSE, cache=FALSE-----------------------------------

require(ggplot2) 
require(ggthemes)

data <- read.csv("grupos-de-edad.csv")

## ----evolucion, cache=FALSE,echo=FALSE-----------------------------------
ggplot()+geom_line(data=data,aes(x=AÑO,y=as.numeric(X7.8),color="7-8"))+geom_line(data=data,aes(x=AÑO,y=as.numeric(X9.10),color="9-10"))+geom_line(data=data,aes(x=AÑO,y=as.numeric(X11.),color="11+"))+geom_point(data=data,aes(x=AÑO,y=as.numeric(X7.8),color="7-8"))+geom_point(data=data,aes(x=AÑO,y=as.numeric(X9.10),color="9-10"))+geom_point(data=data,aes(x=AÑO,y=as.numeric(X11.),color="11+"))+ylab("Porcentaje de chicas")+ guides(color=guide_legend(title="Grupos de edad"))+theme_tufte()
ggsave('por-edad.png')

## ----resumen, cache=FALSE,echo=FALSE-------------------------------------
library(knitr)
data.guay <- data.frame(edad.hasta.8 = data$X7.8, de.9.a.10 = data$X9.10, de.11.en.adelante = data$X11.)
kable(summary(data.guay))

