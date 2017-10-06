%% CODE FOR EV
clc

%% CAR Requirements
requiredGradability=22;
speedOnGrade=5;
maxVehicleSpeed=43;
maxAcc=0;

%% Vehicle Data
GVW=1650;
Crr=0.0141;
Cd =0.6;
Af=2.4;
rho=1.18;
transmissionEfficiency=0.95;
gearRatio=12.94;
%tyreSize=155R13LT;
dynamicRadius=0.279;
evRange=100;
batteryVoltage=120; %given
etaMotor=0.95;
chargingTime=6; %in hour

%% Peak Motor Torque Estimations
requiredGrade=atan(requiredGradability/100)*180/pi;
motorSpeedOnGrade=((speedOnGrade/3.6)/dynamicRadius)*gearRatio;
motorRPMGrade=motorSpeedOnGrade*60/(2*pi);


%peakFtr=3707.73;
gradDegree=(atan(requiredGradability/100)*180)/pi;
F_grad=9.81*GVW*sin((gradDegree*pi)/180);
speedMS=speedOnGrade/3.6;
F_dr=0.5*rho*Cd*Af*(speedMS)*(speedMS);
F_rr=9.81*GVW*Crr;
F_acc=GVW*maxAcc;
peakFtr=F_grad+F_dr+F_rr+F_acc;


requiredPeakTorque=peakFtr*dynamicRadius/(transmissionEfficiency*gearRatio)

%% Peak Motor Speed Estimations

maxVehicleSpeed;
motorSpeedMax=((maxVehicleSpeed/3.6)/dynamicRadius)*gearRatio;
motorRPMMax=motorSpeedMax*60/(2*pi);

correctedMotorRPMMax=1*motorRPMMax;
baseMotorSpeed=correctedMotorRPMMax/4;

requiredPeakPower=requiredPeakTorque*(2*pi)*baseMotorSpeed/(60*1000)

%% Continuos Power Estimations
%continousFtr=349.44
speedMS=maxVehicleSpeed/3.6;
F_dr=0.5*rho*Cd*Af*(speedMS)*(speedMS);
F_rr=9.81*GVW*Crr;
F_acc=GVW*maxAcc;
continousFtr=F_dr+F_rr+F_acc;

requiredContinousTorque=continousFtr*dynamicRadius/(transmissionEfficiency*gearRatio)
requiredContinousPower=requiredContinousTorque*(2*pi)*motorRPMMax/(60*1000)

%% ME to EE Conversion
currentRequired=requiredPeakPower/(batteryVoltage*etaMotor)

%% Maximum Battery Capacity
DoD_Peukert=1.32;
timeTravel=evRange/speedOnGrade; %hour 
batteryCapacityAh=DoD_Peukert*currentRequired*timeTravel %Ah
batteryCapacityWh=DoD_Peukert*batteryVoltage*currentRequired*timeTravel %Wh

%% Charger Rating :: Constant Voltage Charging
chargerCurrent=batteryCapacityWh/(batteryVoltage*chargingTime)
chargerVoltage=batteryVoltage
