function displayV (Vx, Vy)
% displayV(Vx,Vy)
% displays the velocity field whose horizontal and vertical components
% are stored in the input matrices Vx and Vy

% velocity data is placed in vectors containing x and y coordinates,
% and x and y components of motion, to use with the quiver function
[rows cols] = size(Vx);
num = sum(sum((abs(Vx) > 0.0) | (abs(Vy) > 0.0)));  
xc = zeros(1,num);
yc = zeros(1,num);
velx = zeros(1,num);
vely = zeros(1,num);
index = 1;
for j = 1:cols
    for i = 1:rows
        if ((abs(Vx(i,j)) > 0.0) || (abs(Vy(i,j)) > 0.0))
            xc(index) = j;
            yc(index) = i;
            velx(index) = Vx(i,j);
            vely(index) = Vy(i,j);
            index = index+1;
        end
    end
end
% coordinates are adjusted so that x increases left to right,
% y increases top to bottom (opposite axis labels), Vx > 0 is
% motion to the right, and Vy > 0 is motion downwards
quiver(xc,cols-yc,velx,-1.0*vely);
