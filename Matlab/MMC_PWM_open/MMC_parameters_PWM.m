%% Mmc Parameters PWM 
% Project: Grid-forming control of MMC - PWM open loop control

close;
clear;
clc;

% SPS Simulation time step(s)      
Ts_Power = 1e-5;

%% MMC Submodule Parameters:
% Number of power module per half-arm                 
Nb_PM = 20;
% Nominal DC voltage of one module (V)                   
Vnom_PM = 4.4e3;    
% Power module capacitor (F)             
C_PM = 6e-3; 
% Initial capacitor DC voltage (V)               
Vc_Initial = Vnom_PM;
% Maximum allowed capacitor voltage unbalance (%)
SigmaM = 10;


% By pass capacitor
C0 = 1e-3;
V0 = 2000;

% Switching component
Ron = 1e-3;
Rs = 1e6;
Cs = inf;

% Fundimental frequency
f0 = 50;

% Switching fre
fs = 1000;

% DC voltage
VDC = 12000;

% Arm capacitor
Larm = 10e-3;
Rarm = 1e-3;

% DC impedence

Ldc = 1e-3;
Rdc = 0.01;

%%
% Output Voltage 0-0.1

range = (out.tout >= 0) & (out.tout <= 0.1);

% Va
subplot(3, 1, 1);
plot(out.tout(range), out.Vabc.Data(range, 1));  
xlabel('Time (s)');
ylabel('Va (V)');
title('Va vs Time');

% Vb
subplot(3, 1, 2);
plot(out.tout(range), out.Vabc.Data(range, 2));    
xlabel('Time (s)');
ylabel('Vb (V)');
title('Vb vs Time');

% Vc
subplot(3, 1, 3);
plot(out.tout(range), out.Vabc.Data(range, 3));  
xlabel('Time (s)');
ylabel('Vc (V)');
title('Vc vs Time');

sgtitle('3-Phase Voltages (Va, Vb, Vc) vs Time');