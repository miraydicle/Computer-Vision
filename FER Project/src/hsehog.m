clear all; close all; clc;

Im = imread("f04_dfh_nx.jpg");
I = rgb2gray(Im);
%I = histeq(I);


[featureVector,hogVisualization] = extractHOGFeatures(I,"CellSize",[24 24], UseSignedOrientation=false);


figure;
imshow(I); 
hold on;
plot(hogVisualization);
