```@meta
CurrentModule = SurvivalDistributions
```

# SurvivalDistributions

The [`SurvivalDistributions.jl`](https://github.com/JuliaSurv/SurvivalDistributions.jl) package is part of the JuliaSurv organisation. It provides a few utility functions (related to hazard and censoring) to manipulate distributions from [`Distributions.jl`](https://github.com/JuliaStats/Distributions.jl), but most importantly a few Distributions familieis that are sometimes usefull when doing survival analysis. 

The implementation is very light and does limit its dependencies to a minimum (namely, `Distributions.jl`), so that depending on `SurvivalDistributions.jl` should not incur extra startup time. 

Do not hesitate to open an issue if you want to add another distribution that you might find usefull for survival analysis, or if you want to discuss about the content of the package itself ! 

