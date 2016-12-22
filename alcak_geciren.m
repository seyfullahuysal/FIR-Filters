function bn=alcak_geciren(ornekleme_frekansi,kesim_frekansi,katsayi)

% =2*pi*fc*ts
normalize_kesim_frekans=2*pi*(kesim_frekansi/ornekleme_frekansi);
M=(katsayi-1)/2;
index=0;
bn=[];
for i=-M:M
    
    if i==0
       bn(index+1)=normalize_kesim_frekans/pi;
    else
       bn(index+1)=sin(normalize_kesim_frekans*i)/(i*pi);
    end
    index=index+1;
    
end

end

