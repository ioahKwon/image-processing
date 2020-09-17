% read the PGM image into MATLAB
clear; close all;
name='zelda.pgm';
x=imread(name);
whos x

% display the image
figure('Name','The Original'), imshow(x,[]); % use >help imshow to find out the option '[]'
title("The Original Picture");

% apply thresholding at 128
% 128 is the half of 256 pixels so the thresholding value is 0.5
value = 128/256;
y= imbinarize(x,value);
figure('Name','Thresholding @ 128'), imshow(y,[])
title("Thresholding @ 128");

% Also, if you use graythresh function, you can easily
% find the thresholding value for the image.
t = graythresh(x);
z = imbinarize(x,t);
figure('Name','Thresholding using graythresh'), imshow(z,[]);
title("Thresholding using graythresh");

% negative as shown FIg 3.3 L = 256
y = 255 - x;
figure('Name','Negative Image : Method I design'), imshow(y,[]);
title("Negative Image : Method I design");

% or you can use imcomplement function
z = imcomplement(x);
figure('Name','Negative Image : imcomplement function'), imshow(z,[]);
title("Negative Image : imcomplement function");

% histogram equalization
help histeq
y= histeq(x);
figure('Name','Histogram equalization'), imshow(y,[]);
title("Histogram equalization");

% histogram matching
target_h = [1:128 128:-1:1];
figure, plot(target_h);
figure('Name','Histogram of target_h'), imhist(target_h/256);
y = imhistmatch(x,target_h/256);
figure('Name','Histogram Matching'), imshow(y,[]);
title("Histogram Matching");
figure('Name','Histogram of matching image'),imhist(y);

% unsharp masking Eq 3.6-8
help filter2
h_avg = ones(3,3)/9;
x_avg = uint8(filter2(h_avg,x,'same'));
figure('Name','3x3 Average Filter'), imshow(x_avg);
title('3x3 Average Filter')
gmask = x-x_avg;
figure('Name','Unsharp masking'), imshow(gmask,[]);
title('Unsharp masking');
new = x + gmask;
figure('Name','Final Image'), imshow(new,[]);
title('Final Image');