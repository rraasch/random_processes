#BROWNING BRIDDE
#Created by Ryan Raasch
#on November 30, 2018
#for Dr. Olga's STAT 482

brownianbridge <- function(tfinal){

time <- seq(0,tfinal,.01)
u1 <- runif(length(time))
u2 <- runif(length(time))
b <- c(0)
w <- 0
x <- c(0)

for(i in seq(2,length(time))){
  w <- w + sqrt(-2*log(u1[i]))*cos(2*pi*u2[i])
  b[i] <- w
}  

for(i in seq(1,length(time))){
x[i]=b[i]-time[i]/tfinal*b[length(time)];
}

plot(time,x)

library(ggplot2)
brownian<- data.frame(time,x)
ggplot(brownian,aes(x=time,y=x)) +
  geom_point(size=0) +
  labs(x = "\n Time", y = "B(t) \n", title = paste0("Brownian Bridge \n")) +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
  geom_path()
}


brownianbridge(10)

