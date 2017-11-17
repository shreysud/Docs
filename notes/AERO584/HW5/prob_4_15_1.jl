using Plots
pgfplots()
using LaTeXStrings
PGFPlots.pushPGFPlotsPreamble("\\usepackage{amssymb}")
using Interpolations
using OrdinaryDiffEq
using DiffEqBase
using VehicleModels

# assume input is a step
TT = linspace(0,10,100)
u = zeros(length(TT))
u[10:20] = 1

# create spline
knots = (TT,)
sp_U = interpolate(knots,u,Gridded(Linear()))

# differential equations
f = (t,x,dx) -> begin

# control
u = sp_U[t]; #

# diff eqs.
dx[1] = x[2];   # 1.
dx[2] = x[3];   # 2.
dx[3] = u;      # 3.
end

x0 = [1.0;0.0;0.0]
tspan = (TT[1],TT[end])
prob = ODEProblem(f,x0,tspan)
sol = DiffEqBase.solve(prob,Tsit5())

# extract results
ta = sol.t
x1a = [sol.u[i][1] for i in 1:length(ta)]
x2a = [sol.u[i][2] for i in 1:length(ta)]
x3a = [sol.u[i][3] for i in 1:length(ta)]

# need x2a in observer
# create spline
knots = (ta,)
sp_x1a = interpolate(knots,x1a,Gridded(Linear()))

s1 = "actual system"
l1 = (4.7,:red,:solid)

s2 = "asmptotic observer"
l2 = (3,:green,:dash)

s3 = "input"
l3 = (4.7,:black,:solid)


# asymtotic observer

# differential equations
f = (t,x,dx) -> begin

# control
u = sp_U[t]; #
g1 = -100
g3 = -5
g2 = -g3/g1 - 10

y = sp_x1a[t]; #

# diff eqs.
dx[1] = x[2] + g1*(x[1] - y);   # 1.
dx[2] = x[3] + g2*(x[1] - y);   # 2.
dx[3] = u + g3*(x[1] - y);      # 3.
end

x0 = [1.0;0.0;0.0]
tspan = (TT[1],TT[end])
prob = ODEProblem(f,x0,tspan)
sol = DiffEqBase.solve(prob,Tsit5())

# extract results
t = sol.t
x1 = [sol.u[i][1] for i in 1:length(t)]
x2 = [sol.u[i][2] for i in 1:length(t)]
x3 = [sol.u[i][3] for i in 1:length(t)]

# input
p = plot(TT,u,line=l3,label=s3)
yaxis!(string("Aileron Deflection, ",L"$u$"))
xaxis!("Time (s)")
plot(p,size=[400,200])
#savefig(string("figs/input_4_15",".",:svg));
p1 = plot(ta,x1a,line=l1,label=s1)
plot!(t,x1,line=l2,label=s2)
yaxis!(string("Heading Angle, ",L"$\psi$"))
xaxis!("Time (s)")

# speed
p2 = plot(ta,x2a,line=l1,label=s1)
plot!(t,x2,line=l2,label=s2)
yaxis!(string("Roll Angle, ",L"$\phi$"))
xaxis!("Time (s)")

# thrust
p3 = plot(ta,x3a,line=l1,label=s1)
plot!(t,x3,line=l2,label=s2)
yaxis!(string("Roll Angle Rate, ",L"$\dot{\phi}$"))
xaxis!("Time (s)")

plot(p1,p2,p3,p,layout=@layout([a;b;c;d]),size=[600,600])

savefig(string("figs/p1_4_15_2",".",:svg));
