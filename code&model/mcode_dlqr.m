% This program is used for LQR Control of Discrete-Time(DT) Systems
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

% relative parameters setting
Q=C'*C;
x0=[0;5*pi/180;5*pi/180;0;0;0];

% comparison under different R 
R=0.1;
[K1,S,E]=dlqr(A,B,Q,R);
[y1,x1,t1]=dinitial(A-B*K1,B,C,D,x0);

R=1;
[K2,S,E]=dlqr(A,B,Q,R);
[y2,x2,t2]=dinitial(A-B*K2,B,C,D,x0);

R=10;
[K3,S,E]=dlqr(A,B,Q,R);
[y3,x3,t3]=dinitial(A-B*K2,B,C,D,x0);

% plot
suptitle("DLQR Control")
subplot(3,1,1)
plot([1:t1],y1)
legend("x","theta1","theta2")
ylabel("R=0.1")

subplot(3,1,2)
plot([1:t2],y2)
legend("x","theta1","theta2")
ylabel("R=1")

subplot(3,1,3)
plot([1:t3],y3)
legend("x","theta1","theta2")
ylabel("R=10")

