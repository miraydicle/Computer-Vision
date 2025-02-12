%% Line Detection

Im = imread('checker.jpg');

[ImBW,T,R] = lab5houghlines(Im);

figure;
subplot(2,2,1);
imshow(Im);
title('Original Image');

subplot(2,2,2);
imshow(ImBW);
title('Edges');

%% Circle Detection

Im = imread('circlesBrightDark.png');
lab5houghcircles(Im);
