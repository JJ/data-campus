require(ggplot2)
require(ggthemes)

data <- read.csv("modelo.csv")
data$porcentaje <- data$Mujeres/(data$Hombres+data$Mujeres)
ggplot(data,aes(x=as.integer(rownames(data)),y=porcentaje,group=1))+geom_line() +theme_tufte() 


