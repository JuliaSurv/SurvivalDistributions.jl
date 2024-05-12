"""
    ExponentiatedWeibull(sigma,nu,gamma)

The *ExponentiatedWeibull distribution* with scale `sigma`, shape `nu` and second shape `gamma` has probability density function 

```math
f(x; parameters) = ...
```

More details and examples of usage could be provided in this docstring.

Maybe this distribution could simply be constructed from a transformation of the original Weibull ? 

References: 
* [Link to my reference so that people understand what it is](https://myref.com) 
"""
const ExponentiatedWeibull{T} = ExpoDist{Weibull{T}}
ExponentiatedWeibull(sigma,nu,gamma) = ExpoDist(gamma, Weibull(nu,sigma))