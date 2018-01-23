using Plots
pgfplots()
using LaTeXStrings
PGFPlots.pushPGFPlotsPreamble("\\usepackage{amssymb}")
using OrdinaryDiffEq
using DiffEqBase

TT = linspace(0,10,1000)
const Vt = 1000;
const Vm = 3000;

Xm = zeros(length(TT),1); Ym = zeros(length(TT),1);
Xt = zeros(length(TT),1); Yt = 20000*ones(length(TT),1);

thetaM = acos(Vt/Vm)
num=0;tf=0;
for i in 1:length(TT)
     Xm[i] = Vm*cos(thetaM)*TT[i]
     Ym[i] = Vm*sin(thetaM)*TT[i]
     Xt[i] = Vt*TT[i]
     if Ym[i] > 20000
          tf = TT[i]
          num = i
          break
     end
end
# misc variables
l1 = (4,:red,:solid)
l2 = (3,:green,:solid)
s1 = string("missle, with impact time = ",round(tf,2))
s2 = "target"

# position
p1 = plot(Xm[1:num],Ym[1:num],line=l1,label=s1)
plot!(Xt[1:num],Yt[1:num],line=l2,label=s2,legend=:bottomright)

yaxis!("y (m)")
xaxis!("x (m)")

savefig(string("figs/p4",".",:svg));
