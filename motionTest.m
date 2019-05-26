% motionTest.m
% script with two examples for testing the computeVelocity function

% Example 1: circle translating down and to the right

% these first 8 statements only need to be executed once
im1 = uint8(zeros(200,200));
im1 = addCircle(im1,100,100,50,100);
im2 = uint8(zeros(200,200));
im2 = addCircle(im2,101,101,50,100);
lap8 = laplacian(8.0);
c1 = conv2D(im1,lap8);
c2 = conv2D(im2,lap8);
[ux uy vp] = getMotionComps(c1,c2,3);

[vx vy] = computeVelocity(ux,uy,vp,50,20,3);
displayV(vx,vy);
axis equal

% Example 2: redsox images
%   true motion: upper left: motion down and to the right
%                lower left: motion up and to the left
%                upper right: motion to the right
%                lower right: motion to the left

% these first 5 statements only need to be executed once 
redsox1 = imread('redsox1.jpg');
redsox2 = imread('redsox2.jpg');
lap8 = laplacian(8.0);
c1 = conv2D(redsox1,lap8);
c2 = conv2D(redsox2,lap8);
[ux uy vp] = getMotionComps(c1,c2,3);

[vx vy] = computeVelocity(ux,uy,vp,30,20,3);
displayV(vx,vy);
axis equal