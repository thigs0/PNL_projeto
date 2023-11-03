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
  #z é uma matriz em que suas colunas são as coodenadas x e y dos pontos 
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


#z = matriz de n linhas e 2 colunas
#1a coluna eh posicao x, segunda y, do ponto a ser plotado