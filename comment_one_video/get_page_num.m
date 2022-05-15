function page_num=get_page_num(root)
%每一个评论的root后面所带的->"sub_reply_entry_text":"共473条回复"
oid_cell=get_oid();
 oid=oid_cell{1,1};
 page_url=char({['https://api.bilibili.com/x/v2/reply/reply?&pn=1&type=1&oid=',char(oid),'&sort=2&root=',char(num2str(root))]});
 page_webdata=webread(page_url);%获取网页信息
% 
%  if page_webdata.code~=(-400)
%  fprintf("获得root后面的回复页数信息了！\n");
%  end
  page_num=page_webdata.data.page.count(1,1);
end