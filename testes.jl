include("./functions.jl")
include("./metodos.jl")

using TickTock
using Plots
using Random

Random.seed!(3)

#Gradiente
  ## quadratica
  epson = Vector([1e-1; 1e-1])

  x0 = [0, 0] + 10*epson
  (p, y) = testarN(quadratica, Gradiente, n=1000, N=100)
  savefig(p, "./fig/testesNGradienteQuadratica.png")
  (p,y) = testarε(quadratica, Gradiente,1000, 100)
  savefig(p, "./fig/testesεGradienteQuadratica.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(quadratica, Gradiente, M, 100)
  savefig(p, "./fig/testar_graphGradienteQuadratica.png")
  c = caminho(quadratica, Gradiente, n=3, x=x0)
  savefig(c, "./fig/caminhoGradienteQuadratica.png")

  ## Rosenbrock
  epson = Vector([1e-5; 1e-5])
  x0 = [1, 1] + epson
  (p, y) = testarN(Rosenbrock, Gradiente, n=500, N=100)
  savefig(p, "./fig/testesNGradienteRosenbrock.png")
  (p,y) = testarε(Rosenbrock, Gradiente,500, 100)
  savefig(p, "./fig/testesεGradienteRosenbrock.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(Rosenbrock, Gradiente, M, 100)
  savefig(p, "./fig/testar_graphGradienteRosenbrock.png")
  c = caminho(Rosenbrock, Gradiente, n=30, x=x0)
  savefig(c, "./fig/caminhoGradienteRosenbrock.png")

  ## Styblinsky_Tang
  epson = Vector([1e-1; 1e-1])
  x0 = [-2.9035, -2.9035] + epson
  (p, y) = testarN(Styblinsky_Tang, Gradiente, n=500, N=100)
  savefig(p, "./fig/testesNGradienteStyblinsky_tang.png")
  (p,y) = testarε(Styblinsky_Tang, Gradiente,500, 100)
  savefig(p, "./fig/testesεGradienteStyblinsky_tang.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(Styblinsky_Tang, Gradiente, M, 100)
  savefig(p, "./fig/testar_graphGradienteStyblinsky_Tang.png")
  c = caminho(Styblinsky_Tang, Gradiente, n=3, x=x0)
  savefig(c, "./fig/caminhoGradienteStyblinsky_Tang.png")

  ## Rastrigin

  x0 = [0, 0] + epson
  (p, y) = testarN(Rastrigin, Gradiente, n=500, N=100)
  savefig(p, "./fig/testesNGradienteRastrigin.png")
  (p,y) = testarε(Rastrigin, Gradiente,500, 100)
  savefig(p, "./fig/testesεGradienteRastrigin.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(Rosenbrock, Gradiente, M, 100)
  savefig(p, "./fig/testar_graphGradienteRastrigin.png")
  c = caminho(Rastrigin, Gradiente, n=3, x=x0)
  savefig(c, "./fig/caminhoGradienteRastrigin.png")

#Newton
## quadratica
  epson = Vector([1e-1; 1e-1])

  x0 = [0, 0] + 10*epson
  (p, y) = testarN(quadratica, Newton, n=5000, N=100)
  savefig(p, "./fig/testesNNewtonQuadratica.png")
  (p,y) = testarε(quadratica, Newton,5000, 100)
  savefig(p, "./fig/testesεNewtonQuadratica.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(quadratica, Newton, M, 100)
  savefig(p, "./fig/testar_graphNewtonQuadratica.png")
  c = caminho(quadratica, Newton, n=3, x=x0)
  savefig(c, "./fig/caminhoNewtonQuadratica.png")

  ## Rosenbrock
  epson = Vector([1e-5; 1e-5])
  x0 = [1, 1] + epson
  (p, y) = testarN(Rosenbrock, Newton, n=500, N=100)
  savefig(p, "./fig/testesNNewtonRosenbrock.png")
  (p,y) = testarε(Rosenbrock, Newton,500, 100)
  savefig(p, "./fig/testesεNewtonRosenbrock.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(Rosenbrock, Newton, M, 100)
  savefig(p, "./fig/testar_graphNewtonRosenbrock.png")
  c = caminho(Rosenbrock, Newton, n=30, x=x0)
  savefig(c, "./fig/caminhoNewtonRosenbrock.png")

  ## Styblinsky_Tang
  epson = Vector([1e-1; 1e-1])
  x0 = [-2.9035, -2.9035] + epson
  (p, y) = testarN(Styblinsky_Tang, Newton, n=500, N=100)
  savefig(p, "./fig/testesNNewtonStyblinsky_tang.png")
  (p,y) = testarε(Styblinsky_Tang, Newton,500, 100)
  savefig(p, "./fig/testesεNewtonStyblinsky_tang.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(Styblinsky_Tang, Newton, M, 100)
  savefig(p, "./fig/testar_graphNewtonStyblinsky_Tang.png")
  c = caminho(Styblinsky_Tang, Newton, n=3, x=x0)
  savefig(c, "./fig/caminhoNewtonStyblinsky_Tang.png")

  ## Rastrigin

  x0 = [0, 0] + epson
  (p, y) = testarN(Rastrigin, Newton, n=500, N=100)
  savefig(p, "./fig/testesNNewtonRastrigin.png")
  (p,y) = testarε(Rastrigin, Newton,500, 100)
  savefig(p, "./fig/testesεNewtonRastrigin.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(Rosenbrock, Newton, M, 100)
  savefig(p, "./fig/testar_graphNewtonRastrigin.png")
  c = caminho(Rastrigin, Newton, n=3, x=x0)
  savefig(c, "./fig/caminhoNewtonRastrigin.png")


#CP1
  ## quadratica
  epson = Vector([1e-1; 1e-1])

  x0 = [0, 0] + 10*epson
  (p, y) = testarN(quadratica,CP1, n=5000, N=100)
  savefig(p, "./fig/testesNCP1Quadratica.png")
  (p,y) = testarε(quadratica, CP1,5000, 100)
  savefig(p, "./fig/testesεCP1Quadratica.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(quadratica, CP1, M, 100)
  savefig(p, "./fig/testar_graphCP1Quadratica.png")
  c = caminho(quadratica, CP1, n=3, x=x0)
  savefig(c, "./fig/caminhoCP1Quadratica.png")

  ## Rosenbrock
  epson = Vector([1e-5; 1e-5])
  x0 = [1, 1] + epson
  (p, y) = testarN(Rosenbrock, CP1, n=500, N=100)
  savefig(p, "./fig/testesNCP1Rosenbrock.png")
  (p,y) = testarε(Rosenbrock, CP1,500, 100)
  savefig(p, "./fig/testesεCP1Rosenbrock.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(Rosenbrock, CP1, M, 100)
  savefig(p, "./fig/testar_graphCP1Rosenbrock.png")
  c = caminho(Rosenbrock, CP1, n=30, x=x0)
  savefig(c, "./fig/caminhoCP1Rosenbrock.png")

  ## Styblinsky_Tang
  epson = Vector([1e-1; 1e-1])
  x0 = [-2.9035, -2.9035] + epson
  (p, y) = testarN(Styblinsky_Tang, CP1, n=500, N=100)
  savefig(p, "./fig/testesNCP1Styblinsky_tang.png")
  (p,y) = testarε(Styblinsky_Tang, CP1,500, 100)
  savefig(p, "./fig/testesεCP1Styblinsky_tang.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(Styblinsky_Tang, CP1, M, 100)
  savefig(p, "./fig/testar_graphCP1Styblinsky_Tang.png")
  c = caminho(Styblinsky_Tang, CP1, n=3, x=x0)
  savefig(c, "./fig/caminhoCP1Styblinsky_Tang.png")

  ## Rastrigin

  x0 = [0, 0] + epson
  (p, y) = testarN(Rastrigin, CP1, n=500, N=100)
  savefig(p, "./fig/testesNCP1Rastrigin.png")
  (p,y) = testarε(Rastrigin, CP1,500, 100)
  savefig(p, "./fig/testesεCP1Rastrigin.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(Rosenbrock, CP1, M, 100)
  savefig(p, "./fig/testar_graphCP1Rastrigin.png")
  c = caminho(Rastrigin, CP1, n=3, x=x0)
  savefig(c, "./fig/caminhoCP1Rastrigin.png")


#DFP
 ## quadratica
  epson = Vector([1e-1; 1e-1])

  x0 = [-2.903534, -2.903534] + 10*epson
  (p, y) = testarN(quadratica,DFP, n=5000, N=100)
  savefig(p, "./fig/testesNDFPQuadratica.png")
  (p,y) = testarε(quadratica, DFP,5000, 100)
  savefig(p, "./fig/testesεDFPQuadratica.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(quadratica, DFP, M, 100)
  savefig(p, "./fig/testar_graphDFPQuadratica.png")
  c = caminho(quadratica, DFP, n=3, x=x0)
  savefig(c, "./fig/caminhoDFPQuadratica.png")

  ## Rosenbrock
  epson = Vector([1e-5; 1e-5])
  x0 = [1, 1] + epson
  (p, y) = testarN(Rosenbrock, DFP, n=500, N=100)
  savefig(p, "./fig/testesNDFPRosenbrock.png")
  (p,y) = testarε(Rosenbrock, DFP,500, 100)
  savefig(p, "./fig/testesεDFPRosenbrock.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(Rosenbrock, DFP, M, 100)
  savefig(p, "./fig/testar_graphDFPRosenbrock.png")
  c = caminho(Rosenbrock, DFP, n=30, x=x0)
  savefig(c, "./fig/caminhoDFPRosenbrock.png")

  ## Styblinsky_Tang
  epson = Vector([1e-1; 1e-1])
  x0 = [-2.9035, -2.9035] + epson
  (p, y) = testarN(Styblinsky_Tang, DFP, n=500, N=100)
  savefig(p, "./fig/testesNDFPStyblinsky_tang.png")
  (p,y) = testarε(Styblinsky_Tang, DFP,500, 100)
  savefig(p, "./fig/testesεDFPStyblinsky_tang.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(Styblinsky_Tang, DFP, M, 100)
  savefig(p, "./fig/testar_graphDFPStyblinsky_Tang.png")
  c = caminho(Styblinsky_Tang, DFP, n=3, x=x0)
  savefig(c, "./fig/caminhoDFPStyblinsky_Tang.png")

  ## Rastrigin

  x0 = [0, 0] + epson
  (p, y) = testarN(Rastrigin, DFP, n=500, N=100)
  savefig(p, "./fig/testesNDFPRastrigin.png")
  (p,y) = testarε(Rastrigin, DFP,500, 100)
  savefig(p, "./fig/testesεDFPRastrigin.png")
  M = [(i+j) for i =1:10 for j=1:10]
  (p,y) = testar_graph(Rosenbrock, DFP, M, 100)
  savefig(p, "./fig/testar_graphDFPRastrigin.png")
  c = caminho(Rastrigin, DFP, n=3, x=x0)
  savefig(c, "./fig/caminhoDFPRastrigin.png")


