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

% Initial state, tantos decimales son necesarios para la velocidad
x = [-0.16143782776614764762540393840982;
     0.84806207898148100805294433899842;
     0;
     0];

dt = 0.001;
frame_counter=0;
t=0;

square = [1,1];
Kp = 10*diag(square);
Kd = 5*diag(square);

w = [1;0.75];
y = [x(1)+r1+l2*cos(x(2)); l2*sin(x(2))]

for t=0:dt:30
    % Comprobar si se ha llegado al objetivo para cambiarlo
    % Es necesario el margen porque sino nunca entra
    if (y(1) >= 0.99 && y(1) <= 1.01 && y(2) >= 0.74 && y(2) <= 0.76 && x(3) >= -0.01 && x(3) <= 0.01 && x(4) >= -0.01 && x(4) <= 0.01)
        w = [1.5;-0.75];
    elseif (y(1) >= 1.49 && y(1) <= 1.51 && y(2) >= -0.76 && y(2) <= -0.74 && x(3) >= -0.01 && x(3) <= 0.01 && x(4) >= -0.01 && x(4) <= 0.01)
        w = [1;0.75];
    end

    B = [m1+m2, -m2*d2*sin(x(2)); -m2*d2*sin(x(2)), I2+m2*d2*d2]
    C = [-m2*d2*cos(x(2))*x(4)*x(4); 0];
    N = [0;m2*g*d2*cos(x(2))];

    y = [x(1)+r1+l2*cos(x(2)); l2*sin(x(2))]

    J = [1, -l2*sin(x(2)); 0,  l2*cos(x(2))];
    invJ = [1, sin(x(2))/cos(x(2)); 0,  1/(l2*cos(x(2)))];
    Jdot = [0, -l2*cos(x(2))*x(4); 0, -l2*sin(x(2))*x(4)];

    dotw = 0;
    ddotw = 0;
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
