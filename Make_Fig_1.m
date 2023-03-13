clear all

addpath('.\toolkit_460')
%%

% case_model = 'sigma=2.0'
case_model = 'sigma=0.5'
% case_model = 'sigma=1.0'
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


%%
  load( [data_file  'IRF_ZLB' ]);
  load( [data_file  'IRF_FG_2' ]) ;  line1_fg2 = line1_fg;
  load( [data_file  'IRF_FG_4' ]) ;  line1_fg5 = line1_fg;
  load( [data_file  'IRF_FG_6' ]);   line1_fg10 = line1_fg; 
  

 
  titlelist = char('Home inflation','Foreign inflation','Home output gap','Foreign output gap','Home policy rate'...
     ,'Foreign policy rate','Home natural rate','Foreign natural rate');
 percent = 'percent';
 ss = 'deviation from SS';
 value = 'value';
 ylabels = char(percent,percent,percent,percent,percent,percent,percent,percent);
 figtitle = '';
 figlabel= '';
legendlist = cellstr(char('FG of 2 extra qtrs','FG of 4 extra qtrs','FG of 6 extra qtrs','ZLB'));
 
%  line1_fg=100*[pi_h_piecewise,pi_f_piecewise,x_h_piecewise,x_f_piecewise,r_h_piecewise-istar,r_f_piecewise-istar,...
%      nrs_h_piecewise nrs_f_piecewise];
%  line2_c=100*[pi_h_linear,pi_f_linear,x_h_linear,x_f_linear, r_h_linear-istar,r_f_linear-istar,...
%      nrs_h_linear,nrs_f_linear];
% 
% makechart9(titlelist,legendlist,figtitle,-1000,ylabels,line1_c,line2_c);

switch case_model
     case 'sigma=0.5'
       graph= char("IRF_FG_FG");
     case 'sigma=2.0'
       graph= char("IRF_FG_FG");
    case 'sigma=2.0 & nr shock'
       graph= char("IRF_FG_sigma_20");
    case 'sigma=1.0 & nr shock'
       graph= char("IRF_FG_sigma_10");
    case 'sigma=0.5 & nr shock'
       graph= char("IRF_FG_sigma_05");   
end   

makechart(titlelist,legendlist,figlabel,ylabels,line1_fg2,line1_fg5,line1_fg10,line1_zlb,'IRF_FG_FG');

 