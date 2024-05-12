using SurvivalDistributions
using Documenter

DocMeta.setdocmeta!(SurvivalDistributions, :DocTestSetup, :(using SurvivalDistributions); recursive=true)

makedocs(;
    modules=[SurvivalDistributions],
    authors="Oskar Laverny <oskar.laverny@univ-amu.fr> and contributors",
    sitename="SurvivalDistributions.jl",
    format=Documenter.HTML(;
        canonical="https://lrnv.github.io/SurvivalDistributions.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/lrnv/SurvivalDistributions.jl",
    devbranch="main",
)
