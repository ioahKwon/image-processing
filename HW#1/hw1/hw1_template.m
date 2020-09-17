% read the PGM image into MATLAB
clear; close all;
x=imread('fl_orig.pgm');

% display the image
figure('Name','Original','NumberTitle','off'), imshow(x, []);

% convert image to double format
x=double(x);
whos x

% read the instruction of interp2
help interp2

% zero-order interpolation (replication)
y0=interp2(x,'nearest');

% display interpolated image
figure('Name','Nearest interpolation','NumberTitle','off'), imshow(y0,[]);

% check replication property
x(1:4,1:4)
y0(1:9,1:9)

% repeat the process for linear and cubic interpolation
% perform interpolation and show its property

% first-order interpolation (bilinear interpolation)
y1=interp2(x,'bilinear');
% display interpolated image
figure('Name','Bilinear interpolation','NumberTitle','off'), imshow(y1,[]);
% check bilinear property
x(1:4,1:4)
y1(1:9,1:9)

% bicubic interpolation
y2=interp2(x,'bicubic');
% display interpolated image
figure('Name','Bicubic interpolation','NumberTitle','off'), imshow(y2,[]);
% check cubic property
x(1:4,1:4)
y2(1:9,1:9)