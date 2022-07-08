function [C1,area_pao,area_si,num_si,num_pao  ] = get_sipao(img,th_p1,th_s1,th_s2,th_ban)

A=img;
BW_pao = get_pao(A,th_p1);
 [BW_si] = get_si(A,th_s1,th_s2,BW_pao);
  
 
BW = bwareaopen(BW_si, 50);%小斑阈值
 
% BW =bwfill(BW ,'holes');
SE=strel('disk',1); 
BW =imdilate(BW,SE);th_ban=fix(th_ban);
BW = bwareaopen(BW, th_ban);%小于th_ban=200则不是丝 
BW =imerode(BW,SE);
 [h,w]=size(A);
 
C1=zeros(h,w,3);C1(:,:,1)=A;C1(:,:,2)=A;C1(:,:,3)=A;C1=uint8(C1);
[y,x]=find(BW>0); 
area_si=length(y);   num_si= getcount( BW);
for dii=1:area_si
    C1(y(dii),x(dii),2)=255;C1(y(dii),x(dii),1)=0;C1(y(dii),x(dii),3)=0; 
end

[y,x]=find(BW_pao>0);  
  area_pao=length(y);  num_pao= getcount( BW_pao ); 
for dii=1:area_pao
    C1(y(dii),x(dii),2)=0;C1(y(dii),x(dii),1)=255;C1(y(dii),x(dii),3)=0;
end


end

