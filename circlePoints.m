function [xc yc] = circlePoints (x, y, radius, n)
% [xc yc] = circlePoints(x,y,radius,n)
% returns the x and y coordinates of a set of n points evenly
% spaced around a circle of the input radius, centered at the
% location specified by the inputs x and y
angles = linspace(0,2*pi,n);
xc = x + radius*cos(angles);
yc = y + radius*sin(angles);
