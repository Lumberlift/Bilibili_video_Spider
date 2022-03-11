function bv_num=get_bv()
[bv_num]=textread('BV_num.txt','%s') 
%https://blog.csdn.net/jisuanjiguoba/article/details/79997805?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0.pc_relevant_default&spm=1001.2101.3001.4242.1&utm_relevant_index=3
%bv_num=textread('BV_num.txt','%s');

% bv_num_mat=[];
% fileID = fopen('BV_num.txt','r');
% formatSpec = '%s\n';
% size bv_num_mat =[2, Inf];
% bv_num_mat= fscanf(fileID,formatSpec, sizebv_num_mat);
% %fprintf(fileID,'%s*[\n]',bv_num_mat);
% fclose(fileID);
end

