clear new_time;
clear new_data;
clear d;
clear c;
clear t;
clear count;
clear change_detect;
count = 0;
new_data = [];
new_time = [];
[time, data, signames, groupnames] = signalbuilder(gcb);
c = RearSeatISCMCancel_st;
change_detect = 0;
d = c.data;
t = c.time;
 for i = 1 : length(d)-1
   if d(i+1)~= d(i)
      count = count+1;
      new_time = [new_time,i,i]; %% Getting the index value at the changes.Stored twice to make it to Signal builder time format
      new_data = [new_data ,d(i),d(i+1)];%% Getting the current data and the previous data   
      change_detect = 1;
   end
end 

new_time = new_time*0.025;%% Converting the index value to time value by multiplying by sample time.
new_time = [0 new_time 10];%%Appending the initial and final time values.

if change_detect 
new_data = [0 new_data new_data(end)];%%Appending the initial and final data value.
else
new_data = [0 0];    
end


% 
signalbuilder(gcb,'set','RearSeatISCMCancel_st_Expected','UTC_ISCMRR_0038: Foldflat Recline switch pressed in Zone 1 and Rear Seat not Cancelled as ISCM zone 1 flag is set', new_time,new_data);
clear x;
x = 0;
a = whos;
b = [];
for i = 1 : length(a)
    if strcmp(a(i).class,'timeseries')
        x = x + 1;
        b = [b , a(i)];
    end
end  
        
