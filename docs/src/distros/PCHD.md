# Piecewise constant hazard distributions

## Definition

The `PiecewiseConstantHazardDistribution` are distribution defined by the hazard function, which is assumed to be piecewise constant (hence their names). This is common in survival analysis when we extract a life random variable from census data, given e.g. as a `Ratetable` from `RateTables.jl`. 


## Examples

```@example 1
using SurvivalDistributions, Distributions, Random, Plots, StatsBase
Random.seed!(123)
∂t = rand(20)
λ = rand(20)
D = PiecewiseConstantHazardDistribution(∂t,λ)
sim = rand(D,1000);
```

First, let's have a look at the hazard function: 
```@example 1
plot(t -> hazard(D,t), ylabel = "Hazard", xlims = (0,10))
```

As excepted, it is quite random. 

Then, we can verify the coherence of our code by comparing the obtained sample and the true pdf: 
```@example 1
histogram(sim, normalize=:pdf, bins = range(0, 5, length=30))
plot!(t -> pdf(D,t), ylabel = "Density", xlims = (0,5))
```

The comparison is not too bad ! We could also compare the empirical and theroetical cdfs: 
```@example 1
ecdfsim = ecdf(sim)
plot(x -> ecdfsim(x), 0, 5, label = "ECDF", linecolor = "gray", linewidth=3)
plot!(t -> cdf(D,t), xlabel = "x", ylabel = "CDF vs. ECDF", xlims = (0,5))
```