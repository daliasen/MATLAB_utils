function hasNanInf = containsNanInf(tensor)
% Check if a tensor contains any NaN or Inf values
%
% Inputs:
%   1) tensor - an n-dimensional array
%
% Outputs:
%   1) hasNanInf - a logical value, true if the tensor contains at least
%       one NaN and/or Inf value, false otherwise

numDimensions = ndims(tensor);
containsNan = isnan(tensor);
containsInf = isinf(tensor);

for i=1:numDimensions    
    containsNan = squeeze(any(containsNan));
    containsInf = squeeze(any(containsInf));
end

if containsNan || containsInf
    hasNanInf = true;
else
    hasNanInf = false;
end

