%% MmcParameters.m -- define the parameters for mmc.
% Project: Grid-forming Control of MMC - Case: Grid-following Control of
% MMC-Lab

close;
clear;
clc;

% SPS Simulation time step(s)      
Ts_Power = 2e-6;%5e-7;%1e-5;

%% MMC Submodule Parameters:
% Number of power module per half-arm                 
Nb_PM = 2; %was 20
% Nominal DC voltage of one module (V)                   
Vnom_PM = 480/2;    %was 4.8e3
% Power module capacitor (F)             
%%C_PM = 0.55e-3+0.94e-6;% was 6e-3; 
% Initial capacitor DC voltage (V)               
Vc_Initial = Vnom_PM;
% Maximum allowed capacitor voltage unbalance (%)
SigmaM = 10;
fs = 20000; % switching frequency [Hz]
%Imperix:
Cm = 0.55e3;
Cmo = 0.55e-3*ones(4,3);
Ch = 0.94e-6*ones(4,3);
Rdis = 1e6*ones(4,3);
Rm = 0.2./(2*pi*120*Cmo);
Rh = 1e-3./(2*pi*1000*Ch);

%% AC Grid Parameters:
% Nominal system frequency (Hz)
Fnom = 50; 
% % inductance (H)
% Lac = 32e-3;
% % resistance (Ohm)
% Rac = 1;
% Norminal ph-ph voltage (Vrms)
Vnom_AC = 400; % was 40e3;
% Rated power (VA)
Snom = 20*Vnom_AC*sqrt(3); %This is to establish 20A as base current %4.89e4; %400*480;%was 80e6;
% Rated power factor (/)
cosphi = .95;
% Norminal impedance (Ohm)
Zn = Vnom_AC^2 / Snom;
% Short circuit Ratio (/)
SCR = 20;

%% DC Source Parameters:
% Nominal voltage plus DC source          
VDCp = 480/2;%was 48e3; 
% Nominal voltage minus DC source  
VDCm = 480/2;%was 48e3;   

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
L0 = (4.67e-3+5e-3); % was.2 * L_b;
% resistance (Ohm)
R0 = 0.1+0.5; %was .1;

%% Modulator Parameters:
% Carriers frequency (Hz)
Fc = Fnom * 4;       

%% Switches parameters:
Ron = 0.03; % was 1e-3;
Rs = 1e6; % was 1e6;
Cs = inf; %was inf

%% Outer current control loop:
L = L0/2; 
R = R0/2; 
tau_sw = Ts_Power;
alpha_i = (pi/2 - 75/180*pi) / tau_sw; %was 75
kpout = L*alpha_i;
kiout = R*alpha_i;

%% Power loop
alpha_p = 100;%100;
kpp = alpha_p / alpha_i;
kip = alpha_p;

%% Circulating current control loop:
alpha_ic = (pi/2 - 87/180*pi) / tau_sw;
kpcir = L0*alpha_ic;
kicir = R0*alpha_ic;

open("imperix_template.slx")
