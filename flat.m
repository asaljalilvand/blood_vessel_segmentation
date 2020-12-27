function [img] = flat(origImg)
img = origImg;

[rows,columns] = size(img);
imgSize = rows * columns;
pixelCount = zeros(1,256);
newPixelCount = zeros(1,256);
pi = zeros(1,256);
fi = zeros(1,256);
transVal = zeros(1,256);

%calculate count of pixels for each intensity
for i=1:rows
    for j=1:columns
        pixelCount(1,img(i,j)+1) = pixelCount(1,img(i,j)+1)+1;
    end
end

%calculate pi for each intensity
for i= 1:256
    pi(1,i) = pixelCount(1,i)/ imgSize;
end

%calculate pi for each intensity
for i = 1:256
    for j=1:i
        fi(1,i) = fi(1,i) + pi(1,j);
    end
end

%calculate transformation value for each intensity
for i = 1:256
    transVal(1,i) = round(255 * fi(1,i));
end

%change pixels intensity with transformation value
for i=1:rows
    for j=1:columns
        img(i,j) = transVal(1,img(i,j)+1);
    end
end

%calculate count of pixels for each intensity in the new image
for i=1:rows
    for j=1:columns
        newPixelCount(1,img(i,j)+1) = newPixelCount(1,img(i,j)+1)+1;
    end
end

end

