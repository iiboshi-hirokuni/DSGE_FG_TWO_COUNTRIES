% 
%  Make Table
% 

global P

Set_Parameters

para = func_set_para;
 %%
 para_names = char('alpha_h', 'alpha_f', 'betta', 'sigma', 'omega_h', ...
                   'omega_f','gamma', 'eta', 'theta', 'rho_rh', 'rho_rf', ...
                    'psi_r_h', 'psi_pi_h', 'psi_x_h', 'psi_r_f', 'psi_pi_f', 'psi_x_f', ...
                    'eta_h_r', 'eta_f_r', 'nu_h', 'nu_f', 'rho_rh', 'rho_rf');
 
 est_date = datestr(date); 
 result_name = ['./Output/set_para_', est_date,'.txt'];          

fileID = fopen(result_name,'w');          

fprintf(fileID,'\n\n                        [SIMULATION RESULT]');
fprintf(fileID,'\n----------------------------------------------');
fprintf(fileID,'\n paramters      values     ');
fprintf(fileID,'\n----------------------------------------------');
fprintf(fileID,'-----\n');

  for i = 1:9 
     fprintf(fileID,'%s %10.4f  \n' ,...
          para_names(i,:), [ para(i) ] );
  end   
     i=12;
     fprintf(fileID,'%s %10.4f  \n' ,...
          para_names(i,:), [ para(i) ] );
     i=13;
     fprintf(fileID,'%s %10.4f  \n' ,...
          para_names(i,:), [ para(i) ] );
     i=14;
     fprintf(fileID,'%s %10.4f  \n' ,...
          para_names(i,:), [ para(i) ] );
     i=15;
     fprintf(fileID,'%s %10.4f  \n' ,...
          para_names(i,:), [ para(i) ] ); 
      
     i=16;
     fprintf(fileID,'%s %10.4f  \n' ,...
          para_names(i,:), [ para(i) ] );
     i=17;
     fprintf(fileID,'%s %10.4f  \n' ,...
          para_names(i,:), [ para(i) ] );
      i=22;
     fprintf(fileID,'%s %10.4f  \n' ,...
          para_names(i,:), [ para(i) ] );
     i=23;
     fprintf(fileID,'%s %10.4f  \n' ,...
          para_names(i,:), [ para(i) ] );

fprintf(fileID,'-------------------------------------------------');
% fprintf(fileID,'-----------------------------------');
fclose(fileID);
