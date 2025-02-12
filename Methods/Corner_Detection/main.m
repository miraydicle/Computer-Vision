%% Kanade-Tomasi Algorithm

clc; clear;
Im = imread('Monastry.bmp');

Thr = 100;

figure;
subplot(1,3,1);
imshow (Im);
hold on;
ImKT = lab4ktcorners(Im,Thr);
%% Harris Algorithm

Im = imread('Monastry.bmp');

Thr = 100;

figure;
subplot(1,3,1);
imshow (Im);
hold on;
ImHar = lab4Harriscorners(Im,Thr);