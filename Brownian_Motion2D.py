import math
import numpy as np
from matplotlib import pyplot as plt

def brownianMotion(mu1, mu2, sigma1, sigma2, tfinal):
    time = np.arange(0,tfinal+0.01, 0.01)
    u1 = np.random.uniform(size = len(time))
    u2 = np.random.uniform(size = len(time))
    u3 = np.random.uniform(size = len(time))
    u4 = np.random.uniform(size = len(time))
    b1 = [0]
    b2 = [0]
    w1 = 0
    w2 = 0
    #run the loop
    for i in range(1, len(time)):
        w1 = w1 +math.sqrt(-2*math.log(u1[i]))*math.cos(2*math.pi*u2[i])
        w2 = w2 +math.sqrt(-2*math.log(u3[i]))*math.cos(2*math.pi*u4[i])
        b1.append(mu1*time[i]+sigma1*w1)
        b2.append(mu2*time[i]+sigma2*w2)
        
    #plot the data
    plt.plot(b1, b2)
    plt.title("Brownian Motion 2D")
    plt.xlabel("Brownian Motion -X")
    plt.ylabel("Brownian Motion - Y")
    plt.show()

brownianMotion(1, 2, 3, 4, 20)