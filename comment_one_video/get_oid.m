function oid=get_oid()

%%---------------只有一个bv号-----------
 bv_num=cellstr(get_bv());
 oid_web_show=char({['https://www.bilibili.com/video/',char(bv_num)]});
    oid_temp_data=webread(oid_web_show);
%     if oid_temp_data.ttl==-400
%         fprintf("api请求错误！");
%     end
%  av_bv_info_data=regexp(webdata,'<source>k-v</source>','end');
%  av_bv_info_data_down=regexp(webdata,'</i>');
%  av_bv_data=webdata(av_bv_info_data:av_bv_info_data_down);
 expr2 = '"aid":(.*?),"bvid"';%弹幕正则匹配
 [datafile, data_tokens] = regexp(oid_temp_data, expr2, 'match', 'tokens'); %从源文件中获取目标数据
 oid=data_tokens(1);
   % oid=oid_temp_data.data.cid;
end





% %%---------------只有一个bv号-----------
% %注意！【数组从1开始】
%  bv_num=cellstr(get_bv());
%  table={'f','Z','o','d','R','9','X',...
%      'Q','D','S','U','m','2','1','y',...
%      'C','k','r','6','z','B','q','i',...
%      'v','e','Y','a','h','8','b','t',...
%      '4','x','s','W','p','H','n','J',...
%      'E','7','j','L','5','V','G','3',...
%      'g','u','M','T','K','N','P','A',...
%      'w','c','F'};
% tr=zeros(1,3000);
% table_mat=cell2mat(table);
% for i=1:58
% 	tr(table_mat(i))=i;
% end
% s=[11,10,3,8,4,6];
% xor_num=177451812;
% add=8728348608;
% 
% bv_mat=cell2mat(bv_num);
% bv_single_char=[];
% for i=1:12
% bv_single_char(i)=bv_mat(i);
% end
% 
% %%从BV到oid
% % def dec(x):
% r=0;
% for i =1:6
% 		r=r+(tr(bv_single_char(s(i)-1)-1))*58^(i-1);
% end
% 
% final_r=r-add;
% oid=bitxor(final_r,xor_num);
% end
% %%从oid到BV
% %enc(x)
% % 	x=(x^xor)+add
% % 	r=list('BV1  4 1 7  ')
% % 	for i in range(6):
% % 		r[s[i]]=table[x//58**i%58]
% % 	return ''.join(r)
% 
% % print(dec('BV17x411w7KC'))
% % print(dec('BV1Q541167Qg'))
% % print(dec('BV1mK4y1C7Bz'))
% % print(enc(170001))
% % print(enc(455017605))
% % print(enc(882584971))


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





