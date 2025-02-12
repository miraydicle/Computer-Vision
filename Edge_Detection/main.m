%% Prewitt Filtering

Im = imread('peppers.png');

Thr = 100;
[ImSobelX,ImSobelY,ImGradient,ImEdge] = lab3prewitt(Im,Thr);

figure;
subplot(2,3,1);
imshow (Im);
title('Original Image');

subplot(2,3,2);
imshow (ImSobelX);
title('Prewitt X Filtered Image');

subplot(2,3,3);
imshow (ImSobelY);
title('Prewitt Y Filtered Image');

subplot(2,3,4);
imshow (ImGradient);
title('Prewitt Gradient');

subplot(2,3,5);
imshow (ImEdge);
title('Prewitt Edges');
%% Sobel Filtering

Im = imread('peppers.png');

Thr = 100;
[ImSobelX,ImSobelY,ImGradient,ImEdge] = lab3sobel(Im,Thr);

figure;
subplot(2,3,1);
imshow (Im);
title('Original Image');

subplot(2,3,2);
imshow (ImSobelX);
title('Sobel X Filtered Image');

subplot(2,3,3);
imshow (ImSobelY);
title('Sobel Y Filtered Image');

subplot(2,3,4);
imshow (ImGradient);
title('Sobel Gradient');

subplot(2,3,5);
imshow (ImEdge);
title('Sobel Edges');
%% LOG Filter

Im = imread('Object_contours.jpg');

ImLog = lab3log(Im);

figure;
subplot(1,2,1);
imshow (Im);
title('Original Image');

subplot(1,2,2);
imshow (ImLog);
title('Log Filtered Image');
