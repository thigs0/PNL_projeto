include("functions.jl")
include("metodos.jl")
using TickTock
using Plots

# Gradiente
## quadratica
(p, y) = testarN(quadratica, Gradiente, n=500, N= 100)
savefig(p, "testesGradienteQuadratica")
c = caminho(quadratica, Gradiente, n=3, x=[172.0, -61])
savefig(c, "caminhoGradienteQuadratica")

## Rosenbrock
## Styblinsky_Tang
## Rastrigin


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