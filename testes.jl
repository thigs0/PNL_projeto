include("functions.jl")
include("metodos.jl")
using TickTock
using Plots

function testarN(f::Function; n::Int=500, N::Int=30)
    #Teste a função
    #otimiza com método do gradiente
    tempo = ones(n)
    x = rand(N)
    y = ones(n)
    for i in 1:n
      start = time()
      y[i] = f(Gradiente(x, f, M=i))
      tempo[i] = time()-start
    end
    p = scatter(1:n, tempo);
    println("A solução obtida pelo método do gradiente para função quadrática é:")
    print(Gradiente(x, f, M=n))

    return (p, y[n])
end 

function caminho(f::Function; n::Int=10, x::Vector{Float64}=rand(2))
  #Desenha n primeiros pontos
  z = ones(n+1, 2)
  z[1,:] = x
  for i in 1:n
    z[i+1,:] = Gradiente(x, f, M=i)
  end

  eixo_x = Vector(range(minimum(z[:,1])-2, maximum(z[:,1])+2, 100))
  eixo_y = Vector(range(minimum(z[:,2])-2, maximum(z[:,1])+2, 100))
  p = plot_iter(f, x=eixo_x, y=eixo_y, z=z)

  return p
end 
#eixox e y -> valor max e minimo