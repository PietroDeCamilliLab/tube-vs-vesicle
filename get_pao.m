function [BW_pao ] = get_pao(A,th_p1)
 
[h,w]=size(A);BW=zeros(h,w);
for bi=1:h
    for bj=1:w
        if A(bi,bj)>th_p1 
            BW(bi,bj)=1;
        end
    end
end
    BW_pao =BW;
end

