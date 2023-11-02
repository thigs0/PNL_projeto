include("functions.jl")
include("metodos.jl")
using TickTock
using Plots

n=500
#Teste a função quadratica
 #otimiza com método do gradiente
    time = ones(n)
    x = rand(n)
    y = ones(n)
    for i in 1:n
      start = time()
      y[i] = Gradiente(x, quadratica(), M=i)
      time[i] = time()-start
    end
    plot(1:n, time)
    println("A solução obtida pelo método do gradiente para função quadrática é:")
    print(Gradiente(x, quadratica(x, quadratica())) )
    
      
