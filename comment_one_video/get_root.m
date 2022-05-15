function root=get_root()
%从https://api.bilibili.com/x/v2/reply?pn=1&type=1&oid=（）&sort=2获取root
oid_cell=get_oid();
 oid=oid_cell{1,1};
 root_url=char({['https://api.bilibili.com/x/v2/reply?pn=1&type=1&oid=',char(oid),'&sort=2']});
 root_webdata=webread(root_url);%获取网页信息

 if root_webdata.code~=(-400)
 fprintf("获得root接口网页信息了！\n");
 end
 
%   root_expr = '"root_str"："(.*?)"';%正则匹配
%  [datafile, data_tokens] = regexp(root_webdata, root_expr, 'match', 'tokens'); %从源文件中获取目标数据
% for i=1:size(root_webdata.data.hots.rpid)
% root(i)=root_webdata.data.hots.rpid(i);
% end


%root_data_struct2cell=struct2cell(root_webdata.data.replies);
for i=1:size(root_webdata.data.replies)
root_temp_mat(i)=root_webdata.data.replies(i,1).rpid;
end

root=num2cell(root_temp_mat);
 T_root=cell2table(root);%转置，元胞转表格并写入
writetable(T_root,'.\root_of_comment.xls');
end