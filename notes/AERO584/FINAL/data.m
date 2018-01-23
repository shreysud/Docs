load P3_data.mat

t = D(:,1)
XxV = D(:,2)
XyV = D(:,3)
XzV = D(:,4)
qx = D(:,5)
qy = D(:,6)
qz = D(:,7)
qw = D(:,8) 
ZxW = D(:,9)
ZyW = D(:,10)
ZzW = 0*ZyW
ExB = D(:,11)
EyB = D(:,12)
EzB = D(:,13)
eta = D(:,14)
E1I = D(:,15)
E2I = D(:,16)

T = table(t, XxV, XyV, XzV, qx, qy, qz, qw, ZxW, ZyW, ZzW, ExB, EyB, EzB, eta, E1I, E2I);
writetable(T,"data.csv")
