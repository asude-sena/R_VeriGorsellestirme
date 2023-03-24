install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)
ggplot(data = murders)
murders |> ggplot()
asude1_graf<-ggplot(data = murders)
asude1_graf
class(asude1_graf)
print(asude1_graf)

asude1_graf<-asude1_graf + geom_point(aes(population/10^6, total))
asude1_graf
asude1_graf<-asude1_graf + geom_text(aes(population/10^6,total,label = abb))
asude1_graf + geom_point(aes(population/10^6, total), size = 3) +
geom_text(aes(population/10^6,total,label = abb))

asude1_graf + geom_point(aes(population/10^6, total), size = 3) +
  geom_text(aes(population/10^6,total,label = abb), nudge_x = 1.5)

args(ggplot)
asude1_graf <- murders|> ggplot(aes(population/10^6,total,label = abb))
asude1_graf

asude1_graf + geom_point(size = 3) +
  geom_text(nudge_x = 1.5)

asude1_graf + geom_point(size = 3) +
  geom_text(aes(x = 10 , y = 800 , label = "Selamlar..."))

asude1_graf + geom_point(size = 3) +
  geom_text(nudge_x = 1.5) +
  scale_x_log10() +
  scale_y_log10()

asude1_graf + geom_point(size = 3) +
  geom_text(nudge_x = 0.05) +
  scale_x_log10() +
  scale_y_log10()

asude1_graf + geom_point(size = 3) +
  geom_text(nudge_x = 0.05) +
  scale_x_log10() +
  scale_y_log10() + labs(x= "Nüfus : milyon(log ölçeği)", y = "Toplam cinayet sayısı(log ölçeği)", title = "2010 Cinayet grafiği")


asude1_graf <- murders |> ggplot(aes(population/10^6,total,label = abb)) +
  geom_text(nudge_x = 0.05) +
  scale_x_log10() +
  scale_y_log10() +
  labs(x= "Nüfus : milyon(log ölçeği)", y = "Toplam cinayet sayısı(log ölçeği)", title = "2010 Cinayet grafiği")
asude1_graf

asude1_graf + geom_point(size = 3 , color ="blue")
asude1_graf + geom_point(aes(col = region),size = 3)

asude2_r<-murders|>
  summarize(oran = sum(total)/sum(population) * 10^6) |>
  pull(oran)

asude1_graf + geom_point(aes(col = region),size = 3) +
  geom_abline(intercept = log10(asude2_r))

asude1_graf<-asude1_graf +   geom_abline(intercept = log10(asude2_r),linetype = 2,color = "darkgrey") +
geom_point(aes(col = region),size = 3)
asude1_graf

asude1_graf<-asude1_graf + scale_color_discrete(name = "Region")
asude1_graf

install.packages("ggthemes")
library(ggthemes)
asude1_graf + theme_economist()
asude1_graf + theme_fivethirtyeight()

install.packages("ggrepel")
library(ggrepel)

asude2_r<-murders|>
  summarize(oran = sum(total)/sum(population) * 10^6) |>
  pull(oran)

murders |> ggplot(aes(population/10^6,total,label = abb)) +
  geom_abline(intercept = log10(asude2_r),linetype = 2,color = "darkgrey") +
  geom_point(aes(col = region),size = 3) +
  geom_text_repel() +
  scale_x_log10() +
  scale_y_log10() +
  labs(x= "Populations in millions (log scale)", y = "Total number of murders(log scale)", title = "US Gun Murders in 2010")+
  scale_color_discrete(name = "Region")+
  theme_economist()

asude3_x<- murders$population
asude4_y<-murders$total

data.frame(x = asude3_x , y = asude4_y)|>
  ggplot(aes(asude3_x,asude4_y))+
  geom_point()

qplot(asude3_x,asude4_y)
  
install.packages("gridExtra")
library(gridExtra)

asude5_p1<-qplot(asude3_x)
asude5_p1

asude6_p2<-qplot(asude3_x,asude4_y)
asude6_p2

grid.arrange(asude5_p1,asude6_p2,ncol =2)  
