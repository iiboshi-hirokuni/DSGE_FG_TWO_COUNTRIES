  
addpath('c:\dynare\4.6.0\matlab')
addpath('c:\dynare\4.6.0\matlab\occbin')
addpath('.\toolkit_460')


%%  run simulation of OccBin
runsim_TWOCON_FG_Extra2

runsim_TWOCON_FG_Extra4

runsim_TWOCON_FG_Extra6

runsim_TWOCON_FG_Extra9

runsim_TWOCON_FG_Extra10

%% Make Fig 1
Make_Fig_1

%% Make Fig 2
Make_Graph_Loss_modified

%% Make Table 2
Make_Table_2_Loss
