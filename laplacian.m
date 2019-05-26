function lap = laplacian(w)
% lap = laplacian(w)
% returns a 2D matrix of samples of a Laplacian-of-Gaussian function with 
% diameter w for the central positive region (w = 2*sqrt(2)*sigma). The 
% returned value is a 2D square matrix of size 4*w+1 and the x and y
% values range from -2*w to 2*w
sigma = w/(2*sqrt(2));
range = fix(2*w);
lap = zeros(2*range+1, 2*range+1);
s2 = 1.0/(sigma^2);
for x = -range:range
    for y = -range:range
        dist2 = x^2 + y^2;
        lap(x+range+1, y+range+1) = (2-s2*dist2)*exp(-0.5*dist2*s2);
    end
end
