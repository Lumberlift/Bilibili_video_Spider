clc
clear
warning off
tic
%爬取b站数据
% -------------%%单个爬取的过程-----------------
%%webread方式,用getcid获得b站视频的cid号
 cid=num2str(get_cid());
 url=char({['http://comment.bilibili.com/',char(cid),'.xml']});
 webdata=webread(url);%获取网页信息
 fprintf("获得xml网页信息了！\n");
%%利用正则匹配获得弹幕信息
 fprintf("在爬了在爬了...orz\n");
 pause(rand(5));
 danmakuinfo_data=regexp(webdata,'<source>k-v</source>','end');
 danmakuinfo_data_down=regexp(webdata,'</i>');
 danmaku_data=webdata(danmakuinfo_data:danmakuinfo_data_down);
 expr2 = '<d.*?>(.*?)</d>';%弹幕正则匹配
 [datafile, data_tokens] = regexp(danmaku_data, expr2, 'match', 'tokens'); %从源文件中获取目标数据
 T=cell2table(data_tokens');%转置，元胞转表格并写入
writetable(T,'.\bilibili_with_input.xls');

fprintf('完成!\n');

fprintf('全部完成！数据保存在D盘的data表格中，请注意查看！\n');

%%结束
toc

% -------%%爬取多个bv---------
% bv_num_mat=get_bv_mat();
% bv_num_mat_num=get_bv_num_mat_num();
% %%webread方式,用getcid获得b站视频的cid号
% for i=1:bv_num_mat_num
%  cid_mat=num2str(get_cid());
%  url=char({['http://comment.bilibili.com/',char(cid_mat(i)),'.xml']});
%  webdata=webread(url);%获取网页信息
%  fprintf("获得xml网页信息了！");
% %%利用正则匹配获得弹幕信息
%  fprintf("在爬了在爬了...");
%  pause(rand(5));
%  danmakuinfo_data=regexp(webdata,'<source>k-v</source>','end');
%  danmakuinfo_data_down=regexp(webdata,'</i>');
%  danmaku_data=webdata(danmakuinfo_data:danmakuinfo_data_down);
%  expr2 = '<d.*?>(.*?)</d>';%弹幕正则匹配
%  [datafile, data_tokens] = regexp(danmaku_data, expr2, 'match', 'tokens'); %从源文件中获取目标数据
%  T=cell2table(data_tokens);%转置，元胞转表格并写入
%  writetable(T,'.\bulibili_with_input.txt');
% end
% 
% fprintf('完成!\n');
% 
% fprintf('全部完成！数据保存在D盘的data表格中，请注意查看！\n');
% 
% %%结束
% toc

%------------%%以下都是曾经的试错orz-------------             
%位置
%  total=regexp(webdata,'<source>k-v</source>');
%  total_down=regexp(webdata,'</i>','end');
%              residential_area_data=webdata(total+1:total_down-1);
%              total=regexp(residential_area_data,'<d.*?>(.*?)</d>');
%              total_down=regexp(residential_area_data,'<d.*?>(.*?)</d>','end');
% 
% % total=regexp(webdata,'<d.*?>(.*?)</d>','all');
%              web_title={webdata(total:total_down)};

% %%重复获取第一条弹幕的代码
% danmakuinfo_data=regexp(webdata,'<source>k-v</source>','end');
%              danmakuinfo_data_down=regexp(webdata,'</i>');
%  loop_num=(danmakuinfo_data_down)-danmakuinfo_data;
%         for i=1:loop_num
%              danmaku_data=webdata(danmakuinfo_data:danmakuinfo_data_down);
%              web_title(i,1)={danmaku_data(regexpi(danmaku_data,'<d.*?>(.*?)</d>'):regexpi(danmaku_data,'<d.*?>(.*?)</d>','end'))};
%              xlswrite('D:\c.xls',web_title);
%              danmaku_data=webdata((danmakuinfo_data+i):danmakuinfo_data_down);
%         end

%%
% 
% %网站数据读取urlread方式
% website='http://comment.bilibili.com/87238611.xml';
% [sourcefile,status]=read(website);
% if ~status
%     error("出问题了，数据没爬好哦")
% end
% 
% %网站数据元素操作
% expr2 = '<d.*?>(.*?)</d>';
% [datafile, data_tokens] = regexp(sourcefile, expr2, 'match', 'tokens'); %从源文件中获取目标数据
% % data = cell(size(data_tokens));%产生和数据相同长度的0
% % for idx = 1:length(data_tokens)
% %     data(idx) = str2double(data_tokens{idx}{1});       %转变数据类型后存入data中
% % end
% 
% xlswrite('D:/data', data_tokens);
% fprintf('完成!\n')

