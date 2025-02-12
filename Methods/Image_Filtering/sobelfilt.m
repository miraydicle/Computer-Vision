function [ImVer,ImHor] = lab2sobelfilt(Im)

Im = double(Im);
[row,col] = size(Im);

ImVer = zeros(row,col);
ImHor = zeros(row,col);

SobelY = [1 2 1; 0 0 0; -1 -2 -1];
SobelX = transpose(SobelY);
SobelY = reshape(SobelY,[1,9]);
SobelX = reshape(SobelX,[1,9]);

for i = 2:1:row-1
    for j = 2:1:col-1
        w = Im(i-1:i+1, j-1:j+1);
        w = reshape(w, [9,1]);
        value1 = SobelX*w;
        value2 = SobelY*w;
        ImVer(i,j) = value1;
        ImHor(i,j) = value2;
    end
end

ImVer = uint8(ImVer);
ImHor = uint8(ImHor);

end