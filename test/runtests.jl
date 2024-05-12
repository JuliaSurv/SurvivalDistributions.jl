using SurvivalDistributions
using Test
using Aqua

@testset "SurvivalDistributions.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(SurvivalDistributions)
    end
    # Write your tests here.
end
