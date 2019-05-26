function conv = conv2D(image, operator)
% conv = conv2D(image, operator)
% convolves the input 2D image with an input 2D convolution operator that is
% assumed to be a square operator with an odd num of rows and columns. Returns 
% a 2D matrix of the same size as the input image, storing the convolution 
% result. No convolution values are computed for a border around the outer 
% edge of the image that is half the operator size
image = double(image);
sizeOp = fix(size(operator,1)/2);   
[xdim ydim] = size(image);
conv = zeros(xdim,ydim);
for x = sizeOp+1:xdim-sizeOp
    for y = sizeOp+1:ydim-sizeOp
        conv(x,y) = sum(sum(operator.*image(x-sizeOp:x+sizeOp, y-sizeOp:y+sizeOp)));
    end
end
