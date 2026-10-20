# using Pkg
using Plots
# Pkg.add("Plots")

# super simple plots
x = LinRange(0, 10, 100) 
y1 = sin.(x)
y2 = cos.(x)
plot1 = plot(x, [y1, y2])

y3 = sin.(x).^2
y4 = @. sin.(x)^2 - 1
plot!(plot1, x, [y3, y4])
display(plot1)

# euler method of ode solving
function euler_ode(y_dash, y0, t0, nmax, h)
    y = y0
    t = t0
    y_arr = [y]
    t_arr = [t]
    for i in 1:nmax
        y += h * y_dash(t, y)
        t += h
        push!(y_arr, y)
        push!(t_arr, t)
    end
    return [t_arr, y_arr]
end


# basic ode
function ode(t, y)
    return -y
end

# input params
nmax = 1000
h = 0.01
t = LinRange(0, 3.14, 1000)
y0 = 1.
t0 = 0.

t_euler, y_euler = euler_ode(ode, y0, t0, nmax, h)
analytic_y = exp.(-t_euler)

plot2 = plot(t_euler, y_euler, label="euler method", xlabel="time / s",
                ylabel="y", title="euler method vs analytic sol", lw=4)
plot!(plot2, t_euler, analytic_y, label="analytic sol", color="red", lw=2)
display(plot2)
