close all;clear all;clc;
flag=1;
th_p1=210;th_s1=27;th_s2=80;th_ban=150;%80;
% th_p1=210;th_s1=23;th_s2=80;%80;
path1='data';path2='result';dir1=dir(path1);s1=size(dir1);
for ii=3:  3%12:13

st1=strcat(path1 ,'\', dir1(ii).name );
% st1='data\1.png';
A=imread(st1);
BW_pao = get_pao(A,th_p1);
 [BW_si] = get_si(A,th_s1,th_s2,BW_pao);
 if flag>0
figure,imshow(A);
figure,imshow(BW_pao );title('BW_pao');
figure,imshow(BW_si);title('BW_si');
level = graythresh(A); BW=im2bw(A,level );
 end
BW = bwareaopen(BW_si, 50);
% figure,imshow(BW);figure,imshow(A);
% [y,x]=find(bw_mb>0);hold on, plot(x, y,'g.', 'MarkerSize',1);

% BW =bwfill(BW ,'holes');
SE=strel('disk',1); %圆盘
BW =imdilate(BW,SE);%膨胀
BW = bwareaopen(BW, 200);
BW =imerode(BW,SE);%腐蚀
figure,imshow(BW);
figure,
% subplot(1,2,1),imshow(A);subplot(1,2,2),
imshow(A);hold on;
[y,x]=find(BW>0);plot(x, y,'g.', 'MarkerSize',1);
[y,x]=find(BW_pao>0); plot(x, y,'r.', 'MarkerSize',1);
s_name=strcat(path2 ,'\', dir1(ii).name );
 saveas(gcf, s_name) ; 
end