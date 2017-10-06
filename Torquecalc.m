v = 0:0.1:30;
w = v/0.275;
f = (w/(2*3.14))*60; %frequency in rpm
kmph = v*18/5;
m = 340;
g = 9.81;
mu = 0.005;
cd = 0.19;
a = 1.6;
theta = 0;
rho = 1.1;
vsq = v.*v;
vc = v.*v.*v;
eta = 0.95;
P = ((rho*cd*a*vc/6)+(m*g*v*(mu + 0.05*0.25+ sin(theta))))/eta;
subplot(2,2,1)
plot(kmph, P);
xlabel('velocity in km per hour');
ylabel('Power in Watts');
subplot(2,2,2)
T = ((0.5*rho*cd*a*0.275*0.275*0.275*(w.*w)) + (0.275*m*g*(mu + sin(theta))))/eta;
plot(f, T);
xlabel('RPM');
ylabel('Torque Nm');

