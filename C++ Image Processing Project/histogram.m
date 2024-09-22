% Read and show the image lowcontrast.jpg 
lowcontrast = imread('lowcontrast.jpg'); 
imshow(lowcontrast); 
% Ensure the image is in uint8 format for histogram calculation 
if ~isa(lowcontrast, 'uint8') 
lowcontrast = im2uint8(lowcontrast); 
end 
% Flatten the image to get pixel values as a one-dimensional array 
pixel_values = lowcontrast(:); 
% If pixel_values is not double, convert it to double 
if ~isa(pixel_values, 'double') 
pixel_values = double(pixel_values); 
end 
% Display histogram with 256 bins 
figure; 
hist(pixel_values, 256); 
title('Histogram of Original Image'); 
% Use histeq to enhance contrast using histogram equalization 
lowcontrast_eq = histeq(lowcontrast); 
% Display the enhanced image 
figure; 
imshow(lowcontrast_eq); 
title('Enhanced Contrast Image'); 
% Display histogram of the enhanced image 
figure; 
pixel_values_eq = lowcontrast_eq(:); 
hist(pixel_values_eq, 256); 
title('Histogram of Enhanced Image');
