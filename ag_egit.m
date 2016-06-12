Mehmet Bozan >> Yapay Zeka 
function [esik,B,hata] = ag_egit(girisler,cikislar,esik,B,adet,hata_payi) 

% hata=1;
% ag_ciktisi = zeros(4,1);
% tplm_hata = []; 
% sayac=0;
% kiyasla = zeros(4,2);

a=0.4;	
b=0.6;	
T=1;	
j=0;

% for i=1:4
%     Net1(i) = x1(i) * w(1) + x2(i)* w(2) + Bias * w(7); % net1 e giren degerler
%     Net2(i) = x1(i) * w(3) + x2(i)* w(4) + Bias * w(8); 
%     
%     cNet1(i) = 1/(1+exp(-Net1(i))); %sigmoid fonk.
%     cNet2(i) = 1/(1+exp(-Net2(i)));
%     
%     Net3(i) = cNet1(i) * w(5) + cNet2(i) * w(6) + Bias * w(9);
%     cNet3(i) = 1/(1+exp(-Net3(i)));
%     
%     hata = hata + abs(T(i) - cNet3(i)); % hatalari topla
%     
%     Sm3 = cNet3(i) * (1 - cNet3(i)) * (T(i) - cNet3(i)); %net3
%     Sm2 = cNet2(i) * (1 - cNet2(i)) * (Sm3 * w(6));
%     Sm1 = cNet1(i) * (1 - cNet1(i)) * (Sm3 * w(5)); 
%     
%     delta_W(1) = Lam * Sm1 * x1(i) + alf * delta_W(1); % agirliklari guncelle
%     delta_W(2) = Lam * Sm1 * x2(i) + alf * delta_W(2);
%     
%     delta_W(3) = Lam * Sm2 * x1(i) + alf * delta_W(3);
%     delta_W(4) = Lam * Sm2 * x2(i) + alf * delta_W(4);
%     
%     delta_W(5) = Lam * Sm3 * cNet1(i) + alf * delta_W(5);
%     delta_W(6) = Lam * Sm3 * cNet2(i) + alf * delta_W(6);
%     
%     delta_W(7) = Lam * Sm1 * Bias + alf * delta_W(7);
%     delta_W(8) = Lam * Sm2 * Bias + alf * delta_W(8);
%     delta_W(9) = Lam * Sm3 * Bias + alf * delta_W(9);
%     
%     for j=1:9
%       w(j) = w(j) + delta_W(j); % yeni agirlik
%     end
%     ag_ciktisi(i)=cNet3(i);
%     
%   end
%     tplm_hata=[tplm_hata,hata];
% end

for i=2:size(adet,2)
    j=j+(adet(i-1)*adet(i));
end
deg_esik=zeros(j,1);
X=zeros(sum(adet),1);
deg_B=zeros(sum(adet),1);
hata_sayac=0;
hata=[];

while true
hata_sayac=hata_sayac+1;
hata(hata_sayac)=0;
for dongu=1:size(girisler,1)
beklenen=cikislar(dongu,:);
X(1:adet(1))=girisler(dongu,:);
noron=adet(1)+1;
agirlik=1;
beta=adet(1)+1;
z=0;
for k=1:(size(adet,2)-1)
    for asdf=1:adet(k+1)
        ag=0;
        for i=1:adet(k)
            ag=ag+(X(z+i)*esik(agirlik));
            agirlik=agirlik+1;
        end
        ag=ag+(T*B(beta));
        X(noron)=logsig(ag);
        noron=noron+1;
        beta=beta+1;
    end
    z=z+adet(k);
end
agirlik=agirlik-1;
yeni_hata=hata_verileri(X,beklenen);
if yeni_hata>hata(hata_sayac)
hata(hata_sayac)=yeni_hata;
end

S=zeros(sum(adet),1);
z=sum(adet);
i=adet(size(adet,2));

% for i=1:4
%     Net1(i) = x1(i) * w(1) + x2(i)* w(2) + Bias * w(7);
%     Net2(i) = x1(i) * w(3) + x2(i)* w(4) + Bias * w(8); 
%     
%     cNet1(i) = 1/(1+exp(-Net1(i)));
%     cNet2(i) = 1/(1+exp(-Net2(i)));
%     
%     Net3(i) = cNet1(i) * w(5) + cNet2(i) * w(6) + Bias * w(9);
%     cNet3(i) = 1/(1+exp(-Net3(i)));
%     cNet3(i)
%     kiyasla(i,1) = T(i);
%     kiyasla(i,2) = cNet3(i);
% end

while z>(sum(adet)-adet(size(adet,2)))
S(z)=(beklenen(i)-X(z))*X(z)*(1-X(z));
z=z-1;
i=i-1;
end
agirlik2=agirlik;
agirlik3=agirlik;
yedek_agirlik=agirlik;
for k=(size(adet,2)-1):-1:2
for i=1:adet(k)
S(z)=X(z)*(1-X(z));
Ssum=0;
for j=sum(adet(1:k+1)):-1:(sum(adet(1:k))+1)
Ssum=Ssum+(S(j)*esik(agirlik2));
agirlik2=agirlik2-adet(k);
end
S(z)=S(z)*Ssum;
z=z-1;
agirlik=agirlik-1;
agirlik3=agirlik2;
agirlik2=agirlik;
end
agirlik2=agirlik3;
agirlik=agirlik3;
end
agirlik=yedek_agirlik;


z=sum(adet);
noron=z-adet(size(adet,2));
for k=(size(adet,2)-1):-1:1
for j=0:(adet(k+1)-1)
for i=0:(adet(k)-1)
deg_esik(agirlik)=(a*X(noron-i)*S(z-j))+(b*deg_esik(agirlik));
agirlik=agirlik-1;
end
end
z=noron;
noron=noron-adet(k);
end


for i=(adet(1)+1):sum(adet)
deg_B(i)=(a*S(i))+(b*deg_B(i));
end


esik=esik+deg_esik;
B=B+deg_B;

end	


if hata(hata_sayac)<=hata_payi
break;
end

end	
figure, subplot(1,2,2);
plot(hata,'b','LineWidth',2);
xlabel('Iterasyon','FontSize',10,'Color','b');
ylabel('Hata','FontSize',10,'Color','b');
xlim([1 size(hata,2)]);

sonuc=zeros(size(cikislar));
for i=1:size(sonuc,1)
sonuc(i,:)=ag_dene(girisler(i,:),esik,B,adet,'yazdirma'); 

subplot(1,2,1);
h1=plot(cikislar,'b');
hold on;
h2=plot(sonuc,'g:');
xlabel('Eðitilen Giriþler','FontSize',10,'Color','b');
ylabel('Deðer','FontSize',10,'Color','b');
ylim([-0.01 max(cikislar(:))+0.01]);
legend([h1(1),h2(1)],'Beklenen','Að Çýktýlarý','Location','northwest','Orientation','horizontal');

end	

