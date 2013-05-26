function myImageBinary = imageCleanup(myImage, minPixels, maxMinorLength)
% imageCleanup removes noise and makes binary

% Remove bottom labels
myImage2 = myImage(1:1024,:);
% figure, imshow(myImage2);

% Apply median filter
myImage2 = medfilt2(myImage2); 
% figure, imshow(myImage2);

% Adjust image to increase contrast by 1%
% myImage2 = imadjust(myImage2);
% figure, imshow(myImage2);

% Create binary image
level = graythresh(myImage2);
myImageBinary = im2bw(myImage2,level);
% figure, imshow(myImageBW);

% Correct micelles to value of 1 and background to 0
myImageBinary = 1 - myImageBinary;

% Remove small speckles; any connected regions with less than "minPixels" are removed
myImageBinary = bwareaopen(myImageBinary, minPixels);

% All regions that are on the perimeter are removed
CC = bwconncomp(myImageBinary);
STATS = regionprops(myImageBinary, 'BoundingBox');
[x,y] = size(STATS);

for n = 1:x
    
    x1 = STATS(n).BoundingBox(1);
    y1 = STATS(n).BoundingBox(2);
    xlength = STATS(n).BoundingBox(3);
    ylength = STATS(n).BoundingBox(4);
    
    x2 = x1 + xlength;
    y2 = y1 + ylength;
    
    if ( x1<1 | y1<1 | x2>1023 | y2>1023 )
        myImageBinary(CC.PixelIdxList{n}) = 0;
    end
end

% All regions that are thicker than "maxMinorLength" are removed
CC = bwconncomp(myImageBinary);
STATS = regionprops(myImageBinary, 'MinorAxisLength');
[x,y] = size(STATS);

for n = 1:x
    if (STATS(n).MinorAxisLength > maxMinorLength)
        myImageBinary(CC.PixelIdxList{n}) = 0;
    end
end

% figure, imshow(myImageBinaryCopy);
% title('\bf{Original Binary}','FontSize', 12);

% figure, imshow(myImageBinary);
% title('\bf{Cleaned Binary}','FontSize', 12);

% myImageBWdiff = myImageBinaryCopy - myImageBinary;
% figure, imshow(myImageBWdiff);
% title('\bf{Removed Pixels}','FontSize', 12);

end

