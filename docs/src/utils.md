```@meta
CurrentModule = SurvivalDistributions
```

# Utility functions

Since survival analysis regularly defines things in term of hazard of (positive) random variables, we defined the following functions here purely for convenience:

## Hazard function 

```@docs
hazard
```

## Log Hazard Function 

```@docs
loghazard
```

## Cumulative Hazard Function 

```@docs
cumhazard
```

## Censored Loglikelyhood. 

```@docs
censored_loglikelihood
```


## Examples of hazard and cumulative hazard functions 

The hazard and the cumulative hazard functions play a crucial role in survival analysis. These functions define the likelihood function in the presence of censored observations. Thus, they are important in many context.

### LogNormal

```@example 1
using SurvivalDistributions, Distributions, Plots, StatsBase
function mkplot(d)
    h = plot(t -> hazard(d, t), xlims = (0,10),  ylabel = "Hazard")
    H = plot(t -> cumhazard(d,t), xlims = (0,10), ylabel = "Cumulative Hazard",)
    return plot(h,H,plot_title = "$d")
end
mkplot(LogNormal(0.5, 1))
```

### LogLogistic

```@example 1
mkplot(LogLogistic(1, 0.5))
```

### Weibull

```@example 1
mkplot(Weibull(3, 0.5))
```


### Gamma

```@example 1
mkplot(Gamma(3, 0.5))
```