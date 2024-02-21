syms q1 q2 dotq1 dotq2 ddotq1 ddotq2 u1 u2 x1 x2 x3 x4;
syms d1 d2 m1 m2 r1 l1 l2 I1 I2 g

B = [m1+m2, -m2*d2*sin(q2); -m2*d2*sin(q2), I2+m2*d2*d2]
invB = inv(B)

C = [-m2*d2*cos(q2)*dotq2*dotq2; 0];
N = [0;m2*g*d2*cos(q2)]

xdot= [dotq1;dotq2;-invB*C-invB*N+invB*[u1;u2]];
xdot = subs(xdot,[q1,q2,dotq1,dotq2], [x1,x2,x3,x4])
