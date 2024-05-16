"""
    PowerGeneralizedWeibull(σ,ν,γ)

The Power Generalised Weibull (PGW) distribution is a three-parameter distribution with support on ${\mathbb R}_+$. The corresponding hazard function can accommodate bathtub, unimodal and monotone (increasing and decreasing) hazard shapes. The PGW distribution has become popular in survival analysis given the tractability of its hazard and survival functions. 

The `PowerGeneralizedWeibull(σ,ν,γ)` distribution, with scale `σ`, shape `ν` (nu) and second shape `γ` has probability density function 

```math
f(t;σ,ν,γ) = \\dfrac{ν}{γ σ^ν}t^{ν-1} \\left[ 1 + \\left(\\dfrac{t}{σ}\\right)^ν\\right]^{\\left(\\frac{1}{γ}-1\\right)} \\exp\\left\\{ 1- \\left[ 1 + \\left(\\dfrac{t}{σ}\\right)^ν\\right]^{\\frac{1}{γ}}
\\right\\}.
```

References: 
* [nikulin:2009](@cite) Nikulin, M. and Haghighi, F. On the power generalized Weibull family: model for cancer censored data. Metron -- International Journal of Statistics, 2009
"""
struct PowerGeneralizedWeibull{T<:Real} <: ContinuousUnivariateDistribution
    sigma::T
    nu::T
    gamma::T
    function PowerGeneralizedWeibull(sigma,nu,gamma)
        T = promote_type(Float64, eltype.((sigma,nu,gamma))...)
        return new{T}(T(sigma), T(nu), T(gamma))
    end
end
PowerGeneralizedWeibull() = PowerGeneralizedWeibull(1,1,1)
params(d::PowerGeneralizedWeibull) = (d.sigma,d.nu,d.gamma)

@distr_support PowerGeneralizedWeibull 0.0 Inf

function rand(rng::AbstractRNG, d::PowerGeneralizedWeibull)
    return d.sigma * ((1 - log(1 - Base.rand(rng))) ^ d.gamma - 1) ^ (1 / d.nu)
end
function logpdf(d::PowerGeneralizedWeibull, t::Real)
    return log(d.nu) - log(d.gamma) - d.nu * log(d.sigma) + (d.nu - 1) * log(t) +
    (1 / d.gamma - 1) * log(1 + (t / d.sigma) ^ d.nu) +
    (1 - (1 + (t / d.sigma) ^ d.nu) ^ (1 / d.gamma))
end
function logccdf(d::PowerGeneralizedWeibull, t::Real)
    return 1 - (1 + (t / d.sigma) ^ d.nu) ^ (1 / d.gamma)
end
ccdf(d::PowerGeneralizedWeibull, t::Real) = exp(logccdf(d,t))
cdf(d::PowerGeneralizedWeibull, t::Real) = 1 - ccdf(d,t)
function quantile(d::PowerGeneralizedWeibull, p::Real)
    return d.sigma * ((1 - log(1 - p)) ^ d.gamma - 1) ^ (1 / d.nu)
end