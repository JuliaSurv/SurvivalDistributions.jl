using SurvivalDistributions
using Documenter
using DocumenterCitations

DocMeta.setdocmeta!(SurvivalDistributions, :DocTestSetup, :(using SurvivalDistributions); recursive=true)

bib = CitationBibliography(
    joinpath(@__DIR__,"src","assets","references.bib"),
    style=:numeric
)

makedocs(;
    plugins=[bib],
    modules=[SurvivalDistributions],
    authors="Oskar Laverny <oskar.laverny@univ-amu.fr> and contributors",
    sitename="SurvivalDistributions.jl",
    format=Documenter.HTML(;
        canonical="https://JuliaSurv.github.io/SurvivalDistributions.jl",
        edit_link="main",
        assets=String["assets/citations.css"],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuliaSurv/SurvivalDistributions.jl",
    devbranch="main",
)