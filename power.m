%Variables
t1=20e-3;t2=60e-3;N=1000;f=50;
t=linspace(t1,t2,N);
Vmax = 10; %Peak Voltage
Imax = 2; %Peak Current
f = 50; %Frequency in Hertz
omega = 2 * pi * f;
phi_default = -pi/4; %Constant for phase difference

%Equations
Vsrc = Vmax * sin(omega * t); %Equation for Voltage
Isrc = Imax * sin((omega * t) + phi_default); %Equation for Current
Psrc = Vsrc .* Isrc; %Equation for Power

%Plotting the result
   %Window 1
figure
h(1)=subplot(2,2,1);
plot(t,Vsrc, 'b'); %Plotting Voltage, Current and Power


h(2)=subplot(2,2,4  );
plot(t,Isrc, 'r')

