function displayVelocityField(vx,vy,step)
% displayVelocityField(vx,vy,step)
% displays velocity vectors at equally spaced points, separated by step
[xdim ydim] = size(vx);
num = (xdim/step+1)*(ydim/step+1);      % total number of points where
points = zeros(step,num);                   % velocity is displayed
index = 1;  
for j = 1:step:ydim                 % collect x,y,vx,vy for points where
    for i = 1:step:xdim                 % velocity is to be displayed
        points(1,index) = i;
        points(2,index) = j;
        points(3,index) = vx(i,j);
        points(4,index) = vy(i,j);
        index = index+1;
    end
end
figure, quiver(points(1,:), points(2,:), points(3,:), points(4,:));