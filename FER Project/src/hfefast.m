clear all; close all; clc;

Im = imread("f04_dfh_nx.jpg");
ImGray = rgb2gray(Im);

%ImGray = histeq(ImGray);

corners = detectFASTFeatures(ImGray, 'MinContrast',0.0001,'MinQuality',0.05);
J = insertMarker(ImGray,corners,'circle');

imshow(J)
