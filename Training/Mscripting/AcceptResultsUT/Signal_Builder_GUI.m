%SIGNAL_BUILDER_GUI Summary of this function goes here
%   Detailed explanation goes here
%   Uasage          :Signal_Builder_GUI
%                     
%
%   Project Details
%
%   Project Name    : NGSM
%   Company         : TE
%   Author          : Jiyo Jolly Palatti
%   Date Created    : 18/10/2016
%   Date Modified   :
%
function Signal_Builder_GUI
prompt = {'Enter path of Signal Builder Block:'};
dlg_title = 'Input';
num_lines = 1;
defAns = {gcb};
answer = inputdlg(prompt,dlg_title,num_lines,defAns);
%Populate Signal Names and Group Names
% block = 'SquabActuator/Inputs/Signal_Builder_Test';
block = answer{1};
[~, ~, signames, groupnames] = signalbuilder(block);

%Create current variables
current_signalName = signames{1};
current_groupName = groupnames{1};
current_visibility = true;
[current_time, current_data] = signalbuilder(block, 'get', current_signalName, current_groupName);
concat_data(1,:) = current_time;
concat_data(2,:) = current_data;


%  Create and then hide the UI as it is being constructed.
f = figure('Visible','off',...
    'NumberTitle','off',...
    'Name','Unit Test',...
    'MenuBar','none',...
    'Position',[360,200,750,300]);

rnames = {'TIME:','DATA:'};


%Creating layout manager container
%Main Flow Layout
flow_ctnr = uiflowcontainer('v0','Units','norm',...
                            'Position',[.03,.02,.95,.95]);
set(flow_ctnr,'FlowDirection','TopDown');

%First Grid layout
grid_one  = uigridcontainer('v0','Units','norm',...
                            'parent',flow_ctnr);
set(grid_one, 'GridSize',[2,2],'HorizontalWeight',[2,6]);
set(grid_one, 'HeightLimits',[50,100]);
%  Construct the components in 1st grid layout
htext1     = uicontrol('Style','text',...
                       'String','GROUP NAME:',...
                       'Units','norm',...
                       'HorizontalAlignment','center',...
                       'parent',grid_one);
hpopup1    = uicontrol('Style','popupmenu',...
                       'String', groupnames,...
                       'parent',grid_one,...
                       'Callback',{@hpopup1_Callback});
htext2     = uicontrol('Style','text',...
                       'String','SIGNAL NAME:',...
                       'HorizontalAlignment','center',...
                       'parent',grid_one);
hpopup2    = uicontrol('Style','popupmenu',...
                       'String', signames,...
                       'parent',grid_one,...
                       'Callback',{@hpopup2_Callback});
%Second Grid layout
grid_two  = uigridcontainer('v0','Units','norm',...
                            'Position',[0 0 .5 0.01],...
                            'parent',flow_ctnr);
set(grid_two, 'GridSize',[1,3],'HorizontalWeight',[1,1,11]);
set(grid_two, 'HeightLimits',[10,20]);
%Components in 2nd grid layout
add_btn  = uicontrol('Style','pushbutton',...
                     'String','+',...
                     'Units','norm',...
                     'Position',[0 0 .5 .01],...
                     'BackgroundColor','green',...
                     'FontSize', 15,...
                     'parent',grid_two,...
                     'Callback',{@add_btn_Callback});
                   
delete_btn  = uicontrol('Style','pushbutton',...
                        'String','-',...
                        'Units','norm',...
                        'Position',[0 0 .5 .01],...
                        'BackgroundColor','red',...
                        'FontSize', 15,...
                        'parent',grid_two,...
                        'Callback',{@delete_btn_Callback});
                   
%Data table in flow layout
data_table =   uitable(f,'Data',concat_data,...
                       'RowName',rnames,...
                       'parent',flow_ctnr,...
                       'TooltipString', 'Enter new values in table',...
                       'ColumnEditable',true,...
                       'CellEditCallback',{@table_Callback});
set(data_table, 'HeightLimits',[70,90]);
                   
%Third Grid layout
grid_three = uigridcontainer('v0','Units','norm',...
                             'Position',[0.1 0.1 .1 .1],...
                             'parent',flow_ctnr);
