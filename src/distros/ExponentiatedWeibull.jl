"""
    ExponentiatedWeibull(α,θ,γ)

The [Exponentiated Weibull distribution](https://en.wikipedia.org/wiki/Exponentiated_Weibull_distribution) is obtain by exponentiating the cdf of the [Weibull distribution](https://en.wikipedia.org/wiki/Weibull_distribution). This simple transformation adds a second shape parameter that, interestingly, induces a lot of flexibility on the hazard function. The hazard function of the Exponentiated Weibull distribution can capture the basic shapes: constant, increasing, decreasing, bathtub, and unimodal, making it appealing for survival models.

A random variable X follows an `ExponentiatedWeibull(α,θ,γ)` distribution when it has cumulative distribution function ``F_X = F_W^{γ}`` where ``F_W`` is the cumulative distribution function of a `Weibull(α,θ)`. 

References: 
* [Exponentiated Weibull distribution](https://en.wikipedia.org/wiki/Exponentiated_Weibull_distribution)
* [Weibull distribution](https://en.wikipedia.org/wiki/Weibull_distribution)
"""
const ExponentiatedWeibull{T} = ExpoDist{Weibull{T}}
ExponentiatedWeibull(α,θ,γ) = ExpoDist(γ, Weibull(α,θ))