abstract type AbstractHazardDistribution <: ContinuousUnivariateDistribution end
@distr_support AbstractHazardDistribution 0.0 Inf
loghazard(X::AbstractHazardDistribution, t::Real) = log(hazard(X,t))
cumhazard(X::AbstractHazardDistribution, t::Real) = quadgk(u -> hazard(X,u), 0, t)[1]
logccdf(  X::AbstractHazardDistribution, t::Real) = -cumhazard(X,t)
ccdf(     X::AbstractHazardDistribution, t::Real) = exp(-cumhazard(X,t))
cdf(      X::AbstractHazardDistribution, t::Real) = -expm1(-cumhazard(X,t))
logcdf(   X::AbstractHazardDistribution, t::Real) = log1mexp(-cumhazard(X,t))
pdf(      X::AbstractHazardDistribution, t::Real) = hazard(X,t)*ccdf(X,t)
logpdf(   X::AbstractHazardDistribution, t::Real) = loghazard(X,t) - cumhazard(X,t)
function quantile( X::AbstractHazardDistribution, t::Real) 
    u = log(1-t)
    return find_zero(x -> u + cumhazard(X,x), (0.0, Inf))
end


