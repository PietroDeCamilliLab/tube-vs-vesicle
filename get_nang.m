function [PIC_pao ] = get_nang(img,th_p1,th_s1,th_s2,th_ban)

A=img;
BW_pao = get_pao(A,th_p1);
 [BW_si] = get_si(A,th_s1,th_s2,BW_pao);
  
 
BW = bwareaopen(BW_si, 50);%小斑阈值
 
% BW =bwfill(BW ,'holes');
SE=strel('disk',1); 
BW =imdilate(BW,SE);th_ban=fix(th_ban);
BW = bwareaopen(BW, th_ban);%小于th_ban=200则不是丝 
BW =imerode(BW,SE);

 

PIC_pao=BW_pao;
end




