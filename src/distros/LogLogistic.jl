"""
    LogLogistic(mu,sigma)

To be described... 


```math
f(x; parameters) = ...
```

"""
struct LogLogistic{T<:Real} <: ContinuousUnivariateDistribution
    mu::T
    sigma::T
    function LogLogistic(mu,sigma)
        T = promote_type(Float64, eltype.((mu,sigma))...)
        return new{T}(T(mu), T(sigma))
    end
end
LogLogistic() = LogLogistic(1,1)
params(d::LogLogistic) = (d.mu,d.sigma)
@distr_support LogLogistic 0.0 Inf
function loghazard(d::LogLogistic, t::Real)
    lt = log.(t)
    lpdf0 = logpdf.(Logistic(d.mu, d.sigma), lt) .- lt
    ls0 = logccdf.(Logistic(d.mu, d.sigma), lt)
    return lpdf0 .- ls0
end
function cumhazard(d::LogLogistic,t::Real)
    lt = log.(t)
    return -logccdf.(Logistic(d.mu, d.sigma), lt)
end
logpdf(d::LogLogistic, t::Real) = loghazard(d,t) - cumhazard(d,t)
cdf(d::LogLogistic, t::Real) = -expm1(-cumhazard(d,t))