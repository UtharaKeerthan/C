timeseries_cnt = 0;
WS_variables = whos;
Timeseries_objects = [];
Timeseries_objs = [];
clear cnt;

for cnt = 1 : length(WS_variables)
    if strcmp(WS_variables(cnt).class,'timeseries')
        timeseries_cnt = timeseries_cnt + 1;
        Timeseries_objects = [Timeseries_objects , WS_variables(cnt)];
    end
end 

for cnt = 1 : length(Timeseries_objects)
      Timeseries_objs = [Timeseries_objs,evalin('base',Timeseries_objects(cnt).name)];
end

TSnames = cell(timeseries_cnt,1);
for cnt = 1 : timeseries_cnt
    TSnames{cnt} = Timeseries_objects(cnt).name;
end 


