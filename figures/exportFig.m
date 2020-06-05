function exportFig(h, filePath, fileTypes)
% Write the figure to a PDF, a JPEG, and/or a MATLAB figure file
%
% Inputs:
%   1) h - current figure handle, obtained as follows: 
%       h = gcf
%   2) filePath - the path to where the file should be written including 
%       the filename without an extension
%   3) fileTypes - a vector of shape [pdf jpeg fig], i.e. 1x3, that 
%       specifies which file types should be exported:
%           set 'pdf' to 1 to export PDF
%           set 'jpeg' to 1 to export JPEG
%           set 'fig' to 1 to export MATLAB fig
%
% Outputs:
%   PDF, JPEG, and/or MATLAB fig files as specified in fileTypes

if max(fileTypes) == 1
    set(h,'PaperOrientation','landscape');
    set(h, 'PaperUnits','centimeters');
    set(h, 'Units','centimeters');

    pos=get(h,'Position');

    set(h, 'PaperSize', [pos(3) pos(4)]);
    set(h, 'PaperPositionMode', 'manual');
    set(h, 'PaperPosition',[0 0 pos(3) pos(4)]);

    if fileTypes(1)==1
        print(h, '-dpdf', filePath, '-r600')
    end
    
    if fileTypes(2)==1
        print(h, '-djpeg', filePath, '-r600')
    end
    
    if fileTypes(3)==1
        saveas(h, filePath, 'fig')
    end
end