"""
    GeneralizedGamma(σ,nu,gamma)

The [Generalised Gamma](https://en.wikipedia.org/wiki/Generalized_gamma_distribution) (GG) distribution is a three-parameter distribution with support on ${\mathbb R}_+$. The corresponding hazard function can accommodate bathtub, unimodal and monotone (increasing and decreasing) hazard shapes. The GG distribution has become popular in survival analysis due to its flexibility. 

References: 
* [Generalised Gamma](https://en.wikipedia.org/wiki/Generalized_gamma_distribution)
* [stacy:1962](@cite) Stacy, E.W. A generalization of the gamma distribution, *The Annals of Mathematical Statistics*, 1962
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