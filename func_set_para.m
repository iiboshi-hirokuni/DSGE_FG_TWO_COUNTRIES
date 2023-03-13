function para = func_set_para

global P

para(1) = P.alpha_h;  %//0.75;   // Calvo pricing parameter
para(2) = P.alpha_f;  %//0.75;   // Calvo pricing parameter
para(3) = P.betta ;  %  // discount factor
para(4) = P.sigma ;   %  // relative risk aversion coefficient
para(5) = P.omega_h;  % price index
para(6) = P.omega_f;  %  price index
para(7) = P.gamma ;     % ratio of foreign country size
para(8) = P.eta   ;     % Frish elasticity of labour supply
para(9) = P.theta ;     % elasticity of substitution


para(10) =P.rho_rh;
para(11) =P.rho_rf;

para(12) =P.psi_r_h;  %// Taylor Rule
para(13) =P.psi_pi_h;
para(14) =P.psi_x_h;
para(15) =P.psi_r_f;
para(16) =P.psi_pi_f;
para(17) =P.psi_x_f ;


para(18) = P.eta_h_r;
para(19) = P.eta_f_r;
para(20) = P.nu_h  ;
para(21) = P.nu_f  ;

para(22) = P.rho_rh;
para(23) = P.rho_rf;