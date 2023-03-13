%%  Calculation Walfare 
load('./cal_results/loss_zlb.mat');
load('./cal_results/loss_FG_2.mat');
load('./cal_results/loss_FG_5.mat');
load('./cal_results/loss_FG_9.mat');
% load('./cal_results/loss_Disc.mat');

% sum_loss_zlb =sum(loss_zlb)
% sum_loss_FG_2=sum(loss_FG_2)-sum_loss_zlb
% sum_loss_FG_2=sum(loss_FG_2)-sum_loss_zlb
% sum_loss_FG_5=sum(loss_FG_5)-sum_loss_zlb

h_loss= figure('Name','Loss Function ','File','loss_ts_FG_FG');
subplot(3,1,1)
ti = linspace(0,22,23);
   plot(ti ,loss_FG_2,  'b--','LineWidth',2) ;
hold on
   plot(ti ,loss_FG_5,  'k:','LineWidth',2) ;
   plot(ti ,loss_FG_9,  'b-','LineWidth',2) ;
    plot(ti ,loss_zlb, 'r-.', 'LineWidth',2) ;
%     plot(ti ,loss_Disc, 'b:', 'LineWidth',2) ;
hold off
 title('Loss of Total of Two Countries ', 'FontSize',14)
% xlabel('Time', 'FontSize',14)
  set(gca,'Fontsize',12)
  xlim([0 12])
 legend({'FG of 2 extra qtrs','FG of 5 extra qtrs','FG of 9 extra qtrs','ZLB'}, 'FontSize',12,'Location','best')

%%
% sum_loss_zlb_h=sum(loss_zlb_h);
% sum_loss_FG_2_h=sum(loss_FG_2_h)-sum_loss_zlb_h
% sum_loss_FG_2_h=sum(loss_FG_2_h)-sum_loss_zlb_h
% sum_loss_FG_5_h=sum(loss_FG_5_h)-sum_loss_zlb_h

subplot(3,1,2)
% ti = linspace(0,12,13);
%figure('Name','Loss Function of Forward Guidance')
   plot(ti ,loss_FG_2_h,  'b--','LineWidth',2) ;
hold on
   plot(ti ,loss_FG_5_h,  'k:','LineWidth',2) ;
   plot(ti ,loss_FG_9_h,  'b-','LineWidth',2) ;
   plot(ti ,loss_zlb_h, 'r-.', 'LineWidth',2) ;
%    plot(ti ,loss_Disc_h, 'b:.', 'LineWidth',2) ;
hold off
 title('Loss of Home Country', 'FontSize',14)
% xlabel('Time', 'FontSize',14)
%  ylim([-1.4e-6 0.1e-6])
  set(gca,'Fontsize',12)
  xlim([0 12])
% legend({'FG 1Q Extra', 'FG 2Q Extra',  'FG 3Q Extra','ZLB'}, 'FontSize',14)
 
 %%
% sum_loss_zlb_f=sum(loss_zlb_f) 
% sum_loss_FG_2_f=sum(loss_FG_2_f) - sum_loss_zlb_f
% sum_loss_FG_5_f=sum(loss_FG_2_f) - sum_loss_zlb_f
% sum_loss_FG_5_f=sum(loss_FG_5_f) - sum_loss_zlb_f

subplot(3,1,3)
% ti = linspace(0,12,13);
%figure('Name','Loss Function of Forward Guidance')
   plot(ti ,loss_FG_2_f,  'b--','LineWidth',2) ;
hold on
   plot(ti ,loss_FG_5_f,  'k:','LineWidth',2) ;
   plot(ti ,loss_FG_9_f,  'b-','LineWidth',2) ;
   plot(ti ,loss_zlb_f, 'r-.', 'LineWidth',2) ;
%    plot(ti ,loss_Disc_f, 'b:.', 'LineWidth',2) ;
hold off
 title('Loss of Foreign Country', 'FontSize',14)
xlabel('Quarters', 'FontSize',14)
  set(gca,'Fontsize',12)
  xlim([0 12])
  
 %legend({'FG 1Q Extra', 'FG 2Q Extra',  'FG 3Q Extra','ZLB'}, 'FontSize',14,'Location','best')
 
 savefig(h_loss, './Output/loss_ts.fig')
