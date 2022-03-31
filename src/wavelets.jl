"""
Function which computes the value of a specific wavelet function (specific A and σ)

"""
function compute_wavelet(t::Float64, A::Float64, σ::Float64)
    A * ( exp(-(t^2)/2) * ( exp(im * σ * t ) - exp(-(σ^2)/2 ) ) )
end

"""
Function to get scalar value A to normalize wavelet. IE, finding A in:

`` \\Psi (t) = Ae^{-\\frac{t^2}{2}}\\left( e^{i\\sigma t} - e^{- \\frac{\\sigma^2}{2}} \\right) ``

"""
function get_scalar(σ::Float64)
    f(x) = (compute_wavelet(x, 1.0, σ)) * conj(compute_wavelet(x, 1.0, σ))

    integral, err = quadgk(f, 0, 1) # get integral and error (which we will ignore because who cares about being accurate in math anyways)

    1.0 / sqrt(real(integral)) # need to scale such that this is 1, so return appropriate scalar (this should always be real as integral is between real values due to taking complex conjugate)

end # function get_scalar

"""
Returns function Hⱼₖ which is a modified wavelet where we have: 

Hⱼₖ = Ψ(x2ʲ - k)

"""
function Hjk(j::Int, k::Int, σ::Float64)
    A = get_scalar(σ) # get scalar value of wavelet

    x -> compute_wavelet(x*(2.0^j) - k, A, σ) # return wavelet function
end # function Hjk

"""
Returns Hⱼₖ without constant 

"""
function Hjk_noscale(j::Int, k::Int, σ::Float64)
    A = get_scalar(σ) # get scalar value of wavelet

    x -> ( compute_wavelet((x*(2.0^j) - k), A, σ)) # return wavelet function
    # instead of j/2 could be -j instead -- probably doesn't work because integral from 0 to 1 so k shift affects it
end # function Hjk_noscale

function Hjk_v2(j::Int, k::Int, σ::Float64, A::Float64)
    # generate function w/o subsitution into other functions (without constant as well)
    x -> 2.0^(j/2) * A * ( exp(-((x*2.0^j - k )^2)/2) * (exp(im*σ*(x*2.0^j - k)) - exp(-(σ^2)/2)) )
end # function Hjk_v2