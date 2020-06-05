function exportParams(structure, paramsExport)

% Inputs: 
%   1) structure - a structure that contains either numeric/char/string 
%       values, structures or cell arrays of structures containing 
%       numeric/char/string values
%   2) paramsExport - a structure containing parameters for exporting files:
%       t - timestamp
%       folder - output folder
%
% Outputs:
%   A CSV file containing the fields and values of the struture (and 
%       fields and values of inner structures)

    t = paramsExport.t;
    folder = paramsExport.folder;

    fileName = ['params_', t, '.csv'];
    fileID = fopen([folder filesep fileName], 'w');
    
    % print headers
    fprintf(fileID, '%1s%1s', 'field name', ',');
    fprintf(fileID, '%1s%1s', 'value / field name', ',');
    fprintf(fileID, '%1s', 'value / N/A');
    fprintf(fileID, '%1s', char([13, 10])); % new line for Notepad

    fields = fieldnames(structure);
    for i=1:length(fields)
        field = structure.(fields{i});
        if isstruct(field)
          printStructure(field, fields{i}, fileID)
        elseif iscell(field) 
            for j=1:length(field)
                printStructure(field{j}, fields{i}, fileID)
            end
        else
            fprintf(fileID, '%1s%1s', fields{i}, ',');
            fprintf(fileID, '%1s', numStrChar2StrChar(structure.(fields{i})));
            fprintf(fileID, '%1s', char([13, 10])); % new line for Notepad
        end
    end
    
    fclose(fileID);
end

function printStructure(structure, structName, fileID)

% Input:
%   1) structure - a structure that contains numeric, char or string values
%   2) structName - the name of the above structure
%   3) fileID - a CSV file ID produced with fopen 
%
% Output:
%   Print structure field names and values into the specified CSV file

    fields = fieldnames(structure);
    for j=1:length(fields)
        fprintf(fileID, '%1s%1s', structName, ',');
        fprintf(fileID, '%1s%1s', fields{j}, ',');
        fprintf(fileID, '%1s', numStrChar2StrChar(structure.(fields{j})));
        fprintf(fileID, '%1s', char([13, 10])); % new line for Notepad
    end
end

function value = numStrChar2StrChar(value)

% Input:
%   1) value - a numeric, char or string value
%
% Output:
%   1) value - the input value converted to either char or string 

    if isnumeric(value) 
        value = num2str(value);
    elseif ~(isstring(value) || ischar(value))
        error(['type ' class(value) ' is not supported'])
    end
end
