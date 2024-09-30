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
Vnom_PM = 1600;    
% Power module capacitor (F)             
C_PM = 8e3; 
% Initial capacitor DC voltage (V)               
Vc_Initial = Vnom_PM;  

%% AC Grid Parameters:
% Nominal system frequency (Hz)
Fnom = 50; 
% inductance (H)
Lac = 16.58e-3;%32e-3;
% resistance (Ohm)
Rac = 1;
% Norminal ph-ph voltage (Vrms)
Vnom_AC = (Nb_PM * Vnom_PM) / 2 * sqrt(3/2);
% Rated power (VA)
Snom = 3e6;
%Rated power factor (/)
cosphi = .95;

%% DC Source Parameters:
% Nominal voltage plus DC source          
VDCp = (Nb_PM * Vnom_PM) / 2; 
% Nominal voltage minus DC source  
VDCm = (Nb_PM * Vnom_PM) / 2;   

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

%% AC current loop parameters:
L = Lac+L0/2;
R = R0/2;
open("Mmcv2.slx")
