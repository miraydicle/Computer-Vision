clear all; close all; clc;

Im = imread("f04_dfh_nx.jpg");
I = rgb2gray(Im);

%I = histeq(I);

regions = detectMSERFeatures(I, "MaxAreaVariation", 0.5);


figure; 
imshow(I); 
hold on;
plot(regions,'showPixelList',true,'showEllipses',false);