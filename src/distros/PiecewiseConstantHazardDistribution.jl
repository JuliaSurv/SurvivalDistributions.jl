struct PiecewiseConstantHazardDistribution <: AbstractHazardDistribution
    ∂t::Vector{Float64}
    λ::Vector{Float64}
end
# the three folowing functions are actually enough i think to be able to sample eficiently for piecewise constant hazard distributions. 
function hazard(D::PiecewiseConstantHazardDistribution, t::Real)
    u = 0.0
    for i in 1:length(D.∂t)
        u += D.∂t[i]
        if t < u
            return D.λ[i]
        end
    end
    return D.λ[end]
end
function cumhazard(D::PiecewiseConstantHazardDistribution, t::Real)
    Λ = 0.0
    u = 0.0
    for j in eachindex(D.∂t)
        u += D.∂t[j]
        if t > u 
            Λ += D.λ[j]*D.∂t[j]
        else
            Λ += D.λ[j]*(t-(u-D.∂t[j]))
            return Λ
        end
    end
    # We consider that the last box is in fact infinitely wide (exponential tail)
    return Λ + (t-u)*L.λ[end] 
end
function quantile(D::PiecewiseConstantHazardDistribution, p::Real)
    Λ_target = -log(1-p)
    Λ = 0.0
    u = 0.0
    for j in eachindex(D.∂t)
        Λ += D.λ[j]*D.∂t[j]
        u += D.∂t[j]
        if Λ_target < Λ
            u -= (Λ - Λ_target) / D.λ[j]
            return u
        end
    end
    return u
end
function expectation(L::PiecewiseConstantHazardDistribution)
    S = 1.0
    E = 0.0
    for j in eachindex(D.∂t)
        if D.λ[j] > 0
            S_inc = exp(-D.λ[j]*D.∂t[j])
            E += S * (1 - S_inc) / D.λ[j]
            S *= S_inc
        else
            E += S * D.∂t[j]
        end
    end
    # This reminder assumes a exponential life time afer the maximuum age.
    R = ifelse(D.λ[end] == 0.0, 0.0, S / D.λ[end])
    return E + R
end
