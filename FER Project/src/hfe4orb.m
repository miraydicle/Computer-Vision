clear all; close all; clc;

Im = imread("f04_dfh_nx.jpg");
I = rgb2gray(Im);
points = detectORBFeatures(I);
I = histeq(I);
points2 = detectORBFeatures(I);



figure
imshow(I)
hold on
plot(points.selectStrongest(30), ShowScale=true)
hold on
plot(points2.selectStrongest(30), ShowScale=true)