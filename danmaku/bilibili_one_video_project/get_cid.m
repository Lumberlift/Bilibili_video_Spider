function cid=get_cid()
%%---------------只有一个bv号-----------
 bv_num=cellstr(get_bv());
 cid_web_show=char({['https://api.bilibili.com/x/player/pagelist?bvid=',char(bv_num),'&jsonp=jsonp']});
    cid_temp_data=webread(cid_web_show);
    if cid_temp_data.ttl==-400
        fprintf("api请求错误！");
    end
    cid=cid_temp_data.data.cid;
end

% %----------------有多个bv-----------------
% bv_num_mat=get_bv_mat();
% bv_num_mat_num=get_bv_num_mat_num();
% %%只有一个bv号
% % if bv_num_mat_num==1
%     cid_web_show=char({['https://api.bilibili.com/x/player/pagelist?bvid=',char(bv_num_mat),'&jsonp=jsonp']});
%     cid_temp_data=webread(cid_web_show);
% % if ~status
% %     error("出问题了，没能找到显示cid的网址哦")
% % end
% 
% % expr = '"cid":\d{9},"page":';%cid为9位
% % cid = regexp(cid_data, expr, 'match', 'tokens');
% % print(cid);
% 
% % cid_info_data=regexp(cid_temp_data,'"cid":');
% % cid_info_data_down=regexp(webdata,',"page"');
% % cid_data=cid_temp_data(danmakuinfo_data:cid_info_data_down);
% % cid={cid_temp_data(regexpi(cid_temp_data,'/d{9}'))};
%     cid_mat=cid_temp_data.data.cid;
% 
% 
% %%有两个以上的bv号
% % else
% %     for j=1:bv_num_mat_num
% %          cid_web_show=char({['https://api.bilibili.com/x/player/pagelist?bvid=',char(bv_num_mat(j)),'&jsonp=jsonp']});
% %          cid_temp_data=webread(cid_web_show);
% %          cid_mat(j)=cid_temp_data.data.cid;
% %     end
% end





