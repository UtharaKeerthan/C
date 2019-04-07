function InptFetchngSfun(block)
% Level-2 MATLAB file S-Function for reading csv data.
 setup(block);
  
%endfunction

function setup(block)
 %% Register number of Block parameters
 % Number of rows in the sheet to assign Dwork vector size
  block.NumDialogPrms  = 3;
  
  %% Register number of input and output ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 20;

  %% Setup functional port properties to dynamically
  %% inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
 
  % Override input port properties
  block.InputPort(1).Dimensions        = 1;
  block.InputPort(1).DirectFeedthrough = false;
  block.InputPort(1).SamplingMode = 'Sample';
  
  % Override output port properties
  block.OutputPort(1).Dimensions       = 1;
  block.OutputPort(2).Dimensions       = 1;
  block.OutputPort(3).Dimensions       = 1;
  block.OutputPort(4).Dimensions       = 1;
  block.OutputPort(5).Dimensions       = 1;
  block.OutputPort(6).Dimensions       = 1;
  block.OutputPort(7).Dimensions       = 1;
  block.OutputPort(8).Dimensions       = 1;
  block.OutputPort(9).Dimensions       = 1;
  block.OutputPort(10).Dimensions       = 1;
  block.OutputPort(11).Dimensions       = 1;
  block.OutputPort(12).Dimensions       = 1;
  block.OutputPort(13).Dimensions       = 1;
  block.OutputPort(14).Dimensions       = 1;
  block.OutputPort(15).Dimensions       = 1;
  block.OutputPort(16).Dimensions       = 1;
  block.OutputPort(17).Dimensions       = 1;
  block.OutputPort(18).Dimensions       = 1;
  block.OutputPort(19).Dimensions       = 1;
  block.OutputPort(20).Dimensions       = 1;
  
  block.OutputPort(1).SamplingMode = 'Sample';
  block.OutputPort(2).SamplingMode = 'Sample';
  block.OutputPort(3).SamplingMode = 'Sample';
  block.OutputPort(4).SamplingMode = 'Sample';
  block.OutputPort(5).SamplingMode = 'Sample';
  block.OutputPort(6).SamplingMode = 'Sample';
  block.OutputPort(7).SamplingMode = 'Sample';
  block.OutputPort(8).SamplingMode = 'Sample';
  block.OutputPort(9).SamplingMode = 'Sample';
  block.OutputPort(10).SamplingMode = 'Sample';
  block.OutputPort(11).SamplingMode = 'Sample';
  block.OutputPort(12).SamplingMode = 'Sample';
  block.OutputPort(13).SamplingMode = 'Sample';
  block.OutputPort(14).SamplingMode = 'Sample';
  block.OutputPort(15).SamplingMode = 'Sample';
  block.OutputPort(16).SamplingMode = 'Sample';
  block.OutputPort(17).SamplingMode = 'Sample';
  block.OutputPort(18).SamplingMode = 'Sample';
  block.OutputPort(19).SamplingMode = 'Sample';
  block.OutputPort(20).SamplingMode = 'Sample';
  %% Set block sample time to [1 0]
  block.SampleTimes = [75 0];
  
  %% Set the block simStateCompliance to default (i.e., same as a built-in block)
  block.SimStateCompliance = 'UnknownSimState';

  %% Register methods
  block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
  block.RegBlockMethod('InitializeConditions',    @InitConditions);  
  block.RegBlockMethod('Outputs',                 @Output);  
  block.RegBlockMethod('Update',                  @Update);  
  
%endfunction

