function [px py vp] = getMotionComps (c1, c2, vplim)
% [px py vp] = getMotionComps(c1,c2,vplim)
% c1 and c2 input matrices contain the convolutions of two images
% with a Laplacian-of-Gaussian function. At the location of each
% zero-crossing, coordinates of the unit vector in the direction
% of the gradient and the perpendicular component of motion are
% calculated and placed in the corresponding locations of the
% output matrices px, py and vp. vplim is expected limit on the
% magnitude of vp, in order to omit large errors in calculated vp
[rows cols] = size(c1);
px = zeros(rows, cols);
py = zeros(rows, cols);
vp = zeros(rows, cols);
for i = 2:rows
    for j = 2:cols
        val = c2(i,j);
        if ((c2(i,j)*c2(i-1,j) < 0) || (c2(i,j) * c1(i,j-1) < 0))
            % dx calculated between values in adjacent columns and
            % dy calculated between values in adjacent rows
            dx = val - c2(i,j-1); 
            dy = val - c2(i-1,j);
            dt = val - c1(i,j);
            mag = sqrt(dx^2 + dy^2);
            vpval = -dt/mag;
            % limit on vp gets rid of large errors
            if (abs(vpval) <= vplim)
                px(i,j) = dx/mag;
                py(i,j) = dy/mag;
                vp(i,j) = vpval;
            end
        end
    end
end
                