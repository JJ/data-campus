## ----setup, include=FALSE, cache=FALSE-----------------------------------

require(ggplot2) 
require(ggthemes)

data <- read.csv("veterania-campus-2017.csv")
ggplot()+geom_jitter(data=data,aes(x=Edad,y=X.Cuantos.años.has.asistido.al.campus.,color=X.Niño.o.niña.),width=0.25)

data$edad.inicial <- data$Edad-data$X.Cuantos.años.has.asistido.al.campus.
ggplot(data)+geom_histogram(aes(x=edad.inicial,fill=X.Niño.o.niña.),binwidth=1)

ggplot(data)+geom_histogram(aes(x=edad.inicial,fill=X.Niño.o.niña.),binwidth=1,position="fill")
