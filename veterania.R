## ----setup, include=FALSE, cache=FALSE-----------------------------------

require(ggplot2) 
require(ggthemes)

data <- read.csv("veterania-campus-2017.csv")
ggplot()+geom_jitter(data=data,aes(x=Edad,y=X.Cuantos.años.has.asistido.al.campus.,color=X.Niño.o.niña.),width=0.25)

