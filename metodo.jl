using LinearAlgebra
using Calculus

#=
α=1e-4
β=1e-3
γ=1e-6
σ=0.5
ρ=1e-3
H0=I
ε=1e-5
M=100
=#

function Gradiente(x::Vector{Float64}, f::Function, α::Float64=1e-4, σ::Float64=0.5, ε::Float64=1e-5, M::Int=100)
  #=
  #
  =#
  #(####conferir valores de entrada e retornar erros se precisar)
  k = 0;
  ∇f = Calculus.gradient(f, x)
  fx = f(x)
  while (norm(∇f) >= ε) && (k < M)
    d = -∇f
    t = 1
    aux = α*∇f'*d
    while f(x + t*d) > (fx + aux*t)
      t = σ*t
    end

    x = x + t*d
    ∇f = Calculus.gradient(f, x)
    fx = f(x)
    k += 1
  end

  return x
end


function Newton(x::Vector{Float64}, f::Function, α::Float64=1e-4, β::Float64=1e-3, γ::Float64=1e-6, σ::Float64=0.5, ρ::Float64=1e-3, ε::Float64=1e-5, M::Int=100)
  #=
  #
  =#
  #(####conferir valores de entrada e retornar erros se precisar)
  k = 0;
  ∇f = Calculus.gradient(f, x)
  fx = f(x)
  η = norm(∇f)
  while (η >= ε) && (k < M)
    μ = 0; c = 0;
    while c == 0
      try
        Hess = hessian(f, x) #calculete hessian
        t = Hess + I*μ
        d = t\-∇f
        if (∇f'*d > -γ*η*norm(d))
          error
        end
        c = 1
      catch
        μ = maximum((2*μ, ρ))
      end
    end

    if norm(d) < β*η
      d = β*(η/norm(d))*d
    end
    
    t = 1;
    aux = α*∇f'*d
    while f(x + t*d) > (fx + aux*t)
      t = σ*t
    end

    x = x + t*d
    ∇f = Calculus.gradient(f, x)
    fx = f(x)
    η = norm(∇f)
    k += 1
  end

  return x
end


function CP1(x::Vector, f::Function, H::Matrix{Float64}=Matrix(1.0I, length(x), length(x)), α::Float64=1e-4, β::Float64=1e-3, γ::Float64=1e-6, σ::Float64=0.5, ε::Float64=1e-5, M::Int=100)
  #=
  #
  =#
  #(####conferir valores de entrada e retornar erros se precisar)
  k = 0;
  ∇f = Calculus.gradient(f, x)
  fx = f(x)
  η = norm(∇f)
  while (η >= ε) && (k < M)
    d = -H*∇f

    if (∇f'*d > -γ*η*norm(d))
      d = -∇f
      H = I
    end

    if norm(d) < β*η
      d = β*(η/norm(d))*d
    end

    t = 1;
    aux = α*∇f'*d
    while f(x + t*d) > (fx + aux*t)
      t = σ*t
    end

    x_ant = x
    ∇f_ant = ∇f
    x = x + t*d
    ∇f = Calculus.gradient(f, x)
    fx = f(x)
    η = norm(∇f)

    s = x + x_ant
    y = ∇f - ∇f_ant
    z = H*y
    w = s - z

    if (w'*y > 0)
      H = H + (w*w')/(w'*y)
    end

    k += 1
  end

  return x
end

function DFP(x::Vector, f::Function, H::Matrix{Float64}=Matrix(1.0I, length(x), length(x)), α::Float64=1e-4, β::Float64=1e-3, γ::Float64=1e-6, σ::Float64=0.5, ε::Float64=1e-5, M::Int=100)
  #=
  #
  =#
  #(####conferir valores de entrada e retornar erros se precisar)
  k = 0;
  ∇f = Calculus.gradient(f, x)
  fx = f(x)
  η = norm(∇f)
  while (η >= ε) && (k < M)
    d = -H*∇f

    if (∇f'*d > -γ*η*norm(d))
      d = -∇f
      H = I
    end

    if norm(d) < β*η
      d = β*(η/norm(d))*d
    end

    t = 1;
    aux = α*∇f'*d
    while f(x + t*d) > (fx + aux*t)
      t = σ*t
    end

    x_ant = x
    ∇f_ant = ∇f
    x = x + t*d
    ∇f = Calculus.gradient(f, x)
    fx = f(x)
    η = norm(∇f)

    s = x + x_ant
    y = ∇f - ∇f_ant
    z = H*y

    if (s'*y > 0)
      H = H + (s*s')/(s'*y) - (z*z')/(z'*y)
    end

    k += 1
  end

  return x
end
