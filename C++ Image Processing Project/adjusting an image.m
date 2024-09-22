% a) Add salt-and-pepper noise to the image with a noise density of 
0.05 
noise_density = 0.05; 
lena_noisy = imnoise(lena_gray, 'salt & pepper', noise_density); 
figure, imshow(lena_noisy), title('Noisy Image with Salt and Pepper 
Noise'); 
% b) Filter the noise using the function medfilt2 with the 3x3 window 
lena_filtered_3x3 = medfilt2(lena_noisy, [3 3]); 
figure, imshow(lena_filtered_3x3), title('Image with 3x3 Median 
Filter'); 
% c) Filter the noise with the 5x5 window 
lena_filtered_5x5 = medfilt2(lena_noisy, [5 5]); 
figure, imshow(lena_filtered_5x5), title('Image with 5x5 Median 
Filter');
