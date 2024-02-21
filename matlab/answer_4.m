syms q1 q2 dotq1 dotq2

d1 = 1/2;
d2 = 1/2;
m1 = 1;
m2 = 1;
r1 = 1/2;
l1 = 1;
l2 = 1;
I1 = 1;
I2 = 1;

% Para pA
p1 = q1 + r1 + l2*cos(q2) == 1;
p2 = l2*sin(q2) == 0.75;

[x1, x2] = solve([p1 p2], [q1 q2])

vpa(x1) % No puede ser mayor que 1
vpa(x2)

% Para pB
p1 = q1 + r1 + l2*cos(q2) == 1.5;
p2 = l2*sin(q2) == -0.75;

[x1, x2] = solve([p1 p2], [q1 q2])

vpa(x1) % No puede ser mayor que 1
vpa(x2)
