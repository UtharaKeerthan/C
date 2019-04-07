function AcceptResultsUT
try
%Find the signal builder from the unit test model framework
root = bdroot;
SigBuildr = strcat(root,'/TestInputs/Signal Builder');


%Populate Signal Names and Group Names
[~, ~, signames, groupnames] = signalbuilder(SigBuildr);
signames = sort(signames);

%Create current variables
current_signalName = signames{1};
current_groupName = groupnames{1};


timeseries_cnt = 0;
WS_variables = evalin('base','whos');%%Get all the variables present in the workspace
Timeseries_objects = [];
Timeseries_objs = [];
Timeseries_diffObjs = [];

for cnt = 1 : length(WS_variables)%%Filter the timeseries variables alone
    if strcmp(WS_variables(cnt).class,'timeseries')
        timeseries_cnt = timeseries_cnt + 1;
        Timeseries_objects = [Timeseries_objects , WS_variables(cnt)];
    end
end 

for cnt = 1 : length(Timeseries_objects)
      Timeseries_objs = [Timeseries_objs,evalin('base',Timeseries_objects(cnt).name)];
      if strfind (Timeseries_objs(cnt).name,'_Diff')
          Timeseries_diffObjs = [Timeseries_diffObjs,Timeseries_objs(cnt)];
      end    
end

TSnames = cell(timeseries_cnt,1);%%Store the name of the timeseries objetcs in a cell array.For populating the popup menu

for cnt = 1 : timeseries_cnt
    TSnames{cnt} = Timeseries_objects(cnt).name;   
end 

    
%  Create and then hide the UI as it is being constructed.
f = figure('Visible','off','NumberTitle','off','Name','Accept Signal builder Results','MenuBar','none','Position',[360,200,750,350]);

%Creating layout manager container
%Main Flow Layout
flow_ctnr = uiflowcontainer('Units','norm', 'Position',[.03,.02,.95,.95]);
set(flow_ctnr,'FlowDirection','TopDown');

%First Grid layout
grid_one  = uigridcontainer('Units','norm','parent',flow_ctnr);
set(grid_one, 'GridSize',[3,2],'HorizontalWeight',[2,6]);

% Storing the timeseries objects and names in the grid one handle
fig_Structure = guihandles(grid_one);
fig_Structure.TS_data = Timeseries_objs;%%Store the timeseries objects    
fig_Structure.TS_names = TSnames;%%Store the timeseries names
fig_Structure.TS_diffObjects = Timeseries_diffObjs;%%Store the diff timeseries alone
fig_Structure.CurrentTSObj = Timeseries_objs(1);
fig_Structure.CurrentTSname = TSnames(1);
guidata(grid_one,fig_Structure);

%  Components in 1st grid layout
htext1     = uicontrol('Style','text','String','GROUP NAME:','Units','norm','HorizontalAlignment','center','parent',grid_one);
hpopup1    = uicontrol('Style','popupmenu','String', groupnames,'parent',grid_one,'Callback',{@hpopup1_Callback});%%Populate the group names from the signal builder
htext2     = uicontrol('Style','text','String','SIGNAL NAME:','HorizontalAlignment','center','parent',grid_one);
hpopup2    = uicontrol('Style','popupmenu','String', signames,'parent',grid_one,'Callback',{@hpopup2_Callback});%%Populate the signal names from the signal builder.
htext3     = uicontrol('Style','text','String','TIME SERIES OBJECT:','HorizontalAlignment','center','parent',grid_one);
hpopup3    = uicontrol('Style','popupmenu','String',fig_Structure.TS_names,'parent',grid_one,'Tag','PopUp3','Callback',{@hpopup3_Callback});%%Populate the timeseries objects from the workspace

% Second Grid layout
grid_two = uigridcontainer('Units','norm','parent',flow_ctnr);
set(grid_two,'GridSize',[1,3],'Margin',30);

% Components in 2nd Grid Layout
reset_btn  = uicontrol('Style','pushbutton','String','Reset Module','parent',grid_two,'Callback',{@reset_btn_Callback});
set(reset_btn,'Backgroundcolor',[0.85 0.85 0.85]);
check_passfail_btn  = uicontrol('Style','pushbutton','String','Check Pass/Fail','parent',grid_two,'Callback',{@ChckPassFail_btn_Callback});
set(check_passfail_btn,'Backgroundcolor',[0.85 0.85 0.85]);
resetSignal_btn  = uicontrol('Style','pushbutton','String','Reset Selected Signal','parent',grid_two,'Callback',{@resetSignal_btn_Callback});
set(resetSignal_btn,'Backgroundcolor',[0.85 0.85 0.85]);

% Third Grid Layout
grid_three = uigridcontainer('Units','norm','parent',flow_ctnr);
set(grid_three,'Margin',30);

%Component in 3rd Grid Layout
accept_btn  = uicontrol('Style','pushbutton','String','Accept','parent',grid_three,'Callback',{@accept_btn_Callback});
set(accept_btn,'Backgroundcolor',[0.85 0.85 0.85]);

% Make the UI visible.
movegui(f,'center');
set(f,'Visible','on');

catch exception
    errordlg(exception.message,'Error');%%Display error msg if any
end  
       
%Callback for Groupnames PopUp menu
function hpopup1_Callback(source,eventdata)
    try
      str = get(source, 'String'); % Determine the selected data set.
      val = get(source,'Value');
      current_groupName = str{val}; % Set current data to the selected data set.
    catch exception
      errordlg(exception.message,'Error');%%Display error msg if any
    end
end

