function y= FIR(x,h)

    y=zeros(1,length(x));
    for i=1:1:length(x)
        for j=0:1:length(h)-1
           if (i-j > 0)
              y(i)=y(i)+ h(j+1)*x(i-j) ;
           end
       end
    end
    
end


