# using Pkg
using Plots
# Pkg.add("Plots")

# super simple plot
x = LinRange(0, 10, 100) 
y1 = sin.(x)
y2 = cos.(x)
plot(x, [y1, y2])

y3 = sin.(x).^2
y4 = @. sin.(x)^2 - 1
plot!(x, [y3, y4])
