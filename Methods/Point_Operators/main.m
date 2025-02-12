%% Histogram Equalization
clc; clear;

Im = imread('city.png');

histeqIm = histeq(img);

figure;
subplot(1,2,1);
imhist (Im);
subplot(1,2,2);
imhist (histeqIm);

%% Linear Scaling

Im = imread('city.png');

ImLinear = LinearScale(Im);

figure;
subplot(1,2,1);
imhist (Im);
subplot(1,2,2);
imhist (ImLinear);

%% Conditional Scaling

ImJ = imread('city.png');
ImI = imread('board.jpg');

ImJnew = ConditionalScale(ImJ);

figure;
subplot(1,2,1);
imshow (ImJ);
subplot(1,2,2);
imshow (ImJnew);

%% Local Mean Filter

Im = imread('jump.png');

ImFilt = BoxFilter(Im);

figure;
subplot(1,2,1);
imshow (Im);
subplot(1,2,2);
imshow (ImFilt);

%% Local Max Min

Im = imread('currentImage.png');

