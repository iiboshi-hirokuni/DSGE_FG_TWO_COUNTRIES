% 
%   Optimal monetary policy in a two-country model with the zero lower
%   bound on nominal interest rates

%   Daisuke Ida

%  The model is based on Clarida et al. (2002, JME) and Engel (2011, AER)
%  Mainly Engel (2011)

% Symmetric two country, but we allow home bias for home consumption


addpath('c:\dynare\4.6.0\matlab')
addpath('c:\dynare\4.6.0\matlab\occbin')
addpath('.\toolkit_460')


% Set_Parameters_1
Set_Parameters

% set inputs for solution below
%  The program produces responses to the shocks selected below under
%  irfshock. Paths for all the endogenous variables in the model selected
%  are produced. VariableName_piecewise holds the piece-wise linear solution for
%  VariableName.  VariableName_linear holds the linear solution for
%  VariableName.

global M_ oo_ P


% modname below chooses model
% directory. But simple param choices are made from paramfile in current
% directory.
mod00 = 'model_2_countries00'; % ZLB never binds
mod10 = 'model_2_countries10'; % home country only faces ZLB
mod01 = 'model_2_countries01'; % foreign country only face ZLB
mod11 = 'model_2_countries11'; % Both countries face ZLB


% The -0.000001 tolerance helps achieve convergence
% Without that, there would be too much back and forth switching 
% across regimes making convergence difficult. 
constraint1      = ['(r_h_difference     < istar) | (r_not_lag1_h_difference  < istar)',...
                    ' | (r_not_lag2_h_difference  < istar) | (r_not_lag3_h_difference  < istar)',...
                    ' | (r_not_lag4_h_difference  < istar) | (r_not_lag5_h_difference  < istar)',...
                    ' | (r_not_lag6_h_difference  < istar)'  ]; % effective lower bound on the nominal interest rates
                
constraint_relax1 =['(r_not_h_difference > istar) & (r_not_lag1_h_difference  > istar)', ....
                    ' & (r_not_lag2_h_difference  > istar) & (r_not_lag3_h_difference  > istar)',...
                    ' & (r_not_lag4_h_difference  > istar) & (r_not_lag5_h_difference  > istar)',...
                    ' & (r_not_lag6_h_difference  > istar)' ];

constraint2      = [ '(r_f_difference     < istar) | (r_not_lag1_f_difference  < istar)',...
                     '| (r_not_lag2_f_difference  < istar) | (r_not_lag3_f_difference  < istar)',...
                    ' | (r_not_lag4_f_difference  < istar) | (r_not_lag5_f_difference  < istar)',...
                    ' | (r_not_lag6_f_difference  < istar)'  ]; % effective lower bound on the nominal interest rates
                 
constraint_relax2 = [ '(r_not_f_difference > istar) & (r_not_lag1_f_difference  > istar)',...
                      '& (r_not_lag2_f_difference  > istar)  & (r_not_lag3_f_difference  > istar)',...
                    ' & (r_not_lag4_f_difference  > istar)  & (r_not_lag5_f_difference  > istar)',...
                    ' & (r_not_lag6_f_difference  > istar)'  ];

% Pick innovation for IRFs
% shock = 'MP_shock'; %
% shock ='nr_shock'
shock ='GL_shock'
 
switch shock
case   'MP_shock'   
     irfshock =char('eps_mp_h');    % label for innovation for IRFs
    % irfshock =char('eps_mp_f');  % needs to be an exogenous variable in the
case 'nr_shock'   
    irfshock =char('eps_rh');    % dynare .mod files
%     irfshock =char('eps_rf');
case 'GL_shock'   
    irfshock =char('eps_GL');    % dynare .mod files
end
    
maxiter = 200;     
tol0 = 1e-8;


% Option=1: impulse responses
% Option=2: random simulation

option=1;

%%%%%%%%%%%%%%%% Inputs stop here %%%%%%%%%%%%%%%%%%%%%
% 
nperiods1 = 20;

switch shock
 case 'GL_shock'
 shockssequence = [ zeros(1,1); -0.04*ones(1,1);    zeros(nperiods1,1)
    ];         % scale factor for simulations
  nperiods = size(shockssequence,1)+1;            %length of IRFs
     
case 'nr_shock'
 shockssequence = [ zeros(1,1); -0.05*ones(1,1);    zeros(nperiods1,1)
    ];         % scale factor for simulations
  nperiods = size(shockssequence,1)+1;            %length of IRFs

case 'MP_shock'
 shockssequence = [zeros(1,1); -0.02*ones(1,1);    zeros(nperiods1,1)
    ];         % scale factor for simulations
  nperiods = size(shockssequence,1)+1;            %length of IRFs
 end
