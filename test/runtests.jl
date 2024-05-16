using TestItemRunner

@run_package_tests

@testitem "trivial test" begin
    @test true
end

@testitem "Code quality (Aqua.jl)" begin
    using Aqua
    Aqua.test_all(
        SurvivalDistributions;
        ambiguities=false,
    )
end

@testitem "Check Hazard Values for Exponential distribution" begin
    using Distributions
    λ, t = 10rand(), 3rand()
    X = Exponential(1 / λ)
    @test hazard(X, t) ≈ λ
    @test cumhazard(X, t) ≈ t * λ
end

@testitem "Check Hazard Values for LogNormal distribution" begin
    using Distributions

    function hLogNormal(t, mu, sigma, logh::Bool=false)
        lpdf0 = logpdf.(LogNormal(mu, sigma), t)
        ls0 = logccdf.(LogNormal(mu, sigma), t)
        val = lpdf0 .- ls0
        if logh
            return val
        else
            return exp.(val)
        end
    end

    μ, σ, t = rand(), rand(), rand()
    X = LogNormal(μ,σ)

    @test hLogNormal(t,μ,σ) ≈ hazard(X,t)
end

@testitem "Check pwchd" begin
    using Distributions, HypothesisTests
    X = PiecewiseConstantHazardDistribution(rand(10),rand(10))
    x = rand(X,100000) 
    ApproximateOneSampleKSTest(x, X)
end