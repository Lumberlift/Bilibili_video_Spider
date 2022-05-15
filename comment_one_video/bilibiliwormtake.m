clc
clear
warning off
tic
%爬取b站数据
% -------------%%单个爬取的过程-----------------
%%webread方式,用getoid获得b站视频的oid号
%以罗翔视频为例，评论的回复信息在https://api.bilibili.com/x/v2/reply/reply?
% &pn=1&type=1&oid=497651138&ps=10&root=2714653966&_=1649214961536
%中
%利用视频评论回复url，去除url中的错误返回
%评论本身在https://api.bilibili.com/x/v2/reply?&type=1&pn=1&oid=497651138&sort=2
 %oid=get_oid();
 oid_cell=get_oid();
 oid=oid_cell{1,1};%oid在元胞的第一个信息里
 root_cell=get_root();
 root=num2str(root_cell{1,1});
 origin_url=char({['https://api.bilibili.com/x/v2/reply?&type=1&pn=1&oid=',char(oid),'&sort=2']});
 url=char({['https://api.bilibili.com/x/v2/reply/reply?&pn=1&type=1&oid=',char(oid),'&sort=2&root=',char(root)]});
 webdata=webread(url);%获取网页信息
 %web响应超时问题参照https://blog.csdn.net/qq_38882446/article/details/108983101
 %修改options.timeout=20；增大网页请求时间
 fprintf("获得评论接口网页信息了！\n");
 %%先获得主界面的评论
 get_oringinal_comment(origin_url);

 %%再获得评论的回复
 page_num=webdata.data.page.count;
 weboptions.Timeout=20;%响应时间延长
 content={};
 for k=1:size(root_cell,2)%每一个评论
     page_num=get_page_num(root_cell{1,k});
 for j=1:(page_num)%每一个评论的翻页
 url=char({['https://api.bilibili.com/x/v2/reply/reply?&pn=',char(num2str(j)),'&type=1&oid=',char(oid),'&sort=2&root=',char(num2str(root_cell{1,k}))]});
 webdata=webread(url);%获取网页信息
    %利用正则匹配获得评论的回复信息
 fprintf("在爬了在爬了...orz\n现在第%d个评论的第%d条回复\n",k,j);
 pause(rand(10));
%  commentinfo_data=regexp(webdata,'{"code":0,','end');
%  commentinfo_data_down=regexp(webdata,'}}}');
%  comment_data=webdata(commentinfo_data:commentinfo_data_down);

%

    %replies_data=struct2cell(webdata.data.replies);
       for i=1:size(webdata.data.replies)
            content(j,i)=cellstr(webdata.data.replies(i).content.message);
       end


% for i=1:size(replies_data)
% content_data(i)=replies_datas(i,1).content.message;
% end
 end
 

%  expr2 = '"content":{"message":"(.*?)","plat"';%弹幕正则匹配
%  [datafile, data_tokens] = regexp(webdata, expr2, 'match', 'tokens'); %从源文件中获取目标数据
 T=cell2table(content);%转置，元胞转表格并写入
 t=datestr(datenum(datetime),'yyyy-mm-dd-HH-MM-SS');
 %reply_xls_name=strcat('第',char(k(1,1)),'个评论的回复_时间');
 filename=strcat('comment_output\',t,'.xls');
writetable(T,filename);

fprintf('第%d个评论及回复爬取完成!\n',k);
end

fprintf('全部完成！数据保存在脚本的comment文件夹中，请注意查看！\n');

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

