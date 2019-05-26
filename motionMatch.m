function [dmaph, dmapv] = motionMatch(left, right, nsize, range)
left = double(left);			% convert 8-bit images to double type
right = double(right);
[rows, cols] = size(left);
dmaph = zeros(rows,cols);       % Horizontal disparity map
dmapv = zeros(rows,cols);       % Vertical disparity map
for row = nsize+1:rows-nsize
    for col = range+nsize+1:cols-range-nsize
        % initialize the minimum difference found to be very large
        minDiff = 1000000000;    
        bestD = 0;       % stores the best disparity found so far
        patch = left(row-nsize:row+nsize,col-nsize:col+nsize); % get left patch
        for disp = -range:range
            val = sum(sum(abs(patch - right(row-nsize:row+nsize, ...
                                         col+disp-nsize:col+disp+nsize))));
            % if new patch is a close match, store the new match
            % quality and disparity
            if (val < minDiff)
                minDiff = val;
                bestD = disp;
            end
        end
        dmaph(row,col) = bestD;  % store away the best disparity
    end
end
for row = range + nsize+1:rows-range-nsize
    for col = nsize+1:cols-nsize
        % initialize the minimum difference found to be very large
        minDiff = 1000000000;    
        bestD = 0;       % stores the best disparity found so far
        patch = left(row-nsize:row+nsize,col-nsize:col+nsize); % get left patch
        for disp = -range:range
            val = sum(sum(abs(patch - right(row+disp-nsize:row+disp+nsize, ...
                                         col-nsize:col+nsize))));
            % if new patch is a close match, store the new match
            % quality and disparity
            if (val < minDiff)
                minDiff = val;
                bestD = disp;
            end
        end
        dmapv(row,col) = bestD;  % store away the best disparity
    end
end
end