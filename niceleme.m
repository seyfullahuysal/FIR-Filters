function sonuc=niceleme(sinyal,seviye)

seviye=2^seviye;
xmin=min(sinyal);
xmax=max(sinyal);
adim_araligi=(xmax-xmin)/seviye;
sonuc=[];

for i=1:length(sinyal)
    sonuc(i)=floor((sinyal(i)-xmin)/adim_araligi);
    sonuc(i)=xmin+sonuc(i)*adim_araligi;
    
end


end

