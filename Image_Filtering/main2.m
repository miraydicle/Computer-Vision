%% Gaussian Filter

Im = imread('jump.png');

k = 2; std = 1;
ImGauss = lab2gaussfilt(Im,k,std);

figure;
subplot(1,2,1);
imshow (Im);
title('Original Image');

subplot(1,2,2);
imshow (ImGauss);
title('Gaussian Filtered Image');
%% Median Filtering

Im = imread('Tiger.png');

k = 3;
ImMed = lab2medfilt(Im,k);

figure;
subplot(1,2,1);
imshow (Im);
title('Original Image');

subplot(1,2,2);
imshow (ImMed);
title('Median Filtered Image');
%% Sharpening

Im = imread('mother.png');

lamda = 1;
M = imgaussfilt(Im);
ImSharp = lab2sharpen(Im,lamda,M);

figure;
subplot(1,2,1);
imshow (Im);
title('Original Image');

subplot(1,2,2);
imshow (ImSharp);
title('Sharpened Image');
%% Sobel Filtering

Im = imread('house.png');

[ImVer,ImHor] = lab2sobelfilt(Im);

figure;
subplot(1,3,1);
imshow (Im);
title('Original Image');
subplot(1,3,2);
imshow (ImVer);
title('Sobel Vertical Image');
subplot(1,3,3);
imshow (ImHor);
title('Sobel Horizontal Image');