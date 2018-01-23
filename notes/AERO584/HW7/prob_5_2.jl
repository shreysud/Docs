using Plots
pgfplots()
using LaTeXStrings
PGFPlots.pushPGFPlotsPreamble("\\usepackage{amssymb}")
using OrdinaryDiffEq
using DiffEqBase
#using ParameterizedFunctions
using DiffEqCallbacks

TT = linspace(0,10,1000)
const Vt = 1000;
const Vm = 3000;

# differential equations
f = (t,x,dx) -> begin

     # diff eqs.
     dx[1] = Vt*cos(x[2])-Vm;      # 1. R
     dx[2] = -Vt*sin(x[2])/x[1];   # 2. B
end

x0 = [20000;pi/2]
tspan = (TT[1],TT[end])
prob = ODEProblem(f,x0,tspan)
sol = DiffEqBase.solve(prob,Tsit5())

# extract results
x1 = [sol(t)[1] for t in TT]
x2 = [sol(t)[2] for t in TT]

Xm = zeros(length(TT),1); Ym = zeros(length(TT),1);
Xt = zeros(length(TT),1); Yt = 20000*ones(length(TT),1);
tf=0;num=0;
for i in 1:length(TT)
     Xt[i] = Vt*TT[i]
     Xm[i] = Xt[i] - x1[i]*cos(x2[i])
     Ym[i] = 20000 - x1[i]*sin(x2[i])
     if Ym[i] > 20000
          tf = TT[i]
          num = i
          break
     end
end

# misc variables
l1 = (4,:red,:solid)
l2 = (3,:green,:solid)
l3 = (2,:black,:dot)

s1 = string("missle, with impact time = ",round(tf,2))
s2 = "target"

# position
p1 = plot(Xm[1:num],Ym[1:num],line=l1,label=s1)
plot!(Xt[1:num],Yt[1:num],line=l2,label=s2)
yaxis!("y (m)")
xaxis!("x (m)")
savefig(string("figs/p2",".",:svg));

# prob 5.3, amy_max = 40*32.2
# since theta = beta for pursuit guidance
c = 670
c2 = c-1
c3=1000
const g = Vm/Vt
const tf_g = TT[c]
const b0 = pi/2
const TM = 40*32.2
# differential equations
f = (t,x,dx) -> begin

     # diff eqs.
     dx[1] = Vt*cos(x[2])-Vm;      # 1. R
     dx[2] = -Vt*sin(x[2])/x[1];   # 2. B - > dx[3] does not work here because B is not << 1
     dx[3] = b0*(2-g)/((g-1)^2*(tf_g)^2)*((tf_g-t)/(tf_g))^((3-2*g)/(g-1))  # unstable because Bdot goes to infinity as t goes to tf
end

x0 = [20000;pi/2;0]
tspan = (TT[1],TT[c2])
prob = ODEProblem(f,x0,tspan)
sol = DiffEqBase.solve(prob,Tsit5())

# extract results
ff=indmin(abs.(sol.t[end] - TT))-1

x1 = [sol(t)[1] for t in TT[1:ff]]
x2 = [sol(t)[2] for t in TT[1:ff]]
x3 = [sol(t)[3] for t in TT[1:ff]]

Xml = zeros(length(TT),1); Yml = zeros(length(TT),1);
Xt = zeros(length(TT),1);
tf2 = 0;num2=0;
for i in 1:ff
     Xt[i] = Vt*TT[i]
     Xml[i] = Xt[i] - x1[i]*cos(x2[i])
     Yml[i] = 20000 - x1[i]*sin(x2[i])
     tf2 = TT[i]
     num2 = i
     if Yml[i] > 20000
          break
     end
end

s1 = string("missle, with impact time = ",round(tf,2))
s2 = "target"
s3 = string("missle, with miss")

# position
p1 = plot(Xm[1:num],Ym[1:num],line=l1,label=s1)
plot!(Xt[1:num],Yt[1:num],line=l2,label=s2)
plot!(Xml[1:num2],Yml[1:num2],line=l3,label=s3,legend=:bottomright)
yaxis!("y (m)")
xaxis!("x (m)")
savefig(string("figs/p3",".",:svg));

# turning rate
p1 = plot(TT[1:ff],x3[1:ff],line=l1)
yaxis!("Beta Dot")
xaxis!("t (s)")
savefig(string("figs/p3b",".",:svg));


#####################
## finding Ym
Xml = zeros(length(TT),1); Yml = zeros(length(TT),1);
Xt = zeros(length(TT),1);
x1 = zeros(length(TT),1);
x2 = zeros(length(TT),1);
x3 = zeros(length(TT),1);
x4 = zeros(length(TT),1);

# inital conditions
Yt[1] = 20000
x1[1] = 20000
x2[1] = pi/2
for i in 1:length(TT)-1
     dt = TT[i+1]-TT[i]
     Xt[i+1] = Xt[i] + Vt*TT[i]*dt
     Xml[i+1] = Xml[i] + Vm*cos(x2[i])*dt
     Yml[i+1] = Yml[i] + Vm*sin(x2[i])*dt
     x1[i+1] = sqrt((Yt[i]-Yml[i])^2 + (Xt[i]-Xml[i])^2)
     x2[i+1] = atan2(Yt[i]-Yml[i],Xt[i]-Xml[i]) # beta
     x3[i+1] = x3[i] + (x2[i+1] - x2[i])/dt # beta dot
     x4[i+1] = x4[i] + (x3[i+1] - x3[i])/dt # beta double dot
     if x4[i+1] > TM
          x4[i+1] = TM
     elseif x4[i+1] < -TM
          x4[i+1] = -TM
     end
end

s1 = string("missle, with impact time = ",round(tf,2))
s2 = "target"
s3 = string("missle, with miss")

# position
num2 = 1000
p1 = plot(Xm[1:num],Ym[1:num],line=l1,label=s1)
plot!(Xt[1:num],Yt[1:num],line=l2,label=s2)
plot!(Xml[1:num2],Yml[1:num2],line=l3,label=s3,legend=:bottomright)
yaxis!("y (m)")
xaxis!("x (m)")
savefig(string("figs/p3c",".",:svg));

# miss distance
Ym=x1[indmin(abs.(x1))]
tm=TT[indmin(abs.(x1))]
p1 = plot(TT,x1,line=l1,label=string("Ymiss = ",round(Ym,2)," (m); at t = ",round(tm,2), " (s)" ))
yaxis!("Ym (m)")
xaxis!("t (s)")
savefig(string("figs/p3d",".",:svg));

# miss distance
p1 = plot(TT,x4,line=l1)
yaxis!("Turning Acceleration")
xaxis!("t (s)")
savefig(string("figs/p3e",".",:svg));
