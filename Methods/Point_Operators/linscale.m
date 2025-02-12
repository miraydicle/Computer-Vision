function [imgLinear] = LinearScale(Im)

imgnew = double(Im);

umin = min(imgnew(:));
umax = max(imgnew(:));

gmax = 255;

a = -1*umin;
b = gmax/(umax-umin);

imgLinear = b*(imgnew+a);

imgnew = uint8(imgnew);

end