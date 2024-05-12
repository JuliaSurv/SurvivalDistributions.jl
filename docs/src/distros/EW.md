# Exponentiated Weibull Distribution

## Definition

The [Exponentiated Weibull distribution](https://en.wikipedia.org/wiki/Exponentiated_Weibull_distribution) is obtain by exponentiating the cdf of the [Weibull distribution](https://en.wikipedia.org/wiki/Weibull_distribution). This simple transformation adds a second shape parameter that, interestingly, induces a lot of flexibility on the hazard function. The hazard function of the Exponentiated Weibull distribution can capture the basic shapes: constant, increasing, decreasing, bathtub, and unimodal, making it appealing for survival models.

The probability density function and cumulative distribution function of the Exponentiated Weibull distribution are respectively given by:

$$\begin{split}
f(t) &=  \alpha \dfrac{\kappa}{\lambda} \left(\dfrac{t}{\lambda}\right)^{\kappa-1} \left[1-\exp\left\{-\left(\dfrac{t}{\lambda}\right)^{\kappa}\right\}\right]^{\alpha-1} \exp\left\{-\left(\dfrac{t}{\lambda}\right)^{\kappa}\right\}, \\
F(t) &= \left[1-\exp\left\{-\left(\dfrac{t}{\lambda}\right)^{\kappa}\right\}\right]^{\alpha},
\end{split}$$

where $t>0$, $\alpha>0$, $\lambda>0$, and $\kappa>0$. The parameter $\lambda$ is a scale parameter, $\kappa$ is a shape parameter, and $\alpha$ is the power (shape) parameter. 


## Examples

Let us sample a dataset from an Exponentiated Weibull distribution: 

```@example 1
using SurvivalDistributions, Distributions, Random, Plots, StatsBase
Random.seed!(123)
D = ExponentiatedWeibull(0.25, 0.5, 5)
sim = rand(D,1000);
```

First, let's have a look at the hazard function: 
```@example 1
plot(t -> hazard(D,t), ylabel = "Hazard", xlims = (0,10))
```

Then, we can verify the coherence of our code by comparing the obtained sample and the true pdf: 
```@example 1
histogram(sim, normalize=:pdf, bins = range(0, 5, length=30))
plot!(t -> pdf(D,t), ylabel = "Density", xlims = (0,5))
```

We could also compare the empirical and theroetical cdfs: 
```@example 1
ecdfsim = ecdf(sim)
plot(x -> ecdfsim(x), 0, 5, label = "ECDF", linecolor = "gray", linewidth=3)
plot!(t -> cdf(D,t), xlabel = "x", ylabel = "CDF vs. ECDF", xlims = (0,5))
```