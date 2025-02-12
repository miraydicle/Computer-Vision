function [ImSobelX,ImSobelY,ImGradient,ImEdge] = lab3sobel(Im,Thr)

Im = rgb2gray(Im);
Im = double(Im);
[row,col] = size(Im);

ImSobelX = zeros(row,col);
ImSobelY = zeros(row,col);
ImGradient = zeros(row,col);
ImEdge = zeros(row,col);

SobelY = [-1 -2 -1; 0 0 0; 1 2 1];
SobelX = transpose(SobelY);
SobelY = reshape(SobelY,[1,9]);
SobelX = reshape(SobelX,[1,9]);

for i = 2:1:row-1
    for j = 2:1:col-1
        w = Im(i-1:i+1, j-1:j+1);
        w = reshape(w, [9,1]);
        value1 = SobelX*w;
        value2 = SobelY*w;
        ImSobelX(i,j) = value1;
        ImSobelY(i,j) = value2;
        ImGradient(i,j) = sqrt(value1^2+value2^2);
        if ImGradient(i,j)>Thr
            ImEdge(i,j) = ImGradient(i,j);
        end
    end
end

ImSobelX = uint8(ImSobelX);
ImSobelY = uint8(ImSobelY);
ImGradient = uint8(ImGradient);
ImEdge = uint8(ImEdge);

end