%
% Solve model, generate model IRFs

[zdatalinear zdatapiecewise zdatass oobase_ Mbase_ ] = ...
          solve_two_constraints_FG(mod00,mod10,mod01,mod11,...
                               constraint1, constraint2,...
                               constraint_relax1, constraint_relax2,...
                               shockssequence,irfshock,nperiods);
                          

                          
% unpack the IRFs                          
for i=1:Mbase_.endo_nbr
  eval([deblank( cell2mat(Mbase_.endo_names(i,:))),'_linear=zdatalinear(:,i);']);
  eval([deblank( cell2mat(Mbase_.endo_names(i,:))),'_piecewise=zdatapiecewise(:,i);']);
  eval([deblank( cell2mat(Mbase_.endo_names(i,:))),'_ss=zdatass(i);']);
end


%% Modify to plot IRFs 


 titlelist = char('Home inflation','Foreign inflation','Home output gap','Foreign output gap','Home policy rate'...
     ,'Foreign policy rate','Home natural rate','Foreign natural rate');
 percent = 'percent';
 ss = 'deviation from SS';
 value = 'value';
 ylabels = char(percent,percent,percent,percent,percent,percent,percent,percent);
 figtitle = '';
 figlabel= '';
 legendlist = cellstr(char('w/ ZLB','w/o ZLB'));
 
 line1_fg=100*[pi_h_piecewise,pi_f_piecewise,x_h_piecewise,x_f_piecewise,r_h_piecewise-istar,r_f_piecewise-istar,...
     nrs_h_piecewise nrs_f_piecewise];
 line2_c=100*[pi_h_linear,pi_f_linear,x_h_linear,x_f_linear, r_h_linear-istar,r_f_linear-istar,...
     nrs_h_linear,nrs_f_linear];
% 
% makechart9(titlelist,legendlist,figtitle,-1000,ylabels,line1_c,line2_c);
makechart(titlelist,legendlist,figlabel,ylabels,line1_fg,line2_c);
%%
%  savefig('')

%%  Calculation Walfare 

% [loss_FG_1, loss_FG_1_h, loss_FG_1_f ] = func_cal_walfare(P,pi_h_piecewise,pi_f_piecewise,x_h_piecewise,x_f_piecewise,r_h_piecewise-istar,r_f_piecewise-istar );
[loss_FG_6, loss_FG_6_h, loss_FG_6_f ] = func_cal_walfare(P,pi_h_piecewise,pi_f_piecewise,x_h_piecewise,x_f_piecewise,r_h_piecewise,r_f_piecewise );

save('./cal_results/loss_FG_6.mat', 'loss_FG_6', 'loss_FG_6_h','loss_FG_6_f');
% load('loss_zlb.mat');
% 
% 
% ti = linspace(0,12,13);
% figure('Name','Loss Function of Forward Guidance')
%    plot(ti ,loss_FG,  'b-','LineWidth',2) ;
% hold on
%     plot(ti ,loss_zlb, 'r--', 'LineWidth',2) ;
% hold off
%  title('Loss of Two Countries for Forward Guidance', 'FontSize',14)
%  xlabel('Time', 'FontSize',14)
%  legend({'FG', 'ZLB'}, 'FontSize',14)

%%
 save ./cal_results/IRF_FG_6 line1_fg;
 
 %%
  load ./cal_results/IRF_ZLB
 
  titlelist = char('Home inflation','Foreign inflation','Home output gap','Foreign output gap','Home policy rate'...
     ,'Foreign policy rate','Home natural rate','Foreign natural rate');
 percent = 'percent';
 ss = 'deviation from SS';
 value = 'value';
 ylabels = char(percent,percent,percent,percent,percent,percent,percent,percent);
 figtitle = '';
 figlabel= '';
 legendlist = cellstr(char('FG  5Q Extra','ZLB'));
 
%  line1_fg=100*[pi_h_piecewise,pi_f_piecewise,x_h_piecewise,x_f_piecewise,r_h_piecewise-istar,r_f_piecewise-istar,...
%      nrs_h_piecewise nrs_f_piecewise];
%  line2_c=100*[pi_h_linear,pi_f_linear,x_h_linear,x_f_linear, r_h_linear-istar,r_f_linear-istar,...
%      nrs_h_linear,nrs_f_linear];
% 
% makechart9(titlelist,legendlist,figtitle,-1000,ylabels,line1_c,line2_c);
makechart(titlelist,legendlist,figlabel,ylabels,line1_fg,line1_zlb);
 
