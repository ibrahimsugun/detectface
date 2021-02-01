clear all
close all
clc

datapath = 'C:\Matlab\Veritabani'; 
TestImage = 'C:\Matlab\Test\yunusfurkan1.jpg';
A = imread(TestImage);      %TestImage yolundaki resmi okuyup A deðiþkenine atýyoruz.
FaceDetector = vision.CascadeObjectDetector();  %FaceDedector adýnda  yüz bulma nesnesi oluþturuyoruz.Resmimizde Kaskad yüz bulmayý çalýþtýrýyoruz.
BBOX = step(FaceDetector, A); %Bulunan yüzlerin koordinat deðerlerini BBOX þeklinde bir matris olarak alýyoruz.
resimsayisi = size(BBOX,1);  % kordinat deðerlerinin satýr sayýsýný alýyoruz ve resimsayisi diye bir deðiþkene atýyoruz
anaresim = zeros(1,resimsayisi); %resimsayisi deðiþkeninle ayný boyutta bir sýfýr matrisi oluþturuyoruz.
tanit = [];   
for sayi=1:resimsayisi
    I2 = imcrop(A,BBOX(sayi,:)); %bulunan yüz kesiliyor
    I2 = imresize (I2,[200 180]);   %resmin boyutu ayarlanýyor
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

