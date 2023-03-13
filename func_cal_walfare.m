function [ loss,  loss_home, loss_fore ]  = func_cal_walfare(P, pi_h, pi_f, x_h, x_f, r_h, r_f)

 
% optimal policy
 lambda_h = (1-P.alpha_h)*(1-P.alpha_h*P.betta)/P.alpha_h;
 lambda_f = (1-P.alpha_f)*(1-P.alpha_f*P.betta)/P.alpha_f;
 lambda   = (1-P.gamma)/lambda_h + P.gamma/lambda_f;
  phi      =  1 - (1 - P.gamma)/lambda_h/lambda;
  kappa_h  = (1-P.alpha_h)*(1-P.alpha_h*P.betta)*P.omega_h/P.alpha_h ...
              *(P.sigma+P.eta-P.gamma*(P.sigma-1));
  kappa_f  = (1-P.alpha_f)*(1-P.alpha_f*P.betta)*P.omega_f/P.alpha_f ...
              *(P.sigma+P.eta-(1-P.gamma)*(P.sigma-1));
  alpha_h_x = kappa_h/P.theta;
 alpha_f_x = kappa_f/P.theta;
 alpha_h_r = P.eta_h_r/(P.nu_h*P.theta);
 alpha_f_r = P.eta_f_r/(P.nu_f*P.theta);
 alpha_h_del = (1-P.omega_h)/(P.omega_h*P.alpha_h);
 alpha_f_del = (1-P.omega_f)/(P.omega_f*P.alpha_f);
 Big_gamma  = 2*(1-P.gamma)*P.gamma*(1-P.sigma)/(lambda*P.theta);


 del_pi_h =  pi_h(1:end) - [0;  pi_h(1:end-1)];
 del_pi_f =  pi_f(1:end) - [0;  pi_f(1:end-1)];
 
  loss_home = (1-phi).*(pi_h.^2 + alpha_h_x.*x_h.^2 + alpha_h_r.*r_h.^2 + alpha_h_del * del_pi_h .^2  );
  
  loss_fore = phi.* (pi_f.^2 + alpha_f_x.*x_f.^2 + alpha_f_r.*r_f.^2 + alpha_f_del * del_pi_f .^2  );
 
  loss = (1-phi).*(pi_h.^2 + alpha_h_x.*x_h.^2 + alpha_h_r.*r_h.^2 + alpha_h_del * del_pi_h .^2  ) ...
         + phi.* (pi_f.^2 + alpha_f_x.*x_f.^2 + alpha_f_r.*r_f.^2 + alpha_f_del * del_pi_f .^2  );
     
%     figure(100)     
%      plot(pi_h.^2)
%      hold on
%       plot((1-phi).*alpha_h_x.*x_h.^2)
%       plot((1-phi).*alpha_h_r.*r_h.^2)
%       plot((1-phi).*alpha_h_del * del_pi_h .^2)
%      hold off 

figure(200)     
     plot(pi_f.^2)
     hold on
      plot((phi).*alpha_f_x.*x_f.^2)
      plot((phi).*alpha_f_r.*r_f.^2)
      plot((phi).*alpha_f_del * del_pi_f .^2)
     hold off 
     legend('pi','x','r','pi^2')
     
     
     