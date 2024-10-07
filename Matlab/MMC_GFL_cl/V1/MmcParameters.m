%% MmcParameters.m -- define the parameters for mmc.
% Project: Grid-forming Control of MMC - Case: Grid-following Control of MMC

close;
clear;
clc;

% SPS Simulation time step(s)      
Ts_Power = .5e-5;

%% MMC Submodule Parameters:
% Number of power module per half-arm                 
Nb_PM = 20;
% Nominal DC voltage of one module (V)                   
Vnom_PM = 4e3;    
% Power module capacitor (F)             
C_PM = 5e-3; 
% Initial capacitor DC voltage (V)               
Vc_Initial = Vnom_PM;
% Maximum allowed capacitor voltage unbalance (%)
SigmaM = 10;

%% AC Grid Parameters:
% Nominal system frequency (Hz)
Fnom = 50; 
% % inductance (H)
% Lac = 32e-3;
% % resistance (Ohm)
% Rac = 1;
% Norminal ph-ph voltage (Vrms)
Vnom_AC = 44e3;
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
VDCp = 40e3; 
% Nominal voltage minus DC source  
VDCm = 40e3;   

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
L0 = .2 * L_b;
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
L = L0/2; 
R = R0/2; 
tau_sw = Ts_Power;
alpha_i = (pi/2 - 50/180*pi) / tau_sw;
kpout = L*alpha_i;
kiout = R*alpha_i;

%% Power loop
alpha_p = 300;
kpp = alpha_p / alpha_i;
kip = alpha_p;

%% Circulating current control loop:
alpha_ic = (pi/2 - 75/180*pi) / tau_sw;%tau_sw;
kpcir = L0*alpha_ic;
kicir = R0*alpha_ic;

open("Mmc.slx")
