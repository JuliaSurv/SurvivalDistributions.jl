# Power Generalised Weibull Distribution

## Definition

The Power Generalised Weibull (PGW) distribution [nikulin:2009](@cite) is a three-parameter distribution with support on ${\mathbb R}_+$. The corresponding hazard function can accommodate bathtub, unimodal and monotone (increasing and decreasing) hazard shapes. The PGW distribution has become popular in survival analysis given the tractability of its hazard and survival functions. Other flexible distributions that can account for these hazard shapes are discussed in @rubio:2021 and @jones:2015. 

## Probability Density Function

The pdf of the PGW distribution is

$$f(t;\sigma,\nu,\gamma) = \dfrac{\nu}{\gamma \sigma^\nu}t^{\nu-1} \left[ 1 + \left(\dfrac{t}{\sigma}\right)^\nu\right]^{\left(\frac{1}{\gamma}-1\right)} \exp\left\{ 1- \left[ 1 + \left(\dfrac{t}{\sigma}\right)^\nu\right]^{\frac{1}{\gamma}}
\right\},$$

where $\sigma>0$ is a scale parameter, and $\nu,\gamma >0$ are shape parameters.

## Survival Function

The survival function of the PGW distribution is

$$S(t;\sigma,\nu,\gamma) = \exp\left\{ 1- \left[ 1 + \left(\dfrac{t}{\sigma}\right)^\nu\right]^{\frac{1}{\gamma}}
\right\}.$$

##  Hazard Function

The hazard function of the PGW distribution is

$$h(t;\sigma,\nu,\gamma) = \dfrac{\nu}{\gamma \sigma^\nu}t^{\nu-1} \left[ 1 + \left(\dfrac{t}{\sigma}\right)^\nu\right]^{\left(\frac{1}{\gamma}-1\right)}.$$
The cdf can be obtained as $F(t;\sigma,\nu,\gamma)=1-S(t;\sigma,\nu,\gamma)$, and the cumulative hazard function as $H(t;\sigma,\nu,\gamma) = -\log S(t;\sigma,\nu,\gamma)$, as usual.

## Quantile Function

The quantile function of the PGW distribution is

$$Q(p;\sigma,\nu,\gamma) = \sigma \left[ \left( 1 - \log(1-p) \right)^{\gamma} - 1 \right]^{\frac{1}{\nu}},$$

where $p\in(0,1)$.

## Examples

Let us sample a dataset from a PGW : 

```@example 1
using SurvivalDistributions, Distributions, Random, Plots, StatsBase
Random.seed!(123)
D = PowerGeneralizedWeibull(0.5, 2, 5)
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
Pages = ["PGW.md"]
Canonical = false
```