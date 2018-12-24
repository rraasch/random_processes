#updated by Ryan Raasch on Wed. Nov 28, 2018

brownian <- function(mu, sigma, tfinal){

time<- seq(0,tfinal,.01)
u1<- runif(length(time))
u2<- runif(length(time))
b<- c()
w<- 0

for(i in 1:length(time)){
  if (i==1){
    b[i]=0
  }
  else {
  w<- w + sqrt(-2*log(u1[i]))*cos(2*pi*u2[i])
  b[i]<-(mu*time[i])+(sigma*w)}
}

library(ggplot2)
brownian<- data.frame(time,b)
ggplot(brownian,aes(x=time,y=b)) +
   geom_point(size=0) +
   geom_line(color = "red") +
   labs(x = "\n Time", y = "B \n", title = paste0("Brownian Motion \n")) +
   theme(plot.title = element_text(hjust = 0.5),
         axis.title.x = element_text(face="bold", colour="blue", size = 12),
         axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
   geom_hline(yintercept = 0, colour = "blue", linetype = "dotted")
}

brownian(0,1,10)

