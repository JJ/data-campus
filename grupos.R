library(ggplot2)
library(ggthemes)

data <- read.csv("grupos-de-edad.csv")

ggplot()+geom_line(data=data,aes(x=AÑO,y=as.numeric(X7.8),color="7-8"))+geom_line(data=data,aes(x=AÑO,y=as.numeric(X9.10),color="9-10"))+geom_line(data=data,aes(x=AÑO,y=as.numeric(X11.),color="10+"))+geom_point(data=data,aes(x=AÑO,y=as.numeric(X7.8),color="7-8"))+geom_point(data=data,aes(x=AÑO,y=as.numeric(X9.10),color="9-10"))+geom_point(data=data,aes(x=AÑO,y=as.numeric(X11.),color="10+"))+ylab("Porcentaje de chicas")



    
