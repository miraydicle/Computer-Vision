function [ImBW,H,T,R] = lab5houghlines(Im)

Im = rgb2gray(Im);
Im = double(Im);
Im = imgaussfilt(Im);
ImBW = edge(Im,'Canny');
[H,T,R] = hough(ImBW);

imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'); ylabel('\rho');
title('Hough Transform');
axis on; axis normal; hold on;
colormap(gca,hot);

P = houghpeaks(H,20,'threshold',ceil(0.5*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');

lines = houghlines(ImBW,T,R,P,'FillGap',10,'MinLength',40);

ImBW = uint8(ImBW);

figure;
imshow(ImBW);
hold on;

max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   else
       xy_short = xy;
   end
end

plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
plot(xy_short(:,1),xy_short(:,2),'LineWidth',2,'Color','red');

end