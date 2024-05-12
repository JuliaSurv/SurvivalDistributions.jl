"""
hazard(X::UnivariateDistribution, t)

Provide the hazard fucntion of the random variable X (supposed to be a `Distributions.ContinuousUnivariateDistributions`) at point t. The default implementation is simply ``vh(t) = \\frac{f(t)}{S(t)}`` where ``f`` and ``S`` are the density and survival function of X. 
"""
hazard(X::UnivariateDistribution, t) = pdf(X,t)/ccdf(X,t)

"""
loghazard(X, t)

Provide the log of the hazard fucntion of the random variable X. See [`hazard`](@ref) for the formal definition. 
"""
loghazard(X::UnivariateDistribution,t) = log(hazard(X,t))

"""
loghazard(X::UnivariateDistribution, t)

Provide the cumulative hazard function of the random variable X. It is defined as ``H(t) = - \\ln S(t)`` where ``S`` is the survival fucntion of the random variable X.  
"""
cumhazard(X::UnivariateDistribution,t) = -log(ccdf(X,t))

"""
censored_loglikelihood(X::UnivariateDistribution, t, δ)

Provide the censored logliklyhood of the distribution X at point t, with status indicatrix δ. Is if defined as 

```math
δ * loghazard(X,t) - cumhazard(X,t)
```
"""
censored_loglikelihood(X::UnivariateDistribution, t, δ) = δ*loghazard(X,t) - cumhazard(X,t)