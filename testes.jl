include("./functions.jl")
include("./metodos.jl")

using TickTock
using Plots
using Random

Random.seed!(3)

#Gradiente
  ## quadratica
  epson = Vector([1; 1])

  x0 = [0, 0] + epson
  (p, y) = testarN(quadratica, Gradiente, n=500, N=100)
  xlabel!(Número de Iterações)
  ylabel!(Distância)
  savefig(p, "./fig/testesGradienteQuadratica.png")
  c = caminho(quadratica, Gradiente, n=3, x=x0)
  xlabel!(Coordenada)
  ylabel!(Curva de Nível da Função)
  savefig(c, "./fig/caminhoGradienteQuadratica.png")

  ## Rosenbrock
  x0 = [1, 1] + epson
  (p, y) = testarN(Rosenbrock, Gradiente, n=500, N=100)
  xlabel!(Número de Iterações)
  ylabel!(Distância)
  savefig(p, "./fig/testesGradienteRosenbrock.png")
  c = caminho(Rosenbrock, Gradiente, n=3, x=x0)
  xlabel!(Coordenada)
  ylabel!(Curva de Nível da Função)
  savefig(c, "./fig/caminhoGradienteRosenbrock.png")

  ## Styblinsky_Tang
  x0 = [-2.9035, -2.9035] + epson
  (p, y) = testarN(Styblinsky_Tang, Gradiente, n=500, N=100)
  xlabel!(Número de Iterações)
  ylabel!(Distância)
  savefig(p, "./fig/testesGradienteStyblinsky_tang.png")
  c = caminho(Styblinsky_Tang, Gradiente, n=3, x=x0)
  xlabel!(Coordenada)
  ylabel!(Curva de Nível da Função)
  savefig(c, "./fig/caminhoGradienteStyblinsky_Tang.png")

  ## Rastrigin

  x0 = [0, 0] + epson
  (p, y) = testarN(Rastrigin, Gradiente, n=500, N=100)
  xlabel!(Número de Iterações)
  ylabel!(Distância)
  savefig(p, "./fig/testesGradienteRastrigin.png")
  c = caminho(Rastrigin, Gradiente, n=3, x=x0)
  xlabel!(Coordenada)
  ylabel!(Curva de Nível da Função)
  savefig(c, "./fig/caminhoGradienteRastrigin.png")


#Newton
 ## quadratica
  x0 = [0, 0] + epson
  (p, y) = testarN(quadratica, Newton, n=500, N=100)
  xlabel!(Número de Iterações)
  ylabel!(Distância)
  savefig(p, "./fig/testesNewtonQuadratica.png")
  c = caminho(quadratica, Newton, n=3, x=x0)
  xlabel!(Coordenada)
  ylabel!(Curva de Nível da Função)
  savefig(c, "./fig/caminhoNewtonQuadratica.png")

  ## Rosenbrock
  x0 = [1, 1] + epson
  (p, y) = testarN(Rosenbrock, Newton, n=500, N=100)
  xlabel!(Número de Iterações)
  ylabel!(Distância)
  savefig(p, "./fig/testesNewtonRosenbrock.png")
  c = caminho(Rosenbrock, Newton, n=3, x=x0)
  xlabel!(Coordenada)
  ylabel!(Curva de Nível da Função)
  savefig(c, "./fig/caminhoNewtonRosenbrock.png")

  ## Styblinsky_Tang
  x0 = [-2.9035, -2.9035] + epson
  (p, y) = testarN(Styblinsky_Tang, Newton, n=500, N=100)
  xlabel!(Número de Iterações)
  ylabel!(Distância)
  savefig(p, "./fig/testesNewtonStyblinsky_tang.png")
  c = caminho(Styblinsky_Tang, Newton, n=3, x=x0)
  xlabel!(Coordenada)
  ylabel!(Curva de Nível da Função)
  savefig(c, "./fig/caminhoNewtonStyblinsky_Tang.png")

  ## Rastrigin
  x0 = [0, 0] + epson
  (p, y) = testarN(Rastrigin, Newton, n=500, N=100)
  xlabel!(Número de Iterações)
  ylabel!(Distância)
  savefig(p, "./fig/testesNewtonRastrigin.png")
  c = caminho(Rastrigin, Newton, n=3, x=x0)
  xlabel!(Coordenada)
  ylabel!(Curva de Nível da Função)
  savefig(c, "./fig/caminhonewtonRastrigin.png")