function DoPostPropSetup(block)
 
  %% Setup Dwork
  block.NumDworks = 21;
  block.Dwork(20).Name = 'Index'; 
  block.Dwork(20).Dimensions      = 1;
  block.Dwork(20).DatatypeID      = 0;
  block.Dwork(20).Complexity      = 'Real';
  block.Dwork(20).UsedAsDiscState = true;
  
  block.Dwork(1).Name = 'Day'; 
  block.Dwork(1).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = true;
  
  block.Dwork(2).Name = 'Month'; 
  block.Dwork(2).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(2).DatatypeID      = 0;
  block.Dwork(2).Complexity      = 'Real';
  block.Dwork(2).UsedAsDiscState = true;
  
  block.Dwork(3).Name = 'Year'; 
  block.Dwork(3).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(3).DatatypeID      = 0;
  block.Dwork(3).Complexity      = 'Real';
  block.Dwork(3).UsedAsDiscState = true;
  
  block.Dwork(4).Name = 'Hour'; 
  block.Dwork(4).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(4).DatatypeID      = 0;
  block.Dwork(4).Complexity      = 'Real';
  block.Dwork(4).UsedAsDiscState = true;
  
  block.Dwork(5).Name = 'Min'; 
  block.Dwork(5).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(5).DatatypeID      = 0;
  block.Dwork(5).Complexity      = 'Real';
  block.Dwork(5).UsedAsDiscState = true;
  
  block.Dwork(6).Name = 'Sec'; 
  block.Dwork(6).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(6).DatatypeID      = 0;
  block.Dwork(6).Complexity      = 'Real';
  block.Dwork(6).UsedAsDiscState = true;
  
  block.Dwork(7).Name = 'JrnyStat'; 
  block.Dwork(7).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(7).DatatypeID      = 0;
  block.Dwork(7).Complexity      = 'Real';
  block.Dwork(7).UsedAsDiscState = true;
  
  block.Dwork(8).Name = 'BattSoc'; 
  block.Dwork(8).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(8).DatatypeID      = 0;
  block.Dwork(8).Complexity      = 'Real';
  block.Dwork(8).UsedAsDiscState = true;
  
  block.Dwork(9).Name = 'NomEngyRem'; 
  block.Dwork(9).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(9).DatatypeID      = 0;
  block.Dwork(9).Complexity      = 'Real';
  block.Dwork(9).UsedAsDiscState = true;
  
  block.Dwork(10).Name = 'ExpEngyRem'; 
  block.Dwork(10).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(10).DatatypeID      = 0;
  block.Dwork(10).Complexity      = 'Real';
  block.Dwork(10).UsedAsDiscState = true;
  
  block.Dwork(11).Name = 'IdlEngyRem'; 
  block.Dwork(11).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(11).DatatypeID      = 0;
  block.Dwork(11).Complexity      = 'Real';
  block.Dwork(11).UsedAsDiscState = true;
  
  block.Dwork(12).Name = 'NomFullPkEngy'; 
  block.Dwork(12).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(12).DatatypeID      = 0;
  block.Dwork(12).Complexity      = 'Real';
  block.Dwork(12).UsedAsDiscState = true;
    
  block.Dwork(13).Name = 'Lat'; 
  block.Dwork(13).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(13).DatatypeID      = 0;
  block.Dwork(13).Complexity      = 'Real';
  block.Dwork(13).UsedAsDiscState = true;
    
  block.Dwork(14).Name = 'Lan'; 
  block.Dwork(14).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(14).DatatypeID      = 0;
  block.Dwork(14).Complexity      = 'Real';
  block.Dwork(14).UsedAsDiscState = true;
    
  block.Dwork(15).Name = 'TotlMechPwr'; 
  block.Dwork(15).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(15).DatatypeID      = 0;
  block.Dwork(15).Complexity      = 'Real';
  block.Dwork(15).UsedAsDiscState = true;
    
  block.Dwork(16).Name = 'TimeElpsd'; 
  block.Dwork(16).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(16).DatatypeID      = 0;
  block.Dwork(16).Complexity      = 'Real';
  block.Dwork(16).UsedAsDiscState = true;
    
  block.Dwork(17).Name = 'Timestp'; 
  block.Dwork(17).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(17).DatatypeID      = 0;
  block.Dwork(17).Complexity      = 'Real';
  block.Dwork(17).UsedAsDiscState = true;
    
  block.Dwork(18).Name = 'BattOdmtr'; 
  block.Dwork(18).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(18).DatatypeID      = 0;
  block.Dwork(18).Complexity      = 'Real';
  block.Dwork(18).UsedAsDiscState = true;
  
  block.Dwork(19).Name = 'DayofWeek'; 
  block.Dwork(19).Dimensions      = block.DialogPrm(1).Data;
  block.Dwork(19).DatatypeID      = 0;
  block.Dwork(19).Complexity      = 'Real';
  block.Dwork(19).UsedAsDiscState = true;
  
  block.Dwork(21).Name = 'BatLvlNxtIdx'; 
  block.Dwork(21).Dimensions      = 1;
  block.Dwork(21).DatatypeID      = 0;
  block.Dwork(21).Complexity      = 'Real';
  block.Dwork(21).UsedAsDiscState = true;
  
%endfunction

function InitConditions(block)
 % Reading data from csv sheet
 sheetname = strcat('FleetCarma_',mat2str(block.DialogPrm(2).Data),'_',mat2str(block.DialogPrm(3).Data),'.csv');
 Data = readtable(sheetname);
 [r,~]=size(Data);
 
 % Initialization
 Day = zeros(r,1);
 Month = zeros(r,1);
 Year = zeros(r,1);
 Hour = zeros(r,1);
 Min = zeros(r,1);
 Sec = zeros(r,1);
 JrnyStat = zeros(r,1); 
 DayofWeek = zeros(r,1);
 
 DateAry = table2array(Data(:,1));
 JrnyStatAry = table2array(Data(:,2));
  
 % Derivation of Day,Month,Year,Hour,Min,Sec from Date input
 for idx=1:1:r
       Date = DateAry{idx};
       Format = strfind(Date,'/');                 % For the format 01/01/2015
       if(~(isempty(Format)))
           Str = strsplit(Date,{'/',' ',':'});
           len = length(Str);
           Day(idx) = str2double(Str{1});
           Month(idx) = str2double(Str{2});
           Year(idx) = str2double(Str{3})-2000;    % 
           Hour(idx) = str2double(Str{4});
           Min(idx) = str2double(Str{5});
           if (len==6)
              Sec(idx)= str2double(Str{6});
           end
       end
       Format = strfind(Date,'-');                  % For the format 01/01/2015
       if(~(isempty(Format)))
           Str = strsplit(Date,{'-',' ',':'});
           len = length(Str);
           Day(idx) = str2double(Str{1});
           Month(idx) = str2double(Str{2});
           Year(idx) = str2double(Str{3})-2000;
           Hour(idx) = str2double(Str{4});
           Min(idx) = str2double(Str{5});
           if (len==6)
               Sec(idx)= str2double(Str{6});
           end
       end
       
