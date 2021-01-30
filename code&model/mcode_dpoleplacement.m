% This program is used for pole placement of Discrete-Time(DT) Systems
Ac = [0 0 0 1 0 0;
     0 0 0 0 1 0;
     0 0 0 0 0 1;
     0 0 0 0 0 0;
     0 189.318 -116.932 0 0 0;
     0 -90.873 85.527 0 0 0];
Bc = [0 0 0 1 7.386 -0.545]';
Cc = [1 0 0 0 0 0;
     0 1 0 0 0 0;
     0 0 1 0 0 0];
Dc = [0 0 0]';
sys = ss(Ac,Bc,Cc,Dc);
% calculate DT state space parameters
Ts = 0.01;
dsys = c2d(sys, Ts);
A = dsys.A;
B = dsys.B;
C = dsys.C;
D = dsys.D;
[p,z] = pzmap(dsys);

% desired poles setting
P = [0.7 0.75 0.80 0.85 0.90 0.95];
% ackerman method to get K
K = acker(A,B,P);
% other parameters setting
x0=[0;5*pi/180;5*pi/180;0;0;0];

% calculate system response
[y1,x1,t1]=dinitial(A,B,C,D,x0);
[y2,x2,t2]=dinitial(A-B*K,B,C,D,x0);

% plot
subplot(2,1,1)
plot([1:t1],y1)
axis([0 inf -10 10])
title("极点配置前")
xlabel("闭环极点为1.17、0.85、0.95、1.05、1、1")
legend("x","theta1","theta2")

subplot(2,1,2)
plot([1:t2],y2)
title("极点配置后")
xlabel("闭环极点为0.7、0.75、0.8、0.85、0.9、0.95")
legend("x","theta1","theta2")
