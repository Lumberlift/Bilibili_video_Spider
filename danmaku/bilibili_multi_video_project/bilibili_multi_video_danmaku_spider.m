clc
clear
warning off
tic
[BV_num_mat,BV_length]=get_BV_num();
for i=1:BV_length
    [cid,cid_length]=get_cid(BV_num_mat(i,1));
    for j=1:cid_length
        T=bilibiliwormtake(cid(j,1));
        %xlswrite("以下是第%d个视频的弹幕",j);
        t=datestr(datenum(datetime),'yyyy-mm-dd-HH-MM-SS');
        filename=strcat('.\danmaku\',t,'.xls');
        writetable(T,filename);
    end
    fprintf('第%d个视频完成!\n',i);
end


fprintf('全部完成！数据保存在同目录的danmaku中，请注意查看！\n');
toc

