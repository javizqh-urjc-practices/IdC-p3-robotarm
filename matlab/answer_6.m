syms l1 l2 q1 q2 dotq1 dotq2 r1

p1 = q1 + r1 + l2*cos(q2);
p2 = l2*sin(q2);
J = jacobian([p1, p2], [q1, q2])

% Calcular las componentes de la velocidad
ang = atan((1.5 - 1)/(-0.75 - 0.75)) - pi
ang = atan((-0.75 - 0.75)/(1.5 - 1)) - pi/2
max_speed = 0.1

dotpx = max_speed*sin(ang)
dotpy = max_speed*cos(ang)

J = subs(J,[q2, l2], [0.85, 1])

vpa(inv(J)*[dotpx;dotpy])