#CP1
 ## quadratica
  x0 = [0, 0] + epson
 (p, y) = testarN(quadratica, CP1, n=500, N=100)
 xlabel!(Número de Iterações)
 ylabel!(Distância)
 savefig(p, "./fig/testesCP1Quadratica.png")
 c = caminho(quadratica, CP1, n=3, x=x0)
 xlabel!(Coordenada)
 ylabel!(Curva de Nível da Função)
 savefig(c, "./fig/caminhoCP1Quadratica.png")

 ## Rosenbrock
 x0 = [1, 1] + epson
 (p, y) = testarN(Rosenbrock, CP1, n=500, N=100)
 xlabel!(Número de Iterações)
 ylabel!(Distância)
 savefig(p, "./fig/testesCP1Rosenbrock.png")
 c = caminho(Rosenbrock, CP1, n=3, x=x0)
 xlabel!(Coordenada)
 ylabel!(Curva de Nível da Função)
 savefig(c, "./fig/caminhoCP1Rosenbrock.png")

 ## Styblinsky_Tang
 x0 = [-2.9035, -2.9035] + epson
 (p, y) = testarN(Styblinsky_Tang, CP1, n=500, N=100)
 xlabel!(Número de Iterações)
 ylabel!(Distância)
 savefig(p, "./fig/testesCP1Styblinsky_tang.png")
 c = caminho(Styblinsky_Tang, CP1, n=3, x=x0)
 xlabel!(Coordenada)
 ylabel!(Curva de Nível da Função)
 savefig(c, "./fig/caminhoCP1Styblinsky_Tang.png")

 ## Rastrigin
  x0 = [0, 0] + epson
 (p, y) = testarN(Rastrigin, CP1, n=500, N=100)
 xlabel!(Número de Iterações)
 ylabel!(Distância)
 savefig(p, "./fig/testesCP1Rastrigin.png")
 c = caminho(Rastrigin, CP1, n=3, x=x0)
 xlabel!(Coordenada)
 ylabel!(Curva de Nível da Função)
 savefig(c, "./fig/caminhoCP1Rastrigin.png")



#DFP
 ## quadratica
 x0 = [0, 0] + epson
 x0 = Vector([172.0; -61])
 (p, y) = testarN(quadratica, DFP, n=500, N=100)
 xlabel!(Número de Iterações)
 ylabel!(Distância)
 savefig(p, "./fig/testesDFPQuadratica.png")
 c = caminho(quadratica, DFP, n=3, x=x0)
 xlabel!(Coordenada)
 ylabel!(Curva de Nível da Função)
 savefig(c, "./fig/caminhoDFPQuadratica.png")

 ## Rosenbrock
 x0 = [1, 1] + epson
 (p, y) = testarN(Rosenbrock, DFP, n=500, N=100)
 xlabel!(Número de Iterações)
 ylabel!(Distância)
 savefig(p, "./fig/testesDFPRosenbrock.png")
 c = caminho(Rosenbrock, DFP, n=3, x=x0)
 xlabel!(Coordenada)
 ylabel!(Curva de Nível da Função)
 savefig(c, "./fig/caminhoDFPRosenbrock.png")

 ## Styblinsky_Tang
 x0 = [-2.9035, -2.9035] + epson
 (p, y) = testarN(Styblinsky_Tang, DFP, n=500, N=100)
 xlabel!(Número de Iterações)
 ylabel!(Distância)
 savefig(p, "./fig/testesDFPStyblinsky_tang.png")
 c = caminho(Styblinsky_Tang, DFP, n=3, x=x0)
 xlabel!(Coordenada)
 ylabel!(Curva de Nível da Função)
 savefig(c, "./fig/caminhoDFPStyblinsky_Tang.png")

 ## Rastrigin
 x0 = [0, 0] + epson
 (p, y) = testarN(Rastrigin, DFP, n=500, N=100)
 xlabel!(Número de Iterações)
 ylabel!(Distância)
 savefig(p, "./fig/testesDFPRastrigin.png")
 c = caminho(Rastrigin, DFP, n=3, x=x0)
 xlabel!(Coordenada)
 ylabel!(Curva de Nível da Função)
 savefig(c, "./fig/caminhoDFPRastrigin.png")

