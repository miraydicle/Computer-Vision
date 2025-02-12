function[Im] = lab4ktcorners(Im,Thr)

Im = double(Im);
Im = imgaussfilt(Im);
[Gx,Gy] = imgradientxy(Im);
[row,col] = size(Gx);
corners = [];

for i = 2:1:row-1
    for j = 2:1:col-1
        wx = Gx(i-1:i+1, j-1:j+1);
        wy = Gy(i-1:i+1, j-1:j+1);
        sumx = 0; sumy = 0; sumxy = 0;
        for x = 1:1:3
            for y = 1:1:3
                sumx = sumx + wx(x,y)^2;
                sumy = sumy + wy(x,y)^2;
                sumxy = sumxy + wx(x,y)*wy(x,y);
            end
        end
        H = [sumx sumxy; sumy sumxy];
        e = eig(H);
        mine = min(e);
        if mine>Thr
            corners = [corners;[i,j]];
        end
    end
end

Im = uint8(Im);
plot(corners(:,2),corners(:,1),'o');

end