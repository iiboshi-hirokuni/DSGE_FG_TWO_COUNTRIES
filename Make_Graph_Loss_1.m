% 
%  Make Table
% 

loss_size = 1e+7;

%%  Calculation Walfare 
load('./cal_results/loss_zlb.mat');
load('./cal_results/loss_FG_1.mat');
load('./cal_results/loss_FG_3.mat');
load('./cal_results/loss_FG_5.mat');
% load('loss_Disc.mat');

sum_loss_zlb = loss_size*sum(loss_zlb);
sum_loss_FG_1= loss_size*sum(loss_FG_1); %-sum_loss_zlb
sum_loss_FG_3= loss_size*sum(loss_FG_3); %-sum_loss_zlb
sum_loss_FG_5= loss_size*sum(loss_FG_5); %-sum_loss_zlb


ti = linspace(0,12,13);
figure('Name','Loss Function of Forward Guidance')
   plot(ti ,loss_FG_1,  'b--','LineWidth',2) ;
hold on
   plot(ti ,loss_FG_3,  'k:','LineWidth',2) ;
   plot(ti ,loss_FG_5,  'b-','LineWidth',2) ;
    plot(ti ,loss_zlb, 'r-.', 'LineWidth',2) ;
%     plot(ti ,loss_Disc, 'b:', 'LineWidth',2) ;
hold off
 title('Loss of Two Countries for Forward Guidance', 'FontSize',14)
 xlabel('Time', 'FontSize',14)
  set(gca,'Fontsize',12)
 legend({'FG 1Q Extra', 'FG 3Q Extra',  'FG 5Q Extra','ZLB'}, 'FontSize',14)

%%
sum_loss_zlb_h = loss_size*sum(loss_zlb_h);
sum_loss_FG_1_h = loss_size*sum(loss_FG_1_h); %-sum_loss_zlb_h
sum_loss_FG_3_h = loss_size*sum(loss_FG_3_h); %-sum_loss_zlb_h
sum_loss_FG_5_h = loss_size*sum(loss_FG_5_h); %-sum_loss_zlb_h


ti = linspace(0,12,13);
figure('Name','Loss Function of Forward Guidance')
   plot(ti ,loss_FG_1_h,  'b--','LineWidth',2) ;
hold on
   plot(ti ,loss_FG_3_h,  'k:','LineWidth',2) ;
   plot(ti ,loss_FG_5_h,  'b-','LineWidth',2) ;
   plot(ti ,loss_zlb_h, 'r-.', 'LineWidth',2) ;
%    plot(ti ,loss_Disc_h, 'b:.', 'LineWidth',2) ;
hold off
 title('Loss of Home Country for Forward Guidance', 'FontSize',14)
 xlabel('Time', 'FontSize',14)
%  ylim([-1.4e-6 0.1e-6])
  set(gca,'Fontsize',12)
 legend({'FG 1Q Extra', 'FG 3Q Extra',  'FG 5Q Extra','ZLB'}, 'FontSize',14)
 
 %%
sum_loss_zlb_f  = loss_size*sum(loss_zlb_f); 
sum_loss_FG_1_f = loss_size*sum(loss_FG_1_f); % - sum_loss_zlb_f
sum_loss_FG_3_f = loss_size*sum(loss_FG_3_f); % - sum_loss_zlb_f
sum_loss_FG_5_f = loss_size* sum(loss_FG_5_f); % - sum_loss_zlb_f


ti = linspace(0,12,13);
figure('Name','Loss Function of Forward Guidance')
   plot(ti ,loss_FG_1_f,  'b--','LineWidth',2) ;
hold on
   plot(ti ,loss_FG_3_f,  'k:','LineWidth',2) ;
   plot(ti ,loss_FG_5_f,  'b-','LineWidth',2) ;
   plot(ti ,loss_zlb_f, 'r-.', 'LineWidth',2) ;
%    plot(ti ,loss_Disc_f, 'b:.', 'LineWidth',2) ;
hold off
 title('Loss of Foreign Country for Forward Guidance', 'FontSize',14)
 xlabel('Time', 'FontSize',14)
  set(gca,'Fontsize',12)
 legend({'FG 1Q Extra', 'FG 3Q Extra',  'FG 5Q Extra','ZLB'}, 'FontSize',14)
 
 %%
 model_names = char('FG 1Q Extra', 'FG 3Q Extra',  'FG 5Q Extra','ZLB');
 
 est_date = datestr(date); 
 result_name = ['./Output/loss_', est_date,'.txt'];          

fileID = fopen(result_name,'w');          

fprintf(fileID,'\n\n                        [ESTIMATION RESULT]');
fprintf(fileID,'\n----------------------------------');
fprintf(fileID,'\n Model        Total       Home     ');
fprintf(fileID,' Foreign ');
fprintf(fileID,'\n----------------------------------');
fprintf(fileID,'-----\n');

   
    fprintf(fileID,'%s %10.4f %10.4f %10.4f \n' ,...
         model_names(4,:), [ sum_loss_zlb,  sum_loss_zlb_h, sum_loss_zlb_f ] );
     fprintf(fileID,'%s %10.4f %10.4f %10.4f \n' ,...
         model_names(1,:), [ sum_loss_FG_1,  sum_loss_FG_1_h, sum_loss_FG_1_f ] );
     fprintf(fileID,'%s %10.4f %10.4f %10.4f \n' ,...
         model_names(2,:), [ sum_loss_FG_3,  sum_loss_FG_3_h, sum_loss_FG_3_f ] );
     fprintf(fileID,'%s %10.4f %10.4f %10.4f \n' ,...
         model_names(3,:), [ sum_loss_FG_5,  sum_loss_FG_5_h, sum_loss_FG_5_f ] );
     
     

fprintf(fileID,'-----------------------------------');
% fprintf(fileID,'-----------------------------------');
fclose(fileID);
