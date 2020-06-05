function newFig(dispFigs)
% Create a new figure
%
% Inputs:
%   1) dispFigs - a flag for displaying figures

if dispFigs == 1  % new figure
    figure();
elseif dispFigs == 0
    figure('visible', 'off'); 
else
    error('should be either 0 or 1')
end