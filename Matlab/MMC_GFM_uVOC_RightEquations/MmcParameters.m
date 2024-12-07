%% MmcParameters.m -- define the parameters for mmc.
% Project: Grid-forming Control of MMC - Case: uVOC Control of MMC

close;
clear;
clc;

% SPS Simulation time step(s)      
Ts_Power = 1e-5;

%% MMC Submodule Parameters:
% Number of power module per half-arm                 
Nb_PM = 20;
% Nominal DC voltage of one module (V)                   
Vnom_PM = 4.8e3;    
% Power module capacitor (F)             
C_PM = 8e-2; 
% Initial capacitor DC voltage (V)               
Vc_Initial = Vnom_PM;
% Maximum allowed capacitor voltage unbalance (%)
SigmaM = 10;

%% AC Grid Parameters:
% Nominal system frequency (Hz)
Fnom = 50; 
% Norminal ph-ph voltage (Vrms)
Vnom_AC = 40e3;
% Rated power (VA)
Snom = 80e6;
% Rated power factor (/)
cosphi = .95;
% Norminal impedance (Ohm)
Zn = Vnom_AC^2 / Snom;
% Short circuit Ratio (/)
SCR = 10;

%% DC Source Parameters:
% Nominal voltage plus DC source          
VDCp = 48e3; 
% Nominal voltage minus DC source  
VDCm = 48e3;   

%% Base values for normalizing:
V_b = Vnom_AC; %Vrms base
I_b = Snom/Vnom_AC/sqrt(3); %Irms base
Ipp_b = Snom/Vnom_AC/sqrt(3/2); %Ipp base
Z_b = Zn; %Z base
w_b = 2*pi*Fnom; %w base
f_b = Fnom; %f base
L_b = Z_b/w_b; %L base

%% Bridge Arm Parameters:
% inductance (H)
L0 = .25 * L_b; 
% resistance (Ohm)
R0 = .1;   

%% Switches parameters:
Ron = 1e-3;
Rs = 1e6;
Cs = inf;
fs = 1000; % switching frequency [Hz]

%% Outer current control loop:
L = L0/2; 
R = R0/2; 
tau_sw = Ts_Power;
alpha_i = (pi/2 - 85/180*pi) / tau_sw; 
kpout = L*alpha_i;
kiout = R*alpha_i;

%% voltage loop
% alpha_p = 1000;
% kpp = alpha_p / alpha_i;
% kip = alpha_p;
kpp = 1.5;
kip = 500;

%% Circulating current control loop:
alpha_ic = (pi/2 - 87/180*pi) / tau_sw; 
kpcir = L0*alpha_ic;
kicir = R0*alpha_ic;

%% VOC parameters:
N = 1;

% nominated
V0 = 1; % nominal L-N RMS voltage
P_rated = cosphi; % Rated real power
Q_rated = sqrt(1-cosphi^2); % Rated reactive power

delta_wmax = pi; 
Vmax = 1.05*V0;

phi_r = pi/2;

%Old equations
eta = N*delta_wmax*Vmax^2/(P_rated*sin(phi_r)-Q_rated*cos(phi_r));
mu = eta*4/((2*Vmax^2-V0^2)^2-V0^4)*(P_rated*cos(phi_r)+Q_rated*sin(phi_r))/N;

%New equations
% eta = delta_wmax*2*Vmax^2/P_rated;
% mu = eta*4*Q_rated/((2*Vmax^2-V0^2)^2-V0^4);
open("Mmc.slx")
