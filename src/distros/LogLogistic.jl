"""
    LogLogistic(μ,σ)

According to [its wikipedia page](https://en.wikipedia.org/wiki/Log-logistic_distribution), the the log-logistic distribution (known as the Fisk distribution in economics) is a continuous probability distribution for a non-negative random variable. It is used in survival analysis as a parametric model for events whose rate increases initially and decreases later, as, for example, mortality rate from cancer following diagnosis or treatment. It has also been used in hydrology to model stream flow and precipitation, in economics as a simple model of the distribution of wealth or income, and in networking to model the transmission times of data considering both the network and the software.

The log-logistic distribution is the probability distribution of a random variable whose logarithm has a logistic distribution. It is similar in shape to the log-normal distribution but has heavier tails. Unlike the log-normal, its cumulative distribution function can be written in closed form.

It is characterized by its density function as 

```math
f(x) = \\frac{(\\frac{β}{α})(\\frac{x}{α})^{β-1} }{(1 + (\\frac{x}{α})^{β})^2},
```

where α = e^μ and β = 1/σ.
"""
struct LogLogistic{T<:Real} <: ContinuousUnivariateDistribution
    X::Logistic{T}
    function LogLogistic(μ,σ)
        X = Logistic(T(μ), T(σ))
        return new{eltype(X)}(X)
    end
end
LogLogistic() = LogLogistic(1,1)
params(d::LogLogistic) = (d.X.μ,d.X.σ)
@distr_support LogLogistic 0.0 Inf
function loghazard(d::LogLogistic, t::Real)
    lt = log(t)
    lpdf0 = logpdf(Logistic(d.X.μ, d.X.σ), lt)
    ls0 = logccdf(Logistic(d.X.μ, d.X.σ), lt)
    return lpdf0 - ls0 - lt
end
function cumhazard(d::LogLogistic,t::Real)
    lt = log.(t)
    return -logccdf.(Logistic(d.X.μ, d.X.σ), lt)
end
logpdf(d::LogLogistic, t::Real) = loghazard(d,t) - cumhazard(d,t)
cdf(d::LogLogistic, t::Real) = -expm1(-cumhazard(d,t))