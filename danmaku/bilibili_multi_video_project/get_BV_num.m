function [BV_num_mat,BV_length]=get_BV_num()
BV_num_mat=textread('BV_num.txt','%s');%[BV_num]=BV_num_mat;注释里这句话不知道有什么用，先放着
BV_length=length(BV_num_mat);
end

%%------------------这是以前的尝试-----------------------
%https://blog.csdn.net/jisuanjiguoba/article/details/79997805?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0.pc_relevant_default&spm=1001.2101.3001.4242.1&utm_relevant_index=3
%bv_num=textread('BV_num.txt','%s');

% bv_num_mat=[];
% fileID = fopen('BV_num.txt','r');
% formatSpec = '%s\n';
% size bv_num_mat =[2, Inf];
% bv_num_mat= fscanf(fileID,formatSpec, sizebv_num_mat);
% %fprintf(fileID,'%s*[\n]',bv_num_mat);
% fclose(fileID);