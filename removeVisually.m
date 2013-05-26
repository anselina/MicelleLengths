function myImageBinaryFinal = removeVisually( myImageBinaryOrig )
% removeVisually allows user to visually select micelles to be excluded

fprintf('%s\n\n', 'Select areas to be removed');
figure, title('\bf{Select areas to be removed}','FontSize', 12);
myImageBinary2 = bwselect(myImageBinaryOrig);


figure, imshow(myImageBinary2);
title('\bf{Areas removed}','FontSize', 12);

myImageBinaryFinal = im2bw(myImageBinaryOrig - myImageBinary2);
figure, imshow(myImageBinaryFinal);
title('\bf{Final Binary}','FontSize', 12);

end