% Journey state assignment       
       if((strcmp(JrnyStatAry{idx},'Asleep')))
           JrnyStat(idx) = 0;
       elseif((strcmp(JrnyStatAry{idx},'Normal')))
           JrnyStat(idx) = 2;
       elseif((strcmp(JrnyStatAry{idx},'Charging')))
           JrnyStat(idx) = 3;
       end
       
% Derivation of day of the week from date input
       DateFrmt = strcat(num2str(Month(idx)),'/',num2str(Day(idx)),'/',num2str(Year(idx)));
       DayofWeek(idx) = weekday(DateFrmt);
       
   end
 
 %% Initialize Dwork
  block.Dwork(1).Data = Day;
  block.Dwork(2).Data = Month;
  block.Dwork(3).Data = Year;
  block.Dwork(4).Data = Hour;
  block.Dwork(5).Data = Min;
  block.Dwork(6).Data = Sec;
  block.Dwork(7).Data = JrnyStat;
  block.Dwork(8).Data = table2array(Data(:,3));
  block.Dwork(9).Data = table2array(Data(:,4));
  block.Dwork(10).Data = table2array(Data(:,5));
  block.Dwork(11).Data = table2array(Data(:,6));
  block.Dwork(12).Data = table2array(Data(:,7));
  block.Dwork(13).Data = table2array(Data(:,8));
  block.Dwork(14).Data = table2array(Data(:,9));
  block.Dwork(15).Data = table2array(Data(:,10));
  block.Dwork(16).Data = table2array(Data(:,11));
  block.Dwork(17).Data = table2array(Data(:,12));
  block.Dwork(18).Data = table2array(Data(:,13));
  block.Dwork(19).Data = DayofWeek;
  block.Dwork(20).Data = 1;
  block.Dwork(21).Data = 2;
 
  
%endfunction

function Output(block)
  % Declaring outputs
  block.OutputPort(1).Data = block.Dwork(1).Data(block.Dwork(20).Data);
  block.OutputPort(2).Data = block.Dwork(2).Data(block.Dwork(20).Data);
  block.OutputPort(3).Data = block.Dwork(3).Data(block.Dwork(20).Data);
  block.OutputPort(4).Data = block.Dwork(4).Data(block.Dwork(20).Data);
  block.OutputPort(5).Data = block.Dwork(5).Data(block.Dwork(20).Data);
  block.OutputPort(6).Data = block.Dwork(6).Data(block.Dwork(20).Data);
  block.OutputPort(7).Data = block.Dwork(7).Data(block.Dwork(20).Data);
  block.OutputPort(8).Data = block.Dwork(8).Data(block.Dwork(20).Data)*100;
  block.OutputPort(9).Data = block.Dwork(9).Data(block.Dwork(20).Data);
  block.OutputPort(10).Data = block.Dwork(10).Data(block.Dwork(20).Data);
  block.OutputPort(11).Data = block.Dwork(11).Data(block.Dwork(20).Data);
  block.OutputPort(12).Data = block.Dwork(12).Data(block.Dwork(20).Data);
  block.OutputPort(13).Data = block.Dwork(13).Data(block.Dwork(20).Data);
  block.OutputPort(14).Data = block.Dwork(14).Data(block.Dwork(20).Data);
  block.OutputPort(15).Data = block.Dwork(15).Data(block.Dwork(20).Data);
  block.OutputPort(16).Data = block.Dwork(16).Data(block.Dwork(20).Data);
  block.OutputPort(17).Data = block.Dwork(17).Data(block.Dwork(20).Data);
  block.OutputPort(18).Data = block.Dwork(18).Data(block.Dwork(20).Data)*100;
  block.OutputPort(19).Data = block.Dwork(19).Data(block.Dwork(20).Data);
  block.OutputPort(20).Data = block.Dwork(8).Data(block.Dwork(21).Data)*100;
 
  
%endfunction

function Update(block)
  % Update outputs after each sampling time
  block.Dwork(20).Data = block.Dwork(20).Data+1;
  if block.Dwork(21).Data < block.DialogPrm(1).Data
      block.Dwork(21).Data = block.Dwork(21).Data+1;
  else
     block.Dwork(21).Data = block.Dwork(21).Data;
  end  
  
%endfunction

