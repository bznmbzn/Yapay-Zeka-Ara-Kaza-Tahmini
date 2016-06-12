%111503049 Mehmet Bozan >> Yapay Zeka 
function [esik,deger]= ag_olustur(adet)

deger=rand(sum(adet),1);
toplam=0;
for i=1:(size(adet,2)-1)
toplam=toplam+(adet(i)*adet(i+1));
end
esik=rand(toplam,1);

end