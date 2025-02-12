function [ImLog] = lab3log(Im)

Im = rgb2gray(Im);
Im = double(Im);
Im = imgaussfilt(Im);
[row,col] = size(Im);
ImLog = zeros(row,col);

Log = [0 1 0; 1 -4 1; 0 1 0];
Log = reshape(Log,[1,9]);

for i = 2:1:row-1
    for j = 2:1:col-1
        w = Im(i-1:i+1, j-1:j+1);
        w = reshape(w, [9,1]);
        value = Log*w;
        ImLog(i,j) = value;
    end
end

plot(ImLog(row/2,30:60));
xlabel('Pixel Location');
ylabel('Gradient Magnitude');
title('Gradient Profile');

ImLog = uint8(ImLog);

end