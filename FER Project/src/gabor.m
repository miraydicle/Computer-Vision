Im = imread('neutral.jpg');
ImG = rgb2gray(Im);
ImGauss = imgaussfilt(ImG);

wavelength = 4;
orientation = 360;
[mag,phase] = imgaborfilt(ImGauss,wavelength,orientation);
tiledlayout(1,3);
nexttile;
imshow(Im);
title('Original Image');
nexttile;
imshow(mag,[]);
title('Gabor Magnitude');
nexttile;
imshow(phase,[]);
title('Gabor Phase');