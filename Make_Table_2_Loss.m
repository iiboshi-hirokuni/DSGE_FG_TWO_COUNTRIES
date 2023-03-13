% 
%  Make Table
% 

loss_size = 1e+7;

case_model = 'sigma=0.5'
% case_model = 'sigma=1.0'
% case_model = 'sigma=2.0'

% case_model = 'current'

switch case_model
    case 'current'
       data_file = [ './cal_results/' ];
    case 'sigma=0.5'
      data_file = [ './cal_results_sigma05/' ];
    case 'sigma=2.0'
      data_file = [ './cal_results_sigma20/' ]; 
    case 'sigma=1.0'
      data_file = [ './cal_results_sigma10/' ];     
end        
        
addpath(data_file)
load( [data_file, 'loss_zlb' ]   )
load( [data_file, 'loss_FG_2' ]   )
load( [data_file, 'loss_FG_4' ]   )
load( [data_file, 'loss_FG_6' ]   )
load( [data_file, 'loss_FG_5' ]   )

sum_loss_zlb = loss_size*sum(loss_zlb);
sum_loss_FG_2= loss_size*sum(loss_FG_2); %-sum_loss_zlb
sum_loss_FG_4= loss_size*sum(loss_FG_4); %-sum_loss_zlb
sum_loss_FG_6= loss_size*sum(loss_FG_6); %-sum_loss_zlb
 sum_loss_FG_5= loss_size*sum(loss_FG_5); %-sum_loss_zlb
%  sum_loss_FG_9= loss_size*sum(loss_FG_7);
% sum_loss_FG_10= loss_size*sum(loss_FG_10); %-sum_loss_zlb

%%
sum_loss_zlb_h = loss_size*sum(loss_zlb_h);
sum_loss_FG_2_h = loss_size*sum(loss_FG_2_h); %-sum_loss_zlb_h
sum_loss_FG_4_h = loss_size*sum(loss_FG_4_h); %-sum_loss_zlb_h
sum_loss_FG_6_h = loss_size*sum(loss_FG_6_h); %-sum_loss_zlb_h
 sum_loss_FG_5_h = loss_size*sum(loss_FG_5_h); %-sum_loss_zlb_h
% sum_loss_FG_9_h = loss_size*sum(loss_FG_7_h);
% sum_loss_FG_10_h = loss_size*sum(loss_FG_10_h); %-sum_loss_zlb_h

 
 %%
sum_loss_zlb_f  = loss_size*sum(loss_zlb_f); 
sum_loss_FG_2_f = loss_size*sum(loss_FG_2_f); % - sum_loss_zlb_f
sum_loss_FG_4_f = loss_size*sum(loss_FG_4_f); % - sum_loss_zlb_f
sum_loss_FG_6_f = loss_size* sum(loss_FG_6_f); % - sum_loss_zlb_f
 sum_loss_FG_5_f = loss_size* sum(loss_FG_5_f); % - sum_loss_zlb_f
% sum_loss_FG_9_f = loss_size* sum(loss_FG_7_f);
% sum_loss_FG_10_f = loss_size* sum(loss_FG_10_f); % - sum_loss_zlb_f

 %%
 model_names = char('FG 2Q Extra', 'FG 4Q Extra',  'FG 5Q Extra',  'FG 9Q Extra','ZLB', 'FG 10Q Extra');
 
fprintf('\n\n                        [SIMULATION RESULT]');
fprintf('\n----------------------------------------------');
fprintf('\n Model        Total       Home     ');
fprintf(' Foreign ');
fprintf('\n----------------------------------------------');
fprintf('-----\n');

   
    fprintf('%s %10.2f %10.2f %10.2f \n' ,...
         model_names(5,:), [ sum_loss_zlb,  sum_loss_zlb_h, sum_loss_zlb_f ] );
     fprintf('%s %10.2f %10.2f %10.2f \n' ,...
         model_names(1,:), [ sum_loss_FG_2,  sum_loss_FG_2_h, sum_loss_FG_2_f ] );
     fprintf('%s %10.2f %10.2f %10.2f \n' ,...
         model_names(2,:), [ sum_loss_FG_4,  sum_loss_FG_4_h, sum_loss_FG_4_f ] );
     fprintf('%s %10.2f %10.2f %10.2f \n' ,...
         model_names(3,:), [ sum_loss_FG_6,  sum_loss_FG_6_h, sum_loss_FG_6_f ] );
      fprintf('%s %10.2f %10.2f %10.2f \n' ,...
          model_names(4,:), [ sum_loss_FG_5,  sum_loss_FG_5_h, sum_loss_FG_5_f ] );
%       fprintf('%s %10.2f %10.2f %10.2f \n' ,...
%          model_names(6,:), [ sum_loss_FG_10,  sum_loss_FG_10_h, sum_loss_FG_10_f ] );
     

fprintf('-------------------------------------------------');
% fprintf('-----------------------------------');
%fclose(fileID);
 
 %%
 est_date = datestr(date); 
 result_name = ['./Output/loss_', est_date,'.txt'];          

fileID = fopen(result_name,'w');          

fprintf(fileID,'\n\n                        [SIMULATION RESULT]');
fprintf(fileID,'\n----------------------------------------------');
fprintf(fileID,'\n Model        Total       Home     ');
fprintf(fileID,' Foreign ');
fprintf(fileID,'\n----------------------------------------------');
fprintf(fileID,'-----\n');

   
    fprintf(fileID,'%s %10.2f %10.2f %10.2f \n' ,...
         model_names(4,:), [ sum_loss_zlb,  sum_loss_zlb_h, sum_loss_zlb_f ] );
     fprintf(fileID,'%s %10.2f %10.2f %10.2f \n' ,...
         model_names(1,:), [ sum_loss_FG_2,  sum_loss_FG_2_h, sum_loss_FG_2_f ] );
     fprintf(fileID,'%s %10.2f %10.2f %10.2f \n' ,...
         model_names(2,:), [ sum_loss_FG_4,  sum_loss_FG_4_h, sum_loss_FG_4_f ] );
     fprintf(fileID,'%s %10.2f %10.2f %10.2f \n' ,...
         model_names(3,:), [ sum_loss_FG_6,  sum_loss_FG_6_h, sum_loss_FG_6_f ] );
%      fprintf(fileID,'%s %10.2f %10.2f %10.2f \n' ,...
%          model_names(5,:), [ sum_loss_FG_9,  sum_loss_FG_9_h, sum_loss_FG_9_f ] );
%       fprintf(fileID,'%s %10.2f %10.2f %10.2f \n' ,...
%          model_names(6,:), [ sum_loss_FG_10,  sum_loss_FG_10_h, sum_loss_FG_10_f ] );
     

fprintf(fileID,'-------------------------------------------------');
% fprintf(fileID,'-----------------------------------');
fclose(fileID);
