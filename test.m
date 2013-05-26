% These parameters can be adjusted as needed

% Any connected regions less than "minPixels" are removed
% All regions thicker than "maxMinorLength" are removed
% pixels_per_nm depends on the resolution of the image to be processed

minPixels = 50;
maxMinorLength = 5; 
pixels_per_nm = 0.05409;


processFolder( minPixels, maxMinorLength, pixels_per_nm );