%Callback for Signal name PopUp menu
function hpopup2_Callback(source,eventdata) 
 try    
      str = get(source, 'String');% Determine the selected data set.
      val = get(source,'Value');
       current_signalName = str{val}; % Set current data to the selected data set.
  catch exception
      errordlg(exception.message,'Error');%%Display error msg if any
  end      
end

%Callback for Timeseries PopUp menu
function hpopup3_Callback(source,eventdata)
 try
    str = get(source,'String');
    val = get(source,'Value');
    fig_Structure.CurrentTSname = str{val}; 
 catch exception
     errordlg(exception.message,'Error');%%Display error msg if any
 end    
end

%Callback for reset Button
function reset_btn_Callback(source,eventdata)
    
tempTsname =   fig_Structure.CurrentTSname;  

%updating the current variables for Reset button    
timeseries_cnt = 0;
WS_variables = evalin('base','whos');%%Get all the variables present in the workspace
Timeseries_objects = [];
Timeseries_objs = [];
Timeseries_diffObjs = [];

for cnt = 1 : length(WS_variables)%%Filter the timeseries variables alone
    if strcmp(WS_variables(cnt).class,'timeseries')
        timeseries_cnt = timeseries_cnt + 1;
        Timeseries_objects = [Timeseries_objects , WS_variables(cnt)];
    end
end 

for cnt = 1 : length(Timeseries_objects)
      Timeseries_objs = [Timeseries_objs,evalin('base',Timeseries_objects(cnt).name)];
      if strfind (Timeseries_objs(cnt).name,'_Diff')
          Timeseries_diffObjs = [Timeseries_diffObjs,Timeseries_objs(cnt)];
      end  
end

TSnames = cell(timeseries_cnt,1);%%Store the name of the timeseries objetcs in a cell array.For populating the popup menu
for cnt = 1 : timeseries_cnt
    TSnames{cnt} = Timeseries_objects(cnt).name;
end 

%Storing the Current timeseries objects and name in the Grid one handle
fig_Structure = guihandles(grid_one);
fig_Structure.TS_data = Timeseries_objs;%%Store the timeseries objects    
fig_Structure.TS_names = TSnames;%%Store the timeseries names
fig_Structure.TS_diffObjects = Timeseries_diffObjs;%%Store the diff timeseries alone
fig_Structure.CurrentTSname = tempTsname;
%Comparing the currenttime seriesname with all the timeseries name and updating the current timeseries object accordingly.
for cnt = 1 : length(fig_Structure.TS_data)
 if strcmp(fig_Structure.TS_data(cnt).Name(2:end-1),fig_Structure.CurrentTSname)%%Compare the name in Popup menu with the names of all the timeseries objects
      fig_Structure.CurrentTSObj = fig_Structure.TS_data(cnt); %%If the name is matched store the corresponding timeseries data to the current data.
 end
end 
%Storing the Current timeseries objects and name in the Grid one handle
% fig_Structure.CurrentTSObj;
% fig_Structure.CurrentTSname;
guidata(grid_one,fig_Structure);
end

%Callback for Check Pass fail button
function ChckPassFail_btn_Callback(source,eventdata)
     try
    evalin('base','run_passfail');
     catch exception
        errordlg(exception.message,'Error');%%Display error msg if any 
    end
end


%Call back for reset signal button
function resetSignal_btn_Callback(source,eventdata)
    try
    new_data = double([0 0]);
    new_time = double([0 10]);
    signalbuilder(SigBuildr,'set', current_signalName, current_groupName, new_time, new_data);
    catch exception
        errordlg(exception.message,'Error')
    end    
    
end    

% Call back for accept button.
function accept_btn_Callback(source,eventdata) 
  try
      %Comparing the currenttime seriesname with all the timeseries name and updating the current timeseries object accordingly.
      for cnt = 1 : length(fig_Structure.TS_data)
          if strcmp(fig_Structure.TS_data(cnt).Name(2:end-1),fig_Structure.CurrentTSname)%%Compare the name in Popup menu with the names of all the timeseries objects
            fig_Structure.CurrentTSObj = fig_Structure.TS_data(cnt); %%If the name is matched store the corresponding timeseries data to the current data.
          end
      end 
      %time series to signal builder data conversion logic
      change_detect = 0;
      new_time = [];
      new_data = [];
      [~, ~, signames, groupnames] = signalbuilder(SigBuildr);
      data = fig_Structure.CurrentTSObj.data; %%Store the data of the current timeseries
      time = fig_Structure.CurrentTSObj.time; %%Store the time of the current timeseries
      for cnt = 1 : length(data)-1
         if data(cnt+1)~= data(cnt)%%detecting data changes between consecutive timeseries data.
             new_time = [new_time,cnt*0.025,cnt*0.025]; %% Getting the sample time  at the changes.Stored twice to make it to Signal builder time format
             new_data = [new_data ,data(cnt),data(cnt+1)];%% Getting the current data and the previous data 
             change_detect = 1;%%Set this flag if the control entered this loop(Any change detected in the timeseries data)
         end
      end 
      new_time = ([time(1) new_time time(cnt+1)]);%%Appending the initial and final time values.

      if change_detect         
         new_data = double([data(1) new_data new_data(end)]);%%If there is some change in the corresponding timeseries set the changed value
      else                     
         new_data = double([data(1) data(1)]);%%If there is no change in the timeseries value the feedback signal will be the initial value
      end
      %set the downsampled time series value to the selected group and signal in the pop up menu.
      signalbuilder(SigBuildr,'set', current_signalName, current_groupName, new_time, new_data);
      
   catch exception
      errordlg(exception.message,'Error');%%Display error msg if any
  end    
end

end