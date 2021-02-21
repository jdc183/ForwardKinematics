q = sym('q%d', [n 1]);
a = [.145;1.15;.25;0;0;0];
d = [.540;0;0;-1.812;0;-0.1];
alpha = [3*pi/2;-pi;-pi/2;pi/2;3*pi/2;pi];
theta = q + [0;-pi/2;0;0;0;0];

motoman = kinchain(q,a,d,alpha,theta);
q1 = [.876744; 0.784691; 0.219304; 0.168016; 1.68849; 4.65091];
A1 = motoman.computePose(q1)
q2 = q1;
q2(4) = q1(4)-pi;
q2(5) = -q1(5);
q2(6) = q1(6)-pi;
A2 = motoman.computePose(q2)
motoman.visualizePose(q2);
