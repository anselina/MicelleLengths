function processFolder( minPixels, maxMinorLength, pixels_per_nm )
% processFolder runs everything in folder specified by pathname

filelist = dir ('*.tif');

[x,y] = size(filelist);

for n = 1:x
    
    myImage = imread(filelist(n).name);
    
    myImageBinary = imageCleanup(myImage, minPixels, maxMinorLength);
    
    myImageBinaryFinal = removeVisually(myImageBinary);
    
    [pathstr, name, ext] = fileparts(filelist(n).name);
    
    writeOutput( myImageBinaryFinal, pixels_per_nm, name );
    
end


end

