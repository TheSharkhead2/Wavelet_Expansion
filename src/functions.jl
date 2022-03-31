"""
Function to get inner product between two wavelets.

"""
function inner_product(g::Function, h::Function)
    f(x) = (g(x)) * conj(h(x)) # compose function to compute dot product defined as ∫₀¹ conj(g(x)) h(x) dx

    integral, err = quadgk(f, 0.0, 1.0) # get integral and error (which we will ignore because who cares about being accurate in math anyways)

    integral
end # function inner_product

"""
Computes the norm from the inner product

"""
function norm(f::Function) 
    sqrt(inner_product(f, f)) # compute norm as √⟨f, f⟩ 
end # function norm