# Generalised Gamma Distribution

## Definition

The [Generalised Gamma](https://en.wikipedia.org/wiki/Generalized_gamma_distribution) (GG) distribution [stacy:1962](@cite) is a three-parameter distribution with support on ${\mathbb R}_+$. The corresponding hazard function can accommodate bathtub, unimodal and monotone (increasing and decreasing) hazard shapes. The GG distribution has become popular in survival analysis due to its flexibility. Other flexible distributions that can account for these hazard shapes are discussed in @rubio:2021 and @jones:2015. 

## Probability Density Function

The pdf of the GG distribution is

$$f(t;\theta,\kappa,\delta) = \dfrac{\delta}{\Gamma\left(\frac{\kappa}{\delta}\right)\theta^\kappa}  t^{{\kappa-1}}e^{{-\left(\frac{t}{\theta}\right)^{\delta}}},$$
where $\theta>0$ is a scale parameter, and $\kappa,\delta >0$ are shape parameters.

## Cumulative Distribution Function

The CDF of the GG distribution is

$$F(t;\theta,\kappa,\delta) = {\frac  {\gamma \left( \frac{\kappa}{\delta},\left(\frac{t}{\theta}\right)^{\delta}\right)}{\Gamma\left(\frac{\kappa}{\delta}\right)}},$$

where where $\gamma (\cdot )$ denotes the lower incomplete gamma function. The survival function can be obtained using the relationship $S(t;\theta,\kappa,\delta)=1-F(t;\theta,\kappa,\delta)$. An interesting relationship between the [Gamma CDF](https://en.wikipedia.org/wiki/Gamma_distribution) ($G(t;\theta,\kappa)$, scale $\theta$ and shape $\kappa$) and the GG CDF is

$$F(t;\theta,\kappa,\delta) = G\left(t^\delta; \theta^\delta, \frac{\kappa}{\delta}\right).$$
This allows the implementation of the GG CDF using the Julia command `Gamma`.

###  Hazard Function

The hazard function of the GG distribution is

$$h(t;\theta,\kappa,\delta) = \dfrac{f(t;\theta,\kappa,\delta)}{1-F(t;\theta,\kappa,\delta)}.$$

The survival function can be obtained as $S(t;\theta,\kappa,\delta)=1-F(t;\theta,\kappa,\delta)$, and the cumulative hazard function as $H(t;\theta,\kappa,\delta) = -\log S(t;\theta,\kappa,\delta)$, as usual. The connection of the GG CDF with the Gamma distribution allows for writing these functions in terms of the Julia command `Gamma` as shown in the following code.

## Examples

Let us sample a dataset from a Generalized gamma:  : 

```@example 1
using SurvivalDistributions, Distributions, Random, Plots, StatsBase
Random.seed!(123)
D = GeneralizedGamma(0.5, 1.5, 0.75)
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


```@bibliography
Pages = ["GenGamma.md"]
Canonical = false
```