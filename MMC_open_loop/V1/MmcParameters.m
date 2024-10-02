%% MmcParameters.m -- define the parameters for mmc.
%Project: Grid-forming Control of MMC - Case: Grid-following Control of MMC

close;
clear;
clc;

% SPS Simulation time step(s)      
Ts_Power = 5e-6;

%% MMC Submodule Parameters:
% Number of power module per half-arm                 
Nb_PM = 20;
% Nominal DC voltage of one module (V)                   
Vnom_PM = 4e3;    
% Power module capacitor (F)             
C_PM = 8e5; 
% Initial capacitor DC voltage (V)               
Vc_Initial = Vnom_PM;  

%% AC Grid Parameters:
% Nominal system frequency (Hz)
Fnom = 50; 
% inductance (H)
Lac = 32e-3;
% resistance (Ohm)
Rac = 1;
% Norminal ph-ph voltage (Vrms)
Vnom_AC = 44e3;
% Rated power (VA)
Snom = 80e6;
%Rated power factor (/)
cosphi = .95;

%% DC Source Parameters:
% Nominal voltage plus DC source          
VDCp = 80e3; 
% Nominal voltage minus DC source  
VDCm = 80e3;   

%% Bridge Arm Parameters:
% inductance (H)
L0 = 1e-3;
% resistance (Ohm)
R0 = .1;

%% Modulator Parameters:
% Carriers frequency (Hz)
Fc = Fnom * 4;       

%% Switches parameters:
Ron = 1e-3;
Rs = 1e6;
Cs = inf;

%% Outer current control loop:
omega = 2*pi/50e-6/2; % norminal
L = L0/2; 
R = R0/2; 
% kpout = omega*sqrt(R^2*L^2+omega^2*L^4)/sqrt(omega^2+R^2);
% kiout = kpout*(R/L);
tau_sw = 1*Ts_Power;
alpha_i = (pi/2 - 55/180*pi) / tau_sw;
kpout = L*alpha_i;
kiout = R*alpha_i;

%% Power loop
tau_sw2 = 1*Ts_Power;
alpha_p = (pi/2 - 60/180*pi) / tau_sw2;
kpp = 1/alpha_i*alpha_p;
kip = 1*alpha_p;

%% Circulating current control loop:
omegacir = 2*pi/50e-6; % norminal
kpcir = omegacir*sqrt(R0^2*L0^2+omegacir^2*L0^4)/sqrt(omegacir^2+R0^2);
kicir = kpcir*(R0/L0);

open("Mmc.slx")
