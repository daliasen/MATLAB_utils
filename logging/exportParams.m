function exportParams(structure, paramsExport, name)
% Save the structure as a JOSN file.
%
% Inputs: 
%   1) structure - A structure.
%   2) paramsExport - A structure containing the following parameters:
%       t - timestamp,
%       folder - output folder.
%   3) name - A name for the JSON file (no extension).

    t = paramsExport.t;
    folder = paramsExport.folder;

    fileName = [name '_', t, '.json'];
    fileID = fopen([folder filesep fileName], 'w');
    
    fprintf(fileID, '%s', jsonencode(structure));

    fclose(fileID);
end
