clear
close
clc

Ts = 5e-05; % [s] simulation time step
Tend = 10;  % [s] simulation ending time

Ug = 220;                   % [V] grid line to ground voltage
Fg = 50;                    % [Hz] grid frequency
Udc = 800;                  % [V] dc link voltage
Fsw = 2.5e3;                % [Hz] converter frequency
Pn = 120;                   % [kW] nominal power
Zn = 3*Ug^2 / Pn/1e3;       % [Ohm] nominal impedance
Jn = 2*Pn*1e3/(Fg*2*pi)^2;  % [kg*m^2] nominal inertia
Rf = 1.815e-3;
Cf = 1.3157e-4;
Lf = 5.7773e-4;
Zf = Rf + 1j*2*pi*Lf;

Z1 = .09 + 1j*.12;          % [Ohm] converter 1 line impedance
Z3 = .1 + 1j*1.5;           % [Ohm] ac grid line impedance
ZL = 3*Ug^2/(42+1j*16)/1e3; % [Ohm] load impedance

% PI regulation
tau_sw = 1.5/Fsw;
alpha_i = (pi/2 - 75/180*pi) / tau_sw;
Kpi = Lf*alpha_i / Zn;
Kii = Rf*alpha_i / Zn;

alpha_v = tan(pi/2-89.7/180*pi)*alpha_i;
Kpv = alpha_v*sqrt(alpha_v^2+alpha_i^2)/alpha_i *Zn;

J0 = 3.0/Jn;                % [\] initial virtual inertia
Dp0 = 3;                    % [\] initial damping factor
Kj = 30;
Kd = 150;
X = imag(Z1+Zf+Z3+(Z1+Zf)*Z3/ZL)/Zn;
zeta = (4/2/pi+Dp0*1)/2 / sqrt(J0*2*pi*1.05/X);
Pmax = 1.05/X;
wn = sqrt(1*1.05/J0/2/pi/X);

open("./simVSG.slx");
