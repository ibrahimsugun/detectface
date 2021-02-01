clear all
close all
clc

datapath = 'C:\Matlab\Veritabani'; 
TestImage = 'C:\Matlab\Test\yunusfurkan1.jpg';
A = imread(TestImage);      %TestImage yolundaki resmi okuyup A de�i�kenine at�yoruz.
FaceDetector = vision.CascadeObjectDetector();  %FaceDedector ad�nda  y�z bulma nesnesi olu�turuyoruz.Resmimizde Kaskad y�z bulmay� �al��t�r�yoruz.
BBOX = step(FaceDetector, A); %Bulunan y�zlerin koordinat de�erlerini BBOX �eklinde bir matris olarak al�yoruz.
resimsayisi = size(BBOX,1);  % kordinat de�erlerinin sat�r say�s�n� al�yoruz ve resimsayisi diye bir de�i�kene at�yoruz
anaresim = zeros(1,resimsayisi); %resimsayisi de�i�keninle ayn� boyutta bir s�f�r matrisi olu�turuyoruz.
tanit = [];   
for sayi=1:resimsayisi
    I2 = imcrop(A,BBOX(sayi,:)); %bulunan y�z kesiliyor
    I2 = imresize (I2,[200 180]);   %resmin boyutu ayarlan�yor
    [taninma dbadi recog_img] = pcayontemi(datapath,I2);
    taninma
    dbadi
    recog_img
    anaresim(1,sayi) = dbadi;
    tanit(sayi) = taninma;
end

word = cell(1); 
for i=1:length(anaresim)
    olanbu = eslestir(anaresim(i), tanit(i));
    word(i) = {olanbu};
end
B = insertObjectAnnotation(A,'rectangle', BBOX, word,'TextBoxOpacity',0.8,'FontSize',50);
imshow(B);

