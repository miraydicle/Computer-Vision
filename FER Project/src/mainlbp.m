Im = imread('happiness.jpg');

ImLBP = lbp(Im);

figure;
subplot(1,2,1);
imshow (Im);
title('Original Image');

subplot(1,2,2);
imshow (ImLBP);
title('Happiness');
