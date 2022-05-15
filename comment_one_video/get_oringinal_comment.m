function get_oringinal_comment(url)
%主界面的评论爬取
%评论不像弹幕直接从.xml的弹幕池中获取，只能通过网页数据的结构体获取
%不知道能否获得html文件，用元素标头
%origin_url=char({['https://api.bilibili.com/x/v2/reply?&type=1&pn=1&oid=497651138&sort=2']});
%webdata=webread(origin_url);

 [original_comment_data, status] = urlread(url);
 %sourcefile似乎是web的字符串存储       
        if ~status
            error('读取出错！\n')
        end
%expr= '<p class="text">(.*?)<p>';%评论正则匹配
        
%expr = '"content":{"message":"(.*?)","plat":0,"device":"","members":[],"jump_url":{},"max_line":6},"replies":[{"rpid":';%评论正则匹配
% start_string='{"code":0,"message":"0"';
% end_string='"giveup_input_text"';
% 
% oringinal_commnetinfo_data=regexp(webdata,start_string);
% oringinal_commnetinfo_data_down=regexp(webdata,end_string);
%  oringinal_commnet_data=webdata(oringinal_commnetinfo_data:oringinal_commnetinfo_data_down);
%  expr = '"content":{"message":"(.*?)","plat":0,"device":"","members":[],"jump_url":{},"max_line":6},"replies":[{"rpid":';%评论正则匹配
%  [~, oringinal_commnetdata_tokens] = regexp(oringinal_commnet_data, expr, 'forcecelloutput'); %从源文件中获取目标数据

original_comment=extractBetween(original_comment_data,'"content":{"message":"',',"plat":0,"device":"","members":[],"jump_url":{},"max_line":6},"replies":[{"rpid":');


%输出部分
oringinal_commnet_T=cell2table(original_comment);%转置，元胞转表格并写入


 %t=datestr(datenum(datetime),'yyyy-mm-dd-HH-MM-SS');
 filename=strcat('comment_output\oringinal_commnet.xls');
 writetable(oringinal_commnet_T,filename);
end