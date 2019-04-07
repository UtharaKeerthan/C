dirty_flag = 0;
system = strcat(bdroot,'/Outputs');
blks=find_system(system,'BlockType','ToWorkspace');
Blocks= char(blks);
for i=1:1:length(blks)
    set_param(strtrim(Blocks(i,:)),'SaveFormat','Timeseries');
    
end
sim(bdroot)
pause(1);
disp('New Result..............................................')
for i=1:1:length(blks)
    blk_name = get_param(strtrim(Blocks(i,:)),'VariableName');
    if strfind(blk_name,'_Diff')    
     a=evalin('base',blk_name);
    s=sum(a.Data);
    if s ~=0
        dirty_flag = 1;
        disp(blk_name)
        disp('FAILED')
    end
    end
end

if dirty_flag == 0
    disp('PASSED')
end    