function newImage = addCircle(image, xcenter, ycenter, radius, intensity)
r2 = radius^2;
for i = xcenter-radius:xcenter+radius
    for j = ycenter-radius:ycenter+radius
        if ((xcenter-i)^2 + (ycenter-j)^2) <= r2
            image(i,j) = intensity;
        end
    end
end
newImage = image;