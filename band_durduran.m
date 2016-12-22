function bn= band_durduran(ornekleme_frekansi,dusuk_kesim_frekans,yuksek_kesim_frekans,katsayi)

% =2*pi*fc*ts
dusuk_normalize_kesim_frekans=2*pi*(dusuk_kesim_frekans/ornekleme_frekansi);
yuksek_normalize_kesim_frekans=2*pi*(yuksek_kesim_frekans/ornekleme_frekansi);
M=(katsayi-1)/2;

index=0;
bn=[];
for i=-M:M
    
    if i==0
       bn(index+1)=(pi-yuksek_normalize_kesim_frekans+dusuk_normalize_kesim_frekans)/pi;
    else
       bn(index+1)=(sin(dusuk_normalize_kesim_frekans*i)/(i*pi))-(sin(yuksek_normalize_kesim_frekans*i)/(i*pi));
    end
    index=index+1;
    
end

end

