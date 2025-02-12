close all; clc; clear all;
ImRight = imread('S01L.png');
ImLeft = imread('S01R.png');

ImLeft = rgb2gray(ImLeft);
ImRight = rgb2gray(ImRight);

ImLeft = double(ImLeft);
ImRight = double(ImRight);

[row, col] = size(ImLeft);

w1 = 3;
w2 = 40;
k = 1;
    
ImLeft = padarray(ImLeft,[w1+k w2+k],'both');
ImRight = padarray(ImRight,[w1+k w2+k],'both');
    
dispar = zeros(size(ImLeft));
    
for x=w1+k+1:1:row+w1+k
    for y=w1+k+1:1:col+w1+k
        dist = zeros(w2,3);
        for i = w2:-1:1
                SSD = sum(sum((ImLeft(x-w1:x+w1, y+i-w1:y+i+w1)-ImRight(x-w1:x+w1, y-w1:y+w1)).^2));
                comp = [0, i, SSD];
                dist(i,:) = comp(:);
        end
            ind = find(dist(:,3) == min(dist(:,3)));
            dispar(x,y) = dist(ind(1), 2);
    end
end

ImLeft = uint8(ImLeft);
ImRight = uint8(ImRight);

imshow(stereoAnaglyph(ImLeft,ImRight));

figure; imagesc(dispar); colormap jet; colorbar

disparityRange = [0, 96]; disparityMap = disparity(ImLeft, ImRight,'BlockSize', 7,'DisparityRange',disparityRange);
hold on;

figure; imshow(disparityMap,disparityRange); colormap jet; colorbar