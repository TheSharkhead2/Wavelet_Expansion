module WaveletExpansion

# define addition on functions and scalar multiplication. idea from: https://www.reddit.com/r/Julia/comments/ibcdo6/sum_of_functions/
import Base.+, Base.*

+(f::Function, g::Function) = (x...) -> f(x...) + g(x...)
*(a::ComplexF64, f::Function) = (x...) -> a*f(x...)

using QuadGK

include("wavelets.jl")

export Hjk, Hjk_noscale, Hjk_v2, get_scalar

include("functions.jl")

export inner_product, norm

include("polynomialApproximation.jl")

export generate_wavelet_family, compute_approximation_function, gram_schmidt

end # module WaveletExpansion
