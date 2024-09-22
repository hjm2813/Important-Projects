% a) Read and show the image lena.bmp 
lena = imread('lena.bmp'); 
figure, imshow(lena); 
title('Original Image'); 
% b) Convert the image into gray-scale  
lena_gray = rgb2gray(lena); 
figure, imshow(lena_gray); 
title('Built-in rgb2gray Conversion'); 
% c) Write my own function my_rgb2gray to convert an RGB image to 
grayscale 
lena_custom_gray = my_rgb2gray(lena); 
figure, imshow(lena_custom_gray); 
title('Custom my_rgb2gray Conversion'); 
% d) Save the above gray-scale image to a file named lena_gray.jpg. 
imwrite(lena_custom_gray, 'lena_gray.jpg');
