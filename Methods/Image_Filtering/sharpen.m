function [ImSharp] = lab2sharpen(Im,lamda,M)

Im = double(Im);
ImG = double(M);

ImSharp = Im + lamda*(Im - ImG);

ImSharp = uint8(ImSharp);

end