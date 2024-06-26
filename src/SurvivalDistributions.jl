module SurvivalDistributions

    # Import everything we need from Distributions.jl:

    using SpecialFunctions: loggamma

    using Distributions: logcdf, logccdf, ccdf, cdf, pdf, logpdf, quantile, rand, ContinuousUnivariateDistribution, UnivariateDistribution, @distr_support, AbstractRNG, Weibull, Gamma, Logistic, expectation
    import Distributions: logcdf, logccdf, ccdf, cdf, pdf, logpdf, quantile, rand, expectation

    # Export a few utilities : 
    include("utilities.jl")
    export censored_loglikelihood, hazard, loghazard, cumhazard

    # Export other distributions: 
    include("distros/AbstractHazardDistribution.jl")
    include("distros/PiecewiseConstantHazardDistribution.jl")
    include("distros/ExpoDist.jl")

    include("distros/ExponentiatedWeibull.jl")
    include("distros/GeneralizedGamma.jl")
    include("distros/PowerGeneralizedWeibull.jl")
    include("distros/LogLogistic.jl")

    export ExpoDist, ExponentiatedWeibull, GeneralizedGamma, PowerGeneralizedWeibull, LogLogistic, PiecewiseConstantHazardDistribution

end
