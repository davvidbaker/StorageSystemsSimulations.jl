using Documenter
using PowerSystems
using StorageSystemsSimulations
using DataStructures

pages = OrderedDict(
    "Welcome Page" => "index.md",
    "Quick Start Guide" => "quick_start_guide.md",
    "Tutorials" =>
        Any["tutorials/single_stage_model.md", "tutorials/simulation_tutorial.md"],
    "Formulation Library" =>
        Any["StorageDispatchWithReserves" => "formulation_library/StorageDispatchWithReserves.md",],
    "Code Base Developer Guide" => "code_base_developer_guide/developer.md",
    "API Reference" => "api/StorageSystemsSimulations.md",
)

makedocs(;
    modules=[StorageSystemsSimulations],
    format=Documenter.HTML(; prettyurls=haskey(ENV, "GITHUB_ACTIONS")),
    warnonly=[:missing_docs],
    sitename="StorageSystemsSimulations.jl",
    authors="Jose Daniel Lara, Rodrigo Henriquez-Auba, Sourabh Dalvi",
    pages=Any[p for p in pages],
)

deploydocs(;
    repo="github.com/NREL-Sienna/StorageSystemsSimulations.jl.git",
    target="build",
    branch="gh-pages",
    devbranch="main",
    devurl="dev",
    push_preview=true,
    versions=["stable" => "v^", "v#.#"],
)
