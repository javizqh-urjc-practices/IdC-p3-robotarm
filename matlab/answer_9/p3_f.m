function  xdot  = f(x,u)

% State: x = (x(1),x(2),x(3),x(4))
% Control: u = (u(1),u(2))
d1 = 1/2;
d2 = 1/2;
m1 = 1;
m2 = 1;
r1 = 1/2;
l1 = 1;
l2 = 1;
I1 = 1;
I2 = 1;
g = 9.81;

q1 = x(1);
q2 = x(2);
dotq1 = x(1);
dotq2 = x(2);

invB =  [((m2*d2^2 + I2)/(- d2^2*m2^2*sin(x(2))^2 + d2^2*m2^2 + m1*d2^2*m2 + I2*m2 + I2*m1)), ((d2*m2*sin(x(2)))/(- d2^2*m2^2*sin(x(2))^2 + d2^2*m2^2 + m1*d2^2*m2 + I2*m2 + I2*m1));
         ((d2*m2*sin(x(2)))/(- d2^2*m2^2*sin(x(2))^2 + d2^2*m2^2 + m1*d2^2*m2 + I2*m2 + I2*m1)),     ((m1 + m2)/(- d2^2*m2^2*sin(x(2))^2 + d2^2*m2^2 + m1*d2^2*m2 + I2*m2 + I2*m1))];

C = [-m2*d2*cos(x(2))*x(4)*x(4); 0];
N = [0;m2*g*d2*cos(x(2))];

xdot= [x(3);x(4);-invB*C-invB*N+invB*[u(1);u(2)]];
end
