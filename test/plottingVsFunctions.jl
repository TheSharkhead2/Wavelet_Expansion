using Plots

include("../src/WaveletExpansion.jl")

using .WaveletExpansion

σ = 7.0

f(x) = x^2 # function to approximate 

approx = generate_approximation(f, σ, 5) # generate wavelets

# println(approx(0.5))

display(plot([approx, f], 0, 1) )# plot function(s)

println("plotted")

readline()