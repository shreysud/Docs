using Plots
pgfplots()
using LaTeXStrings
PGFPlots.pushPGFPlotsPreamble("\\usepackage{amssymb}")
using Interpolations
using OrdinaryDiffEq
using DiffEqBase
using DataFrames

d = readtable("data.csv")

# extract data
t = d[:t]; # seconds
XxV = d[:XxV]
XyV = d[:XyV]
XzV = d[:XzV]
qx = d[:qx]
qy = d[:qy]
qz = d[:qz]
qw = d[:qw]
ZxW = d[:ZxW]
ZyW = d[:ZyW]
ZzW = d[:ZzW]
ExB = d[:ExB]
EyB = d[:EyB]
EzB = d[:EzB]
eta = d[:eta]
E1I = d[:E1I]
E2I = d[:E2I]
E3I = ones(length(E2I))

lambda = abs(EzB)

# misc variables
L = length(t)
l1 = (6,:green,:solid)
l2 = (3,:red,:solid)
l3 = (2.2,:black,:dash)
l4 = (1.5,:blue,:dot)

# rotation matrix, https://en.wikipedia.org/wiki/Conversion_between_quaternions_and_Euler_angles
function ROT(q_x,q_y,q_z,q_w)
   [1 - 2*(q_y^2 + q_z^2)       2*(q_x*q_y - q_w*q_z)     2*(q_w*q_y + q_x*q_z);
    2*(q_x*q_y + q_w*q_z)       1-2*(q_x^2 + q_z^2)       2*(q_z*q_y - q_w*q_x);
    2*(q_x*q_z - q_w*q_y)       2*(q_z*q_y + q_w*q_x)     1-2*(q_y^2 + q_x^2)];
end

# direction cosine matrices, 3-2-1 sequence (psi,theta,phi)
# [x,y,z] = Rz(psi)*Ry(theta)*Rz(phi)[X;Y;Z]
function Rz(psi)
 [cos(psi) -sin(psi) 0;
  sin(psi)  cos(psi) 0;
     0         0     1]
end

function Ry(theta)
 [cos(theta)       0   sin(theta);
      0            1       0;
  -sin(theta)      0     cos(theta)]
end

function Rx(phi)
 [1         0       0;
  0       cos(phi) -sin(phi);
  0       sin(phi)  cos(phi)]
end

##################
# part a)
K_intr = [1030.597415177913           0          361.451236121491;
                  0           1030.358516382353  246.1238464630347;
                  0                   0                1]
C_intr = [1  0  0;
          0 -1  0;
          0  0 -1]

KK = [ 0.5   0     0;
      0    0.6    0;
      0     0   0.07]

rotM = zeros(L,3,3)
eB = zeros(L,3)
eBM = zeros(L,3)
xW = zeros(L,3)

for i in 1:L-1
 # calculate rotation matrix using quaternion data from Vicon system
 rotM[i,:,:] = ROT(qx[i],qy[i],qz[i],qw[i])
 # put eB into a matrix
 eB[i,:] = [ExB[i];EyB[i];EzB[i]]
 # calculate eB from the measured data
 eI = [E1I[i];E2I[i];E3I[i]]
 eBM[i,:] = inv(C_intr)*inv(KK)*lambda[i]*eI
 # estimate xW from vectors
 xW[i,:] = [-ZxW[i];ZyW[i];ZzW[i]] - rotM[i,:,:]*eB[i,:,:]
end
wB = zeros(L,3,3)
for i in 1:L-1
 dt = d[:t][i+1] - d[:t][i]
 wB[i,:,:] = (rotM[i+1,:,:] - rotM[i,:,:])/dt
end
# xW) plots
s1 = "using Vicon"
s2 = "calcualted "

plot(XxV,XyV,XzV,line=l1,label=s1)
plot!(xW[:,1],xW[:,2],xW[:,3],line=l2,label=s2,cbar=false)
savefig(string("figs/p4a",".",:svg));

# position
p1 = plot(t,XxV,line=l1,label=s1)
plot!(t,xW[:,1],line=l2,label=s2)
yaxis!("x (m)")
xaxis!("Time (s)")

p2 = plot(t,XyV,line=l1,label=s1)
plot!(t,xW[:,2],line=l2,label=s2)
yaxis!("y (m)")
xaxis!("Time (s)")

p3 = plot(t,XzV,line=l1,label=s1)
plot!(t,xW[:,3],line=l2,label=s2)
yaxis!("z (m)")
xaxis!("Time (s)")
plot(p1,p2,p3,layout=@layout([a;b;c]),size=[600,600])
savefig(string("figs/p4b",".",:svg));

Rw = zeros(6,6)
Rw[1:3,1:3] = [0.1    0   0;
                0   0.1   0;
                0     0  0.1]
