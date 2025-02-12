function [ImMed] = lab2medfilt(Im,k)

Im = double(Im);
[row,col] = size(Im);

ImMed = zeros(row,col);

for i = 1+k:1:row-k
    for j = 1+k:1:col-k
        w = Im(i-k:i+k, j-k:j+k);
        data = reshape(w,1,[]);
        ImMed(i,j) = median((data));
    end
end

ImMed = uint8(ImMed);

end