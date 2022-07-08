close all;clear all;clc;
flag=0;
th_p1=210;th_s1=27;th_s2=80;th_ban=150;%80;
final_table=[];
path1='data';path2='result3';dir1=dir(path1);s1=size(dir1);
for ii=3:  s1(1)%12:13
 ii-2
st1=strcat(path1 ,'\', dir1(ii).name );

A=imread(st1);
[ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
s_name=strcat(path2 ,'\', dir1(ii).name );
 imwrite(B,s_name) ; 
 rate1=num2str(area_si/area_pao*100,'%.2f');
  rate2=num2str(num_si/num_pao*100,'%.2f');
 final_table=[final_table;area_pao,area_si,str2num(rate1),num_si,num_pao,str2num(rate2)];
 save('final_table.mat','final_table')
end