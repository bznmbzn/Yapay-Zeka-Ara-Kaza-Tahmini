%111503049 Mehmet Bozan >> Yapay Zeka 

%Kullanýlýcak Datalarýmda istatistiksel veriler

adet=[7 14 1];


%x1=Yol Sathýnda Gevþek Mazeme
%x2=Yolda Münferit Çukur
%x3=Tekerlek Ýzinde Oturma
%x4=Kýsmi veya Münferit Çökme
%x5=Düþük Banket
%x6=Köprü Çökmesi
%x7=Heyelandan Dolayý Þerit Çökmesi

girisler=[0 0 0 0 0 0 1;0 0 0 0 0 1 0;0 0 0 0 1 0 0;0 0 0 1 0 0 0;
          0 0 1 0 0 0 0;0 1 0 0 0 0 0;1 0 0 0 0 0 0;0 1 0 1 0 0 0;
          0 1 1 1 0 0 0;1 1 0 0 1 0 1;0 0 1 0 1 0 0];

%x1=%41.72
%x2=%23.87
%x3=%16.56
%x4=%5.48
%x5=%4.62
%x6=%6.56
%x7=%1.18 
      
      
cikislar=[0.012;0.065;0.046;0.054;0.16;0.23;0.42;0.29;0.45;0.66;0.21];





hata_payi=1e-2; 
%datalarýma göre að olustur fonksiyonum.
[esik ,deger]= ag_olustur(adet);

%uygun aðýrlýk degerimi bulana kadar eðitilcek aðým.fonk. olarak çaðrýldý.
[esik ,deger, hata]= ag_egit(girisler,cikislar,esik,deger,adet,hata_payi); 

sonuc=zeros(size(cikislar));
for i=1:size(sonuc,1)
sonuc(i,:)=ag_dene(girisler(i,:),esik,deger,adet,'yazdir'); 
end

