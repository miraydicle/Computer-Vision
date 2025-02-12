function lab5houghcircles(Im)

Im = double(Im);
Im = imgaussfilt(Im);

Rmin = 20; Rmax = 60;

[centers, radii] = imfindcircles(Im,[Rmin, Rmax]);

figure;
subplot(1,3,1)
imshow(Im)
hold on
viscircles(centers, radii,'Color','b');

[centers, radii, metric] = imfindcircles(Im,[Rmin, Rmax], Sensitivity = 0.9);

subplot(1,3,2)
imshow(Im)
hold on
viscircles(centers, radii,'Color','b');

[centersbright, radiibright, metric] = imfindcircles(Im,[Rmin, Rmax], Sensitivity = 0.9, Objectivity=='bright');
[centersdark, radiidark, metric] = imfindcircles(Im,[Rmin, Rmax], Sensitivity = 0.9, Objectivity=='dark');

subplot(1,3,3)
imshow(Im)
hold on
viscircles(centersbright, radiibright,'Color','b');
viscircles(centersdark, radiidark,'LineStyle','--');
        

end