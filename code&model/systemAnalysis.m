%二级倒立摆连续系统能控性、能观性、稳定性分析

%系统状态空间模型建立
A=[0,0,0,1,0,0;
0,0,0,0,1,0;
0,0,0,0,0,1;0,0,0,0,0,0;
0,189.318,-116.932,0,0,0;
0,-90.873,85.527,0,0,0];

B=[0,0,0,1,7.386,-0.545]';
C=[1,0,0,0,0,0;0,1,0,0,0,0;0,0,1,0,0,0];
D=[0,0,0]';

%能控性分析
Qc=[B,A*B,A^2*B,A^3*B,A^4*B,A^5*B];
if(rank(Qc) == 6) 
    disp('rank(Qc)=6,该系统能控')
else
    disp('能控性矩阵不满秩，系统不能控')
end

%能观性分析
Qo=[C;C*A;C*A^2;C*A^3;C*A^4;C*A^5];
if(rank(Qo) == 6) 
    disp('rank(Qo)=6,该系统能观')
else
    disp('能观性矩阵不满秩，该系统不能观')
end

%稳定性分析
eigenValues=eig(A);
for i=1:length(eigenValues)
    if(eigenValues(i)>0)
        disp('该系统不稳定')
        break
    end
    
    if(i==length(eigenValues))
        disp('该系统稳定')
    end
end



