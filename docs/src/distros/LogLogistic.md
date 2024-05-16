# LogLogistic

## Definition

The [LogLogistic](https://en.wikipedia.org/wiki/Log-logistic_distribution) distribution is the probability distribution of a random variable whose logarithm has a logistic distribution. It is similar in shape to the log-normal distribution but has heavier tails.

It is used in survival analysis as a parametric model for events whose rate increases initially and decreases later, as, for example, mortality rate from cancer following diagnosis or treatment. It has also been used in hydrology to model stream flow and precipitation, in economics as a simple model of the distribution of wealth or income, and in networking to model the transmission times of data considering both the network and the software.

## Examples

Let us sample a dataset from an Exponentiated Weibull distribution: 

```@example 1
using SurvivalDistributions, Distributions, Random, Plots, StatsBase
Random.seed!(123)
D = LogLogistic(1,2)
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