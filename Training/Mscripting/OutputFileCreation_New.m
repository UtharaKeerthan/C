% Output file creation script
% Developed on 23/10/2017
[Stptme,~] = size(ApredCmplTime(1,1).Time);
j=1;
Date={};
BatLvl={};
Ntfctn={};
DatePred={};
Routine={};
    [Stptme,~] = size(ApredCmplTime(1,1).Time);
    j=1;
    for idx=1:1:Stptme
        if ApredCmplTime(1,1).Data(idx)==1;
            ApredCmplTime(1,1).Time(idx);
            DateVector = [double(YearPred(1,1).Data(idx))+2000,...
                double(MntPred(1,1).Data(idx)),...
                double(DayPred(1,1).Data(idx))...
                ,double(HourPred(1,1).Data(idx)),...
                double(MinPred(1,1).Data(idx)),...
                double(SecPred(1,1).Data(idx))];
            Date{j} = datestr(DateVector,'dd/mm/yyyy HH:MM:SS');
            BatLvl{j}=(BatLvlPred(1,1).Data(idx))/100;
            Ntfctn{j}=NtfcnStPred(1,1).Data(idx);
            DateVectorPred = [double(PredChrDueYearPred(1,1).Data(idx))+2000,...
                double(PredChrDueMntPred(1,1).Data(idx)),...
                double(PredChrDueDayPred(1,1).Data(idx)),0,0,0];
            DatePred{j} = datestr(DateVectorPred,'dd/mm/yyyy');
            Routine{j}=(LtsRotnessPred(1,1).Data(idx))/10;
            j=j+1;
        end
    end
    Date=transpose(Date);
    BatLvl=transpose(BatLvl);
    Ntfctn=transpose(Ntfctn);
    DatePred=transpose(DatePred);
    Routine=transpose(Routine);
    C= {Date,BatLvl,DatePred,Ntfctn,Routine};
    % converting cell variables
    Table = cell2table(C);
    % Assigning column variable names in excel
    col_var_name= {'Date','Current_Soc','Predicted_Charge_Date','Notification_state','Latest_Daily_Routineness'};
    % Creating a table 
    Tab = table(Table.C1{1,1},Table.C2{1,1},Table.C3{1,1},Table.C4{1,1},Table.C5{1,1},'VariableNames',col_var_name);
    % Writing Historical table into excel 
    csv_name = 'file_info.csv';
	writetable(Tab,csv_name);