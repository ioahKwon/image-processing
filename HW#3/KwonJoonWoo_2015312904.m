clear; close all;
load hw4.mat;

% display original and noisy images
figure('Name','Original'), imshow(p, []);
figure('Name','Noisy'), imshow(pn, []);

% apply 3x3 mean filter
h = 1/3*ones(3,1);
H = h*h';
p_mean = filter2(H,pn,'same');
figure('Name','3x3 mean filter'), imshow(p_mean, []);

p_mean = medfilt2(pn);
figure('Name','3x3 median filter'), imshow(p_mean, []);

% apply alpha trimmed medan filter 3x3 with d=2,4,6
p_trim = zeros(size(p));
% compute p_trim
m = 3;
n = 3;
% d=2
d = 2;
p_trim = alphatrim(pn,m,n,d);
figure('Name','alpha trimmed filter d=2'), imshow(p_trim, []);

% d=4
d = 4;
p_trim = alphatrim(pn,m,n,d);
figure('Name','alpha trimmed filter d=4'), imshow(p_trim, []);
        
% d=6
d = 6;
p_trim = alphatrim(pn,m,n,d);
figure('Name','alpha trimmed filter d=6'), imshow(p_trim, []);
                
% function alphatrim;
function f = alphatrim(p,m,n,d)
    p = im2double(p);
    f = imfilter(p,ones(m,n),'symmetric');
    for k = 1:d/2
        f = imsubtract(f,ordfilt2(p,k,ones(m,n),'symmetric'));
    end
    for k = (m*n - (d/2) +1):m*n
        f = imsubtract(f,ordfilt2(p,k,ones(m,n),'symmetric'));
    end
    f = f / (m*n-d);
end

        
        
        




