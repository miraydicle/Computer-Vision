function [ImJnew] = ConditionalScale(ImJ, ImI)

ImJnew = double(ImJ);
ImInew = double(ImI);

meanJ = mean(ImJnew);
meanI = mean(ImInew);

stdJ = std(ImJnew);
stdI = std(ImInew);

a = meanI*(stdJ/stdI)-meanJ;
b = stdI/stdJ;

ImJnew = b*(ImJ+a);

ImJnew = uint8(ImJ);
end