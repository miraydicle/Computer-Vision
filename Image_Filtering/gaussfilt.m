function [ImGauss] = lab2gaussfilt(Im,k,std)

Im = double(Im);
[row,col] = size(Im);

ImGauss = zeros(row,col);

for i = 1+k:1:row-k
    for j = 1+k:1:col-k
        w = Im(i-k:i+k, j-k:j+k);
        norm = 0; Gauss = 0;
        for x = 1:1:2*k+1
            for y = 1:1:2*k+1
                weight =(1/(2*pi*std^2))*exp(-(((x-1-k)^2+(y-1-k)^2)/(2*std^2)));
                norm = norm + weight;
                Gauss = Gauss + w(x,y)*weight;
            end
        end
        value = Gauss/norm;
        ImGauss(i,j) = value;
    end
end

ImGauss = uint8(ImGauss);

end