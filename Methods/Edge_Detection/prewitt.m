function [ImPrewX,ImPrewY,ImGradient,ImEdge] = lab3prewitt(Im,Thr)

Im = rgb2gray(Im);
Im = double(Im);
[row,col] = size(Im);

ImPrewX = zeros(row,col);
ImPrewY = zeros(row,col);
ImGradient = zeros(row,col);
ImEdge = zeros(row,col);

PrewY = [-1 -1 -1; 0 0 0; 1 1 1];
PrewX = transpose(PrewY);
PrewY = reshape(PrewY,[1,9]);
PrewX = reshape(PrewX,[1,9]);

for i = 2:1:row-1
    for j = 2:1:col-1
        w = Im(i-1:i+1, j-1:j+1);
        w = reshape(w, [9,1]);
        value1 = PrewX*w;
        value2 = PrewY*w;
        ImPrewX(i,j) = value1;
        ImPrewY(i,j) = value2;
        ImGradient(i,j) = sqrt(value1^2+value2^2);
        if ImGradient(i,j)>Thr
            ImEdge(i,j) = ImGradient(i,j);
        end
    end
end

ImPrewX = uint8(ImPrewX);
ImPrewY = uint8(ImPrewY);
ImGradient = uint8(ImGradient);
ImEdge = uint8(ImEdge);

end