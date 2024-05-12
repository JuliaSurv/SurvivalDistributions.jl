"""
    GeneralizedGamma(sigma,nu,gamma)

The *GeneralizedGamma distribution* with scale `sigma`, shape `nu` and second shape `gamma` has probability density function 

```math
f(x; parameters) = ...
```

More details and examples of usage could be provided in this docstring.

Maybe this distribution could simply be constructed from a transformation of the original Weibull ? 

References: 
* [Link to my reference so that people understand what it is](https://myref.com) 
"""
struct GeneralizedGamma{T<:Real} <: ContinuousUnivariateDistribution
    sigma::T
    nu::T
    gamma::T
    G::Gamma{T} # underlying Gamma distribution. 
    function GeneralizedGamma(sigma,nu,gamma)
        T = promote_type(Float64, eltype.((sigma,nu,gamma))...)
        return new{T}(T(sigma), T(nu), T(gamma), Gamma(nu / gamma, sigma^gamma))
    end
end
GeneralizedGamma() = GeneralizedGamma(1,1,1)
params(d::GeneralizedGamma) = (d.sigma,d.nu,d.gamma)

@distr_support GeneralizedGamma 0.0 Inf

function rand(rng::AbstractRNG, d::GeneralizedGamma)
    # This looks suspicious. Maybe something waaaay smarter can be done here. 
    return rand(rng, d.G) .^ (1 / d.gamma)
end
function logpdf(d::GeneralizedGamma, t::Real)
    return log(d.gamma) - d.nu * log(d.sigma) - loggamma(d.nu / d.gamma) + (d.nu - 1) * log(t) - (t / d.sigma) ^ d.gamma
end
function logccdf(d::GeneralizedGamma, t::Real)
    return logccdf(d.G, t ^ d.gamma)
end
ccdf(d::GeneralizedGamma, t::Real) = exp(logccdf(d,t))
cdf(d::GeneralizedGamma, t::Real) = 1 - ccdf(d,t)
function quantile(d::GeneralizedGamma, p::Real)
    return quantile(d.G, p) .^ (1 / d.gamma)
end