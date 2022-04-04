include("../src/WaveletExpansion.jl")

using .WaveletExpansion

using Plots

σ = 2.0

# for j ∈ -2:2
#     for k ∈ -2:2
#         wavelet = Hjk(j, k, σ) # construct wavelet function

#         println(inner_product(wavelet, wavelet)) # find norm 
#     end # for
# end # for

# testWavelet = Hjk_noscale(2, 0, σ)
# test2Wavelet = Hjk_noscale(1, 0, σ)

# println(inner_product(testWavelet, test2Wavelet))
# println(inner_product(test2Wavelet, testWavelet))

# ⟨ ⟩

A = get_scalar(σ)

testWavelet = Hjk_v2(0, 0, σ, A)
test2Wavelet = Hjk_v2(1, 0, σ, A)
test3Wavelet = Hjk_v2(2, 0, σ, A)
test4Wavelet = Hjk_v2(0, 1, σ, A)
test5Wavelet = Hjk_v2(0, 2, σ, A)
test6Wavelet = Hjk_v2(1, 1, σ, A)

println(testWavelet)
println(inner_product(testWavelet, testWavelet))
println(inner_product(test2Wavelet, test2Wavelet))
println(inner_product(test3Wavelet, test3Wavelet))
println(inner_product(test4Wavelet, test4Wavelet))
println("Not with self: ")
println(inner_product(testWavelet, test2Wavelet))
println(inner_product(testWavelet, test3Wavelet))
println(inner_product(testWavelet, test4Wavelet))

display(plot([x -> real(testWavelet(x)), x -> real(test2Wavelet(x)), x -> real(test3Wavelet(x)), x -> real(test4Wavelet(x)), x -> real(test5Wavelet(x)), x -> real(test6Wavelet(x))], 0, 1))

readline()