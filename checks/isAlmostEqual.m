function almostEqual = isAlmostEqual(array_1, array_2, tolerance)

% Inputs:
%   1) array_1 - One of the arrays to be compared.
%   2) array_2 - The other array to be compared.
%   3) tolerance - The error has to be less than the tolerance for the
%       arrays to be considered almost equal.
%
% Outputs:
%   Returns 1 if the arrays are almost equal,
%           0 if not.

if ~isreal(array_1) || ~isreal(array_2)
    error('Expected real inputs.')
end

diff_abs = abs(array_1 - array_2);
if sum(sum(~(diff_abs < tolerance))) == 0
    almostEqual = 1;
else
    almostEqual = 0;
end

