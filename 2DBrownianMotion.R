#created by Ryan Raasch
#on November 28, 2018
#for Dr. Olga's STAT482 Random Process Class

brownianmotion <- function(mu1, mu2,sigma1,sigma2, tfinal){

time <- seq(0,tfinal,.01)
u1 <- runif(length(time))
u2 <- runif(length(time))
u3 <- runif(length(time))
u4 <- runif(length(time))
b1 <- c(0)
b2 <- c(0)
w1 <- 0
w2 <- 0
  
for(i in seq(2,length(time))){
    w1 <- w1 + sqrt(-2*log(u1[i]))*cos(2*pi*u2[i])
    w2 <- w2 + sqrt(-2*log(u3[i]))*cos(2*pi*u4[i])
    b1[i] <- (mu1*time[i])+(sigma1*w1)
    b2[i] <- (mu2*time[i]+(sigma2*w2))
}  
  
library(ggplot2)
brownian<- data.frame(b1,b2)
ggplot(brownian,aes(x=b1,y=b2)) +
  geom_point(size=0) +
  labs(x = "\n Brownian Motion - x", y = "Brownian Motion - y \n", title = paste0("Brownian Motion 2D \n")) +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
  geom_path()
}

brownianmotion(1,2,3,4,20)

