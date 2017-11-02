require(ggplot2) 
require(ggthemes)
library(tidyr)
library(dplyr)


attach("datos-universidades-desde-1986.Rdata") # Carga data y data.total

data.andalucia <- data[data$Universidad %in% c("Granada","Málaga","Cádiz","Córdoba","Sevilla","Jaén","Almería","Pablo de Olavide"),]
data.andalucia$porcentaje <- data.andalucia$porcentaje*100
matriculas.year <- data.frame(curso=character(),
                              total=integer(),
                              mujeres=integer(),
                              porcentaje=double())
cursos <-  sort(distinct(data.andalucia, Curso)$Curso)
for(i in 1:length(cursos)){
    
    este.curso <- data.andalucia[data.andalucia$Curso==cursos[i],]
    este.curso.mujeres <- sum(este.curso$Mujeres)
    este.curso.total <- sum(este.curso$Total)
    
    matriculas.year <- rbind( matriculas.year,
                             data.frame(curso=cursos[i],
                                        mujeres=este.curso.mujeres,
                                        total=este.curso.total,
                                        porcentaje=100*(este.curso.mujeres/este.curso.total)))
    
}

ggplot(matriculas.year,aes(x=curso,y=porcentaje,fill=total))+geom_bar(stat="Identity") +theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))+xlab('Porcentaje andaluz de mujeres en Informática')
