function [FilteredIm] = BoxFilter(Im, k)

[row,col] = size(Im);

for i = 1+k:1:row-k
    for j = 1+k:1:col-k
        w = Im(i-k:i+k, j-k:j+k);
    end
end

FilteredIm = (1/(2*k+1)^2)*w;
end