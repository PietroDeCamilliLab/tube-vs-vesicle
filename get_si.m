function [BW_si] = get_si(A,th_s1,th_s2,BW_pao)
 th_si_thickness=4;%丝厚度，去除空管现象
[h,w]=size(A);BW=zeros(h,w);B=zeros(h,w);

for bi=1:h
    for bj=1:w
        if A(bi,bj)>th_s1&&A(bi,bj)<th_s2
            A(bi,bj)=255;
            B(bi,bj)=1;
        else
           A(bi,bj)=0; 
           B(bi,bj)=0;
        end
    end
end
     
% TC=bwfill(B,'holes');
% figure,imshow(TC);
for ci=1:h-7
    for cj= 1:w-7
        for di=1:th_si_thickness
        if  A(ci,cj)==255&&A(ci,cj+di)==255
            for ei=1:di
                A(ci,cj+ei)=255;
            end
        end
        end
    end
end
            
%%%%%%%%%%%%
for i=4:h-4
    for j= 4:w-4
        if BW_pao(i,j)>0
            for ii=-2:2
                for jj=-2:2
            A(i+ii,j+jj)=0;
                end
            end
        end
    end
end
BW_si= A;
% BW_si= im2bw(A,0.495);
        

end

