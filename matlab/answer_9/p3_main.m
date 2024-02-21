init;

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

ang = atan((1.5 - 1)/(-0.75 - 0.75)) - pi
max_speed = 0.1;

% Initial state, tantos decimales son necesarios para la velocidad
x = [-0.16143782776614764762540393840982;
     0.84806207898148100805294433899842;
     -0.076368946664750770749360390887265; 
     -0.14374356435699715997283278429437];

J = [(- sin(x(1) + x(2)) - sin(x(1))), (-sin(x(1) + x(2))); (cos(x(1) + x(2)) + cos(x(1))),  (cos(x(1) + x(2)))];

dt = 0.01;
frame_counter=0;
t=0;

Kp = [10,0;0,10];
Kd = [5,0;0,5];

for t=0:dt:30
    w = [1+max_speed*t*sin(ang);0.75+max_speed*t*cos(ang)]
    B = [m1+m2, -m2*d2*sin(x(2)); -m2*d2*sin(x(2)), I2+m2*d2*d2]
    C = [-m2*d2*cos(x(2))*x(4)*x(4); 0];
    N = [0;m2*g*d2*cos(x(2))];

    y = [x(1)+r1+l2*cos(x(2)); l2*sin(x(2))]

    % Solo para comprobar la velocidad, debe ser 0.1
    if t > 0
        vel = sqrt(((1-y(1))/t)^2 + ((0.75-y(2))/t)^2)
    end

    % Es necesario el margen porque sino nunca entra
    if (y(1) >= 1.4995 && y(1) <= 1.5005 && y(2) >= -0.7505 && y(2) <= -0.7495)
        t % T deberia ser = 15.8113883, pero por redondeos es 15.81
        break
    end

    J = [1, -l2*sin(x(2)); 0,  l2*cos(x(2))];
    invJ = [1, sin(x(2))/cos(x(2)); 0,  1/(l2*cos(x(2)))];
    Jdot = [0, -l2*cos(x(2))*x(4); 0, -l2*sin(x(2))*x(4)];

    dotw = [max_speed*sin(ang);max_speed*cos(ang)]; % Pendiente de la recta
    ddotw = [0;0];
    v = invJ*(ddotw + Kd*(dotw - J*[x(3);x(4)])+Kp*(w - y)-Jdot*[x(3);x(4)]);
    u = B*v + C + N
    
    x=x+p3_f(x,u)*dt % Euler
    %dt*(0.25*e_5p13_f(x,u)+0.75*(e_5p13_f(x+dt*(2/3)*e_5p13_f(x,u),u))); % Runge-Kutta
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
       problem_draw(x,w); 
       frame_counter =0;
    end
end;