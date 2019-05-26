

% creates a disparity map by matching patches from the input left image
% to possible patches in the input right image that are centered on the 
% same vertical position, but shifted horizontally over a range of 
% disparities from -range to +range. For each patch in the left image, 
% a matching patch in the right image is chosen that minimizes the sum 
% of the absolute differences in values over the patch
left = double(left);			% convert 8-bit images to double type
right = double(right);
[rows cols] = size(left);
dmap = zeros(rows,cols);       % disparity map
% loop through locations in the left image, ignoring image borders
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
        dmap(row,col) = bestD;  % store away the best disparity
    end
end
