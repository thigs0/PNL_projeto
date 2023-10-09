using LinearAlgebra

function Newton(α::Int, β::Int, γ::Int, σ::Int, ρ::Int, ε::Int=10^-5, M::Int, x::Vector, f::Function)
  #=
  #
  =#
  k = 0;
  ∇f = grad(x)
  if (norm(∇f) >= ε) && (k < M)
    μ = 0;
    try
      Hess = 1 #calculete hessian
      t = Hess+Matrix(Float64, I(size(Hess)))
    catch
      print("Error")
    end
  end


end
