function [xhead yhead] = computeObserverMotion(vx, vy)
% [xhead yhead] = computeObserverMotion(vx,vy)
% implements a simple version of the algorithm proposed by Longuet-Higgins 
% and Prazdny to compute the observer's heading point, which indicates
% their direction of motion. vx and vy store the image velocity field
[xdim ydim] = size(vx);
scale = 0.05;
thresh = 0.02;
icenter = xdim/2;
jcenter = ydim/2;
a1 = 0.0;
b1 = 0.0;
c1 = 0.0;
b2 = 0.0;
c2 = 0.0;
for j = 2:ydim
    for i = 2:xdim
        % "use" will be set to 1 if the data at this point should be used
        % for computing the heading point
        use = 0;  
        % determine velocity differences in horizontal/vertical directions
        dx1 = vx(i,j)-vx(i-1,j);
        dy1 = vy(i,j)-vy(i-1,j);
        mag1 = sqrt(dx1^2 + dy1^2);
        dx2 = vx(i,j)-vx(i,j-1);
        dy2 = vy(i,j)-vy(i,j-1);
        mag2 = sqrt(dx2^2 + dy2^2);
        if (mag1 > mag2) && (mag1 > thresh)
            dVx = dx1;
            dVy = dy1;
            use = 1;
        end
        % if the larger velocity difference is greater than threshold, 
        % use this velocity difference in heading calculation
        if (mag2 > mag1) && (mag2 > thresh)
            dVx = dx2;
            dVy = dy2;
            use = 1;
        end
        if (use==1)
            % update information used to compute heading point
            if (abs(dVx) < 0.1)
                m = 10000.0;    % compute slope of line containing
            else                    % this velocity difference
                m = dVy/dVx;
            end
            c = (m*(i-icenter)*scale) - ((j-jcenter)*scale);
            mag = 1.0/(m^2+1);
            % update sums used to compute best intersection point 
            % of all lines through the velocity differences
            a1 = a1+(m*m*mag);
            b1 = b1+(-1.0*m*mag);
            c1 = c1+(m*c*mag);
            b2 = b2+mag;
            c2 = c2-(c*mag);
        end
    end
end     % compute final position of heading point
temp = (a1*b2)-(b1*b1);
if (temp ~= 0.0)
    xhead = (((c1*b2)-(b1*c2))/temp);
    yhead = (((a1*c2)-(b1*c1))/temp);
else
    xhead = 1000.0;
    yhead = 1000.0;
end       