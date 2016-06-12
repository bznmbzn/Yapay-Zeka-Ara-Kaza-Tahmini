%111503049 Mehmet Bozan >> Yapay Zeka 

%Kullan�l�cak Datalar�mda istatistiksel veriler

adet=[7 14 1];


%x1=Yol Sath�nda Gev�ek Mazeme
%x2=Yolda M�nferit �ukur
%x3=Tekerlek �zinde Oturma
%x4=K�smi veya M�nferit ��kme
%x5=D���k Banket
%x6=K�pr� ��kmesi
%x7=Heyelandan Dolay� �erit ��kmesi

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
%datalar�ma g�re a� olustur fonksiyonum.
[esik ,deger]= ag_olustur(adet);

%uygun a��rl�k degerimi bulana kadar e�itilcek a��m.fonk. olarak �a�r�ld�.
[esik ,deger, hata]= ag_egit(girisler,cikislar,esik,deger,adet,hata_payi); 

sonuc=zeros(size(cikislar));
for i=1:size(sonuc,1)
sonuc(i,:)=ag_dene(girisler(i,:),esik,deger,adet,'yazdir'); 
end

