using SymPy
@syms p1 p2 p3 p5 p6 p9 k1 sigma_w sigma_v
k1 = symbols("k1",nonzero=true, real=true)
p1,p2,p3,p4,p5,p6,p9,sigma_w,sigma_v = symbols("p1,p2,p3,p4,p5,p6,p9,sigma_w,sigma_v",real=true)
exs = [-k1*p2-p2*k1-1/sigma_v^2*p1^2, -k1*p5+p3-1/sigma_v^2*p1*p2,-k1*p6-1/sigma_v^2*p1*p3,p9-1/sigma_v^2*p2*p3,2*p6-1/sigma_v^2*p2^2,sigma_w^2-1/sigma_v^2*p3^2]
d = solve(exs,[p1,p2,p3,p4,p5,p6,p9])