Rv= [2 0 0;
     0 2 0;
     0 0 2]
x_k = zeros(L); x_k[1] = 0;
y_k = zeros(L); y_k[1] = 0;
z_k = zeros(L); z_k[1] = 0;
vx_k = zeros(L); vx_k[1] = 0;
vy_k = zeros(L); vy_k[1] = 0;
vz_k = zeros(L); vz_k[1] = 0;
x = zeros(L,6); x[1,1:6] = [0,0,0,0,0,0];
P = zeros(L,6,6)
for i in 1:L-1
 dt = d[:t][i+1] - d[:t][i]
 A = [1  0  0  dt 0   0;
      0  1  0  0  dt  0;
      0  0  1  0  0  dt;
      0  0  0  1  0   0;
      0  0  0  0  1   0;
      0  0  0  0  0   1]

 B = [1   0  0;
      0   1  0;
      0   0  1;
      0   0  0;
      0   0  0;
      0   0  0]

 C = [1 0  0 dt 0   0;
      0 1  0 0  dt  0;
      0 0  1 0  0  dt]

 # time update (predict)
 u = (-wB[i,:,:] + KK)
 x[i+1,:] = A*x[i,:] + B*[u[1,1];u[2,2];u[3,3]]
 P[i+1,:,:] = A*P[i,:,:]*A' + Rw

 # measurment update
 eI = [E1I[i];E2I[i];E3I[i]]
 y = inv(C_intr)*inv(K_intr)*lambda[i]*eI
 K = P[i+1,:,:]*C'*inv((C*P[i+1,:,:]*C' + Rv))
 x[i+1,:] = x[i+1,:] + K*(y-C*x[i+1,:])
 P[i+1,:,:] = (eye(6) - K*C)*P[i+1,:,:]

 # save results
 x_k[i+1] = x[i+1,1]
 vx_k[i+1] = x[i+1,4]

 y_k[i+1] = x[i+1,2]
 vy_k[i+1] = x[i+1,5]

 z_k[i+1] = x[i+1,3]
 vz_k[i+1] = x[i+1,6]
end

# part a) plot eB
s1 = "given eB"
s2 = "eB using Kalman Filter"

# position
p1 = plot(t,eB[:,1],line=l1,label=s1)
plot!(t,x_k,line=l2,label=s2)
yaxis!("x (m)")
xaxis!("Time (s)")

p2 = plot(t,eB[:,2],line=l1,label=s1)
plot!(t,y_k,line=l2,label=s2)
yaxis!("y (m)")
xaxis!("Time (s)")

p3 = plot(t,eB[:,3],line=l1,label=s1)
plot!(t,z_k,line=l2,label=s2)
yaxis!("z (m)")
xaxis!("Time (s)")
plot(p1,p2,p3,layout=@layout([a;b;c]),size=[600,600])
savefig(string("figs/p4c",".",:svg));

plot(eB[:,1],eB[:,2],eB[:,3],line=l1,label=s1,cbar=false)
plot!(x_k,y_k,z_k,line=l2,label=s2,cbar=false,size=[800,800])
xaxis!("x (m)")
yaxis!("y (m)")
savefig(string("figs/p4d",".",:svg));

# xWK)
xWK = zeros(L,3)
for i in 1:L-1
 # estimate xWK from vectors
 xWK[i,:] = [-ZxW[i];ZyW[i];ZzW[i]] - rotM[i,:,:]*[x_k[i];y_k[i];z_k[i]]
end

s1 = "xW using Vicon"
s2 = "xW using Kalman Filter"

# position
p1 = plot(t,XxV,line=l1,label=s1)
plot!(t,xWK[:,1],line=l2,label=s2)
yaxis!("x (m)")
xaxis!("Time (s)")

p2 = plot(t,XyV,line=l1,label=s1)
plot!(t,xWK[:,2],line=l2,label=s2)
yaxis!("y (m)")
xaxis!("Time (s)")

p3 = plot(t,XzV,line=l1,label=s1)
plot!(t,xWK[:,3],line=l2,label=s2)
yaxis!("z (m)")
xaxis!("Time (s)")
plot(p1,p2,p3,layout=@layout([a;b;c]),size=[600,600])
savefig(string("figs/p4e",".",:svg));

plot(XxV,XyV,XzV,line=l1,label=s1,cbar=false)
plot!(xWK[:,1],xWK[:,2],xWK[:,3],line=l2,label=s2,cbar=false,size=[800,800])
xaxis!("x (m)")
yaxis!("y (m)")
savefig(string("figs/p4f",".",:svg));


### part b)

Rw = zeros(6,6)
Rw[1:3,1:3] = [0.1    0   0;
                0   0.1   0;
                0     0  0.1]
Rv= [5 0 0;
    0 5 0;
    0 0 5]

