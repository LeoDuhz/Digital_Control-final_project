% This program is used for pole placement of Continuous-Time Systems
% system state space parameters
A = [0 0 0 1 0 0;
     0 0 0 0 1 0;
     0 0 0 0 0 1;
     0 0 0 0 0 0;
     0 189.318 -116.932 0 0 0;
     0 -90.873 85.527 0 0 0];
B = [0 0 0 1 7.386 -0.545]';
C = [1 0 0 0 0 0;
     0 1 0 0 0 0;
     0 0 1 0 0 0];
D = [0 0 0]';
sys = ss(A,B,C,D);
[p,z] = pzmap(sys);
% desired poles setting
P = [-7.07+7.07i,-7.07-7.07i,-30,-32,-34,-36];
% ackerman method to get K
K = acker(A,B,P);
% other parameters setting
x0=[0;5*pi/180;5*pi/180;0;0;0];
T=0:0.01:1.5;
% calculate system response
[y1,x1,t1]=initial(A,B,C,D,x0,T);
[y2,x2,t2]=initial(A-B*K,B,C,D,x0,T);

% plot
subplot(2,1,1)
plot(T,y1)
axis([0 1.5 -10 10])
title("极点配置前")
xlabel("闭环极点为-15.90、-4.69、15.90、4.69、0、0")
legend("x","theta1","theta2")

subplot(2,1,2)
plot(T,y2)
title("极点配置后")
xlabel("闭环极点为-7.07±j7.07、-30、-32、-34、-36")
legend("x","theta1","theta2")

