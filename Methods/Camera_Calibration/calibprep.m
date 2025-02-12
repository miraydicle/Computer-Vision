
Im = imread('calibrationObject.png');
ImBW = rgb2gray(Im);
ImC = edge(ImBW,'Canny');

[H,T,R] = hough(ImC);

P = houghpeaks(H,25,'threshold',ceil(0.5*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));

lines = houghlines(ImC,T,R,P,'FillGap',25,'MinLength',25);

figure;
imshow(ImBW);
hold on;

max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end

x = 0:0.1:300;
y = (173 - x*cos(63))/sin(63);

figure;
imshow(ImBW);
hold on;
plot(x,y,'LineWidth',2,'Color','magenta');

x = 0:0.1:300;
y = (-42 - x*cos(77))/sin(77);

hold on;
plot(x,y,'LineWidth',2,'Color','magenta');

hold on;
plot(198.31,91.87,'o','MarkerSize',3,'LineWidth',1,'Color','magenta');

