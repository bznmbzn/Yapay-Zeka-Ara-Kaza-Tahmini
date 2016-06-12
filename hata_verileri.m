% Mehmet Bozan >> Yapay Zeka 
function donus=hata_verileri(a,beklenen_degerim)
i=size(beklenen_degerim,1)*size(beklenen_degerim,2);
j=size(a,1)*size(a,2);
hata=zeros(i,1);
while i>0
hata(i)=abs(a(j)-beklenen_degerim(i));
i=i-1;
j=j-1;
end
donus=max(hata(:));
end
