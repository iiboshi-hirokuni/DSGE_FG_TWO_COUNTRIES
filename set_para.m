% //setting parameters
alpha_h = 0.66;  %//0.75;   // Calvo pricing parameter
alpha_f = 0.66;  %//0.75;   // Calvo pricing parameter
betta   = 0.98;  %  // discount factor
sigma   = 2.0;   %  // relative risk aversion coefficient
omega_h = 0.0125;  % price index
omega_f = 0.0125;  %  price index
gamma   = 0.5;     % ratio of foreign country size
eta     = 1.5;     % Frish elasticity of labour supply

rho_rh = 0.8;
rho_rf = 0.8;

psi_r_h = 0.0;
psi_pi_h= 1.75;
psi_x_h = 0.5;
psi_r_f = 0.0;
psi_pi_f= 1.75;
psi_x_f = 0.5;

save('calib_para.mat')