using Plots

include("../src/WaveletExpansion.jl")

using .WaveletExpansion

σ = 7.0

f(x) = x^2 # function to approximate 

wavelet_family = generate_wavelet_family(σ, 2) # generate wavelets (not orthonormal)

wavelets_orthonormal = gram_schmidt(wavelet_family) # orthonormalize wavelets

approx = compute_approximation_function(f, wavelets_orthonormal) # generate approximation function

println("beggining plot")

display(plot([approx, f], -1, 2)) # plot function(s)

readline()