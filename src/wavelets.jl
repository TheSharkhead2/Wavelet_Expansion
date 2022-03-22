"""
Function which computes the value of a specific wavelet function (specific A and σ)

"""
function compute_wavelet(t::Float64, A::Float64, σ::Float64)
    A * ( exp(-t^2/2) * ( exp(im * σ * t ) - exp(-σ^2/2 ) ) )
end

"""
Function to get scalar value A to normalize wavelet. IE, finding A in:

`` \\Psi (t) = Ae^{-\\frac{t^2}{2}}\\left( e^{i\\sigma t} - e^{- \\frac{\\sigma^2}{2}} \\right) ``

"""
function get_scalar(σ::Float64)
    f(x) = conj(compute_wavelet(x, 1.0, σ)) * compute_wavelet(x, 1.0, σ)

    integral, err = quadgk(f, 0, 1) # get integral and error (which we will ignore because who cares about being accurate in math anyways)

    1.0 / real(integral) # need to scale such that this is 1, so return appropriate scalar (this should always be real as integral is between real values due to taking complex conjugate)

end # function get_scalar

"""
Compute Hⱼₖ which is a modified wavelet where we have: 

Hⱼₖ = 2ʲ/² ⋅ Ψ(x2ʲ - k)

"""
function Hjk(x::Float64, j::Float64, k::Float64, A::Float64, σ::Float64)
    2^(j/2) * compute_wavelet(x*2^j - k, A, σ) # compute value 
end # function Hjk
