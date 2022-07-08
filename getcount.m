function [Len ]= getcount( inimg )
%GETCOUNT Summary of this function goes here
%   Detailed explanation goes here
TC=inimg;
L=bwlabeln(TC); %对连通对象的各个分离部分进行标注,L中包含了连通对象的标注。默认值为8连通。
S=regionprops(L,'Area','Centroid','BoundingBox');  %获取标记图像L中所有区域的一系列特征付给S
cent=cat(1,S.Centroid);%把S.Centroid沿第一维排列
boud=cat(1,S.BoundingBox); %把S.BoundingBox沿第一维排列
allarea=cat(1,S.Area);
Len=length(S); 
area=0;
  
end

