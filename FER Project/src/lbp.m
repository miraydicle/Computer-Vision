function [ImLBP] = lbp(Im)

Im = rgb2gray(Im);
Im = double(Im);
Im = imgaussfilt(Im);
[row,col] = size(Im);
ImLBP = zeros(row,col);

Lbp = [128 1 2; 64 0 4; 32 16 8];
Lbp = reshape(Lbp,[1,9]);

for i = 2:1:row-1
    for j = 2:1:col-1
        w = Im(i-1:i+1, j-1:j+1);
        for k = -1:1:1
            for l = -1:1:1
                if w(2,2)<w(2+k,2+l)
                    w(2+k,2+l) = 0;
                else
                    w(2+k,2+l) = 1;
                end
            end
        end
        w = reshape(w, [9,1]);
        value = Lbp*w;
        ImLBP(i,j) = value;
    end
end

ImLBP = uint8(ImLBP);

end