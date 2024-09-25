%% MmcParameters.m -- define the parameters for mmc.
% C.SI @25, Sep.

close;
clear;
clc;

% Nominal system frequency (Hz)
    Fnom = 50; 
% Number of power module per half-arm                 
    Nb_PM = 20;
% Nominal DC voltage of one module (V)                   
    Vnom_PM = 1000;    
% Nominal voltage plus DC source          
    VDCp = (Nb_PM * Vnom_PM) / 2; 
% Nominal voltage minus DC source  
    VDCm = (Nb_PM * Vnom_PM) / 2;   
% Power module capacitor (F)             
    C_PM = 1e9; 
% Initial capacitor DC voltage (V)               
    Vc_Initial = Vnom_PM;  
% SPS Simulation time step(s)      
    Ts_Power = 10e-6;           

% Modulator Parameters:
% Carriers frequency (Hz)
    Fc = Fnom * 3;       

% Switches parameters:
Ron = 1e-3;
Rs = 1e6;
Cs = inf;

open("Mmc.slx")