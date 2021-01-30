% This part is used for obsever design 
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

% desired obsever poles setting
J = [-7.07+7.07i,-7.07-7.07i,-10,-11,-12,-13];
% place method to get H
K = place(A',C',J);
H = K';
