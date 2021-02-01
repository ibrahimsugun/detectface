function ciktim = eslestir(x, tanim)
if(tanim <= 0.0326)

    if(x==1 ||x ==2 ||x ==3 ||x ==4 ||x ==5 )
        ciktim='Gokhan PALA';
    elseif(x ==6 || x ==7 || x ==8 || x ==9 || x ==10 )
        ciktim='Sahin OZTUK';
    elseif(x ==11 || x ==12 || x ==13 ||x ==14||x ==15)
        ciktim='Hasan BASRI';
    elseif(x ==16 || x ==17 || x ==18 ||x ==19||x ==20)
        ciktim='Tolga TOSUN';
    elseif(x ==21 || x ==22 || x ==23 ||x ==24||x ==25)
        ciktim='Yunus BULBUL';
    elseif(x ==26 || x ==27 || x ==28 ||x ==29||x ==30)
        ciktim='Utku ELNUR';  
    elseif(x ==31 || x ==32 || x ==33 ||x ==34||x ==35)
        ciktim='Mert CETIN'; 
    elseif(x ==36 || x ==37 || x ==38 ||x ==39||x ==40)
        ciktim='Ali OZCETIN';      
    elseif(x ==41 || x ==42 || x ==43 ||x ==44||x ==45)
        ciktim='Veli OZCETIN'; 
    elseif(x ==46 || x ==47 || x ==48 ||x ==49||x ==50)
        ciktim='Bedrettin Kaya';
    elseif(x ==51 || x ==52 || x ==53 ||x ==54||x ==55)
        ciktim='Onder KARLIOGLU';
    elseif(x ==56 || x ==57 || x ==58 ||x ==59||x ==60)
        ciktim='Serhat KALELÝ';
     elseif(x ==61 || x ==62 || x ==63 ||x ==64||x ==65)
        ciktim='Furkan STAJER';
    end
else
    ciktim = 'Taninamadi';
end