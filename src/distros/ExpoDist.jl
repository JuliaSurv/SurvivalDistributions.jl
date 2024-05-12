"""
ExpoDist(γ, X)

    A power distribution with power γ and base distribution X<:ContinuousUnivariateDistribution is defined as the distribution that has cumulative distribution function ``F^γ`` where F was the distribution function of X. 
"""
struct ExpoDist{D} <: ContinuousUnivariateDistribution
    γ::Float64
    X::D
    function ExpoDist(γ, X)
        return new{typeof(X)}(γ,X)
    end
end
params(d::ExpoDist) = (d.γ, d.X)
@distr_support ExpoDist 0.0 Inf

cdf(d::ExpoDist, t::Real) = cdf(d.X,t)^d.γ
logcdf(d::ExpoDist, t::Real) = d.γ * logcdf(d.X, t)
logpdf(d::ExpoDist, t::Real) = log(d.γ) + (d.γ - 1) * logcdf(d.X, t) + logpdf(d.X, t)
quantile(d::ExpoDist, p::Real) = quantile(d.X, p .^ (1 / d.γ))
rand(rng::AbstractRNG, d::ExpoDist) = quantile(d, Base.rand(rng))