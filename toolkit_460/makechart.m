function makechart(titlelist,legendlist,figlabel,ylabels,zdata1,zdata2,zdata3,zdata4,file_name)

titlelist = char(strrep(cellstr(titlelist),'_','.'));

ndsets=3;       % default, changed below as applicable
if nargin==5
    zdata2=nan*zdata1;
    zdata3=nan*zdata1;    
    ndsets =1;
     file_name = 'IFR';
elseif nargin == 6
    zdata3 =nan*zdata1;
    zdata4 =nan*zdata1;
    ndsets=2;
     file_name = 'IFR';
elseif nargin == 7
%     zdata3 =nan*zdata1;
    zdata4 =nan*zdata1;
    ndsets=2;    
    file_name = 'IFR';
elseif nargin == 8
    file_name = 'IFR';    
elseif ((nargin>10) | (nargin <=4))
    error ('makechart takes 5 to 6 arguments')
end


figure('Name',file_name,'File',file_name);


nobs = size(zdata1,1);
xvalues = (1:nobs)';

nvars = size(titlelist,1);
if nvars==1 
    nrows=1;
    ncols = 1;
elseif nvars==2
    nrows =2;
    ncols = 1;
elseif (nvars == 3 || nvars ==4)
    nrows = 2;
    ncols =2;
elseif (nvars==5 || nvars ==6)
    nrows = 3;
    ncols = 2;
elseif (nvars==7 || nvars==8)
    nrows = 4;
    ncols = 2;
elseif (nvars==9 || nvars==10)
    nrows = 5;
    ncols = 2;
else 
    error('too many variables (makechart)')
end

for i = 1:nvars
    subplot(nrows,ncols,i)
    h1=plot(xvalues,zdata1(:,i),'b-','linewidth',2); hold on
    h1=plot(xvalues,zdata2(:,i),'r--','linewidth',2); hold on
    h2=plot(xvalues,zdata3(:,i),'m-.','LineWidth',1.5);
    h3=plot(xvalues,zdata4(:,i),'k:','LineWidth',1.5);
    [x0 x1 y10 y11] = pickaxes(xvalues,zdata1(:,i));
    [x0 x1 y20 y21] = pickaxes(xvalues,zdata2(:,i));
    [x0 x1 y30 y31] = pickaxes(xvalues,zdata3(:,i));
    [x0 x1 y40 y41] = pickaxes(xvalues,zdata4(:,i));
    y0 = min([y10,y20,y30,y40]);
    y1 = max([y11,y21,y31,y41]);
    if y0==y1
        y1=y0+1;
    end
    
    axis([x0 x1 y0 y1]);
   % set(h1);

    if i==nvars && isempty(legendlist)==0
        legend(legendlist,'Box','off')
        text('String',figlabel,'Units','normalized','Position',[1.2 1.24],...
       'FontSize',14,'FontWeight','bold','HorizontalAlignment','center');
    end
 
    if i==nvars | i==nvars-1
        %xlabel('Time');
        xlabel('Quarters');
    end
%     set(gca,'XTick',xtick)
%     set(gca,'XTickLabel',xticklabel)
    
    title([num2str(i),'. ',titlelist(i,:)]);
    ylabel(ylabels(i,:));
    
    set(gca,'FontSize',12);
end

% sets printing preferences
%printpref
