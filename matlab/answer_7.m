syms l2 x2(t)

J = [1, -l2*sin(x2(t)); 0,  l2*cos(x2(t))];

Jdot = diff(J,t)