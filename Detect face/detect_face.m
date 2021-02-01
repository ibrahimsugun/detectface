faceDetector=vision.CascadeObjectDetector('FrontalFaceCART'); %y�z bulma dedekt�r� olu�turuluyor

img=imread('oraybora5.jpg'); %resim y�kleniyor



BB=step(faceDetector,img); % resimlerin x y eksenine g�re  kordinatlar� BB de�i�kenine at�l�yor

iimg = insertObjectAnnotation(img, 'rectangle', BB, 'Face'); %kordinatlardaki y�zler �er�eveye al�n�yor

figure(1);  %birinci fig�r g�steriliyor
imshow(iimg); %bibinci fig�rdeki resim g�steriliyor
title('Detected face'); %resmin ba�l���




htextinsface = vision.TextInserter('Text', 'face   : %2d', 'Location',  [5 2],'Font', 'Courier New','FontSize', 14);


%imshow(img);
hold on  %resmi donduruyoruz
for i=1:size(BB,1)  %BB de�i�keninin sat�r say�s�na kadar d�ner ve herbir y�z� rectangle ile g�sterir
    rectangle('position',BB(i,:),'Linewidth',2,'Linestyle','-','Edgecolor','y');
end
hold on %bulunan y�zleri ekranda dondur
N=size(BB,1); %BB de�i�keninin sat�r say�s�n� N de�i�kinine ata
handles.N=N;
counter=1;
for i=1:N
    face=imcrop(img,BB(i,:));
    savenam = strcat('C:\Detect face\' ,num2str(counter), '.jpg'); %resimlerin al�naca�� klas�r yolu
    baseDir  = 'C:\Detect face\TestDatabase\'; %kesilen y�zlerin at�laca�� klas�r
    %     baseName = 'image_';
    newName  = [baseDir num2str(counter) '.jpg'];
    handles.face=face;
    while exist(newName,'file')
        counter = counter + 1;
        newName = [baseDir num2str(counter) '.jpg'];
    end
    fac=imresize(face,[200,180]);
    imwrite(fac,newName);

figure(2);
imshow(face); 
title('crop pic');
   
    pause(.5);

end