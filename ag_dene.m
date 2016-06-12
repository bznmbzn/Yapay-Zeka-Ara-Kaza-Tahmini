 Mehmet Bozan >> Yapay Zeka 
function ag_dene_sonuc = ag_dene(giris,esik,deger,adet,yazdir)
T=1;	
X=zeros(sum(adet),1);
ag_dene_sonuc=zeros(adet(size(adet,2)),1);
X(1:adet(1))=giris(:);
noron=adet(1)+1;
agirlik=1;
beta=adet(1)+1;
z=0;
sayac=1;
for k=1:(size(adet,2)-1)
    for asdf=1:adet(k+1)
        ag=0;
        for i=1:adet(k)
            ag=ag+(X(z+i)*esik(agirlik));
            agirlik=agirlik+1;
        end
        ag=ag+(T*deger(beta));
        X(noron)=logsig(ag);
	if k==(size(adet,2)-1)
	ag_dene_sonuc(sayac)=X(noron);
	sayac=sayac+1;
	end
        noron=noron+1;
        beta=beta+1;
    end
    z=z+adet(k);
end
    ag_dene_sonuc=rot90(ag_dene_sonuc);
    if strcmp(yazdir,'yazdir')
        disp([num2str(giris),' = ',num2str(ag_dene_sonuc)]); 
    end
end
