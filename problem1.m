% Symbolic variables for joint angles
q = sym('q%d', [6 1]);

% DH parameters:
a = [.145;1.15;.25;0;0;0];
d = [.540;0;0;-1.812;0;-0.1];
alpha = [3*pi/2;-pi;-pi/2;pi/2;3*pi/2;pi];
theta = q + [0;-pi/2;0;0;0;0];

% Create a kinchain object for the robot
motoman = kinchain(q,a,d,alpha,theta);

% Specify joint angles
q1 = [.876744; 0.784691; 0.219304; 0.168016; 1.68849; 4.65091];
% Compute a pose for those joint angles
A1 = motoman.computePose(q1)

% Alternate joint angles that should produce same flange transformation
q2 = q1;
q2(4) = q1(4)-pi;
q2(5) = -q1(5);
q2(6) = q1(6)-pi;

% Compute the pose for the alternate joint angles
A2 = motoman.computePose(q2);

% Plot the alternate pose
motoman.visualizePose(q2);