set(grid_three, 'GridSize',[1,2]);
set(grid_three, 'HeightLimits',[10,50]);
%Components in 3rd grid layout
show_hide_btn  = uicontrol('Style','pushbutton',...
                       'String','Show/Hide Signal',...
                       'parent',grid_three,...
                       'Callback',{@show_hide_btn_Callback});
                   
refresh_btn  = uicontrol('Style','pushbutton',...
                               'Visible','on',... 
                               'String','Refresh',...
                               'parent',grid_three,...
                               'Callback',{@refresh_btn_Callback});



apply_btn  = uicontrol('Style','pushbutton',...
                       'String','Apply',...
                       'parent',flow_ctnr,...
                       'Callback',{@apply_btn_Callback});
set(apply_btn, 'HeightLimits',[10,50]);       
% Make the UI visible.
movegui(f,'center');
set(f,'Visible','on');
       

function hpopup1_Callback(source,eventdata)
    try
      % Determine the selected data set.
      str = get(source, 'String');
      val = get(source,'Value');
      % Set current data to the selected data set.
      current_groupName = str{val};
      [current_time, current_data] = signalbuilder(block, 'get', current_signalName, current_groupName);
      clear concat_data;
      concat_data(1,:) = current_time;
      concat_data(2,:) = current_data;
      set(data_table,'Data', concat_data);
    catch exception
      errordlg(exception.message,'Error');
    end
end

function hpopup2_Callback(source,eventdata) 
 try    
    % Determine the selected data set.
      str = get(source, 'String');
      val = get(source,'Value');
      % Set current data to the selected data set.
      current_signalName = str{val};
      [current_time, current_data] = signalbuilder(block, 'get', current_signalName, current_groupName);
      clear concat_data;
      concat_data(1,:) = current_time;
      concat_data(2,:) = current_data;
      set(data_table,'Data', concat_data);
  catch exception
      errordlg(exception.message,'Error');
  end      
end

function add_btn_Callback(source,eventdata) 
  try    
     zero_mat = zeros(2,1); 
     zero_mat(1,1) = concat_data(1,end)+1;  
     concat_data = [concat_data zero_mat];
     set(data_table,'Data', concat_data);
   catch exception
      errordlg(exception.message,'Error');
  end      
end


function delete_btn_Callback(source,eventdata) 
  try    
     concat_data(:,end) = [];
     set(data_table,'Data', concat_data);
   catch exception
      errordlg(exception.message,'Error');
  end      
end


function table_Callback(source,eventdata)
  try    
      concat_data = get(source,'Data');
      current_time = concat_data(1,:);
      current_data = concat_data(2,:);
      signalbuilder(block,'set', current_signalName, current_groupName, current_time, current_data);
  catch exception
      errordlg(exception.message,'Error');
  end
      
end


function show_hide_btn_Callback(source,eventdata) 
      % Determine the selected data set.
  try
      if current_visibility == true
         signalbuilder(block,'hidesignal', current_signalName, current_groupName);
         current_visibility = false;
      else
         signalbuilder(block,'showsignal', current_signalName, current_groupName);
         current_visibility = true;
      end
   catch exception
      errordlg(exception.message,'Error');
  end    
end

function refresh_btn_Callback(source,eventdata) 
      % Determine the selected data set.
  try
      clear signames;
      clear groupnames;
      clear concat_data;
      [~, ~, signames, groupnames] = signalbuilder(block);
      set(hpopup1,'String',groupnames);
      set(hpopup2,'String',signames);
      current_signalName = signames{1};
      current_groupName = groupnames{1};
      [current_time, current_data] = signalbuilder(block, 'get', current_signalName, current_groupName);
      concat_data(1,:) = current_time;
      concat_data(2,:) = current_data;
      set(data_table,'Data', concat_data);
   catch exception
      errordlg(exception.message,'Error');
  end    
end


function apply_btn_Callback(source,eventdata) 
      % Determine the selected data set.
  try
      signalbuilder(block,'set', current_signalName, current_groupName, current_time, current_data);
   catch exception
      errordlg(exception.message,'Error');
  end    
end

end