x_k = zeros(L); x_k[1] = 0;
y_k = zeros(L); y_k[1] = 0;
z_k = zeros(L); z_k[1] = 0;
vx_k = zeros(L); vx_k[1] = 0;
vy_k = zeros(L); vy_k[1] = 0;
vz_k = zeros(L); vz_k[1] = 0;

x = zeros(L,6); x[1,1:6] = [0,0,0,0,0,0];
P = zeros(L,6,6)
for i in 1:L-1
 dt = d[:t][i+1] - d[:t][i]
 A = [1  0  0  dt 0   0;
      0  1  0  0  dt  0;
      0  0  1  0  0  dt;
      0  0  0  1  0   0;
      0  0  0  0  1   0;
      0  0  0  0  0   1]

 B = [1   0  0;
      0   1  0;
      0   0  1;
      0   0  0;
      0   0  0;
      0   0  0]

 C = [1 0  0 dt 0   0;
      0 1  0 0  dt  0;
      0 0  1 0  0  dt]

 # time update (predict)
 #u = (-wB[i,:,:] + K)*eB[i,:]
 u = (-wB[i,:,:] + KK)#*eB[i,:]
 x[i+1,:] = A*x[i,:] + B*[u[1,1];u[2,2];u[3,3]]
# x[i+1,:] = -wB[i,:,:]*eB[i,:] + B*u
 P[i+1,:,:] = A*P[i,:,:]*A' + Rw

 # measurment update
 eI = [E1I[i];E2I[i];E3I[i]]
 y = inv(C_intr)*inv(K_intr)*lambda[i]*eI

 #y = eB[i,:]
 #y = inv(lambda[i])*K_intr*C_intr*eB[i,:]
 K = P[i+1,:,:]*C'*inv((C*P[i+1,:,:]*C' + Rv))
 x[i+1,:] = x[i+1,:] + K*(y-C*x[i+1,:])
 P[i+1,:,:] = (eye(6) - K*C)*P[i+1,:,:]

 # save results
 x_k[i+1] = x[i+1,1]
 vx_k[i+1] = x[i+1,4]

 y_k[i+1] = x[i+1,2]
 vy_k[i+1] = x[i+1,5]

 z_k[i+1] = x[i+1,3]
 vz_k[i+1] = x[i+1,6]
end

# part a) plot eB
s1 = "given eB"
s2 = "eB using Kalman Filter"

# position
p1 = plot(t,eB[:,1],line=l1,label=s1)
plot!(t,x_k,line=l2,label=s2)
yaxis!("x (m)")
xaxis!("Time (s)")

p2 = plot(t,eB[:,2],line=l1,label=s1)
plot!(t,y_k,line=l2,label=s2)
yaxis!("y (m)")
xaxis!("Time (s)")

p3 = plot(t,eB[:,3],line=l1,label=s1)
plot!(t,z_k,line=l2,label=s2)
yaxis!("z (m)")
xaxis!("Time (s)")
plot(p1,p2,p3,layout=@layout([a;b;c]),size=[600,600])
savefig(string("figs/p4cB",".",:svg));

plot(eB[:,1],eB[:,2],eB[:,3],line=l1,label=s1,cbar=false)
plot!(x_k,y_k,z_k,line=l2,label=s2,cbar=false,size=[800,800])
xaxis!("x (m)")
yaxis!("y (m)")
savefig(string("figs/p4dB",".",:svg));

# xWK)
xWK = zeros(L,3)
for i in 1:L-1
 # estimate xWK from vectors
 xWK[i,:] = [-ZxW[i];ZyW[i];ZzW[i]] - rotM[i,:,:]*[x_k[i];y_k[i];z_k[i]]
end

s1 = "xW using Vicon"
s2 = "xW using Kalman Filter"

# position
p1 = plot(t,XxV,line=l1,label=s1)
plot!(t,xWK[:,1],line=l2,label=s2)
yaxis!("x (m)")
xaxis!("Time (s)")

p2 = plot(t,XyV,line=l1,label=s1)
plot!(t,xWK[:,2],line=l2,label=s2)
yaxis!("y (m)")
xaxis!("Time (s)")

p3 = plot(t,XzV,line=l1,label=s1)
plot!(t,xWK[:,3],line=l2,label=s2)
yaxis!("z (m)")
xaxis!("Time (s)")
plot(p1,p2,p3,layout=@layout([a;b;c]),size=[600,600])
savefig(string("figs/p4eB",".",:svg));

plot(XxV,XyV,XzV,line=l1,label=s1,cbar=false)
plot!(xWK[:,1],xWK[:,2],xWK[:,3],line=l2,label=s2,cbar=false,size=[800,800])
xaxis!("x (m)")
yaxis!("y (m)")
savefig(string("figs/p4fB",".",:svg));
