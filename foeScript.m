% initial script with sample calls to the setupImageVelocities, 
% displayVelocities and computeObserverMotion functions (the statements
% related to ComputeObserverMotion are currently commented out)

% create a depth map with a central patch at depth 25.0 and surrounding
% surface at depth 50.0
zmap = 100*ones(200,200);
zmap(50:150,50:150) = 25.0;

% pure translation of the observer in the forward direction
[vx1 vy1 xfoe1 yfoe1] = setupImageVelocities(0.0,0.0,5.0,0.0,0.0,0.0,zmap);
displayVelocityField(vx1,vy1,10);
disp('Example 1: (Tx Ty Tz) = (0.0 0.0 5.0) and (Rx Ry Rz) = (0.0 0.0 0.0)');
disp(['             xfoe: ' num2str(xfoe1) '  yfoe: ' num2str(yfoe1)]);
disp(' ');

% translation of the observer forward and to the right
[vx2 vy2 xfoe2 yfoe2] = setupImageVelocities(4.0,0.0,2.0,0.0,0.0,0.0,zmap);
displayVelocityField(vx2,vy2,10);
disp('Example 2: (Tx Ty Tz) = (4.0 0.0 2.0) and (Rx Ry Rz) = (0.0 0.0 0.0)');
disp(['             xfoe: ' num2str(xfoe2) '  yfoe: ' num2str(yfoe2)]);
disp(' ');

% pure rotation of the observer around the y axis
[vx3 vy3 xfoe3 yfoe3] = setupImageVelocities(0.0,0.0,0.0,0.0,0.01,0.0,zmap);
displayVelocityField(vx3,vy3,10);
disp('Example 3: (Tx Ty Tz) = (0.0 0.0 0.0) and (Rx Ry Rz) = (0.0 0.01 0.0)');
disp(['             xfoe: ' num2str(xfoe3) '  yfoe: ' num2str(yfoe3)]);
disp('FOE is undefined, because there is no observer translation');
disp(' ');

% % compute heading for first example above:
[xhead1 yhead1] = computeObserverMotion(vx1,vy1);
disp(['Example 1: true FOE: (' num2str(xfoe1) ' ' num2str(yfoe1) ')']);
disp(['computed heading (FOE): (' num2str(xhead1) ' ' num2str(yhead1) ')']);
disp(' ');
% 
% % compute heading for second example above:
[xhead2 yhead2] = computeObserverMotion(vx2,vy2);
disp(['Example 2: true FOE: (' num2str(xfoe2) ' ' num2str(yfoe2) ')']);
disp(['computed heading (FOE): (' num2str(xhead2) ' ' num2str(yhead2) ')']);
disp(' ');

% note: heading is undefined for the third example above, because the
% observer is not translating

