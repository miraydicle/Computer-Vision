faceDetector = vision.CascadeObjectDetector()
vidReader = VideoReader('neutral.mp4');
h = figure;
movegui(h);
hViewPanel = uipanel(h,'Position',[0 0 1 1],'Title','Plot of Optical Flow Vectors');
hPlot = axes(hViewPanel);
while hasFrame(vidReader)
    frameRGB = readFrame(vidReader);
    bbox = step(faceDetector, frameRGB);
    frameGray = im2gray(frameRGB);
    newFrame = imcrop(frameGray,bbox);
    opticFlow = opticalFlowHS
    flow = estimateFlow(opticFlow,newFrame);
    imshow(newFrame)
    hold on
    plot(flow,'DecimationFactor',[5 5],'ScaleFactor',60,'Parent',hPlot);
    hold off
    pause(10^-3)
end


