function x_norm = normalizeAudio(x)

% Normalize each audio channel so they do not clip.
% 
% Inputs:
%   1) x - A 2D array where the shorter dimension corresponds to channels.
%
% Outputs:
%   1) x_norm - The input with each channel normalized to +-0.9999.

[rows, columns] = size(x);
x_norm = zeros(size(x));
if rows < columns % channels are rows
    R = rows;
    for r=1:R
        if max(abs(x(r,:))) > 0
            x_norm(r,:) = 0.9999*x(r,:)./max(abs(x(r,:)));
        end
    end
elseif columns < rows % channels are columns
    R = columns;
    for r=1:R
        if max(abs(x(:,r))) > 0
            x_norm(:,r) = 0.9999*x(:,r)./max(abs(x(:,r)));
        end
    end
else
    error('Cannot determine which dimension is channels.')
end




