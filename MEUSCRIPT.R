#class 

#---------------selecionando e executando o data frame

df <- iris
iris

#------------ vendo os tipos de dados

str(df)
summary("df")

#------------ chamando e selecionando o que eu quero no dataframe

df
df$Sepal.Length

#----------- plotando

library(ggplot2)

ggplot(iris, aes(x=Sepal.Length, y=Species))+ 
  geom_point ()+
  theme(axis.title = element_text(size = 22,face = "bold"),
        axis.text = element_blank())

#possível adc titulo, tema

geom_point ()+
  theme(axis.title = element_text)

    #possivel salvar grafico como objeto, só identificar com nome conhecido, tipo P1
    #ex.: p1=ggplot2(iris, aes(x=Sepal.Length, y=Species)) dps so trazer o grafico chamando p1

p1=ggplot(iris, aes(x=Sepal.Length, y=Species))+ 
  geom_point ()+
  theme(axis.title = element_text(size = 22,face = "bold"),
        axis.text = element_blank())
p1

#-------INVENTEI DE...
install.packages("barplot")

#? já começou errando...af

#------------ criei o vetor
#queda dos meus exp com o tempo

tempo <- c("0h", "2h", "4h", "6h", "8h")
temperature <- c(40.5, 42.7, 58.0, 63.0, 40.2)

#--------- cauclando a média da temp

mean(temperature)
#valor de 48.88

#--------- tentei criar o dataframe

falcon <- data.frame(tempo, temperature)
falcon

     #DUVIDA: tem como remover o vetor do environment?



#---------- descobrindo um gráfico de barras

#--------modificaçao 1

head(falcon)
str(falcon)

ggplot(falcon) +
  geom_col(aes(x=tempo, y=temperature)) +
  theme(axis.title = element_text(size = 15,face = "bold"),
        axis.text = element_blank())

#---------modificação 2 - THEMES

#A
ggplot(falcon) +
  geom_col(aes(x=tempo, y=temperature)) +
  theme(panel.background = element_rect(fill  = "white"),
        panel.grid = element_line(colour='black'))
#B
ggplot(falcon) +
  geom_col(aes(x=tempo, y=temperature)) +
  theme(axis.title = element_text(size = 15,face = "bold"),
        axis.text = element_blank()) +
  theme(panel.background = element_rect(fill  = "pink"),
        panel.grid = element_line(colour='blue'))

#C - pintando as colunas

ggplot(falcon) +
  geom_col(aes(x=tempo, y=temperature)) + 
  theme(axis.title = element_text(size = 15,face = "bold"),
        axis.text = element_blank()) +
  theme(panel.background = element_rect(fill  = "pink"),
        panel.grid = element_line(colour='blue'))

#D - criei em objeto prafacilitar 

c1=ggplot(falcon) +
  geom_col(aes(x=tempo, y=temperature)) + 
  theme(axis.title = element_text(size = 15,face = "bold"),
        axis.text = element_blank()) +
  theme(panel.background = element_rect(fill  = "pink"),
        panel.grid = element_line(colour='blue'))
c1

ggplot(falcon) +
  geom_col(aes(x=tempo, y=temperature)) + 
  scale_color_manual( values = c('red', 'yellow', 'green')) + 
  theme(axis.title = element_text(size = 15,face = "bold"),
        axis.text = element_blank()) +
  theme(panel.background = element_rect(fill  = "pink"),
        panel.grid = element_line(colour='blue'))

    #oq eu fiz de errado acima? a ideia era colorir as colunas..
    #e se eu criasse uma nova coluna pra predizer as cores, chamar ela dentro da aes


#E

c1 + theme(plot.background = element_rect(fill = "green"))

#F - mexendo na 'caixa do elemento'

c1 + theme(panel.background = element_rect(fill = "white", colour = "grey50"))

c1 + theme(panel.border = element_rect(linetype = "dashed", fill = NA))

#G - nomei um novo obejto com titulo

c2 <- ggplot(falcon, aes(tempo, temperature)) +
  geom_point() +
  labs(title = "Tempo de decaimento dos sistemas nanohibridos")

c2

c2 + theme(plot.title = element_text(size = rel(2)))

c2 + theme(plot.title = element_text(size = rel(2), colour = "green"))

#H - mundando as escalas

c2 + theme(axis.text = element_text(colour = "red"))

c2 + theme(axis.title = element_text(size = 8, colour = "yellow"))

       #como coloca o titulo no centro?

#I - strips

c3 <- ggplot(falcon, aes(tempo, temperature)) +
  geom_point() +
  facet_wrap(aes(class)) 
c3

    #ideia de tiras, porém acho q precisa de mais dados..

    #como coloca legenda? e como muda a bolinha p outra forma geometrica?
    #-------chamando funções: df+ as.dataframe(expres(xxxxx))
    #-------- geom_bar para barras, medida de frequencia



#-------------- REVISÃO

4*2
4/2
4^2
5 != 5 #simbolo de diferente
5<2
5>2
#maior/menor ou igual
4<=3
4>=5

# REPRESENTAÇÃO DE 'OU': |

