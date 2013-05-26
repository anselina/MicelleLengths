function writeOutput( myImageBinaryFinal, pixels_per_nm, filename )
% writeOutput writes output into text file

STATS = regionprops(myImageBinaryFinal, 'Perimeter','Area');
[x,y] = size(STATS);

fid = fopen(strcat(filename, '.txt'), 'w');

for n = 1:x
    
    P = STATS(n).Perimeter;
    A = STATS(n).Area;
    
    length = (P + sqrt(P^2 - 16*A))/4;
    
    fprintf(fid,'%f\n', length / pixels_per_nm);
end

fclose(fid);

end

