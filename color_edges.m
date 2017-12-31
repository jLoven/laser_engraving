% Jackie Loven
% 31 December 2017
% Converts a photo with low grayscale constrast to an engravable trace.
% Uses coloredges.m from 
% https://www.mathworks.com/matlabcentral/fileexchange/28114-fast-edges-of-a-color-image--actual-color--not-converting-to-grayscale-

close all;
clear all;
original = imread('/Users/platypus/Desktop/random_stuff/code/matlab/papa_photo_for_engraving/img.jpg');
originalCopy = original;

% get color edges and normalize magnitude
edges = coloredges(originalCopy);
edges = edges / max(edges(:));

% invert image
complement = imcomplement(edges);
binaryImage = imbinarize(complement,'adaptive','ForegroundPolarity','dark', 'Sensitivity', 0.6);
imwrite(binaryImage,'/Users/platypus/Desktop/random_stuff/code/matlab/papa_photo_for_engraving/img_for_engraving.png')

imshow(binaryImage)