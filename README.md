# SurvivalDistributions

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://JuliaSurv.github.io/SurvivalDistributions.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://JuliaSurv.github.io/SurvivalDistributions.jl/dev/)
[![Build Status](https://github.com/JuliaSurv/SurvivalDistributions.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/JuliaSurv/SurvivalDistributions.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/JuliaSurv/SurvivalDistributions.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/JuliaSurv/SurvivalDistributions.jl)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)
[![PkgEval](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/S/SurvivalDistributions.svg)](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/S/SurvivalDistributions.html)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

The SurvivalDistributions.jl package is part of the JuliaSurv survival analysis suite. It provides a few utility functions (related to hazard and censoring) to manipulate distributions from [`Distributions.jl`](https://github.com/JuliaStats/Distributions.jl), but most importantly a few Distributions familieis that are sometimes usefull when doing survival analysis. 

The implementation is very light and does limit its dependencies to a minimum (namely, `Distributions.jl`), so that depending on `SurvivalDistributions.jl` should not incur extra startup time.

Do not hesitate to open an issue if you want to add another distribution that you might find usefull for survival analysis, or if you want to discuss about the content of the package itself ! 

