using Random
Random.seed!(3)
function quadratica(x::Vector{Float64})
  #= Constroi o valor da função quadratica para um dado vetor
  #
#Sabemos que o mínimo global é x* = [0,0,0,...,0]
  #
  =#
    x = x.^2
  r = 0.0
  for i in 1:length(x)
    r += i*x[i];
  end
  return r
end

function Rosenbrock(x::Vector{Float64})
#= Constroi a função de Rosenbrock para um dado vetor
  #
# Sabemos que o mínimo global é x* =[1 , 1, 1, ..., 1]
  Return: valor da função de Rosenbrock em no vetor x         =# 
  if !iseven(length(x))
    error("O vetor fornecido não é par")
  end
  r = 0.0
  for i in 1:(Int(length(x)/2))
    r += 10*(x[2*i]-x[2*i-1]^2)^2
    r += (x[2*i-1] - 1)^2
  end
  return r;
end

function Styblinsky_Tang(x::Vector{Float64})
  #= Calcula a função de Stynblinsky-tang para o vetor x
#
# Sabemos que o mínimo global é x* = [-2.9035, -2.9035,...,-2.9035]
=#
  f = 0.0
  for i in 1:length(x)
    f += x[i]^4 - 16*x[i]^2 + 5*x[i]
  end
  return f 
end

function Rastrigin(x::Vector{Float64})
  #= Calculamos a função de rastrigin para o vetor x
#Sabemos que o mínimo global é x* = [0,0,0,...,0]
  #
=#
  f = 0.0
  for i in 1:length(x)
    f += x[i]^2 - 10*cos(2π*x[i])
  end
  return f
end

function plot_iter(f::Function; x=range(-10, 10, 100), y=(range(-10, 10, 100)), z::Matrix=rand(5,2)*10)
  #x e y são os vetores com os pontos para construir o gráfico
  #z (n linhas, 2 colunas) é uma matriz em que suas colunas são as coodenadas x e y dos pontos a serem destacados
  #f é a função que originou os pontos

  w = ones(length(y), length(x))
  for i in 1:length(y)
    for j in 1:length(x)
      w[i,j] = f([x[j], y[i]])
    end
  end

  g = contour(x, y, w, clabels=false)

  plot!(g, [z[1, 1]], [z[1, 2]], seriestype=:scatter, c=:blue, legend=false)
  for i in 2:size(z)[1]
    plot!(g, [z[i-1, 1]], [z[i-1, 2]], seriestype=:scatter, c=:blue, legend=false)
    plot!(g, [z[i-1, 1], z[i, 1]], [z[i-1, 2], z[i, 2]], l=:arrow, c=:blue, legend=false)
  end
  plot!(g, [z[end, 1]], [z[end, 2]], seriestype=:scatter, c=:blue, legend=false)
  return g
end

function testarN(f::Function, Metodo::Function; n::Int=500, N::Int=30)
  #=Teste a função f otimizada com método Metodo
  n::Int é a quantidade limite de iterações
  N::Int é o tamanho do vetor x que queremos
  return: (p, y[n]) em que p é o gráfico e o valor da função para cada iteração
  =#
  # começa o algoritmo
  tempo = ones(n)
  x = rand(N)
  y = ones(n)
  for i in 1:n
    start = time()
    y[i] = f(Metodo(x, f, M=i))
    tempo[i] = time()-start
  end
  p = scatter(1:n, tempo);
  #println("A solução obtida pelo método $Metodo para função quadrática é:")
  #print(Metodo(x, f, M=n))
  return (p, y[n])
end 

function caminho(f::Function, Metodo::Function; n::Int=10, x::Vector{Float64}=rand(2))
  #=Desenha os n pontos de iteração de forma vetorial
  n::Int é a quantidade de pontos que queremos representados
  =#
  z = ones(n+1, 2)
  z[1,:] = x
  for i in 1:n
    z[i+1,:] = Metodo(x, f, M=i)
  end

  eixo_x = Vector(range(minimum(z[:,1])-2, maximum(z[:,1])+2, 100))
  eixo_y = Vector(range(minimum(z[:,2])-2, maximum(z[:,1])+2, 100))
  p = plot_iter(f, x=eixo_x, y=eixo_y, z=z)

  return p
end 
