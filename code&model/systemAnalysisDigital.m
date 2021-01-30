%二级倒立摆离散系统能控性、能观性、稳定性分析

%连续系统状态空间模型建立
A=[0,0,0,1,0,0;
0,0,0,0,1,0;
0,0,0,0,0,1;0,0,0,0,0,0;
0,189.318,-116.932,0,0,0;
0,-90.873,85.527,0,0,0];

B=[0,0,0,1,7.386,-0.545]';
C=[1,0,0,0,0,0;0,1,0,0,0,0;0,0,1,0,0,0];
D=[0,0,0]';


%连续系统转换为离散系统
Ts=0.01; %设置采样周期为0.01s
[G,H]=c2d(A,B,Ts);

%能控性分析
Qc=[H,G*H,G^2*H,G^3*H,G^4*H,G^5*H];
if(rank(Qc) == 6) 
    disp('rank(Qc)=6,该系统能控')
else
    disp('能控性矩阵不满秩，系统不能控')
end

%能观性分析
Qo=[C;C*G;C*G^2;C*G^3;C*G^4;C*G^5];
if(rank(Qo) == 6) 
    disp('rank(Qo)=6,该系统能观')
else
    disp('能观性矩阵不满秩，该系统不能观')
end

%稳定性分析
eigenValues=eig(A);
for i=1:length(eigenValues)
    if(real(eigenValues(i))^2+imag(eigenValues(i))^2 > 1)
        disp('该系统不稳定')
        break
    end
    
    if(i==length(eigenValues))
        disp('该系统稳定')
    end
end



