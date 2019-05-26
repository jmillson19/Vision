function [vx vy] = computeVelocity (px, py, vp, nsize, step, vlim)
[rows, cols] = size(px);
vx = zeros(rows,cols);
vy = zeros(rows,cols);

for x = 1+nsize:step:rows-nsize
    for y = 1+nsize:step:cols-nsize
        a1 = 0;
        a2 = 0;
        b1 = 0;
        b2 = 0;
        c1 = 0;
        c2 = 0;
        %grab patches of px, py, and vp for computation of
        %a1,a2,...,c2 values
        pxPatch = px(x-nsize:x+nsize, y-nsize:y+nsize);
        pyPatch = py(x-nsize:x+nsize, y-nsize:y+nsize);
        vpPatch = vp(x-nsize:x+nsize, y-nsize:y+nsize);
        a1 = sum(sum((pxPatch.^2)));
        b1 = sum(sum((pxPatch.*pyPatch)));
        a2 = b1;
        b2 = sum(sum((pyPatch.^2)));
        c1 = sum(sum((vpPatch.*pxPatch)));
        c2 = sum(sum((vpPatch.*pyPatch)));
        vxVal = (c1*b2 - b1*c2)/(a1*b2 - a2*b1);
        vyVal = (a1*c2 - a2*c1)/(a1*b2 - a2*b1);
        %Check if absolute value of these are within vlimit
        if(abs(vxVal) < vlim && abs(vyVal) < vlim)
            %set values of respective matrices
            vx(x,y) = vxVal;
            vy(x,y) = vyVal;
        end
    end
end