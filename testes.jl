include("./functions.jl")
include("./metodos.jl")

using TickTock
using Plots
using Random

Random.seed!(3)

# Gradiente
  ## quadratica
  x0 = Vector([172.0; -61])
  (p, y) = testarN(quadratica, Gradiente, n=500, N=100)
  savefig(p, "./fig/testesGradienteQuadratica.png")
  c = caminho(quadratica, Gradiente, n=3, x=x0)
  savefig(c, "./fig/caminhoGradienteQuadratica.png")

  ## Rosenbrock
  (p, y) = testarN(Rosenbrock, Gradiente, n=500, N=100)
  savefig(p, "./fig/testesGradienteRosenbrock.png")
  c = caminho(Rosenbrock, Gradiente, n=3, x=x0)
  savefig(c, "./fig/caminhoGradienteRosenbrock.png")
  ## Styblinsky_Tang
  (p, y) = testarN(Styblinsky_Tang, Gradiente, n=500, N=100)
  savefig(p, "./fig/testesGradienteStyblinsky_tang.png")
  c = caminho(Styblinsky_Tang, Gradiente, n=3, x=x0)
  savefig(c, "./fig/caminhoGradienteStyblinsky_Tang.png")

  ## Rastrigin
  (p, y) = testarN(Rastrigin, Gradiente, n=500, N=100)
  savefig(p, "./fig/testesGradienteRastrigin.png")
  c = caminho(Rastrigin, Gradiente, n=3, x=x0)
  savefig(c, "./fig/caminhoGradienteRastrigin.png")


# Newton
## quadratica
## Rosenbrock
## Styblinsky_Tang
## Rastrigin


# CP1
## quadratica
## Rosenbrock
## Styblinsky_Tang
## Rastrigin


# DFP
## quadratica
## Rosenbrock
## Styblinsky_Tang
## Rastrigin
