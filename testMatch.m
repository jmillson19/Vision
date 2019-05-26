% testMatch.m
% script for testing the motion measurement method based on finding
% the best matching patches between two images in a motion sequence

% load test images
im1 = imread('im1.jpg');
im2 = imread('im2.jpg');

% show the images as a movie
for i = 1:5
    imshow(im1);
    pause(0.5);
    imshow(im2);
    pause(0.5);
end

% create true velocity field for comparison
truevx = zeros(194,194);
truevy = zeros(194,194);
truevx(:,:) = -2;
truevy(:,:) = 2;
truevx(1:97,1:97) = -1;
truevx(98:194,98:194) = 3;
truevy(1:97,1:97) = -3;
truevy(98:194,98:194) = 1;

% % compute motion using motionMatch function
[vx vy] = motionMatch(im1,im2,10,3);
% 
% % display computed velocity field
imtool(vx, [-3 3])
imtool(vy, [-3 3])
figure
quiver(vx(end:-5:1,1:5:end),-vy(end:-5:1,1:5:end),0.8)
axis equal

% display true velocity field
figure
imtool(truevx, [-3 3])
imtool(truevy, [-3 3])
quiver(truevx(end:-5:1,1:5:end),-truevy(end:-5:1,1:5:end),0.8)
axis equal

