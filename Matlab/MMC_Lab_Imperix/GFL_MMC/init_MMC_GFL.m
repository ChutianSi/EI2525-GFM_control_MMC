%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialization for ImperixModel_MMC_GFL.slx
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fs = 20000;
Ts = 1/fs;

N = 2;
Ron = 0.03;
Rs = 1e6;
Cs = inf;
Cm = 0.55e-3;
Cmo = 0.55e-3*ones(4,3);
Ch = 0.94e-6*ones(4,3);
Rdis = 1e6*ones(4,3);
Rm = 0.2./(2*pi*120*Cmo);
Rh = (1e-3)./(2*pi*1000*Ch);
L = 4.67e-3+5e-3;
R = 0.1+0.5;
Larm = L*ones(3,2);
Rarm = R*ones(3,2);

%%Additional parameters
% Norminal ph-ph voltage (Vrms)
Vnom_AC = 450;
Vs = Vnom_AC;
% Rated power (VA)
Snom = 9000;
% Norminal impedance (Ohm)
Zn = Vnom_AC^2 / Snom;
%Vdc nominal
vr = 600;
% Short circuit Ratio (/)
SCR = 10;

%% Base values for normalizing:
Fnom = 50;
V_b = Vnom_AC; %Vrms base
I_b = Snom/Vnom_AC/sqrt(3); %Irms base
Ipp_b = Snom/Vnom_AC/sqrt(3/2); %Ipp base
Z_b = Zn; %Z base
w_b = 2*pi*Fnom; %w base
f_b = Fnom; %f base
L_b = Z_b/w_b; %L base

% SPS Simulation time step(s)      
Ts_Power = Ts;

%% Outer current control loop:
Lo = L/2; 
Ro = R/2; 
tau_sw = Ts_Power;
alpha_i = (pi/2 - 75/180*pi) / tau_sw;
kpout = Lo*alpha_i;
kiout = Ro*alpha_i;

%% Power loop
alpha_p = 100;
kpp = alpha_p / alpha_i;
kip = alpha_p;

%%Reference power
Pref_val = 0.3;
Qref_val = 0.1;

%% Circulating current control loop:
alpha_ic = (pi/2 - 87/180*pi) / tau_sw;
kpcir = L*alpha_ic;
kicir = R*alpha_ic;

open("ImperixModel_MMC_GFL.slx")