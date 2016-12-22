function [y,w] = adaptive_filter(x,h,w)
%UNTİTLED2 Summary of this function goes here
%   Detailed explanation goes here
    e=zeros(1,length(x));
    y=zeros(1,length(x));
    for i=1:1:length(x)
        for j=0:1:length(h)-1
           if (i-j > 0)
              y(i)=(y(i)+ h(j+1)*x(i-j))*w;
           end
        end  
        e(i)=x(i)-y(i);
        w=w+e(i)*y(i);
        
    end

end

