function desired_lenght_audio = cutPadSeconds(signal, desired_length_seconds, fs)

% Pad or cut a 1D signal.
%
% Input:
%
% 1) signal - 1D array.
% 2) desired_length_seconds - Desired signal length in seconds.
% 3) fs - Sampling frequency.
%
% 1) output - The original signal padded with zeros to the end or the end
%       cropped to the specified length.

[rows, ~] = size(signal);
if rows == 1
    signal = signal';
end

desired_length_samples = round(desired_length_seconds * fs);

original_length_samples = length(signal);

if original_length_samples < desired_length_samples
    difference_samples = desired_length_samples - original_length_samples;
    desired_lenght_audio = vertcat(signal, zeros(difference_samples, 1));
elseif original_length_samples > desired_length_samples
    desired_lenght_audio = signal(1:desired_length_samples);
else
    desired_lenght_audio = signal;
end

% keep dimensions consistent with the input
if rows == 1
    desired_lenght_audio = desired_lenght_audio';
end