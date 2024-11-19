function [wx] = skew(w)
% Ensure v is a 3-element vector
    if numel(w) ~= 3
        error('Input must be a 3-element vector');
    end
    wx = [   0   -w(3)  w(2);
           w(3)   0   -w(1);
          -w(2)  w(1)   0  ];
end