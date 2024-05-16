# Piecewise constant hazard distributions

## Definition

The `PiecewiseConstantHazardDistribution` are distribution defined by the hazard function, which is assumed to be piecewise constant (hence their names). This is common in survival analysis when we extract a life random variable from census data, given e.g. as a `Ratetable` from `RateTables.jl`. 