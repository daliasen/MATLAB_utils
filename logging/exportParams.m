function exportParams(structure, paramsExport)
% Save the structure as a JOSN file.
%
% Inputs: 
%   1) structure - A structure.
%   2) paramsExport - A structure containing the following parameters:
%       t - timestamp,
%       folder - output folder.

    t = paramsExport.t;
    folder = paramsExport.folder;

    fileName = ['params_', t, '.json'];
    fileID = fopen([folder filesep fileName], 'w');
    
    fprintf(fileID, '%s', jsonencode(structure));

    fclose(fileID);
end
