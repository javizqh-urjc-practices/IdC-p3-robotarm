syms l1 l2 q1 q2
p1 = q1 + r1 + l2*cos(q2);
p2 = l2*sin(q2);
J = jacobian([p1, p2], [q1, q2])