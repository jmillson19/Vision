function showim (im)
% showim(im)
% displays input image, using minimum and maximum values
% as display range when calling inshow
minv = min(min(im));
maxv = max(max(im));
imshow(im, [minv maxv])
