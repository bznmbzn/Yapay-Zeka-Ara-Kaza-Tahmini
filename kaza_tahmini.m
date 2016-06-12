%Mehmet Bozan >> Yapay Zeka 

%Kullanılıcak Datalarımda istatistiksel veriler

adet=[7 14 1];


%x1=Yol Sathında Gevşek Mazeme
%x2=Yolda Münferit Çukur
%x3=Tekerlek İzinde Oturma
%x4=Kısmi veya Münferit Çökme
%x5=Düşük Banket
%x6=Köprü Çökmesi
%x7=Heyelandan Dolayı Şerit Çökmesi

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
%datalarıma göre ağ olustur fonksiyonum.
[esik ,deger]= ag_olustur(adet);

%uygun ağırlık degerimi bulana kadar eğitilcek ağım.fonk. olarak çağrıldı.
[esik ,deger, hata]= ag_egit(girisler,cikislar,esik,deger,adet,hata_payi); 

sonuc=zeros(size(cikislar));
for i=1:size(sonuc,1)
sonuc(i,:)=ag_dene(girisler(i,:),esik,deger,adet,'yazdir'); 
end

