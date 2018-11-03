#Created on Thursday Nov 3 for Random Processes with Dr. Olga
#author: Ryan

#This function takes the following arguments:
#la - The birth intensity
#Mu - The death intensity
#end_time - this sets a maximum time
#pop - initial population

birth_death<-function(la,mu,end_time,pop){
  time = 0
pop_list = c(pop)
time_list = c(0)

while(time < end_time & pop > 0){
b_r = rexp(1,la) #setting the birth intensity
d_r = rexp(1,mu) #setting the death intensity

if(b_r<d_r){ #equivalent to 1/lambda < 1/mu - birth before death
  pop = pop + 1
time = time + b_r}
else{ #equivalent to 1/lambda > 1/mu - death before birth
  pop = pop - 1
time = time + d_r
}
pop_list <- append(pop_list,pop)
time_list <- append(time_list,time)
}

plot(time_list,pop_list,xlim=c(min(time_list),max(time_list)+1),
     ylim=c(min(pop_list),max(pop_list)+1),
      main="A Birth & Death Process",xlab='Time',ylab='Population',type ='s')
}


#some trials
birth_death(9,2,100,4)
birth_death(5,5,100,5)
birth_death(2,9,100,10)
birth_death(5,5,100,15)

