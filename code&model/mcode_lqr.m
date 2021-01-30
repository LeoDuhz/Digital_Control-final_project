% This program is used for LQR Control of Continuous-Time Systems
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

% relative parameters setting
x0=[0;5*pi/180;5*pi/180;0;0;0];
T=0:0.05:10;
Q=C'*C;

% comparison under different R 
R=0.1;
[K1,S,E]=lqr(A,B,Q,R);
[y1,x1,t1]=initial(A-B*K1,B,C,D,x0,T);

R=1;
[K2,S,E]=lqr(A,B,Q,R);
[y2,x2,t2]=initial(A-B*K2,B,C,D,x0,T);

R=10;
[K3,S,E]=lqr(A,B,Q,R);
[y3,x3,t3]=initial(A-B*K2,B,C,D,x0,T);

% plot
suptitle("LQR Control")
subplot(3,1,1)
plot(T,y1)
legend("x","theta1","theta2")
ylabel("R=0.1")

subplot(3,1,2)
plot(T,y2)
legend("x","theta1","theta2")
ylabel("R=1")

subplot(3,1,3)
plot(T,y3)
legend("x","theta1","theta2")
ylabel("R=10")
