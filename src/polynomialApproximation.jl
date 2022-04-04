"""
Generates (2n)² wavelet functions in specific family of σ

"""
function generate_wavelet_family(σ::Float64, n::Int)
    wavelets = Vector{Function}() # empty vector to store wavelets

    A = 1.0 # scalar is broken so just set to 1

    for j ∈ -1:n
        for k ∈ -1:n
            push!(wavelets, Hjk_v2(j, k, σ, A)) # add wavelet to vector
        end # for 
    end # for 

    wavelets # return wavelets

end # function generate_approximation

"""
Function to return function to compute result of sum of wavelets

"""
function compute_approximation_function(f::Function, orthonormal_wavelets::Vector{Function})
    coefficients = Vector{ComplexF64}() # empty vector to store coefficients
    
    for wavelet in orthonormal_wavelets # loop through all wavelets 
        push!(coefficients, inner_product(f, wavelet)) # add coefficient to vector
    end # for

    approx = x -> 0

    # get sum of all coefficients times wavelet bases
    for (coefficient, wavelet) ∈ zip(coefficients, orthonormal_wavelets)
        approx += coefficient * wavelet
    end # for

    real ∘ approx # real composed with approx to return only real values
end # function compute_approximation

"""
Applies Gram-Schmidt Procedure to generate orthonormal basis of wavelets. 
(technically they were already supposed to be, but for some reason that doesn't appear to be the case)

"""
function gram_schmidt(wavelets::Vector{Function})
    orthonormal_wavelets = Vector{Function}() # empty vector to store orthonormal wavelets

    for (i, wavelet) ∈ enumerate(wavelets) # loop through all wavelets 
        if i == 1 # for the first wavelet 
            e1 = (1/norm(wavelet)) * wavelet # normalize wavelet
            push!(orthonormal_wavelets, e1) # push to vector 
        else # for all other wavelets
            coefficients = Vector{ComplexF64}() # empty vector to store coefficients for all previous orthonormal wavelets 

            for e_i ∈ orthonormal_wavelets # loop through all previous orthonormal wavelets 
                push!(coefficients, -1 * inner_product(wavelet, e_i)) # add coefficient to vector 
                print("coefficient computed ")
            end # for

            print("\ncoefficients done ")

            e_i = wavelet 
            for (coefficient, e_j) ∈ zip(coefficients, orthonormal_wavelets) # loop through all previous orthonormal wavelets 
                e_i += coefficient * e_j
            end # for
 
            print("created e_i ")

            e_iNorm = (1\norm(e_i)) * e_i # normalize

            print("normalized e_i ")

            push!(orthonormal_wavelets, e_iNorm) # push to vector
        end # if
        println("\nmade orthonormal wavelet\n")
    end # for

    orthonormal_wavelets # return orthonormal wavelets
end # function gram_schmidt