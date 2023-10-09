using LinearAlgebra
using Calculus

function Newton(α::Int, β::Int, γ::Int, σ::Int, ρ::Int, ε::Int=10^-5, M::Int, x::Vector, f::Function)
  #=
  #
  =#
  k = 0;
  ∇f = Calculus.gradient(x, f)
  if (norm(∇f) >= ε) && (k < M)
    μ = 0; c=0;
    while c == 0
      try
        Hess = hessian(x, f) #calculete hessian
        t = Hess + Matrix(Float64, I(size(Hess)))*μ
        d = -∇f\t
        c = 1
      catch
        μ = maximum((2*μ, ρ))
      end
    end
    
    if norm(d) < β*norm(∇f)
      d = β*(norm(∇f)/norm(d))*d
    end
      t=1;

    while (f(x+t*d) > f(x)+α*t*dot(∇f, d))
      t *= σ
    end

    x += t*d;
    k += 1;
  end


end
