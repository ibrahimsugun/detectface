faceDetector=vision.CascadeObjectDetector('FrontalFaceCART'); %yüz bulma dedektörü oluþturuluyor

img=imread('oraybora5.jpg'); %resim yükleniyor



BB=step(faceDetector,img); % resimlerin x y eksenine göre  kordinatlarý BB deðiþkenine atýlýyor

iimg = insertObjectAnnotation(img, 'rectangle', BB, 'Face'); %kordinatlardaki yüzler çerçeveye alýnýyor

figure(1);  %birinci figür gösteriliyor
imshow(iimg); %bibinci figürdeki resim gösteriliyor
title('Detected face'); %resmin baþlýðý




htextinsface = vision.TextInserter('Text', 'face   : %2d', 'Location',  [5 2],'Font', 'Courier New','FontSize', 14);


%imshow(img);
hold on  %resmi donduruyoruz
for i=1:size(BB,1)  %BB deðiþkeninin satýr sayýsýna kadar döner ve herbir yüzü rectangle ile gösterir
    rectangle('position',BB(i,:),'Linewidth',2,'Linestyle','-','Edgecolor','y');
end
hold on %bulunan yüzleri ekranda dondur
N=size(BB,1); %BB deðiþkeninin satýr sayýsýný N deðiþkinine ata
handles.N=N;
counter=1;
for i=1:N
    face=imcrop(img,BB(i,:));
    savenam = strcat('C:\Detect face\' ,num2str(counter), '.jpg'); %resimlerin alýnacaðý klasör yolu
    baseDir  = 'C:\Detect face\TestDatabase\'; %kesilen yüzlerin atýlacaðý klasör
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