function problem_draw(x,w)

l1=1;
l2=1;
r1 = 1/2;

xelbow = x(1) + r1;
yelbow = 0;

xtip = xelbow + l2*cos(x(2));
ytip = yelbow + l2*sin(x(2));

axis([-1 3 -1 3])

hold on;

axis square

plot(w(1),w(2),"r+")
plot([1,1.5], [0.75,-0.75],'r','LineWidth',0.1)
plot([xelbow - l1,xelbow], [0,yelbow],'b','LineWidth',0.1)
plot(xelbow,yelbow,"g+")
plot([xelbow,xtip], [yelbow,ytip],'k','LineWidth',0.1)

 drawnow;


 


                     