#OBJETO -> as.integer(x/y) - tira os numeros depois da virgula
#OBJETO -> round(objeto) - arredonda valores

#OBJETO -> as.factor(objeto) 
#OBJETO -> is.factor(objeto) - tranformando em fator, porém nem td ode virar um
#um fator seria

#cntrl+l - limpa o console

#DEFININDO AREA DE TRABALHO 
#getwd("xxxxxx") - lembrar de ajeitar as barras do link da localização

#........relembrando

c1=ggplot(falcon) +
  geom_col(aes(x=tempo, y=temperature)) + 
  theme(axis.title = element_text(size = 15,face = "bold"),
        axis.text = element_blank()) +
  theme(panel.background = element_rect(fill  = "pink"),
        panel.grid = element_line(colour='blue'))
c1

#------- FOR LOOP
       #for (variavel in sequencia) {Código a ser executado repetidamente}

for (a in 1:5) {
  print(a)
}

for (a in 1:5) {
  resultado <- a^3
  print(resultado)
}

#--transformando em vetor
          
x <- c(1:5)
x
c(x^3)

          #peguei a variavel 'a' e calculei o cubo de cada numero
          #pipe - converter objeto em função


#---------- 18.07 - BOXPLOT

#MODEL

#-INSTALLATIONS

install.packages("dplyr")
install.packages("ggpubr")
install.packages("glue")
library(ggplot2)
library(dplyr)
library(ggpubr)
library(glue)
library(magrittr)

#-VISUALIZATION

View(iris)
str(iris)

#-OBJECTS

data1 <- iris

T0_n = iris %>% 
  filter(Sepal.Length == "setosa") %>% 
  nrow()
T1_n = iris %>% 
  filter(Sepal.Length == "virginica") %>% 
  nrow()
T2_n = iris %>% 
  filter(Sepal.Length == "versicolor") %>% 
  nrow()

iris$Sepal.Length <- factor(iris$Sepal.Length, 
                           levels = c("setosa","virginica","versicolor"))

names(iris)

b1 <- iris %>%
  ggplot(aes(x=Species,Sepal.Width, fill=Species))+
  labs(title="Species", x=NULL, y="Sepal.Width")+
  geom_boxplot(show.legend = F, outlier.shape = NA, 
               alpha=0.5, width=0.5, coef=0)+
  geom_point(aes(colour=factor(Species), 
                 fill = factor(Species)), shape=21, size = 3, alpha = .7,
             show.legend = F,position=position_jitter(width=0.15))+
  scale_x_discrete(breaks = c("setosa","virginica","versicolor"), 
                   labels = c(glue("setosa 
                                   (N={T0_n})"), 
                              glue("virginica 
                                   (N={T1_n})"), 
                              glue("versicolor 
                                   (N={T2_n})")))+
  scale_fill_manual(values=c("yellow","pink","purple"))+
  scale_colour_manual(values=c("black", "black","black"))+
  theme(axis.text = element_text(size = 12, color = "black"),
        axis.title = element_text(size = 14, color = "black"),
        panel.background = element_rect(fill="white"),
        axis.line = element_line(color = "black"),
        plot.title = element_text(size = 16, face = "bold",hjust = 0.5)) 
b1

compare_means(Sepal.Width ~ Species, data = iris, method = "wilcox.test")
my_comparisons <- list(c("virginica","setosa"), c("virginica","versicolor"), c("setosa","versicolor"))
b2 = b1 + stat_compare_means(comparisons = my_comparisons, size=5)

b2

    #obs: criar objeto cores - serve pro meu diagrama de fases - ajuda no loop



#------- MACHINE - RANDOM FOREST P/ CLASSIFICAÇÃO 


#-install.packages('xxx')

install.packages("randomForest")
install.packages("caTools")
install.packages("caret")

library(randomForest)
require(caTools)
library(dplyr)
library(caret)
library(e1071)
library(ggplot2)

df
names(df)
View(df)

data = as.data.frame(df[,c(1:5)])
#nova variavel possivel pq pelo codigo n tá dando certo..
data$teste[data$Species == 'versicolor'] <- 0
data$teste[data$Species == 'setosa'] <- 1
data$teste[data$Species == 'virginica'] <- 2

summary(data)
sapply(data, class)
data <- transform(data, teste=as.factor(teste))
data=na.omit(data)

sample = sample.split(data$teste, SplitRatio = .7)

train = subset(data, sample == TRUE)
test  = subset(data, sample == FALSE)
dim(train)
dim(test)

#--------- CREATE A RANDOM FOREST 

rf <- randomForest(x=train[,1:4], y=train[,6], ntreeTry=500, mtry=2, importance=F, keep.forest=T)

#obs.: y train - sexta coluna que antesera especie nominal agr númerica aos codig atribuidos
rf
plot(rf, main = "Random Forest")
axis(2)
importance(rf)
varImpPlot(rf,bg = "purple", cex=.9, main = "Feature Importance - cleee")

#---------- MAKE PREDICTIONS ON TEST DATA s

pred = predict(rf, newdata=test)
pred

confusionMatrix(table(pred, test$teste))